Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE76A280F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:03:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQP-0002Su-Bo; Sat, 25 Feb 2023 04:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPv-00010a-9v
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:36 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPs-00058d-Nf
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:30 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so5248082pjh.0
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q9wHXNcMEZUrRMgfAcdIxce5Bu1q4nxsaHlTAC4B1OY=;
 b=r1Ai4P5h8P184IxmkSL2JtgxLVMkKhzmhUJXk4NI8fxVXI77RIHDraI3y7YJ8kXVke
 tJfVTLSG5r9rKCH9AHHQXcepnXE379DoFXLRf465uwxWHG8O99pwL8vL/Lkcr0ZmWRH0
 PzkwnH0Jqp6q2abd+yHIbei2M+K7rXKGN9EBNQlwrG84AYL8Us1QscLbwRfADVYPUe8i
 /z08r4VZdl+05qvIpS5hHwzvsWJb3i2m1yRSFzMNNEn+XcqgxCRkbWKFYqFCHJHdYWOA
 MFLTagim1RVmj2Yea6uHtdc1g5yj7jFsBJs6E16GWdEc19SFiMRdvYh6PtDYyeQJZeZb
 6W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q9wHXNcMEZUrRMgfAcdIxce5Bu1q4nxsaHlTAC4B1OY=;
 b=pHkTLNjURZQQxPF9WrBSStggUlaTe/jjYC1Gew8eAhxSJLpQ68btT8GCSU6GEEIQTt
 VNkHEIaFDskqBgZ+R6WDwgiz6KZb6UrbOlCI2X0tMWb1+G8qImhVgT4N6lqgxBRumUqg
 VDfNddcdRMykWZMO/0ddjfpcsqJsMGmKtCjCu5mDI60SuiiKlO1InvcVoVNOY4v68vyb
 W7N06hj+eekGF66GUX538DZ8OX9BPOprHQFagKpBhP0A2I6FQ3+7yLS03UAhnouiHLFl
 8UotV1AAIZNzWglBEZf+SyceIMec8Jc88xnWzAJA7TTGTgiWqKzvL0aaC98VEo1PAPHU
 0HTQ==
X-Gm-Message-State: AO0yUKWQFD+HPMfNxRpeySUvr8F9p2HRMq+iIoUXgv0lwPEZkxz0/ZKQ
 kT65P/FgZv9dLSTABETwsDLIrhYEdEIlayAC9pg=
X-Google-Smtp-Source: AK7set962fWXyBqPVuGcCHoWBNh53wLGS2CCns5SAXHh/32xzUX6UyI5LR0VI4vlb14vrRpAZ9iuuw==
X-Received: by 2002:a17:90a:1c8:b0:233:d870:f4c7 with SMTP id
 8-20020a17090a01c800b00233d870f4c7mr21468832pjd.21.1677315626056; 
 Sat, 25 Feb 2023 01:00:26 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 25/30] target/mips: Don't use tcg_temp_local_new
