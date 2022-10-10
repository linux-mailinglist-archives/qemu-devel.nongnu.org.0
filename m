Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25EA5FA45D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:55:21 +0200 (CEST)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyrw-0005sj-LA
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:55:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ohyFO-0001bi-B3; Mon, 10 Oct 2022 15:15:30 -0400
Received: from [200.168.210.66] (port=19040 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ohyFM-0003Ag-F6; Mon, 10 Oct 2022 15:15:30 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 10 Oct 2022 16:14:00 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 46699800278;
 Mon, 10 Oct 2022 16:14:00 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 07/12] target/ppc: Move VABSDU[BHW] to decodetree and use
 gvec
Date: Mon, 10 Oct 2022 16:13:51 -0300
Message-Id: <20221010191356.83659-8-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
References: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Oct 2022 19:14:00.0546 (UTC)
 FILETIME=[740E9C20:01D8DCDC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Moved VABSDUB, VABSDUH and VABSDUW to decodetree and use gvec to
translate them.

vabsdub:
rept    loop    master             patch
8       12500   0,03601600         0,00688500 (-80.9%)
25      4000    0,03651000         0,00532100 (-85.4%)
100     1000    0,03666900         0,00595300 (-83.8%)
500     200     0,04305800         0,01244600 (-71.1%)
2500    40      0,06893300         0,04273700 (-38.0%)
8000    12      0,14633200         0,12660300 (-13.5%)

vabsduh:
rept    loop    master             patch
8       12500   0,02172400         0,00687500 (-68.4%)
25      4000    0,02154100         0,00531500 (-75.3%)
100     1000    0,02235400         0,00596300 (-73.3%)
500     200     0,02827500         0,01245100 (-56.0%)
2500    40      0,05638400         0,04285500 (-24.0%)
8000    12      0,13166000         0,12641400 (-4.0%)

vabsduw:
rept    loop    master             patch
8       12500   0,01646400         0,00688300 (-58.2%)
25      4000    0,01454500         0,00475500 (-67.3%)
100     1000    0,01545800         0,00511800 (-66.9%)
500     200     0,02168200         0,01114300 (-48.6%)
2500    40      0,04571300         0,04138800 (-9.5%)
8000    12      0,12209500         0,12178500 (-0.3%)

Same as VADDCUW and VSUBCUW, overall performance gain but it uses more
TCGop (4 before the patch, 6 after).

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                 |  6 ++--
 target/ppc/insn32.decode            |  6 ++++
 target/ppc/int_helper.c             | 13 +++-----
 target/ppc/translate/vmx-impl.c.inc | 49 +++++++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  3 --
 5 files changed, 60 insertions(+), 17 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 71c22efc2e..fd8280dfa7 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -146,9 +146,9 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
 DEF_HELPER_FLAGS_4(VAVGUB, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_4(VAVGUH, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_4(VAVGUW, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
-DEF_HELPER_FLAGS_3(vabsdub, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vabsduh, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vabsduw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VABSDUB, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VABSDUH, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VABSDUW, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_4(VAVGSB, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_4(VAVGSH, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_4(VAVGSW, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 38458c01de..ae151c4b62 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -528,6 +528,12 @@ VAVGUB          000100 ..... ..... ..... 10000000010    @VX
 VAVGUH          000100 ..... ..... ..... 10001000010    @VX
 VAVGUW          000100 ..... ..... ..... 10010000010    @VX
 
+## Vector Integer Absolute Difference Instructions
+
+VABSDUB         000100 ..... ..... ..... 10000000011    @VX
+VABSDUH         000100 ..... ..... ..... 10001000011    @VX
+VABSDUW         000100 ..... ..... ..... 10010000011    @VX
+
 ## Vector Bit Manipulation Instruction
 
 VGNB            000100 ..... -- ... ..... 10011001100   @VX_n
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index bda76e54d4..d97a7f1f28 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -589,8 +589,8 @@ VAVG(VAVGSW, s32, int64_t)
 VAVG(VAVGUW, u32, uint64_t)
 #undef VAVG
 
-#define VABSDU_DO(name, element)                                        \
-void helper_v##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)           \
+#define VABSDU(name, element)                                           \
+void helper_##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t v)\
 {                                                                       \
     int i;                                                              \
                                                                         \
@@ -606,12 +606,9 @@ void helper_v##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)           \
  *   name    - instruction mnemonic suffix (b: byte, h: halfword, w: word)
  *   element - element type to access from vector
  */
-#define VABSDU(type, element)                   \
-    VABSDU_DO(absdu##type, element)
-VABSDU(b, u8)
-VABSDU(h, u16)
-VABSDU(w, u32)
-#undef VABSDU_DO
+VABSDU(VABSDUB, u8)
+VABSDU(VABSDUH, u16)
+VABSDU(VABSDUW, u32)
 #undef VABSDU
 
 #define VCF(suffix, cvt, element)                                       \
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 1e3e099739..f46a354d31 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -431,9 +431,6 @@ GEN_VXFORM_V(vminsb, MO_8, tcg_gen_gvec_smin, 1, 12);
 GEN_VXFORM_V(vminsh, MO_16, tcg_gen_gvec_smin, 1, 13);
 GEN_VXFORM_V(vminsw, MO_32, tcg_gen_gvec_smin, 1, 14);
 GEN_VXFORM_V(vminsd, MO_64, tcg_gen_gvec_smin, 1, 15);
-GEN_VXFORM(vabsdub, 1, 16);
-GEN_VXFORM(vabsduh, 1, 17);
-GEN_VXFORM(vabsduw, 1, 18);
 GEN_VXFORM(vmrghb, 6, 0);
 GEN_VXFORM(vmrghh, 6, 1);
 GEN_VXFORM(vmrghw, 6, 2);
@@ -3467,6 +3464,52 @@ TRANS_FLAGS(ALTIVEC, VAVGUB, do_vx_vavg, 0, MO_8)
 TRANS_FLAGS(ALTIVEC, VAVGUH, do_vx_vavg, 0, MO_16)
 TRANS_FLAGS(ALTIVEC, VAVGUW, do_vx_vavg, 0, MO_32)
 
+static void gen_vabsdu(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    tcg_gen_umax_vec(vece, t, a, b);
+    tcg_gen_umin_vec(vece, a, a, b);
+    tcg_gen_sub_vec(vece, t, t, a);
+}
+
+static bool do_vabsdu(DisasContext *ctx, arg_VX *a, const int vece)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_umax_vec, INDEX_op_umin_vec, INDEX_op_sub_vec, 0
+    };
+
+    static const GVecGen3 op[] = {
+        {
+            .fniv = gen_vabsdu,
+            .fno = gen_helper_VABSDUB,
+            .opt_opc = vecop_list,
+            .vece = MO_8
+        },
+        {
+            .fniv = gen_vabsdu,
+            .fno = gen_helper_VABSDUH,
+            .opt_opc = vecop_list,
+            .vece = MO_16
+        },
+        {
+            .fniv = gen_vabsdu,
+            .fno = gen_helper_VABSDUW,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+    };
+
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &op[vece]);
+
+    return true;
+}
+
+TRANS_FLAGS2(ISA300, VABSDUB, do_vabsdu, MO_8)
+TRANS_FLAGS2(ISA300, VABSDUH, do_vabsdu, MO_16)
+TRANS_FLAGS2(ISA300, VABSDUW, do_vabsdu, MO_32)
+
 static bool do_vdiv_vmod(DisasContext *ctx, arg_VX *a, const int vece,
                          void (*func_32)(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b),
                          void (*func_64)(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b))
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 02db51def0..33fec8aca4 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -83,9 +83,6 @@ GEN_VXFORM(vminsb, 1, 12),
 GEN_VXFORM(vminsh, 1, 13),
 GEN_VXFORM(vminsw, 1, 14),
 GEN_VXFORM_207(vminsd, 1, 15),
-GEN_VXFORM(vabsdub, 1, 16),
-GEN_VXFORM(vabsduh, 1, 17),
-GEN_VXFORM(vabsduw, 1, 18),
 GEN_VXFORM(vmrghb, 6, 0),
 GEN_VXFORM(vmrghh, 6, 1),
 GEN_VXFORM(vmrghw, 6, 2),
-- 
2.37.3


