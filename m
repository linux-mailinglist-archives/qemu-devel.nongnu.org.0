Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0251FD78
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:59:30 +0200 (CEST)
Received: from localhost ([::1]:45218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2z3-0001Yk-9N
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1no2qM-0003uU-2L; Mon, 09 May 2022 08:50:30 -0400
Received: from [187.72.171.209] (port=40533 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1no2qI-0002Fj-IF; Mon, 09 May 2022 08:50:29 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 9 May 2022 09:49:19 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7C1CF800068;
 Mon,  9 May 2022 09:49:18 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH 1/2] target/ppc: Fix FPSCR.FI bit being cleared when it
 shouldn't
Date: Mon,  9 May 2022 09:48:35 -0300
Message-Id: <20220509124836.27819-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509124836.27819-1-victor.colombo@eldorado.org.br>
References: <20220509124836.27819-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 09 May 2022 12:49:19.0270 (UTC)
 FILETIME=[32EDE460:01D863A3]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FI bit in FPSCR is said to be a non-sticky bit on Power ISA.
One could think this means that, if an instruction is said to modify
the FPSCR register, the bit FI should be cleared. This is what QEMU
does today.

However, the following inconsistency was found when comparing results
from the hardware (tested on both a Power 9 processor and in
Power 10 Mambo):

(FI bit is set before the execution of the instruction)
Hardware: xscmpeqdp(0xff..ff, 0xff..ff) = FI: SET -> SET
QEMU: xscmpeqdp(0xff..ff, 0xff..ff) = FI: SET -> CLEARED

This is happening to multiple instructions in the vsx
implementations. As the FI bit is non-sticky, one could think that
xscmpeqdp, a instruction the ISA states doesn't change FI bit, should
result in a cleared FI. However, this is not happening on hardware.

An investigation resulted in the following conclusion:
If the ISA does not list the FI bit as altered for a particular
instruction, then it should be kept as it was before the instruction.

QEMU is not following this behavior. Affected instructions include:
- xv* (all vsx-vector instructions);
- xscmp*, xsmax*, xsmin*;
- xstdivdp and similars;
(to identify the affected instructions, just search in the ISA for
 the instructions that does not list FI in "Special Registers Altered")

Most instructions use the function do_float_check_status() to commit
changes in the inexact flag. So the fix is to add a parameter to it
that will control if the bit FI should be changed or not.
All users of do_float_check_status() are then modified to provide this
argument, controlling if that specific instruction changes bit FI or
not.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 205 +++++++++++++++++++++-------------------
 1 file changed, 106 insertions(+), 99 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f6c8318a71..773c80e12d 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -366,11 +366,13 @@ static inline void float_underflow_excp(CPUPPCState *env)
     }
 }
 
-static inline void float_inexact_excp(CPUPPCState *env)
+static inline void float_inexact_excp(CPUPPCState *env, bool set_fi)
 {
     CPUState *cs = env_cpu(env);
 
-    env->fpscr |= FP_FI;
+    if (set_fi) {
+        env->fpscr |= FP_FI;
+    }
     env->fpscr |= FP_XX;
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
@@ -462,7 +464,8 @@ void helper_fpscr_check_status(CPUPPCState *env)
     }
 }
 
-static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
+static void do_float_check_status(CPUPPCState *env, bool change_fi,
+                                  uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
     int status = get_float_exception_flags(&env->fp_status);
@@ -473,8 +476,8 @@ static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
         float_underflow_excp(env);
     }
     if (status & float_flag_inexact) {
-        float_inexact_excp(env);
-    } else {
+        float_inexact_excp(env, change_fi);
+    } else if (change_fi) {
         env->fpscr &= ~FP_FI; /* clear the FPSCR[FI] bit */
     }
 
@@ -490,7 +493,7 @@ static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
 
 void helper_float_check_status(CPUPPCState *env)
 {
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 void helper_reset_fpstatus(CPUPPCState *env)
@@ -684,7 +687,7 @@ uint64_t helper_##op(CPUPPCState *env, uint64_t arg)       \
     } else {                                               \
         farg.d = cvtr(arg, &env->fp_status);               \
     }                                                      \
