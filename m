Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C485537D3EA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:41:34 +0200 (CEST)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgujd-0002tE-Om
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6N-0002Jo-LY; Wed, 12 May 2021 15:00:59 -0400
Received: from [201.28.113.2] (port=1436 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6M-0002Bm-0U; Wed, 12 May 2021 15:00:59 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:08 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B866780139F;
 Wed, 12 May 2021 15:56:07 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 27/31] target/ppc: Implement prefixed integer store
 instructions
Date: Wed, 12 May 2021 15:54:37 -0300
Message-Id: <20210512185441.3619828-28-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:08.0095 (UTC)
 FILETIME=[77AC92F0:01D74760]
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
v4:
- prefixed and non-prefixed stores unfolded.
---
 target/ppc/insn64.decode                   | 12 ++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 0c8264a194..b68b0074f4 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -39,6 +39,18 @@ PLWA             000001 00 0--.-- .................. \
 PLD              000001 00 0--.-- .................. \
                 111001 ..... ..... ................     @PLS_D
 
+### Fixed-Point Store Instructions
+
+PSTW             000001 10 0--.-- .................. \
+                100100 ..... ..... ................     @PLS_D
+PSTB             000001 10 0--.-- .................. \
+                100110 ..... ..... ................     @PLS_D
+PSTH             000001 10 0--.-- .................. \
+                101100 ..... ..... ................     @PLS_D
+
+PSTD             000001 00 0--.-- .................. \
+                111101 ..... ..... ................     @PLS_D
+
 ### Fixed-Point Arithmetic Instructions
 
 PADDI           000001 10 0--.-- ..................     \
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 7fec0a8595..04a974214f 100644
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


