Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4957E6046F4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:25:17 +0200 (CEST)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol94O-0002Kj-Ae
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8be-00045e-Cf; Wed, 19 Oct 2022 08:55:34 -0400
Received: from [200.168.210.66] (port=42674 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ol8bP-0002nO-2L; Wed, 19 Oct 2022 08:55:33 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 19 Oct 2022 09:50:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E0754800150;
 Wed, 19 Oct 2022 09:50:44 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v3 11/12] target/ppc: Moved XSTSTDC[QDS]P to decodetree
Date: Wed, 19 Oct 2022 09:50:39 -0300
Message-Id: <20221019125040.48028-12-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
References: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 19 Oct 2022 12:50:45.0203 (UTC)
 FILETIME=[677B7A30:01D8E3B9]
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

Moved XSTSTDCSP, XSTSTDCDP and XSTSTDCQP to decodetree and moved some of
its decoding away from the helper as previously the DCMX, XB and BF were
calculated in the helper with the help of cpu_env, now that part was
moved to the decodetree with the rest.

xvtstdcsp:
rept    loop    master             patch
8       12500   1,85393600         1,94683600 (+5.0%)
25      4000    1,78779800         1,92479000 (+7.7%)
100     1000    2,12775000         2,28895500 (+7.6%)
500     200     2,99655300         3,23102900 (+7.8%)
2500    40      6,89082200         7,44827500 (+8.1%)
8000    12     17,50585500        18,95152100 (+8.3%)

xvtstdcdp:
rept    loop    master             patch
8       12500   1,39043100         1,33539800 (-4.0%)
25      4000    1,35731800         1,37347800 (+1.2%)
100     1000    1,51514800         1,56053000 (+3.0%)
500     200     2,21014400         2,47906000 (+12.2%)
2500    40      5,39488200         6,68766700 (+24.0%)
8000    12     13,98623900        18,17661900 (+30.0%)

xvtstdcdp:
rept    loop    master             patch
8       12500   1,35123800         1,34455800 (-0.5%)
25      4000    1,36441200         1,36759600 (+0.2%)
100     1000    1,49763500         1,54138400 (+2.9%)
500     200     2,19020200         2,46196400 (+12.4%)
2500    40      5,39265700         6,68147900 (+23.9%)
8000    12     14,04163600        18,19669600 (+29.6%)

As some values are now decoded outside the helper and passed to it as an
argument the number of arguments of the helper increased, the number
of TCGop needed to load the arguments increased. I suspect that's why
the slow-down in the tests with a high REPT but low LOOP.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/fpu_helper.c             | 114 +++++++++-------------------
 target/ppc/helper.h                 |   6 +-
 target/ppc/insn32.decode            |   6 ++
 target/ppc/translate/vsx-impl.c.inc |  20 ++++-
 target/ppc/translate/vsx-ops.c.inc  |   4 -
 5 files changed, 60 insertions(+), 90 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 960a76a8a5..a66e16c212 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3241,63 +3241,6 @@ void helper_XVXSIGSP(ppc_vsr_t *xt, ppc_vsr_t *xb)
     *xt = t;
 }
 
