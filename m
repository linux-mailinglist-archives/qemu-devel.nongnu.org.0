Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A599249B61E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:25:05 +0100 (CET)
Received: from localhost ([::1]:49752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMkq-0003eU-Lu
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:25:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLDj-0002mo-DC; Tue, 25 Jan 2022 07:46:48 -0500
Received: from [187.72.171.209] (port=52356 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLDh-0008AP-2l; Tue, 25 Jan 2022 07:46:46 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 6A63480001E;
 Tue, 25 Jan 2022 09:20:43 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 27/38] target/ppc: move
 xs[n]madd[am][ds]p/xs[n]msub[am][ds]p to decodetree
Date: Tue, 25 Jan 2022 09:19:32 -0300
Message-Id: <20220125121943.3269077-28-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:43.0762 (UTC)
 FILETIME=[F9722520:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 target/ppc/fpu_helper.c             | 23 ++++++------
 target/ppc/helper.h                 | 16 ++++-----
 target/ppc/insn32.decode            | 22 ++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 56 ++++++++++++++++++++++++-----
 target/ppc/translate/vsx-ops.c.inc  | 16 ---------
 5 files changed, 90 insertions(+), 43 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f9c7a4dc44..2b7766ddb6 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2156,10 +2156,11 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, 23)
  *   maddflgs - flags for the float*muladd routine that control the
  *           various forms (madd, msub, nmadd, nmsub)
  *   sfprf - set FPRF
+ *   r2sp  - round intermediate double precision result to single precision
  */
 #define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf, r2sp)                    \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
-                 ppc_vsr_t *xa, ppc_vsr_t *b, ppc_vsr_t *c)                   \
+                 ppc_vsr_t *s1, ppc_vsr_t *s2, ppc_vsr_t *s3)                 \
 {                                                                             \
     ppc_vsr_t t = *xt;                                                        \
     int i;                                                                    \
@@ -2175,12 +2176,12 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
              * result to odd.                                                 \
              */                                                               \
             set_float_rounding_mode(float_round_to_zero, &tstat);             \
-            t.fld = tp##_muladd(xa->fld, b->fld, c->fld,                      \
+            t.fld = tp##_muladd(s1->fld, s3->fld, s2->fld,                    \
                                 maddflgs, &tstat);                            \
             t.fld |= (get_float_exception_flags(&tstat) &                     \
                       float_flag_inexact) != 0;                               \
         } else {                                                              \
-            t.fld = tp##_muladd(xa->fld, b->fld, c->fld,                      \
+            t.fld = tp##_muladd(s1->fld, s3->fld, s2->fld,                    \
                                 maddflgs, &tstat);                            \
         }                                                                     \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags;  \
@@ -2202,14 +2203,14 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     do_float_check_status(env, GETPC());                                      \
 }
 
-VSX_MADD(xsmadddp, 1, float64, VsrD(0), MADD_FLGS, 1, 0)
-VSX_MADD(xsmsubdp, 1, float64, VsrD(0), MSUB_FLGS, 1, 0)
-VSX_MADD(xsnmadddp, 1, float64, VsrD(0), NMADD_FLGS, 1, 0)
-VSX_MADD(xsnmsubdp, 1, float64, VsrD(0), NMSUB_FLGS, 1, 0)
-VSX_MADD(xsmaddsp, 1, float64, VsrD(0), MADD_FLGS, 1, 1)
-VSX_MADD(xsmsubsp, 1, float64, VsrD(0), MSUB_FLGS, 1, 1)
-VSX_MADD(xsnmaddsp, 1, float64, VsrD(0), NMADD_FLGS, 1, 1)
-VSX_MADD(xsnmsubsp, 1, float64, VsrD(0), NMSUB_FLGS, 1, 1)
+VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1, 0)
+VSX_MADD(XSMSUBDP, 1, float64, VsrD(0), MSUB_FLGS, 1, 0)
+VSX_MADD(XSNMADDDP, 1, float64, VsrD(0), NMADD_FLGS, 1, 0)
+VSX_MADD(XSNMSUBDP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 0)
+VSX_MADD(XSMADDSP, 1, float64, VsrD(0), MADD_FLGS, 1, 1)
+VSX_MADD(XSMSUBSP, 1, float64, VsrD(0), MSUB_FLGS, 1, 1)
+VSX_MADD(XSNMADDSP, 1, float64, VsrD(0), NMADD_FLGS, 1, 1)
+VSX_MADD(XSNMSUBSP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 1)
 
 VSX_MADD(xvmadddp, 2, float64, VsrD(i), MADD_FLGS, 0, 0)
 VSX_MADD(xvmsubdp, 2, float64, VsrD(i), MSUB_FLGS, 0, 0)
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 7fb1251049..2a88f2b904 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -362,10 +362,10 @@ DEF_HELPER_3(xssqrtdp, void, env, vsr, vsr)
 DEF_HELPER_3(xsrsqrtedp, void, env, vsr, vsr)
 DEF_HELPER_4(xstdivdp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xstsqrtdp, void, env, i32, vsr)
