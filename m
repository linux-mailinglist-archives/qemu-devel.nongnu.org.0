Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A624399CC6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:41:07 +0200 (CEST)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiuY-0000Gs-A1
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidb-0007gi-OI; Thu, 03 Jun 2021 04:23:36 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54637 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidZ-0000YB-55; Thu, 03 Jun 2021 04:23:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5q5Pvsz9t2p; Thu,  3 Jun 2021 18:22:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708559;
 bh=ztbthMJY1sb70wNeuiduPWgqKUX4JcbHO+Ql/jratVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=APYO1oQGgi38m3zvgmltf4v6dmbKPXvqwsXYGFHWQIgBQbepKiYynhJAqk5U37etm
 rln9LnQZCdxKyHqt46JtqI8LeU8CQgZK4ekaDR+V954kp0S/HrStqig2q8LLICoeT2
 DL/dY8wp6FKD81QfEKOuCHf0OAcAmqb3IcgZn9Ko=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 36/42] target/ppc: Implement prefixed integer store instructions
Date: Thu,  3 Jun 2021 18:22:25 +1000
Message-Id: <20210603082231.601214-37-david@gibson.dropbear.id.au>
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
Message-Id: <20210601193528.2533031-10-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


