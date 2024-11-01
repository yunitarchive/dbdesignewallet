CREATE TABLE "users" (
  "user_id" integer PRIMARY KEY,
  "username" varchar,
  "email" varchar,
  "password" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "wallets" (
  "wallet_id" integer PRIMARY KEY,
  "user_id" integer,
  "wallet_name" varchar,
  "total_balance" decimal,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "goals" (
  "goal_id" integer PRIMARY KEY,
  "user_id" integer,
  "wallet_id" integer,
  "goal_name" varchar,
  "target_amount" decimal,
  "current_amount" decimal,
  "deadline" timestamp,
  "progress" decimal,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "payment_methods" (
  "payment_method_id" integer PRIMARY KEY,
  "user_id" integer,
  "method_name" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "transactions" (
  "transaction_id" integer PRIMARY KEY,
  "wallet_id" integer,
  "amount" decimal,
  "transaction_date" timestamp,
  "transaction_type" varchar,
  "description" text,
  "created_at" timestamp,
  "updated_at" timestamp
);

ALTER TABLE "wallets" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "goals" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "goals" ADD FOREIGN KEY ("wallet_id") REFERENCES "wallets" ("wallet_id");

ALTER TABLE "payment_methods" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("wallet_id") REFERENCES "wallets" ("wallet_id");
