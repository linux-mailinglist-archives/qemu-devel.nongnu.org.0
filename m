Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C233AE0E0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 00:18:19 +0200 (CEST)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5li-0004kZ-If
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 18:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eZ-0001gl-UN
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:56 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:46964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eV-0007sa-OA
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:55 -0400
Received: by mail-pg1-x529.google.com with SMTP id n12so3824798pgs.13
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 15:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aWsoskdLoq0f3x6JrKNF8jFSujiQhbxxitbbJIW/v2k=;
 b=WtUoWDOJPY1qD2nbEF0HbAjiKsFszi/6vu81yszfAJ1M320eLeP2Ly2S6Z984n3Zpd
 YowhfcpFvEENpuR9toYYT07sjHXkOnpNnr7UzxCKrlfwlPn3YIq5CPXkoNBVNBP/Hiyb
 BQwxjvzYJgBuCRX/giVh6/I1IxhTfoWJl3SOa4h/E/kXsUKye00D+NDIcYi89eDWvnv7
 oInDw0OEx19qOqfXRNrwY+aOYopyrTnWogy8YmzMKEpn+vtGFNCMc+d+2qv3rFVJQlo6
 Gggvxa/8JUt/4iwX3qrT5a242vzf/af4QOjX9eqm/zugQoHiRpR5XBBDMf4eb+EieF9M
 WJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWsoskdLoq0f3x6JrKNF8jFSujiQhbxxitbbJIW/v2k=;
 b=J6uAhXvZxCUSusNNW65CPGAa7LdbtJqFdKpEVYMC83HEba9ReWkxnvquMEMp6oZ0Ib
 j5Ngc76tAjIX19afBO3JzaqYr8YLMBVD1zm7bmmvHIn2Dmv0QM7zAMuaYSGOu8eWQm6p
 eM77fmGdYYTD51J3tNYBfvfkyLZtZmb8Xdqvdp8NSY/6s2x7/hko1mLuha2emOmpmSWf
 4AhQlYdhCflwZFzC3lAJRfj3nS/Ze1dx0GVC8GFL+yGCEQQFPO9KEPV2sceM7KZVHh13
 m6lNScf4pkR6qFVfHeVL92hkKEjYmZ+il6+c3fZtFFavF/MZ1GQ6vPPwUQzu6MNEqHv5
 9XJg==
X-Gm-Message-State: AOAM5314TuGS4yLBvH9mnurpYuSVLtpQFxXgzcQk5xgn+S0e/3wPzher
 +W1mp/ENNCGLpeK84mHSZDBIh2IvyZY2Cw==
X-Google-Smtp-Source: ABdhPJwiR1sKMw7FCjDf/EDLesqmdVJ87MNDj3X8tvMf2f1P7RHtnql2BynJM2iACwPQPwD10VZvRA==
X-Received: by 2002:a05:6a00:82:b029:2e9:c6db:e16d with SMTP id
 c2-20020a056a000082b02902e9c6dbe16dmr16129301pfj.78.1624227050420; 
 Sun, 20 Jun 2021 15:10:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm11122961pgf.20.2021.06.20.15.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 15:10:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/7] target/nios2: Convert to TranslatorOps
Date: Sun, 20 Jun 2021 15:10:44 -0700
Message-Id: <20210620221046.1526418-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620221046.1526418-1-richard.henderson@linaro.org>
References: <20210620221046.1526418-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 130 ++++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 63 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 31653b7912..06705c894d 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -803,75 +803,72 @@ static void gen_exception(DisasContext *dc, uint32_t excp)
 }
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
     CPUNios2State *env = cs->env_ptr;
-    DisasContext dc1, *dc = &dc1;
-    int num_insns;
-
-    /* Initialize DC */
-
-    dc->base.tb = tb;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.pc_first = tb->pc;
-    dc->base.pc_next = tb->pc;
+    target_ulong pc = dc->base.pc_first;
+    int page_insns;
 
     dc->zero    = NULL;
-    dc->pc      = tb->pc;
+    dc->pc      = pc;
     dc->mem_idx = cpu_mmu_index(env, false);
 
