Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6EB35E81B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:18:37 +0200 (CEST)
Received: from localhost ([::1]:60184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQQc-0001AR-Lv
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQMA-0007dJ-0l; Tue, 13 Apr 2021 17:13:58 -0400
Received: from [201.28.113.2] (port=27024 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWQM7-0007YY-Ey; Tue, 13 Apr 2021 17:13:57 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 13 Apr 2021 18:13:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 0958E8011B4;
 Tue, 13 Apr 2021 18:13:42 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 4/5] target/ppc: Base changes to allow 32/64-bit insns
Date: Tue, 13 Apr 2021 18:11:28 -0300
Message-Id: <20210413211129.457272-5-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413211129.457272-1-luis.pires@eldorado.org.br>
References: <20210413211129.457272-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Apr 2021 21:13:42.0344 (UTC)
 FILETIME=[E19C4480:01D730A9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org,
 Luis Pires <luis.pires@eldorado.org.br>, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These changes add the basic support for 32- and 64-bit instruction
decoding using decodetree.

Apart from the instruction decoding itself, it also takes care of
some pre-requisite changes, such as removing hard-coded instruction
sizes throughout the code and raising an alignment exception should
a prefixed instruction cross a 64-byte boundary.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 target/ppc/cpu.h       |   1 +
 target/ppc/meson.build |   5 ++
 target/ppc/ppc.decode  |  18 ++++
 target/ppc/translate.c | 191 ++++++++++++++++++++++++++++++++---------
 4 files changed, 174 insertions(+), 41 deletions(-)
 create mode 100644 target/ppc/ppc.decode

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e73416da68..9bb2805a22 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -148,6 +148,7 @@ enum {
     POWERPC_EXCP_ALIGN_PROT    = 0x04,  /* Access cross protection boundary  */
     POWERPC_EXCP_ALIGN_BAT     = 0x05,  /* Access cross a BAT/seg boundary   */
     POWERPC_EXCP_ALIGN_CACHE   = 0x06,  /* Impossible dcbz access            */
+    POWERPC_EXCP_ALIGN_INSN    = 0x07,  /* Pref. insn x-ing 64-byte boundary */
     /* Exception subtypes for POWERPC_EXCP_PROGRAM                           */
     /* FP exceptions                                                         */
     POWERPC_EXCP_FP            = 0x10,
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..feed383a2b 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -1,4 +1,9 @@
+gen = [
+  decodetree.process('ppc.decode', extra_args: ['--varinsnwidth=64', '--noloadfunc'])
+]
+
 ppc_ss = ss.source_set()
+ppc_ss.add(gen)
 ppc_ss.add(files(
   'cpu-models.c',
   'cpu.c',
diff --git a/target/ppc/ppc.decode b/target/ppc/ppc.decode
new file mode 100644
index 0000000000..84bb73ac19
--- /dev/null
+++ b/target/ppc/ppc.decode
@@ -0,0 +1,18 @@
+#
+# Power ISA instruction decode definitions.
+#
+# Copyright (c) 2021 Luis Pires <luis.pires@eldorado.org.br>
+#
+# This library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# This library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with this library; if not, see <http://www.gnu.org/licenses/>.
+#
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0984ce637b..0f123f7b80 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -154,6 +154,11 @@ void ppc_translate_init(void)
 /* internal defines */
 struct DisasContext {
     DisasContextBase base;
+
+    /*
+     * 'opcode' should be considered deprecated and be used only
+     * by legacy non-decodetree code
+     */
     uint32_t opcode;
     uint32_t exception;
     /* Routine used to access memory */
@@ -180,6 +185,8 @@ struct DisasContext {
     uint32_t flags;
     uint64_t insns_flags;
     uint64_t insns_flags2;
+    target_ulong insn_size;
+    CPUPPCState *env;
 };
 
 /* Return true iff byteswap is needed in a scalar memop */
@@ -199,6 +206,10 @@ static inline bool need_byteswap(const DisasContext *ctx)
 # define NARROW_MODE(C)  0
 #endif
 
+#if defined(DO_PPC_STATISTICS)
+static uint64_t ppc_decodetree_hit_count;
+#endif
+
 struct opc_handler_t {
     /* invalid bits for instruction 1 (Rc(opcode) == 0) */
     uint32_t inval1;
@@ -254,7 +265,7 @@ static void gen_exception_err(DisasContext *ctx, uint32_t excp, uint32_t error)
      * faulting instruction
      */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->base.pc_next - ctx->insn_size);
     }
     t0 = tcg_const_i32(excp);
     t1 = tcg_const_i32(error);
@@ -273,7 +284,7 @@ static void gen_exception(DisasContext *ctx, uint32_t excp)
      * faulting instruction
      */
     if (ctx->exception == POWERPC_EXCP_NONE) {
-        gen_update_nip(ctx, ctx->base.pc_next - 4);
+        gen_update_nip(ctx, ctx->base.pc_next - ctx->insn_size);
     }
     t0 = tcg_const_i32(excp);
     gen_helper_raise_exception(cpu_env, t0);
@@ -3113,7 +3124,8 @@ static void gen_eieio(DisasContext *ctx)
          */
         if (!(ctx->insns_flags2 & PPC2_ISA300)) {
             qemu_log_mask(LOG_GUEST_ERROR, "invalid eieio using bit 6 at @"
-                          TARGET_FMT_lx "\n", ctx->base.pc_next - 4);
+                          TARGET_FMT_lx "\n",
+                          ctx->base.pc_next - ctx->insn_size);
         } else {
             bar = TCG_MO_ST_LD;
         }
@@ -3782,14 +3794,14 @@ static void gen_b(DisasContext *ctx)
     li = LI(ctx->opcode);
     li = (li ^ 0x02000000) - 0x02000000;
     if (likely(AA(ctx->opcode) == 0)) {
-        target = ctx->base.pc_next + li - 4;
+        target = ctx->base.pc_next + li - ctx->insn_size;
     } else {
         target = li;
     }
     if (LK(ctx->opcode)) {
         gen_setlr(ctx, ctx->base.pc_next);
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->base.pc_next - ctx->insn_size);
     gen_goto_tb(ctx, 0, target);
 }
 
@@ -3888,11 +3900,11 @@ static void gen_bcond(DisasContext *ctx, int type)
         }
         tcg_temp_free_i32(temp);
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->base.pc_next - ctx->insn_size);
     if (type == BCOND_IM) {
         target_ulong li = (target_long)((int16_t)(BD(ctx->opcode)));
         if (likely(AA(ctx->opcode) == 0)) {
-            gen_goto_tb(ctx, 0, ctx->base.pc_next + li - 4);
+            gen_goto_tb(ctx, 0, ctx->base.pc_next + li - ctx->insn_size);
         } else {
             gen_goto_tb(ctx, 0, li);
         }
@@ -4008,7 +4020,7 @@ static void gen_rfi(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->base.pc_next - ctx->insn_size);
     gen_helper_rfi(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -4025,7 +4037,7 @@ static void gen_rfid(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->base.pc_next - ctx->insn_size);
     gen_helper_rfid(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -4042,7 +4054,7 @@ static void gen_rfscv(DisasContext *ctx)
     if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
         gen_io_start();
     }
-    gen_update_cfar(ctx, ctx->base.pc_next - 4);
+    gen_update_cfar(ctx, ctx->base.pc_next - ctx->insn_size);
     gen_helper_rfscv(cpu_env);
     gen_sync_exception(ctx);
 #endif
@@ -4338,7 +4350,7 @@ static inline void gen_op_mfspr(DisasContext *ctx)
             if (sprn != SPR_PVR) {
                 qemu_log_mask(LOG_GUEST_ERROR, "Trying to read privileged spr "
                               "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
-                              ctx->base.pc_next - 4);
+                              ctx->base.pc_next - ctx->insn_size);
             }
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
@@ -4352,7 +4364,8 @@ static inline void gen_op_mfspr(DisasContext *ctx)
         /* Not defined */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Trying to read invalid spr %d (0x%03x) at "
-                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
+                      TARGET_FMT_lx "\n", sprn, sprn,
+                      ctx->base.pc_next - ctx->insn_size);
 
         /*
          * The behaviour depends on MSR:PR and SPR# bit 0x10, it can
@@ -4516,7 +4529,7 @@ static void gen_mtspr(DisasContext *ctx)
             /* Privilege exception */
             qemu_log_mask(LOG_GUEST_ERROR, "Trying to write privileged spr "
                           "%d (0x%03x) at " TARGET_FMT_lx "\n", sprn, sprn,
-                          ctx->base.pc_next - 4);
+                          ctx->base.pc_next - ctx->insn_size);
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
     } else {
@@ -4530,7 +4543,8 @@ static void gen_mtspr(DisasContext *ctx)
         /* Not defined */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "Trying to write invalid spr %d (0x%03x) at "
-                      TARGET_FMT_lx "\n", sprn, sprn, ctx->base.pc_next - 4);
+                      TARGET_FMT_lx "\n", sprn, sprn,
+                      ctx->base.pc_next - ctx->insn_size);
 
 
         /*
@@ -6900,6 +6914,60 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
     tcg_gen_st_i64(src, cpu_env, avr64_offset(regno, high));
 }
 
+/*
+ * Check if a given 32-bit value is a prefix for a 64-bit instruction.
+ */
+static inline int is_insn_prefix(uint32_t insn)
+{
+    return (opc1(insn) == 0x01);
+}
+
+/*
+ * Load a 32- or 64-bit instruction.
+ *
+ * 32-bit instructions are returned in the higher 32-bits
+ */
+static uint64_t ppc_load_insn(DisasContext *ctx)
+{
+    uint64_t insn;
+    uint32_t insn_part;
+
+    /* read 4 bytes */
+    insn_part = translator_ldl_swap(ctx->env, ctx->base.pc_next,
+                                    need_byteswap(ctx));
+    insn = ((uint64_t)insn_part) << 32;
+    ctx->base.pc_next += 4;
+    ctx->insn_size = 4;
+
+    if (is_insn_prefix(insn_part)) {
+        /* read 4 more bytes */
+        insn_part = translator_ldl_swap(ctx->env, ctx->base.pc_next,
+                                        need_byteswap(ctx));
+        insn |= insn_part;
+
+        ctx->base.pc_next += 4;
+        ctx->insn_size += 4;
+    }
+
+    return insn;
+}
+
+/*
+ * Peek at the next instruction's size.
+ */
+static target_ulong ppc_peek_next_insn_size(DisasContext *ctx)
+{
+    uint32_t insn_part;
+
+    /* read 4 bytes */
+    insn_part = translator_ldl_swap(ctx->env, ctx->base.pc_next,
+                                    need_byteswap(ctx));
+
+    return is_insn_prefix(insn_part) ? 8 : 4;
+}
+
+#include "decode-ppc.c.inc"
+
 #include "translate/fp-impl.c.inc"
 
 #include "translate/vmx-impl.c.inc"
