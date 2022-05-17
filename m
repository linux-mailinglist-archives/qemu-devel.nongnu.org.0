Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D2B52A7E3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:28:26 +0200 (CEST)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr03c-0001Q4-Qm
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nqzrF-0001I5-Km; Tue, 17 May 2022 12:15:39 -0400
Received: from [187.72.171.209] (port=62953 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nqzrC-0001KH-SZ; Tue, 17 May 2022 12:15:37 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 13:15:26 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B150F800603;
 Tue, 17 May 2022 13:15:26 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, rashmica.g@gmail.com,
 victor.colombo@eldorado.org.br
Subject: [PATCH v3 1/3] target/ppc: Fix FPSCR.FI bit being cleared when it
 shouldn't
Date: Tue, 17 May 2022 13:15:20 -0300
Message-Id: <20220517161522.36132-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517161522.36132-1-victor.colombo@eldorado.org.br>
References: <20220517161522.36132-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 16:15:26.0999 (UTC)
 FILETIME=[51F99270:01D86A09]
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

According to Power ISA, the FI bit in FPSCR is non-sticky.
This means that if an instruction is said to modify the FI bit, then
it should be set or cleared depending on the result of the
instruction. Otherwise, it should be kept as was before.

However, the following inconsistency was found when comparing results
from the hardware (tested on both a Power 9 processor and in
Power 10 Mambo):

(FI bit is set before the execution of the instruction)
Hardware: xscmpeqdp(0xff..ff, 0xff..ff) = FI: SET -> SET
QEMU: xscmpeqdp(0xff..ff, 0xff..ff) = FI: SET -> CLEARED

As the FI bit is non-sticky, and xscmpeqdp does not list it as a field
that is changed by the instruction, it should not be changed after its
execution.
This is happening to multiple instructions in the vsx implementations.

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
Some macro helpers are responsible for both instructions that change
and instructions that aren't suposed to change FI. This seems to always
overlap with the sfprf flag. So, reuse this flag for this purpose when
applicable.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

v3: Rewrite commit message to make it more clear
---
 target/ppc/cpu.h        |   2 +
 target/ppc/fpu_helper.c | 122 +++++++++++++++++++++-------------------
 2 files changed, 66 insertions(+), 58 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 48596cfb25..901ded79e9 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -735,6 +735,8 @@ enum {
                       (1 << FPSCR_VXSOFT) | (1 << FPSCR_VXSQRT) | \
                       (1 << FPSCR_VXCVI))
 
+FIELD(FPSCR, FI, FPSCR_FI, 1)
+
 #define FP_DRN2         (1ull << FPSCR_DRN2)
 #define FP_DRN1         (1ull << FPSCR_DRN1)
 #define FP_DRN0         (1ull << FPSCR_DRN0)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index f6c8318a71..f1ea4aa10e 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -370,7 +370,6 @@ static inline void float_inexact_excp(CPUPPCState *env)
 {
     CPUState *cs = env_cpu(env);
 
-    env->fpscr |= FP_FI;
     env->fpscr |= FP_XX;
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
@@ -462,7 +461,8 @@ void helper_fpscr_check_status(CPUPPCState *env)
     }
 }
 
-static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
+static void do_float_check_status(CPUPPCState *env, bool change_fi,
+                                  uintptr_t raddr)
 {
     CPUState *cs = env_cpu(env);
     int status = get_float_exception_flags(&env->fp_status);
@@ -474,8 +474,10 @@ static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
     }
     if (status & float_flag_inexact) {
         float_inexact_excp(env);
-    } else {
-        env->fpscr &= ~FP_FI; /* clear the FPSCR[FI] bit */
+    }
+    if (change_fi) {
+        env->fpscr = FIELD_DP64(env->fpscr, FPSCR, FI,
+                                !!(status & float_flag_inexact));
     }
 
     if (cs->exception_index == POWERPC_EXCP_PROGRAM &&
@@ -490,7 +492,7 @@ static void do_float_check_status(CPUPPCState *env, uintptr_t raddr)
 
 void helper_float_check_status(CPUPPCState *env)
 {
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 void helper_reset_fpstatus(CPUPPCState *env)
@@ -684,7 +686,7 @@ uint64_t helper_##op(CPUPPCState *env, uint64_t arg)       \
     } else {                                               \
         farg.d = cvtr(arg, &env->fp_status);               \
     }                                                      \
-    do_float_check_status(env, GETPC());                   \
+    do_float_check_status(env, true, GETPC());             \
     return farg.ll;                                        \
 }
 
