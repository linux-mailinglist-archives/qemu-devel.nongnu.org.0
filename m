Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7254F52F1D2
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 19:44:55 +0200 (CEST)
Received: from localhost ([::1]:37908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns6gI-0000bC-IS
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 13:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ns6XK-0002Y2-Id; Fri, 20 May 2022 13:35:38 -0400
Received: from [187.72.171.209] (port=3625 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ns6XI-0000WH-3A; Fri, 20 May 2022 13:35:37 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 20 May 2022 14:34:27 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4402F8000A0;
 Fri, 20 May 2022 14:34:27 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PATCH 1/3] target/ppc: Move tlbie to decode tree
Date: Fri, 20 May 2022 14:33:44 -0300
Message-Id: <20220520173346.20807-2-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520173346.20807-1-leandro.lupori@eldorado.org.br>
References: <20220520173346.20807-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 20 May 2022 17:34:27.0747 (UTC)
 FILETIME=[DAEB8F30:01D86C6F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also decode RIC, PRS and R operands.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/cpu_init.c                        |  4 +-
 target/ppc/insn32.decode                     |  7 ++
 target/ppc/translate.c                       | 42 +---------
 target/ppc/translate/storage-ctrl-impl.c.inc | 81 ++++++++++++++++++++
 4 files changed, 92 insertions(+), 42 deletions(-)
 create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 527ad40fcb..246b9587f5 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6368,7 +6368,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                        PPC_FLOAT_EXT |
                        PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
                        PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
                        PPC_SEGMENT_64B | PPC_SLBI |
                        PPC_POPCNTB | PPC_POPCNTWD |
@@ -6585,7 +6585,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                        PPC_FLOAT_EXT |
                        PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
-                       PPC_MEM_TLBSYNC |
+                       PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
                        PPC_64B | PPC_64H | PPC_64BX | PPC_ALTIVEC |
                        PPC_SEGMENT_64B | PPC_SLBI |
                        PPC_POPCNTB | PPC_POPCNTWD |
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 39372fe673..fdfd24e8bd 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -710,3 +710,10 @@ XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
 &XL_s           s:uint8_t
 @XL_s           ......-------------- s:1 .......... -   &XL_s
 RFEBB           010011-------------- .   0010010010 -   @XL_s
+
+## TLB Management Instructions
+
+&X_tlbie        rb rs ric prs:bool r:bool
+@X_tlbie        ...... rs:5 - ric:2 prs:1 r:1 rb:5 .......... .     &X_tlbie
+
+TLBIE           011111 ..... - .. . . ..... 0100110010 -            @X_tlbie
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index fa34f81c30..662bd20de5 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5413,44 +5413,6 @@ static void gen_tlbiel(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-/* tlbie */
-static void gen_tlbie(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV;
-#else
-    bool psr = (ctx->opcode >> 17) & 0x1;
-    TCGv_i32 t1;
-
-    if (ctx->pr) {
-        /* tlbie is privileged... */
-        GEN_PRIV;
-    } else if (!ctx->hv) {
-        if (!ctx->gtse || (!psr && ctx->hr)) {
-            /*
-             * ... except when GTSE=0 or when PSR=0 and HR=1, making it
-             * hypervisor privileged.
-             */
-            GEN_PRIV;
-        }
-    }
-
-    if (NARROW_MODE(ctx)) {
-        TCGv t0 = tcg_temp_new();
-        tcg_gen_ext32u_tl(t0, cpu_gpr[rB(ctx->opcode)]);
-        gen_helper_tlbie(cpu_env, t0);
-        tcg_temp_free(t0);
-    } else {
-        gen_helper_tlbie(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-    }
-    t1 = tcg_temp_new_i32();
-    tcg_gen_ld_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
-    tcg_gen_ori_i32(t1, t1, TLB_NEED_GLOBAL_FLUSH);
-    tcg_gen_st_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
-    tcg_temp_free_i32(t1);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* tlbsync */
 static void gen_tlbsync(DisasContext *ctx)
 {
@@ -6668,6 +6630,8 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
 
 #include "translate/branch-impl.c.inc"
 
+#include "translate/storage-ctrl-impl.c.inc"
+
 /* Handles lfdp */
 static void gen_dform39(DisasContext *ctx)
 {
@@ -6907,9 +6871,7 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
  * different ISA versions
  */
 GEN_HANDLER(tlbiel, 0x1F, 0x12, 0x08, 0x001F0001, PPC_MEM_TLBIE),
-GEN_HANDLER(tlbie, 0x1F, 0x12, 0x09, 0x001F0001, PPC_MEM_TLBIE),
 GEN_HANDLER_E(tlbiel, 0x1F, 0x12, 0x08, 0x00100001, PPC_NONE, PPC2_ISA300),
-GEN_HANDLER_E(tlbie, 0x1F, 0x12, 0x09, 0x00100001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
 #if defined(TARGET_PPC64)
 GEN_HANDLER(slbia, 0x1F, 0x12, 0x0F, 0x031FFC01, PPC_SLBI),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
new file mode 100644
index 0000000000..33733c082c
--- /dev/null
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -0,0 +1,81 @@
+/*
+ * Power ISA decode for Storage Control instructions
+ *
+ * Copyright (c) 2022 Instituto de Pesquisas Eldorado (eldorado.org.br)
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
+
+/*
+ * Store Control Instructions
+ */
+
+static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
+{
+#if defined(CONFIG_USER_ONLY)
+    gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
+    return true;
+#else
+    TCGv_i32 t1;
+    int rb;
+
+    rb = a->rb;
+
+    if ((ctx->insns_flags2 & PPC2_ISA300) == 0) {
+        /*
+         * Before Power ISA 3.0, the corresponding bits of RIC, PRS, and R
+         * (and RS for tlbiel) were reserved fields and should be ignored.
+         */
+        a->ric = 0;
+        a->prs = false;
+        a->r = false;
+        if (local) {
+            a->rs = 0;
+        }
+    }
+
+    if (ctx->pr) {
+        /* tlbie is privileged... */
+        gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
+        return true;
+    } else if (!ctx->hv) {
+        if (!ctx->gtse || (!a->prs && ctx->hr)) {
+            /*
+             * ... except when GTSE=0 or when PRS=0 and HR=1, making it
+             * hypervisor privileged.
+             */
+            gen_priv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
+            return true;
+        }
+    }
+
+    if (NARROW_MODE(ctx)) {
+        TCGv t0 = tcg_temp_new();
+        tcg_gen_ext32u_tl(t0, cpu_gpr[rb]);
+        gen_helper_tlbie(cpu_env, t0);
+        tcg_temp_free(t0);
+    } else {
+        gen_helper_tlbie(cpu_env, cpu_gpr[rb]);
+    }
+    t1 = tcg_temp_new_i32();
+    tcg_gen_ld_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
+    tcg_gen_ori_i32(t1, t1, TLB_NEED_GLOBAL_FLUSH);
+    tcg_gen_st_i32(t1, cpu_env, offsetof(CPUPPCState, tlb_need_flush));
+    tcg_temp_free_i32(t1);
+
+    return true;
+#endif
+}
+
+TRANS_FLAGS(MEM_TLBIE, TLBIE, do_tlbie, false)
-- 
2.25.1


