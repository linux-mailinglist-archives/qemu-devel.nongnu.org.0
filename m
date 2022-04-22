Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6550C030
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:12:20 +0200 (CEST)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyhW-0005n5-5j
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyQt-0001rp-HT; Fri, 22 Apr 2022 14:55:07 -0400
Received: from [187.72.171.209] (port=52505 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyQr-0000CU-Aa; Fri, 22 Apr 2022 14:55:07 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:53 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A796F80060F;
 Fri, 22 Apr 2022 15:54:53 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 01/20] target/ppc: Remove fpscr_* macros from cpu.h
Date: Fri, 22 Apr 2022 15:54:31 -0300
Message-Id: <20220422185450.107256-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:53.0999 (UTC)
 FILETIME=[74062BF0:01D8567A]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fpscr_* defined macros are hiding the usage of *env behind them.
Substitute the usage of these macros with `env->fpscr & FP_*` to make
the code cleaner.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.c        |  2 +-
 target/ppc/cpu.h        | 29 -----------------------------
 target/ppc/fpu_helper.c | 28 ++++++++++++++--------------
 3 files changed, 15 insertions(+), 44 deletions(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index d7b42bae52..401b6f9e63 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -88,7 +88,7 @@ static inline void fpscr_set_rounding_mode(CPUPPCState *env)
     int rnd_type;
 
     /* Set rounding mode */
-    switch (fpscr_rn) {
+    switch (env->fpscr & FP_RN) {
     case 0:
         /* Best approximation (round to nearest) */
         rnd_type = float_round_nearest_even;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c2b6c987c0..ad31e51d69 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -713,41 +713,12 @@ enum {
 #define FPSCR_NI     2  /* Floating-point non-IEEE mode                      */
 #define FPSCR_RN1    1
 #define FPSCR_RN0    0  /* Floating-point rounding control                   */
-#define fpscr_drn    (((env->fpscr) & FP_DRN) >> FPSCR_DRN0)
-#define fpscr_fex    (((env->fpscr) >> FPSCR_FEX)    & 0x1)
-#define fpscr_vx     (((env->fpscr) >> FPSCR_VX)     & 0x1)
-#define fpscr_ox     (((env->fpscr) >> FPSCR_OX)     & 0x1)
-#define fpscr_ux     (((env->fpscr) >> FPSCR_UX)     & 0x1)
-#define fpscr_zx     (((env->fpscr) >> FPSCR_ZX)     & 0x1)
-#define fpscr_xx     (((env->fpscr) >> FPSCR_XX)     & 0x1)
-#define fpscr_vxsnan (((env->fpscr) >> FPSCR_VXSNAN) & 0x1)
-#define fpscr_vxisi  (((env->fpscr) >> FPSCR_VXISI)  & 0x1)
-#define fpscr_vxidi  (((env->fpscr) >> FPSCR_VXIDI)  & 0x1)
-#define fpscr_vxzdz  (((env->fpscr) >> FPSCR_VXZDZ)  & 0x1)
-#define fpscr_vximz  (((env->fpscr) >> FPSCR_VXIMZ)  & 0x1)
-#define fpscr_vxvc   (((env->fpscr) >> FPSCR_VXVC)   & 0x1)
-#define fpscr_fpcc   (((env->fpscr) >> FPSCR_FPCC)   & 0xF)
-#define fpscr_vxsoft (((env->fpscr) >> FPSCR_VXSOFT) & 0x1)
-#define fpscr_vxsqrt (((env->fpscr) >> FPSCR_VXSQRT) & 0x1)
-#define fpscr_vxcvi  (((env->fpscr) >> FPSCR_VXCVI)  & 0x1)
-#define fpscr_ve     (((env->fpscr) >> FPSCR_VE)     & 0x1)
-#define fpscr_oe     (((env->fpscr) >> FPSCR_OE)     & 0x1)
-#define fpscr_ue     (((env->fpscr) >> FPSCR_UE)     & 0x1)
-#define fpscr_ze     (((env->fpscr) >> FPSCR_ZE)     & 0x1)
-#define fpscr_xe     (((env->fpscr) >> FPSCR_XE)     & 0x1)
-#define fpscr_ni     (((env->fpscr) >> FPSCR_NI)     & 0x1)
-#define fpscr_rn     (((env->fpscr) >> FPSCR_RN0)    & 0x3)
 /* Invalid operation exception summary */
 #define FPSCR_IX     ((1 << FPSCR_VXSNAN) | (1 << FPSCR_VXISI)  | \
                       (1 << FPSCR_VXIDI)  | (1 << FPSCR_VXZDZ)  | \
                       (1 << FPSCR_VXIMZ)  | (1 << FPSCR_VXVC)   | \
                       (1 << FPSCR_VXSOFT) | (1 << FPSCR_VXSQRT) | \
                       (1 << FPSCR_VXCVI))
-/* exception summary */
-#define fpscr_ex  (((env->fpscr) >> FPSCR_XX) & 0x1F)
-/* enabled exception summary */
-#define fpscr_eex (((env->fpscr) >> FPSCR_XX) & ((env->fpscr) >> FPSCR_XE) &  \
-                   0x1F)
 
 #define FP_DRN2         (1ull << FPSCR_DRN2)
 #define FP_DRN1         (1ull << FPSCR_DRN1)
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 99281cc37a..f6c8318a71 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -202,7 +202,7 @@ static void finish_invalid_op_excp(CPUPPCState *env, int op, uintptr_t retaddr)
     env->fpscr |= FP_VX;
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
-    if (fpscr_ve != 0) {
+    if (env->fpscr & FP_VE) {
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
         if (fp_exceptions_enabled(env)) {
@@ -216,7 +216,7 @@ static void finish_invalid_op_arith(CPUPPCState *env, int op,
                                     bool set_fpcc, uintptr_t retaddr)
 {
     env->fpscr &= ~(FP_FR | FP_FI);
-    if (fpscr_ve == 0) {
+    if (!(env->fpscr & FP_VE)) {
         if (set_fpcc) {
             env->fpscr &= ~FP_FPCC;
             env->fpscr |= (FP_C | FP_FU);
@@ -286,7 +286,7 @@ static void float_invalid_op_vxvc(CPUPPCState *env, bool set_fpcc,
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
     /* We must update the target FPR before raising the exception */
-    if (fpscr_ve != 0) {
+    if (env->fpscr & FP_VE) {
         CPUState *cs = env_cpu(env);
 
         cs->exception_index = POWERPC_EXCP_PROGRAM;
@@ -303,7 +303,7 @@ static void float_invalid_op_vxcvi(CPUPPCState *env, bool set_fpcc,
 {
     env->fpscr |= FP_VXCVI;
     env->fpscr &= ~(FP_FR | FP_FI);
-    if (fpscr_ve == 0) {
+    if (!(env->fpscr & FP_VE)) {
         if (set_fpcc) {
             env->fpscr &= ~FP_FPCC;
             env->fpscr |= (FP_C | FP_FU);
@@ -318,7 +318,7 @@ static inline void float_zero_divide_excp(CPUPPCState *env, uintptr_t raddr)
     env->fpscr &= ~(FP_FR | FP_FI);
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
-    if (fpscr_ze != 0) {
+    if (env->fpscr & FP_ZE) {
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
         if (fp_exceptions_enabled(env)) {
@@ -336,7 +336,7 @@ static inline void float_overflow_excp(CPUPPCState *env)
     env->fpscr |= FP_OX;
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
-    if (fpscr_oe != 0) {
+    if (env->fpscr & FP_OE) {
         /* XXX: should adjust the result */
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
@@ -356,7 +356,7 @@ static inline void float_underflow_excp(CPUPPCState *env)
     env->fpscr |= FP_UX;
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
-    if (fpscr_ue != 0) {
+    if (env->fpscr & FP_UE) {
         /* XXX: should adjust the result */
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
@@ -374,7 +374,7 @@ static inline void float_inexact_excp(CPUPPCState *env)
     env->fpscr |= FP_XX;
     /* Update the floating-point exception summary */
     env->fpscr |= FP_FX;
-    if (fpscr_xe != 0) {
+    if (env->fpscr & FP_XE) {
         /* Update the floating-point enabled exception summary */
         env->fpscr |= FP_FEX;
         /* We must update the target FPR before raising the exception */
@@ -2274,7 +2274,7 @@ VSX_MADDQ(XSNMSUBQPO, NMSUB_FLGS, 0)
         vxvc = svxvc;                                                         \
         if (flags & float_flag_invalid_snan) {                                \
             float_invalid_op_vxsnan(env, GETPC());                            \
-            vxvc &= fpscr_ve == 0;                                            \
+            vxvc &= !(env->fpscr & FP_VE);                                    \
         }                                                                     \
         if (vxvc) {                                                           \
             float_invalid_op_vxvc(env, 0, GETPC());                           \
@@ -2375,7 +2375,7 @@ static inline void do_scalar_cmp(CPUPPCState *env, ppc_vsr_t *xa, ppc_vsr_t *xb,
         if (float64_is_signaling_nan(xa->VsrD(0), &env->fp_status) ||
             float64_is_signaling_nan(xb->VsrD(0), &env->fp_status)) {
             vxsnan_flag = true;
-            if (fpscr_ve == 0 && ordered) {
+            if (!(env->fpscr & FP_VE) && ordered) {
                 vxvc_flag = true;
             }
         } else if (float64_is_quiet_nan(xa->VsrD(0), &env->fp_status) ||
@@ -2440,7 +2440,7 @@ static inline void do_scalar_cmpq(CPUPPCState *env, ppc_vsr_t *xa,
         if (float128_is_signaling_nan(xa->f128, &env->fp_status) ||
             float128_is_signaling_nan(xb->f128, &env->fp_status)) {
             vxsnan_flag = true;
-            if (fpscr_ve == 0 && ordered) {
+            if (!(env->fpscr & FP_VE) && ordered) {
                 vxvc_flag = true;
             }
         } else if (float128_is_quiet_nan(xa->f128, &env->fp_status) ||
@@ -2590,7 +2590,7 @@ void helper_##name(CPUPPCState *env,                                          \
         t.VsrD(0) = xb->VsrD(0);                                              \
     }                                                                         \
                                                                               \
-    vex_flag = fpscr_ve & vxsnan_flag;                                        \
+    vex_flag = (env->fpscr & FP_VE) && vxsnan_flag;                           \
     if (vxsnan_flag) {                                                        \
         float_invalid_op_vxsnan(env, GETPC());                                \
     }                                                                         \
@@ -3320,7 +3320,7 @@ void helper_xsrqpi(CPUPPCState *env, uint32_t opcode,
     if (r == 0 && rmc == 0) {
         rmode = float_round_ties_away;
     } else if (r == 0 && rmc == 0x3) {
-        rmode = fpscr_rn;
+        rmode = env->fpscr & FP_RN;
     } else if (r == 1) {
         switch (rmc) {
         case 0:
@@ -3374,7 +3374,7 @@ void helper_xsrqpxp(CPUPPCState *env, uint32_t opcode,
     if (r == 0 && rmc == 0) {
         rmode = float_round_ties_away;
     } else if (r == 0 && rmc == 0x3) {
-        rmode = fpscr_rn;
+        rmode = env->fpscr & FP_RN;
     } else if (r == 1) {
         switch (rmc) {
         case 0:
-- 
2.25.1