@@ -710,7 +712,7 @@ static uint64_t do_fri(CPUPPCState *env, uint64_t arg,
 
     /* fri* does not set FPSCR[XX] */
     set_float_exception_flags(flags & ~float_flag_inexact, &env->fp_status);
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 
     return arg;
 }
@@ -1721,7 +1723,7 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
         }                                                                    \
     }                                                                        \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfprf, GETPC());                              \
 }
 
 VSX_ADD_SUB(xsadddp, add, 1, float64, VsrD(0), 1, 0)
@@ -1757,7 +1759,7 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opcode,
     helper_compute_fprf_float128(env, t.f128);
 
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 /*
@@ -1798,7 +1800,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                            \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfprf, GETPC());                              \
 }
 
 VSX_MUL(xsmuldp, 1, float64, VsrD(0), 1, 0)
@@ -1828,7 +1830,7 @@ void helper_xsmulqp(CPUPPCState *env, uint32_t opcode,
     helper_compute_fprf_float128(env, t.f128);
 
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 /*
@@ -1872,7 +1874,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, sfprf, GETPC());                               \
 }
 
 VSX_DIV(xsdivdp, 1, float64, VsrD(0), 1, 0)
@@ -1905,7 +1907,7 @@ void helper_xsdivqp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 /*
@@ -1940,7 +1942,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)              \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, sfprf, GETPC());                               \
 }
 
 VSX_RE(xsredp, 1, float64, VsrD(0), 1, 0)
@@ -1985,7 +1987,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfprf, GETPC());                              \
 }
 
 VSX_SQRT(xssqrtdp, 1, float64, VsrD(0), 1, 0)
@@ -2029,7 +2031,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfprf, GETPC());                              \
 }
 
 VSX_RSQRTE(xsrsqrtedp, 1, float64, VsrD(0), 1, 0)
@@ -2182,7 +2184,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
         }                                                                     \
     }                                                                         \
     *xt = t;                                                                  \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, sfprf, GETPC());                               \
 }
 
 VSX_MADD(XSMADDDP, 1, float64, VsrD(0), MADD_FLGS, 1)
@@ -2234,7 +2236,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *s1, ppc_vsr_t *s2,\
                                                                                \
     helper_compute_fprf_float128(env, t.f128);                                 \
     *xt = t;                                                                   \
-    do_float_check_status(env, GETPC());                                       \
+    do_float_check_status(env, true, GETPC());                                 \
 }
 
 VSX_MADDQ(XSMADDQP, MADD_FLGS, 0)
@@ -2283,7 +2285,7 @@ VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
                                                                               \
     memset(xt, 0, sizeof(*xt));                                               \
     memset(&xt->fld, -r, sizeof(xt->fld));                                    \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, false, GETPC());                               \
 }
 
 VSX_SCALAR_CMP(XSCMPEQDP, float64, eq, VsrD(0), 0)
@@ -2319,7 +2321,7 @@ void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[BF(opcode)] = cc;
 
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 void helper_xscmpexpqp(CPUPPCState *env, uint32_t opcode,
@@ -2348,7 +2350,7 @@ void helper_xscmpexpqp(CPUPPCState *env, uint32_t opcode,
     env->fpscr |= cc << FPSCR_FPCC;
     env->crf[BF(opcode)] = cc;
 
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
@@ -2401,7 +2403,7 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
         float_invalid_op_vxvc(env, 0, GETPC());
     }
 
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 void helper_xscmpodp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
@@ -2466,7 +2468,7 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
         float_invalid_op_vxvc(env, 0, GETPC());
     }
 
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 void helper_xscmpoqp(CPUPPCState *env, uint32_t opcode, ppc_vsr_t *xa,
@@ -2505,7 +2507,7 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                           \
     }                                                                         \
                                                                               \
     *xt = t;                                                                  \
-    do_float_check_status(env, GETPC());                                      \
+    do_float_check_status(env, false, GETPC());                               \
 }
 
 VSX_MAX_MIN(xsmaxdp, maxnum, 1, float64, VsrD(0))
@@ -2688,7 +2690,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     }                                                              \
                                                                    \
     *xt = t;                                                       \
-    do_float_check_status(env, GETPC());                           \
+    do_float_check_status(env, sfprf, GETPC());                    \
 }
 
 VSX_CVT_FP_TO_FP(xscvspdp, 1, float32, float64, VsrW(0), VsrD(0), 1)
@@ -2714,7 +2716,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
     }                                                                 \
                                                                       \
     *xt = t;                                                          \
-    do_float_check_status(env, GETPC());                              \
+    do_float_check_status(env, sfprf, GETPC());                       \
 }
 
 VSX_CVT_FP_TO_FP2(xvcvdpsp, 2, float64, float32, 0)
@@ -2750,7 +2752,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                       \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, GETPC());                                \
+    do_float_check_status(env, true, GETPC());                          \
 }
 
 VSX_CVT_FP_TO_FP_VECTOR(xscvdpqp, 1, float64, float128, VsrD(0), f128, 1)
@@ -2785,7 +2787,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     }                                                              \
                                                                    \
     *xt = t;                                                       \
-    do_float_check_status(env, GETPC());                           \
+    do_float_check_status(env, sfprf, GETPC());                    \
 }
 
 VSX_CVT_FP_TO_FP_HP(xscvdphp, 1, float64, float16, VsrD(0), VsrH(3), 1)
@@ -2810,7 +2812,7 @@ void helper_XVCVSPBF16(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)
     }
 
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, false, GETPC());
 }
 
 void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
@@ -2833,7 +2835,7 @@ void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
     helper_compute_fprf_float64(env, t.VsrD(0));
 
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
@@ -2889,9 +2891,10 @@ uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
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
@@ -2910,20 +2913,23 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                                                              \
     *xt = t;                                                                 \
     env->fp_status.float_exception_flags = all_flags;                        \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, sfi, GETPC());                                \
 }
 
-VSX_CVT_FP_TO_INT(xscvdpsxds, 1, float64, int64, VsrD(0), VsrD(0), \
+VSX_CVT_FP_TO_INT(xscvdpsxds, 1, float64, int64, VsrD(0), VsrD(0), true, \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xscvdpuxds, 1, float64, uint64, VsrD(0), VsrD(0), 0ULL)
-VSX_CVT_FP_TO_INT(xvcvdpsxds, 2, float64, int64, VsrD(i), VsrD(i), \
+VSX_CVT_FP_TO_INT(xscvdpuxds, 1, float64, uint64, VsrD(0), VsrD(0), true, 0ULL)
+VSX_CVT_FP_TO_INT(xvcvdpsxds, 2, float64, int64, VsrD(i), VsrD(i), false, \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xvcvdpuxds, 2, float64, uint64, VsrD(i), VsrD(i), 0ULL)
-VSX_CVT_FP_TO_INT(xvcvspsxds, 2, float32, int64, VsrW(2 * i), VsrD(i), \
+VSX_CVT_FP_TO_INT(xvcvdpuxds, 2, float64, uint64, VsrD(i), VsrD(i), false, \
+                  0ULL)
+VSX_CVT_FP_TO_INT(xvcvspsxds, 2, float32, int64, VsrW(2 * i), VsrD(i), false, \
                   0x8000000000000000ULL)
-VSX_CVT_FP_TO_INT(xvcvspsxws, 4, float32, int32, VsrW(i), VsrW(i), 0x80000000U)
-VSX_CVT_FP_TO_INT(xvcvspuxds, 2, float32, uint64, VsrW(2 * i), VsrD(i), 0ULL)
-VSX_CVT_FP_TO_INT(xvcvspuxws, 4, float32, uint32, VsrW(i), VsrW(i), 0U)
+VSX_CVT_FP_TO_INT(xvcvspsxws, 4, float32, int32, VsrW(i), VsrW(i), false, \
+                  0x80000000ULL)
+VSX_CVT_FP_TO_INT(xvcvspuxds, 2, float32, uint64, VsrW(2 * i), VsrD(i), \
+                  false, 0ULL)
+VSX_CVT_FP_TO_INT(xvcvspuxws, 4, float32, uint32, VsrW(i), VsrW(i), false, 0U)
 
 #define VSX_CVT_FP_TO_INT128(op, tp, rnan)                                     \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)               \
@@ -2940,7 +2946,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)               \
     }                                                                          \
                                                                                \
     *xt = t;                                                                   \
-    do_float_check_status(env, GETPC());                                       \
+    do_float_check_status(env, true, GETPC());                                 \
 }
 
 VSX_CVT_FP_TO_INT128(XSCVQPUQZ, uint128, 0)
@@ -2955,7 +2961,7 @@ VSX_CVT_FP_TO_INT128(XSCVQPSQZ, int128, 0x8000000000000000ULL);
  *     words 0 and 1 (and words 2 and 3) of the result register, as
  *     is required by this version of the architecture.
  */
