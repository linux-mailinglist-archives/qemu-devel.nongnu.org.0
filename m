Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE3D37D3D4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:25:22 +0200 (CEST)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguTx-0006PZ-01
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu40-0000Nc-32; Wed, 12 May 2021 14:58:32 -0400
Received: from [201.28.113.2] (port=47887 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu3y-0000ms-8F; Wed, 12 May 2021 14:58:31 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6A64F8000C2;
 Wed, 12 May 2021 15:56:05 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 20/31] target/ppc: Add infrastructure for prefixed insns
Date: Wed, 12 May 2021 15:54:30 -0300
Message-Id: <20210512185441.3619828-21-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:05.0797 (UTC)
 FILETIME=[764DED50:01D74760]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu.h                           |  1 +
 target/ppc/insn32.decode                   | 18 ++++++++++++
 target/ppc/insn64.decode                   | 18 ++++++++++++
 target/ppc/meson.build                     |  9 ++++++
 target/ppc/translate.c                     | 34 +++++++++++++++++++---
 target/ppc/translate/fixedpoint-impl.c.inc | 18 ++++++++++++
 6 files changed, 94 insertions(+), 4 deletions(-)
 create mode 100644 target/ppc/insn32.decode
 create mode 100644 target/ppc/insn64.decode
 create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1c3486e9d0..55cd0d0f88 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -144,6 +144,7 @@ enum {
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
index 4079d01ee3..3ad5986b33 100644
--- a/target/ppc/meson.build
+++ b/target/ppc/meson.build
@@ -16,6 +16,15 @@ ppc_ss.add(files(
 
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
index dec2ff1886..64a99ff2c0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7779,6 +7779,10 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
 # define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
 #endif
 
+#include "decode-insn32.c.inc"
+#include "decode-insn64.c.inc"
+#include "translate/fixedpoint-impl.c.inc"
+
 #include "translate/fp-impl.c.inc"
 
 #include "translate/vmx-impl.c.inc"
@@ -9280,11 +9284,18 @@ static bool ppc_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
     return true;
 }
 
+static bool is_prefix_insn(DisasContext *ctx, uint32_t insn)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
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
 
@@ -9292,11 +9303,26 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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


