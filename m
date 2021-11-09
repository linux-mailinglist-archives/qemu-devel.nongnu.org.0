Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992AC44A772
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:18:25 +0100 (CET)
Received: from localhost ([::1]:46774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLOi-0005qi-6l
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:18:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4q-0005vm-Gt; Tue, 09 Nov 2021 00:53:48 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:56861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK4o-0006vM-FM; Tue, 09 Nov 2021 00:53:48 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp5fYsz4xfL; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=T4gaTFL7eQmj3g8929+2BWPKo7SXwDTu75KuBhpSvXM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iya6cu6HWhYOD5a8fM/fo+ZAeSPsyk9mionAK5DkF5Oz69BcblAnfdjoCCoegPavI
 d8jk061jKGZ5lt5BcZSdPyq2KfNPgeI/j40SBD6m094yqhAwLJADaUacLbESJc65yV
 6wOYD5tpHffqyHBStzIgv+Dtx/bi48moTm/s1Y7s=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 43/54] target/ppc: added the instructions PLXV and PSTXV
Date: Tue,  9 Nov 2021 16:51:53 +1100
Message-Id: <20211109055204.230765-44-david@gibson.dropbear.id.au>
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

Implemented the instructions plxv and pstxv using decodetree

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-17-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.33.1


