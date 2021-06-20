Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B71C3AE0C9
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:54:59 +0200 (CEST)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5P8-0002S2-4e
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5Km-0005HG-TI
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:50:28 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5Kk-0002Fn-NK
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:50:28 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so11382904pjs.2
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TKmtNmmKpGj/zT2i7MvvQJ4HlLkqMqkKlvkQ/2kDjNY=;
 b=LnAz8xVxcKoGdogCQFH936dpZdHWyLdqTu+tjXDnZvu72jMbnIrDJLxdU5kQzoULVD
 QW7wzxGVx/c2IprX/zSFhCSnNsPR4TzoedExuo6d+4uRQ6Wd6n283W266EabeeJ3eNZf
 7Im4jproasIp1AnYi0Q3wz815gqhdPcn5yMMQHwNnq/sPl/FR1Ew3iPVGlKBT6Bpjye9
 aKZl7MlydvmGjXtd/DP5G/n+G/QAOJzTXwf+asprjaZScdB05FigXNEF2C2whfP4tGsm
 Rm1mrye+2S68thiA+3hKi8HAdk4qf/UUuqJzeqiekTcVJWfWBkZQGPZ90KD2QVgRffwH
 r2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TKmtNmmKpGj/zT2i7MvvQJ4HlLkqMqkKlvkQ/2kDjNY=;
 b=XWNCJ0TjS9r7Is9Ik6n/kdLaCNE4SCN0FDdVWtRgLbERVl0GcEQKc4FxJBZbSLAxXl
 sZfRdkL/x3rwDNpLQRAgXIQxJzY5LIzWQQGCdIVkGV2HNDLKJa6SxXmMRNheUyIyhF9O
 hHPfoGoX271hne81PonDNmtBbLH8gnx5EDXGn3sORZoFEHnE/olhKFrsxlhkzwAMM/fk
 So9ZSHK9ifmKrz/C4nENpo/mIdhrgeuTCMizp8y6gnzYVd3EY37WmQDN5RcDytmXWmbT
 ulpVwNN3mcwoEtKDLPNQ/hWlqJTZUu5JTwa2jYa4LcSh/5hhP7ElPkil8oGWfyRFelRV
 zq/A==
X-Gm-Message-State: AOAM532KUYP+xZXfI2+2qMg3RyjWvYnOr8h4XvvLAC3I0xK60vapwm8v
 42W+GsfIIjUoJYIq67Lu+SwOrWY4Y6B4QQ==
X-Google-Smtp-Source: ABdhPJyCQeuiwAU+/krBiMvytaLSIRl+nE83/2qzPpaN6hzkte5vRQHq3Toss1BNwLt+3viKAkVvpw==
X-Received: by 2002:a17:90a:694d:: with SMTP id
 j13mr23652394pjm.99.1624225825499; 
 Sun, 20 Jun 2021 14:50:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 76sm13212625pfy.82.2021.06.20.14.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:50:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] target/avr: Convert to TranslatorOps
Date: Sun, 20 Jun 2021 14:50:22 -0700
Message-Id: <20210620215022.1510617-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620215022.1510617-1-richard.henderson@linaro.org>
References: <20210620215022.1510617-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 234 ++++++++++++++++++++++-------------------
 1 file changed, 128 insertions(+), 106 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index 66e9882422..c06ce45bc7 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -2897,113 +2897,131 @@ static bool canonicalize_skip(DisasContext *ctx)
     return true;
 }
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+static void gen_breakpoint(DisasContext *ctx)
 {
+    canonicalize_skip(ctx);
+    tcg_gen_movi_tl(cpu_pc, ctx->npc);
+    gen_helper_debug(cpu_env);
+    ctx->base.is_jmp = DISAS_NORETURN;
+}
+
+static void avr_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUAVRState *env = cs->env_ptr;
-    DisasContext ctx1 = {
-        .base.tb = tb,
-        .base.is_jmp = DISAS_NEXT,
-        .base.pc_first = tb->pc,
-        .base.pc_next = tb->pc,
-        .base.singlestep_enabled = cs->singlestep_enabled,
-        .cs = cs,
-        .env = env,
-        .memidx = 0,
-        .skip_cond = TCG_COND_NEVER,
-    };
-    DisasContext *ctx = &ctx1;
-    target_ulong pc_start = tb->pc / 2;
-    int num_insns = 0;
+    uint32_t tb_flags = ctx->base.tb->flags;
 
