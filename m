Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16BD4CC3A9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:26:06 +0100 (CET)
Received: from localhost ([::1]:53354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpDJ-0002ep-N8
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPpA4-00071Y-PK; Thu, 03 Mar 2022 12:22:44 -0500
Received: from [187.72.171.209] (port=35509 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nPpA2-0004O4-TX; Thu, 03 Mar 2022 12:22:44 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 3 Mar 2022 14:22:23 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BA9AD8001CD;
 Thu,  3 Mar 2022 14:22:22 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 2/5] target/ppc: change xs[n]madd[am]sp to use
 float64r32_muladd
Date: Thu,  3 Mar 2022 14:20:38 -0300
Message-Id: <20220303172041.1915037-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Mar 2022 17:22:23.0254 (UTC)
 FILETIME=[3EDE3360:01D82F23]
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
Cc: thuth@redhat.com, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Change VSX Scalar Multiply-Add/Subtract Type-A/M Single Precision
helpers to use float64r32_muladd. This method should correctly handle
all rounding modes, so the workaround for float_round_nearest_even can
be dropped.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 93 ++++++++++++++++-------------------------
 1 file changed, 35 insertions(+), 58 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 8f970288f5..c973968ed6 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -1916,22 +1916,19 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
  *   sfprf - set FPRF
  */
-#define VSX_RE(op, nels, tp, fld, sfprf, r2sp)                                \
+#define VSX_RE(op, nels, tp, op_tp, fld, sfprf)                               \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
 {                                                                             \
     ppc_vsr_t t = { };                                                        \
-    int i;                                                                    \
+    int i, flags;                                                             \
                                                                               \
     helper_reset_fpstatus(env);                                               \
                                                                               \
     for (i = 0; i < nels; i++) {                                              \
-        if (unlikely(tp##_is_signaling_nan(xb->fld, &env->fp_status))) {      \
+        t.fld = op_tp##_div(tp##_one, xb->fld, &env->fp_status);              \
+        flags = get_float_exception_flags(&env->fp_status);                   \
+        if (unlikely(flags & float_flag_invalid_snan)) {                      \
             float_invalid_op_vxsnan(env, GETPC());                            \
-        }                                                                     \
-        t.fld = tp##_div(tp##_one, xb->fld, &env->fp_status);                 \
-                                                                              \
-        if (r2sp) {                                                           \
-            t.fld = do_frsp(env, t.fld, GETPC());                             \
         }                                                                     \
                                                                               \
         if (sfprf) {                                                          \
@@ -1943,10 +1940,10 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
     do_float_check_status(env, GETPC());                                      \
 }
 
-VSX_RE(xsredp, 1, float64, VsrD(0), 1, 0)
-VSX_RE(xsresp, 1, float64, VsrD(0), 1, 1)
-VSX_RE(xvredp, 2, float64, VsrD(i), 0, 0)
-VSX_RE(xvresp, 4, float32, VsrW(i), 0, 0)
+VSX_RE(xsredp, 1, float64, float64, VsrD(0), 1)
+VSX_RE(xsresp, 1, float64, float64r32, VsrD(0), 1)
+VSX_RE(xvredp, 2, float64, float64, VsrD(i), 0)
+VSX_RE(xvresp, 4, float32, float32, VsrW(i), 0)
 
 /*
  * VSX_SQRT - VSX floating point square root
@@ -1998,10 +1995,11 @@ VSX_SQRT(xvsqrtsp, 4, float32, VsrW(i), 0, 0)
  *   op    - instruction mnemonic
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
+ *   op_tp - operation type
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
  *   sfprf - set FPRF
  */
-#define VSX_RSQRTE(op, nels, tp, fld, sfprf, r2sp)                           \
+#define VSX_RSQRTE(op, nels, tp, op_tp, fld, sfprf)                          \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
     ppc_vsr_t t = { };                                                       \
@@ -2012,15 +2010,12 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
     for (i = 0; i < nels; i++) {                                             \
         float_status tstat = env->fp_status;                                 \
         set_float_exception_flags(0, &tstat);                                \
-        t.fld = tp##_sqrt(xb->fld, &tstat);                                  \
-        t.fld = tp##_div(tp##_one, t.fld, &tstat);                           \
+        t.fld = op_tp##_sqrt(xb->fld, &tstat);                               \
+        t.fld = op_tp##_div(tp##_one, t.fld, &tstat);                        \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags; \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             float_invalid_op_sqrt(env, tstat.float_exception_flags,          \
                                   sfprf, GETPC());                           \
-        }                                                                    \
-        if (r2sp) {                                                          \
-            t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
         if (sfprf) {                                                         \
@@ -2032,10 +2027,10 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
     do_float_check_status(env, GETPC());                                     \
 }
 
-VSX_RSQRTE(xsrsqrtedp, 1, float64, VsrD(0), 1, 0)
-VSX_RSQRTE(xsrsqrtesp, 1, float64, VsrD(0), 1, 1)
-VSX_RSQRTE(xvrsqrtedp, 2, float64, VsrD(i), 0, 0)
-VSX_RSQRTE(xvrsqrtesp, 4, float32, VsrW(i), 0, 0)
+VSX_RSQRTE(xsrsqrtedp, 1, float64, float64, VsrD(0), 1)
+VSX_RSQRTE(xsrsqrtesp, 1, float64, float64r32, VsrD(0), 1)
+VSX_RSQRTE(xvrsqrtedp, 2, float64, float64, VsrD(i), 0)
+VSX_RSQRTE(xvrsqrtesp, 4, float32, float32, VsrW(i), 0)
 
 /*
  * VSX_TDIV - VSX floating point test for divide
@@ -2156,9 +2151,8 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, 23)
  *   maddflgs - flags for the float*muladd routine that control the
  *           various forms (madd, msub, nmadd, nmsub)
  *   sfprf - set FPRF
- *   r2sp  - round intermediate double precision result to single precision
  */
-#define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf, r2sp)                    \
+#define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf)                          \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                  ppc_vsr_t *s1, ppc_vsr_t *s2, ppc_vsr_t *s3)                 \
 {                                                                             \
@@ -2170,20 +2164,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     for (i = 0; i < nels; i++) {                                              \
         float_status tstat = env->fp_status;                                  \
         set_float_exception_flags(0, &tstat);                                 \
-        if (r2sp && (tstat.float_rounding_mode == float_round_nearest_even)) {\
-            /*                                                                \
-             * Avoid double rounding errors by rounding the intermediate      \
-             * result to odd.                                                 \
-             */                                                               \
-            set_float_rounding_mode(float_round_to_zero, &tstat);             \
-            t.fld = tp##_muladd(s1->fld, s3->fld, s2->fld,                    \
-                                maddflgs, &tstat);                            \
-            t.fld |= (get_float_exception_flags(&tstat) &                     \
-                      float_flag_inexact) != 0;                               \
-        } else {                                                              \
-            t.fld = tp##_muladd(s1->fld, s3->fld, s2->fld,                    \
-                                maddflgs, &tstat);                            \
-        }                                                                     \
+        t.fld = tp##_muladd(s1->fld, s3->fld, s2->fld, maddflgs, &tstat);     \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags;  \
                                                                               \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
@@ -2191,10 +2172,6 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                                   sfprf, GETPC());                            \
         }                                                                     \
                                                                               \
-        if (r2sp) {                                                           \
-            t.fld = do_frsp(env, t.fld, GETPC());                             \
-        }                                                                     \
-                                                                              \
         if (sfprf) {                                                          \
             helper_compute_fprf_float64(env, t.fld);                          \
         }                                                                     \
@@ -2203,24 +2180,24 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     do_float_check_status(env, GETPC());                                      \
 }
 
-VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1, 0)
-VSX_MADD(XSMSUBDP, 1, float64, VsrD(0), MSUB_FLGS, 1, 0)
-VSX_MADD(XSNMADDDP, 1, float64, VsrD(0), NMADD_FLGS, 1, 0)
-VSX_MADD(XSNMSUBDP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 0)
-VSX_MADD(XSMADDSP, 1, float64, VsrD(0), MADD_FLGS, 1, 1)
-VSX_MADD(XSMSUBSP, 1, float64, VsrD(0), MSUB_FLGS, 1, 1)
-VSX_MADD(XSNMADDSP, 1, float64, VsrD(0), NMADD_FLGS, 1, 1)
-VSX_MADD(XSNMSUBSP, 1, float64, VsrD(0), NMSUB_FLGS, 1, 1)
+VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1)
+VSX_MADD(XSMSUBDP, 1, float64, VsrD(0), MSUB_FLGS, 1)
+VSX_MADD(XSNMADDDP, 1, float64, VsrD(0), NMADD_FLGS, 1)
+VSX_MADD(XSNMSUBDP, 1, float64, VsrD(0), NMSUB_FLGS, 1)
+VSX_MADD(XSMADDSP, 1, float64r32, VsrD(0), MADD_FLGS, 1)
+VSX_MADD(XSMSUBSP, 1, float64r32, VsrD(0), MSUB_FLGS, 1)
+VSX_MADD(XSNMADDSP, 1, float64r32, VsrD(0), NMADD_FLGS, 1)
+VSX_MADD(XSNMSUBSP, 1, float64r32, VsrD(0), NMSUB_FLGS, 1)
 
