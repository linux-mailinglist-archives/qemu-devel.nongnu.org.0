Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECD13B78C4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:37:54 +0200 (CEST)
Received: from localhost ([::1]:47900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJYP-00020n-89
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItI-0008KF-GK
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:24 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0000se-2w
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso3084051pjp.2
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7wduf7ObXc5wNVXm/AWx0SqQEc5dTrFADWEA55vQ1o=;
 b=krT47MhqZXLs0OqCYA2T7hkInbAmvRok5H/TxKdLa5DG77Zrh8y6+RzFinCKF+nWUy
 NaL/2dYhb+B7rtIzWcJo45xanLmxh3/s1Gm6TBcidC2/YNSQXAO1Khw70HkPZQyW8mja
 eMPKjTzAAdjnd9FyndK5YnPZK1kT8iIOmN/wqcnLgNc5UEVVE7iigYEvDJIeSx5mSXk9
 w8NEZU7YLraw5uL/eBj7/5QgDuuEaUIT3jBAudBzz5Yt+fCCazXPvWiwM3FwPTWBnK3Q
 7W3bpcXBj5nKnOu4mv6H1FW6Ex1osm8qE52vGmo3+iUViWcbXxM6Tmle+ZUqcgHVJZFq
 epDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7wduf7ObXc5wNVXm/AWx0SqQEc5dTrFADWEA55vQ1o=;
 b=n44b/cvl+AjO7Dq7oCV0+HleSHWeCut3BgrX/e2CeIVAyMYwVTn8cezDA5OG9VoCdF
 kqSorncqAF4/5Ge9kYSuBLVUT/QYxEB2OoOE22heiu/+zk84JOSRGcfFo+4Wnkujsh/3
 L5lXgu0HSMlHxs1LhH9GUf8jHL/2aOpbcE/sKfI0NL099JH8hSU0J2Z61+evrc2A/7JP
 e341u12QElW7oxo2eeJHqLtVd10pYWsHy+/cm9mx8lrlfYKRx4Qmcl6ipeHXprUghFNo
 oQNvqhKObxUh9dCm/UBXCMxX4fXzXihtBfe/atd4ZS+7jky5OG1frZhL51k4dC/GAXrk
 oDpw==
X-Gm-Message-State: AOAM533JKhe+ELfThkfcMmClMOL5ql7NR6GSzC4jDNrRzM5i9KglMn1W
 X8s1LFFzpWhX8kUYL0x8LHwUyZ9NDNBMyg==
X-Google-Smtp-Source: ABdhPJxS0KUedYYC5DDOvBel5k5UeUo1AuyzXM4z1y2haTv710nXDt+3/Hc5PWG7F9jYovUuMiggzQ==
X-Received: by 2002:a17:90b:1509:: with SMTP id
 le9mr295313pjb.35.1624992901895; 
 Tue, 29 Jun 2021 11:55:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/63] target/avr: Add DisasContextBase to DisasContext
Date: Tue, 29 Jun 2021 11:54:02 -0700
Message-Id: <20210629185455.3131172-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migrate the bstate, tb and singlestep_enabled fields
from DisasContext into the base.

