Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DA95FA434
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 21:29:55 +0200 (CEST)
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohyTK-0002zE-Ja
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 15:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ohyFH-0001QH-Qo; Mon, 10 Oct 2022 15:15:26 -0400
Received: from [200.168.210.66] (port=19040 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ohyFF-0003Ag-Q9; Mon, 10 Oct 2022 15:15:23 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 10 Oct 2022 16:13:59 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B0B36800278;
 Mon, 10 Oct 2022 16:13:59 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 05/12] target/ppc: Move VPRTYB[WDQ] to decodetree and use
 gvec
Date: Mon, 10 Oct 2022 16:13:49 -0300
Message-Id: <20221010191356.83659-6-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
References: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Oct 2022 19:14:00.0014 (UTC)
 FILETIME=[73BD6EE0:01D8DCDC]
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

Moved VPRTYBW and VPRTYBD to use gvec and both of them and VPRTYBQ to
decodetree. VPRTYBW and VPRTYBD now also use .fni4 and .fni8,
respectively.

vprtybw:
rept    loop    master             patch
8       12500   0,00991200         0,00626300 (-36.8%)
25      4000    0,01040600         0,00550600 (-47.1%)
100     1000    0,01084500         0,00601100 (-44.6%)
500     200     0,01490600         0,01394100 (-6.5%)
2500    40      0,03285100         0,05143000 (+56.6%)
8000    12      0,08971500         0,14662500 (+63.4%)

vprtybd:
rept    loop    master             patch
8       12500   0,00665800         0,00652800 (-2.0%)
25      4000    0,00589300         0,00670400 (+13.8%)
100     1000    0,00646800         0,00743900 (+15.0%)
500     200     0,01065800         0,01586400 (+48.8%)
2500    40      0,03497000         0,07180100 (+105.3%)
8000    12      0,09242200         0,21566600 (+133.3%)

vprtybq:
rept    loop    master             patch
8       12500   0,00656200         0,00665800 (+1.5%)
25      4000    0,00620500         0,00644900 (+3.9%)
100     1000    0,00707500         0,00764900 (+8.1%)
500     200     0,01203500         0,01349500 (+12.1%)
2500    40      0,03505700         0,04123100 (+17.6%)
8000    12      0,09590600         0,11586700 (+20.8%)

I wasn't expecting such a performance lost in both VPRTYBD and VPRTYBQ,
I'm not sure if it's worth to move those instructions. Comparing the
assembly of the helper with the TCGop they are pretty similar, so
I'm not sure why vprtybd took so much more time.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/helper.h                 |  4 +-
 target/ppc/insn32.decode            |  4 ++
 target/ppc/int_helper.c             | 25 +--------
 target/ppc/translate/vmx-impl.c.inc | 80 +++++++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  3 --
 5 files changed, 83 insertions(+), 33 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index b2e910b089..a06193bc67 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -193,9 +193,7 @@ DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vslv, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_2(vprtybw, TCG_CALL_NO_RWG, void, avr, avr)
-DEF_HELPER_FLAGS_2(vprtybd, TCG_CALL_NO_RWG, void, avr, avr)
-DEF_HELPER_FLAGS_2(vprtybq, TCG_CALL_NO_RWG, void, avr, avr)
+DEF_HELPER_FLAGS_3(VPRTYBQ, TCG_CALL_NO_RWG, void, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddsbs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddshs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddsws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 2658dd3395..aa4968e6b9 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -529,6 +529,10 @@ VCTZDM          000100 ..... ..... ..... 11111000100    @VX
 VPDEPD          000100 ..... ..... ..... 10111001101    @VX
 VPEXTD          000100 ..... ..... ..... 10110001101    @VX
 
+VPRTYBD         000100 ..... 01001 ..... 11000000010    @VX_tb
+VPRTYBQ         000100 ..... 01010 ..... 11000000010    @VX_tb
+VPRTYBW         000100 ..... 01000 ..... 11000000010    @VX_tb
+
 ## Vector Permute and Formatting Instruction
 
 VEXTDUBVLX      000100 ..... ..... ..... ..... 011000   @VA
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index c7fd0d1faa..c6ce4665fa 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -492,31 +492,8 @@ static inline void set_vscr_sat(CPUPPCState *env)
     env->vscr_sat.u32[0] = 1;
 }
 
-/* vprtybw */
-void helper_vprtybw(ppc_avr_t *r, ppc_avr_t *b)
-{
-    int i;
-    for (i = 0; i < ARRAY_SIZE(r->u32); i++) {
-        uint64_t res = b->u32[i] ^ (b->u32[i] >> 16);
-        res ^= res >> 8;
-        r->u32[i] = res & 1;
-    }
-}
-
-/* vprtybd */
-void helper_vprtybd(ppc_avr_t *r, ppc_avr_t *b)
-{
-    int i;
-    for (i = 0; i < ARRAY_SIZE(r->u64); i++) {
-        uint64_t res = b->u64[i] ^ (b->u64[i] >> 32);
-        res ^= res >> 16;
-        res ^= res >> 8;
-        r->u64[i] = res & 1;
-    }
-}
-
 /* vprtybq */
