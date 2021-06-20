Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC23AE0C7
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:53:57 +0200 (CEST)
Received: from localhost ([::1]:39700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5O8-0000t3-NQ
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5Km-0005Go-Jb
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:50:28 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:46903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5Kk-0002FO-1m
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:50:28 -0400
Received: by mail-pg1-x535.google.com with SMTP id n12so3800654pgs.13
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rdx+vNgmwrn+uNEt8j9Ac8DXUSdgEvkCxbSAocLdAWU=;
 b=YKdUfShaK1AhV33WmSuAv66KFkr7cDISscgParTNXy0tS26UgNUggDVc+drud63YqI
 Wby5Ey+P6d7ZBZBrowdIYS6IeFFqvJLXAd+pv2u/xJkxSCi3idx4YTUlgKPprsHiFoWm
 tMHUIzcPRKQYLROapi5EFI67ltYoKOu0WDW1bF+DmSvy6jqXULzDsQAmj2pE6tLvbJsy
 7y4nVslQT/f7vjVU31ShZcpwSzVKlKLL4xQhgT2voP0hGelgV+KvacltUSqG60RJ/VAg
 /jutyUczhrIU5g5JWSboaQF9OyeAR4kWJ9tHjq81MB5kss08VyEHwO/ojyhS3hZppuSm
 E5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rdx+vNgmwrn+uNEt8j9Ac8DXUSdgEvkCxbSAocLdAWU=;
 b=C1K9G+yx7aquRPSkuwODyzdTO1RXGEoyCVYKrzOJ99BNfvZNYBHZDc0zgQhpwmcYmM
 MH1R6tQkxUGwM/x4GAlCEwb68OGsD9q2+mP+zFJJxCh0RX3KED3gMJfhIL9DQbUoBLQ9
 DMF971GTi9S+VNG5zUurGNLpSC4AbgmhvR1julbOYDLR86XUeesMU9jrWTdqT5tMN8ta
 rzPKG8jfE9r0gZ5yNar96Kh7bPV/ApH5pJ1HKewW/y/hyibfW0T1fsYWMY4RRV82+gCo
 wPOGCuOUnE4HER2WlDFu8zJcGyaFEnTwFc7ZzOIjlqvCOQCT7IGzhctLTpNuhnA8zQWZ
 Frfg==
X-Gm-Message-State: AOAM533B0khxMF9fHPhE8oaFAZktN5h+ssvYsYRHpfXKqKIA2n+JdqHd
 1ZHW0zBzmo90zok0GrDSwCR4yPIo6kIakA==
X-Google-Smtp-Source: ABdhPJywOqPEkUrUcVXoY1N1zvrpMgpuQd6tQia0UjuxBG1lYstESCzbOQ89vElRqM1Qel9X7qsk3A==
X-Received: by 2002:a05:6a00:1825:b029:2ed:7930:cdad with SMTP id
 y37-20020a056a001825b02902ed7930cdadmr16480940pfa.18.1624225824856; 
 Sun, 20 Jun 2021 14:50:24 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 76sm13212625pfy.82.2021.06.20.14.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:50:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] target/avr: Change ctx to DisasContext* in
 gen_intermediate_code
Date: Sun, 20 Jun 2021 14:50:21 -0700
Message-Id: <20210620215022.1510617-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620215022.1510617-1-richard.henderson@linaro.org>
References: <20210620215022.1510617-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

