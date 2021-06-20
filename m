Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C933ADC8A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:23:48 +0200 (CEST)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luozr-00083P-DH
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxz-0005JN-RB
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:53 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luoxv-0007yB-RJ
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:21:51 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so8223891pjn.1
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 21:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZADyMfffqsmp+0m+4yVAjA1tVQt/ONZZyrANqPtQYA=;
 b=gA+kQVMUJvnbLEFrQcCp/8fjjRqGrUXBHHlyyTDbtktx8TxgqjBQnq2iJoCX0fP1Jt
 6dN0RYBD9B2joHjsaHrHOlHil3K7OsnxCWLEKejapPTGVYpYeLtluiHmkiZ3kNTBDFZ5
 v0oxl2U6HSGvNv9HEzzrZT1Qi+63nDAraen59yAqdvgrNP97E00FOpLpmuXY1Wx4qVix
 uqNWmBMX5A1rZtgPn9gtm8krytWmQVEzdS5jkJPU4LJxfiMYH8KP6x5ysf0/3SOOvxml
 hocpQ5Snfb1fbAC831NUDiVdXbufgwgliuqUG3fXxiOk6K8jX3GRpbVP5lfBmbfy5z+I
 Jukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZADyMfffqsmp+0m+4yVAjA1tVQt/ONZZyrANqPtQYA=;
 b=hgFPc3qa/y+hWsN2ZlRYQGSWU6SK+GdlBMM9QQuF1zNjX2MIUiD6o8ZIpoMNrNyF4T
 hBWyL2ieQhWEYx9CmGdL5dBZSSzRf7I3AB0tbRox/8yEG/hiCThDbptmKFiLvn7O4prA
 +Q+uhwNDvgDQKDs+pPRGO9ntmmL57B8c5mRHmvENutCiGTc5AjWGDjFjbzEjFBLw6EIU
 YH2aajqR+H7dgbe7AeYgpxOzFDKRWqXSjFqa9gPXC1XxMJb+TqN07M9jtxhN475Et1Fj
 OmEx0Hukw21lfc0dEYs/fEOdIurEWYReRFhZoDvQcPZQ6SUAvuCNKFzG5g9UUOT3YeRO
 nrlg==
X-Gm-Message-State: AOAM5329MGeEWZc2go0CEh1ZLGe12potqdq2AhPv8DAxG/mTQPxHeTLG
 t753ytUaA8t7gGDNAwavjPSk9GjdaQBuZg==
X-Google-Smtp-Source: ABdhPJx3rVdEP/aWiXZ/aEoZ466fujPMqILdyUmJdWojZj4fD8tPDsivliOfMSs/uZsDw2aGbeRv8w==
X-Received: by 2002:a17:90a:740a:: with SMTP id
 a10mr22476338pjg.162.1624162906478; 
 Sat, 19 Jun 2021 21:21:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b6sm11923156pfv.16.2021.06.19.21.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 21:21:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] target/cris: Convert to TranslatorOps
Date: Sat, 19 Jun 2021 21:21:37 -0700
Message-Id: <20210620042141.1235541-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620042141.1235541-1-richard.henderson@linaro.org>
References: <20210620042141.1235541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 320 ++++++++++++++++++++++------------------
 1 file changed, 177 insertions(+), 143 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 24dbae6d58..8c24053f5e 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3119,17 +3119,11 @@ static unsigned int crisv32_decoder(CPUCRISState *env, DisasContext *dc)
  *
  */
 
-/* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+static void cris_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUCRISState *env = cs->env_ptr;
-    uint32_t pc_start;
-    unsigned int insn_len;
-    struct DisasContext ctx;
-    struct DisasContext *dc = &ctx;
-    uint32_t page_start;
-    target_ulong npc;
-    int num_insns;
+    uint32_t tb_flags;
 
     if (env->pregs[PR_VR] == 32) {
         dc->decoder = crisv32_decoder;
@@ -3139,23 +3133,21 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
         dc->clear_locked_irq = 1;
     }
 
-    /* Odd PC indicates that branch is rexecuting due to exception in the
+    /*
+     * Odd PC indicates that branch is rexecuting due to exception in the
      * delayslot, like in real hw.
      */