Tested-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 58 +++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 850c5941d9..20c5062730 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -80,7 +80,7 @@ typedef struct DisasContext DisasContext;
 
 /* This is the state at translation time. */
 struct DisasContext {
-    TranslationBlock *tb;
+    DisasContextBase base;
 
     CPUAVRState *env;
     CPUState *cs;
@@ -90,8 +90,6 @@ struct DisasContext {
 
     /* Routine used to access memory */
     int memidx;
-    int bstate;
-    int singlestep;
 
     /*
      * some AVR instructions can make the following instruction to be skipped
@@ -191,7 +189,7 @@ static bool avr_have_feature(DisasContext *ctx, int feature)
 {
     if (!avr_feature(ctx->env, feature)) {
         gen_helper_unsupported(cpu_env);
-        ctx->bstate = DISAS_NORETURN;
+        ctx->base.is_jmp = DISAS_NORETURN;
         return false;
     }
     return true;
@@ -1011,13 +1009,13 @@ static void gen_jmp_ez(DisasContext *ctx)
 {
     tcg_gen_deposit_tl(cpu_pc, cpu_r[30], cpu_r[31], 8, 8);
     tcg_gen_or_tl(cpu_pc, cpu_pc, cpu_eind);
-    ctx->bstate = DISAS_LOOKUP;
+    ctx->base.is_jmp = DISAS_LOOKUP;
 }
 
 static void gen_jmp_z(DisasContext *ctx)
 {
     tcg_gen_deposit_tl(cpu_pc, cpu_r[30], cpu_r[31], 8, 8);
-    ctx->bstate = DISAS_LOOKUP;
+    ctx->base.is_jmp = DISAS_LOOKUP;
 }
 
 static void gen_push_ret(DisasContext *ctx, int ret)
@@ -1083,9 +1081,9 @@ static void gen_pop_ret(DisasContext *ctx, TCGv ret)
 
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    TranslationBlock *tb = ctx->tb;
+    const TranslationBlock *tb = ctx->base.tb;
 
-    if (ctx->singlestep == 0) {
+    if (!ctx->base.singlestep_enabled) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(tb, n);
@@ -1094,7 +1092,7 @@ static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
         gen_helper_debug(cpu_env);
         tcg_gen_exit_tb(NULL, 0);
     }
-    ctx->bstate = DISAS_NORETURN;
+    ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 /*
@@ -1254,7 +1252,7 @@ static bool trans_RET(DisasContext *ctx, arg_RET *a)
 {
     gen_pop_ret(ctx, cpu_pc);
 
-    ctx->bstate = DISAS_LOOKUP;
+    ctx->base.is_jmp = DISAS_LOOKUP;
     return true;
 }
 
@@ -1272,7 +1270,7 @@ static bool trans_RETI(DisasContext *ctx, arg_RETI *a)
     tcg_gen_movi_tl(cpu_If, 1);
 
     /* Need to return to main loop to re-evaluate interrupts.  */
-    ctx->bstate = DISAS_EXIT;
+    ctx->base.is_jmp = DISAS_EXIT;
     return true;
 }
 
@@ -1484,7 +1482,7 @@ static bool trans_BRBC(DisasContext *ctx, arg_BRBC *a)
     gen_goto_tb(ctx, 0, ctx->npc + a->imm);
     gen_set_label(not_taken);
 
-    ctx->bstate = DISAS_CHAIN;
+    ctx->base.is_jmp = DISAS_CHAIN;
     return true;
 }
 
@@ -1533,7 +1531,7 @@ static bool trans_BRBS(DisasContext *ctx, arg_BRBS *a)
     gen_goto_tb(ctx, 0, ctx->npc + a->imm);
     gen_set_label(not_taken);
 
-    ctx->bstate = DISAS_CHAIN;
+    ctx->base.is_jmp = DISAS_CHAIN;
     return true;
 }
 
