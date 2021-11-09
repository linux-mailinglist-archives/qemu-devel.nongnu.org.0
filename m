Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA144A67E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 06:57:35 +0100 (CET)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkK8U-00005a-Ia
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 00:57:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3X-0004SB-Jx; Tue, 09 Nov 2021 00:52:27 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=35345
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3O-0006ct-Eq; Tue, 09 Nov 2021 00:52:27 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDn647kz4xdM; Tue,  9 Nov 2021 16:52:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437129;
 bh=DwGmrXGHhw+9y6E0GFqbJJDjXVM/VCPzyzDexL5nCIc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NY9kqY8bHb3SDPz42mG8cHU8nuMR5gvFuCA6mi4KhA0VV2na9LWmfpkQ3ZfXwdelP
 EvXQkj5wq8z9vVbdVFpWiDzI8k7sjqBBy8ERioT+LvqjWLmNt8sA9zylPQ6zHdUKv5
 XRov5FRNbKuKB06FwjNh1EvJDu2LpiAs22JszSB4=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 02/54] target/ppc: move resolve_PLS_D to translate.c
Date: Tue,  9 Nov 2021 16:51:12 +1100
Message-Id: <20211109055204.230765-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
Cc: Fernando Eckhardt Valle <phervalle@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fernando Eckhardt Valle <phervalle@gmail.com>

Move resolve_PLS_D from fixedpoint-impl.c.inc to translate.c
because this way the function can be used not only by fixed
point instructions.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fernando Eckhardt Valle <phervalle@gmail.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211029202424.175401-3-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c                     | 19 +++++++++++++++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 19 -------------------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index b3264aab58..3f50f44c19 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7502,6 +7502,25 @@ static int times_4(DisasContext *ctx, int x)
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
2.33.1


