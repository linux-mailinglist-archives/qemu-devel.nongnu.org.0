Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BF3436BA3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 21:57:20 +0200 (CEST)
Received: from localhost ([::1]:50514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdeBj-0007IG-Tn
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 15:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde2A-0003d4-F7; Thu, 21 Oct 2021 15:47:26 -0400
Received: from [201.28.113.2] (port=10704 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde28-0007UN-1b; Thu, 21 Oct 2021 15:47:25 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:56 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 21263800145;
 Thu, 21 Oct 2021 16:46:56 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 06/33] target/ppc: Implement PLQ and PSTQ
Date: Thu, 21 Oct 2021 16:45:20 -0300
Message-Id: <20211021194547.672988-7-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:56.0650 (UTC)
 FILETIME=[67ACA6A0:01D7C6B4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn64.decode                   |  4 ++++
 target/ppc/translate/fixedpoint-impl.c.inc | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 11e5ea81d6..48756cd4ca 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -38,6 +38,8 @@ PLWA            000001 00 0--.-- .................. \
                 101001 ..... ..... ................     @PLS_D
 PLD             000001 00 0--.-- .................. \
                 111001 ..... ..... ................     @PLS_D
+PLQ             000001 00 0--.-- .................. \
+                111000 ..... ..... ................     @PLS_D
 
 ### Fixed-Point Store Instructions
 
@@ -50,6 +52,8 @@ PSTH            000001 10 0--.-- .................. \
 
 PSTD            000001 00 0--.-- .................. \
                 111101 ..... ..... ................     @PLS_D
+PSTQ            000001 00 0--.-- .................. \
+                111100 ..... ..... ................     @PLS_D
 
 ### Fixed-Point Arithmetic Instructions
 
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 61d129fb5d..0a6b3d61d1 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -162,6 +162,16 @@ static bool do_ldst_quad(DisasContext *ctx, arg_D *a, bool store, bool prefixed)
     return true;
 }
 
+static bool do_ldst_quad_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool store)
+{
+    arg_D d;
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+
+    return do_ldst_quad(ctx, &d, store, true);
+}
+
 /* Load Byte and Zero */
 TRANS(LBZ, do_ldst_D, false, false, MO_UB)
 TRANS(LBZX, do_ldst_X, false, false, MO_UB)
@@ -205,6 +215,7 @@ TRANS64(PLD, do_ldst_PLS_D, false, false, MO_Q)
 
 /* Load Quadword */
 TRANS64(LQ, do_ldst_quad, false, false);
+TRANS64(PLQ, do_ldst_quad_PLS_D, false);
 
 /* Store Byte */
 TRANS(STB, do_ldst_D, false, true, MO_UB)
@@ -236,6 +247,7 @@ TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
 
 /* Store Quadword */
 TRANS64(STQ, do_ldst_quad, true, false);
+TRANS64(PSTQ, do_ldst_quad_PLS_D, true);
 
 /*
  * Fixed-Point Compare Instructions
-- 
2.25.1