Date: Fri, 24 Feb 2023 22:59:40 -1000
Message-Id: <20230225085945.1798188-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since tcg_temp_new is now identical, use that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c              | 57 ++++++------------------
 target/mips/tcg/nanomips_translate.c.inc |  4 +-
 2 files changed, 16 insertions(+), 45 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index bd70fcad25..8cad3d15a0 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -2400,7 +2400,7 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
     switch (opc) {
     case OPC_ADDI:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2434,7 +2434,7 @@ static void gen_arith_imm(DisasContext *ctx, uint32_t opc,
 #if defined(TARGET_MIPS64)
     case OPC_DADDI:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2630,7 +2630,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
     switch (opc) {
     case OPC_ADD:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2666,7 +2666,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_SUB:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2707,7 +2707,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
 #if defined(TARGET_MIPS64)
     case OPC_DADD:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -2741,7 +2741,7 @@ static void gen_arith(DisasContext *ctx, uint32_t opc,
         break;
     case OPC_DSUB:
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv t1 = tcg_temp_new();
             TCGv t2 = tcg_temp_new();
             TCGLabel *l1 = gen_new_label();
@@ -3759,26 +3759,8 @@ static void gen_loongson_integer(DisasContext *ctx, uint32_t opc,
         return;
     }
 
-    switch (opc) {
-    case OPC_MULT_G_2E:
-    case OPC_MULT_G_2F:
-    case OPC_MULTU_G_2E:
-    case OPC_MULTU_G_2F:
-#if defined(TARGET_MIPS64)
-    case OPC_DMULT_G_2E:
-    case OPC_DMULT_G_2F:
-    case OPC_DMULTU_G_2E:
-    case OPC_DMULTU_G_2F:
-#endif
-        t0 = tcg_temp_new();
-        t1 = tcg_temp_new();
-        break;
-    default:
-        t0 = tcg_temp_local_new();
-        t1 = tcg_temp_local_new();
-        break;
-    }
-
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
     gen_load_gpr(t0, rs);
     gen_load_gpr(t1, rt);
 
@@ -3955,21 +3937,10 @@ static void gen_loongson_multimedia(DisasContext *ctx, int rd, int rs, int rt)
     TCGCond cond;
 
     opc = MASK_LMMI(ctx->opcode);
-    switch (opc) {
-    case OPC_ADD_CP2:
-    case OPC_SUB_CP2:
-    case OPC_DADD_CP2:
-    case OPC_DSUB_CP2:
-        t0 = tcg_temp_local_new_i64();
-        t1 = tcg_temp_local_new_i64();
-        break;
-    default:
-        t0 = tcg_temp_new_i64();
-        t1 = tcg_temp_new_i64();
-        break;
-    }
-
     check_cp1_enabled(ctx);
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
     gen_load_fpr64(ctx, t0, rs);
     gen_load_fpr64(ctx, t1, rt);
 
@@ -8650,7 +8621,7 @@ static void gen_mftr(CPUMIPSState *env, DisasContext *ctx, int rt, int rd,
                      int u, int sel, int h)
 {
     int other_tc = env->CP0_VPEControl & (0xff << CP0VPECo_TargTC);
-    TCGv t0 = tcg_temp_local_new();
+    TCGv t0 = tcg_temp_new();
 
     if ((env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) == 0 &&
         ((env->tcs[other_tc].CP0_TCBind & (0xf << CP0TCBd_CurVPE)) !=
@@ -8878,7 +8849,7 @@ static void gen_mttr(CPUMIPSState *env, DisasContext *ctx, int rd, int rt,
                      int u, int sel, int h)
 {
     int other_tc = env->CP0_VPEControl & (0xff << CP0VPECo_TargTC);
-    TCGv t0 = tcg_temp_local_new();
+    TCGv t0 = tcg_temp_new();
 
     gen_load_gpr(t0, rt);
     if ((env->CP0_VPEConf0 & (1 << CP0VPEC0_MVP)) == 0 &&
@@ -11409,7 +11380,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
     case OPC_ALNV_PS:
         check_ps(ctx);
         {
-            TCGv t0 = tcg_temp_local_new();
+            TCGv t0 = tcg_temp_new();
             TCGv_i32 fp = tcg_temp_new_i32();
             TCGv_i32 fph = tcg_temp_new_i32();
             TCGLabel *l1 = gen_new_label();
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 812c111e3c..faf6d679bd 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -1017,8 +1017,8 @@ static void gen_llwp(DisasContext *ctx, uint32_t base, int16_t offset,
 static void gen_scwp(DisasContext *ctx, uint32_t base, int16_t offset,
                     uint32_t reg1, uint32_t reg2, bool eva)
 {
-    TCGv taddr = tcg_temp_local_new();
-    TCGv lladdr = tcg_temp_local_new();
+    TCGv taddr = tcg_temp_new();
+    TCGv lladdr = tcg_temp_new();
     TCGv_i64 tval = tcg_temp_new_i64();
     TCGv_i64 llval = tcg_temp_new_i64();
     TCGv_i64 val = tcg_temp_new_i64();
-- 
2.34.1


