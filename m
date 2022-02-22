Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999C94BFEED
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:37:02 +0100 (CET)
Received: from localhost ([::1]:44136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMY9t-0008Sw-2P
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:37:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWMo-0008Ax-4k; Tue, 22 Feb 2022 09:42:14 -0500
Received: from [187.72.171.209] (port=44973 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWMk-0005xE-SG; Tue, 22 Feb 2022 09:42:13 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 359458000A7;
 Tue, 22 Feb 2022 11:37:44 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 24/47] target/ppc: move vrl[bhwd]nm/vrl[bhwd]mi to
 decodetree
Date: Tue, 22 Feb 2022 11:36:22 -0300
Message-Id: <20220222143646.1268606-25-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:44.0556 (UTC)
 FILETIME=[C0FCC2C0:01D827F9]
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
 target/ppc/helper.h                 |   8 +-
 target/ppc/insn32.decode            |   6 ++
 target/ppc/int_helper.c             |  50 ++++-----
 target/ppc/translate/vmx-impl.c.inc | 152 ++++++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |   5 +-
 5 files changed, 182 insertions(+), 39 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 269150b197..a2a0d461dd 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -275,10 +275,10 @@ DEF_HELPER_4(vmaxfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vminfp, void, env, avr, avr, avr)
 DEF_HELPER_3(vrefp, void, env, avr, avr)
 DEF_HELPER_3(vrsqrtefp, void, env, avr, avr)
-DEF_HELPER_3(vrlwmi, void, avr, avr, avr)
-DEF_HELPER_3(vrldmi, void, avr, avr, avr)
-DEF_HELPER_3(vrldnm, void, avr, avr, avr)
-DEF_HELPER_3(vrlwnm, void, avr, avr, avr)
+DEF_HELPER_4(VRLWMI, void, avr, avr, avr, i32)
+DEF_HELPER_4(VRLDMI, void, avr, avr, avr, i32)
+DEF_HELPER_4(VRLDNM, void, avr, avr, avr, i32)
+DEF_HELPER_4(VRLWNM, void, avr, avr, avr, i32)
 DEF_HELPER_5(vmaddfp, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vnmsubfp, void, env, avr, avr, avr, avr)
 DEF_HELPER_3(vexptefp, void, env, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d918e2d0f2..e788dc5152 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -492,6 +492,12 @@ VRLH            000100 ..... ..... ..... 00001000100    @VX
 VRLW            000100 ..... ..... ..... 00010000100    @VX
 VRLD            000100 ..... ..... ..... 00011000100    @VX
 
+VRLWMI          000100 ..... ..... ..... 00010000101    @VX
+VRLDMI          000100 ..... ..... ..... 00011000101    @VX
+
+VRLWNM          000100 ..... ..... ..... 00110000101    @VX
+VRLDNM          000100 ..... ..... ..... 00111000101    @VX
+
 ## Vector Integer Arithmetic Instructions
 
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 0a094b535a..58e57b2563 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1291,33 +1291,33 @@ void helper_vrsqrtefp(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *b)
     }
 }
 
-#define VRLMI(name, size, element, insert)                            \
-void helper_##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)          \
-{                                                                     \
-    int i;                                                            \
-    for (i = 0; i < ARRAY_SIZE(r->element); i++) {                    \
-        uint##size##_t src1 = a->element[i];                          \
-        uint##size##_t src2 = b->element[i];                          \
-        uint##size##_t src3 = r->element[i];                          \
-        uint##size##_t begin, end, shift, mask, rot_val;              \
-                                                                      \
-        shift = extract##size(src2, 0, 6);                            \
-        end   = extract##size(src2, 8, 6);                            \
-        begin = extract##size(src2, 16, 6);                           \
-        rot_val = rol##size(src1, shift);                             \
-        mask = mask_u##size(begin, end);                              \
-        if (insert) {                                                 \
-            r->element[i] = (rot_val & mask) | (src3 & ~mask);        \
-        } else {                                                      \
-            r->element[i] = (rot_val & mask);                         \
-        }                                                             \
-    }                                                                 \
+#define VRLMI(name, size, element, insert)                                  \
+void helper_##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t desc) \
+{                                                                           \
+    int i;                                                                  \
+    for (i = 0; i < ARRAY_SIZE(r->element); i++) {                          \
+        uint##size##_t src1 = a->element[i];                                \
+        uint##size##_t src2 = b->element[i];                                \
+        uint##size##_t src3 = r->element[i];                                \
+        uint##size##_t begin, end, shift, mask, rot_val;                    \
+                                                                            \
+        shift = extract##size(src2, 0, 6);                                  \
+        end   = extract##size(src2, 8, 6);                                  \
+        begin = extract##size(src2, 16, 6);                                 \
+        rot_val = rol##size(src1, shift);                                   \
+        mask = mask_u##size(begin, end);                                    \
+        if (insert) {                                                       \
+            r->element[i] = (rot_val & mask) | (src3 & ~mask);              \
+        } else {                                                            \
+            r->element[i] = (rot_val & mask);                               \
+        }                                                                   \
+    }                                                                       \
 }
 
-VRLMI(vrldmi, 64, u64, 1);
-VRLMI(vrlwmi, 32, u32, 1);
-VRLMI(vrldnm, 64, u64, 0);
-VRLMI(vrlwnm, 32, u32, 0);
+VRLMI(VRLDMI, 64, u64, 1);
+VRLMI(VRLWMI, 32, u32, 1);
+VRLMI(VRLDNM, 64, u64, 0);
+VRLMI(VRLWNM, 32, u32, 0);
 
 void helper_vsel(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b,
                  ppc_avr_t *c)
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 9dcac4243f..a025404032 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -799,7 +799,6 @@ static void trans_vclzd(DisasContext *ctx)
 }
 
 GEN_VXFORM_V(vmuluwm, MO_32, tcg_gen_gvec_mul, 4, 2);
