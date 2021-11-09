Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E644A759
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:09:16 +0100 (CET)
Received: from localhost ([::1]:33660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLFq-0004wZ-SK
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:09:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK5G-0006Jn-9i; Tue, 09 Nov 2021 00:54:14 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=45451
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK5D-0006yM-PR; Tue, 09 Nov 2021 00:54:13 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDq04f2z4xfY; Tue,  9 Nov 2021 16:52:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437131;
 bh=3XXFgvLM3HtKQoCA3V3si6MoLGumNoVBwdnlcqaW2cY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FJgNGi5oWtQm3LvYRF3eMCLZIeXmyMiET43opr5g9O2KA1FKmvwQ1Lz4Df0gNHLyH
 fpI5F+qWih+YEvm9NHzjNEb6AggvsT0T+0NZ5D4vHUjM3pr3yX/WkI9TfWIfxEea86
 wmTThTDVuvuCkqBGmLlErYfb3JIT9YiU9FoQUs0E=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 52/54] target/ppc: cntlzdm/cnttzdm implementation without brcond
Date: Tue,  9 Nov 2021 16:52:02 +1100
Message-Id: <20211109055204.230765-53-david@gibson.dropbear.id.au>
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
Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-26-matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/fixedpoint-impl.c.inc | 31 +++++++++++-----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index e093562e2a..7fecff4579 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -416,32 +416,33 @@ static bool trans_CFUGED(DisasContext *ctx, arg_X *a)
 
 static void do_cntzdm(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 mask, int64_t trail)
 {
-    TCGv_i64 tmp;
-    TCGLabel *l1;
+    TCGv_i64 t0, t1;
 
-    tmp = tcg_temp_local_new_i64();
-    l1 = gen_new_label();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
 
-    tcg_gen_and_i64(tmp, src, mask);
+    tcg_gen_and_i64(t0, src, mask);
     if (trail) {
-        tcg_gen_ctzi_i64(tmp, tmp, 64);
+        tcg_gen_ctzi_i64(t0, t0, -1);
     } else {
-        tcg_gen_clzi_i64(tmp, tmp, 64);
+        tcg_gen_clzi_i64(t0, t0, -1);
     }
 
-    tcg_gen_brcondi_i64(TCG_COND_EQ, tmp, 0, l1);
-
-    tcg_gen_subfi_i64(tmp, 64, tmp);
+    tcg_gen_setcondi_i64(TCG_COND_NE, t1, t0, -1);
+    tcg_gen_andi_i64(t0, t0, 63);
+    tcg_gen_xori_i64(t0, t0, 63);
     if (trail) {
-        tcg_gen_shl_i64(tmp, mask, tmp);
+        tcg_gen_shl_i64(t0, mask, t0);
+        tcg_gen_shl_i64(t0, t0, t1);
     } else {
-        tcg_gen_shr_i64(tmp, mask, tmp);
+        tcg_gen_shr_i64(t0, mask, t0);
+        tcg_gen_shr_i64(t0, t0, t1);
     }
-    tcg_gen_ctpop_i64(tmp, tmp);
 
-    gen_set_label(l1);
+    tcg_gen_ctpop_i64(dst, t0);
 
-    tcg_gen_mov_i64(dst, tmp);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
 }
 
 static bool trans_CNTLZDM(DisasContext *ctx, arg_X *a)
-- 
2.33.1


