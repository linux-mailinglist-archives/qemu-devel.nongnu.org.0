Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B0C5FA47C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 22:04:04 +0200 (CEST)
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohz0N-00065p-8n
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 16:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ohyFf-00028h-PL; Mon, 10 Oct 2022 15:15:47 -0400
Received: from [200.168.210.66] (port=19040 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ohyFc-0003Ag-Iq; Mon, 10 Oct 2022 15:15:47 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 10 Oct 2022 16:14:01 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 95372800631;
 Mon, 10 Oct 2022 16:14:01 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 12/12] target/ppc: Use gvec to decode XVTSTDC[DS]P
Date: Mon, 10 Oct 2022 16:13:56 -0300
Message-Id: <20221010191356.83659-13-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
References: <20221010191356.83659-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Oct 2022 19:14:01.0876 (UTC)
 FILETIME=[74D98D40:01D8DCDC]
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

Used gvec to translate XVTSTDCSP and XVTSTDCDP.

xvtstdcsp:
rept    loop    imm     prev version        current version
25      4000    0       0,047550            0,040820 (-14.2%)
25      4000    1       0,069520            0,053520 (-23.0%)
25      4000    3       0,078660            0,058470 (-25.7%)
25      4000    51      0,099280            0,190100 (+91.5%)
25      4000    127     0,129690            0,201750 (+55.6%)
8000    12      0       0,554625            0,391385 (-29.4%)
8000    12      1       2,675635            1,423656 (-46.8%)
8000    12      3       3,186823            1,756885 (-44.9%)
8000    12      51      4,284417            1,363698 (-68.2%)
8000    12      127     5,638000            1,305333 (-76.8%)

xvtstdcdp:
rept    loop    imm     prev version        current version
25      4000    0       0,047450            0,040590 (-14.5%)
25      4000    1       0,074130            0,053570 (-27.7%)
25      4000    3       0,084180            0,063020 (-25.1%)
25      4000    51      0,103340            0,127980 (+23.8%)
25      4000    127     0,134670            0,128660 (-4.5%)
8000    12      0       0,522427            0,391510 (-25.1%)
8000    12      1       2,884708            1,426802 (-50.5%)
8000    12      3       3,427625            1,972115 (-42.5%)
8000    12      51      4,450260            1,251865 (-71.9%)
8000    12      127     5,854479            1,250719 (-78.6%)

Overall, these instructions are the hardest ones to measure performance
as the gvec implementation is affected by the immediate. Above there are
5 different scenarios when it comes to immediate and 2 when it comes to
rept/loop combination. The immediates scenarios are: all bits are 0
therefore the target register should just be changed to 0, with 1 bit
set, with 2 bits set in a combination the new implementation can deal
with using gvec, 4 bits set and the new implementation can't deal with
it using gvec and all bits set. The rept/loop scenarios are high loop
and low rept (so it should spend more time executing it than translating
it) and high rept low loop (so it should spend more time translating it
than executing this code).
There was a gain when it came to translating the instructions
and in the execution time in the immediates the new implementation is
configured to accept, but a loss in performance in execution time for
more exoteric immediates.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/fpu_helper.c             |   7 +-
 target/ppc/helper.h                 |   4 +-
 target/ppc/translate/vsx-impl.c.inc | 188 ++++++++++++++++++++++++++--
 3 files changed, 184 insertions(+), 15 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index a66e16c212..6c94576575 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -22,6 +22,7 @@
 #include "exec/exec-all.h"
 #include "internal.h"
 #include "fpu/softfloat.h"
