Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF1560466B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:09:48 +0200 (CEST)
Received: from localhost ([::1]:51246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8pO-0000V6-Gd
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:09:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8Yn-0006Jq-TR; Wed, 19 Oct 2022 08:52:38 -0400
Received: from [200.168.210.66] (port=3639 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8Yc-00025u-If; Wed, 19 Oct 2022 08:52:37 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 19 Oct 2022 09:50:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B1FFA800278;
 Wed, 19 Oct 2022 09:50:43 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 06/12] target/ppc: Move VAVG[SU][BHW] to decodetree and use
 gvec
Date: Wed, 19 Oct 2022 09:50:34 -0300
Message-Id: <20221019125040.48028-7-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
References: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 Oct 2022 12:50:44.0062 (UTC)
 FILETIME=[66CD5FE0:01D8E3B9]
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

Moved the instructions VAVGUB, VAVGUH, VAVGUW, VAVGSB, VAVGSH, VAVGSW,
to decodetree and use gvec with them. For these one the right shift
had to be made before the sum as to avoid an overflow, so add 1 at the
end if any of the entries had 1 in its LSB as to replicate the "+ 1"
before the shift described by the ISA.

vavgub:
rept    loop    master             patch
8       12500   0,02616600         0,00754200 (-71.2%)
25      4000    0,02530000         0,00637700 (-74.8%)
100     1000    0,02604600         0,00790100 (-69.7%)
500     200     0,03189300         0,01838400 (-42.4%)
2500    40      0,06006900         0,06851000 (+14.1%)
8000    12      0,13941000         0,20548500 (+47.4%)

vavguh:
rept    loop    master             patch
8       12500   0,01818200         0,00780600 (-57.1%)
25      4000    0,01789300         0,00641600 (-64.1%)
100     1000    0,01899100         0,00787200 (-58.5%)
500     200     0,02527200         0,01828400 (-27.7%)
2500    40      0,05361800         0,06773000 (+26.3%)
8000    12      0,12886600         0,20291400 (+57.5%)

vavguw:
rept    loop    master             patch
8       12500   0,01423100         0,00776600 (-45.4%)
25      4000    0,01780800         0,00638600 (-64.1%)
100     1000    0,02085500         0,00787000 (-62.3%)
500     200     0,02737100         0,01828800 (-33.2%)
2500    40      0,05572600         0,06774200 (+21.6%)
8000    12      0,13101700         0,20311600 (+55.0%)

vavgsb:
rept    loop    master             patch
8       12500   0,03006000         0,00788600 (-73.8%)
25      4000    0,02882200         0,00637800 (-77.9%)
100     1000    0,02958000         0,00791400 (-73.2%)
500     200     0,03548800         0,01860400 (-47.6%)
2500    40      0,06360000         0,06850800 (+7.7%)
8000    12      0,13816500         0,20550300 (+48.7%)

vavgsh:
rept    loop    master             patch
8       12500   0,01965900         0,00776600 (-60.5%)
25      4000    0,01875400         0,00638700 (-65.9%)
100     1000    0,01952200         0,00786900 (-59.7%)
500     200     0,02562000         0,01760300 (-31.3%)
2500    40      0,05384300         0,06742800 (+25.2%)
8000    12      0,13240800         0,20330000 (+53.5%)

vavgsw:
rept    loop    master             patch
8       12500   0,01407700         0,00775600 (-44.9%)
25      4000    0,01762300         0,00640000 (-63.7%)
100     1000    0,02046500         0,00788500 (-61.5%)
500     200     0,02745600         0,01843000 (-32.9%)
2500    40      0,05375500         0,06820500 (+26.9%)
8000    12      0,13068300         0,20304900 (+55.4%)

These results to me seems to indicate that with gvec the results have a
slower translation but faster execution.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/helper.h                 |  12 ++--
 target/ppc/insn32.decode            |   9 +++
 target/ppc/int_helper.c             |  32 ++++-----
 target/ppc/translate/vmx-impl.c.inc | 106 ++++++++++++++++++++++++----
 target/ppc/translate/vmx-ops.c.inc  |   9 +--
 5 files changed, 127 insertions(+), 41 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index a06193bc67..71c22efc2e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -143,15 +143,15 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
 #define dh_ctype_acc ppc_acc_t *
 #define dh_typecode_acc dh_typecode_ptr
 
-DEF_HELPER_FLAGS_3(vavgub, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vavguh, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vavguw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VAVGUB, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VAVGUH, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VAVGUW, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_3(vabsdub, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vabsduh, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vabsduw, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vavgsb, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vavgsh, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vavgsw, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VAVGSB, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VAVGSH, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
+DEF_HELPER_FLAGS_4(VAVGSW, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_4(vcmpeqfp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgefp, void, env, avr, avr, avr)
 DEF_HELPER_4(vcmpgtfp, void, env, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index aa4968e6b9..38458c01de 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -519,6 +519,15 @@ VCMPNEZW        000100 ..... ..... ..... . 0110000111   @VC
 VCMPSQ          000100 ... -- ..... ..... 00101000001   @VX_bf
 VCMPUQ          000100 ... -- ..... ..... 00100000001   @VX_bf
 
+## Vector Integer Average Instructions
+
+VAVGSB          000100 ..... ..... ..... 10100000010    @VX
+VAVGSH          000100 ..... ..... ..... 10101000010    @VX
+VAVGSW          000100 ..... ..... ..... 10110000010    @VX
+VAVGUB          000100 ..... ..... ..... 10000000010    @VX
+VAVGUH          000100 ..... ..... ..... 10001000010    @VX
+VAVGUW          000100 ..... ..... ..... 10010000010    @VX
+
 ## Vector Bit Manipulation Instruction
 
 VGNB            000100 ..... -- ... ..... 10011001100   @VX_n
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index c6ce4665fa..bda76e54d4 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -570,25 +570,23 @@ VARITHSAT_UNSIGNED(w, u32, uint64_t, cvtsduw)
 #undef VARITHSAT_SIGNED
 #undef VARITHSAT_UNSIGNED
 
-#define VAVG_DO(name, element, etype)                                   \
-    void helper_v##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)       \
-    {                                                                   \
-        int i;                                                          \
-                                                                        \
-        for (i = 0; i < ARRAY_SIZE(r->element); i++) {                  \
-            etype x = (etype)a->element[i] + (etype)b->element[i] + 1;  \
-            r->element[i] = x >> 1;                                     \
-        }                                                               \
+#define VAVG(name, element, etype)                                          \
+    void helper_##name(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t v)\
+    {                                                                       \
+        int i;                                                              \
+                                                                            \
+        for (i = 0; i < ARRAY_SIZE(r->element); i++) {                      \
+            etype x = (etype)a->element[i] + (etype)b->element[i] + 1;      \
+            r->element[i] = x >> 1;                                         \
+        }                                                                   \
     }
 
-#define VAVG(type, signed_element, signed_type, unsigned_element,       \
-             unsigned_type)                                             \
-    VAVG_DO(avgs##type, signed_element, signed_type)                    \
-    VAVG_DO(avgu##type, unsigned_element, unsigned_type)
-VAVG(b, s8, int16_t, u8, uint16_t)
-VAVG(h, s16, int32_t, u16, uint32_t)
-VAVG(w, s32, int64_t, u32, uint64_t)
-#undef VAVG_DO
+VAVG(VAVGSB, s8, int16_t)
+VAVG(VAVGUB, u8, uint16_t)
+VAVG(VAVGSH, s16, int32_t)
+VAVG(VAVGUH, u16, uint32_t)
+VAVG(VAVGSW, s32, int64_t)
+VAVG(VAVGUW, u32, uint64_t)
 #undef VAVG
 
 #define VABSDU_DO(name, element)                                        \
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index cbb2a3ebe7..195c601f7a 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -431,21 +431,9 @@ GEN_VXFORM_V(vminsb, MO_8, tcg_gen_gvec_smin, 1, 12);
 GEN_VXFORM_V(vminsh, MO_16, tcg_gen_gvec_smin, 1, 13);
 GEN_VXFORM_V(vminsw, MO_32, tcg_gen_gvec_smin, 1, 14);
 GEN_VXFORM_V(vminsd, MO_64, tcg_gen_gvec_smin, 1, 15);
-GEN_VXFORM(vavgub, 1, 16);
 GEN_VXFORM(vabsdub, 1, 16);
-GEN_VXFORM_DUAL(vavgub, PPC_ALTIVEC, PPC_NONE, \
-                vabsdub, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM(vavguh, 1, 17);
 GEN_VXFORM(vabsduh, 1, 17);
-GEN_VXFORM_DUAL(vavguh, PPC_ALTIVEC, PPC_NONE, \
-                vabsduh, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM(vavguw, 1, 18);
 GEN_VXFORM(vabsduw, 1, 18);
-GEN_VXFORM_DUAL(vavguw, PPC_ALTIVEC, PPC_NONE, \
-                vabsduw, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM(vavgsb, 1, 20);
-GEN_VXFORM(vavgsh, 1, 21);
-GEN_VXFORM(vavgsw, 1, 22);
 GEN_VXFORM(vmrghb, 6, 0);
 GEN_VXFORM(vmrghh, 6, 1);
 GEN_VXFORM(vmrghw, 6, 2);
@@ -3373,6 +3361,100 @@ TRANS(VMULHSD, do_vx_mulh, true , do_vx_vmulhd_i64)
 TRANS(VMULHUW, do_vx_mulh, false, do_vx_vmulhw_i64)
 TRANS(VMULHUD, do_vx_mulh, false, do_vx_vmulhd_i64)
 
+static void do_vavg(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
+                    void (*gen_shr_vec)(unsigned, TCGv_vec, TCGv_vec, int64_t))
+{
+    TCGv_vec tmp = tcg_temp_new_vec_matching(t);
+    tcg_gen_or_vec(vece, tmp, a, b);
+    tcg_gen_and_vec(vece, tmp, tmp, tcg_constant_vec_matching(t, vece, 1));
+    gen_shr_vec(vece, a, a, 1);
+    gen_shr_vec(vece, b, b, 1);
+    tcg_gen_add_vec(vece, t, a, b);
+    tcg_gen_add_vec(vece, t, t, tmp);
+    tcg_temp_free_vec(tmp);
+}
+
+QEMU_FLATTEN
+static void gen_vavgu(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    do_vavg(vece, t, a, b, tcg_gen_shri_vec);
+}
+
+QEMU_FLATTEN
+static void gen_vavgs(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    do_vavg(vece, t, a, b, tcg_gen_sari_vec);
+}
+
+static bool do_vx_vavg(DisasContext *ctx, arg_VX *a, int sign, int vece)
+{
+    static const TCGOpcode vecop_list_s[] = {
+        INDEX_op_add_vec, INDEX_op_sari_vec, 0
+    };
+    static const TCGOpcode vecop_list_u[] = {
+        INDEX_op_add_vec, INDEX_op_shri_vec, 0
+    };
+
+    static const GVecGen3 op[2][3] = {
+        {
+            {
+                .fniv = gen_vavgu,
+                .fno = gen_helper_VAVGUB,
+                .opt_opc = vecop_list_u,
+                .vece = MO_8
+            },
+            {
+                .fniv = gen_vavgu,
+                .fno = gen_helper_VAVGUH,
+                .opt_opc = vecop_list_u,
+                .vece = MO_16
+            },
+            {
+                .fniv = gen_vavgu,
+                .fno = gen_helper_VAVGUW,
+                .opt_opc = vecop_list_u,
+                .vece = MO_32
+            },
+        },
+        {
+            {
+                .fniv = gen_vavgs,
+                .fno = gen_helper_VAVGSB,
+                .opt_opc = vecop_list_s,
+                .vece = MO_8
+            },
+            {
+                .fniv = gen_vavgs,
+                .fno = gen_helper_VAVGSH,
+                .opt_opc = vecop_list_s,
+                .vece = MO_16
+            },
+            {
+                .fniv = gen_vavgs,
+                .fno = gen_helper_VAVGSW,
+                .opt_opc = vecop_list_s,
+                .vece = MO_32
+            },
+        },
+    };
+
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &op[sign][vece]);
+
+
+    return true;
+}
+
+
+TRANS_FLAGS(ALTIVEC, VAVGSB, do_vx_vavg, 1, MO_8)
+TRANS_FLAGS(ALTIVEC, VAVGSH, do_vx_vavg, 1, MO_16)
+TRANS_FLAGS(ALTIVEC, VAVGSW, do_vx_vavg, 1, MO_32)
+TRANS_FLAGS(ALTIVEC, VAVGUB, do_vx_vavg, 0, MO_8)
+TRANS_FLAGS(ALTIVEC, VAVGUH, do_vx_vavg, 0, MO_16)
+TRANS_FLAGS(ALTIVEC, VAVGUW, do_vx_vavg, 0, MO_32)
+
 static bool do_vdiv_vmod(DisasContext *ctx, arg_VX *a, const int vece,
                          void (*func_32)(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b),
                          void (*func_64)(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b))
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 46a620a232..02db51def0 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -83,12 +83,9 @@ GEN_VXFORM(vminsb, 1, 12),
 GEN_VXFORM(vminsh, 1, 13),
 GEN_VXFORM(vminsw, 1, 14),
 GEN_VXFORM_207(vminsd, 1, 15),
-GEN_VXFORM_DUAL(vavgub, vabsdub, 1, 16, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_DUAL(vavguh, vabsduh, 1, 17, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_DUAL(vavguw, vabsduw, 1, 18, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM(vavgsb, 1, 20),
-GEN_VXFORM(vavgsh, 1, 21),
-GEN_VXFORM(vavgsw, 1, 22),
+GEN_VXFORM(vabsdub, 1, 16),
+GEN_VXFORM(vabsduh, 1, 17),
+GEN_VXFORM(vabsduw, 1, 18),
 GEN_VXFORM(vmrghb, 6, 0),
 GEN_VXFORM(vmrghh, 6, 1),
 GEN_VXFORM(vmrghw, 6, 2),
-- 
2.37.3


