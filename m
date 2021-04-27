Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DF536CA8C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:44:34 +0200 (CEST)
Received: from localhost ([::1]:40788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRlB-0007AT-HJ
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRMK-000285-OP; Tue, 27 Apr 2021 13:18:52 -0400
Received: from [201.28.113.2] (port=48284 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRMJ-00023I-7t; Tue, 27 Apr 2021 13:18:52 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 27 Apr 2021 14:16:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 76A4E80139F;
 Tue, 27 Apr 2021 14:16:54 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 14/15] target/ppc: Implement prefixed integer store
 instructions
Date: Tue, 27 Apr 2021 14:16:48 -0300
Message-Id: <20210427171649.364699-15-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427171649.364699-1-luis.pires@eldorado.org.br>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2021 17:16:54.0703 (UTC)
 FILETIME=[1EFACBF0:01D73B89]
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn64.decode                   | 12 ++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 20 ++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 2e08d89e62..0f3b0b2725 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -41,6 +41,18 @@ PLWA            000001 00 0--.-- .................. \
 PLD             000001 00 0--.-- .................. \
                 111001 ..... ..... ................     @PLS_D
 
+### Fixed-Point Store Instructions
+
+PSTW            000001 10 0--.-- .................. \
+                100100 ..... ..... ................     @PLS_D
+PSTB            000001 10 0--.-- .................. \
+                100110 ..... ..... ................     @PLS_D
+PSTH            000001 10 0--.-- .................. \
+                101100 ..... ..... ................     @PLS_D
+
+PSTD            000001 00 0--.-- .................. \
+                111101 ..... ..... ................     @PLS_D
+
 ### Fixed-Point Arithmetic Instructions
 
 PADDI           000001 10 0--.-- ..................     \
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index b36011a539..4ba477eb93 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -362,6 +362,26 @@ static bool trans_PLD(DisasContext *ctx, arg_PLS_D *a)
     return do_ldst_PLS_D(ctx, a, false, MO_Q);
 }
 
+static bool trans_PSTB(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, true, MO_UB);
+}
+
+static bool trans_PSTH(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, true, MO_UW);
+}
+
+static bool trans_PSTW(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, true, MO_UL);
+}
+
+static bool trans_PSTD(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, true, MO_Q);
+}
+
 static bool trans_ADDI(DisasContext *ctx, arg_D *a)
 {
     if (a->ra) {
-- 
2.25.1


