Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3BA525632
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 22:02:56 +0200 (CEST)
Received: from localhost ([::1]:55184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npF1T-00024e-FN
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 16:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1npEia-00080I-Rk; Thu, 12 May 2022 15:43:24 -0400
Received: from [187.72.171.209] (port=25741 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1npEiX-0003R0-Kp; Thu, 12 May 2022 15:43:23 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 12 May 2022 16:43:05 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 947AE800177;
 Thu, 12 May 2022 16:43:05 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [RFC PATCH 1/2] target/ppc: Add invalid imz,
 isi and snan to do_float_check_status()
Date: Thu, 12 May 2022 16:42:49 -0300
Message-Id: <20220512194250.138244-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512194250.138244-1-victor.colombo@eldorado.org.br>
References: <20220512194250.138244-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2022 19:43:06.0027 (UTC)
 FILETIME=[80119FB0:01D86638]
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

Make do_float_check_status also handle some invalid exceptions:
imz, isi and snan.

The idea is to try to concentrate the handling of all fp exceptions in
do_float_check_status. For this RFC, move only the 3 exceptions stated
above.

I chose to create new '*_defer' helpers to propose a gradual transition
for the instructions helpers. The 'defer' comes from the idea that the
exception raising is defered to be called somewhere else, as oposed of
what is being done in the original, 'non-defered' functions, which
immediatly call raise_exception_err_ra().

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 143 +++++++++++++++++++++++++++-------------
 1 file changed, 97 insertions(+), 46 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 7209150d1a..988ddba282 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -225,6 +225,27 @@ static void finish_invalid_op_arith(CPUPPCState *env, int op,
     finish_invalid_op_excp(env, op, retaddr);
 }
 
+static void finish_invalid_op_arith_defer(CPUPPCState *env, int op,
+                                          bool set_fpcc)
+{
+    CPUState *cs;
+
+    /* Update the floating-point invalid operation summary */
+    env->fpscr |= FP_VX;
+    /* Update the floating-point exception summary */
+    env->fpscr |= FP_FX;
+    if (env->fpscr & FP_VE) {
+        /* Update the floating-point enabled exception summary */
+        env->fpscr |= FP_FEX;
+        cs = env_cpu(env);
+        cs->exception_index = POWERPC_EXCP_PROGRAM;
+        env->error_code = POWERPC_EXCP_FP | op;
+    } else if (set_fpcc) {
+        env->fpscr &= ~FP_FPCC;
+        env->fpscr |= (FP_C | FP_FU);
+    }
+}
+
 /* Signalling NaN */
 static void float_invalid_op_vxsnan(CPUPPCState *env, uintptr_t retaddr)
 {
@@ -232,6 +253,12 @@ static void float_invalid_op_vxsnan(CPUPPCState *env, uintptr_t retaddr)
     finish_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, retaddr);
 }
 
+static void float_invalid_op_vxsnan_defer(CPUPPCState *env)
+{
+    env->fpscr |= FP_VXSNAN;
+    finish_invalid_op_arith_defer(env, POWERPC_EXCP_FP_VXSNAN, false);
+}
+
 /* Magnitude subtraction of infinities */
 static void float_invalid_op_vxisi(CPUPPCState *env, bool set_fpcc,
                                    uintptr_t retaddr)
@@ -240,6 +267,12 @@ static void float_invalid_op_vxisi(CPUPPCState *env, bool set_fpcc,
     finish_invalid_op_arith(env, POWERPC_EXCP_FP_VXISI, set_fpcc, retaddr);
 }
 
+static void float_invalid_op_vxisi_defer(CPUPPCState *env, bool set_fpcc)
+{
+    env->fpscr |= FP_VXISI;
+    finish_invalid_op_arith_defer(env, POWERPC_EXCP_FP_VXISI, set_fpcc);
+}
+
 /* Division of infinity by infinity */
 static void float_invalid_op_vxidi(CPUPPCState *env, bool set_fpcc,
                                    uintptr_t retaddr)
@@ -264,6 +297,12 @@ static void float_invalid_op_vximz(CPUPPCState *env, bool set_fpcc,
     finish_invalid_op_arith(env, POWERPC_EXCP_FP_VXIMZ, set_fpcc, retaddr);
 }
 
+static void float_invalid_op_vximz_defer(CPUPPCState *env, bool set_fpcc)
+{
+    env->fpscr |= FP_VXIMZ;
+    finish_invalid_op_arith_defer(env, POWERPC_EXCP_FP_VXIMZ, set_fpcc);
+}
+
 /* Square root of a negative number */
 static void float_invalid_op_vxsqrt(CPUPPCState *env, bool set_fpcc,
                                     uintptr_t retaddr)
@@ -340,8 +379,6 @@ static inline int float_overflow_excp(CPUPPCState *env)
     bool overflow_enabled = !!(env->fpscr & FP_OE);
     if (overflow_enabled) {
         /* XXX: should adjust the result */
-        /* Update the floating-point enabled exception summary */
-        env->fpscr |= FP_FEX;
         /* We must update the target FPR before raising the exception */
         cs->exception_index = POWERPC_EXCP_PROGRAM;
         env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_OX;
@@ -359,8 +396,6 @@ static inline void float_underflow_excp(CPUPPCState *env)
     env->fpscr |= FP_FX;
     if (env->fpscr & FP_UE) {
         /* XXX: should adjust the result */
-        /* Update the floating-point enabled exception summary */
-        env->fpscr |= FP_FEX;
         /* We must update the target FPR before raising the exception */
         cs->exception_index = POWERPC_EXCP_PROGRAM;
         env->error_code = POWERPC_EXCP_FP | POWERPC_EXCP_FP_UX;
@@ -463,16 +498,30 @@ void helper_fpscr_check_status(CPUPPCState *env)
 }
 
 static void do_float_check_status(CPUPPCState *env, bool change_fi,
-                                  uintptr_t raddr)
+                                  bool set_fpcc, uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
     int status = get_float_exception_flags(&env->fp_status);
 
+    if (status & float_flag_invalid) {
+        if (status & float_flag_invalid_imz) {
+            float_invalid_op_vximz_defer(env, set_fpcc);
+        }
+        if (status & float_flag_invalid_isi) {
+            float_invalid_op_vxisi_defer(env, set_fpcc);
+        }
+        if (status & float_flag_invalid_snan) {
+            float_invalid_op_vxsnan_defer(env);
+        }
+    }
+
     if (status & float_flag_overflow) {
         status |= float_overflow_excp(env);
-    } else if (status & float_flag_underflow) {
+    }
+    if (status & float_flag_underflow) {
         float_underflow_excp(env);
     }
+
     if (status & float_flag_inexact) {
         float_inexact_excp(env);
     }
@@ -483,6 +532,8 @@ static void do_float_check_status(CPUPPCState *env, bool change_fi,
 
     if (cs->exception_index == POWERPC_EXCP_PROGRAM &&
         (env->error_code & POWERPC_EXCP_FP)) {
+        /* Update the floating-point enabled exception summary */
+        env->fpscr |= FP_FEX;
         /* Deferred floating-point exception after target FPR update */
         if (fp_exceptions_enabled(env)) {
             raise_exception_err_ra(env, cs->exception_index,
@@ -493,7 +544,7 @@ static void do_float_check_status(CPUPPCState *env, bool change_fi,
 
 void helper_float_check_status(CPUPPCState *env)
 {
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, true, GETPC());
 }
 
 void helper_reset_fpstatus(CPUPPCState *env)
@@ -687,7 +738,7 @@ uint64_t helper_##op(CPUPPCState *env, uint64_t arg)       \
     } else {                                               \
         farg.d = cvtr(arg, &env->fp_status);               \
     }                                                      \
-    do_float_check_status(env, true, GETPC());             \
+    do_float_check_status(env, true, false, GETPC());      \
     return farg.ll;                                        \
 }
 
@@ -713,7 +764,7 @@ static uint64_t do_fri(CPUPPCState *env, uint64_t arg,
 
     /* fri* does not set FPSCR[XX] */
     set_float_exception_flags(flags & ~float_flag_inexact, &env->fp_status);
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, false, GETPC());
 
     return arg;
 }
@@ -1724,7 +1775,7 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
         }                                                                    \
     }                                                                        \
     *xt = t;                                                                 \
-    do_float_check_status(env, sfifprf, GETPC());                            \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());                   \
 }
 
 VSX_ADD_SUB(xsadddp, add, 1, float64, VsrD(0), 1, 0)