-/*
- * VSX_TEST_DC - VSX floating point test data class
- *   op    - instruction mnemonic
- *   nels  - number of elements (1, 2 or 4)
- *   xbn   - VSR register number
- *   tp    - type (float32 or float64)
- *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   tfld   - target vsr_t field (VsrD(*) or VsrW(*))
- *   fld_max - target field max
- *   scrf - set result in CR and FPCC
- */
-#define VSX_TEST_DC(op, nels, xbn, tp, fld, tfld, fld_max, scrf)  \
-void helper_##op(CPUPPCState *env, uint32_t opcode)         \
-{                                                           \
-    ppc_vsr_t *xt = &env->vsr[xT(opcode)];                  \
-    ppc_vsr_t *xb = &env->vsr[xbn];                         \
-    ppc_vsr_t t = { };                                      \
-    uint32_t i, sign, dcmx;                                 \
-    uint32_t cc, match = 0;                                 \
-                                                            \
-    if (!scrf) {                                            \
-        dcmx = DCMX_XV(opcode);                             \
-    } else {                                                \
-        t = *xt;                                            \
-        dcmx = DCMX(opcode);                                \
-    }                                                       \
-                                                            \
-    for (i = 0; i < nels; i++) {                            \
-        sign = tp##_is_neg(xb->fld);                        \
-        if (tp##_is_any_nan(xb->fld)) {                     \
-            match = extract32(dcmx, 6, 1);                  \
-        } else if (tp##_is_infinity(xb->fld)) {             \
-            match = extract32(dcmx, 4 + !sign, 1);          \
-        } else if (tp##_is_zero(xb->fld)) {                 \
-            match = extract32(dcmx, 2 + !sign, 1);          \
-        } else if (tp##_is_zero_or_denormal(xb->fld)) {     \
-            match = extract32(dcmx, 0 + !sign, 1);          \
-        }                                                   \
-                                                            \
-        if (scrf) {                                         \
-            cc = sign << CRF_LT_BIT | match << CRF_EQ_BIT;  \
-            env->fpscr &= ~FP_FPCC;                         \
-            env->fpscr |= cc << FPSCR_FPCC;                 \
-            env->crf[BF(opcode)] = cc;                      \
-        } else {                                            \
-            t.tfld = match ? fld_max : 0;                   \
-        }                                                   \
-        match = 0;                                          \
-    }                                                       \
-    if (!scrf) {                                            \
-        *xt = t;                                            \
-    }                                                       \
-}
-
-VSX_TEST_DC(xststdcdp, 1, xB(opcode), float64, VsrD(0), VsrD(0), 0, 1)
-VSX_TEST_DC(xststdcqp, 1, (rB(opcode) + 32), float128, f128, VsrD(0), 0, 1)
-
 #define VSX_TSTDC(tp)                                       \
 static int32_t tp##_tstdc(tp b, uint32_t dcmx)              \
 {                                                           \
@@ -3317,6 +3260,7 @@ static int32_t tp##_tstdc(tp b, uint32_t dcmx)              \
 
 VSX_TSTDC(float32)
 VSX_TSTDC(float64)
+VSX_TSTDC(float128)
 #undef VSX_TSTDC
 
 void helper_XVTSTDCDP(ppc_vsr_t *t, ppc_vsr_t *b, uint64_t dcmx, uint32_t v)
@@ -3335,34 +3279,44 @@ void helper_XVTSTDCSP(ppc_vsr_t *t, ppc_vsr_t *b, uint64_t dcmx, uint32_t v)
     }
 }
 
-void helper_xststdcsp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xb)
+static bool not_SP_value(float64 val)
 {
-    uint32_t dcmx, sign, exp;
-    uint32_t cc, match = 0, not_sp = 0;
-    float64 arg = xb->VsrD(0);
-    float64 arg_sp;
-
-    dcmx = DCMX(opcode);
-    exp = (arg >> 52) & 0x7FF;
-    sign = float64_is_neg(arg);
-
-    if (float64_is_any_nan(arg)) {
-        match = extract32(dcmx, 6, 1);
-    } else if (float64_is_infinity(arg)) {
-        match = extract32(dcmx, 4 + !sign, 1);
-    } else if (float64_is_zero(arg)) {
-        match = extract32(dcmx, 2 + !sign, 1);
-    } else if (float64_is_zero_or_denormal(arg) || (exp > 0 && exp < 0x381)) {
-        match = extract32(dcmx, 0 + !sign, 1);
-    }
-
-    arg_sp = helper_todouble(helper_tosingle(arg));
-    not_sp = arg != arg_sp;
+    return val != helper_todouble(helper_tosingle(val));
+}
 