-    do_float_check_status(env, GETPC());                   \
+    do_float_check_status(env, true, GETPC());             \
     return farg.ll;                                        \
 }
 
@@ -710,7 +713,7 @@ static uint64_t do_fri(CPUPPCState *env, uint64_t arg,
 
     /* fri* does not set FPSCR[XX] */
     set_float_exception_flags(flags & ~float_flag_inexact, &env->fp_status);
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 
     return arg;
 }
@@ -1690,9 +1693,9 @@ uint32_t helper_efdcmpeq(CPUPPCState *env, uint64_t op1, uint64_t op2)
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_ADD_SUB(name, op, nels, tp, fld, sfprf, r2sp)                    \
+#define VSX_ADD_SUB(name, op, nels, tp, fld, sfifprf, r2sp)                  \
 void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
                    ppc_vsr_t *xa, ppc_vsr_t *xb)                             \
 {                                                                            \
@@ -1709,19 +1712,19 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
                                                                              \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             float_invalid_op_addsub(env, tstat.float_exception_flags,        \
-                                    sfprf, GETPC());                         \
+                                    sfifprf, GETPC());                       \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
             t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
-        if (sfprf) {                                                         \
+        if (sfifprf) {                                                       \
             helper_compute_fprf_float64(env, t.fld);                         \
         }                                                                    \
     }                                                                        \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfifprf, GETPC());                            \
 }
 
 VSX_ADD_SUB(xsadddp, add, 1, float64, VsrD(0), 1, 0)
@@ -1757,7 +1760,7 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opcode,
     helper_compute_fprf_float128(env, t.f128);
 
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 /*
@@ -1766,9 +1769,9 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opcode,
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfprf - set FI and FPRF
  */
-#define VSX_MUL(op, nels, tp, fld, sfprf, r2sp)                              \
+#define VSX_MUL(op, nels, tp, fld, sfifprf, r2sp)                            \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                            \
                  ppc_vsr_t *xa, ppc_vsr_t *xb)                               \
 {                                                                            \
@@ -1785,20 +1788,20 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                            \
                                                                              \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             float_invalid_op_mul(env, tstat.float_exception_flags,           \
-                                 sfprf, GETPC());                            \
+                                 sfifprf, GETPC());                          \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
             t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
-        if (sfprf) {                                                         \
+        if (sfifprf) {                                                       \
             helper_compute_fprf_float64(env, t.fld);                         \
         }                                                                    \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfifprf, GETPC());                            \
 }
 
 VSX_MUL(xsmuldp, 1, float64, VsrD(0), 1, 0)
@@ -1828,7 +1831,7 @@ void helper_xsmulqp(CPUPPCState *env, uint32_t opcode,
     helper_compute_fprf_float128(env, t.f128);
 
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 /*
@@ -1837,9 +1840,9 @@ void helper_xsmulqp(CPUPPCState *env, uint32_t opcode,
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_DIV(op, nels, tp, fld, sfprf, r2sp)                               \
+#define VSX_DIV(op, nels, tp, fld, sfifprf, r2sp)                             \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                  ppc_vsr_t *xa, ppc_vsr_t *xb)                                \
 {                                                                             \
@@ -1856,7 +1859,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                                                                               \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
             float_invalid_op_div(env, tstat.float_exception_flags,            \
-                                 sfprf, GETPC());                             \
+                                 sfifprf, GETPC());                           \
         }                                                                     \
         if (unlikely(tstat.float_exception_flags & float_flag_divbyzero)) {   \
             float_zero_divide_excp(env, GETPC());                             \
@@ -1866,13 +1869,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
             t.fld = do_frsp(env, t.fld, GETPC());                             \
         }                                                                     \
                                                                               \
-        if (sfprf) {                                                          \
+        if (sfifprf) {                                                        \
             helper_compute_fprf_float64(env, t.fld);                          \
         }                                                                     \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, sfifprf, GETPC());                             \
 }
 
 VSX_DIV(xsdivdp, 1, float64, VsrD(0), 1, 0)
@@ -1905,7 +1908,7 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 /*
@@ -1914,9 +1917,9 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FPRF
  */
-#define VSX_RE(op, nels, tp, fld, sfprf, r2sp)                                \
+#define VSX_RE(op, nels, tp, fld, sfifprf, r2sp)                              \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
 {                                                                             \
     ppc_vsr_t t = { };                                                        \
@@ -1934,13 +1937,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
             t.fld = do_frsp(env, t.fld, GETPC());                             \
         }                                                                     \
                                                                               \
-        if (sfprf) {                                                          \
+        if (sfifprf) {                                                        \
             helper_compute_fprf_float64(env, t.fld);                          \
         }                                                                     \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, sfifprf, GETPC());                             \
 }
 
 VSX_RE(xsredp, 1, float64, VsrD(0), 1, 0)
