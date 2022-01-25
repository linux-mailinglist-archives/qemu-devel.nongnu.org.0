Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5693949B65F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:36:45 +0100 (CET)
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMw7-0008JP-69
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:36:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLE2-0002qs-TG; Tue, 25 Jan 2022 07:47:07 -0500
Received: from [187.72.171.209] (port=52356 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLDz-0008AP-Fm; Tue, 25 Jan 2022 07:47:06 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C6E468009AB;
 Tue, 25 Jan 2022 09:20:43 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 28/38] target/ppc: implement xs[n]maddqp[o]/xs[n]msubqp[o]
Date: Tue, 25 Jan 2022 09:19:33 -0300
Message-Id: <20220125121943.3269077-29-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:44.0169 (UTC)
 FILETIME=[F9B03F90:01D811E5]
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

Implement the following PowerISA v3.0 instuctions:
xsmaddqp[o]: VSX Scalar Multiply-Add Quad-Precision [using round to Odd]
xsmsubqp[o]: VSX Scalar Multiply-Subtract Quad-Precision [using round
             to Odd]
xsnmaddqp[o]: VSX Scalar Negative Multiply-Add Quad-Precision [using
              round to Odd]
xsnmsubqp[o]: VSX Scalar Negative Multiply-Subtract Quad-Precision
              [using round to Odd]

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c             | 42 +++++++++++++++++++++++++++++
 target/ppc/helper.h                 |  9 +++++++
 target/ppc/insn32.decode            |  4 +++
 target/ppc/translate/vsx-impl.c.inc | 25 +++++++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 2b7766ddb6..cd4e07ed5b 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2222,6 +2222,48 @@ VSX_MADD(xvmsubsp, 4, float32, VsrW(i), MSUB_FLGS, 0, 0)
 VSX_MADD(xvnmaddsp, 4, float32, VsrW(i), NMADD_FLGS, 0, 0)
 VSX_MADD(xvnmsubsp, 4, float32, VsrW(i), NMSUB_FLGS, 0, 0)
 
