Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2455C399CE4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:42:51 +0200 (CEST)
Received: from localhost ([::1]:60838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiwE-0006bZ-5j
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidw-0008A8-Hr; Thu, 03 Jun 2021 04:23:56 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:41115 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidt-0000Y4-4f; Thu, 03 Jun 2021 04:23:55 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5q4dCfz9t2g; Thu,  3 Jun 2021 18:22:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708559;
 bh=1p0QItMfqcgQJ0I2dKcNL+H+aE+4GbEGvW7Cxb6MkY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JAy2MwqND1mGvH/z+y3wXpCCNxv1KDi9+zO9MX9LMP1YUPCQjt6eCnLSoEAOa99tJ
 K4gaK1iLX3lZLV1gDZY4Wo/eg4afEp8F5qho6pQKjZgC4cE0KkfDl+roCw/dcFMBcF
 juh/tOPPQVNz0VCradMgc/SE0EBuRWdU8okNFB4s=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 34/42] target/ppc: Implement prefixed integer load instructions
Date: Thu,  3 Jun 2021 18:22:23 +1000
Message-Id: <20210603082231.601214-35-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20210601193528.2533031-8-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


