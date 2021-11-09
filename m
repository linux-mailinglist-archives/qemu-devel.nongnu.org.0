Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3D744A6E1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:34:48 +0100 (CET)
Received: from localhost ([::1]:48430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKiV-00080x-5P
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:34:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4p-0005tH-2q; Tue, 09 Nov 2021 00:53:47 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:51905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4n-0006vB-DN; Tue, 09 Nov 2021 00:53:46 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp5Xcrz4xfM; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=cW3SQ2MO/nmMHI5GljHQtXVLMgPDlWBj5BPD7qPmceU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EeFaFcLPBzaEXubyak701+2pUAbrEB22q4Ns8/fqaPptCc1LVrwDIUDHvB6MpxTEO
 mIsdLMqtLtAQVCMfZZMwoMXNGO1vPxvCK9qb7fnq2pPWK3MUvP1stR6HtFfWsMB4dW
 5s/tyrz9GEvlI0NDxgK+C/g3tuAQZy86tBCpaPR4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 42/54] target/ppc: added the instructions LXVPX and STXVPX
Date: Tue,  9 Nov 2021 16:51:52 +1100
Message-Id: <20211109055204.230765-43-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.castro@eldorado.org.br>

Implemented the instructions lxvpx and stxvpx using decodetree

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-16-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.33.1