@@ -1954,9 +1957,9 @@ VSX_RE(xvresp, 4, float32, VsrW(i), 0, 0)
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_SQRT(op, nels, tp, fld, sfprf, r2sp)                             \
+#define VSX_SQRT(op, nels, tp, fld, sfifprf, r2sp)                           \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
     ppc_vsr_t t = { };                                                       \
@@ -1972,20 +1975,20 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                                                              \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             float_invalid_op_sqrt(env, tstat.float_exception_flags,          \
-                                  sfprf, GETPC());                           \
+                                  sfifprf, GETPC());                         \
         }                                                                    \
                                                                              \
         if (r2sp) {                                                          \
             t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
-        if (sfprf) {                                                         \
+        if (sfifprf) {                                                       \
             helper_compute_fprf_float64(env, t.fld);                         \
         }                                                                    \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfifprf, GETPC());                            \
 }
 
 VSX_SQRT(xssqrtdp, 1, float64, VsrD(0), 1, 0)
@@ -1999,9 +2002,9 @@ VSX_SQRT(xvsqrtsp, 4, float32, VsrW(i), 0, 0)
  *   nels  - number of elements (1, 2 or 4)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_RSQRTE(op, nels, tp, fld, sfprf, r2sp)                           \
+#define VSX_RSQRTE(op, nels, tp, fld, sfifprf, r2sp)                         \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
     ppc_vsr_t t = { };                                                       \
@@ -2017,19 +2020,19 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags; \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             float_invalid_op_sqrt(env, tstat.float_exception_flags,          \
-                                  sfprf, GETPC());                           \
+                                  sfifprf, GETPC());                         \
         }                                                                    \
         if (r2sp) {                                                          \
             t.fld = do_frsp(env, t.fld, GETPC());                            \
         }                                                                    \
                                                                              \
-        if (sfprf) {                                                         \
+        if (sfifprf) {                                                       \
             helper_compute_fprf_float64(env, t.fld);                         \
         }                                                                    \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfifprf, GETPC());                            \
 }
 
 VSX_RSQRTE(xsrsqrtedp, 1, float64, VsrD(0), 1, 0)
@@ -2155,9 +2158,9 @@ VSX_TSQRT(xvtsqrtsp, 4, float32, VsrW(i), -126, 23)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
  *   maddflgs - flags for the float*muladd routine that control the
  *           various forms (madd, msub, nmadd, nmsub)
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_MADD(op, nels, tp, fld, maddflgs, sfprf)                          \
+#define VSX_MADD(op, nels, tp, fld, maddflgs, sfifprf)                        \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                  ppc_vsr_t *s1, ppc_vsr_t *s2, ppc_vsr_t *s3)                 \
 {                                                                             \
@@ -2174,15 +2177,15 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
                                                                               \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
             float_invalid_op_madd(env, tstat.float_exception_flags,           \
-                                  sfprf, GETPC());                            \
+                                  sfifprf, GETPC());                          \
         }                                                                     \
                                                                               \