@@ -1760,7 +1811,7 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opcode,
     helper_compute_fprf_float128(env, t.f128);
 
     *xt = t;
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, true, GETPC());
 }
 
 /*
@@ -1801,7 +1852,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                            \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, sfifprf, GETPC());                            \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());                   \
 }
 
 VSX_MUL(xsmuldp, 1, float64, VsrD(0), 1, 0)
@@ -1831,7 +1882,7 @@ void helper_xsmulqp(CPUPPCState *env, uint32_t opcode,
     helper_compute_fprf_float128(env, t.f128);
 
     *xt = t;
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, true, GETPC());
 }
 
 /*
@@ -1875,7 +1926,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, sfifprf, GETPC());                             \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());                    \
 }
 
 VSX_DIV(xsdivdp, 1, float64, VsrD(0), 1, 0)
@@ -1908,7 +1959,7 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, true, GETPC());
 }
 
 /*
@@ -1943,7 +1994,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, sfifprf, GETPC());                             \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());                    \
 }
 
 VSX_RE(xsredp, 1, float64, VsrD(0), 1, 0)
@@ -1988,7 +2039,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, sfifprf, GETPC());                            \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());                   \
 }
 
 VSX_SQRT(xssqrtdp, 1, float64, VsrD(0), 1, 0)
@@ -2032,7 +2083,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, sfifprf, GETPC());                            \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());                   \
 }
 
 VSX_RSQRTE(xsrsqrtedp, 1, float64, VsrD(0), 1, 0)
@@ -2185,7 +2236,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
         }                                                                     \
     }                                                                         \
     *xt = t;                                                                  \
-    do_float_check_status(env, sfifprf, GETPC());                             \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());                    \
 }
 
 VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1)
@@ -2237,7 +2288,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *s1, ppc_vsr_t *s2,\
                                                                                \
     helper_compute_fprf_float128(env, t.f128);                                 \
     *xt = t;                                                                   \
-    do_float_check_status(env, true, GETPC());                                 \
+    do_float_check_status(env, true, false, GETPC());                          \
 }
 
 VSX_MADDQ(XSMADDQP, MADD_FLGS, 0)
@@ -2286,7 +2337,7 @@ VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
                                                                               \
     memset(xt, 0, sizeof(*xt));                                               \
     memset(&xt->fld, -r, sizeof(xt->fld));                                    \
-    do_float_check_status(env, false, GETPC());                               \
+    do_float_check_status(env, false, false, GETPC());                        \
 }
 
 VSX_SCALAR_CMP(XSCMPEQDP, float64, eq, VsrD(0), 0)
@@ -2322,7 +2373,7 @@ void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[BF(opcode)] = cc;
 
-    do_float_check_status(env, false, GETPC());
+    do_float_check_status(env, false, false, GETPC());
 }
 
 void helper_xscmpexpqp(CPUPPCState *env, uint32_t opcode,
@@ -2351,7 +2402,7 @@ void helper_xscmpexpqp(CPUPPCState *env, uint32_t opcode,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[BF(opcode)] = cc;
 
-    do_float_check_status(env, false, GETPC());
+    do_float_check_status(env, false, false, GETPC());
 }
 
 static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
@@ -2404,7 +2455,7 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
         float_invalid_op_vxvc(env, 0, GETPC());
     }
 
-    do_float_check_status(env, false, GETPC());
+    do_float_check_status(env, false, false, GETPC());
 }
 
 void helper_xscmpodp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
@@ -2469,7 +2520,7 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
         float_invalid_op_vxvc(env, 0, GETPC());
     }
 
-    do_float_check_status(env, false, GETPC());
+    do_float_check_status(env, false, false, GETPC());
 }
 
 void helper_xscmpoqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
@@ -2508,7 +2559,7 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                           \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, false, GETPC());                               \
+    do_float_check_status(env, false, false, GETPC());                        \
 }
 
 VSX_MAX_MIN(xsmaxdp, maxnum, 1, float64, VsrD(0))
@@ -2691,7 +2742,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     }                                                              \
                                                                    \
     *xt = t;                                                       \
-    do_float_check_status(env, sfifprf, GETPC());                  \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());         \
 }
 
 VSX_CVT_FP_TO_FP(xscvspdp, 1, float32, float64, VsrW(0), VsrD(0), 1)
@@ -2717,7 +2768,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
     }                                                                 \
                                                                       \
     *xt = t;                                                          \
-    do_float_check_status(env, sfifprf, GETPC());                     \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());            \
 }
 
 VSX_CVT_FP_TO_FP2(xvcvdpsp, 2, float64, float32, 0)
@@ -2753,7 +2804,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, true, GETPC());                          \
+    do_float_check_status(env, true, sfprf, GETPC());                   \
 }
 
 VSX_CVT_FP_TO_FP_VECTOR(xscvdpqp, 1, float64, float128, VsrD(0), f128, 1)
@@ -2788,7 +2839,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     }                                                              \
                                                                    \
     *xt = t;                                                       \
-    do_float_check_status(env, sfifprf, GETPC());                  \
+    do_float_check_status(env, sfifprf, sfifprf, GETPC());         \
 }
 
 VSX_CVT_FP_TO_FP_HP(xscvdphp, 1, float64, float16, VsrD(0), VsrH(3), 1)
@@ -2813,7 +2864,7 @@ void helper_XVCVSPBF16(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
     }
 
     *xt = t;
-    do_float_check_status(env, false, GETPC());
+    do_float_check_status(env, false, false, GETPC());
 }
 
 void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
@@ -2836,7 +2887,7 @@ void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
     helper_compute_fprf_float64(env, t.VsrD(0));
 
     *xt = t;
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, false, GETPC());
 }
 
 uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
@@ -2914,7 +2965,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                                                              \
     *xt = t;                                                                 \
     env->fp_status.float_exception_flags = all_flags;                        \
-    do_float_check_status(env, sfi, GETPC());                                \
+    do_float_check_status(env, sfi, false, GETPC());                         \
 }
 
 VSX_CVT_FP_TO_INT(xscvdpsxds, 1, float64, int64, VsrD(0), VsrD(0), true, \
@@ -2947,7 +2998,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)               \
     }                                                                          \
                                                                                \
     *xt = t;                                                                   \
-    do_float_check_status(env, true, GETPC());                                 \
+    do_float_check_status(env, true, false, GETPC());                          \
 }
 
 VSX_CVT_FP_TO_INT128(XSCVQPUQZ, uint128, 0)
@@ -2984,7 +3035,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                                                              \
     *xt = t;                                                                 \
     env->fp_status.float_exception_flags = all_flags;                        \
-    do_float_check_status(env, sfi, GETPC());                                \
+    do_float_check_status(env, sfi, false, GETPC());                         \
 }
 
 VSX_CVT_FP_TO_INT2(xscvdpsxws, 1, float64, int32, true, 0x80000000U)
@@ -3015,7 +3066,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, true, GETPC());                               \
+    do_float_check_status(env, true, false, GETPC());                        \
 }
 
 VSX_CVT_FP_TO_INT_VECTOR(xscvqpsdz, float128, int64, f128, VsrD(0),          \
@@ -3054,7 +3105,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, sfifprf, GETPC());                       \
+    do_float_check_status(env, sfifprf, false, GETPC());                \
 }
 
 VSX_CVT_INT_TO_FP(xscvsxddp, 1, int64, float64, VsrD(0), VsrD(0), 1, 0)
@@ -3080,7 +3131,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, false, GETPC());                         \
+    do_float_check_status(env, false, false, GETPC());                  \
 }
 
 VSX_CVT_INT_TO_FP2(xvcvsxdsp, int64, float32)
@@ -3092,7 +3143,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)\
     helper_reset_fpstatus(env);                                 \
     xt->f128 = tp##_to_float128(xb->s128, &env->fp_status);     \
     helper_compute_fprf_float128(env, xt->f128);                \
-    do_float_check_status(env, true, GETPC());                  \
+    do_float_check_status(env, true, false, GETPC());           \
 }
 
 VSX_CVT_INT128_TO_FP(XSCVUQQP, uint128);
@@ -3116,7 +3167,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
     helper_compute_fprf_##ttp(env, t.tfld);                             \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, true, GETPC());                          \
+    do_float_check_status(env, true, false, GETPC());                   \
 }
 
 VSX_CVT_INT_TO_FP_VECTOR(xscvsdqp, int64, float128, VsrD(0), f128)
@@ -3174,7 +3225,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
     }                                                                  \
                                                                        \
     *xt = t;                                                           \
-    do_float_check_status(env, sfifprf, GETPC());                      \
+    do_float_check_status(env, sfifprf, false, GETPC());               \
 }
 
 VSX_ROUND(xsrdpi, 1, float64, VsrD(0), float_round_ties_away, 1)
@@ -3202,7 +3253,7 @@ uint64_t helper_xsrsp(CPUPPCState *env, uint64_t xb)
     uint64_t xt = do_frsp(env, xb, GETPC());
 
     helper_compute_fprf_float64(env, xt);
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, false, GETPC());
     return xt;
 }
 
@@ -3362,7 +3413,7 @@ void helper_xsrqpi(CPUPPCState *env, uint32_t opcode,
     }
 
     helper_compute_fprf_float128(env, t.f128);
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, false, GETPC());
     *xt = t;
 }
 
@@ -3415,7 +3466,7 @@ void helper_xsrqpxp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, false, GETPC());
 }
 
 void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode,
@@ -3441,7 +3492,7 @@ void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, true, GETPC());
 }
 
 void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
@@ -3467,5 +3518,5 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, true, GETPC());
+    do_float_check_status(env, true, true, GETPC());
 }
-- 
2.25.1