-    if (tb->flags & TB_FLAGS_FULL_ACCESS) {
-        /*
-         * This flag is set by ST/LD instruction we will regenerate it ONLY
-         * with mem/cpu memory access instead of mem access
-         */
-        max_insns = 1;
-    }
-    if (ctx->base.singlestep_enabled) {
-        max_insns = 1;
-    }
+    ctx->cs = cs;
+    ctx->env = env;
+    ctx->npc = ctx->base.pc_first / 2;
 
-    gen_tb_start(tb);
-
-    ctx->npc = pc_start;
-    if (tb->flags & TB_FLAGS_SKIP) {
+    ctx->skip_cond = TCG_COND_NEVER;
+    if (tb_flags & TB_FLAGS_SKIP) {
         ctx->skip_cond = TCG_COND_ALWAYS;
         ctx->skip_var0 = cpu_skip;
     }
 
-    do {
-        TCGLabel *skip_label = NULL;
-
-        /* translate current instruction */
-        tcg_gen_insn_start(ctx->npc);
-        num_insns++;
-
+    if (tb_flags & TB_FLAGS_FULL_ACCESS) {
         /*
-         * this is due to some strange GDB behavior
-         * let's assume main has address 0x100
-         * b main   - sets breakpoint at address 0x00000100 (code)
-         * b *0x100 - sets breakpoint at address 0x00800100 (data)
+         * This flag is set by ST/LD instruction we will regenerate it ONLY
+         * with mem/cpu memory access instead of mem access
          */
-        if (unlikely(!ctx->base.singlestep_enabled &&
-            (cpu_breakpoint_test(cs, OFFSET_CODE + ctx->npc * 2, BP_ANY) ||
-             cpu_breakpoint_test(cs, OFFSET_DATA + ctx->npc * 2, BP_ANY)))) {
-            canonicalize_skip(ctx);
-            tcg_gen_movi_tl(cpu_pc, ctx->npc);
-            gen_helper_debug(cpu_env);
-            goto done_generating;
-        }
+        ctx->base.max_insns = 1;
+    }
+}
 
-        /* Conditionally skip the next instruction, if indicated.  */
-        if (ctx->skip_cond != TCG_COND_NEVER) {
-            skip_label = gen_new_label();
-            if (ctx->skip_var0 == cpu_skip) {
-                /*
-                 * Copy cpu_skip so that we may zero it before the branch.
-                 * This ensures that cpu_skip is non-zero after the label
-                 * if and only if the skipped insn itself sets a skip.
-                 */
-                ctx->free_skip_var0 = true;
-                ctx->skip_var0 = tcg_temp_new();
-                tcg_gen_mov_tl(ctx->skip_var0, cpu_skip);
-                tcg_gen_movi_tl(cpu_skip, 0);
-            }
-            if (ctx->skip_var1 == NULL) {
-                tcg_gen_brcondi_tl(ctx->skip_cond, ctx->skip_var0,
-                                   0, skip_label);
-            } else {
-                tcg_gen_brcond_tl(ctx->skip_cond, ctx->skip_var0,
-                                  ctx->skip_var1, skip_label);
-                ctx->skip_var1 = NULL;
-            }
-            if (ctx->free_skip_var0) {
-                tcg_temp_free(ctx->skip_var0);
-                ctx->free_skip_var0 = false;
-            }
-            ctx->skip_cond = TCG_COND_NEVER;
-            ctx->skip_var0 = NULL;
-        }
+static void avr_tr_tb_start(DisasContextBase *db, CPUState *cs)
+{
+}
 
-        translate(ctx);
+static void avr_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-        if (skip_label) {
-            canonicalize_skip(ctx);
-            gen_set_label(skip_label);
-            if (ctx->base.is_jmp == DISAS_NORETURN) {
-                ctx->base.is_jmp = DISAS_CHAIN;
-            }
-        }
-    } while (ctx->base.is_jmp == DISAS_NEXT
-             && num_insns < max_insns
-             && (ctx->npc - pc_start) * 2 < TARGET_PAGE_SIZE - 4
-             && !tcg_op_buf_full());
+    tcg_gen_insn_start(ctx->npc);
+}
 
