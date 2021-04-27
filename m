Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543AE36CA66
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:34:49 +0200 (CEST)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRbk-0003Am-DJ
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRM0-0001ia-09; Tue, 27 Apr 2021 13:18:33 -0400
Received: from [201.28.113.2] (port=48284 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRLw-00023I-4S; Tue, 27 Apr 2021 13:18:31 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 27 Apr 2021 14:16:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 5744980139F;
 Tue, 27 Apr 2021 14:16:53 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 08/15] target/ppc: Add infrastructure for prefixed insns
Date: Tue, 27 Apr 2021 14:16:42 -0300
Message-Id: <20210427171649.364699-9-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427171649.364699-1-luis.pires@eldorado.org.br>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2021 17:16:53.0559 (UTC)
 FILETIME=[1E4C3C70:01D73B89]
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 target/ppc/cpu.h                           |  1 +
 target/ppc/insn32.decode                   | 18 +++++++++
 target/ppc/insn64.decode                   | 18 +++++++++
 target/ppc/meson.build                     |  9 +++++
 target/ppc/translate.c                     | 45 +++++++++++++++++-----
 target/ppc/translate/fixedpoint-impl.c.inc | 18 +++++++++
 6 files changed, 99 insertions(+), 10 deletions(-)
 create mode 100644 target/ppc/insn32.decode
 create mode 100644 target/ppc/insn64.decode
 create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc

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
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
new file mode 100644
index 0000000000..b175441209
--- /dev/null
+++ b/target/ppc/insn32.decode
@@ -0,0 +1,18 @@
+#
+# Power ISA decode for 32-bit insns (opcode space 0)
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
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
new file mode 100644
index 0000000000..9fc45d0614
--- /dev/null
+++ b/target/ppc/insn64.decode
@@ -0,0 +1,18 @@
+#
+# Power ISA decode for 64-bit prefixed insns (opcode space 0 and 1)
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
diff --git a/target/ppc/meson.build b/target/ppc/meson.build
index bbfef90e08..e604e56c6a 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -15,6 +15,15 @@ ppc_ss.add(files(
 
 ppc_ss.add(libdecnumber)
 
+gen = [
+  decodetree.process('insn32.decode',
+                     extra_args: '--static-decode=decode_insn32'),
+  decodetree.process('insn64.decode',
+                     extra_args: ['--static-decode=decode_insn64',
+                                  '--insnwidth=64']),
+]
+ppc_ss.add(gen)
+
 ppc_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
 ppc_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user_only_helper.c'))
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index dd34f22704..83f08950b4 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6906,6 +6906,11 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
     tcg_gen_st_i64(src, cpu_env, avr64_offset(regno, high));
 }
 
+#include "decode-insn64.c.inc"
+#include "decode-insn32.c.inc"
+
+#include "translate/fixedpoint-impl.c.inc"
+
 #include "translate/fp-impl.c.inc"
 
 #include "translate/vmx-impl.c.inc"
@@ -7941,7 +7946,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPUPPCState *env = cs->env_ptr;
-    int bound;
 
     ctx->exception = POWERPC_EXCP_NONE;
     ctx->spr_cb = env->spr_cb;
@@ -8022,9 +8026,6 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     /* Single step trace mode */
     msr_se = 1;
 #endif
-
-    bound = -(ctx->base.pc_first | TARGET_PAGE_MASK) / 4;
-    ctx->base.max_insns = MIN(ctx->base.max_insns, bound);
 }
 
 static void ppc_tr_tb_start(DisasContextBase *db, CPUState *cs)
@@ -8052,11 +8053,18 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     return true;
 }
 
+static bool is_prefix_insn(DisasContext *ctx, uint32_t insn)
+{
+    /* TODO: Check ctx->insns_flags* for whether prefixes are supported. */
+    return opc1(insn) == 1;
+}
+
 static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = cs->env_ptr;
+    target_ulong pc;
     uint32_t insn;
     bool ok;
 
@@ -8064,11 +8072,26 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
-    ctx->cia = ctx->base.pc_next;
-    insn = translator_ldl_swap(env, ctx->base.pc_next, need_byteswap(ctx));
-    ctx->base.pc_next += 4;
+    ctx->cia = pc = ctx->base.pc_next;
+    insn = translator_ldl_swap(env, pc, need_byteswap(ctx));
+    ctx->base.pc_next = pc += 4;
 
-    ok = decode_legacy(cpu, ctx, insn);
+    if (!is_prefix_insn(ctx, insn)) {
+        ok = (decode_insn32(ctx, insn) ||
+              decode_legacy(cpu, ctx, insn));
+    } else if ((pc & 63) == 0) {
+        /*
+         * Power v3.1, section 1.9 Exceptions:
+         * attempt to execute a prefixed instruction that crosses a
+         * 64-byte address boundary (system alignment error).
+         */
+        gen_exception_err(ctx, POWERPC_EXCP_ALIGN, POWERPC_EXCP_ALIGN_INSN);
+        ok = true;
+    } else {
+        uint32_t insn2 = translator_ldl_swap(env, pc, need_byteswap(ctx));
+        ctx->base.pc_next = pc += 4;
+        ok = decode_insn64(ctx, deposit64(insn2, 32, 32, insn));
+    }
     if (!ok) {
         gen_invalid(ctx);
     }
@@ -8078,12 +8101,14 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 #endif
     /* Check trace mode exceptions */
     if (unlikely(ctx->singlestep_enabled & CPU_SINGLE_STEP &&
-                 (ctx->base.pc_next <= 0x100 || ctx->base.pc_next > 0xF00) &&
+                 (pc <= 0x100 || pc > 0xF00) &&
                  ctx->exception != POWERPC_SYSCALL &&
                  ctx->exception != POWERPC_EXCP_TRAP &&
                  ctx->exception != POWERPC_EXCP_BRANCH)) {
         uint32_t excp = gen_prep_dbgex(ctx);
-        gen_exception_nip(ctx, excp, ctx->base.pc_next);
+        gen_exception_nip(ctx, excp, pc);
+    } else if (ctx->base.is_jmp == DISAS_NEXT && !(pc & ~TARGET_PAGE_MASK)) {
+        ctx->base.is_jmp = DISAS_TOO_MANY;
     }
 
     translator_loop_temp_check(&ctx->base);
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
new file mode 100644
index 0000000000..b740083605
--- /dev/null
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -0,0 +1,18 @@
+/*
+ * Power ISA decode for Fixed-Point Facility instructions
+ *
+ * Copyright (c) 2021 Luis Pires <luis.pires@eldorado.org.br>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
-- 
2.25.1


