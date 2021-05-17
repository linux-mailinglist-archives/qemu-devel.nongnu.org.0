Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3431386BF4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 23:08:11 +0200 (CEST)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likTC-0003EZ-RM
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 17:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likFQ-0006CO-Rf; Mon, 17 May 2021 16:53:56 -0400
Received: from [201.28.113.2] (port=46491 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likFP-0001mN-8j; Mon, 17 May 2021 16:53:56 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 17:50:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 77D508000C2;
 Mon, 17 May 2021 17:50:35 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 18/23] target/ppc: Implement prefixed integer store
 instructions
Date: Mon, 17 May 2021 17:50:20 -0300
Message-Id: <20210517205025.3777947-19-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2021 20:50:35.0972 (UTC)
 FILETIME=[49503040:01D74B5E]
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn64.decode                   | 12 ++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 547bd1736f..72c5944a53 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -39,6 +39,18 @@ PLWA            000001 00 0--.-- .................. \
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
index adeee33289..2d2d874146 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -142,24 +142,28 @@ TRANS(STB, do_ldst_D, false, true, MO_UB)
 TRANS(STBX, do_ldst_X, false, true, MO_UB)
 TRANS(STBU, do_ldst_D, true, true, MO_UB)
 TRANS(STBUX, do_ldst_X, true, true, MO_UB)
+TRANS(PSTB, do_ldst_PLS_D, false, true, MO_UB)
 
 /* Store Halfword */
 TRANS(STH, do_ldst_D, false, true, MO_UW)
 TRANS(STHX, do_ldst_X, false, true, MO_UW)
 TRANS(STHU, do_ldst_D, true, true, MO_UW)
 TRANS(STHUX, do_ldst_X, true, true, MO_UW)
+TRANS(PSTH, do_ldst_PLS_D, false, true, MO_UW)
 
 /* Store Word */
 TRANS(STW, do_ldst_D, false, true, MO_UL)
 TRANS(STWX, do_ldst_X, false, true, MO_UL)
 TRANS(STWU, do_ldst_D, true, true, MO_UL)
 TRANS(STWUX, do_ldst_X, true, true, MO_UL)
+TRANS(PSTW, do_ldst_PLS_D, false, true, MO_UL)
 
 /* Store Doubleword */
 TRANS64(STD, do_ldst_D, false, true, MO_Q)
 TRANS64(STDX, do_ldst_X, false, true, MO_Q)
 TRANS64(STDU, do_ldst_D, true, true, MO_Q)
 TRANS64(STDUX, do_ldst_X, true, true, MO_Q)
+TRANS64(PSTD, do_ldst_PLS_D, false, true, MO_Q)
 
 /*
  * Fixed-Point Arithmetic Instructions
-- 
2.25.1


