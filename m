Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681674BFC64
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:23:31 +0100 (CET)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMX0k-0007or-Dy
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:23:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLg-0007Qp-5c; Tue, 22 Feb 2022 09:41:04 -0500
Received: from [187.72.171.209] (port=46527 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLe-0005jB-DJ; Tue, 22 Feb 2022 09:41:03 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3C3CE80047A;
 Tue, 22 Feb 2022 11:37:43 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 21/47] target/ppc: implement vsrq
Date: Tue, 22 Feb 2022 11:36:19 -0300
Message-Id: <20220222143646.1268606-22-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:43.0649 (UTC)
 FILETIME=[C0725D10:01D827F9]
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
v4:
 -  New in v4.
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 40 +++++++++++++++++++++--------
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 3799065508..96ee730242 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -479,6 +479,7 @@ VSRB            000100 ..... ..... ..... 01000000100    @VX
 VSRH            000100 ..... ..... ..... 01001000100    @VX
 VSRW            000100 ..... ..... ..... 01010000100    @VX
 VSRD            000100 ..... ..... ..... 11011000100    @VX
+VSRQ            000100 ..... ..... ..... 01000000101    @VX
 
 VSRAB           000100 ..... ..... ..... 01100000100    @VX
 VSRAH           000100 ..... ..... ..... 01101000100    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ca98a545ef..ec2b47b4aa 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -834,11 +834,10 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_sarv);
 TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv);
 TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_sarv);
 
-static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
+static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right)
 {
     TCGv_i64 hi, lo, tmp, n, sf = tcg_constant_i64(64);
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
     REQUIRE_VECTOR(ctx);
 
     n = tcg_temp_new_i64();
@@ -852,19 +851,37 @@ static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
     get_avr64(n, a->vrb, true);
     tcg_gen_andi_i64(n, n, 0x7F);
 
-    tcg_gen_movcond_i64(TCG_COND_GE, hi, n, sf, lo, hi);
-    tcg_gen_movcond_i64(TCG_COND_GE, lo, n, sf, tmp, lo);
+    if (right) {
+        tcg_gen_movcond_i64(TCG_COND_GE, lo, n, sf, hi, lo);
+        tcg_gen_movcond_i64(TCG_COND_GE, hi, n, sf, tmp, hi);
+    } else {
+        tcg_gen_movcond_i64(TCG_COND_GE, hi, n, sf, lo, hi);
+        tcg_gen_movcond_i64(TCG_COND_GE, lo, n, sf, tmp, lo);
+    }
     tcg_gen_andi_i64(n, n, ~64ULL);
 
-    tcg_gen_shl_i64(tmp, lo, n);
-    set_avr64(a->vrt, tmp, false);
+    if (right) {
+        tcg_gen_shr_i64(tmp, hi, n);
+    } else {
+        tcg_gen_shl_i64(tmp, lo, n);
+    }
+    set_avr64(a->vrt, tmp, right);
 
-    tcg_gen_shl_i64(hi, hi, n);
+    if (right) {
+        tcg_gen_shr_i64(lo, lo, n);
+    } else {
+        tcg_gen_shl_i64(hi, hi, n);
+    }
     tcg_gen_xori_i64(n, n, 63);
-    tcg_gen_shr_i64(lo, lo, n);
-    tcg_gen_shri_i64(lo, lo, 1);
+    if (right) {
+        tcg_gen_shl_i64(hi, hi, n);
+        tcg_gen_shli_i64(hi, hi, 1);
+    } else {
+        tcg_gen_shr_i64(lo, lo, n);
+        tcg_gen_shri_i64(lo, lo, 1);
+    }
     tcg_gen_or_i64(hi, hi, lo);
-    set_avr64(a->vrt, hi, true);
+    set_avr64(a->vrt, hi, !right);
 
     tcg_temp_free_i64(hi);
     tcg_temp_free_i64(lo);
@@ -874,6 +891,9 @@ static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
+TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, false);
+TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true);
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               \
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     \
                                          TCGv_vec sat, TCGv_vec a,      \
-- 
2.25.1