+/*
+ * VSX_MADDQ - VSX floating point quad-precision muliply/add
+ *   op    - instruction mnemonic
+ *   maddflgs - flags for the float*muladd routine that control the
+ *           various forms (madd, msub, nmadd, nmsub)
+ *   ro    - round to odd
+ */
+#define VSX_MADDQ(op, maddflgs, ro)                                            \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *s1, ppc_vsr_t *s2,\
+                 ppc_vsr_t *s3)                                                \
+{                                                                              \
+    ppc_vsr_t t = *xt;                                                         \
+                                                                               \
+    helper_reset_fpstatus(env);                                                \
+                                                                               \
+    float_status tstat = env->fp_status;                                       \
+    set_float_exception_flags(0, &tstat);                                      \
+    if (ro) {                                                                  \
+        tstat.float_rounding_mode = float_round_to_odd;                        \
+    }                                                                          \
+    t.f128 = float128_muladd(s1->f128, s3->f128, s2->f128, maddflgs, &tstat);  \
+    env->fp_status.float_exception_flags |= tstat.float_exception_flags;       \
+                                                                               \
+    if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {          \
+        float_invalid_op_madd(env, tstat.float_exception_flags,                \
+                              false, GETPC());                                 \
+    }                                                                          \
+                                                                               \
+    helper_compute_fprf_float128(env, t.f128);                                 \
+    *xt = t;                                                                   \
+    do_float_check_status(env, GETPC());                                       \
+}
+
+VSX_MADDQ(XSMADDQP, MADD_FLGS, 0)
+VSX_MADDQ(XSMADDQPO, MADD_FLGS, 1)
+VSX_MADDQ(XSMSUBQP, MSUB_FLGS, 0)
+VSX_MADDQ(XSMSUBQPO, MSUB_FLGS, 1)
+VSX_MADDQ(XSNMADDQP, NMADD_FLGS, 0)
+VSX_MADDQ(XSNMADDQPO, NMADD_FLGS, 1)
+VSX_MADDQ(XSNMSUBQP, NMSUB_FLGS, 0)
+VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
+
 /*
  * VSX_SCALAR_CMP_DP - VSX scalar floating point compare double precision
  *   op    - instruction mnemonic
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 2a88f2b904..c2c9cff175 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -430,6 +430,15 @@ DEF_HELPER_5(XSMSUBSP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSNMADDSP, void, env, vsr, vsr, vsr, vsr)
 DEF_HELPER_5(XSNMSUBSP, void, env, vsr, vsr, vsr, vsr)
 
+DEF_HELPER_5(XSMADDQP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMADDQPO, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMSUBQP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSMSUBQPO, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMADDQP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMADDQPO, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMSUBQP, void, env, vsr, vsr, vsr, vsr)
+DEF_HELPER_5(XSNMSUBQPO, void, env, vsr, vsr, vsr, vsr)
+
 DEF_HELPER_4(xvadddp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xvsubdp, void, env, vsr, vsr, vsr)
 DEF_HELPER_4(xvmuldp, void, env, vsr, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 84bc8b1168..c16b990a00 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -549,21 +549,25 @@ XSMADDADP       111100 ..... ..... ..... 00100001 . . . @XX3
 XSMADDMDP       111100 ..... ..... ..... 00101001 . . . @XX3
 XSMADDASP       111100 ..... ..... ..... 00000001 . . . @XX3
 XSMADDMSP       111100 ..... ..... ..... 00001001 . . . @XX3
+XSMADDQP        111111 ..... ..... ..... 0110000100 .   @X_rc
 
 XSMSUBADP       111100 ..... ..... ..... 00110001 . . . @XX3
 XSMSUBMDP       111100 ..... ..... ..... 00111001 . . . @XX3
 XSMSUBASP       111100 ..... ..... ..... 00010001 . . . @XX3
 XSMSUBMSP       111100 ..... ..... ..... 00011001 . . . @XX3
+XSMSUBQP        111111 ..... ..... ..... 0110100100 .   @X_rc
 
 XSNMADDASP      111100 ..... ..... ..... 10000001 . . . @XX3
 XSNMADDMSP      111100 ..... ..... ..... 10001001 . . . @XX3
 XSNMADDADP      111100 ..... ..... ..... 10100001 . . . @XX3
 XSNMADDMDP      111100 ..... ..... ..... 10101001 . . . @XX3
+XSNMADDQP       111111 ..... ..... ..... 0111000100 .   @X_rc
 
 XSNMSUBASP      111100 ..... ..... ..... 10010001 . . . @XX3
 XSNMSUBMSP      111100 ..... ..... ..... 10011001 . . . @XX3
 XSNMSUBADP      111100 ..... ..... ..... 10110001 . . . @XX3
 XSNMSUBMDP      111100 ..... ..... ..... 10111001 . . . @XX3
+XSNMSUBQP       111111 ..... ..... ..... 0111100100 .   @X_rc
 
 ## VSX splat instruction
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index be91b8d053..7764b1e5c2 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1331,6 +1331,31 @@ TRANS_FLAGS2(VSX207, XSNMADDMSP, do_xsmadd_XX3, false, gen_helper_XSNMADDSP)
 TRANS_FLAGS2(VSX207, XSNMSUBASP, do_xsmadd_XX3, true, gen_helper_XSNMSUBSP)
 TRANS_FLAGS2(VSX207, XSNMSUBMSP, do_xsmadd_XX3, false, gen_helper_XSNMSUBSP)
 
+static bool do_xsmadd_X(DisasContext *ctx, arg_X_rc *a,
+        void (gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr),
+        void (gen_helper_ro)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    int vrt, vra, vrb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    vrt = a->rt + 32;
+    vra = a->ra + 32;
+    vrb = a->rb + 32;
+
+    if (a->rc) {
+        return do_xsmadd(ctx, vrt, vra, vrt, vrb, gen_helper_ro);
+    }
+
+    return do_xsmadd(ctx, vrt, vra, vrt, vrb, gen_helper);
+}
+
+TRANS(XSMADDQP, do_xsmadd_X, gen_helper_XSMADDQP, gen_helper_XSMADDQPO)
+TRANS(XSMSUBQP, do_xsmadd_X, gen_helper_XSMSUBQP, gen_helper_XSMSUBQPO)
+TRANS(XSNMADDQP, do_xsmadd_X, gen_helper_XSNMADDQP, gen_helper_XSNMADDQPO)
+TRANS(XSNMSUBQP, do_xsmadd_X, gen_helper_XSNMSUBQP, gen_helper_XSNMSUBQPO)
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)             \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
-- 
2.25.1