@@ -7832,7 +7900,7 @@ void ppc_cpu_dump_statistics(CPUState *cs, int flags)
     opc_handler_t **t1, **t2, **t3, *handler;
     int op1, op2, op3;
 
-    t1 = cpu->env.opcodes;
+    t1 = cpu->opcodes;
     for (op1 = 0; op1 < 64; op1++) {
         handler = t1[op1];
         if (is_indirect_opcode(handler)) {
@@ -7872,6 +7940,10 @@ void ppc_cpu_dump_statistics(CPUState *cs, int flags)
                         handler->count, handler->count);
         }
     }
+
+    qemu_printf("decodetree: "
+                "%016" PRIx64 " %" PRId64 "\n",
+                ppc_decodetree_hit_count, ppc_decodetree_hit_count);
 #endif
 }
 
@@ -7879,7 +7951,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUPPCState *env = cs->env_ptr;
-    int bound;
 
     ctx->exception = POWERPC_EXCP_NONE;
     ctx->spr_cb = env->spr_cb;
@@ -7961,8 +8032,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     msr_se = 1;
 #endif
 
-    bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-    ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
+    ctx->env = env;
 }
 
 static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -7979,37 +8049,31 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
 
+    target_ulong insn_size = ppc_peek_next_insn_size(ctx);
+
     gen_debug_exception(ctx);
     dcbase->is_jmp = DISAS_NORETURN;
     /*
      * The address covered by the breakpoint must be included in
      * [tb->pc, tb->pc + tb->size) in order to for it to be properly
-     * cleared -- thus we increment the PC here so that the logic
-     * setting tb->size below does the right thing.
+     * cleared -- thus we increment the PC here.
      */
