Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912485E8537
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 23:59:55 +0200 (CEST)
Received: from localhost ([::1]:48024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obqiA-0003Sh-A6
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 17:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqXv-0006Ob-3j; Fri, 23 Sep 2022 17:49:20 -0400
Received: from [200.168.210.66] (port=12827 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqXr-0006ea-IQ; Fri, 23 Sep 2022 17:49:18 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 23 Sep 2022 18:47:57 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 11DC1800491;
 Fri, 23 Sep 2022 18:47:57 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 03/12] target/ppc: Move V(ADD|SUB)CUW to decodetree and use
 gvec
Date: Fri, 23 Sep 2022 18:47:45 -0300
Message-Id: <20220923214754.217819-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Sep 2022 21:47:57.0359 (UTC)
 FILETIME=[249AABF0:01D8CF96]
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

This patch moves VADDCUW and VSUBCUW to decodtree with gvec using an
implementation based on the helper, with the main difference being
changing the -1 (aka all bits set to 1) result returned by cmp when
true to +1

vaddcuw:
rept    loop    master             patch
8       12500   0,01420600         0,00679200 (-52.2%)
25      4000    0,01781700         0,00524500 (-70.6%)
100     1000    0,02053300         0,00591800 (-71.2%)
500     200     0,02709800         0,01254600 (-53.7%)
2500    40      0,05537100         0,04347800 (-21.5%)
8000    12      0,13103100         0,12973600 (-1.0%)

vsubcuw:
rept    loop    master             patch
8       12500   0,01426100         0,00685500 (-51.9%)
25      4000    0,01744600         0,00536000 (-69.3%)
100     1000    0,02029500         0,00597400 (-70.6%)
500     200     0,02654000         0,01263200 (-52.4%)
2500    40      0,05507200         0,04347100 (-21.1%)
8000    12      0,13072400         0,12872300 (-1.5%)

Overall there was a gain in performance, but the TCGop code was still
slightly bigger in the new version (it went from 4 to 5).

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/helper.h                 |  4 +--
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             |  4 +--
 target/ppc/translate/vmx-impl.c.inc | 50 ++++++++++++++++++++++++++---
 target/ppc/translate/vmx-ops.c.inc  |  3 +-
 5 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f02a9497b7..edce059f2c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -193,11 +193,11 @@ DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vslv, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vaddcuw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VADDCUW, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_2(vprtybw, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vprtybd, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vprtybq, TCG_CALL_NO_RWG, void, avr, avr)
-DEF_HELPER_FLAGS_3(vsubcuw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VSUBCUW, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddsbs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddshs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddsws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9a509e84df..aebc7b73c8 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -608,12 +608,14 @@ VRLQNM          000100 ..... ..... ..... 00101000101    @VX
 
 ## Vector Integer Arithmetic Instructions
 
+VADDCUW         000100 ..... ..... ..... 00110000000    @VX
 VADDCUQ         000100 ..... ..... ..... 00101000000    @VX
 VADDUQM         000100 ..... ..... ..... 00100000000    @VX
 
 VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
 VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
 
+VSUBCUW         000100 ..... ..... ..... 10110000000    @VX
 VSUBCUQ         000100 ..... ..... ..... 10101000000    @VX
 VSUBUQM         000100 ..... ..... ..... 10100000000    @VX
 
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index ae1ba8084d..c48841819d 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -492,7 +492,7 @@ static inline void set_vscr_sat(CPUPPCState *env)
     env->vscr_sat.u32[0] = 1;
 }
 
-void helper_vaddcuw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VADDCUW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t v)
 {
     int i;
 
@@ -1962,7 +1962,7 @@ void helper_vsro(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 #endif
 }
 
-void helper_vsubcuw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VSUBCUW(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t v)
 {
     int i;
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 3acd585a2f..c5bfbfb3ce 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -803,8 +803,6 @@ GEN_VXFORM(vsrv, 2, 28);
 GEN_VXFORM(vslv, 2, 29);
 GEN_VXFORM(vslo, 6, 16);
 GEN_VXFORM(vsro, 6, 17);
-GEN_VXFORM(vaddcuw, 0, 6);
-GEN_VXFORM(vsubcuw, 0, 22);
 
 static bool do_vector_gvec3_VX(DisasContext *ctx, arg_VX *a, int vece,
                                void (*gen_gvec)(unsigned, uint32_t, uint32_t,
@@ -2847,8 +2845,6 @@ static void gen_xpnd04_2(DisasContext *ctx)
 }
 
 
-GEN_VXFORM_DUAL(vsubcuw, PPC_ALTIVEC, PPC_NONE, \
-                xpnd04_1, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_DUAL(vsubsws, PPC_ALTIVEC, PPC_NONE, \
                 xpnd04_2, PPC_NONE, PPC2_ISA300)
 
@@ -3110,6 +3106,52 @@ TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
 TRANS_FLAGS2(ALTIVEC_207, VSUBCUQ, do_vx_helper, gen_helper_VSUBCUQ)
 TRANS_FLAGS2(ALTIVEC_207, VSUBUQM, do_vx_helper, gen_helper_VSUBUQM)
 
+static void gen_VADDCUW(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    tcg_gen_not_vec(vece, a, a);
+    tcg_gen_cmp_vec(TCG_COND_LTU, vece, t, a, b);
+    tcg_gen_and_vec(vece, t, t, tcg_constant_vec_matching(t, vece, 1));
+}
+
+static void gen_VSUBCUW(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    tcg_gen_cmp_vec(TCG_COND_GEU, vece, t, a, b);
+    tcg_gen_and_vec(vece, t, t, tcg_constant_vec_matching(t, vece, 1));
+}
+
+static bool do_vx_vaddsubcuw(DisasContext *ctx, arg_VX *a, int add)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_cmp_vec, 0
+    };
+
+    static const GVecGen3 op[] = {
+        {
+            .fniv = gen_VSUBCUW,
+            .fno = gen_helper_VSUBCUW,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_VADDCUW,
+            .fno = gen_helper_VADDCUW,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+    };
+
+    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &op[add]);
+
+    return true;
+}
+
+TRANS(VSUBCUW, do_vx_vaddsubcuw, 0)
+TRANS(VADDCUW, do_vx_vaddsubcuw, 1)
+
 static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
                          void (*gen_mul)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 7cd9d40e06..ded0234123 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -106,12 +106,11 @@ GEN_VXFORM_300(vsrv, 2, 28),
 GEN_VXFORM_300(vslv, 2, 29),
 GEN_VXFORM(vslo, 6, 16),
 GEN_VXFORM(vsro, 6, 17),
-GEN_VXFORM(vaddcuw, 0, 6),
 GEN_HANDLER_E_2(vprtybw, 0x4, 0x1, 0x18, 8, 0, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E_2(vprtybd, 0x4, 0x1, 0x18, 9, 0, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E_2(vprtybq, 0x4, 0x1, 0x18, 10, 0, PPC_NONE, PPC2_ISA300),
 
-GEN_VXFORM_DUAL(vsubcuw, xpnd04_1, 0, 22, PPC_ALTIVEC, PPC_NONE),
+GEN_VXFORM(xpnd04_1, 0, 22),
 GEN_VXFORM_300(bcdsr, 0, 23),
 GEN_VXFORM_300(bcdsr, 0, 31),
 GEN_VXFORM_DUAL(vaddubs, vmul10uq, 0, 8, PPC_ALTIVEC, PPC_NONE),
-- 
2.31.1