-        if (sfprf) {                                                          \
+        if (sfifprf) {                                                        \
             helper_compute_fprf_float64(env, t.fld);                          \
         }                                                                     \
     }                                                                         \
     *xt = t;                                                                  \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, sfifprf, GETPC());                             \
 }
 
 VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1)
@@ -2234,7 +2237,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *s1, ppc_vsr_t *s2,\
                                                                                \
     helper_compute_fprf_float128(env, t.f128);                                 \
     *xt = t;                                                                   \
-    do_float_check_status(env, GETPC());                                       \
+    do_float_check_status(env, true, GETPC());                                 \
 }
 
 VSX_MADDQ(XSMADDQP, MADD_FLGS, 0)
@@ -2283,7 +2286,7 @@ VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
                                                                               \
     memset(xt, 0, sizeof(*xt));                                               \
     memset(&xt->fld, -r, sizeof(xt->fld));                                    \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, false, GETPC());                               \
 }
 
 VSX_SCALAR_CMP(XSCMPEQDP, float64, eq, VsrD(0), 0)
@@ -2319,7 +2322,7 @@ void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[BF(opcode)] = cc;
 
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 void helper_xscmpexpqp(CPUPPCState *env, uint32_t opcode,
@@ -2348,7 +2351,7 @@ void helper_xscmpexpqp(CPUPPCState *env, uint32_t opcode,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[BF(opcode)] = cc;
 
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
@@ -2401,7 +2404,7 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
         float_invalid_op_vxvc(env, 0, GETPC());
     }
 
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 void helper_xscmpodp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
@@ -2466,7 +2469,7 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
         float_invalid_op_vxvc(env, 0, GETPC());
     }
 
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 void helper_xscmpoqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
@@ -2505,7 +2508,7 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                           \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, false, GETPC());                               \
 }
 
 VSX_MAX_MIN(xsmaxdp, maxnum, 1, float64, VsrD(0))
@@ -2667,9 +2670,9 @@ VSX_CMP(xvcmpnesp, 4, float32, VsrW(i), eq, 0, 0)
  *   ttp   - target type (float32 or float64)
  *   sfld  - source vsr_t field
  *   tfld  - target vsr_t field (f32 or f64)
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_CVT_FP_TO_FP(op, nels, stp, ttp, sfld, tfld, sfprf)    \
+#define VSX_CVT_FP_TO_FP(op, nels, stp, ttp, sfld, tfld, sfifprf)  \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
 {                                                                  \
     ppc_vsr_t t = { };                                             \
@@ -2682,19 +2685,19 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
             float_invalid_op_vxsnan(env, GETPC());                 \
             t.tfld = ttp##_snan_to_qnan(t.tfld);                   \
         }                                                          \
-        if (sfprf) {                                               \
+        if (sfifprf) {                                             \
             helper_compute_fprf_##ttp(env, t.tfld);                \
         }                                                          \
     }                                                              \
                                                                    \
     *xt = t;                                                       \
-    do_float_check_status(env, GETPC());                           \
+    do_float_check_status(env, sfifprf, GETPC());                  \
 }
 
 VSX_CVT_FP_TO_FP(xscvspdp, 1, float32, float64, VsrW(0), VsrD(0), 1)
 VSX_CVT_FP_TO_FP(xvcvspdp, 2, float32, float64, VsrW(2 * i), VsrD(i), 0)
 
-#define VSX_CVT_FP_TO_FP2(op, nels, stp, ttp, sfprf)                  \
+#define VSX_CVT_FP_TO_FP2(op, nels, stp, ttp, sfifprf)                \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
 {                                                                     \
     ppc_vsr_t t = { };                                                \
@@ -2707,14 +2710,14 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
             float_invalid_op_vxsnan(env, GETPC());                    \
             t.VsrW(2 * i) = ttp##_snan_to_qnan(t.VsrW(2 * i));        \
         }                                                             \
-        if (sfprf) {                                                  \
+        if (sfifprf) {                                                \
             helper_compute_fprf_##ttp(env, t.VsrW(2 * i));            \
         }                                                             \
         t.VsrW(2 * i + 1) = t.VsrW(2 * i);                            \
     }                                                                 \
                                                                       \
     *xt = t;                                                          \
