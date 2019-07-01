Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41497486F1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 17:24:55 +0200 (CEST)
Received: from localhost ([::1]:48434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hctV8-0001j2-Fd
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 11:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47233)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hcsjk-0004rD-Fv
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:35:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hcsjj-0000bI-6a
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:35:56 -0400
Received: from amazonia.uni-paderborn.de ([131.234.189.15]:34308)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1hcsji-0000as-W1
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:35:55 -0400
Received: from magmaria.uni-paderborn.de ([131.234.189.24]
 helo=localhost.localdomain)
 by mail.uni-paderborn.de with esmtp (Exim 4.89 amazonia)
 id 1hcsjh-0000Jd-7m; Mon, 17 Jun 2019 16:35:53 +0200
Received: from mail.uni-paderborn.de by magmaria with queue id 3427224-3;
 Mon, 17 Jun 2019 14:35:51 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 16:35:33 +0200
Message-Id: <20190617143533.15013-4-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617143533.15013-1-kbastian@mail.uni-paderborn.de>
References: <20190617143533.15013-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.6.17.142717, AntiVirus-Engine: 5.63.0,
 AntiVirus-Data: 2019.6.4.5630002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.15
Subject: [Qemu-devel] [PATCH 3/3] target/tricore: Use translate_loop
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
Cc: kbastian@mail.uni-paderborn.de, david.brenken@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 117 +++++++++++++++++++++++--------------
 1 file changed, 74 insertions(+), 43 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index b4e332777a..f3b297639a 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8763,7 +8763,7 @@ static void decode_32Bit_opc(DisasContext *ctx)
     }
 }
 
-static void decode_opc(DisasContext *ctx, int *is_branch)
+static void decode_opc(DisasContext *ctx)
 {
     /* 16-Bit Instruction */
     if ((ctx->opcode & 0x1) == 0) {
@@ -8776,56 +8776,87 @@ static void decode_opc(DisasContext *ctx, int *is_branch)
     }
 }
 
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+static void tricore_tr_init_disas_context(DisasContextBase *dcbase,
+                                          CPUState *cs)
 {
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUTriCoreState *env = cs->env_ptr;
-    DisasContext ctx;
-    target_ulong pc_start;
-    int num_insns = 0;
-
-    pc_start = tb->pc;
-    ctx.base.pc_next = pc_start;
-    ctx.base.tb = tb;
-    ctx.base.singlestep_enabled = cs->singlestep_enabled;
-    ctx.base.is_jmp = DISAS_NEXT;
-    ctx.mem_idx = cpu_mmu_index(env, false);
-    ctx.env = env;
-
-    tcg_clear_temp_count();
-    gen_tb_start(tb);
-    while (ctx.base.is_jmp == DISAS_NEXT) {
-        tcg_gen_insn_start(ctx.base.pc_next);
-        num_insns++;
-
-        ctx.opcode = cpu_ldl_code(env, ctx.base.pc_next);
-        decode_opc(&ctx, 0);
-
-        if (num_insns >= max_insns || tcg_op_buf_full()) {
-            gen_save_pc(ctx.pc_succ_insn);
-            tcg_gen_exit_tb(NULL, 0);
-            break;
+    ctx->base.pc_next = ctx->base.pc_first;
+    ctx->mem_idx = cpu_mmu_index(env, false);
+}
+
+static void tricore_tr_tb_start(DisasContextBase *db, CPUState *cpu)
+{
+}
+
+static void tricore_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    tcg_gen_insn_start(ctx->base.pc_next);
+}
+
+static bool tricore_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
+                                      const CPUBreakpoint *bp)
+{
+    return true;
+}
+
+static void tricore_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    CPUTriCoreState *env = cpu->env_ptr;
+
+    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+    decode_opc(ctx);
+    ctx->base.pc_next = ctx->pc_succ_insn;
+
+    if (ctx->base.is_jmp == DISAS_NEXT) {
+        target_ulong page_start;
+
+        page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
+        if (ctx->base.pc_next - page_start >= TARGET_PAGE_SIZE) {
+            ctx->base.is_jmp = DISAS_TOO_MANY;
         }
-        ctx.base.pc_next = ctx.pc_succ_insn;
     }
+}
 
-    gen_tb_end(tb, num_insns);
-    tb->size = ctx.base.pc_next - pc_start;
-    tb->icount = num_insns;
+static void tricore_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
-    if (tcg_check_temp_count()) {
-        printf("LEAK at %08x\n", env->PC);
+    switch (ctx->base.is_jmp) {
+    case DISAS_TOO_MANY:
+        gen_goto_tb(ctx, 0, ctx->base.pc_next);
+        break;
+    case DISAS_NORETURN:
+        break;
+    default:
+        g_assert_not_reached();
     }
+}
 
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(pc_start)) {
-        qemu_log_lock();
-        qemu_log("IN: %s\n", lookup_symbol(pc_start));
-        log_target_disas(cs, pc_start, ctx.base.pc_next - pc_start);
-        qemu_log("\n");
-        qemu_log_unlock();
-    }
-#endif
+static void tricore_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+{
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+    log_target_disas(cpu, dcbase->pc_first, dcbase->tb->size);
+}
+
+static const TranslatorOps tricore_tr_ops = {
+    .init_disas_context = tricore_tr_init_disas_context,
+    .tb_start           = tricore_tr_tb_start,
+    .insn_start         = tricore_tr_insn_start,
+    .breakpoint_check   = tricore_tr_breakpoint_check,
+    .translate_insn     = tricore_tr_translate_insn,
+    .tb_stop            = tricore_tr_tb_stop,
+    .disas_log          = tricore_tr_disas_log,
+};
+
+
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+{
+    DisasContext ctx;
+    translator_loop(&tricore_tr_ops, &ctx.base, cs, tb, max_insns);
 }
 
 void
-- 
2.22.0


