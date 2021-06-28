Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95103B6ADF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 00:14:23 +0200 (CEST)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxzWJ-0005NE-1j
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 18:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQZ-00012C-ND
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:28 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:44913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxzQP-0006Hx-2W
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 18:08:27 -0400
Received: by mail-pg1-x52f.google.com with SMTP id u14so10223294pga.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3tDxaI2H5xjYJ55iHjN9L0W5aTfV98VXSBEeWlOUWBA=;
 b=CwPJvGglAREBrIxP+PmBOioeo0dNpuJrN0KHu3kVlBDxoAEeAiLrf02dSHiU4X3bc0
 As5qaFmL97p3SX6xrbsKgpoYaQEO0MDY8m0VTC+nXjsWWo20iHqvOux/XEYlMBcE8uA8
 T50NZjgEYZVhoJnYeW27RRYAK6XgZhuwV1Q5KdrDZhHv8Hl862dSU4R2cr7ug10wJW8N
 nV6lEsG4y+YRZ6GivpzkRRvqwgiOo01blBDp8OUOnG77tBsLUwYD714FVoDWq+VoTxPM
 oQ6EnZCQp56EW6gCkOoJLIgnoq5UMYExqD7rB1Z6wtg+N7qJX+AVGGxvgSec6BJNoeYj
 7stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tDxaI2H5xjYJ55iHjN9L0W5aTfV98VXSBEeWlOUWBA=;
 b=bH0H5QJQNwivMzpLQWGtKaaAD86/frCH2f4EEGSIoesUUgOGmpu7KBXOMsgShsBw6Y
 iotYRtbAtWbHj/9it+1vWesptTMdMJcBdJRUMI8pwNRVPCryPhE+u31YQ09NR3qUZpRI
 35j+mX4cxBihRXWTxpACR6MDLrdZ+T9vTcyV2okOSvPvyQEKr+yUNRv0TtmFWvodvzuY
 91c1YyK/+maevN9g9bXiP/PxMUIT8f4jcaoAkNsn2V03A/utXRVU2H9JVBAghdauyHTz
 YzELsXLvaEQUh7TzY3U8J1IFBitYWxCgafVToOTXmDa4r28Q9gnMTZgJ/AISQ6A+ZnOJ
 AgxA==
X-Gm-Message-State: AOAM533BeO3uMb4nRsVNFoNbV3ibZyn/LNSulXhMtvzymi9oRGUDDegm
 xLM5xfDQzyJbMP3tN14IYtnyjpapcIoNig==
X-Google-Smtp-Source: ABdhPJy8iGShOr1feXMCiW951UIznoFwunNIuW1+aM1a41PWk9/8OLTVk9cFFYqJgfVGuHdAYnm1cw==
X-Received: by 2002:a62:2ec7:0:b029:301:fe50:7d4b with SMTP id
 u190-20020a622ec70000b0290301fe507d4bmr26665663pfu.78.1624918095056; 
 Mon, 28 Jun 2021 15:08:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l6sm16030164pgh.34.2021.06.28.15.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 15:08:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/9] target/nios2: Convert to TranslatorOps
Date: Mon, 28 Jun 2021 15:08:06 -0700
Message-Id: <20210628220810.2919600-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210628220810.2919600-1-richard.henderson@linaro.org>
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 target/nios2/translate.c | 128 ++++++++++++++++++++-------------------
 1 file changed, 65 insertions(+), 63 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 12f987651a..66f4c25b06 100644
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
-    tb->size = dc->pc - dc->base.pc_first;
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
-        log_target_disas(cs, tb->pc, dc->base.pc_next - dc->base.pc_first);
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


