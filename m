Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9353B78C3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:37:43 +0200 (CEST)
Received: from localhost ([::1]:46782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJYE-0001FM-PH
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItA-0007zQ-CQ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:16 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIsu-0000r4-LT
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:11 -0400
Received: by mail-pf1-x436.google.com with SMTP id c5so90057pfv.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmxrOHZpSFj7JKNDeodYwqrJCJWQuRYw5m+Zqx3aVjs=;
 b=yac47MRFCKHKskEwMeKBvakn9qRM0Orp7ZqDBMCz6pN6ANph1hBcDdep/OpwnRyKGU
 8bHCnRBjbyb0JLMEzI3Ni7+Mgp0cKfRUTf8siWsyGIjVV8rsmtzsG4+XzWHyLsVysZ+O
 Cs5YSSsRYKJa+ue09kPRvzMUXorZYmHuf6Q2sipCP/nul24htT6bp9Sz6kVPPqJcmFBv
 voeRW/Jppv4fUdqftNRsuhka/r6U4SjzLqdsYsU4E+QGuChSCl3mcLlsSGbCL9fQ23uS
 e4QyZV0FQA5B85b21BgEXFEZ5xD99GolVA+fv4kzRKRGnYhn1Uf9U4mWrFZif7jj4aid
 FFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmxrOHZpSFj7JKNDeodYwqrJCJWQuRYw5m+Zqx3aVjs=;
 b=pSCAqp00TNecC0cQZHWmNytnCxYPUd8hoZTLoszsVudpRxXbG5kU0zu2ZbjHaE94rH
 Hv8klSS0GY/feZhguvh1D796NoIjNbMR1IA8IGvf+mjVpLLBxo9VaxX6BXPhN/4ftRgH
 zmReU9sVi3++dZNzg5y+Nd8EWTlcjdhPvui2eGYgb6x1vIk1WRs2sMe13uU8mvSrtDkY
 +K2QrXd5jFSUcZYHOCR6smXNBSOO0OqTcz1t2f9VLkojXPYhM/GVTm8Yqwg6OFXBdT4r
 xdfkGRB/3/5aWzVxhIePYpQLI7KLu88bHoCLRKJi8qgUX1c9nzzSvoyQB7TAewqJZDGs
 2arg==
X-Gm-Message-State: AOAM531HpYzgS+MQ7wi0B+oy0RaIRS09KbIfQDxuGMPu0ExC6/xo2Y/y
 hbj+kIJ5UyPqM5OYFxy/CdhxKXQrcPsNMQ==
X-Google-Smtp-Source: ABdhPJw8+kgCJb59f6p8pL77AAyWTASZidLHJCv0m2li+bptev+oUFTuUxkD70YttGR87Lgae2u4Kg==
X-Received: by 2002:a65:41c6:: with SMTP id b6mr29807514pgq.206.1624992899013; 
 Tue, 29 Jun 2021 11:54:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:54:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/63] target/nios2: Convert to TranslatorOps
Date: Tue, 29 Jun 2021 11:53:57 -0700
Message-Id: <20210629185455.3131172-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 128 ++++++++++++++++++++-------------------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 64cba02230..66f4c25b06 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -803,74 +803,69 @@ static void gen_exception(DisasContext *dc, uint32_t excp)
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
+    int page_insns;
 
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
+    page_insns = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
+    dc->base.max_insns = MIN(page_insns, dc->base.max_insns);
+}
 
-    gen_tb_start(tb);
-    do {
-        tcg_gen_insn_start(dc->base.pc_next);
-        num_insns++;
+static void nios2_tr_tb_start(DisasContextBase *db, CPUState *cs)
+{
+}
 
-        if (unlikely(cpu_breakpoint_test(cs, dc->base.pc_next, BP_ANY))) {
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
 
-        dc->pc = dc->base.pc_next;
-        dc->base.pc_next += 4;
+    gen_exception(dc, EXCP_DEBUG);
+    /*
+     * The address covered by the breakpoint must be included in
+     * [tb->pc, tb->pc + tb->size) in order to for it to be
+     * properly cleared -- thus we increment the PC here so that
+     * the logic setting tb->size below does the right thing.
+     */
+    dc->base.pc_next += 4;
+    return true;
+}
 
-        /* Decode an instruction */
-        handle_instruction(dc, env);
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
+    dc->pc = dc->base.pc_next;
+    dc->base.pc_next += 4;
+
+    /* Decode an instruction */
+    handle_instruction(dc, env);
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
         tcg_gen_movi_tl(cpu_R[R_PC], dc->base.pc_next);
         tcg_gen_exit_tb(NULL, 0);
         break;
 
-    default:
     case DISAS_JUMP:
         /* The jump will already have updated the PC register */
         tcg_gen_exit_tb(NULL, 0);
@@ -879,25 +874,32 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
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
-    tb->size = dc->base.pc_next - dc->base.pc_first;
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
-        && qemu_log_in_addr_range(dc->base.pc_first)) {
-        FILE *logfile = qemu_log_lock();
-        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
-        log_target_disas(cs, tb->pc, tb->size);
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


