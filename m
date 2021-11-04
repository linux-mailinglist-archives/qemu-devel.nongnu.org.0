Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323304453E3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:31:52 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micqM-00082m-Qh
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic4s-0003lb-7a; Thu, 04 Nov 2021 08:42:47 -0400
Received: from [201.28.113.2] (port=15997 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic4o-00007k-HM; Thu, 04 Nov 2021 08:42:45 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:22 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id C4165800BA7;
 Thu,  4 Nov 2021 09:39:21 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 16/25] target/ppc: added the instructions PLXV and PSTXV
Date: Thu,  4 Nov 2021 09:37:10 -0300
Message-Id: <20211104123719.323713-17-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:22.0169 (UTC)
 FILETIME=[FE320290:01D7D178]
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
Cc: lucas.castro@eldorado.org.br, richard.henderson@linaro.org, groug@kaod.org,
 luis.pires@eldorado.org.br, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Implemented the instructions plxv and pstxv using decodetree

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn64.decode            | 10 ++++++++++
 target/ppc/translate/vsx-impl.c.inc | 16 ++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 48756cd4ca..093439b370 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -23,6 +23,9 @@
 @PLS_D          ...... .. ... r:1 .. .................. \
                 ...... rt:5 ra:5 ................       \
                 &PLS_D si=%pls_si
+@8LS_D_TSX      ...... .. . .. r:1 .. .................. \
+                ..... rt:6 ra:5 ................         \
+                &PLS_D si=%pls_si
 
 ### Fixed-Point Load Instructions
 
@@ -137,3 +140,10 @@ PSTFD           000001 10 0--.-- .................. \
   PNOP          ................................        \
                 --------------------------------        @PNOP
 }
+
+### VSX instructions
+
+PLXV            000001 00 0--.-- .................. \
+                11001 ...... ..... ................     @8LS_D_TSX
+PSTXV           000001 00 0--.-- .................. \
+                11011 ...... ..... ................     @8LS_D_TSX
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index c66505ac71..1972127a22 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2019,6 +2019,20 @@ static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store, bool paired)
     return do_lstxv(ctx, a->ra, tcg_constant_tl(a->si), a->rt, store, paired);
 }
 
+static bool do_lstxv_PLS_D(DisasContext *ctx, arg_PLS_D *a,
+                           bool store, bool paired)
+{
+    arg_D d;
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    if (!resolve_PLS_D(ctx, &d, a)) {
+        return true;
+    }
+
+    return do_lstxv(ctx, d.ra, tcg_constant_tl(d.si), d.rt, store, paired);
+}
+
 static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store, bool paired)
 {
     if (paired) {
@@ -2044,6 +2058,8 @@ TRANS(STXVX, do_lstxv_X, true, false)
 TRANS(LXVX, do_lstxv_X, false, false)
 TRANS(STXVPX, do_lstxv_X, true, true)
 TRANS(LXVPX, do_lstxv_X, false, true)
+TRANS64(PSTXV, do_lstxv_PLS_D, true, false)
+TRANS64(PLXV, do_lstxv_PLS_D, false, false)
 
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
-- 
2.25.1


