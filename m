Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5DE5E8533
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 23:57:11 +0200 (CEST)
Received: from localhost ([::1]:39438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obqfW-0007BN-Jg
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 17:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqYD-0006vj-OC; Fri, 23 Sep 2022 17:49:38 -0400
Received: from [200.168.210.66] (port=12827 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqYB-0006ea-Kp; Fri, 23 Sep 2022 17:49:37 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 23 Sep 2022 18:47:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 3FCE0800491;
 Fri, 23 Sep 2022 18:47:58 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 09/12] target/ppc: Use gvec to decode XVCPSGN[SD]P
Date: Fri, 23 Sep 2022 18:47:51 -0300
Message-Id: <20220923214754.217819-10-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Sep 2022 21:47:58.0500 (UTC)
 FILETIME=[2548C640:01D8CF96]
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

Moved XVCPSGNSP and XVCPSGNDP to decodetree and used gvec to translate
them.

xvcpsgnsp:
rept    loop    master             patch
8       12500   0,00722000         0,00587700 (-18.6%)
25      4000    0,00604300         0,00521500 (-13.7%)
100     1000    0,00815600         0,00508500 (-37.7%)
500     200     0,02376600         0,01222600 (-48.6%)
2500    40      0,07709200         0,04158300 (-46.1%)
8000    12      0,27922100         0,12394400 (-55.6%)

xvcpsgndp:
rept    loop    master             patch
8       12500   0,00557900         0,00584900 (+4.8%)
25      4000    0,00518700         0,00502900 (-3.0%)
100     1000    0,00655900         0,00569600 (-13.2%)
500     200     0,01560900         0,01260500 (-19.2%)
2500    40      0,05899200         0,03989400 (-32.4%)
8000    12      0,20046000         0,12417700 (-38.1%)

Like the previous instructions there seemed to be a improvement on
translation time.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn32.decode            |   2 +
 target/ppc/translate/vsx-impl.c.inc | 114 ++++++++++++++--------------
 target/ppc/translate/vsx-ops.c.inc  |   3 -
 3 files changed, 60 insertions(+), 59 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 5b687078be..6549c4040e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -762,6 +762,8 @@ XVNABSDP        111100 ..... 00000 ..... 111101001 ..   @XX2
 XVNABSSP        111100 ..... 00000 ..... 110101001 ..   @XX2
 XVNEGDP         111100 ..... 00000 ..... 111111001 ..   @XX2
 XVNEGSP         111100 ..... 00000 ..... 110111001 ..   @XX2
+XVCPSGNDP       111100 ..... ..... ..... 11110000 ...   @XX3
+XVCPSGNSP       111100 ..... ..... ..... 11010000 ...   @XX3
 
 ## VSX Scalar Multiply-Add Instructions
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 426a9a3926..3e4509cb41 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -729,62 +729,6 @@ VSX_SCALAR_MOVE_QP(xsnabsqp, OP_NABS, SGN_MASK_DP)
 VSX_SCALAR_MOVE_QP(xsnegqp, OP_NEG, SGN_MASK_DP)
 VSX_SCALAR_MOVE_QP(xscpsgnqp, OP_CPSGN, SGN_MASK_DP)
 
-#define VSX_VECTOR_MOVE(name, op, sgn_mask)                      \
-static void glue(gen_, name)(DisasContext *ctx)                  \
-    {                                                            \
-        TCGv_i64 xbh, xbl, sgm;                                  \
-        if (unlikely(!ctx->vsx_enabled)) {                       \
-            gen_exception(ctx, POWERPC_EXCP_VSXU);               \
-            return;                                              \
-        }                                                        \
-        xbh = tcg_temp_new_i64();                                \
-        xbl = tcg_temp_new_i64();                                \
-        sgm = tcg_temp_new_i64();                                \
-        get_cpu_vsr(xbh, xB(ctx->opcode), true);                 \
-        get_cpu_vsr(xbl, xB(ctx->opcode), false);                \
-        tcg_gen_movi_i64(sgm, sgn_mask);                         \
-        switch (op) {                                            \
-            case OP_ABS: {                                       \
-                tcg_gen_andc_i64(xbh, xbh, sgm);                 \
-                tcg_gen_andc_i64(xbl, xbl, sgm);                 \
-                break;                                           \
-            }                                                    \
-            case OP_NABS: {                                      \
-                tcg_gen_or_i64(xbh, xbh, sgm);                   \
-                tcg_gen_or_i64(xbl, xbl, sgm);                   \
-                break;                                           \
-            }                                                    \
-            case OP_NEG: {                                       \
-                tcg_gen_xor_i64(xbh, xbh, sgm);                  \
-                tcg_gen_xor_i64(xbl, xbl, sgm);                  \
-                break;                                           \
-            }                                                    \
-            case OP_CPSGN: {                                     \
-                TCGv_i64 xah = tcg_temp_new_i64();               \
-                TCGv_i64 xal = tcg_temp_new_i64();               \
-                get_cpu_vsr(xah, xA(ctx->opcode), true);         \
-                get_cpu_vsr(xal, xA(ctx->opcode), false);        \
-                tcg_gen_and_i64(xah, xah, sgm);                  \
-                tcg_gen_and_i64(xal, xal, sgm);                  \
-                tcg_gen_andc_i64(xbh, xbh, sgm);                 \
-                tcg_gen_andc_i64(xbl, xbl, sgm);                 \
-                tcg_gen_or_i64(xbh, xbh, xah);                   \
-                tcg_gen_or_i64(xbl, xbl, xal);                   \
-                tcg_temp_free_i64(xah);                          \
-                tcg_temp_free_i64(xal);                          \
-                break;                                           \
-            }                                                    \
-        }                                                        \
-        set_cpu_vsr(xT(ctx->opcode), xbh, true);                 \
-        set_cpu_vsr(xT(ctx->opcode), xbl, false);                \
-        tcg_temp_free_i64(xbh);                                  \
-        tcg_temp_free_i64(xbl);                                  \
-        tcg_temp_free_i64(sgm);                                  \
-    }
-
-VSX_VECTOR_MOVE(xvcpsgndp, OP_CPSGN, SGN_MASK_DP)
-VSX_VECTOR_MOVE(xvcpsgnsp, OP_CPSGN, SGN_MASK_SP)
-
 #define TCG_OP_IMM_i64(FUNC, OP, IMM)                           \
     static void FUNC(TCGv_i64 t, TCGv_i64 b)                    \
     {                                                           \
@@ -855,6 +799,64 @@ TRANS(XVABSSP, do_vsx_msb_op, MO_32, do_xvabs_vec, do_xvabssp_i64)
 TRANS(XVNABSSP, do_vsx_msb_op, MO_32, do_xvnabs_vec, do_xvnabssp_i64)
 TRANS(XVNEGSP, do_vsx_msb_op, MO_32, do_xvneg_vec, do_xvnegsp_i64)
 
+static void do_xvcpsgndp_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_andi_i64(a, a, SGN_MASK_DP);
+    tcg_gen_andi_i64(b, b, ~SGN_MASK_DP);
+    tcg_gen_or_i64(t, a, b);
+}
+
+static void do_xvcpsgnsp_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_andi_i64(a, a, SGN_MASK_SP);
+    tcg_gen_andi_i64(b, b, ~SGN_MASK_SP);
+    tcg_gen_or_i64(t, a, b);
+}
+
+static void do_xvcpsgn_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec most_significant_bit = tcg_temp_new_vec_matching(t);
+    uint64_t msb = (vece == MO_32) ? SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_dupi_vec(vece, most_significant_bit, msb);
+    tcg_gen_and_vec(vece, a, a, most_significant_bit);
+    tcg_gen_andc_vec(vece, b, b, most_significant_bit);
+    tcg_gen_or_vec(vece, t, a, b);
+    tcg_temp_free_vec(most_significant_bit);
+}
+
+static bool do_xvcpsgn(DisasContext *ctx, arg_XX3 *a, unsigned vece)
+{
+    static const TCGOpcode vecop_list[] = {
+        0
+    };
+
+    static const GVecGen3 op[] = {
+        {
+            .fni8 = do_xvcpsgnsp_i64,
+            .fniv = do_xvcpsgn_vec,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = do_xvcpsgndp_i64,
+            .fniv = do_xvcpsgn_vec,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, VSX);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_3(vsr_full_offset(a->xt), vsr_full_offset(a->xa),
+                   vsr_full_offset(a->xb), 16, 16, &op[vece - MO_32]);
+
+    return true;
+}
+
+TRANS(XVCPSGNSP, do_xvcpsgn, MO_32)
+TRANS(XVCPSGNDP, do_xvcpsgn, MO_64)
+
 #define VSX_CMP(name, op1, op2, inval, type)                                  \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index b77324e0a8..f7d7377379 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -165,9 +165,6 @@ GEN_XX3FORM(name, opc2, opc3 | 1, fl2)
 GEN_XX2FORM_DCMX(xvtstdcdp, 0x14, 0x1E, PPC2_ISA300),
 GEN_XX2FORM_DCMX(xvtstdcsp, 0x14, 0x1A, PPC2_ISA300),
 
-GEN_XX3FORM(xvcpsgndp, 0x00, 0x1E, PPC2_VSX),
-GEN_XX3FORM(xvcpsgnsp, 0x00, 0x1A, PPC2_VSX),
-
 GEN_XX3FORM(xsadddp, 0x00, 0x04, PPC2_VSX),
 GEN_VSX_XFORM_300(xsaddqp, 0x04, 0x00, 0x0),
 GEN_XX3FORM(xssubdp, 0x00, 0x05, PPC2_VSX),
-- 
2.31.1