-    pc_start = tb->pc & ~1;
-
-    dc->base.tb = tb;
-    dc->base.pc_first = pc_start;
-    dc->base.pc_next = pc_start;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
+    dc->base.pc_first &= ~1;
+    dc->base.pc_next &= ~1;
 
     dc->cpu = env_archcpu(env);
-    dc->ppc = pc_start;
-    dc->pc = pc_start;
+    dc->ppc = dc->base.pc_next;
+    dc->pc = dc->base.pc_next;
     dc->flags_uptodate = 1;
     dc->flagx_known = 1;
-    dc->flags_x = tb->flags & X_FLAG;
+    tb_flags = dc->base.tb->flags;
+    dc->tb_flags = tb_flags & (S_FLAG | P_FLAG | U_FLAG | X_FLAG | PFIX_FLAG);
+    dc->flags_x = tb_flags & X_FLAG;
     dc->cc_x_uptodate = 0;
     dc->cc_mask = 0;
     dc->update_cc = 0;
@@ -3165,9 +3157,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     dc->cc_size_uptodate = -1;
 
     /* Decode TB flags.  */
-    dc->tb_flags = tb->flags & (S_FLAG | P_FLAG | U_FLAG \
-            | X_FLAG | PFIX_FLAG);
-    dc->delayed_branch = !!(tb->flags & 7);
+    dc->delayed_branch = !!(tb_flags & 7);
     if (dc->delayed_branch) {
         dc->jmp = JMP_INDIRECT;
     } else {
@@ -3176,113 +3166,146 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 
     dc->cpustate_changed = 0;
 
-    page_start = pc_start & TARGET_PAGE_MASK;
-    num_insns = 0;
+    if ((dc->base.singlestep_enabled || singlestep)
+        && dc->base.max_insns > 1) {
+        /* If re-executing a branch, execute both. */
+        dc->base.max_insns = 1 + (dc->base.tb->pc & 1);
+    }
+}
 
-    gen_tb_start(tb);
-    do {
-        tcg_gen_insn_start(dc->delayed_branch == 1
-                           ? dc->ppc | 1 : dc->pc);
-        num_insns++;
+static void cris_tr_tb_start(DisasContextBase *db, CPUState *cpu)
+{
+}
 
-        if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
-            cris_evaluate_flags(dc);
-            tcg_gen_movi_tl(env_pc, dc->pc);
-            t_gen_raise_exception(EXCP_DEBUG);
-            dc->base.is_jmp = DISAS_NORETURN;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 2;
-            break;
-        }
+static void cris_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-        /* Pretty disas.  */
-        LOG_DIS("%8.8x:\t", dc->pc);
+    tcg_gen_insn_start(dc->delayed_branch == 1 ? dc->ppc | 1 : dc->pc);
+}
 
-        if (num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
-            gen_io_start();
-        }
-        dc->clear_x = 1;
+static bool cris_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                     const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-        insn_len = dc->decoder(env, dc);
-        dc->ppc = dc->pc;
-        dc->pc += insn_len;
-        if (dc->clear_x) {
-            cris_clear_x_flag(dc);
-        }
+    cris_evaluate_flags(dc);
+    tcg_gen_movi_tl(env_pc, dc->pc);
+    t_gen_raise_exception(EXCP_DEBUG);
+    dc->base.is_jmp = DISAS_NORETURN;
+    /*
+     * The address covered by the breakpoint must be included in
+     * [tb->pc, tb->pc + tb->size) in order to for it to be
+     * properly cleared -- thus we increment the PC here so that
+     * the logic setting tb->size below does the right thing.
+     */
+    dc->pc += 2;
+    return true;
+}
 
