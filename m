Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A53AE0B6
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:34:52 +0200 (CEST)
Received: from localhost ([::1]:37208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv55f-0005G0-St
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53u-0002PU-Cm
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:02 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:39778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53n-0008UO-Gg
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:33:02 -0400
Received: by mail-pg1-x534.google.com with SMTP id w31so12526713pga.6
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BdnLl8xmYlB1beezapSg6HL7QcSYtDLtwjs+7yT5xBc=;
 b=Ek8p2Of+No8fAmEJPD4DkNaj47ruCU3gNKwP2Y6mPsWRSLfyz2jep+HMrKJAssARib
 PP4skcyzbu+YcIvUufzv3TyIHZ8D/PgHHDtKj8IZsTWPBSSIU4sozn66kgJ62CRXhTyc
 7A0PtrxQxz035N6dt11G/1RpcSbsTwFNmCDfNHqbbdMSj33WbmqXvEgeQbYFNNRMzckG
 g0OvsnzaQKQX5ij7TsbIsgrHlGAim9racdT47xoEyF52dq0MtmBZFydN02lIB+nq9EBI
 s1zppo7/Gha1R7NebpBlNRF+tBdA1B60dnfIZgngBp3kPeCJvnJa39Fz4wi6vezImcdq
 sDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BdnLl8xmYlB1beezapSg6HL7QcSYtDLtwjs+7yT5xBc=;
 b=K42VcdsHPsVqGUBG4vyXS7rNgmGOcpFHTYrjXGw82aWzujKa/gNLyykrk28abfd+1a
 z1EF1spMs5oaj4LcDtbLsmHQEQmqDJviE2mYSKc3OXO/zmMdHdhAe/hptzBoRYi29KjW
 5f5atIGVoM+fQIBe8/y9/ATJvuLYMkviCLX4rh8F06cX709EBkZFpxLacdLHxO98n6rM
 7zK9qlcOnAn9L1GPAqkLeIpAWKz3fM9IguBn81pBFq89vkP3bDtELACrb1xpyaBZrmOC
 1vDjlfBLc39xue38sYIGZZ3/qQvbNJ5u+HgCVKO9AL5qZqfCb2Fw6CEEbFGWTXw1KVxe
 rGGg==
X-Gm-Message-State: AOAM532LM51KaI3346AgHj6gyiHERAL7aoKNmhFmevPatnWGHfWCCKAy
 rB6BC/D3SjPdmZNvWmdW42ifFuUXgcVkGA==
X-Google-Smtp-Source: ABdhPJzxTh5s7OnWTXfV2k0uRWGMkPUQLUK3cHQ1qC7IehkbougyG+CbXCF+4e1OQezamoIBlz9S2g==
X-Received: by 2002:a62:ea1a:0:b029:2ec:9146:30be with SMTP id
 t26-20020a62ea1a0000b02902ec914630bemr16079597pfh.29.1624224773432; 
 Sun, 20 Jun 2021 14:32:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/11] target/cris: Convert to TranslatorOps
Date: Sun, 20 Jun 2021 14:32:44 -0700
Message-Id: <20210620213249.1494274-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
 target/cris/translate.c | 313 ++++++++++++++++++++++------------------
 1 file changed, 170 insertions(+), 143 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 9e1f2f9239..f6d1fa914f 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3114,17 +3114,12 @@ static unsigned int crisv32_decoder(CPUCRISState *env, DisasContext *dc)
  *
  */
 
-/* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+static void cris_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUCRISState *env = cs->env_ptr;
+    uint32_t tb_flags = dc->base.tb->flags;
     uint32_t pc_start;
-    unsigned int insn_len;
-    struct DisasContext ctx;
-    struct DisasContext *dc = &ctx;
-    uint32_t page_start;
-    target_ulong npc;
-    int num_insns;
 
     if (env->pregs[PR_VR] == 32) {
         dc->decoder = crisv32_decoder;
@@ -3134,150 +3129,170 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
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
+    pc_start = dc->base.pc_first & ~1;
     dc->base.pc_first = pc_start;
     dc->base.pc_next = pc_start;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
 
     dc->cpu = env_archcpu(env);
     dc->ppc = pc_start;
     dc->pc = pc_start;
     dc->flags_uptodate = 1;
     dc->flagx_known = 1;
-    dc->flags_x = tb->flags & X_FLAG;
+    dc->flags_x = tb_flags & X_FLAG;
     dc->cc_x_uptodate = 0;
     dc->cc_mask = 0;
     dc->update_cc = 0;
     dc->clear_prefix = 0;
+    dc->cpustate_changed = 0;
 
     cris_update_cc_op(dc, CC_OP_FLAGS, 4);
     dc->cc_size_uptodate = -1;
 
     /* Decode TB flags.  */
-    dc->tb_flags = tb->flags & (S_FLAG | P_FLAG | U_FLAG \
-            | X_FLAG | PFIX_FLAG);
-    dc->delayed_branch = !!(tb->flags & 7);
+    dc->tb_flags = tb_flags & (S_FLAG | P_FLAG | U_FLAG | X_FLAG | PFIX_FLAG);
+    dc->delayed_branch = !!(tb_flags & 7);
     if (dc->delayed_branch) {
         dc->jmp = JMP_INDIRECT;
     } else {
         dc->jmp = JMP_NOJMP;
     }
+}
 
-    dc->cpustate_changed = 0;
+static void cris_tr_tb_start(DisasContextBase *db, CPUState *cpu)
+{
+}
 