+/*
+ * VSX_XS_TSTDC - VSX Scalar Test Data Class
+ *   NAME  - instruction name
+ *   FLD   - vsr_t field (VsrD(0) or f128)
+ *   TP    - type (float64 or float128)
+ */
+#define VSX_XS_TSTDC(NAME, FLD, TP)                                         \
+    void helper_##NAME(CPUPPCState *env, uint32_t bf,                       \
+                       uint32_t dcmx, ppc_vsr_t *b)                         \
+    {                                                                       \
+        uint32_t cc, match, sign = TP##_is_neg(b->FLD);                     \
+        match = TP##_tstdc(b->FLD, dcmx);                                   \
+        cc = sign << CRF_LT_BIT | match << CRF_EQ_BIT;                      \
+        env->fpscr &= ~FP_FPCC;                                             \
+        env->fpscr |= cc << FPSCR_FPCC;                                     \
+        env->crf[bf] = cc;                                                  \
+    }
+
+VSX_XS_TSTDC(XSTSTDCDP, VsrD(0), float64)
+VSX_XS_TSTDC(XSTSTDCQP, f128, float128)
+#undef VSX_XS_TSTDC
+
+void helper_XSTSTDCSP(CPUPPCState *env, uint32_t bf,
+                      uint32_t dcmx, ppc_vsr_t *b)
+{
+    uint32_t cc, match, sign = float64_is_neg(b->VsrD(0));
+    uint32_t exp = (b->VsrD(0) >> 52) & 0x7FF;
+    int not_sp = (int)not_SP_value(b->VsrD(0));
+    match = float64_tstdc(b->VsrD(0), dcmx) || (exp > 0 && exp < 0x381);
     cc = sign << CRF_LT_BIT | match << CRF_EQ_BIT | not_sp << CRF_SO_BIT;
     env->fpscr &= ~FP_FPCC;
     env->fpscr |= cc << FPSCR_FPCC;
-    env->crf[BF(opcode)] = cc;
+    env->crf[bf] = cc;
 }
 
 void helper_xsrqpi(CPUPPCState *env, uint32_t opcode,
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 9e5d11939b..8344fe39c6 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -417,9 +417,9 @@ DEF_HELPER_3(xscvuxdsp, void, env, vsr, vsr)
 DEF_HELPER_3(xscvsxdsp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvudqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvuxddp, void, env, vsr, vsr)
-DEF_HELPER_3(xststdcsp, void, env, i32, vsr)
-DEF_HELPER_2(xststdcdp, void, env, i32)
-DEF_HELPER_2(xststdcqp, void, env, i32)
+DEF_HELPER_4(XSTSTDCSP, void, env, i32, i32, vsr)
+DEF_HELPER_4(XSTSTDCDP, void, env, i32, i32, vsr)
+DEF_HELPER_4(XSTSTDCQP, void, env, i32, i32, vsr)
 DEF_HELPER_3(xsrdpi, void, env, vsr, vsr)
 DEF_HELPER_3(xsrdpic, void, env, vsr, vsr)
 DEF_HELPER_3(xsrdpim, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c0a531be5c..334eb1beca 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -202,6 +202,9 @@
 %xx_uim7        6:1 2:1 16:5
 @XX2_uim7       ...... ..... ..... ..... .... . ... . ..        &XX2_uim xt=%xx_xt xb=%xx_xb uim=%xx_uim7
 
+&XX2_bf_uim     bf xb uim
+@XX2_bf_uim     ...... bf:3 uim:7 ..... ......... . .           &XX2_bf_uim
+
 &XX2_bf_xb      bf xb
 @XX2_bf_xb      ...... bf:3 .. ..... ..... ......... . .        &XX2_bf_xb xb=%xx_xb
 
@@ -853,6 +856,9 @@ XSCVSPDPN       111100 ..... ----- ..... 101001011 ..   @XX2
 XVXSIGSP        111100 ..... 01001 ..... 111011011 ..   @XX2
 XVTSTDCDP       111100 ..... ..... ..... 1111 . 101 ... @XX2_uim7
 XVTSTDCSP       111100 ..... ..... ..... 1101 . 101 ... @XX2_uim7
+XSTSTDCSP       111100 ... ....... ..... 100101010 . -  @XX2_bf_uim xb=%xx_xb
+XSTSTDCDP       111100 ... ....... ..... 101101010 . -  @XX2_bf_uim xb=%xx_xb
+XSTSTDCQP       111111 ... ....... xb:5  1011000100 -   @XX2_bf_uim
 
 ## VSX Vector Test Least-Significant Bit by Byte Instruction
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 287ea8e2ce..af410cbf1b 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1136,6 +1136,23 @@ static bool do_xvtstdc(DisasContext *ctx, arg_XX2_uim *a, unsigned vece)
 TRANS_FLAGS2(VSX, XVTSTDCSP, do_xvtstdc, MO_32)
 TRANS_FLAGS2(VSX, XVTSTDCDP, do_xvtstdc, MO_64)
 
+static bool do_XX2_bf_uim(DisasContext *ctx, arg_XX2_bf_uim *a, bool vsr,
+                     void (*gen_helper)(TCGv_env, TCGv_i32, TCGv_i32, TCGv_ptr))
+{
+    TCGv_ptr xb;
+
+    REQUIRE_VSX(ctx);
+    xb = vsr ? gen_vsr_ptr(a->xb) : gen_avr_ptr(a->xb);
+    gen_helper(cpu_env, tcg_constant_i32(a->bf), tcg_constant_i32(a->uim), xb);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
+
+TRANS_FLAGS2(ISA300, XSTSTDCSP, do_XX2_bf_uim, true, gen_helper_XSTSTDCSP)
+TRANS_FLAGS2(ISA300, XSTSTDCDP, do_XX2_bf_uim, true, gen_helper_XSTSTDCDP)
+TRANS_FLAGS2(ISA300, XSTSTDCQP, do_XX2_bf_uim, false, gen_helper_XSTSTDCQP)
+
 bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
 {
     TCGv_i64 tmp;
@@ -1182,9 +1199,6 @@ GEN_VSX_HELPER_X2(xssqrtsp, 0x16, 0x00, 0, PPC2_VSX207)
 GEN_VSX_HELPER_X2(xsrsqrtesp, 0x14, 0x00, 0, PPC2_VSX207)
 GEN_VSX_HELPER_X2(xscvsxdsp, 0x10, 0x13, 0, PPC2_VSX207)
 GEN_VSX_HELPER_X2(xscvuxdsp, 0x10, 0x12, 0, PPC2_VSX207)
-GEN_VSX_HELPER_X1(xststdcsp, 0x14, 0x12, 0, PPC2_ISA300)
-GEN_VSX_HELPER_2(xststdcdp, 0x14, 0x16, 0, PPC2_ISA300)
-GEN_VSX_HELPER_2(xststdcqp, 0x04, 0x16, 0, PPC2_ISA300)
 
 GEN_VSX_HELPER_X3(xvadddp, 0x00, 0x0C, 0, PPC2_VSX)
 GEN_VSX_HELPER_X3(xvsubdp, 0x00, 0x0D, 0, PPC2_VSX)
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 4b317d4b06..a3ba094d62 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -147,10 +147,6 @@ GEN_HANDLER_E(xsiexpdp, 0x3C, 0x16, 0x1C, 0, PPC_NONE, PPC2_ISA300),
 GEN_VSX_XFORM_300(xsiexpqp, 0x4, 0x1B, 0x00000001),
 #endif
 
-GEN_XX2FORM(xststdcdp, 0x14, 0x16, PPC2_ISA300),
-GEN_XX2FORM(xststdcsp, 0x14, 0x12, PPC2_ISA300),
-GEN_VSX_XFORM_300(xststdcqp, 0x04, 0x16, 0x00000001),
-
 GEN_XX3FORM(xviexpsp, 0x00, 0x1B, PPC2_ISA300),
 GEN_XX3FORM(xviexpdp, 0x00, 0x1F, PPC2_ISA300),
 GEN_XX2FORM_EO(xvxexpdp, 0x16, 0x1D, 0x00, PPC2_ISA300),
-- 
2.37.3