Prepare for receiving it as a pointer input.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 84 +++++++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 41 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 20c5062730..66e9882422 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -104,7 +104,7 @@ struct DisasContext {
      * used in the following manner (sketch)
      *
      * TCGLabel *skip_label = NULL;
-     * if (ctx.skip_cond != TCG_COND_NEVER) {
+     * if (ctx->skip_cond != TCG_COND_NEVER) {
      *     skip_label = gen_new_label();
      *     tcg_gen_brcond_tl(skip_cond, skip_var0, skip_var1, skip_label);
      * }
@@ -114,7 +114,7 @@ struct DisasContext {
      *     free_skip_var0 = false;
      * }
      *
-     * translate(&ctx);
+     * translate(ctx);
      *
      * if (skip_label) {
      *     gen_set_label(skip_label);
@@ -2900,7 +2900,7 @@ static bool canonicalize_skip(DisasContext *ctx)
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 {
     CPUAVRState *env = cs->env_ptr;
-    DisasContext ctx = {
+    DisasContext ctx1 = {
         .base.tb = tb,
         .base.is_jmp = DISAS_NEXT,
         .base.pc_first = tb->pc,
@@ -2911,6 +2911,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
         .memidx = 0,
         .skip_cond = TCG_COND_NEVER,
     };
+    DisasContext *ctx = &ctx1;
     target_ulong pc_start = tb->pc / 2;
     int num_insns = 0;
 
@@ -2921,23 +2922,23 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
          */
         max_insns = 1;
     }
-    if (ctx.base.singlestep_enabled) {
+    if (ctx->base.singlestep_enabled) {
         max_insns = 1;
     }
 
     gen_tb_start(tb);
 
-    ctx.npc = pc_start;
+    ctx->npc = pc_start;
     if (tb->flags & TB_FLAGS_SKIP) {
-        ctx.skip_cond = TCG_COND_ALWAYS;
-        ctx.skip_var0 = cpu_skip;
+        ctx->skip_cond = TCG_COND_ALWAYS;
+        ctx->skip_var0 = cpu_skip;
     }
 
     do {
         TCGLabel *skip_label = NULL;
 
         /* translate current instruction */
-        tcg_gen_insn_start(ctx.npc);
+        tcg_gen_insn_start(ctx->npc);
         num_insns++;
 
         /*
@@ -2946,65 +2947,66 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
          * b main   - sets breakpoint at address 0x00000100 (code)
          * b *0x100 - sets breakpoint at address 0x00800100 (data)
          */
-        if (unlikely(!ctx.base.singlestep_enabled &&
-                (cpu_breakpoint_test(cs, OFFSET_CODE + ctx.npc * 2, BP_ANY) ||
-                 cpu_breakpoint_test(cs, OFFSET_DATA + ctx.npc * 2, BP_ANY)))) {
-            canonicalize_skip(&ctx);
-            tcg_gen_movi_tl(cpu_pc, ctx.npc);
+        if (unlikely(!ctx->base.singlestep_enabled &&
+            (cpu_breakpoint_test(cs, OFFSET_CODE + ctx->npc * 2, BP_ANY) ||
+             cpu_breakpoint_test(cs, OFFSET_DATA + ctx->npc * 2, BP_ANY)))) {
+            canonicalize_skip(ctx);
+            tcg_gen_movi_tl(cpu_pc, ctx->npc);
             gen_helper_debug(cpu_env);
             goto done_generating;
         }
 
         /* Conditionally skip the next instruction, if indicated.  */
-        if (ctx.skip_cond != TCG_COND_NEVER) {
+        if (ctx->skip_cond != TCG_COND_NEVER) {
             skip_label = gen_new_label();
-            if (ctx.skip_var0 == cpu_skip) {
+            if (ctx->skip_var0 == cpu_skip) {
                 /*
                  * Copy cpu_skip so that we may zero it before the branch.
                  * This ensures that cpu_skip is non-zero after the label
                  * if and only if the skipped insn itself sets a skip.
                  */
-                ctx.free_skip_var0 = true;
-                ctx.skip_var0 = tcg_temp_new();
-                tcg_gen_mov_tl(ctx.skip_var0, cpu_skip);
+                ctx->free_skip_var0 = true;
+                ctx->skip_var0 = tcg_temp_new();
+                tcg_gen_mov_tl(ctx->skip_var0, cpu_skip);
                 tcg_gen_movi_tl(cpu_skip, 0);
             }
-            if (ctx.skip_var1 == NULL) {
-                tcg_gen_brcondi_tl(ctx.skip_cond, ctx.skip_var0, 0, skip_label);
+            if (ctx->skip_var1 == NULL) {
+                tcg_gen_brcondi_tl(ctx->skip_cond, ctx->skip_var0,
+                                   0, skip_label);
             } else {
-                tcg_gen_brcond_tl(ctx.skip_cond, ctx.skip_var0,
-                                  ctx.skip_var1, skip_label);
-                ctx.skip_var1 = NULL;
+                tcg_gen_brcond_tl(ctx->skip_cond, ctx->skip_var0,
+                                  ctx->skip_var1, skip_label);
+                ctx->skip_var1 = NULL;
             }
-            if (ctx.free_skip_var0) {
-                tcg_temp_free(ctx.skip_var0);
-                ctx.free_skip_var0 = false;
+            if (ctx->free_skip_var0) {
+                tcg_temp_free(ctx->skip_var0);
+                ctx->free_skip_var0 = false;
             }
-            ctx.skip_cond = TCG_COND_NEVER;
-            ctx.skip_var0 = NULL;
+            ctx->skip_cond = TCG_COND_NEVER;
+            ctx->skip_var0 = NULL;
         }
 
-        translate(&ctx);
+        translate(ctx);
 
         if (skip_label) {
-            canonicalize_skip(&ctx);
+            canonicalize_skip(ctx);
             gen_set_label(skip_label);
-            if (ctx.base.is_jmp == DISAS_NORETURN) {
-                ctx.base.is_jmp = DISAS_CHAIN;
+            if (ctx->base.is_jmp == DISAS_NORETURN) {
+                ctx->base.is_jmp = DISAS_CHAIN;
             }
         }
-    } while (ctx.base.is_jmp == DISAS_NEXT
+    } while (ctx->base.is_jmp == DISAS_NEXT
              && num_insns < max_insns
-             && (ctx.npc - pc_start) * 2 < TARGET_PAGE_SIZE - 4
+             && (ctx->npc - pc_start) * 2 < TARGET_PAGE_SIZE - 4
              && !tcg_op_buf_full());
 
     if (tb->cflags & CF_LAST_IO) {
         gen_io_end();
     }
 
-    bool nonconst_skip = canonicalize_skip(&ctx);
+    bool nonconst_skip = canonicalize_skip(ctx);
 
-    switch (ctx.base.is_jmp) {
+    switch (ctx->base.is_jmp) {
     case DISAS_NORETURN:
         assert(!nonconst_skip);
         break;
@@ -3013,19 +3015,19 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     case DISAS_CHAIN:
         if (!nonconst_skip) {
             /* Note gen_goto_tb checks singlestep.  */
-            gen_goto_tb(&ctx, 1, ctx.npc);
+            gen_goto_tb(ctx, 1, ctx->npc);
             break;
         }
-        tcg_gen_movi_tl(cpu_pc, ctx.npc);
+        tcg_gen_movi_tl(cpu_pc, ctx->npc);
         /* fall through */
     case DISAS_LOOKUP:
-        if (!ctx.base.singlestep_enabled) {
+        if (!ctx->base.singlestep_enabled) {
             tcg_gen_lookup_and_goto_ptr();
             break;
         }
         /* fall through */
     case DISAS_EXIT:
-        if (ctx.base.singlestep_enabled) {
+        if (ctx->base.singlestep_enabled) {
             gen_helper_debug(cpu_env);
         } else {
             tcg_gen_exit_tb(NULL, 0);
@@ -3038,7 +3040,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 done_generating:
     gen_tb_end(tb, num_insns);
 
-    tb->size = (ctx.npc - pc_start) * 2;
+    tb->size = (ctx->npc - pc_start) * 2;
     tb->icount = num_insns;
 
 #ifdef DEBUG_DISAS
-- 
2.25.1