-    ctx->base.pc_next += 4;
+    ctx->base.pc_next += insn_size;
     return true;
 }
 
-static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+/*
+ * Legacy (non-decodetree) 32-bit instruction translation code.
+ *
+ * Any new instructions should be implemented using the decode tree,
+ * and not use this code.
+ */
+static void ppc_tr_translate_insn_legacy(DisasContext *ctx, CPUState *cs)
 {
-    DisasContext *ctx = container_of(dcbase, DisasContext, base);
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = cs->env_ptr;
     opc_handler_t **table, *handler;
 
-    LOG_DISAS("----------------\n");
-    LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
-              ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
-
-    ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
-                                      need_byteswap(ctx));
-
-    LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) (%s)\n",
-              ctx->opcode, opc1(ctx->opcode), opc2(ctx->opcode),
-              opc3(ctx->opcode), opc4(ctx->opcode),
-              ctx->le_mode ? "little" : "big");
-    ctx->base.pc_next += 4;
     table = cpu->opcodes;
     handler = table[opc1(ctx->opcode)];
     if (is_indirect_opcode(handler)) {
@@ -8031,7 +8095,8 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                       TARGET_FMT_lx " %d\n",
                       opc1(ctx->opcode), opc2(ctx->opcode),
                       opc3(ctx->opcode), opc4(ctx->opcode),
-                      ctx->opcode, ctx->base.pc_next - 4, (int)msr_ir);
+                      ctx->opcode, ctx->base.pc_next - ctx->insn_size,
+                      (int)msr_ir);
     } else {
         uint32_t inval;
 
@@ -8048,7 +8113,7 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
                           TARGET_FMT_lx "\n", ctx->opcode & inval,
                           opc1(ctx->opcode), opc2(ctx->opcode),
                           opc3(ctx->opcode), opc4(ctx->opcode),
-                          ctx->opcode, ctx->base.pc_next - 4);
+                          ctx->opcode, ctx->base.pc_next - ctx->insn_size);
             gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
             ctx->base.is_jmp = DISAS_NORETURN;
             return;
