Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A374AE2CE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:06:33 +0100 (CET)
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXh1-0000gD-1n
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:06:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nHXAs-0008IF-PW; Tue, 08 Feb 2022 15:33:18 -0500
Received: from [187.72.171.209] (port=64195 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nHXAq-0001mu-Ef; Tue, 08 Feb 2022 15:33:18 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 8 Feb 2022 17:31:57 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 81122801D19;
 Tue,  8 Feb 2022 17:31:57 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH 2/3] target/ppc: change xs[n]madd[am]sp to use
 float64r32_muladd
Date: Tue,  8 Feb 2022 17:31:44 -0300
Message-Id: <20220208203145.3844662-3-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
References: <20220208203145.3844662-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 08 Feb 2022 20:31:57.0883 (UTC)
 FILETIME=[EB2C98B0:01D81D2A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
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
Cc: alex.bennee@linaro.org, danielhb413@gmail.com, groug@kaod.org, clg@kaod.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Change VSX Scalar Multiply-Add/Subtract Type-A/M Single Precision
helpers to use float64r32_muladd. This method should correctly handle
all rounding modes, so the workaround for float_round_nearest_even can
be dropped.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 54 +++++++++++++++--------------------------
 1 file changed, 19 insertions(+), 35 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index e5c29b53b8..bb2a71d195 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2157,7 +2157,7 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, 23)
  *           various forms (madd, msub, nmadd, nmsub)
  *   sfprf - set FPRF
  */
-#define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf, r2sp)                    \
+#define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf)                          \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                  ppc_vsr_t *xa, ppc_vsr_t *b, ppc_vsr_t *c)                   \
 {                                                                             \
@@ -2169,20 +2169,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     for (i = 0; i < nels; i++) {                                              \
         float_status tstat = env->fp_status;                                  \
         set_float_exception_flags(0, &tstat);                                 \
-        if (r2sp && (tstat.float_rounding_mode == float_round_nearest_even)) {\
-            /*                                                                \
-             * Avoid double rounding errors by rounding the intermediate      \
-             * result to odd.                                                 \
-             */                                                               \
-            set_float_rounding_mode(float_round_to_zero, &tstat);             \
-            t.fld = tp##_muladd(xa->fld, b->fld, c->fld,                      \
-                                maddflgs, &tstat);                            \
-            t.fld |= (get_float_exception_flags(&tstat) &                     \
-                      float_flag_inexact) != 0;                               \
-        } else {                                                              \
-            t.fld = tp##_muladd(xa->fld, b->fld, c->fld,                      \
-                                maddflgs, &tstat);                            \
-        }                                                                     \
+        t.fld = tp##_muladd(xa->fld, b->fld, c->fld,                          \
+                            maddflgs, &tstat);                                \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags;  \
                                                                               \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
@@ -2190,10 +2178,6 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
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
@@ -2202,24 +2186,24 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
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
+VSX_MADD(xsmadddp, 1, float64, VsrD(0), MADD_FLGS, 1)
+VSX_MADD(xsmsubdp, 1, float64, VsrD(0), MSUB_FLGS, 1)
+VSX_MADD(xsnmadddp, 1, float64, VsrD(0), NMADD_FLGS, 1)
+VSX_MADD(xsnmsubdp, 1, float64, VsrD(0), NMSUB_FLGS, 1)
+VSX_MADD(xsmaddsp, 1, float64r32, VsrD(0), MADD_FLGS, 1)
+VSX_MADD(xsmsubsp, 1, float64r32, VsrD(0), MSUB_FLGS, 1)
+VSX_MADD(xsnmaddsp, 1, float64r32, VsrD(0), NMADD_FLGS, 1)
+VSX_MADD(xsnmsubsp, 1, float64r32, VsrD(0), NMSUB_FLGS, 1)
 
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
  * VSX_SCALAR_CMP_DP - VSX scalar floating point compare double precision
-- 
2.25.1


