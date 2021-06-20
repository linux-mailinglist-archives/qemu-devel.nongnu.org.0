Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E113ADD3D
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 07:29:56 +0200 (CEST)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luq1r-0006VZ-9t
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 01:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxv-0006zq-AV
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:52 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lupxt-00087g-1o
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 01:25:51 -0400
Received: by mail-pj1-x102e.google.com with SMTP id l11so3677364pji.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 22:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZMDiz1uJRUfkvRYthCZ9wMCmBUdbqiifzXnkr5GMDc=;
 b=FDgFhguq6DQpgquIE9tA+cTz3fKjG3DVx0ZHKhXZmpW/FxCrnBKmcFhCD0obDDJ9pG
 RbH5lBdf/kyj9bvWIqCPgU1b8X0KEoUkocq0o+9/ZTpPCplJy7v3tUv3pMYYI7h55mIR
 b2gwC4uuILHz+LMQ6KBHwf/mt3xkOtG/DDruLQ5Km7oyH9Z/0ESxmRmDVAEe+QZsjH9T
 vDR+Z3KsC3qVVK3e41xax4LbpQdJPc9MPFhPbHoZ8vhxAagLMTx7Q8HNleRT87KYLgKR
 bDIdM13YV8mbon5nv313gJ2UAzrVikzidWNpig1OeDqDg3KKfYnknb+jVrzjObuMyLcx
 Dm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZMDiz1uJRUfkvRYthCZ9wMCmBUdbqiifzXnkr5GMDc=;
 b=FTeNIhH5EiugIjYITyZFuktEWrf0x7lEUoqA1oC5L9L7AfU/Bmq2bY54SfDzF3zrpJ
 0uNophZ3Si1I+1HN5jG3lxqb4Htb5QdR/fG3H9DEBtqoykYpbxJyXgzK1FEh1cZNvM5z
 5n9410oivQIioPe/T9gfiSrrKgufDtfJlHvTQ/USguuGYiUWiMfkD3yp0T4EoQF6zJvJ
 MoeA2OrfmcaHv9jf2moOpjb7tp4BufnbXgRwYzoRkCxGmkY5MZ+I1RoRxmcLP9G3tsxf
 fb00PtD5ordBgtkodSdWLEDhuxFAidg6T5ztg+9ojRCh2dsN9QD/8Sl2rLaw5flcTjqg
 jmKg==
X-Gm-Message-State: AOAM5309X9vuwdzD3CDu/IsooVn9DytGlaxEfXdU/04kXXCuY4eB1EZt
 0aGsm6T1bq2JXeAI9xJa5FDR8E5TF0Fx7A==
X-Google-Smtp-Source: ABdhPJxn6ir/t43NF/HODdgo/mfITd/8VhB/MK6MVVBXPmKQRSYF4vrKhy+Le1ZZsZVTEIMR6TAGew==
X-Received: by 2002:a17:902:9a4c:b029:119:d507:dccd with SMTP id
 x12-20020a1709029a4cb0290119d507dccdmr11961667plv.55.1624166747694; 
 Sat, 19 Jun 2021 22:25:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm11409741pfh.103.2021.06.19.22.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 22:25:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] target/nios2: Convert to TranslatorOps
Date: Sat, 19 Jun 2021 22:25:41 -0700
Message-Id: <20210620052543.1315091-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620052543.1315091-1-richard.henderson@linaro.org>
References: <20210620052543.1315091-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 129 +++++++++++++++++++++------------------
 1 file changed, 68 insertions(+), 61 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 31653b7912..e2c8151193 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -803,75 +803,75 @@ static void gen_exception(DisasContext *dc, uint32_t excp)
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
 
     dc->zero    = NULL;
-    dc->pc      = tb->pc;
+    dc->pc      = pc;
     dc->mem_idx = cpu_mmu_index(env, false);
 
     /* Set up instruction counts */
-    num_insns = 0;
-    if (max_insns > 1) {
-        int page_insns = (TARGET_PAGE_SIZE - (tb->pc & ~TARGET_PAGE_MASK)) / 4;
-        if (max_insns > page_insns) {
-            max_insns = page_insns;
-        }
+    if (singlestep || dc->base.singlestep_enabled) {
+        dc->base.max_insns = 1;
+    } else {
+        int page_insns = (TARGET_PAGE_SIZE - (pc & ~TARGET_PAGE_MASK)) / 4;
+        dc->base.max_insns = MIN(page_insns, dc->base.max_insns);
     }
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
@@ -880,25 +880,32 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
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


