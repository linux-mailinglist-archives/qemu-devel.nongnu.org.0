Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F943A146
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:36:41 +0200 (CEST)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5lw-0006ft-FA
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf5Pr-0000Wo-Lc; Mon, 25 Oct 2021 15:13:51 -0400
Received: from [201.28.113.2] (port=13660 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1mf5Pq-0000Ju-0E; Mon, 25 Oct 2021 15:13:51 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 25 Oct 2021 16:12:27 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id C032E800145;
 Mon, 25 Oct 2021 16:12:26 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 06/19] target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
 translate.c
Date: Mon, 25 Oct 2021 16:11:41 -0300
Message-Id: <20211025191154.350831-7-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025191154.350831-1-luis.pires@eldorado.org.br>
References: <20211025191154.350831-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Oct 2021 19:12:27.0126 (UTC)
 FILETIME=[3FCB5960:01D7C9D4]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, groug@kaod.org,
 Luis Pires <luis.pires@eldorado.org.br>,
 Fernando Valle <fernando.valle@eldorado.org.br>,
 Bruno Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruno Larsen <bruno.larsen@eldorado.org.br>

Move REQUIRE_ALTIVEC to translate.c and rename it to REQUIRE_VECTOR.

Signed-off-by: Bruno Larsen <bruno.larsen@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Signed-off-by: Fernando Valle <fernando.valle@eldorado.org.br>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c                 |  8 ++++++++
 target/ppc/translate/vector-impl.c.inc | 10 +---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 518337bcb7..c2fafebd1c 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7469,6 +7469,14 @@ static int times_4(DisasContext *ctx, int x)
 # define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
 #endif
 
+#define REQUIRE_VECTOR(CTX)                             \
+    do {                                                \
+        if (unlikely(!(CTX)->altivec_enabled)) {        \
+            gen_exception((CTX), POWERPC_EXCP_VPU);     \
+            return true;                                \
+        }                                               \
+    } while (0)
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
diff --git a/target/ppc/translate/vector-impl.c.inc b/target/ppc/translate/vector-impl.c.inc
index 117ce9b137..197e903337 100644
--- a/target/ppc/translate/vector-impl.c.inc
+++ b/target/ppc/translate/vector-impl.c.inc
@@ -17,20 +17,12 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#define REQUIRE_ALTIVEC(CTX) \
-    do {                                                \
-        if (unlikely(!(CTX)->altivec_enabled)) {        \
-            gen_exception((CTX), POWERPC_EXCP_VPU);     \
-            return true;                                \
-        }                                               \
-    } while (0)
-
 static bool trans_VCFUGED(DisasContext *ctx, arg_VX *a)
 {
     TCGv_i64 tgt, src, mask;
 
     REQUIRE_INSNS_FLAGS2(ctx, ISA310);
-    REQUIRE_ALTIVEC(ctx);
+    REQUIRE_VECTOR(ctx);
 
     tgt = tcg_temp_new_i64();
     src = tcg_temp_new_i64();
-- 
2.25.1


