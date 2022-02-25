Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118B24C5152
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:14:41 +0100 (CET)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNirH-0003F4-Qk
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:14:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhvf-0006Nl-4F; Fri, 25 Feb 2022 16:15:09 -0500
Received: from [187.72.171.209] (port=1210 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhvc-0004HA-Db; Fri, 25 Feb 2022 16:15:06 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B769C8001D1;
 Fri, 25 Feb 2022 18:09:54 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 27/49] target/ppc: implement vrlqmi
Date: Fri, 25 Feb 2022 18:09:14 -0300
Message-Id: <20220225210936.1749575-28-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:55.0107 (UTC)
 FILETIME=[09872730:01D82A8C]
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
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 21 +++++++++++++++++----
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 87d482c5d9..abc2007129 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -495,6 +495,7 @@ VRLQ            000100 ..... ..... ..... 00000000101    @VX
 
 VRLWMI          000100 ..... ..... ..... 00010000101    @VX
 VRLDMI          000100 ..... ..... ..... 00011000101    @VX
+VRLQMI          000100 ..... ..... ..... 00001000101    @VX
 
 VRLWNM          000100 ..... ..... ..... 00110000101    @VX
 VRLDNM          000100 ..... ..... ..... 00111000101    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index eb305e84da..352250fad0 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1109,7 +1109,8 @@ static void do_vrlq_mask(TCGv_i64 mh, TCGv_i64 ml, TCGv_i64 b, TCGv_i64 e)
     tcg_temp_free_i64(t1);
 }
 
-static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask)
+static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask,
+                                bool insert)
 {
     TCGv_i64 ah, al, vrb, n, t0, t1, zero = tcg_constant_i64(0);
 
@@ -1146,7 +1147,7 @@ static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask)
     tcg_gen_shri_i64(ah, ah, 1);
     tcg_gen_or_i64(t1, ah, t1);
 
-    if (mask) {
+    if (mask || insert) {
         tcg_gen_shri_i64(n, vrb, 8);
         tcg_gen_shri_i64(vrb, vrb, 16);
         tcg_gen_andi_i64(n, n, 0x7f);
@@ -1156,6 +1157,17 @@ static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask)
 
         tcg_gen_and_i64(t0, t0, ah);
         tcg_gen_and_i64(t1, t1, al);
+
+        if (insert) {
+            get_avr64(n, a->vrt, true);
+            get_avr64(vrb, a->vrt, false);
+            tcg_gen_not_i64(ah, ah);
+            tcg_gen_not_i64(al, al);
+            tcg_gen_and_i64(n, n, ah);
+            tcg_gen_and_i64(vrb, vrb, al);
+            tcg_gen_or_i64(t0, t0, n);
+            tcg_gen_or_i64(t1, t1, vrb);
+        }
     }
 
     set_avr64(a->vrt, t0, true);
@@ -1171,8 +1183,9 @@ static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask)
     return true;
 }
 
-TRANS(VRLQ, do_vector_rotl_quad, false)
-TRANS(VRLQNM, do_vector_rotl_quad, true)
+TRANS(VRLQ, do_vector_rotl_quad, false, false)
+TRANS(VRLQNM, do_vector_rotl_quad, true, false)
+TRANS(VRLQMI, do_vector_rotl_quad, false, true)
 
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               \
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     \
-- 
2.25.1