@@ -1610,7 +1608,7 @@ static TCGv gen_get_zaddr(void)
  */
 static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
 {
-    if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
+    if (ctx->base.tb->flags & TB_FLAGS_FULL_ACCESS) {
         gen_helper_fullwr(cpu_env, data, addr);
     } else {
         tcg_gen_qemu_st8(data, addr, MMU_DATA_IDX); /* mem[addr] = data */
@@ -1619,7 +1617,7 @@ static void gen_data_store(DisasContext *ctx, TCGv data, TCGv addr)
 
 static void gen_data_load(DisasContext *ctx, TCGv data, TCGv addr)
 {
-    if (ctx->tb->flags & TB_FLAGS_FULL_ACCESS) {
+    if (ctx->base.tb->flags & TB_FLAGS_FULL_ACCESS) {
         gen_helper_fullrd(data, cpu_env, addr);
     } else {
         tcg_gen_qemu_ld8u(data, addr, MMU_DATA_IDX); /* data = mem[addr] */
@@ -2793,7 +2791,7 @@ static bool trans_BREAK(DisasContext *ctx, arg_BREAK *a)
 #ifdef BREAKPOINT_ON_BREAK
     tcg_gen_movi_tl(cpu_pc, ctx->npc - 1);
     gen_helper_debug(cpu_env);
-    ctx->bstate = DISAS_EXIT;
+    ctx->base.is_jmp = DISAS_EXIT;
 #else
     /* NOP */
 #endif
@@ -2819,7 +2817,7 @@ static bool trans_NOP(DisasContext *ctx, arg_NOP *a)
 static bool trans_SLEEP(DisasContext *ctx, arg_SLEEP *a)
 {
     gen_helper_sleep(cpu_env);
-    ctx->bstate = DISAS_NORETURN;
+    ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
 
@@ -2850,7 +2848,7 @@ static void translate(DisasContext *ctx)
 
     if (!decode_insn(ctx, opcode)) {
         gen_helper_unsupported(cpu_env);
-        ctx->bstate = DISAS_NORETURN;
+        ctx->base.is_jmp = DISAS_NORETURN;
     }
 }
 
@@ -2903,13 +2901,15 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 {
     CPUAVRState *env = cs->env_ptr;
     DisasContext ctx = {
-        .tb = tb,
+        .base.tb = tb,
+        .base.is_jmp = DISAS_NEXT,
+        .base.pc_first = tb->pc,
+        .base.pc_next = tb->pc,
+        .base.singlestep_enabled = cs->singlestep_enabled,
         .cs = cs,
         .env = env,
         .memidx = 0,
-        .bstate = DISAS_NEXT,
         .skip_cond = TCG_COND_NEVER,
-        .singlestep = cs->singlestep_enabled,
     };
     target_ulong pc_start = tb->pc / 2;
     int num_insns = 0;
@@ -2921,7 +2921,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
          */
         max_insns = 1;
     }
-    if (ctx.singlestep) {
+    if (ctx.base.singlestep_enabled) {
         max_insns = 1;
     }
 
@@ -2946,7 +2946,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
          * b main   - sets breakpoint at address 0x00000100 (code)
          * b *0x100 - sets breakpoint at address 0x00800100 (data)
          */
-        if (unlikely(!ctx.singlestep &&
+        if (unlikely(!ctx.base.singlestep_enabled &&
                 (cpu_breakpoint_test(cs, OFFSET_CODE + ctx.npc * 2, BP_ANY) ||
                  cpu_breakpoint_test(cs, OFFSET_DATA + ctx.npc * 2, BP_ANY)))) {
             canonicalize_skip(&ctx);
@@ -2989,11 +2989,11 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
         if (skip_label) {
             canonicalize_skip(&ctx);
             gen_set_label(skip_label);
-            if (ctx.bstate == DISAS_NORETURN) {
-                ctx.bstate = DISAS_CHAIN;
+            if (ctx.base.is_jmp == DISAS_NORETURN) {
+                ctx.base.is_jmp = DISAS_CHAIN;
             }
         }
-    } while (ctx.bstate == DISAS_NEXT
+    } while (ctx.base.is_jmp == DISAS_NEXT
              && num_insns < max_insns
              && (ctx.npc - pc_start) * 2 < TARGET_PAGE_SIZE - 4
              && !tcg_op_buf_full());
@@ -3004,7 +3004,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 
     bool nonconst_skip = canonicalize_skip(&ctx);
 
-    switch (ctx.bstate) {
+    switch (ctx.base.is_jmp) {
     case DISAS_NORETURN:
         assert(!nonconst_skip);
         break;
@@ -3019,13 +3019,13 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
         tcg_gen_movi_tl(cpu_pc, ctx.npc);
         /* fall through */
     case DISAS_LOOKUP:
-        if (!ctx.singlestep) {
+        if (!ctx.base.singlestep_enabled) {
             tcg_gen_lookup_and_goto_ptr();
             break;
         }
         /* fall through */
     case DISAS_EXIT:
-        if (ctx.singlestep) {
+        if (ctx.base.singlestep_enabled) {
             gen_helper_debug(cpu_env);
         } else {
             tcg_gen_exit_tb(NULL, 0);
-- 
2.25.1