-VSX_MADD(xvmadddp, 2, float64, VsrD(i), MADD_FLGS, 0, 0)
-VSX_MADD(xvmsubdp, 2, float64, VsrD(i), MSUB_FLGS, 0, 0)
-VSX_MADD(xvnmadddp, 2, float64, VsrD(i), NMADD_FLGS, 0, 0)
-VSX_MADD(xvnmsubdp, 2, float64, VsrD(i), NMSUB_FLGS, 0, 0)
+VSX_MADD(xvmadddp, 2, float64, VsrD(i), MADD_FLGS, 0)
+VSX_MADD(xvmsubdp, 2, float64, VsrD(i), MSUB_FLGS, 0)
+VSX_MADD(xvnmadddp, 2, float64, VsrD(i), NMADD_FLGS, 0)
+VSX_MADD(xvnmsubdp, 2, float64, VsrD(i), NMSUB_FLGS, 0)
 
-VSX_MADD(xvmaddsp, 4, float32, VsrW(i), MADD_FLGS, 0, 0)
-VSX_MADD(xvmsubsp, 4, float32, VsrW(i), MSUB_FLGS, 0, 0)
-VSX_MADD(xvnmaddsp, 4, float32, VsrW(i), NMADD_FLGS, 0, 0)
-VSX_MADD(xvnmsubsp, 4, float32, VsrW(i), NMSUB_FLGS, 0, 0)
+VSX_MADD(xvmaddsp, 4, float32, VsrW(i), MADD_FLGS, 0)
+VSX_MADD(xvmsubsp, 4, float32, VsrW(i), MSUB_FLGS, 0)
+VSX_MADD(xvnmaddsp, 4, float32, VsrW(i), NMADD_FLGS, 0)
+VSX_MADD(xvnmsubsp, 4, float32, VsrW(i), NMSUB_FLGS, 0)
 
 /*
  * VSX_MADDQ - VSX floating point quad-precision muliply/add
-- 
2.25.1


