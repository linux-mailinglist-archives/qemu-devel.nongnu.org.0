Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6544453BC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 14:21:28 +0100 (CET)
Received: from localhost ([::1]:36810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1micgI-0005d0-NQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 09:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic6T-0005ii-AO; Thu, 04 Nov 2021 08:44:25 -0400
Received: from [201.28.113.2] (port=43952 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mic6R-0000L9-Qj; Thu, 04 Nov 2021 08:44:25 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 4 Nov 2021 09:39:25 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 57588800BA7;
 Thu,  4 Nov 2021 09:39:25 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 25/25] target/ppc: cntlzdm/cnttzdm implementation without
 brcond
Date: Thu,  4 Nov 2021 09:37:19 -0300
Message-Id: <20211104123719.323713-26-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
References: <20211104123719.323713-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 Nov 2021 12:39:25.0710 (UTC)
 FILETIME=[004E52E0:01D7D179]
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
2.25.1