-DEF_HELPER_5(xsmadddp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsmsubdp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsnmadddp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsnmsubdp, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMADDDP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMSUBDP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMADDDP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMSUBDP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
@@ -425,10 +425,10 @@ DEF_HELPER_3(xsresp, void, env, vsr, vsr)
 DEF_HELPER_2(xsrsp, i64, env, i64)
 DEF_HELPER_3(xssqrtsp, void, env, vsr, vsr)
 DEF_HELPER_3(xsrsqrtesp, void, env, vsr, vsr)
-DEF_HELPER_5(xsmaddsp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsmsubsp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsnmaddsp, void, env, vsr, vsr, vsr, vsr)
-DEF_HELPER_5(xsnmsubsp, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMADDSP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMSUBSP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMADDSP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMSUBSP, void, env, vsr, vsr, vsr, vsr)
 
 DEF_HELPER_4(xvadddp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xvsubdp, void, env, vsr, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index ced6b273ca..84bc8b1168 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -543,6 +543,28 @@ STXVX           011111 ..... ..... ..... 0110001100 .   @X_TSX
 LXVPX           011111 ..... ..... ..... 0101001101 -   @X_TSXP
 STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
 
+## VSX Scalar Multiply-Add Instructions
+
+XSMADDADP       111100 ..... ..... ..... 00100001 . . . @XX3
+XSMADDMDP       111100 ..... ..... ..... 00101001 . . . @XX3
+XSMADDASP       111100 ..... ..... ..... 00000001 . . . @XX3
+XSMADDMSP       111100 ..... ..... ..... 00001001 . . . @XX3
+
+XSMSUBADP       111100 ..... ..... ..... 00110001 . . . @XX3
+XSMSUBMDP       111100 ..... ..... ..... 00111001 . . . @XX3
+XSMSUBASP       111100 ..... ..... ..... 00010001 . . . @XX3
+XSMSUBMSP       111100 ..... ..... ..... 00011001 . . . @XX3
+
+XSNMADDASP      111100 ..... ..... ..... 10000001 . . . @XX3
+XSNMADDMSP      111100 ..... ..... ..... 10001001 . . . @XX3
+XSNMADDADP      111100 ..... ..... ..... 10100001 . . . @XX3
+XSNMADDMDP      111100 ..... ..... ..... 10101001 . . . @XX3
+
+XSNMSUBASP      111100 ..... ..... ..... 10010001 . . . @XX3
+XSNMSUBMSP      111100 ..... ..... ..... 10011001 . . . @XX3
+XSNMSUBADP      111100 ..... ..... ..... 10110001 . . . @XX3
+XSNMSUBMDP      111100 ..... ..... ..... 10111001 . . . @XX3
+
 ## VSX splat instruction
 
 XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 22f48938cb..be91b8d053 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1283,6 +1283,54 @@ TRANS(XXGENPCVHM, do_xxgenpcv, gen_helper_XXGENPCVHM)
 TRANS(XXGENPCVWM, do_xxgenpcv, gen_helper_XXGENPCVWM)
 TRANS(XXGENPCVDM, do_xxgenpcv, gen_helper_XXGENPCVDM)
 
+static bool do_xsmadd(DisasContext *ctx, int tgt, int src1, int src2, int src3,
+        void (gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr t, s1, s2, s3;
+
+    t = gen_vsr_ptr(tgt);
+    s1 = gen_vsr_ptr(src1);
+    s2 = gen_vsr_ptr(src2);
+    s3 = gen_vsr_ptr(src3);
+
+    gen_helper(cpu_env, t, s1, s2, s3);
+
+    tcg_temp_free_ptr(t);
+    tcg_temp_free_ptr(s1);
+    tcg_temp_free_ptr(s2);
+    tcg_temp_free_ptr(s3);
+
+    return true;
+}
+
+static bool do_xsmadd_XX3(DisasContext *ctx, arg_XX3 *a, bool type_a,
+        void (gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    REQUIRE_VSX(ctx);
+
+    if (type_a) {
+        return do_xsmadd(ctx, a->xt, a->xa, a->xt, a->xb, gen_helper);
+    }
+    return do_xsmadd(ctx, a->xt, a->xa, a->xb, a->xt, gen_helper);
+}
+
+TRANS_FLAGS2(VSX, XSMADDADP, do_xsmadd_XX3, true, gen_helper_XSMADDDP)
+TRANS_FLAGS2(VSX, XSMADDMDP, do_xsmadd_XX3, false, gen_helper_XSMADDDP)
+TRANS_FLAGS2(VSX, XSMSUBADP, do_xsmadd_XX3, true, gen_helper_XSMSUBDP)
+TRANS_FLAGS2(VSX, XSMSUBMDP, do_xsmadd_XX3, false, gen_helper_XSMSUBDP)
+TRANS_FLAGS2(VSX, XSNMADDADP, do_xsmadd_XX3, true, gen_helper_XSNMADDDP)
+TRANS_FLAGS2(VSX, XSNMADDMDP, do_xsmadd_XX3, false, gen_helper_XSNMADDDP)
+TRANS_FLAGS2(VSX, XSNMSUBADP, do_xsmadd_XX3, true, gen_helper_XSNMSUBDP)
+TRANS_FLAGS2(VSX, XSNMSUBMDP, do_xsmadd_XX3, false, gen_helper_XSNMSUBDP)
+TRANS_FLAGS2(VSX207, XSMADDASP, do_xsmadd_XX3, true, gen_helper_XSMADDSP)
+TRANS_FLAGS2(VSX207, XSMADDMSP, do_xsmadd_XX3, false, gen_helper_XSMADDSP)
+TRANS_FLAGS2(VSX207, XSMSUBASP, do_xsmadd_XX3, true, gen_helper_XSMSUBSP)
+TRANS_FLAGS2(VSX207, XSMSUBMSP, do_xsmadd_XX3, false, gen_helper_XSMSUBSP)
+TRANS_FLAGS2(VSX207, XSNMADDASP, do_xsmadd_XX3, true, gen_helper_XSNMADDSP)
+TRANS_FLAGS2(VSX207, XSNMADDMSP, do_xsmadd_XX3, false, gen_helper_XSNMADDSP)
+TRANS_FLAGS2(VSX207, XSNMSUBASP, do_xsmadd_XX3, true, gen_helper_XSNMSUBSP)
+TRANS_FLAGS2(VSX207, XSNMSUBMSP, do_xsmadd_XX3, false, gen_helper_XSNMSUBSP)
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)             \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
@@ -1313,14 +1361,6 @@ static void gen_##name(DisasContext *ctx)                                     \
     tcg_temp_free_ptr(c);                                                     \
 }
 
-GEN_VSX_HELPER_VSX_MADD(xsmadddp, 0x04, 0x04, 0x05, 0, PPC2_VSX)
-GEN_VSX_HELPER_VSX_MADD(xsmsubdp, 0x04, 0x06, 0x07, 0, PPC2_VSX)
-GEN_VSX_HELPER_VSX_MADD(xsnmadddp, 0x04, 0x14, 0x15, 0, PPC2_VSX)
-GEN_VSX_HELPER_VSX_MADD(xsnmsubdp, 0x04, 0x16, 0x17, 0, PPC2_VSX)
-GEN_VSX_HELPER_VSX_MADD(xsmaddsp, 0x04, 0x00, 0x01, 0, PPC2_VSX207)
-GEN_VSX_HELPER_VSX_MADD(xsmsubsp, 0x04, 0x02, 0x03, 0, PPC2_VSX207)
-GEN_VSX_HELPER_VSX_MADD(xsnmaddsp, 0x04, 0x10, 0x11, 0, PPC2_VSX207)
-GEN_VSX_HELPER_VSX_MADD(xsnmsubsp, 0x04, 0x12, 0x13, 0, PPC2_VSX207)
 GEN_VSX_HELPER_VSX_MADD(xvmadddp, 0x04, 0x0C, 0x0D, 0, PPC2_VSX)
 GEN_VSX_HELPER_VSX_MADD(xvmsubdp, 0x04, 0x0E, 0x0F, 0, PPC2_VSX)
 GEN_VSX_HELPER_VSX_MADD(xvnmadddp, 0x04, 0x1C, 0x1D, 0, PPC2_VSX)
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 0a6b2b31ac..9cfec53df0 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -186,14 +186,6 @@ GEN_XX2FORM(xssqrtdp,  0x16, 0x04, PPC2_VSX),
 GEN_XX2FORM(xsrsqrtedp,  0x14, 0x04, PPC2_VSX),
 GEN_XX3FORM(xstdivdp,  0x14, 0x07, PPC2_VSX),
 GEN_XX2FORM(xstsqrtdp,  0x14, 0x06, PPC2_VSX),
-GEN_XX3FORM_NAME(xsmadddp, "xsmaddadp", 0x04, 0x04, PPC2_VSX),
-GEN_XX3FORM_NAME(xsmadddp, "xsmaddmdp", 0x04, 0x05, PPC2_VSX),
-GEN_XX3FORM_NAME(xsmsubdp, "xsmsubadp", 0x04, 0x06, PPC2_VSX),
-GEN_XX3FORM_NAME(xsmsubdp, "xsmsubmdp", 0x04, 0x07, PPC2_VSX),
-GEN_XX3FORM_NAME(xsnmadddp, "xsnmaddadp", 0x04, 0x14, PPC2_VSX),
-GEN_XX3FORM_NAME(xsnmadddp, "xsnmaddmdp", 0x04, 0x15, PPC2_VSX),
-GEN_XX3FORM_NAME(xsnmsubdp, "xsnmsubadp", 0x04, 0x16, PPC2_VSX),
-GEN_XX3FORM_NAME(xsnmsubdp, "xsnmsubmdp", 0x04, 0x17, PPC2_VSX),
 GEN_XX3FORM(xscmpeqdp, 0x0C, 0x00, PPC2_ISA300),
 GEN_XX3FORM(xscmpgtdp, 0x0C, 0x01, PPC2_ISA300),
 GEN_XX3FORM(xscmpgedp, 0x0C, 0x02, PPC2_ISA300),
@@ -235,14 +227,6 @@ GEN_XX2FORM(xsresp,  0x14, 0x01, PPC2_VSX207),
 GEN_XX2FORM(xsrsp, 0x12, 0x11, PPC2_VSX207),
 GEN_XX2FORM(xssqrtsp,  0x16, 0x00, PPC2_VSX207),
 GEN_XX2FORM(xsrsqrtesp,  0x14, 0x00, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsmaddsp, "xsmaddasp", 0x04, 0x00, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsmaddsp, "xsmaddmsp", 0x04, 0x01, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsmsubsp, "xsmsubasp", 0x04, 0x02, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsmsubsp, "xsmsubmsp", 0x04, 0x03, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsnmaddsp, "xsnmaddasp", 0x04, 0x10, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsnmaddsp, "xsnmaddmsp", 0x04, 0x11, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsnmsubsp, "xsnmsubasp", 0x04, 0x12, PPC2_VSX207),
-GEN_XX3FORM_NAME(xsnmsubsp, "xsnmsubmsp", 0x04, 0x13, PPC2_VSX207),
 GEN_XX2FORM(xscvsxdsp, 0x10, 0x13, PPC2_VSX207),
 GEN_XX2FORM(xscvuxdsp, 0x10, 0x12, PPC2_VSX207),
 
-- 
2.25.1