-        /* Check for delayed branches here. If we do it before
-           actually generating any host code, the simulator will just
-           loop doing nothing for on this program location.  */
-        if (dc->delayed_branch) {
-            dc->delayed_branch--;
-            if (dc->delayed_branch == 0) {
-                if (tb->flags & 7) {
-                    t_gen_movi_env_TN(dslot, 0);
-                }
-                if (dc->cpustate_changed || !dc->flagx_known
-                    || (dc->flags_x != (tb->flags & X_FLAG))) {
-                    cris_store_direct_jmp(dc);
-                }
+static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+    CPUCRISState *env = cs->env_ptr;
+    unsigned int insn_len;
 
-                if (dc->clear_locked_irq) {
-                    dc->clear_locked_irq = 0;
-                    t_gen_movi_env_TN(locked_irq, 0);
-                }
+    /* Pretty disas.  */
+    LOG_DIS("%8.8x:\t", dc->pc);
 
-                if (dc->jmp == JMP_DIRECT_CC) {
-                    TCGLabel *l1 = gen_new_label();
-                    cris_evaluate_flags(dc);
+    dc->clear_x = 1;
 
-                    /* Conditional jmp.  */
-                    tcg_gen_brcondi_tl(TCG_COND_EQ,
-                               env_btaken, 0, l1);
-                    gen_goto_tb(dc, 1, dc->jmp_pc);
-                    gen_set_label(l1);
-                    gen_goto_tb(dc, 0, dc->pc);
-                    dc->base.is_jmp = DISAS_NORETURN;
-                    dc->jmp = JMP_NOJMP;
-                } else if (dc->jmp == JMP_DIRECT) {
-                    cris_evaluate_flags(dc);
-                    gen_goto_tb(dc, 0, dc->jmp_pc);
-                    dc->base.is_jmp = DISAS_NORETURN;
-                    dc->jmp = JMP_NOJMP;
-                } else {
-                    TCGv c = tcg_const_tl(dc->pc);
-                    t_gen_cc_jmp(env_btarget, c);
-                    tcg_temp_free(c);
-                    dc->base.is_jmp = DISAS_JUMP;
-                }
-                break;
+    insn_len = dc->decoder(env, dc);
+    dc->ppc = dc->pc;
+    dc->pc += insn_len;
+    dc->base.pc_next += insn_len;
+
+    if (dc->clear_x) {
+        cris_clear_x_flag(dc);
+    }
+
+    /*
+     * Check for delayed branches here.  If we do it before
+     * actually generating any host code, the simulator will just
+     * loop doing nothing for on this program location.
+     */
+    if (dc->delayed_branch) {
+        dc->delayed_branch--;
+        if (dc->delayed_branch == 0) {
+            if (dc->base.tb->flags & 7) {
+                t_gen_movi_env_TN(dslot, 0);
+            }
+
+            if (dc->cpustate_changed
+                || !dc->flagx_known
+                || (dc->flags_x != (dc->base.tb->flags & X_FLAG))) {
+                cris_store_direct_jmp(dc);
+            }
+
+            if (dc->clear_locked_irq) {
+                dc->clear_locked_irq = 0;
+                t_gen_movi_env_TN(locked_irq, 0);
+            }
+
+            if (dc->jmp == JMP_DIRECT_CC) {
+                TCGLabel *l1 = gen_new_label();
+                cris_evaluate_flags(dc);
+
+                /* Conditional jmp.  */
+                tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
+                gen_goto_tb(dc, 1, dc->jmp_pc);
+                gen_set_label(l1);
+                gen_goto_tb(dc, 0, dc->pc);
+                dc->base.is_jmp = DISAS_NORETURN;
+                dc->jmp = JMP_NOJMP;
+            } else if (dc->jmp == JMP_DIRECT) {
+                cris_evaluate_flags(dc);
+                gen_goto_tb(dc, 0, dc->jmp_pc);
+                dc->base.is_jmp = DISAS_NORETURN;
+                dc->jmp = JMP_NOJMP;
+            } else {
+                TCGv c = tcg_const_tl(dc->pc);
+                t_gen_cc_jmp(env_btarget, c);
+                tcg_temp_free(c);
+                dc->base.is_jmp = DISAS_JUMP;
             }
         }
+    }
 
-        /* If we are rexecuting a branch due to exceptions on
-           delay slots don't break.  */
-        if (!(tb->pc & 1) && cs->singlestep_enabled) {
-            break;
-        }
-    } while (!dc->base.is_jmp && !dc->cpustate_changed
-            && !tcg_op_buf_full()
-            && !singlestep
-            && (dc->pc - page_start < TARGET_PAGE_SIZE)
-            && num_insns < max_insns);
+    /* Force an update if the per-tb cpu state has changed.  */
+    if (dc->base.is_jmp == DISAS_NEXT
+        && (dc->cpustate_changed
+            || !dc->flagx_known
+            || (dc->flags_x != (dc->base.tb->flags & X_FLAG)))) {
+        dc->base.is_jmp = DISAS_UPDATE;
+        tcg_gen_movi_tl(env_pc, dc->pc);
+    }
+
+    /*
+     * FIXME: Only the first insn in the TB should cross a page boundary.
+     * If we can detect the length of the next insn easily, we should.
+     * In the meantime, simply stop when we do cross.
+     */
+    if (dc->base.is_jmp == DISAS_NEXT
+        && ((dc->pc ^ dc->base.pc_first) & TARGET_PAGE_MASK) != 0) {
+        dc->base.is_jmp = DISAS_TOO_MANY;
+    }
+}
+
+static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+    target_ulong npc = dc->pc;
+
+    if (dc->base.is_jmp == DISAS_NORETURN) {
+        /* If we have a broken branch+delayslot sequence, it's too late. */
+        assert(dc->delayed_branch != 1);
+        return;
+    }
 
     if (dc->clear_locked_irq) {
         t_gen_movi_env_TN(locked_irq, 0);
     }
 
