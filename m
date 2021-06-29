Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A83B7849
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:11:27 +0200 (CEST)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJ8o-0003Kf-4L
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItC-00084Q-Kn
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:18 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIt0-0000sp-8r
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:18 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y4so85598pfi.9
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EwjSjIzX7OecDhVxAUgcxoNalQtQhSbjjCChXF3d7tM=;
 b=fiDJshG5pTOyxIivsPzogp/VSLuzeGiqfpNZJixzlVuj+0r/PB0jpn8LZ8+ljKgYwi
 3dyOGHkvjtm2X43Mizzg7sVUJdqayqZYrCtuofuFjyw++HuVSMKXOk0t3XI4+etIXLU/
 P2+XkKADsMViX1ecvO3GONfKbGyBcsRzjyvy/mbxmsLM4XmOpIwkoe7Dl7Q2BvaK27Sn
 qkxkAxjX+ec4AxheM2VPc7nqbfwL0DCg3Gt+TIOjT0DCdbJuJKNoVZTmamkwRu+gPUHs
 ZS9ST7e12viPgsgLYLB8Ckaw5F35w+XnhlFD2FS9UiNcm2VPLSWhPse652b/AyUL1tho
 PuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EwjSjIzX7OecDhVxAUgcxoNalQtQhSbjjCChXF3d7tM=;
 b=YvB2KkiWrz1vHIFPsuu0GRp+7n2OdNwkby3QV5TKUIV3o2ZMHad2RvlZgYmL9OyZeh
 1cC4WHCfX475dfbyWOhrLF5sazRJIai00pr4lh8KHsWIqE9AJE0OOPMErr0hV+6UuxWH
 r1vx5ZyZRLtFkASRBkSZod7Ya8f6/sdcmv1BYA2s5OxrJucWiKzA5ckud0tTI6lFIvXa
 XPqD6rg75Z4qAp6195VFDyybCw3fjoPlxPcRhjUWJNwi6R4nTnqiaFUOs0sKqMcTcExs
 Cfh5pyAXYRCLp3Shc2bAvFIs6V0rxYf3MRstdxLPJCmZVV2y8wEgTGJTY7KVukaWLnLU
 rQPg==
X-Gm-Message-State: AOAM530MnI603qoxwnQl3XcxfWplJb63MpaBAkd60QIeuqMs7PpxmMpY
 FXaHb/pKDMcyqc8IifQSwItNkUgzkmkuRQ==
X-Google-Smtp-Source: ABdhPJzlt988HV+EmyIteaF33LoQiwdkOXDwjv/8yne367JMYBDKR2pafgmFQOrbhXy4LUkg1RPxMw==
X-Received: by 2002:a62:ee14:0:b029:309:715f:563f with SMTP id
 e20-20020a62ee140000b0290309715f563fmr24013805pfi.38.1624992903089; 
 Tue, 29 Jun 2021 11:55:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/63] target/avr: Convert to TranslatorOps
Date: Tue, 29 Jun 2021 11:54:04 -0700
Message-Id: <20210629185455.3131172-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
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