-GEN_VXFORM(vrlwnm, 2, 6);
 GEN_VXFORM(vsrv, 2, 28);
 GEN_VXFORM(vslv, 2, 29);
 GEN_VXFORM(vslo, 6, 16);
@@ -839,6 +838,152 @@ TRANS_FLAGS(ALTIVEC, VRLH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_rotlv)
 TRANS_FLAGS(ALTIVEC, VRLW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_rotlv)
 TRANS_FLAGS2(ALTIVEC_207, VRLD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_rotlv)
 
+static TCGv_vec do_vrl_mask_vec(unsigned vece, TCGv_vec vrb)
+{
+    TCGv_vec t0 = tcg_temp_new_vec_matching(vrb),
+             t1 = tcg_temp_new_vec_matching(vrb),
+             t2 = tcg_temp_new_vec_matching(vrb),
+             ones = tcg_constant_vec_matching(vrb, vece, -1);
+
+    /* Extract b and e */
+    tcg_gen_dupi_vec(vece, t2, (8 << vece) - 1);
+
+    tcg_gen_shri_vec(vece, t0, vrb, 16);
+    tcg_gen_and_vec(vece, t0, t0, t2);
+
+    tcg_gen_shri_vec(vece, t1, vrb, 8);
+    tcg_gen_and_vec(vece, t1, t1, t2);
+
+    /* Compare b and e to negate the mask where begin > end */
+    tcg_gen_cmp_vec(TCG_COND_GT, vece, t2, t0, t1);
+
+    /* Create the mask with (~0 >> b) ^ ((~0 >> e) >> 1) */
+    tcg_gen_shrv_vec(vece, t0, ones, t0);
+    tcg_gen_shrv_vec(vece, t1, ones, t1);
+    tcg_gen_shri_vec(vece, t1, t1, 1);
+    tcg_gen_xor_vec(vece, t0, t0, t1);
+
+    /* negate the mask */
+    tcg_gen_xor_vec(vece, t0, t0, t2);
+
+    tcg_temp_free_vec(t1);
+    tcg_temp_free_vec(t2);
+
+    return t0;
+}
+
+static void gen_vrlnm_vec(unsigned vece, TCGv_vec vrt, TCGv_vec vra,
+                          TCGv_vec vrb)
+{
+    TCGv_vec mask, n = tcg_temp_new_vec_matching(vrt);
+
+    /* Create the mask */
+    mask = do_vrl_mask_vec(vece, vrb);
+
+    /* Extract n */
+    tcg_gen_dupi_vec(vece, n, (8 << vece) - 1);
+    tcg_gen_and_vec(vece, n, vrb, n);
+
+    /* Rotate and mask */
+    tcg_gen_rotlv_vec(vece, vrt, vra, n);
+    tcg_gen_and_vec(vece, vrt, vrt, mask);
+
+    tcg_temp_free_vec(n);
+    tcg_temp_free_vec(mask);
+}
+
+static bool do_vrlnm(DisasContext *ctx, arg_VX *a, int vece)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_cmp_vec, INDEX_op_rotlv_vec, INDEX_op_sari_vec,
+        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_shrv_vec, 0
+    };
+    static const GVecGen3 ops[2] = {
+        {
+            .fniv = gen_vrlnm_vec,
+            .fno = gen_helper_VRLWNM,
+            .opt_opc = vecop_list,
+            .load_dest = true,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vrlnm_vec,
+            .fno = gen_helper_VRLDNM,
+            .opt_opc = vecop_list,
+            .load_dest = true,
+            .vece = MO_64
+        }
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &ops[vece - 2]);
+
+    return true;
+}
+
+TRANS(VRLWNM, do_vrlnm, MO_32)
+TRANS(VRLDNM, do_vrlnm, MO_64)
+
+static void gen_vrlmi_vec(unsigned vece, TCGv_vec vrt, TCGv_vec vra,
+                          TCGv_vec vrb)
+{
+    TCGv_vec mask, n = tcg_temp_new_vec_matching(vrt),
+             tmp = tcg_temp_new_vec_matching(vrt);
+
+    /* Create the mask */
+    mask = do_vrl_mask_vec(vece, vrb);
+
+    /* Extract n */
+    tcg_gen_dupi_vec(vece, n, (8 << vece) - 1);
+    tcg_gen_and_vec(vece, n, vrb, n);
+
+    /* Rotate and insert */
+    tcg_gen_rotlv_vec(vece, tmp, vra, n);
+    tcg_gen_bitsel_vec(vece, vrt, mask, tmp, vrt);
+
+    tcg_temp_free_vec(n);
+    tcg_temp_free_vec(tmp);
+    tcg_temp_free_vec(mask);
+}
+
+static bool do_vrlmi(DisasContext *ctx, arg_VX *a, int vece)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_cmp_vec, INDEX_op_rotlv_vec, INDEX_op_sari_vec,
+        INDEX_op_shli_vec, INDEX_op_shri_vec, INDEX_op_shrv_vec, 0
+    };
+    static const GVecGen3 ops[2] = {
+        {
+            .fniv = gen_vrlmi_vec,
+            .fno = gen_helper_VRLWMI,
+            .opt_opc = vecop_list,
+            .load_dest = true,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_vrlnm_vec,
+            .fno = gen_helper_VRLDMI,
+            .opt_opc = vecop_list,
+            .load_dest = true,
+            .vece = MO_64
+        }
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &ops[vece - 2]);
+
+    return true;
+}
+
+TRANS(VRLWMI, do_vrlmi, MO_32)
+TRANS(VRLDMI, do_vrlmi, MO_64)
+
 static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
                                  bool alg)
 {
@@ -973,12 +1118,7 @@ GEN_VXFORM3(vsubeuqm, 31, 0);
 GEN_VXFORM3(vsubecuq, 31, 0);
 GEN_VXFORM_DUAL(vsubeuqm, PPC_NONE, PPC2_ALTIVEC_207, \
             vsubecuq, PPC_NONE, PPC2_ALTIVEC_207)
-GEN_VXFORM(vrlwmi, 2, 2);
-GEN_VXFORM(vrldmi, 2, 3);
 GEN_VXFORM_TRANS(vsl, 2, 7);
-GEN_VXFORM(vrldnm, 2, 7);
-GEN_VXFORM_DUAL(vsl, PPC_ALTIVEC, PPC_NONE, \
-                vrldnm, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_TRANS(vsr, 2, 11);
 GEN_VXFORM_ENV(vpkuhum, 7, 0);
 GEN_VXFORM_ENV(vpkuwum, 7, 1);
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index a7acea3ca7..3a8a9cc564 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -102,7 +102,6 @@ GEN_VXFORM_300(vextubrx, 6, 28),
 GEN_VXFORM_300(vextuhrx, 6, 29),
 GEN_VXFORM_DUAL(vmrgew, vextuwrx, 6, 30, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_207(vmuluwm, 4, 2),
-GEN_VXFORM_300(vrlwnm, 2, 6),
 GEN_VXFORM_300(vsrv, 2, 28),
 GEN_VXFORM_300(vslv, 2, 29),
 GEN_VXFORM(vslo, 6, 16),
@@ -133,9 +132,7 @@ GEN_VXFORM_DUAL(vaddeuqm, vaddecuq, 30, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
-GEN_VXFORM_300(vrlwmi, 2, 2),
-GEN_VXFORM_300(vrldmi, 2, 3),
-GEN_VXFORM_DUAL(vsl, vrldnm, 2, 7, PPC_ALTIVEC, PPC_NONE),
+GEN_VXFORM(vsl, 2, 7),
 GEN_VXFORM(vsr, 2, 11),
 GEN_VXFORM(vpkuhum, 7, 0),
 GEN_VXFORM(vpkuwum, 7, 1),
-- 
2.25.1


