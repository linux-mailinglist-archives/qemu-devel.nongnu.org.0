Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4944BFB06
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 15:44:04 +0100 (CET)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWOY-0007VC-4Y
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 09:44:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWJa-0004bG-54; Tue, 22 Feb 2022 09:38:54 -0500
Received: from [187.72.171.209] (port=3932 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWJW-00057A-VZ; Tue, 22 Feb 2022 09:38:53 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 06C6280047A;
 Tue, 22 Feb 2022 11:37:37 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 01/47] target/ppc: Introduce TRANS*FLAGS macros
Date: Tue, 22 Feb 2022 11:35:59 -0300
Message-Id: <20220222143646.1268606-2-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:37.0452 (UTC)
 FILETIME=[BCC0C6C0:01D827F9]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

New macros that add FLAGS and FLAGS2 checking were added for
both TRANS and TRANS64.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
[ferst: - TRANS_FLAGS2 instead of TRANS_FLAGS_E
        - Use the new macros in load/store vector insns ]
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c              | 19 +++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 37 ++++++++++-------------------
 2 files changed, 31 insertions(+), 25 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 2eaffd432a..b647430012 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6604,10 +6604,29 @@ static int times_16(DisasContext *ctx, int x)
 #define TRANS(NAME, FUNC, ...) \
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
     { return FUNC(ctx, a, __VA_ARGS__); }
+#define TRANS_FLAGS(FLAGS, NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    {                                                          \
+        REQUIRE_INSNS_FLAGS(ctx, FLAGS);                       \
+        return FUNC(ctx, a, __VA_ARGS__);                      \
+    }
+#define TRANS_FLAGS2(FLAGS2, NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    {                                                          \
+        REQUIRE_INSNS_FLAGS2(ctx, FLAGS2);                     \
+        return FUNC(ctx, a, __VA_ARGS__);                      \
+    }
 
 #define TRANS64(NAME, FUNC, ...) \
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
     { REQUIRE_64BIT(ctx); return FUNC(ctx, a, __VA_ARGS__); }
+#define TRANS64_FLAGS2(FLAGS2, NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    {                                                          \
+        REQUIRE_64BIT(ctx);                                    \
+        REQUIRE_INSNS_FLAGS2(ctx, FLAGS2);                     \
+        return FUNC(ctx, a, __VA_ARGS__);                      \
+    }
 
 /* TODO: More TRANS* helpers for extra insn_flags checks. */
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 128968b5e7..e8a4ba0cfa 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2072,12 +2072,6 @@ static bool do_lstxv(DisasContext *ctx, int ra, TCGv displ,
 
 static bool do_lstxv_D(DisasContext *ctx, arg_D *a, bool store, bool paired)
 {
-    if (paired) {
-        REQUIRE_INSNS_FLAGS2(ctx, ISA310);
-    } else {
-        REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-    }
-
     if (paired || a->rt >= 32) {
         REQUIRE_VSX(ctx);
     } else {
@@ -2091,7 +2085,6 @@ static bool do_lstxv_PLS_D(DisasContext *ctx, arg_PLS_D *a,
                            bool store, bool paired)
 {
     arg_D d;
-    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
     REQUIRE_VSX(ctx);
 
     if (!resolve_PLS_D(ctx, &d, a)) {
@@ -2103,12 +2096,6 @@ static bool do_lstxv_PLS_D(DisasContext *ctx, arg_PLS_D *a,
 
 static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store, bool paired)
 {
-    if (paired) {
-        REQUIRE_INSNS_FLAGS2(ctx, ISA310);
-    } else {
-        REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-    }
-
     if (paired || a->rt >= 32) {
         REQUIRE_VSX(ctx);
     } else {
@@ -2118,18 +2105,18 @@ static bool do_lstxv_X(DisasContext *ctx, arg_X *a, bool store, bool paired)
     return do_lstxv(ctx, a->ra, cpu_gpr[a->rb], a->rt, store, paired);
 }
 
-TRANS(STXV, do_lstxv_D, true, false)
-TRANS(LXV, do_lstxv_D, false, false)
-TRANS(STXVP, do_lstxv_D, true, true)
-TRANS(LXVP, do_lstxv_D, false, true)
-TRANS(STXVX, do_lstxv_X, true, false)
-TRANS(LXVX, do_lstxv_X, false, false)
-TRANS(STXVPX, do_lstxv_X, true, true)
-TRANS(LXVPX, do_lstxv_X, false, true)
-TRANS64(PSTXV, do_lstxv_PLS_D, true, false)
-TRANS64(PLXV, do_lstxv_PLS_D, false, false)
-TRANS64(PSTXVP, do_lstxv_PLS_D, true, true)
-TRANS64(PLXVP, do_lstxv_PLS_D, false, true)
+TRANS_FLAGS2(ISA300, STXV, do_lstxv_D, true, false)
+TRANS_FLAGS2(ISA300, LXV, do_lstxv_D, false, false)
+TRANS_FLAGS2(ISA310, STXVP, do_lstxv_D, true, true)
+TRANS_FLAGS2(ISA310, LXVP, do_lstxv_D, false, true)
+TRANS_FLAGS2(ISA300, STXVX, do_lstxv_X, true, false)
+TRANS_FLAGS2(ISA300, LXVX, do_lstxv_X, false, false)
+TRANS_FLAGS2(ISA310, STXVPX, do_lstxv_X, true, true)
+TRANS_FLAGS2(ISA310, LXVPX, do_lstxv_X, false, true)
+TRANS64_FLAGS2(ISA310, PSTXV, do_lstxv_PLS_D, true, false)
+TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false, false)
+TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
+TRANS64_FLAGS2(ISA310, PLXVP, do_lstxv_PLS_D, false, true)
 
 static void gen_xxblendv_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
                              TCGv_vec c)
-- 
2.25.1