+#include "tcg/tcg-gvec-desc.h"
 
 static inline float128 float128_snan_to_qnan(float128 x)
 {
@@ -3263,17 +3264,19 @@ VSX_TSTDC(float64)
 VSX_TSTDC(float128)
 #undef VSX_TSTDC
 
-void helper_XVTSTDCDP(ppc_vsr_t *t, ppc_vsr_t *b, uint64_t dcmx, uint32_t v)
+void helper_XVTSTDCDP(ppc_vsr_t *t, ppc_vsr_t *b, uint32_t dcmx)
 {
     int i;
+    dcmx = simd_data(dcmx);
     for (i = 0; i < 2; i++) {
         t->s64[i] = (int64_t)-float64_tstdc(b->f64[i], dcmx);
     }
 }
 
-void helper_XVTSTDCSP(ppc_vsr_t *t, ppc_vsr_t *b, uint64_t dcmx, uint32_t v)
+void helper_XVTSTDCSP(ppc_vsr_t *t, ppc_vsr_t *b, uint32_t dcmx)
 {
     int i;
+    dcmx = simd_data(dcmx);
     for (i = 0; i < 4; i++) {
         t->s32[i] = (int32_t)-float32_tstdc(b->f32[i], dcmx);
     }
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 8344fe39c6..2851418acc 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -517,8 +517,8 @@ DEF_HELPER_3(xvcvsxdsp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvuxdsp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvsxwsp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvuxwsp, void, env, vsr, vsr)
-DEF_HELPER_FLAGS_4(XVTSTDCSP, TCG_CALL_NO_RWG, void, vsr, vsr, i64, i32)
-DEF_HELPER_FLAGS_4(XVTSTDCDP, TCG_CALL_NO_RWG, void, vsr, vsr, i64, i32)
+DEF_HELPER_FLAGS_3(XVTSTDCSP, TCG_CALL_NO_RWG, void, vsr, vsr, i32)
+DEF_HELPER_FLAGS_3(XVTSTDCDP, TCG_CALL_NO_RWG, void, vsr, vsr, i32)
 DEF_HELPER_3(xvrspi, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspic, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspim, void, env, vsr, vsr)
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 4fdbc45ff4..26fc8c0b01 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -632,6 +632,8 @@ static void gen_mtvsrws(DisasContext *ctx)
 #define SGN_MASK_SP 0x8000000080000000ull
 #define EXP_MASK_DP  0x7FF0000000000000ull
 #define EXP_MASK_SP 0x7F8000007F800000ull
+#define FRC_MASK_DP (~(SGN_MASK_DP | EXP_MASK_DP))
+#define FRC_MASK_SP (~(SGN_MASK_SP | EXP_MASK_SP))
 
 #define VSX_SCALAR_MOVE(name, op, sgn_mask)                       \
 static void glue(gen_, name)(DisasContext *ctx)                   \
@@ -1113,23 +1115,187 @@ GEN_VSX_HELPER_X2(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300)
 GEN_VSX_HELPER_R2(xscvsdqp, 0x04, 0x1A, 0x0A, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvspdp, 0x12, 0x14, 0, PPC2_VSX)
 
+/* test if +Inf */
+static void gen_is_pos_inf(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, exp_msk));
+}
+
+/* test if -Inf */
+static void gen_is_neg_inf(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, sgn_msk | exp_msk));
+}
+
+/* test if +Inf or -Inf */
+static void gen_is_any_inf(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_andc_vec(vece, b, b, tcg_constant_vec_matching(t, vece, exp_msk));
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, sgn_msk));
+}
+
+/* test if +0 */
+static void gen_is_pos_zero(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, 0));
+}
+
+/* test if -0 */
+static void gen_is_neg_zero(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, sgn_msk));
+}
+
+/* test if +0 or -0 */
+static void gen_is_any_zero(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_and_vec(vece, b, b, tcg_constant_vec_matching(t, vece, ~sgn_msk));
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, 0));
+}
+
+/* test if +Denormal */
+static void gen_is_pos_denormal(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    uint64_t frc_msk = (vece == MO_32) ? (uint32_t)FRC_MASK_SP : FRC_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_LEU, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, frc_msk));
+    tcg_gen_cmp_vec(TCG_COND_NE, vece, b, b,
+                    tcg_constant_vec_matching(t, vece, 0));
+    tcg_gen_and_vec(vece, t, t, b);
+}
+
+/* test if -Denormal */
+static void gen_is_neg_denormal(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    uint64_t frc_msk = (vece == MO_32) ? (uint32_t)FRC_MASK_SP : FRC_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_LEU, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, sgn_msk | frc_msk));
+    tcg_gen_cmp_vec(TCG_COND_GTU, vece, b, b,
+                    tcg_constant_vec_matching(t, vece, sgn_msk));
+    tcg_gen_and_vec(vece, t, t, b);
+}
+
+/* test if +Denormal or -Denormal */
+static void gen_is_any_denormal(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    uint64_t frc_msk = (vece == MO_32) ? (uint32_t)FRC_MASK_SP : FRC_MASK_DP;
+    tcg_gen_and_vec(vece, b, b, tcg_constant_vec_matching(t, vece, ~sgn_msk));
+    tcg_gen_cmp_vec(TCG_COND_LE, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, frc_msk));
+    tcg_gen_cmp_vec(TCG_COND_NE, vece, b, b,
+                    tcg_constant_vec_matching(t, vece, 0));
+    tcg_gen_and_vec(vece, t, t, b);
+}
+
+/* test if NaN */
+static void gen_is_nan(unsigned vece, TCGv_vec t, TCGv_vec b)
+{
+    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_and_vec(vece, b, b, tcg_constant_vec_matching(t, vece, ~sgn_msk));
+    tcg_gen_cmp_vec(TCG_COND_GT, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, exp_msk));
+}
+
 static bool do_xvtstdc(DisasContext *ctx, arg_XX2_uim *a, unsigned vece)
 {
-    static const GVecGen2i op[] = {
-        {
-            .fnoi = gen_helper_XVTSTDCSP,
-            .vece = MO_32
-        },
-        {
-            .fnoi = gen_helper_XVTSTDCDP,
-            .vece = MO_64
-        },
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_cmp_vec, 0
+    };
+
+    GVecGen2 op = {
+        .fno = (vece == MO_32) ? gen_helper_XVTSTDCSP : gen_helper_XVTSTDCDP,
+        .vece = vece,
+        .opt_opc = vecop_list
     };
 
     REQUIRE_VSX(ctx);
 
-    tcg_gen_gvec_2i(vsr_full_offset(a->xt), vsr_full_offset(a->xb),
-                    16, 16, (int32_t)(a->uim), &op[vece - MO_32]);
+    switch (a->uim) {
+    case 0:
+        set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
+        set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
+        break;
+    case ((1 << 0) | (1 << 1)):
+        /* test if +Denormal or -Denormal */
+        op.fniv = gen_is_any_denormal,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    case (1 << 0):
+        /* test if -Denormal */
+        op.fniv = gen_is_neg_denormal,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    case (1 << 1):
+        /* test if +Denormal */
+        op.fniv = gen_is_pos_denormal,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    case ((1 << 2) | (1 << 3)):
+        /* test if +0 or -0 */
+        op.fniv = gen_is_any_zero,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    case (1 << 2):
+        /* test if -0 */
+        op.fniv = gen_is_neg_zero,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    case (1 << 3):
+        /* test if +0 */
+        op.fniv = gen_is_pos_zero,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    case ((1 << 4) | (1 << 5)):
+        /* test if +Inf or -Inf */
+        op.fniv = gen_is_any_inf,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    case (1 << 4):
+        /* test if -Inf */
+        op.fniv = gen_is_neg_inf,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    case (1 << 5):
+        /* test if +Inf */
+        op.fniv = gen_is_pos_inf,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    case (1 << 6):
+        /* test if NaN */
+        op.fniv = gen_is_nan,
+        tcg_gen_gvec_2(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16, 16,
+                       &op);
+        break;
+    default:
+        tcg_gen_gvec_2_ool(vsr_full_offset(a->xt), vsr_full_offset(a->xb), 16,
+                           16, (int32_t)(a->uim), op.fno);
+        break;
+    }
 
     return true;
 }
-- 
2.37.3


