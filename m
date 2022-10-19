Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D709C604667
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:09:32 +0200 (CEST)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8p9-0007ym-Q2
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8Yb-0005cf-GN; Wed, 19 Oct 2022 08:52:25 -0400
Received: from [200.168.210.66] (port=3639 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8YX-00025u-9N; Wed, 19 Oct 2022 08:52:25 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 19 Oct 2022 09:50:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 6E78F800150;
 Wed, 19 Oct 2022 09:50:43 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 05/12] target/ppc: Move VPRTYB[WDQ] to decodetree and use
 gvec
Date: Wed, 19 Oct 2022 09:50:33 -0300
Message-Id: <20221019125040.48028-6-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
References: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 Oct 2022 12:50:43.0796 (UTC)
 FILETIME=[66A4C940:01D8E3B9]
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
8       12500   0,01198900         0,00703100 (-41.4%)
25      4000    0,01070100         0,00571400 (-46.6%)
100     1000    0,01123300         0,00678200 (-39.6%)
500     200     0,01601500         0,01535600 (-4.1%)
2500    40      0,03872900         0,05562100 (43.6%)
8000    12      0,10047000         0,16643000 (65.7%)

vprtybd:
rept    loop    master             patch
8       12500   0,00757700         0,00788100 (4.0%)
25      4000    0,00652500         0,00669600 (2.6%)
100     1000    0,00714400         0,00825400 (15.5%)
500     200     0,01211000         0,01903700 (57.2%)
2500    40      0,03483800         0,07021200 (101.5%)
8000    12      0,09591800         0,21036200 (119.3%)

vprtybq:
rept    loop    master             patch
8       12500   0,00675600         0,00667200 (-1.2%)
25      4000    0,00619400         0,00643200 (3.8%)
100     1000    0,00707100         0,00751100 (6.2%)
500     200     0,01199300         0,01342000 (11.9%)
2500    40      0,03490900         0,04092900 (17.2%)
8000    12      0,09588200         0,11465100 (19.6%)

I wasn't expecting such a performance lost in both VPRTYBD and VPRTYBQ,
I'm not sure if it's worth to move those instructions. Comparing the
assembly of the helper with the TCGop they are pretty similar, so
I'm not sure why vprtybd took so much more time.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                 |  4 +-
 target/ppc/insn32.decode            |  4 ++
 target/ppc/int_helper.c             | 25 +----------
 target/ppc/translate/vmx-impl.c.inc | 68 +++++++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  3 --
 5 files changed, 71 insertions(+), 33 deletions(-)

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
index b9a9e83ab3..cbb2a3ebe7 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1659,9 +1659,71 @@ GEN_VXFORM_NOA_ENV(vrfim, 5, 11);
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
+    tcg_gen_ctpop_i32(t, b);
+    tcg_gen_and_i32(t, t, tcg_constant_i32(1));
+}
+
+/* vprtybd */
+static void gen_vprtyb_i64(TCGv_i64 t, TCGv_i64 b)
+{
+    tcg_gen_ctpop_i64(t, b);
+    tcg_gen_and_i64(t, t, tcg_constant_i64(1));
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