-    do_float_check_status(env, GETPC());                              \
+    do_float_check_status(env, sfifprf, GETPC());                     \
 }
 
 VSX_CVT_FP_TO_FP2(xvcvdpsp, 2, float64, float32, 0)
@@ -2750,7 +2753,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                       \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, GETPC());                                \
+    do_float_check_status(env, true, GETPC());                          \
 }
 
 VSX_CVT_FP_TO_FP_VECTOR(xscvdpqp, 1, float64, float128, VsrD(0), f128, 1)
@@ -2765,8 +2768,9 @@ VSX_CVT_FP_TO_FP_VECTOR(xscvdpqp, 1, float64, float128, VsrD(0), f128, 1)
  *   sfld  - source vsr_t field
  *   tfld  - target vsr_t field
  *   sfprf - set FPRF
+ *   sfi   - set FI
  */
-#define VSX_CVT_FP_TO_FP_HP(op, nels, stp, ttp, sfld, tfld, sfprf) \
+#define VSX_CVT_FP_TO_FP_HP(op, nels, stp, ttp, sfld, tfld, sfifprf) \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
 {                                                                  \
     ppc_vsr_t t = { };                                             \
@@ -2779,13 +2783,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
             float_invalid_op_vxsnan(env, GETPC());                 \
             t.tfld = ttp##_snan_to_qnan(t.tfld);                   \
         }                                                          \
-        if (sfprf) {                                               \
+        if (sfifprf) {                                             \
             helper_compute_fprf_##ttp(env, t.tfld);                \
         }                                                          \
     }                                                              \
                                                                    \
     *xt = t;                                                       \
-    do_float_check_status(env, GETPC());                           \
+    do_float_check_status(env, sfifprf, GETPC());                  \
 }
 
 VSX_CVT_FP_TO_FP_HP(xscvdphp, 1, float64, float16, VsrD(0), VsrH(3), 1)
@@ -2810,7 +2814,7 @@ void helper_XVCVSPBF16(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
     }
 
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
@@ -2833,7 +2837,7 @@ void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
     helper_compute_fprf_float64(env, t.VsrD(0));
 
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
@@ -2889,9 +2893,10 @@ uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
  *   ttp   - target type (int32, uint32, int64 or uint64)
  *   sfld  - source vsr_t field
  *   tfld  - target vsr_t field
+ *   sfi   - set FI
  *   rnan  - resulting NaN
  */
-#define VSX_CVT_FP_TO_INT(op, nels, stp, ttp, sfld, tfld, rnan)              \
+#define VSX_CVT_FP_TO_INT(op, nels, stp, ttp, sfld, tfld, sfi, rnan)         \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
     int all_flags = env->fp_status.float_exception_flags, flags;             \
@@ -2910,20 +2915,22 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                                                              \
     *xt = t;                                                                 \
     env->fp_status.float_exception_flags = all_flags;                        \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfi, GETPC());                                \
 }
 
