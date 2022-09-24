Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AD05E85A6
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 00:14:25 +0200 (CEST)
Received: from localhost ([::1]:43536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obqwC-0004hz-6A
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 18:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqYG-0006xX-Jh; Fri, 23 Sep 2022 17:49:41 -0400
Received: from [200.168.210.66] (port=12827 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1obqYE-0006ea-Kj; Fri, 23 Sep 2022 17:49:40 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 23 Sep 2022 18:47:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 772F18000B4;
 Fri, 23 Sep 2022 18:47:58 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 10/12] target/ppc: Moved XVTSTDC[DS]P to decodetree
Date: Fri, 23 Sep 2022 18:47:52 -0300
Message-Id: <20220923214754.217819-11-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 Sep 2022 21:47:58.0781 (UTC)
 FILETIME=[2573A6D0:01D8CF96]
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

Moved XVTSTDCSP and XVTSTDCDP to decodetree an restructured the helper
to be simpler and do all decoding in the decodetree (so XB, XT and DCMX
are all calculated outside the helper).

Obs: The tests in this one are slightly different, these are the sum of
these instructions with all possible immediate and those instructions
are repeated 10 times.

xvtstdcsp:
rept    loop    master             patch
8       12500   2,76402100         2,70699100 (-2.1%)
25      4000    2,64867100         2,67884100 (+1.1%)
100     1000    2,73806300         2,78701000 (+1.8%)
500     200     3,44666500         3,61027600 (+4.7%)
2500    40      5,85790200         6,47475500 (+10.5%)
8000    12     15,22102100        17,46062900 (+14.7%)

xvtstdcdp:
rept    loop    master             patch
8       12500   2,11818000         1,61065300 (-24.0%)
25      4000    2,04573400         1,60132200 (-21.7%)
100     1000    2,13834100         1,69988100 (-20.5%)
500     200     2,73977000         2,48631700 (-9.3%)
2500    40      5,05067000         5,25914100 (+4.1%)
8000    12     14,60507800        15,93704900 (+9.1%)

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 39 +++++++++++++++++++++++++++--
 target/ppc/helper.h                 |  4 +--
 target/ppc/insn32.decode            |  5 ++++
 target/ppc/translate/vsx-impl.c.inc | 28 +++++++++++++++++++--
 target/ppc/translate/vsx-ops.c.inc  |  8 ------
 5 files changed, 70 insertions(+), 14 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index ae25f32d6e..35ca03b10b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3295,11 +3295,46 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)         \
     }                                                       \
 }
 
-VSX_TEST_DC(xvtstdcdp, 2, xB(opcode), float64, VsrD(i), VsrD(i), UINT64_MAX, 0)
-VSX_TEST_DC(xvtstdcsp, 4, xB(opcode), float32, VsrW(i), VsrW(i), UINT32_MAX, 0)
 VSX_TEST_DC(xststdcdp, 1, xB(opcode), float64, VsrD(0), VsrD(0), 0, 1)
 VSX_TEST_DC(xststdcqp, 1, (rB(opcode) + 32), float128, f128, VsrD(0), 0, 1)
 