-    npc = dc->pc;
-
-    /* Force an update if the per-tb cpu state has changed.  */
-    if (dc->base.is_jmp == DISAS_NEXT
-        && (dc->cpustate_changed || !dc->flagx_known
-        || (dc->flags_x != (tb->flags & X_FLAG)))) {
-        dc->base.is_jmp = DISAS_UPDATE;
-        tcg_gen_movi_tl(env_pc, npc);
-    }
     /* Broken branch+delayslot sequence.  */
     if (dc->delayed_branch == 1) {
         /* Set env->dslot to the size of the branch insn.  */
@@ -3292,45 +3315,56 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 
     cris_evaluate_flags(dc);
 
-    if (unlikely(cs->singlestep_enabled)) {
-        if (dc->base.is_jmp == DISAS_NEXT) {
-            tcg_gen_movi_tl(env_pc, npc);
-        }
-        t_gen_raise_exception(EXCP_DEBUG);
-    } else {
+    if (unlikely(dc->base.singlestep_enabled)) {
         switch (dc->base.is_jmp) {
-        case DISAS_NEXT:
-            gen_goto_tb(dc, 1, npc);
-            break;
-        default:
+        case DISAS_TOO_MANY:
+            tcg_gen_movi_tl(env_pc, npc);
+            /* fall through */
         case DISAS_JUMP:
         case DISAS_UPDATE:
-            /* indicate that the hash table must be used
-                   to find the next TB */
+            t_gen_raise_exception(EXCP_DEBUG);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    } else {
+        switch (dc->base.is_jmp) {
+        case DISAS_TOO_MANY:
+            gen_goto_tb(dc, 1, npc);
+            break;
+        case DISAS_JUMP:
+        case DISAS_UPDATE:
+            /* indicate that the hash table must be used to find the next TB */
             tcg_gen_exit_tb(NULL, 0);
             break;
-        case DISAS_NORETURN:
-            /* nothing more to generate */
-            break;
+        default:
+            g_assert_not_reached();
         }
     }
-    gen_tb_end(tb, num_insns);
+}
 
-    tb->size = dc->pc - pc_start;
-    tb->icount = num_insns;
-
-#ifdef DEBUG_DISAS
-#if !DISAS_CRIS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(pc_start)) {
-        FILE *logfile = qemu_log_lock();
-        qemu_log("--------------\n");
-        qemu_log("IN: %s\n", lookup_symbol(pc_start));
-        log_target_disas(cs, pc_start, dc->pc - pc_start);
-        qemu_log_unlock(logfile);
+static void cris_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+{
+    if (!DISAS_CRIS) {
+        qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+        log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
     }
-#endif
-#endif
+}
+
+static const TranslatorOps cris_tr_ops = {
+    .init_disas_context = cris_tr_init_disas_context,
+    .tb_start           = cris_tr_tb_start,
+    .insn_start         = cris_tr_insn_start,
+    .breakpoint_check   = cris_tr_breakpoint_check,
+    .translate_insn     = cris_tr_translate_insn,
+    .tb_stop            = cris_tr_tb_stop,
+    .disas_log          = cris_tr_disas_log,
+};
+
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+{
+    DisasContext dc;
+    translator_loop(&cris_tr_ops, &dc.base, cs, tb, max_insns);
 }
 
 void cris_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.25.1