-VSX_CVT_FP_TO_INT(xscvdpsxds, 1, float64, int64, VsrD(0), VsrD(0), \
+VSX_CVT_FP_TO_INT(xscvdpsxds, 1, float64, int64, VsrD(0), VsrD(0), 1, \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xscvdpuxds, 1, float64, uint64, VsrD(0), VsrD(0), 0ULL)
-VSX_CVT_FP_TO_INT(xvcvdpsxds, 2, float64, int64, VsrD(i), VsrD(i), \
+VSX_CVT_FP_TO_INT(xscvdpuxds, 1, float64, uint64, VsrD(0), VsrD(0), 1, 0ULL)
+VSX_CVT_FP_TO_INT(xvcvdpsxds, 2, float64, int64, VsrD(i), VsrD(i), 0, \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xvcvdpuxds, 2, float64, uint64, VsrD(i), VsrD(i), 0ULL)
-VSX_CVT_FP_TO_INT(xvcvspsxds, 2, float32, int64, VsrW(2 * i), VsrD(i), \
+VSX_CVT_FP_TO_INT(xvcvdpuxds, 2, float64, uint64, VsrD(i), VsrD(i), 0, 0ULL)
+VSX_CVT_FP_TO_INT(xvcvspsxds, 2, float32, int64, VsrW(2 * i), VsrD(i), 0, \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xvcvspsxws, 4, float32, int32, VsrW(i), VsrW(i), 0x80000000U)
-VSX_CVT_FP_TO_INT(xvcvspuxds, 2, float32, uint64, VsrW(2 * i), VsrD(i), 0ULL)
-VSX_CVT_FP_TO_INT(xvcvspuxws, 4, float32, uint32, VsrW(i), VsrW(i), 0U)
+VSX_CVT_FP_TO_INT(xvcvspsxws, 4, float32, int32, VsrW(i), VsrW(i), 0, \
+                  0x80000000ULL)
+VSX_CVT_FP_TO_INT(xvcvspuxds, 2, float32, uint64, VsrW(2 * i), VsrD(i), 0, \
+                  0ULL)
+VSX_CVT_FP_TO_INT(xvcvspuxws, 4, float32, uint32, VsrW(i), VsrW(i), 0, 0U)
 
 #define VSX_CVT_FP_TO_INT128(op, tp, rnan)                                     \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)               \
@@ -2940,7 +2947,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)               \
     }                                                                          \
                                                                                \
     *xt = t;                                                                   \
-    do_float_check_status(env, GETPC());                                       \
+    do_float_check_status(env, true, GETPC());                                 \
 }
 
 VSX_CVT_FP_TO_INT128(XSCVQPUQZ, uint128, 0)
@@ -2955,7 +2962,7 @@ VSX_CVT_FP_TO_INT128(XSCVQPSQZ, int128, 0x8000000000000000ULL);
  *     words 0 and 1 (and words 2 and 3) of the result register, as
  *     is required by this version of the architecture.
  */
-#define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, rnan)                         \
+#define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, sfi, rnan)                    \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
     int all_flags = env->fp_status.float_exception_flags, flags;             \
@@ -2977,13 +2984,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                                                              \
     *xt = t;                                                                 \
     env->fp_status.float_exception_flags = all_flags;                        \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfi, GETPC());                                \
 }
 
-VSX_CVT_FP_TO_INT2(xscvdpsxws, 1, float64, int32, 0x80000000U)
-VSX_CVT_FP_TO_INT2(xscvdpuxws, 1, float64, uint32, 0U)
-VSX_CVT_FP_TO_INT2(xvcvdpsxws, 2, float64, int32, 0x80000000U)
-VSX_CVT_FP_TO_INT2(xvcvdpuxws, 2, float64, uint32, 0U)
+VSX_CVT_FP_TO_INT2(xscvdpsxws, 1, float64, int32, 1, 0x80000000U)
+VSX_CVT_FP_TO_INT2(xscvdpuxws, 1, float64, uint32, 1, 0U)
+VSX_CVT_FP_TO_INT2(xvcvdpsxws, 2, float64, int32, 0, 0x80000000U)
+VSX_CVT_FP_TO_INT2(xvcvdpuxws, 2, float64, uint32, 0, 0U)
 
 /*
  * VSX_CVT_FP_TO_INT_VECTOR - VSX floating point to integer conversion
@@ -3008,7 +3015,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, true, GETPC());                               \
 }
 
 VSX_CVT_FP_TO_INT_VECTOR(xscvqpsdz, float128, int64, f128, VsrD(0),          \
@@ -3028,9 +3035,9 @@ VSX_CVT_FP_TO_INT_VECTOR(xscvqpuwz, float128, uint32, f128, VsrD(0), 0x0ULL)
  *   sfld  - source vsr_t field
  *   tfld  - target vsr_t field
  *   jdef  - definition of the j index (i or 2*i)
- *   sfprf - set FPRF
+ *   sfifprf - set FPRF
  */