@@ -8067,11 +8132,55 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         uint32_t excp = gen_prep_dbgex(ctx);
         gen_exception_nip(ctx, excp, ctx->base.pc_next);
     }
+}
 
-    if (tcg_check_temp_count()) {
-        qemu_log("Opcode %02x %02x %02x %02x (%08x) leaked "
-                 "temporaries\n", opc1(ctx->opcode), opc2(ctx->opcode),
-                 opc3(ctx->opcode), opc4(ctx->opcode), ctx->opcode);
+static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+{
+#if defined(PPC_DEBUG_DISAS)
+    /* env is needed by LOG_DISAS */
+    CPUPPCState *env = cs->env_ptr;
+#endif
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    uint64_t insn;
+
+    LOG_DISAS("----------------\n");
+    LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
+              ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
+
+    /* load the next insn, keeping track of the insn size */
+    insn = ppc_load_insn(ctx);
+
+    if (unlikely(ctx->insn_size == 8 &&
+                 (ctx->base.pc_next & 0x3f) == 0x04)) {
+        /*
+         * Raise alignment exception when a 64-bit insn crosses a
+         * 64-byte boundary
+         */
+        gen_exception_err(ctx, POWERPC_EXCP_ALIGN, POWERPC_EXCP_ALIGN_INSN);
+    } else {
+        LOG_DISAS("translate opcode %016" PRIx64 " (%s)\n",
+                  insn, ctx->le_mode ? "little" : "big");
+
+        if (!decode(ctx, insn)) {
+            /*
+             * Instruction not found in decode tree.
+             * Fall back to legacy 32-bit instruction code.
+             *
+             * ppc_load_insn() keeps 32-bit instructions in the high
+             * 32-bits of insn.
+             */
+            ctx->opcode = (uint32_t)(insn >> 32);
+            ppc_tr_translate_insn_legacy(ctx, cs);
+        } else {
+#if defined(DO_PPC_STATISTICS)
+            ppc_decodetree_hit_count++;
+#endif
+        }
+
+        if (tcg_check_temp_count()) {
+            qemu_log("Opcode (%016" PRIx64 ") leaked "
+                     "temporaries\n", insn);
+        }
     }
 
     ctx->base.is_jmp = ctx->exception == POWERPC_EXCP_NONE ?
-- 
2.25.1


