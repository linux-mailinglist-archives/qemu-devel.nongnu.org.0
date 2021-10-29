Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E015B440414
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:29:34 +0200 (CEST)
Received: from localhost ([::1]:36920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYVJ-0006XW-UC
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRT-0000uH-6s; Fri, 29 Oct 2021 16:25:38 -0400
Received: from [201.28.113.2] (port=65208 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mgYRR-0001sK-GU; Fri, 29 Oct 2021 16:25:34 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 29 Oct 2021 17:25:04 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 02563800B36;
 Fri, 29 Oct 2021 17:25:03 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 02/34] target/ppc: move resolve_PLS_D to translate.c
Date: Fri, 29 Oct 2021 17:23:52 -0300
Message-Id: <20211029202424.175401-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Oct 2021 20:25:04.0537 (UTC)
 FILETIME=[0EAA8090:01D7CD03]
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
Cc: Fernando Eckhardt Valle <phervalle@gmail.com>, lucas.castro@eldorado.org.br,
 richard.henderson@linaro.org, groug@kaod.org, luis.pires@eldorado.org.br,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fernando Eckhardt Valle <phervalle@gmail.com>

Move resolve_PLS_D from fixedpoint-impl.c.inc to translate.c
because this way the function can be used not only by fixed
point instructions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fernando Eckhardt Valle <phervalle@gmail.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/translate.c                     | 19 +++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 19 -------------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index cc809341e4..4828456d34 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7523,6 +7523,25 @@ static int times_4(DisasContext *ctx, int x)
 #include "decode-insn64.c.inc"
 #include "power8-pmu-regs.c.inc"
 
+/*
+ * Incorporate CIA into the constant when R=1.
+ * Validate that when R=1, RA=0.
+ */
+static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
+{
+    d->rt = a->rt;
+    d->ra = a->ra;
+    d->si = a->si;
+    if (a->r) {
+        if (unlikely(a->ra != 0)) {
+            gen_invalid(ctx);
+            return false;
+        }
+        d->si += ctx->cia;
+    }
+    return true;
+}
+
 #include "translate/fixedpoint-impl.c.inc"
 
 #include "translate/fp-impl.c.inc"
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index caef5d89cd..812b7ddd0a 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -17,25 +17,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-/*
- * Incorporate CIA into the constant when R=1.
- * Validate that when R=1, RA=0.
- */
-static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
-{
-    d->rt = a->rt;
-    d->ra = a->ra;
-    d->si = a->si;
-    if (a->r) {
-        if (unlikely(a->ra != 0)) {
-            gen_invalid(ctx);
-            return false;
-        }
-        d->si += ctx->cia;
-    }
-    return true;
-}
-
 /*
  * Fixed-Point Load/Store Instructions
  */
-- 
2.25.1


