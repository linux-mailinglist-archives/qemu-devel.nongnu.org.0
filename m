Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7570B44A6A9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 07:11:27 +0100 (CET)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkKLu-0003kZ-J1
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 01:11:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3j-0004TH-Cg; Tue, 09 Nov 2021 00:52:40 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=39847
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK3f-0006fg-9j; Tue, 09 Nov 2021 00:52:38 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp0RN0z4xdm; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437130;
 bh=NzDVMP8A13rbs6RHjjHE4cvL2P8CHFar78okf1xB40g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M5bdQqGukk9cgaxbBqkjyr5Dw43o4Rjlmg++yY020MSc1xo7U9BwpCTNheXbatCwU
 f4mIo0I3B1XXEHoseUHKZ9oKSswl5tG/7JGbF4s2D3thb+Lt2XTpPrecnWK5RsFShf
 TrgX7k4IQ4rUa/+8NqRuqrWSr4AwCsQ8Djwj8zyo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 12/54] target/ppc: Move REQUIRE_ALTIVEC/VECTOR to translate.c
Date: Tue,  9 Nov 2021 16:51:22 +1100
Message-Id: <20211109055204.230765-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Fernando Valle <fernando.valle@eldorado.org.br>, qemu-ppc@nongnu.org,
 Bruno Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
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
Message-Id: <20211029192417.400707-3-luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate.c                 |  8 ++++++++
 target/ppc/translate/vector-impl.c.inc | 10 +---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 8d5141497f..1d24b85746 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7341,6 +7341,14 @@ static int times_16(DisasContext *ctx, int x)
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
2.33.1