-#define VSX_CVT_INT_TO_FP(op, nels, stp, ttp, sfld, tfld, sfprf, r2sp)  \
+#define VSX_CVT_INT_TO_FP(op, nels, stp, ttp, sfld, tfld, sfifprf, r2sp)\
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
 {                                                                       \
     ppc_vsr_t t = { };                                                  \
@@ -3041,13 +3048,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
         if (r2sp) {                                                     \
             t.tfld = do_frsp(env, t.tfld, GETPC());                     \
         }                                                               \
-        if (sfprf) {                                                    \
+        if (sfifprf) {                                                  \
             helper_compute_fprf_float64(env, t.tfld);                   \
         }                                                               \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, GETPC());                                \
+    do_float_check_status(env, sfifprf, GETPC());                       \
 }
 
 VSX_CVT_INT_TO_FP(xscvsxddp, 1, int64, float64, VsrD(0), VsrD(0), 1, 0)
@@ -3073,7 +3080,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, GETPC());                                \
+    do_float_check_status(env, false, GETPC());                         \
 }
 
 VSX_CVT_INT_TO_FP2(xvcvsxdsp, int64, float32)
@@ -3085,7 +3092,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)\
     helper_reset_fpstatus(env);                                 \
     xt->f128 = tp##_to_float128(xb->s128, &env->fp_status);     \
     helper_compute_fprf_float128(env, xt->f128);                \
-    do_float_check_status(env, GETPC());                        \
+    do_float_check_status(env, true, GETPC());                  \
 }
 
 VSX_CVT_INT128_TO_FP(XSCVUQQP, uint128);
@@ -3109,7 +3116,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
     helper_compute_fprf_##ttp(env, t.tfld);                             \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, GETPC());                                \
+    do_float_check_status(env, true, GETPC());                          \
 }
 
 VSX_CVT_INT_TO_FP_VECTOR(xscvsdqp, int64, float128, VsrD(0), f128)
@@ -3129,9 +3136,9 @@ VSX_CVT_INT_TO_FP_VECTOR(xscvudqp, uint64, float128, VsrD(0), f128)
  *   tp    - type (float32 or float64)
  *   fld   - vsr_t field (VsrD(*) or VsrW(*))
  *   rmode - rounding mode
- *   sfprf - set FPRF
+ *   sfifprf - set FI and FPRF
  */
-#define VSX_ROUND(op, nels, tp, fld, rmode, sfprf)                     \
+#define VSX_ROUND(op, nels, tp, fld, rmode, sfifprf)                   \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
 {                                                                      \
     ppc_vsr_t t = { };                                                 \
@@ -3151,7 +3158,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
         } else {                                                       \
             t.fld = tp##_round_to_int(xb->fld, &env->fp_status);       \
         }                                                              \
-        if (sfprf) {                                                   \
+        if (sfifprf) {                                                 \
             helper_compute_fprf_float64(env, t.fld);                   \
         }                                                              \
     }                                                                  \
@@ -3167,7 +3174,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
     }                                                                  \
                                                                        \
     *xt = t;                                                           \
-    do_float_check_status(env, GETPC());                               \
+    do_float_check_status(env, sfifprf, GETPC());                      \
 }
 
 VSX_ROUND(xsrdpi, 1, float64, VsrD(0), float_round_ties_away, 1)
@@ -3195,7 +3202,7 @@ uint64_t helper_xsrsp(CPUPPCState *env, uint64_t xb)
     uint64_t xt = do_frsp(env, xb, GETPC());
 
     helper_compute_fprf_float64(env, xt);
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
     return xt;
 }
 
@@ -3355,7 +3362,7 @@ void helper_xsrqpi(CPUPPCState *env, uint32_t opcode,
     }
 
     helper_compute_fprf_float128(env, t.f128);
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
     *xt = t;
 }
 
@@ -3408,7 +3415,7 @@ void helper_xsrqpxp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode,
@@ -3434,7 +3441,7 @@ void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
@@ -3460,5 +3467,5 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
-- 
2.25.1