+#define VSX_TSTDC(tp)                                       \
+static int32_t tp##_tstdc(tp b, uint32_t dcmx)              \
+{                                                           \
+    uint32_t match = 0;                                     \
+    uint32_t sign = tp##_is_neg(b);                         \
+    if (tp##_is_any_nan(b)) {                               \
+        match = extract32(dcmx, 6, 1);                      \
+    } else if (tp##_is_infinity(b)) {                       \
+        match = extract32(dcmx, 4 + !sign, 1);              \
+    } else if (tp##_is_zero(b)) {                           \
+        match = extract32(dcmx, 2 + !sign, 1);              \
+    } else if (tp##_is_zero_or_denormal(b)) {               \
+        match = extract32(dcmx, 0 + !sign, 1);              \
+    }                                                       \
+    return (match != 0) ? 1 : 0;                            \
+}
+
+VSX_TSTDC(float32)
+VSX_TSTDC(float64)
+#undef VSX_TSTDC
+
+void helper_XVTSTDCDP(ppc_vsr_t *t, ppc_vsr_t *b, uint64_t dcmx, uint32_t v)
+{
+    int i;
+    for (i = 0; i < 2; i++) {
+        t->s64[i] = (int64_t)-float64_tstdc(b->f64[i], dcmx);
+    }
+}
+
+void helper_XVTSTDCSP(ppc_vsr_t *t, ppc_vsr_t *b, uint64_t dcmx, uint32_t v)
+{
+    int i;
+    for (i = 0; i < 4; i++) {
+        t->s32[i] = (int32_t)-float32_tstdc(b->f32[i], dcmx);
+    }
+}
+
 void helper_xststdcsp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xb)
 {
     uint32_t dcmx, sign, exp;
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 1f470a0e5e..d3e3324c73 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -521,8 +521,8 @@ DEF_HELPER_3(xvcvsxdsp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvuxdsp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvsxwsp, void, env, vsr, vsr)
 DEF_HELPER_3(xvcvuxwsp, void, env, vsr, vsr)
-DEF_HELPER_2(xvtstdcsp, void, env, i32)
-DEF_HELPER_2(xvtstdcdp, void, env, i32)
+DEF_HELPER_FLAGS_4(XVTSTDCSP, TCG_CALL_NO_RWG, void, vsr, vsr, i64, i32)
+DEF_HELPER_FLAGS_4(XVTSTDCDP, TCG_CALL_NO_RWG, void, vsr, vsr, i64, i32)
 DEF_HELPER_3(xvrspi, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspic, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspim, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6549c4040e..c0a531be5c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -199,6 +199,9 @@
 
 @XX2_uim4       ...... ..... . uim:4 ..... ......... ..         &XX2_uim xt=%xx_xt xb=%xx_xb
 
+%xx_uim7        6:1 2:1 16:5
+@XX2_uim7       ...... ..... ..... ..... .... . ... . ..        &XX2_uim xt=%xx_xt xb=%xx_xb uim=%xx_uim7
+
 &XX2_bf_xb      bf xb
 @XX2_bf_xb      ...... bf:3 .. ..... ..... ......... . .        &XX2_bf_xb xb=%xx_xb
 
@@ -848,6 +851,8 @@ XSCVSPDPN       111100 ..... ----- ..... 101001011 ..   @XX2
 ## VSX Binary Floating-Point Math Support Instructions
 
 XVXSIGSP        111100 ..... 01001 ..... 111011011 ..   @XX2
+XVTSTDCDP       111100 ..... ..... ..... 1111 . 101 ... @XX2_uim7
+XVTSTDCSP       111100 ..... ..... ..... 1101 . 101 ... @XX2_uim7
 
 ## VSX Vector Test Least-Significant Bit by Byte Instruction
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 3e4509cb41..a033cd04bd 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -630,6 +630,8 @@ static void gen_mtvsrws(DisasContext *ctx)
 #define OP_CPSGN 4
 #define SGN_MASK_DP  0x8000000000000000ull
 #define SGN_MASK_SP 0x8000000080000000ull
+#define EXP_MASK_DP  0x7FF0000000000000ull
+#define EXP_MASK_SP 0x7F8000007F800000ull
 
 #define VSX_SCALAR_MOVE(name, op, sgn_mask)                       \
 static void glue(gen_, name)(DisasContext *ctx)                   \
@@ -1119,6 +1121,30 @@ GEN_VSX_HELPER_X2(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300)
 GEN_VSX_HELPER_R2(xscvsdqp, 0x04, 0x1A, 0x0A, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvspdp, 0x12, 0x14, 0, PPC2_VSX)
 
+static bool do_xvtstdc(DisasContext *ctx, arg_XX2_uim *a, unsigned vece)
+{
+    static const GVecGen2i op[] = {
+        {
+            .fnoi = gen_helper_XVTSTDCSP,
+            .vece = MO_32
+        },
+        {
+            .fnoi = gen_helper_XVTSTDCDP,
+            .vece = MO_64
+        },
+    };
+
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_2i(vsr_full_offset(a->xt), vsr_full_offset(a->xb),
+                    16, 16, (int32_t)(a->uim), &op[vece - MO_32]);
+
+    return true;
+}
+
+TRANS_FLAGS2(VSX, XVTSTDCSP, do_xvtstdc, MO_32)
+TRANS_FLAGS2(VSX, XVTSTDCDP, do_xvtstdc, MO_64)
+
 bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
 {
     TCGv_i64 tmp;
@@ -1222,8 +1248,6 @@ GEN_VSX_HELPER_X2(xvrspic, 0x16, 0x0A, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xvrspim, 0x12, 0x0B, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xvrspip, 0x12, 0x0A, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xvrspiz, 0x12, 0x09, 0, PPC2_VSX)
-GEN_VSX_HELPER_2(xvtstdcsp, 0x14, 0x1A, 0, PPC2_VSX)
-GEN_VSX_HELPER_2(xvtstdcdp, 0x14, 0x1E, 0, PPC2_VSX)
 
 static bool trans_XXPERM(DisasContext *ctx, arg_XX3 *a)
 {
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index f7d7377379..4b317d4b06 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -157,14 +157,6 @@ GEN_XX2FORM_EO(xvxexpdp, 0x16, 0x1D, 0x00, PPC2_ISA300),
 GEN_XX2FORM_EO(xvxsigdp, 0x16, 0x1D, 0x01, PPC2_ISA300),
 GEN_XX2FORM_EO(xvxexpsp, 0x16, 0x1D, 0x08, PPC2_ISA300),
 
-/* DCMX  =  bit[25] << 6 | bit[29] << 5 | bit[11:15] */
-#define GEN_XX2FORM_DCMX(name, opc2, opc3, fl2) \
-GEN_XX3FORM(name, opc2, opc3 | 0, fl2),         \
-GEN_XX3FORM(name, opc2, opc3 | 1, fl2)
-
-GEN_XX2FORM_DCMX(xvtstdcdp, 0x14, 0x1E, PPC2_ISA300),
-GEN_XX2FORM_DCMX(xvtstdcsp, 0x14, 0x1A, PPC2_ISA300),
-
 GEN_XX3FORM(xsadddp, 0x00, 0x04, PPC2_VSX),
 GEN_VSX_XFORM_300(xsaddqp, 0x04, 0x00, 0x0),
 GEN_XX3FORM(xssubdp, 0x00, 0x05, PPC2_VSX),
-- 
2.31.1