-    if (tb->cflags & CF_LAST_IO) {
-        gen_io_end();
+static bool avr_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                    const CPUBreakpoint *bp)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    gen_breakpoint(ctx);
+    return true;
+}
+
+static void avr_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    TCGLabel *skip_label = NULL;
+
+    /*
+     * This is due to some strange GDB behavior
+     * Let's assume main has address 0x100:
+     * b main   - sets breakpoint at address 0x00000100 (code)
+     * b *0x100 - sets breakpoint at address 0x00800100 (data)
+     *
+     * The translator driver has already taken care of the code pointer.
+     */
+    if (!ctx->base.singlestep_enabled &&
+        cpu_breakpoint_test(cs, OFFSET_DATA + ctx->base.pc_next, BP_ANY)) {
+        gen_breakpoint(ctx);
+        return;
     }
 
+    /* Conditionally skip the next instruction, if indicated.  */
+    if (ctx->skip_cond != TCG_COND_NEVER) {
+        skip_label = gen_new_label();
+        if (ctx->skip_var0 == cpu_skip) {
+            /*
+             * Copy cpu_skip so that we may zero it before the branch.
+             * This ensures that cpu_skip is non-zero after the label
+             * if and only if the skipped insn itself sets a skip.
+             */
+            ctx->free_skip_var0 = true;
+            ctx->skip_var0 = tcg_temp_new();
+            tcg_gen_mov_tl(ctx->skip_var0, cpu_skip);
+            tcg_gen_movi_tl(cpu_skip, 0);
+        }
+        if (ctx->skip_var1 == NULL) {
+            tcg_gen_brcondi_tl(ctx->skip_cond, ctx->skip_var0, 0, skip_label);
+        } else {
+            tcg_gen_brcond_tl(ctx->skip_cond, ctx->skip_var0,
+                              ctx->skip_var1, skip_label);
+            ctx->skip_var1 = NULL;
+        }
+        if (ctx->free_skip_var0) {
+            tcg_temp_free(ctx->skip_var0);
+            ctx->free_skip_var0 = false;
+        }
+        ctx->skip_cond = TCG_COND_NEVER;
+        ctx->skip_var0 = NULL;
+    }
+
+    translate(ctx);
+
+    ctx->base.pc_next = ctx->npc * 2;
+
+    if (skip_label) {
+        canonicalize_skip(ctx);
+        gen_set_label(skip_label);
+        if (ctx->base.is_jmp == DISAS_NORETURN) {
+            ctx->base.is_jmp = DISAS_CHAIN;
+        }
+    }
+
+    if (ctx->base.is_jmp == DISAS_NEXT) {
+        target_ulong page_first = ctx->base.pc_first & TARGET_PAGE_MASK;
+
+        if ((ctx->base.pc_next - page_first) >= TARGET_PAGE_SIZE - 4) {
+            ctx->base.is_jmp = DISAS_TOO_MANY;
+        }
+    }
+}
+
+static void avr_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
     bool nonconst_skip = canonicalize_skip(ctx);
 
     switch (ctx->base.is_jmp) {
@@ -3036,24 +3054,28 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     default:
         g_assert_not_reached();
     }
+}
 
-done_generating:
-    gen_tb_end(tb, num_insns);
+static void avr_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+{
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
+}
 
-    tb->size = (ctx->npc - pc_start) * 2;
-    tb->icount = num_insns;
+static const TranslatorOps avr_tr_ops = {
+    .init_disas_context = avr_tr_init_disas_context,
+    .tb_start           = avr_tr_tb_start,
+    .insn_start         = avr_tr_insn_start,
+    .breakpoint_check   = avr_tr_breakpoint_check,
+    .translate_insn     = avr_tr_translate_insn,
+    .tb_stop            = avr_tr_tb_stop,
+    .disas_log          = avr_tr_disas_log,
+};
 
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(tb->pc)) {
-        FILE *fd;
-        fd = qemu_log_lock();
-        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
-        log_target_disas(cs, tb->pc, tb->size);
-        qemu_log("\n");
-        qemu_log_unlock(fd);
-    }
-#endif
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+{
+    DisasContext dc = { };
+    translator_loop(&avr_tr_ops, &dc.base, cs, tb, max_insns);
 }
 
 void restore_state_to_opc(CPUAVRState *env, TranslationBlock *tb,
-- 
2.25.1


