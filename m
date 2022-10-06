Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0845F6ECE
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:18:51 +0200 (CEST)
Received: from localhost ([::1]:46026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXKU-0005Il-V3
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9U-0002p6-O8; Thu, 06 Oct 2022 16:07:29 -0400
Received: from [200.168.210.66] (port=39047 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogX9T-0001fe-1y; Thu, 06 Oct 2022 16:07:28 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 6 Oct 2022 17:07:04 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BC514800640;
 Thu,  6 Oct 2022 17:07:03 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 5/6] target/ppc: move msgclrp/msgsndp to decodetree
Date: Thu,  6 Oct 2022 17:06:53 -0300
Message-Id: <20221006200654.725390-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Oct 2022 20:07:04.0073 (UTC)
 FILETIME=[33EF4790:01D8D9BF]
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
 target/ppc/insn32.decode                      |  2 ++
 target/ppc/translate.c                        | 26 -------------------
 .../ppc/translate/processor-ctrl-impl.c.inc   | 24 +++++++++++++++++
 3 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index bba49ded1b..5ba4a6807d 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -913,3 +913,5 @@ TLBIEL          011111 ..... - .. . . ..... 0100010010 -            @X_tlbie
 
 MSGCLR          011111 ----- ----- ..... 0011101110 -   @X_rb
 MSGSND          011111 ----- ----- ..... 0011001110 -   @X_rb
+MSGCLRP         011111 ----- ----- ..... 0010101110 -   @X_rb
+MSGSNDP         011111 ----- ----- ..... 0010001110 -   @X_rb
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 889cca6325..087ab8e69d 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6241,28 +6241,6 @@ static void gen_icbt_440(DisasContext *ctx)
 
 /* Embedded.Processor Control */
 
-#if defined(TARGET_PPC64)
-static void gen_msgclrp(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-    gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
-static void gen_msgsndp(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-    gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-#endif
-
 static void gen_msgsync(DisasContext *ctx)
 {
 #if defined(CONFIG_USER_ONLY)
@@ -6896,10 +6874,6 @@ GEN_HANDLER(vmladduhm, 0x04, 0x11, 0xFF, 0x00000000, PPC_ALTIVEC),
 GEN_HANDLER_E(maddhd_maddhdu, 0x04, 0x18, 0xFF, 0x00000000, PPC_NONE,
               PPC2_ISA300),
 GEN_HANDLER_E(maddld, 0x04, 0x19, 0xFF, 0x00000000, PPC_NONE, PPC2_ISA300),
-GEN_HANDLER2_E(msgsndp, "msgsndp", 0x1F, 0x0E, 0x04, 0x03ff0001,
-               PPC_NONE, PPC2_ISA207S),
-GEN_HANDLER2_E(msgclrp, "msgclrp", 0x1F, 0x0E, 0x05, 0x03ff0001,
-               PPC_NONE, PPC2_ISA207S),
 #endif
 
 #undef GEN_INT_ARITH_ADD
diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc b/target/ppc/translate/processor-ctrl-impl.c.inc
index 0192b45c8f..3703001f31 100644
--- a/target/ppc/translate/processor-ctrl-impl.c.inc
+++ b/target/ppc/translate/processor-ctrl-impl.c.inc
@@ -68,3 +68,27 @@ static bool trans_MSGSND(DisasContext *ctx, arg_X_rb *a)
 #endif
     return true;
 }
+
+static bool trans_MSGCLRP(DisasContext *ctx, arg_X_rb *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
+    REQUIRE_SV(ctx);
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_book3s_msgclrp(cpu_env, cpu_gpr[a->rb]);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
+static bool trans_MSGSNDP(DisasContext *ctx, arg_X_rb *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA207S);
+    REQUIRE_SV(ctx);
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_book3s_msgsndp(cpu_env, cpu_gpr[a->rb]);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
-- 
2.25.1