-    /* Set up instruction counts */
-    num_insns = 0;
-    if (max_insns > 1) {
-        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & ~TARGET_PAGE_MASK)) / 4;
-        if (max_insns > page_insns) {
-            max_insns = page_insns;
-        }
-    }
+    /* Bound the number of insns to execute to those left on the page.  */
+    page_insns = -(pc | TARGET_PAGE_MASK) / 4;
+    dc->base.max_insns = MIN(page_insns, dc->base.max_insns);
+}
 
-    gen_tb_start(tb);
-    do {
-        tcg_gen_insn_start(dc->pc);
-        num_insns++;
+static void nios2_tr_tb_start(DisasContextBase *db, CPUState *cs)
+{
+}
 
-        if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
-            gen_exception(dc, EXCP_DEBUG);
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 4;
-            break;
-        }
+static void nios2_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
+{
+    tcg_gen_insn_start(dcbase->pc_next);
+}
 
-        if (num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
-            gen_io_start();
-        }
+static bool nios2_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
+                                      const CPUBreakpoint *bp)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-        /* Decode an instruction */
-        handle_instruction(dc, env);
+    gen_exception(dc, EXCP_DEBUG);
+    /*
+     * The address covered by the breakpoint must be included in
+     * [tb->pc, tb->pc + tb->size) in order to for it to be
+     * properly cleared -- thus we increment the PC here so that
+     * the logic setting tb->size below does the right thing.
+     */
+    dc->pc += 4;
+    return true;
+}
 
-        dc->pc += 4;
+static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+    CPUNios2State *env = cs->env_ptr;
 
-        /* Translation stops when a conditional branch is encountered.
-         * Otherwise the subsequent code could get translated several times.
-         * Also stop translation when a page boundary is reached.  This
-         * ensures prefetch aborts occur at the right place.  */
-    } while (!dc->base.is_jmp &&
-             !tcg_op_buf_full() &&
-             num_insns < max_insns);
+    /* Decode an instruction */
+    handle_instruction(dc, env);
+
+    dc->base.pc_next += 4;
+    dc->pc += 4;
+}
+
+static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     /* Indicate where the next block should start */
     switch (dc->base.is_jmp) {
-    case DISAS_NEXT:
+    case DISAS_TOO_MANY:
     case DISAS_UPDATE:
         /* Save the current PC back into the CPU register */
         tcg_gen_movi_tl(cpu_R[R_PC], dc->pc);
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-    default:
     case DISAS_JUMP:
         /* The jump will already have updated the PC register */
         tcg_gen_exit_tb(NULL, 0);
@@ -880,25 +877,32 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     case DISAS_NORETURN:
         /* nothing more to generate */
         break;
+
+    default:
+        g_assert_not_reached();
     }
+}
 
-    /* End off the block */
-    gen_tb_end(tb, num_insns);
+static void nios2_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+{
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+}
 
-    /* Mark instruction starts for the final generated instruction */
-    tb->size = dc->pc - tb->pc;
-    tb->icount = num_insns;
+static const TranslatorOps nios2_tr_ops = {
+    .init_disas_context = nios2_tr_init_disas_context,
+    .tb_start           = nios2_tr_tb_start,
+    .insn_start         = nios2_tr_insn_start,
+    .breakpoint_check   = nios2_tr_breakpoint_check,
+    .translate_insn     = nios2_tr_translate_insn,
+    .tb_stop            = nios2_tr_tb_stop,
+    .disas_log          = nios2_tr_disas_log,
+};
 
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(tb->pc)) {
-        FILE *logfile = qemu_log_lock();
-        qemu_log("IN: %s\n", lookup_symbol(tb->pc));
-        log_target_disas(cs, tb->pc, dc->pc - tb->pc);
-        qemu_log("\n");
-        qemu_log_unlock(logfile);
-    }
-#endif
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+{
+    DisasContext dc;
+    translator_loop(&nios2_tr_ops, &dc.base, cs, tb, max_insns);
 }
 
 void nios2_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.25.1


