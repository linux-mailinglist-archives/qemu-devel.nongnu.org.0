Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCD25F6EEB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 22:23:55 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogXPN-0002Pv-0Z
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 16:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogXAX-0004Iq-Cb; Thu, 06 Oct 2022 16:08:33 -0400
Received: from [200.168.210.66] (port=12853 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ogXAU-0001rM-Hj; Thu, 06 Oct 2022 16:08:33 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 6 Oct 2022 17:07:04 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D9B688002BE;
 Thu,  6 Oct 2022 17:07:03 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, farosas@linux.ibm.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH 6/6] target/ppc: move msgsync to decodetree
Date: Thu,  6 Oct 2022 17:06:54 -0300
Message-Id: <20221006200654.725390-7-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
References: <20221006200654.725390-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Oct 2022 20:07:04.0089 (UTC)
 FILETIME=[33F1B890:01D8D9BF]
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
 target/ppc/insn32.decode                       |  1 +
 target/ppc/translate.c                         | 14 --------------
 target/ppc/translate/processor-ctrl-impl.c.inc |  9 +++++++++
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 5ba4a6807d..70a3b4de5e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -915,3 +915,4 @@ MSGCLR          011111 ----- ----- ..... 0011101110 -   @X_rb
 MSGSND          011111 ----- ----- ..... 0011001110 -   @X_rb
 MSGCLRP         011111 ----- ----- ..... 0010101110 -   @X_rb
 MSGSNDP         011111 ----- ----- ..... 0010001110 -   @X_rb
+MSGSYNC         011111 ----- ----- ----- 1101110110 -
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 087ab8e69d..f092bbeb8b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6239,18 +6239,6 @@ static void gen_icbt_440(DisasContext *ctx)
      */
 }
 
-/* Embedded.Processor Control */
-
-static void gen_msgsync(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_HV(ctx);
-#endif /* defined(CONFIG_USER_ONLY) */
-    /* interpreted as no-op */
-}
-
 #if defined(TARGET_PPC64)
 static void gen_maddld(DisasContext *ctx)
 {
@@ -6853,8 +6841,6 @@ GEN_HANDLER2_E(tlbivax_booke206, "tlbivax", 0x1F, 0x12, 0x18, 0x00000001,
                PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER2_E(tlbilx_booke206, "tlbilx", 0x1F, 0x12, 0x00, 0x03800001,
                PPC_NONE, PPC2_BOOKE206),
-GEN_HANDLER2_E(msgsync, "msgsync", 0x1F, 0x16, 0x1B, 0x00000000,
-               PPC_NONE, PPC2_ISA300),
 GEN_HANDLER(wrtee, 0x1F, 0x03, 0x04, 0x000FFC01, PPC_WRTEE),
 GEN_HANDLER(wrteei, 0x1F, 0x03, 0x05, 0x000E7C01, PPC_WRTEE),
 GEN_HANDLER(dlmzb, 0x1F, 0x0E, 0x02, 0x00000000, PPC_440_SPEC),
diff --git a/target/ppc/translate/processor-ctrl-impl.c.inc b/target/ppc/translate/processor-ctrl-impl.c.inc
index 3703001f31..021e365a57 100644
--- a/target/ppc/translate/processor-ctrl-impl.c.inc
+++ b/target/ppc/translate/processor-ctrl-impl.c.inc
@@ -92,3 +92,12 @@ static bool trans_MSGSNDP(DisasContext *ctx, arg_X_rb *a)
 #endif
     return true;
 }
+
+static bool trans_MSGSYNC(DisasContext *ctx, arg_MSGSYNC *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_HV(ctx);
+
+    /* interpreted as no-op */
+    return true;
+}
-- 
2.25.1


