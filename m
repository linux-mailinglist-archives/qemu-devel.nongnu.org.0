Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D55F6EB4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:12:16 +0200 (CEST)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXE8-0000Ir-1p
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9S-0002mh-0Z; Thu, 06 Oct 2022 16:07:27 -0400
Received: from [200.168.210.66] (port=39047 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9P-0001fe-Fa; Thu, 06 Oct 2022 16:07:25 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 6 Oct 2022 17:07:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A88D88002D8;
 Thu,  6 Oct 2022 17:07:03 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 4/6] target/ppc: move msgclr/msgsnd to decodetree
Date: Thu,  6 Oct 2022 17:06:52 -0300
Message-Id: <20221006200654.725390-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Oct 2022 20:07:03.0933 (UTC)
 FILETIME=[33D9EAD0:01D8D9BF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode                      |  5 ++
 target/ppc/translate.c                        | 34 +--------
 .../ppc/translate/processor-ctrl-impl.c.inc   | 70 +++++++++++++++++++
 3 files changed, 77 insertions(+), 32 deletions(-)
 create mode 100644 target/ppc/translate/processor-ctrl-impl.c.inc

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index a5249ee32c..bba49ded1b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -908,3 +908,8 @@ SLBSYNC         011111 ----- ----- ----- 0101010010 -
 
 TLBIE           011111 ..... - .. . . ..... 0100110010 -            @X_tlbie
 TLBIEL          011111 ..... - .. . . ..... 0100010010 -            @X_tlbie
+
+# Processor Control Instructions
+
+MSGCLR          011111 ----- ----- ..... 0011101110 -   @X_rb
+MSGSND          011111 ----- ----- ..... 0011001110 -   @X_rb
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 435066c4a3..889cca6325 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6241,34 +6241,6 @@ static void gen_icbt_440(DisasContext *ctx)
 
 /* Embedded.Processor Control */
 
-static void gen_msgclr(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_HV(ctx);
-    if (is_book3s_arch2x(ctx)) {
-        gen_helper_book3s_msgclr(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-    } else {
-        gen_helper_msgclr(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-    }
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-static void gen_msgsnd(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_HV(ctx);
-    if (is_book3s_arch2x(ctx)) {
-        gen_helper_book3s_msgsnd(cpu_gpr[rB(ctx->opcode)]);
-    } else {
-        gen_helper_msgsnd(cpu_gpr[rB(ctx->opcode)]);
-    }
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 #if defined(TARGET_PPC64)
 static void gen_msgclrp(DisasContext *ctx)
 {
@@ -6628,6 +6600,8 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
 
 #include "translate/branch-impl.c.inc"
 
+#include "translate/processor-ctrl-impl.c.inc"
+
 #include "translate/storage-ctrl-impl.c.inc"
 
 /* Handles lfdp */
@@ -6901,10 +6875,6 @@ GEN_HANDLER2_E(tlbivax_booke206, "tlbivax", 0x1F, 0x12, 0x18, 0x00000001,
                PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER2_E(tlbilx_booke206, "tlbilx", 0x1F, 0x12, 0x00, 0x03800001,
                PPC_NONE, PPC2_BOOKE206),
-GEN_HANDLER2_E(msgsnd, "msgsnd", 0x1F, 0x0E, 0x06, 0x03ff0001,
-               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
-GEN_HANDLER2_E(msgclr, "msgclr", 0x1F, 0x0E, 0x07, 0x03ff0001,
-               PPC_NONE, (PPC2_PRCNTL | PPC2_ISA207S)),
 GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
                PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc b/target/ppc/translate/processor-ctrl-impl.c.inc
new file mode 100644
index 0000000000..0192b45c8f
--- /dev/null
+++ b/target/ppc/translate/processor-ctrl-impl.c.inc
@@ -0,0 +1,70 @@
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
+ * Processor Control Instructions
+ */
+
+static bool trans_MSGCLR(DisasContext *ctx, arg_X_rb *a)
+{
+    if (!(ctx->insns_flags2 & PPC2_ISA207S)) {
+        /*
+         * Before Power ISA 2.07, processor control instructions were only
+         * implemented in the "Embedded.Processor Control" category.
+         */
+        REQUIRE_INSNS_FLAGS2(ctx, PRCNTL);
+    }
+
+    REQUIRE_HV(ctx);
+
+#if !defined(CONFIG_USER_ONLY)
+    if (is_book3s_arch2x(ctx)) {
+        gen_helper_book3s_msgclr(cpu_env, cpu_gpr[a->rb]);
+    } else {
+        gen_helper_msgclr(cpu_env, cpu_gpr[a->rb]);
+    }
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
+static bool trans_MSGSND(DisasContext *ctx, arg_X_rb *a)
+{
+    if (!(ctx->insns_flags2 & PPC2_ISA207S)) {
+        /*
+         * Before Power ISA 2.07, processor control instructions were only
+         * implemented in the "Embedded.Processor Control" category.
+         */
+        REQUIRE_INSNS_FLAGS2(ctx, PRCNTL);
+    }
+
+    REQUIRE_HV(ctx);
+
+#if !defined(CONFIG_USER_ONLY)
+    if (is_book3s_arch2x(ctx)) {
+        gen_helper_book3s_msgsnd(cpu_gpr[a->rb]);
+    } else {
+        gen_helper_msgsnd(cpu_gpr[a->rb]);
+    }
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
-- 
2.25.1


