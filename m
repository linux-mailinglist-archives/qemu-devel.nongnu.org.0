Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4C64C5113
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:55:57 +0100 (CET)
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiZA-0000bP-Jm
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:55:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhuA-0004Nj-2H; Fri, 25 Feb 2022 16:13:34 -0500
Received: from [187.72.171.209] (port=41741 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhtx-0004BJ-N6; Fri, 25 Feb 2022 16:13:33 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id D71948001D1;
 Fri, 25 Feb 2022 18:09:52 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 21/49] target/ppc: implement vsrq
Date: Fri, 25 Feb 2022 18:09:08 -0300
Message-Id: <20220225210936.1749575-22-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:53.0246 (UTC)
 FILETIME=[086B2FE0:01D82A8C]
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
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
index 49c722e862..8a1e64d7f2 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -834,11 +834,10 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_sarv);
 TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv);
 TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_sarv);
 
-static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
+static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right)
 {
     TCGv_i64 hi, lo, t0, n, zero = tcg_constant_i64(0);
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
     REQUIRE_VECTOR(ctx);
 
     n = tcg_temp_new_i64();
@@ -852,19 +851,37 @@ static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
     get_avr64(n, a->vrb, true);
 
     tcg_gen_andi_i64(t0, n, 64);
-    tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, lo, hi);
-    tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, zero, lo);
+    if (right) {
+        tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, hi, lo);
+        tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, zero, hi);
+    } else {
+        tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, lo, hi);
+        tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, zero, lo);
+    }
     tcg_gen_andi_i64(n, n, 0x3F);
 
-    tcg_gen_shl_i64(t0, lo, n);
-    set_avr64(a->vrt, t0, false);
+    if (right) {
+        tcg_gen_shr_i64(t0, hi, n);
+    } else {
+        tcg_gen_shl_i64(t0, lo, n);
+    }
+    set_avr64(a->vrt, t0, right);
 
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


