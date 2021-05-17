Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96285386BE1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 23:04:23 +0200 (CEST)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likPV-0005qV-LY
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 17:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likFK-0005yE-Ip; Mon, 17 May 2021 16:53:50 -0400
Received: from [201.28.113.2] (port=46491 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1likFI-0001mN-NM; Mon, 17 May 2021 16:53:50 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 17 May 2021 17:50:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 9232D80139F;
 Mon, 17 May 2021 17:50:34 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 16/23] target/ppc: Implement prefixed integer load
 instructions
Date: Mon, 17 May 2021 17:50:18 -0300
Message-Id: <20210517205025.3777947-17-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
References: <20210517205025.3777947-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2021 20:50:35.0066 (UTC)
 FILETIME=[48C5F1A0:01D74B5E]
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
 target/ppc/insn64.decode                   | 15 +++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 16 ++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 9aa5097a98..547bd1736f 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -24,6 +24,21 @@
                 ...... rt:5 ra:5 ................       \
                 &PLS_D si=%pls_si
 
+### Fixed-Point Load Instructions
+
+PLBZ            000001 10 0--.-- .................. \
+                100010 ..... ..... ................     @PLS_D
+PLHZ            000001 10 0--.-- .................. \
+                101000 ..... ..... ................     @PLS_D
+PLHA            000001 10 0--.-- .................. \
+                101010 ..... ..... ................     @PLS_D
+PLWZ            000001 10 0--.-- .................. \
+                100000 ..... ..... ................     @PLS_D
+PLWA            000001 00 0--.-- .................. \
+                101001 ..... ..... ................     @PLS_D
+PLD             000001 00 0--.-- .................. \
+                111001 ..... ..... ................     @PLS_D
+
 ### Fixed-Point Arithmetic Instructions
 
 PADDI           000001 10 0--.-- ..................     \
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 6140dd41ca..7687f31d6f 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -80,6 +80,16 @@ static bool do_ldst_D(DisasContext *ctx, arg_D *a, bool update, bool store,
     return do_ldst(ctx, a->rt, a->ra, tcg_constant_tl(a->si), update, store, mop);
 }
 
+static bool do_ldst_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool update,
+                          bool store, MemOp mop)
+{
+    arg_D d;
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+    return do_ldst_D(ctx, &d, update, store, mop);
+}
+
 static bool do_ldst_X(DisasContext *ctx, arg_X *a, bool update,
                       bool store, MemOp mop)
 {
@@ -91,35 +101,41 @@ TRANS(LBZ, do_ldst_D, false, false, MO_UB)
 TRANS(LBZX, do_ldst_X, false, false, MO_UB)
 TRANS(LBZU, do_ldst_D, true, false, MO_UB)
 TRANS(LBZUX, do_ldst_X, true, false, MO_UB)
+TRANS(PLBZ, do_ldst_PLS_D, false, false, MO_UB)
 
 /* Load Halfword and Zero */
 TRANS(LHZ, do_ldst_D, false, false, MO_UW)
 TRANS(LHZX, do_ldst_X, false, false, MO_UW)
 TRANS(LHZU, do_ldst_D, true, false, MO_UW)
 TRANS(LHZUX, do_ldst_X, true, false, MO_UW)
+TRANS(PLHZ, do_ldst_PLS_D, false, false, MO_UW)
 
 /* Load Halfword Algebraic */
 TRANS(LHA, do_ldst_D, false, false, MO_SW)
 TRANS(LHAX, do_ldst_X, false, false, MO_SW)
 TRANS(LHAU, do_ldst_D, true, false, MO_SW)
 TRANS(LHAXU, do_ldst_X, true, false, MO_SW)
+TRANS(PLHA, do_ldst_PLS_D, false, false, MO_SW)
 
 /* Load Word and Zero */
 TRANS(LWZ, do_ldst_D, false, false, MO_UL)
 TRANS(LWZX, do_ldst_X, false, false, MO_UL)
 TRANS(LWZU, do_ldst_D, true, false, MO_UL)
 TRANS(LWZUX, do_ldst_X, true, false, MO_UL)
+TRANS(PLWZ, do_ldst_PLS_D, false, false, MO_UL)
 
 /* Load Word Algebraic */
 TRANS64(LWA, do_ldst_D, false, false, MO_SL)
 TRANS64(LWAX, do_ldst_X, false, false, MO_SL)
 TRANS64(LWAUX, do_ldst_X, true, false, MO_SL)
+TRANS64(PLWA, do_ldst_PLS_D, false, false, MO_SL)
 
 /* Load Doubleword */
 TRANS64(LD, do_ldst_D, false, false, MO_Q)
 TRANS64(LDX, do_ldst_X, false, false, MO_Q)
 TRANS64(LDU, do_ldst_D, true, false, MO_Q)
 TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
+TRANS64(PLD, do_ldst_PLS_D, false, false, MO_Q)
 
 /*
  * Fixed-Point Arithmetic Instructions
-- 
2.25.1


