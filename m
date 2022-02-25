Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B74C513F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:10:51 +0100 (CET)
Received: from localhost ([::1]:36760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNina-0006ZN-5T
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:10:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhvb-0006N5-FT; Fri, 25 Feb 2022 16:15:05 -0500
Received: from [187.72.171.209] (port=1210 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhvZ-0004HA-Bc; Fri, 25 Feb 2022 16:15:02 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 663BD8006BB;
 Fri, 25 Feb 2022 18:09:54 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 26/49] target/ppc: implement vrlqnm
Date: Fri, 25 Feb 2022 18:09:13 -0300
Message-Id: <20220225210936.1749575-27-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:54.0795 (UTC)
 FILETIME=[09578BB0:01D82A8C]
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
 target/ppc/translate/vmx-impl.c.inc | 81 +++++++++++++++++++++++++++--
 2 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c3d47a8815..87d482c5d9 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -498,6 +498,7 @@ VRLDMI          000100 ..... ..... ..... 00011000101    @VX
 
 VRLWNM          000100 ..... ..... ..... 00110000101    @VX
 VRLDNM          000100 ..... ..... ..... 00111000101    @VX
+VRLQNM          000100 ..... ..... ..... 00101000101    @VX
 
 ## Vector Integer Arithmetic Instructions
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 478a62440d..eb305e84da 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1055,28 +1055,83 @@ TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, false, false);
 TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true, false);
 TRANS_FLAGS2(ISA310, VSRAQ, do_vector_shift_quad, true, true);
 
-static bool trans_VRLQ(DisasContext *ctx, arg_VX *a)
+static void do_vrlq_mask(TCGv_i64 mh, TCGv_i64 ml, TCGv_i64 b, TCGv_i64 e)
 {
-    TCGv_i64 ah, al, n, t0, t1, zero = tcg_constant_i64(0);
+    TCGv_i64 th, tl, t0, t1, zero = tcg_constant_i64(0),
+             ones = tcg_constant_i64(-1);
+
+    th = tcg_temp_new_i64();
+    tl = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    /* m = ~0 >> b */
+    tcg_gen_andi_i64(t0, b, 64);
+    tcg_gen_movcond_i64(TCG_COND_NE, t1, t0, zero, zero, ones);
+    tcg_gen_andi_i64(t0, b, 0x3F);
+    tcg_gen_shr_i64(mh, t1, t0);
+    tcg_gen_shr_i64(ml, ones, t0);
+    tcg_gen_xori_i64(t0, t0, 63);
+    tcg_gen_shl_i64(t1, t1, t0);
+    tcg_gen_shli_i64(t1, t1, 1);
+    tcg_gen_or_i64(ml, t1, ml);
+
+    /* t = ~0 >> e */
+    tcg_gen_andi_i64(t0, e, 64);
+    tcg_gen_movcond_i64(TCG_COND_NE, t1, t0, zero, zero, ones);
+    tcg_gen_andi_i64(t0, e, 0x3F);
+    tcg_gen_shr_i64(th, t1, t0);
+    tcg_gen_shr_i64(tl, ones, t0);
+    tcg_gen_xori_i64(t0, t0, 63);
+    tcg_gen_shl_i64(t1, t1, t0);
+    tcg_gen_shli_i64(t1, t1, 1);
+    tcg_gen_or_i64(tl, t1, tl);
+
+    /* t = t >> 1 */
+    tcg_gen_shli_i64(t0, th, 63);
+    tcg_gen_shri_i64(tl, tl, 1);
+    tcg_gen_shri_i64(th, th, 1);
+    tcg_gen_or_i64(tl, t0, tl);
+
+    /* m = m ^ t */
+    tcg_gen_xor_i64(mh, mh, th);
+    tcg_gen_xor_i64(ml, ml, tl);
+
+    /* Negate the mask if begin > end */
+    tcg_gen_movcond_i64(TCG_COND_GT, t0, b, e, ones, zero);
+
+    tcg_gen_xor_i64(mh, mh, t0);
+    tcg_gen_xor_i64(ml, ml, t0);
+
+    tcg_temp_free_i64(th);
+    tcg_temp_free_i64(tl);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+}
+
+static bool do_vector_rotl_quad(DisasContext *ctx, arg_VX *a, bool mask)
+{
+    TCGv_i64 ah, al, vrb, n, t0, t1, zero = tcg_constant_i64(0);
 
     REQUIRE_VECTOR(ctx);
     REQUIRE_INSNS_FLAGS2(ctx, ISA310);
 
     ah = tcg_temp_new_i64();
     al = tcg_temp_new_i64();
+    vrb = tcg_temp_new_i64();
     n = tcg_temp_new_i64();
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
 
     get_avr64(ah, a->vra, true);
     get_avr64(al, a->vra, false);
-    get_avr64(n, a->vrb, true);
+    get_avr64(vrb, a->vrb, true);
 
     tcg_gen_mov_i64(t0, ah);
-    tcg_gen_andi_i64(t1, n, 64);
+    tcg_gen_andi_i64(t1, vrb, 64);
     tcg_gen_movcond_i64(TCG_COND_NE, ah, t1, zero, al, ah);
     tcg_gen_movcond_i64(TCG_COND_NE, al, t1, zero, t0, al);
-    tcg_gen_andi_i64(n, n, 0x3F);
+    tcg_gen_andi_i64(n, vrb, 0x3F);
 
     tcg_gen_shl_i64(t0, ah, n);
     tcg_gen_shl_i64(t1, al, n);
@@ -1091,11 +1146,24 @@ static bool trans_VRLQ(DisasContext *ctx, arg_VX *a)
     tcg_gen_shri_i64(ah, ah, 1);
     tcg_gen_or_i64(t1, ah, t1);
 
+    if (mask) {
+        tcg_gen_shri_i64(n, vrb, 8);
+        tcg_gen_shri_i64(vrb, vrb, 16);
+        tcg_gen_andi_i64(n, n, 0x7f);
+        tcg_gen_andi_i64(vrb, vrb, 0x7f);
+
+        do_vrlq_mask(ah, al, vrb, n);
+
+        tcg_gen_and_i64(t0, t0, ah);
+        tcg_gen_and_i64(t1, t1, al);
+    }
+
     set_avr64(a->vrt, t0, true);
     set_avr64(a->vrt, t1, false);
 
     tcg_temp_free_i64(ah);
     tcg_temp_free_i64(al);
+    tcg_temp_free_i64(vrb);
     tcg_temp_free_i64(n);
     tcg_temp_free_i64(t0);
     tcg_temp_free_i64(t1);
@@ -1103,6 +1171,9 @@ static bool trans_VRLQ(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
+TRANS(VRLQ, do_vector_rotl_quad, false)
+TRANS(VRLQNM, do_vector_rotl_quad, true)
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               \
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     \
                                          TCGv_vec sat, TCGv_vec a,      \
-- 
2.25.1


