Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77CB436B87
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 21:51:22 +0200 (CEST)
Received: from localhost ([::1]:37624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mde5x-0006fQ-SK
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 15:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde22-0003Iz-Tk; Thu, 21 Oct 2021 15:47:19 -0400
Received: from [201.28.113.2] (port=10704 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mde1z-0007UN-Vm; Thu, 21 Oct 2021 15:47:18 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 21 Oct 2021 16:46:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 2F7F780012A;
 Thu, 21 Oct 2021 16:46:55 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 04/33] target/ppc: Implement PLFS, PLFD,
 PSTFS and PSTFD instructions
Date: Thu, 21 Oct 2021 16:45:18 -0300
Message-Id: <20211021194547.672988-5-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 21 Oct 2021 19:46:55.0737 (UTC)
 FILETIME=[67215690:01D7C6B4]
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
Cc: pherde <phervalle@gmail.com>, lucas.castro@eldorado.org.br,
 richard.henderson@linaro.org, groug@kaod.org, luis.pires@eldorado.org.br,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: pherde <phervalle@gmail.com>

Signed-off-by: Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn64.decode           | 11 +++++++++++
 target/ppc/translate/fp-impl.c.inc | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 72c5944a53..11e5ea81d6 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -56,6 +56,17 @@ PSTD            000001 00 0--.-- .................. \
 PADDI           000001 10 0--.-- ..................     \
                 001110 ..... ..... ................     @PLS_D
 
+### Float-Point Load and Store Instructions
+
+PLFS            000001 10 0--.-- .................. \
+                110000 ..... ..... ................     @PLS_D
+PLFD            000001 10 0--.-- .................. \
+                110010 ..... ..... ................     @PLS_D
+PSTFS           000001 10 0--.-- .................. \
+                110100 ..... ..... ................     @PLS_D
+PSTFD           000001 10 0--.-- .................. \
+                110110 ..... ..... ................     @PLS_D
+
 ### Prefixed No-operation Instruction
 
 @PNOP           000001 11 0000-- 000000000000000000     \
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 76b382ebe5..b9ced292df 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -1335,6 +1335,16 @@ static bool do_lsfp_D(DisasContext *ctx, arg_D *a, bool update, bool store,
                      single);
 }
 
+static bool do_lsfp_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool update,
+                          bool store, bool single)
+{
+    arg_D d;
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+    return do_lsfp_D(ctx, &d, update, store, single);
+}
+
 static bool do_lsfp_X(DisasContext *ctx, arg_X *a, bool update,
                       bool store, bool single)
 {
@@ -1345,21 +1355,25 @@ TRANS(LFS, do_lsfp_D, false, false, true)
 TRANS(LFSU, do_lsfp_D, true, false, true)
 TRANS(LFSX, do_lsfp_X, false, false, true)
 TRANS(LFSUX, do_lsfp_X, true, false, true)
+TRANS(PLFS, do_lsfp_PLS_D, false, false, true)
 
 TRANS(LFD, do_lsfp_D, false, false, false)
 TRANS(LFDU, do_lsfp_D, true, false, false)
 TRANS(LFDX, do_lsfp_X, false, false, false)
 TRANS(LFDUX, do_lsfp_X, true, false, false)
+TRANS(PLFD, do_lsfp_PLS_D, false, false, false)
 
 TRANS(STFS, do_lsfp_D, false, true, true)
 TRANS(STFSU, do_lsfp_D, true, true, true)
 TRANS(STFSX, do_lsfp_X, false, true, true)
 TRANS(STFSUX, do_lsfp_X, true, true, true)
+TRANS(PSTFS, do_lsfp_PLS_D, false, true, true)
 
 TRANS(STFD, do_lsfp_D, false, true, false)
 TRANS(STFDU, do_lsfp_D, true, true, false)
 TRANS(STFDX, do_lsfp_X, false, true, false)
 TRANS(STFDUX, do_lsfp_X, true, true, false)
+TRANS(PSTFD, do_lsfp_PLS_D, false, true, false)
 
 #undef _GEN_FLOAT_ACB
 #undef GEN_FLOAT_ACB
-- 
2.25.1