-    page_start = pc_start & TARGET_PAGE_MASK;
-    num_insns = 0;
+static void cris_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    gen_tb_start(tb);
-    do {
-        tcg_gen_insn_start(dc->delayed_branch == 1
-                           ? dc->ppc | 1 : dc->pc);
-        num_insns++;
+    tcg_gen_insn_start(dc->delayed_branch == 1 ? dc->ppc | 1 : dc->pc);
+}
 
-        if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
+static bool cris_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                     const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
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
+
+static void cris_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+    CPUCRISState *env = cs->env_ptr;
+    unsigned int insn_len;
+
+    /* Pretty disas.  */
+    LOG_DIS("%8.8x:\t", dc->pc);
+
+    dc->clear_x = 1;
+
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
+    if (dc->delayed_branch && --dc->delayed_branch == 0) {
+        if (dc->base.tb->flags & 7) {
+            t_gen_movi_env_TN(dslot, 0);
+        }
+
+        if (dc->cpustate_changed
+            || !dc->flagx_known
+            || (dc->flags_x != (dc->base.tb->flags & X_FLAG))) {
+            cris_store_direct_jmp(dc);
+        }
+
+        if (dc->clear_locked_irq) {
+            dc->clear_locked_irq = 0;
+            t_gen_movi_env_TN(locked_irq, 0);
+        }
+
+        if (dc->jmp == JMP_DIRECT_CC) {
+            TCGLabel *l1 = gen_new_label();
             cris_evaluate_flags(dc);
-            tcg_gen_movi_tl(env_pc, dc->pc);
-            t_gen_raise_exception(EXCP_DEBUG);
+
+            /* Conditional jmp.  */
+            tcg_gen_brcondi_tl(TCG_COND_EQ, env_btaken, 0, l1);
+            gen_goto_tb(dc, 1, dc->jmp_pc);
+            gen_set_label(l1);
+            gen_goto_tb(dc, 0, dc->pc);
             dc->base.is_jmp = DISAS_NORETURN;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 2;
-            break;
+            dc->jmp = JMP_NOJMP;
+        } else if (dc->jmp == JMP_DIRECT) {
+            cris_evaluate_flags(dc);
+            gen_goto_tb(dc, 0, dc->jmp_pc);
+            dc->base.is_jmp = DISAS_NORETURN;
+            dc->jmp = JMP_NOJMP;
+        } else {
+            TCGv c = tcg_const_tl(dc->pc);
+            t_gen_cc_jmp(env_btarget, c);
+            tcg_temp_free(c);
+            dc->base.is_jmp = DISAS_JUMP;
         }
+    }
 
-        /* Pretty disas.  */
-        LOG_DIS("%8.8x:\t", dc->pc);
+    /* Force an update if the per-tb cpu state has changed.  */
+    if (dc->base.is_jmp == DISAS_NEXT
+        && (dc->cpustate_changed
+            || !dc->flagx_known
+            || (dc->flags_x != (dc->base.tb->flags & X_FLAG)))) {
+        dc->base.is_jmp = DISAS_UPDATE;
+        tcg_gen_movi_tl(env_pc, dc->pc);
+    }
 
-        if (num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
-            gen_io_start();
-        }
-        dc->clear_x = 1;
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
 
-        insn_len = dc->decoder(env, dc);
-        dc->ppc = dc->pc;
-        dc->pc += insn_len;
-        if (dc->clear_x) {
-            cris_clear_x_flag(dc);
-        }
+static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+    DisasJumpType is_jmp = dc->base.is_jmp;
+    target_ulong npc = dc->pc;
 
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
-
-                if (dc->clear_locked_irq) {
-                    dc->clear_locked_irq = 0;
-                    t_gen_movi_env_TN(locked_irq, 0);
-                }
-
-                if (dc->jmp == JMP_DIRECT_CC) {
-                    TCGLabel *l1 = gen_new_label();
-                    cris_evaluate_flags(dc);
-
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
-            }
-        }
-
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
+    if (is_jmp == DISAS_NORETURN) {
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
@@ -3287,45 +3302,57 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
 
     cris_evaluate_flags(dc);
 
-    if (unlikely(cs->singlestep_enabled)) {
-        if (dc->base.is_jmp == DISAS_NEXT) {
+    if (unlikely(dc->base.singlestep_enabled)) {
+        switch (is_jmp) {
+        case DISAS_TOO_MANY:
             tcg_gen_movi_tl(env_pc, npc);
-        }
-        t_gen_raise_exception(EXCP_DEBUG);
-    } else {
-        switch (dc->base.is_jmp) {
-        case DISAS_NEXT:
-            gen_goto_tb(dc, 1, npc);
-            break;
-        default:
+            /* fall through */
         case DISAS_JUMP:
         case DISAS_UPDATE:
-            /* indicate that the hash table must be used
-                   to find the next TB */
-            tcg_gen_exit_tb(NULL, 0);
-            break;
-        case DISAS_NORETURN:
-            /* nothing more to generate */
+            t_gen_raise_exception(EXCP_DEBUG);
+            return;
+        default:
             break;
         }
+        g_assert_not_reached();
     }
-    gen_tb_end(tb, num_insns);
 
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
+    switch (is_jmp) {
+    case DISAS_TOO_MANY:
+        gen_goto_tb(dc, 0, npc);
+        break;
+    case DISAS_JUMP:
+    case DISAS_UPDATE:
+        /* Indicate that interupts must be re-evaluated before the next TB. */
+        tcg_gen_exit_tb(NULL, 0);
+        break;
+    default:
+        g_assert_not_reached();
     }
-#endif
-#endif
+}
+
+static void cris_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+{
+    if (!DISAS_CRIS) {
+        qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+        log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+    }
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


