Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B03B3ADD55
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 08:21:39 +0200 (CEST)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luqpt-0002pp-JL
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 02:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luqoY-0000e1-W9
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 02:20:15 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:40766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luqoU-0002HM-I1
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 02:20:14 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so10191104pjb.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 23:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WC4ZZt46aoWhKlwhfKzGhMWDEJXJ1wMQw+caZWV+JNY=;
 b=MxhPgFM8pGjtSW93ixK11pLgnXHAiXegOok8g20xrTyOdYwTCrxhmb+P5qb34FJe+y
 74iglr/fQ3OUBWfaCV9v5KEmSdEUSoenoo5crFcx8K7gX5XrwDwRy8HHSAvANCS7aO9C
 13n1cSq3bEFyo4guttzCczvHs2ok9ELfyus4wAEmXvutjZQzi/p437wj6lo+0RaSFoSc
 rZtyVafB9jjoy6V/AcEyLslRXLpXdNJor9wCeLbrX2F9SkkjqbWyuTpUw3UvayYAmboP
 zt1E8c/l3GH+r0uaVTjngQXOEqCvWckofoTrxejJPXggJkjQoKqeOdi7umwPCDAAM/zJ
 WPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WC4ZZt46aoWhKlwhfKzGhMWDEJXJ1wMQw+caZWV+JNY=;
 b=rhHAS2qyqmcaH1ByktlpFYNMbklPX1ot/ChSaBNL4Npgev8grwLiGkBKOwRvQv78iX
 biNOFf67sn6IjwIANfMiKK9suu0HtaHmRUEY/7XJZFJmqVtkoa+gNHkeGUjLeQZmuKB1
 X6WKNo9Zr3OKpCk1h+Kg5/HUKMlaBJ1UHU1HoyaI8dM572OhWL1LgpxEkdq3E2cozRIz
 DY6bY5pxK2gY233v2BJCgUoMHVIig3oYoaa50sM80qK+1FKCb5waYFkx2O9LqWqkIo1S
 +9CC8QyAQDI+1bXdKAsXvFFnOk/VY5UX9QeYYHtr2xwIJYfEDrMJWc15gdBfwI3mfGzn
 ZrLQ==
X-Gm-Message-State: AOAM533wFYDonzXsM+5uT7vo4FMO6LSi6fZRdltRJIblVq0VN0Ztnqu2
 pAJfm26rkYPlkddnoQXA/QZkXP9m43u5Bg==
X-Google-Smtp-Source: ABdhPJxp2v2dhCBuM5vAhizbyo8oGt6muCzyI2IAFhg59ttYJT5pr5W73kBroAJgbdC2YqmPhQP0qg==
X-Received: by 2002:a17:903:228e:b029:101:af04:4e24 with SMTP id
 b14-20020a170903228eb0290101af044e24mr12218865plh.3.1624170009336; 
 Sat, 19 Jun 2021 23:20:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s123sm11607661pfb.78.2021.06.19.23.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 23:20:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/avr: Add DisasContextBase to DisasContext
Date: Sat, 19 Jun 2021 23:20:05 -0700
Message-Id: <20210620062007.1398574-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620062007.1398574-1-richard.henderson@linaro.org>
References: <20210620062007.1398574-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: mrolnik@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migrate the bstate, tb and singlestep_enabled fields
from DisasContext into the base.

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