-#define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, rnan)                         \
+#define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, sfi, rnan)                    \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
     int all_flags = env->fp_status.float_exception_flags, flags;             \
@@ -2977,13 +2983,13 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
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
+VSX_CVT_FP_TO_INT2(xscvdpsxws, 1, float64, int32, true, 0x80000000U)
+VSX_CVT_FP_TO_INT2(xscvdpuxws, 1, float64, uint32, true, 0U)
+VSX_CVT_FP_TO_INT2(xvcvdpsxws, 2, float64, int32, false, 0x80000000U)
+VSX_CVT_FP_TO_INT2(xvcvdpuxws, 2, float64, uint32, false, 0U)
 
 /*
  * VSX_CVT_FP_TO_INT_VECTOR - VSX floating point to integer conversion
@@ -3008,7 +3014,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    do_float_check_status(env, GETPC());                                     \
+    do_float_check_status(env, true, GETPC());                               \
 }
 
 VSX_CVT_FP_TO_INT_VECTOR(xscvqpsdz, float128, int64, f128, VsrD(0),          \
@@ -3047,7 +3053,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, GETPC());                                \
+    do_float_check_status(env, sfprf, GETPC());                         \
 }
 
 VSX_CVT_INT_TO_FP(xscvsxddp, 1, int64, float64, VsrD(0), VsrD(0), 1, 0)
@@ -3073,7 +3079,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
     }                                                                   \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, GETPC());                                \
+    do_float_check_status(env, false, GETPC());                         \
 }
 
 VSX_CVT_INT_TO_FP2(xvcvsxdsp, int64, float32)
@@ -3085,7 +3091,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)\
     helper_reset_fpstatus(env);                                 \
     xt->f128 = tp##_to_float128(xb->s128, &env->fp_status);     \
     helper_compute_fprf_float128(env, xt->f128);                \
-    do_float_check_status(env, GETPC());                        \
+    do_float_check_status(env, true, GETPC());                  \
 }
 
 VSX_CVT_INT128_TO_FP(XSCVUQQP, uint128);
@@ -3109,7 +3115,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
     helper_compute_fprf_##ttp(env, t.tfld);                             \
                                                                         \
     *xt = t;                                                            \
-    do_float_check_status(env, GETPC());                                \
+    do_float_check_status(env, true, GETPC());                          \
 }
 
 VSX_CVT_INT_TO_FP_VECTOR(xscvsdqp, int64, float128, VsrD(0), f128)
@@ -3167,7 +3173,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
     }                                                                  \
                                                                        \
     *xt = t;                                                           \
-    do_float_check_status(env, GETPC());                               \
+    do_float_check_status(env, sfprf, GETPC());                        \
 }
 
 VSX_ROUND(xsrdpi, 1, float64, VsrD(0), float_round_ties_away, 1)
@@ -3195,7 +3201,7 @@ uint64_t helper_xsrsp(CPUPPCState *env, uint64_t xb)
     uint64_t xt = do_frsp(env, xb, GETPC());
 
     helper_compute_fprf_float64(env, xt);
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
     return xt;
 }
 
@@ -3355,7 +3361,7 @@ void helper_xsrqpi(CPUPPCState *env, uint32_t opcode,
     }
 
     helper_compute_fprf_float128(env, t.f128);
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
     *xt = t;
 }
 
@@ -3408,7 +3414,7 @@ void helper_xsrqpxp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode,
@@ -3434,7 +3440,7 @@ void helper_xssqrtqp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
 
 void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
@@ -3460,5 +3466,5 @@ void helper_xssubqp(CPUPPCState *env, uint32_t opcode,
 
     helper_compute_fprf_float128(env, t.f128);
     *xt = t;
-    do_float_check_status(env, GETPC());
+    do_float_check_status(env, true, GETPC());
 }
-- 
2.25.1


