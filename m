Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 349A94453C0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:23:21 +0100 (CET)
Received: from localhost ([::1]:38960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mici8-0007JK-Af
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic3o-0002Ho-9v; Thu, 04 Nov 2021 08:41:42 -0400
Received: from [201.28.113.2] (port=58980 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic3m-0006gQ-Nt; Thu, 04 Nov 2021 08:41:40 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:21 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 724C3800BA7;
 Thu,  4 Nov 2021 09:39:21 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 15/25] target/ppc: added the instructions LXVPX and STXVPX
Date: Thu,  4 Nov 2021 09:37:09 -0300
Message-Id: <20211104123719.323713-16-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:21.0794 (UTC)
 FILETIME=[FDF8CA20:01D7D178]
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

Implemented the instructions lxvpx and stxvpx using decodetree

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  3 +++
 target/ppc/translate/vsx-impl.c.inc | 18 ++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c252dec02f..e4508631b0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -108,6 +108,7 @@
 
 %x_rt_tsx       0:1 21:5
 @X_TSX          ...... ..... ra:5 rb:5 .......... .             &X rt=%x_rt_tsx
+@X_TSXP         ...... ..... ra:5 rb:5 .......... .             &X rt=%rt_tsxp
 
 &X_frtp_vrb     frtp vrb
 @X_frtp_vrb     ...... ....0 ..... vrb:5 .......... .           &X_frtp_vrb frtp=%x_frtp
@@ -403,3 +404,5 @@ LXVP            000110 ..... ..... ............ 0000    @DQ_TSXP
 STXVP           000110 ..... ..... ............ 0001    @DQ_TSXP
 LXVX            011111 ..... ..... ..... 0100 - 01100 . @X_TSX
 STXVX           011111 ..... ..... ..... 0110001100 .   @X_TSX
+LXVPX           011111 ..... ..... ..... 0101001101 -   @X_TSXP
+STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 05bf6ea40c..c66505ac71 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2019,25 +2019,31 @@ static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store, bool paired)
     return do_lstxv(ctx, a->ra, tcg_constant_tl(a->si), a->rt, store, paired);
 }
 
-static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store)
+static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store, bool paired)
 {
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (paired) {
+        REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    } else {
+        REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    }
 
-    if (a->rt >= 32) {
+    if (paired || a->rt >= 32) {
         REQUIRE_VSX(ctx);
     } else {
         REQUIRE_VECTOR(ctx);
     }
 
-    return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store, false);
+    return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store, paired);
 }
 
 TRANS(STXV, do_lstxv_D, true, false)
 TRANS(LXV, do_lstxv_D, false, false)
 TRANS(STXVP, do_lstxv_D, true, true)
 TRANS(LXVP, do_lstxv_D, false, true)
-TRANS(STXVX, do_lstxv_X, true)
-TRANS(LXVX, do_lstxv_X, false)
+TRANS(STXVX, do_lstxv_X, true, false)
+TRANS(LXVX, do_lstxv_X, false, false)
+TRANS(STXVPX, do_lstxv_X, true, true)
+TRANS(LXVPX, do_lstxv_X, false, true)
 
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
-- 
2.25.1