-void helper_vprtybq(ppc_avr_t *r, ppc_avr_t *b)
+void helper_VPRTYBQ(ppc_avr_t *r, ppc_avr_t *b, uint32_t v)
 {
     uint64_t res = b->u64[0] ^ b->u64[1];
     res ^= res >> 32;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index b9a9e83ab3..23601942bc 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1659,9 +1659,83 @@ GEN_VXFORM_NOA_ENV(vrfim, 5, 11);
 GEN_VXFORM_NOA_ENV(vrfin, 5, 8);
 GEN_VXFORM_NOA_ENV(vrfip, 5, 10);
 GEN_VXFORM_NOA_ENV(vrfiz, 5, 9);
-GEN_VXFORM_NOA(vprtybw, 1, 24);
-GEN_VXFORM_NOA(vprtybd, 1, 24);
-GEN_VXFORM_NOA(vprtybq, 1, 24);
+
+static void gen_vprtyb_vec(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    int i;
+    TCGv_vec tmp = tcg_temp_new_vec_matching(b);
+    /* MO_32 is 2, so 2 iteractions for MO_32 and 3 for MO_64 */
+    for (i = 0; i < vece; i++) {
+        tcg_gen_shri_vec(vece, tmp, b, (4 << (vece - i)));
+        tcg_gen_xor_vec(vece, b, tmp, b);
+    }
+    tcg_gen_and_vec(vece, t, b, tcg_constant_vec_matching(t, vece, 1));
+    tcg_temp_free_vec(tmp);
+}
+
+/* vprtybw */
+static void gen_vprtyb_i32(TCGv_i32 t, TCGv_i32 b)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    tcg_gen_shri_i32(tmp, b, 16);
+    tcg_gen_xor_i32(b, tmp, b);
+    tcg_gen_shri_i32(tmp, b, 8);
+    tcg_gen_xor_i32(b, tmp, b);
+    tcg_gen_and_i32(t, b, tcg_constant_i32(1));
+    tcg_temp_free_i32(tmp);
+}
+
+/* vprtybd */
+static void gen_vprtyb_i64(TCGv_i64 t, TCGv_i64 b)
+{
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    tcg_gen_shri_i64(tmp, b, 32);
+    tcg_gen_xor_i64(b, tmp, b);
+    tcg_gen_shri_i64(tmp, b, 16);
+    tcg_gen_xor_i64(b, tmp, b);
+    tcg_gen_shri_i64(tmp, b, 8);
+    tcg_gen_xor_i64(b, tmp, b);
+    tcg_gen_and_i64(t, b, tcg_constant_i64(1));
+    tcg_temp_free_i64(tmp);
+}
+
+static bool do_vx_vprtyb(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_shri_vec, 0
+    };
+
+    static const GVecGen2 op[] = {
+        {
+            .fniv = gen_vprtyb_vec,
+            .fni4 = gen_vprtyb_i32,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vprtyb_vec,
+            .fni8 = gen_vprtyb_i64,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+        {
+            .fno = gen_helper_VPRTYBQ,
+            .vece = MO_128
+        },
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_2(avr_full_offset(a->vrt), avr_full_offset(a->vrb),
+                   16, 16, &op[vece - MO_32]);
+
+    return true;
+}
+
+TRANS(VPRTYBW, do_vx_vprtyb, MO_32)
+TRANS(VPRTYBD, do_vx_vprtyb, MO_64)
+TRANS(VPRTYBQ, do_vx_vprtyb, MO_128)
 
 static void gen_vsplt(DisasContext *ctx, int vece)
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 27908533dd..46a620a232 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -106,9 +106,6 @@ GEN_VXFORM_300(vsrv, 2, 28),
 GEN_VXFORM_300(vslv, 2, 29),
 GEN_VXFORM(vslo, 6, 16),
 GEN_VXFORM(vsro, 6, 17),
-GEN_HANDLER_E_2(vprtybw, 0x4, 0x1, 0x18, 8, 0, PPC_NONE, PPC2_ISA300),
-GEN_HANDLER_E_2(vprtybd, 0x4, 0x1, 0x18, 9, 0, PPC_NONE, PPC2_ISA300),
-GEN_HANDLER_E_2(vprtybq, 0x4, 0x1, 0x18, 10, 0, PPC_NONE, PPC2_ISA300),
 
 GEN_VXFORM(xpnd04_1, 0, 22),
 GEN_VXFORM_300(bcdsr, 0, 23),
-- 
2.37.3


