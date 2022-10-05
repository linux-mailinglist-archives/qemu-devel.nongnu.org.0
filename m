Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ACB5F5713
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:04:15 +0200 (CEST)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og5wT-0005wW-Gg
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og5Xf-0005uI-B3; Wed, 05 Oct 2022 10:38:37 -0400
Received: from [200.168.210.66] (port=55228 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og5Xc-0004bx-4y; Wed, 05 Oct 2022 10:38:34 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 5 Oct 2022 11:37:23 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 012C08002A8;
 Wed,  5 Oct 2022 11:37:22 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [RFC PATCH 1/4] target/ppc: prepare instructions to work with caching
 last FP insn
Date: Wed,  5 Oct 2022 11:37:16 -0300
Message-Id: <20221005143719.65241-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
References: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Oct 2022 14:37:23.0721 (UTC)
 FILETIME=[FB835790:01D8D8C7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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

When enabling hardfpu for Power and adding the instruction caching
feature, it will be necessary to uncache when the instruction
is garanteed to be executed in softfloat. If the cache is not cleared
in this situation, it could lead to a previous instruction being
reexecuted and yield a different result than when only softfloat
was present.

This patch introduces the base code to allow for the implementation of
FP instructions caching, while also adding calls to a macro that clears
the cached instruction for every one that has not been 'migrated' to
hardfpu-compliance yet.

In the future, it will be necessary to implement the necessary code
for each FP instruction that wants to use hardfpu.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h                   |  6 +++
 target/ppc/excp_helper.c           |  2 +
 target/ppc/fpu_helper.c            | 65 ++++++++++++++++++++++++++++++
 target/ppc/helper.h                |  1 +
 target/ppc/translate/fp-impl.c.inc |  1 +
 5 files changed, 75 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 7f73e2ac81..1132d60162 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1080,6 +1080,10 @@ struct ppc_radix_page_info {
 #define PPC_CPU_OPCODES_LEN          0x40
 #define PPC_CPU_INDIRECT_OPCODES_LEN 0x20
 
+enum {
+    CACHED_FN_TYPE_NONE,
+};
+
 struct CPUArchState {
     /* Most commonly used resources during translated code execution first */
     target_ulong gpr[32];  /* general purpose registers */
@@ -1157,6 +1161,8 @@ struct CPUArchState {
     float_status fp_status; /* Floating point execution context */
     target_ulong fpscr;     /* Floating point status and control register */
 
+    int cached_fn_type;
+
     /* Internal devices resources */
     ppc_tb_t *tb_env;      /* Time base and decrementer */
     ppc_dcr_t *dcr_env;    /* Device control registers */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 214acf5ac4..4671b15386 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1904,6 +1904,8 @@ void raise_exception_err_ra(CPUPPCState *env, uint32_t exception,
 {
     CPUState *cs = env_cpu(env);
 
+    helper_execute_fp_cached(env);
+
     cs->exception_index = exception;
     env->error_code = error_code;
     cpu_loop_exit_restore(cs, raddr);
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index ae25f32d6e..6aaee37619 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -23,6 +23,13 @@
 #include "internal.h"
 #include "fpu/softfloat.h"
 
+#define CACHE_FN_NONE(env)                                                    \
+    do {                                                                      \
+        assert(!(env->fp_status.float_exception_flags &                       \
+                 float_flag_inexact));                                        \
+        env->cached_fn_type = CACHED_FN_TYPE_NONE;                            \
+    } while (0)
+
 static inline float128 float128_snan_to_qnan(float128 x)
 {
     float128 r;
@@ -514,6 +521,22 @@ void helper_reset_fpstatus(CPUPPCState *env)
     set_float_exception_flags(0, &env->fp_status);
 }
 
+void helper_execute_fp_cached(CPUPPCState *env)
+{
+    switch (env->cached_fn_type) {
+    case CACHED_FN_TYPE_NONE:
+        /*
+         * the last fp instruction was executed in softfloat
+         * so no need to execute it again
+         */
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    env->cached_fn_type = CACHED_FN_TYPE_NONE;
+}
+
 static void float_invalid_op_addsub(CPUPPCState *env, int flags,
                                     bool set_fpcc, uintptr_t retaddr)
 {
@@ -527,6 +550,7 @@ static void float_invalid_op_addsub(CPUPPCState *env, int flags,
 /* fadd - fadd. */
 float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64_add(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -540,6 +564,7 @@ float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
 /* fadds - fadds. */
 float64 helper_fadds(CPUPPCState *env, float64 arg1, float64 arg2)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64r32_add(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -552,6 +577,7 @@ float64 helper_fadds(CPUPPCState *env, float64 arg1, float64 arg2)
 /* fsub - fsub. */
 float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64_sub(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -565,6 +591,7 @@ float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
 /* fsubs - fsubs. */
 float64 helper_fsubs(CPUPPCState *env, float64 arg1, float64 arg2)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64r32_sub(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -587,6 +614,7 @@ static void float_invalid_op_mul(CPUPPCState *env, int flags,
 /* fmul - fmul. */
 float64 helper_fmul(CPUPPCState *env, float64 arg1, float64 arg2)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64_mul(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -600,6 +628,7 @@ float64 helper_fmul(CPUPPCState *env, float64 arg1, float64 arg2)
 /* fmuls - fmuls. */
 float64 helper_fmuls(CPUPPCState *env, float64 arg1, float64 arg2)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64r32_mul(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -624,6 +653,7 @@ static void float_invalid_op_div(CPUPPCState *env, int flags,
 /* fdiv - fdiv. */
 float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64_div(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -640,6 +670,7 @@ float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
 /* fdivs - fdivs. */
 float64 helper_fdivs(CPUPPCState *env, float64 arg1, float64 arg2)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64r32_div(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -672,6 +703,7 @@ static uint64_t float_invalid_cvt(CPUPPCState *env, int flags,
 #define FPU_FCTI(op, cvt, nanval)                                      \
 uint64_t helper_##op(CPUPPCState *env, float64 arg)                    \
 {                                                                      \
+    CACHE_FN_NONE(env);                                                \
     uint64_t ret = float64_to_##cvt(arg, &env->fp_status);             \
     int flags = get_float_exception_flags(&env->fp_status);            \
     if (unlikely(flags & float_flag_invalid)) {                        \
@@ -694,6 +726,8 @@ uint64_t helper_##op(CPUPPCState *env, uint64_t arg)       \
 {                                                          \
     CPU_DoubleU farg;                                      \
                                                            \
+    CACHE_FN_NONE(env);                                    \
+                                                           \
     if (is_single) {                                       \
         float32 tmp = cvtr(arg, &env->fp_status);          \
         farg.d = float32_to_float64(tmp, &env->fp_status); \
@@ -715,6 +749,8 @@ static uint64_t do_fri(CPUPPCState *env, uint64_t arg,
     FloatRoundMode old_rounding_mode = get_float_rounding_mode(&env->fp_status);
     int flags;
 
+    CACHE_FN_NONE(env);
+
     set_float_rounding_mode(rounding_mode, &env->fp_status);
     arg = float64_round_to_int(arg, &env->fp_status);
     set_float_rounding_mode(old_rounding_mode, &env->fp_status);
@@ -764,6 +800,7 @@ static void float_invalid_op_madd(CPUPPCState *env, int flags,
 static float64 do_fmadd(CPUPPCState *env, float64 a, float64 b,
                          float64 c, int madd_flags, uintptr_t retaddr)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64_muladd(a, b, c, madd_flags, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -776,6 +813,7 @@ static float64 do_fmadd(CPUPPCState *env, float64 a, float64 b,
 static uint64_t do_fmadds(CPUPPCState *env, float64 a, float64 b,
                           float64 c, int madd_flags, uintptr_t retaddr)
 {
+    CACHE_FN_NONE(env);
     float64 ret = float64r32_muladd(a, b, c, madd_flags, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -817,6 +855,7 @@ static uint64_t do_frsp(CPUPPCState *env, uint64_t arg, uintptr_t retaddr)
 
 uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
 {
+    CACHE_FN_NONE(env);
     return do_frsp(env, arg, GETPC());
 }
 
@@ -833,6 +872,7 @@ static void float_invalid_op_sqrt(CPUPPCState *env, int flags,
 #define FPU_FSQRT(name, op)                                                   \
 float64 helper_##name(CPUPPCState *env, float64 arg)                          \
 {                                                                             \
+    CACHE_FN_NONE(env);                                                       \
     float64 ret = op(arg, &env->fp_status);                                   \
     int flags = get_float_exception_flags(&env->fp_status);                   \
                                                                               \
@@ -849,6 +889,7 @@ FPU_FSQRT(FSQRTS, float64r32_sqrt)
 /* fre - fre. */
 float64 helper_fre(CPUPPCState *env, float64 arg)
 {
+    CACHE_FN_NONE(env);
     /* "Estimate" the reciprocal with actual division.  */
     float64 ret = float64_div(float64_one, arg, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
@@ -868,6 +909,7 @@ float64 helper_fre(CPUPPCState *env, float64 arg)
 /* fres - fres. */
 uint64_t helper_fres(CPUPPCState *env, uint64_t arg)
 {
+    CACHE_FN_NONE(env);
     /* "Estimate" the reciprocal with actual division.  */
     float64 ret = float64r32_div(float64_one, arg, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
@@ -887,6 +929,7 @@ uint64_t helper_fres(CPUPPCState *env, uint64_t arg)
 /* frsqrte  - frsqrte. */
 float64 helper_frsqrte(CPUPPCState *env, float64 arg)
 {
+    CACHE_FN_NONE(env);
     /* "Estimate" the reciprocal with actual division.  */
     float64 rets = float64_sqrt(arg, &env->fp_status);
     float64 retd = float64_div(float64_one, rets, &env->fp_status);
@@ -906,6 +949,7 @@ float64 helper_frsqrte(CPUPPCState *env, float64 arg)
 /* frsqrtes  - frsqrtes. */
 float64 helper_frsqrtes(CPUPPCState *env, float64 arg)
 {
+    CACHE_FN_NONE(env);
     /* "Estimate" the reciprocal with actual division.  */
     float64 rets = float64_sqrt(arg, &env->fp_status);
     float64 retd = float64r32_div(float64_one, rets, &env->fp_status);
@@ -1706,6 +1750,7 @@ void helper_##name(CPUPPCState *env, ppc_vsr_t *xt,                          \
     int i;                                                                   \
                                                                              \
     helper_reset_fpstatus(env);                                              \
+    CACHE_FN_NONE(env);                                                      \
                                                                              \
     for (i = 0; i < nels; i++) {                                             \
         float_status tstat = env->fp_status;                                 \
@@ -1746,6 +1791,7 @@ void helper_xsaddqp(CPUPPCState *env, uint32_t opcode,
     float_status tstat;
 
     helper_reset_fpstatus(env);
+    CACHE_FN_NONE(env);
 
     tstat = env->fp_status;
     if (unlikely(Rc(opcode) != 0)) {
@@ -1853,6 +1899,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                             \
     int i;                                                                    \
                                                                               \
     helper_reset_fpstatus(env);                                               \
+    CACHE_FN_NONE(env);                                                       \
                                                                               \
     for (i = 0; i < nels; i++) {                                              \
         float_status tstat = env->fp_status;                                  \
@@ -2684,6 +2731,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     int i;                                                         \
                                                                    \
     helper_reset_fpstatus(env);                                    \
+    CACHE_FN_NONE(env);                                            \
                                                                    \
     for (i = 0; i < nels; i++) {                                   \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);        \
@@ -2711,6 +2759,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
     int i;                                                            \
                                                                       \
     helper_reset_fpstatus(env);                                       \
+    CACHE_FN_NONE(env);                                               \
                                                                       \
     for (i = 0; i < nels; i++) {                                      \
         t.VsrW(2 * i) = stp##_to_##ttp(xb->VsrD(i), &env->fp_status); \
@@ -2750,6 +2799,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
     int i;                                                              \
                                                                         \
     helper_reset_fpstatus(env);                                         \
+    CACHE_FN_NONE(env);                                                 \
                                                                         \
     for (i = 0; i < nels; i++) {                                        \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);             \
@@ -2787,6 +2837,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     int i;                                                         \
                                                                    \
     helper_reset_fpstatus(env);                                    \
+    CACHE_FN_NONE(env);                                            \
                                                                    \
     for (i = 0; i < nels; i++) {                                   \
         t.tfld = stp##_to_##ttp(xb->sfld, 1, &env->fp_status);     \
@@ -2836,6 +2887,7 @@ void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
     float_status tstat;
 
     helper_reset_fpstatus(env);
+    CACHE_FN_NONE(env);
 
     tstat = env->fp_status;
     if (ro != 0) {
@@ -2862,6 +2914,8 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
     float_status tstat = env->fp_status;
     set_float_exception_flags(0, &tstat);
 
+    CACHE_FN_NONE(env);
+
     sign = extract64(xb, 63,  1);
     exp  = extract64(xb, 52, 11);
     frac = extract64(xb,  0, 52) | 0x10000000000000ULL;
@@ -2897,6 +2951,7 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
 
 uint64_t helper_XSCVSPDPN(uint64_t xb)
 {
+    /* TODO: missing env for CACHE_FN_NONE(env); */
     return helper_todouble(xb >> 32);
 }
 
@@ -2919,6 +2974,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                                                              \
     helper_reset_fpstatus(env);                                              \
                                                                              \
+    CACHE_FN_NONE(env);                                                      \
+                                                                             \
     for (i = 0; i < nels; i++) {                                             \
         t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);  \
         flags = env->fp_status.float_exception_flags;                        \
@@ -2953,6 +3010,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)               \
     int flags;                                                                 \
                                                                                \
     helper_reset_fpstatus(env);                                                \
+    CACHE_FN_NONE(env);                                                        \
     t.s128 = float128_to_##tp##_round_to_zero(xb->f128, &env->fp_status);      \
     flags = get_float_exception_flags(&env->fp_status);                        \
     if (unlikely(flags & float_flag_invalid)) {                                \
@@ -2984,6 +3042,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                                                              \
     helper_reset_fpstatus(env);                                              \
                                                                              \
+    CACHE_FN_NONE(env);                                                      \
+                                                                             \
     for (i = 0; i < nels; i++) {                                             \
         t.VsrW(2 * i) = stp##_to_##ttp##_round_to_zero(xb->VsrD(i),          \
                                                        &env->fp_status);     \
@@ -3021,6 +3081,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
     int flags;                                                               \
                                                                              \
     helper_reset_fpstatus(env);                                              \
+    CACHE_FN_NONE(env);                                                      \
                                                                              \
     t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);      \
     flags = get_float_exception_flags(&env->fp_status);                      \
@@ -3057,6 +3118,7 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
     int i;                                                              \
                                                                         \
     helper_reset_fpstatus(env);                                         \
+    CACHE_FN_NONE(env);                                                 \
                                                                         \
     for (i = 0; i < nels; i++) {                                        \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);             \
@@ -3105,6 +3167,7 @@ VSX_CVT_INT_TO_FP2(xvcvuxdsp, uint64, float32)
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)\
 {                                                               \
     helper_reset_fpstatus(env);                                 \
+    CACHE_FN_NONE(env);                                         \
     xt->f128 = tp##_to_float128(xb->s128, &env->fp_status);     \
     helper_compute_fprf_float128(env, xt->f128);                \
     do_float_check_status(env, true, GETPC());                  \
@@ -3128,6 +3191,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
     ppc_vsr_t t = *xt;                                                  \
                                                                         \
     helper_reset_fpstatus(env);                                         \
+    CACHE_FN_NONE(env);                                                 \
+                                                                        \
     t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);                 \
     helper_compute_fprf_##ttp(env, t.tfld);                             \
                                                                         \
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 57eee07256..88147b68a0 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -76,6 +76,7 @@ DEF_HELPER_FLAGS_2(brinc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_1(float_check_status, void, env)
 DEF_HELPER_1(fpscr_check_status, void, env)
 DEF_HELPER_1(reset_fpstatus, void, env)
+DEF_HELPER_1(execute_fp_cached, void, env)
 DEF_HELPER_2(compute_fprf_float64, void, env, i64)
 DEF_HELPER_3(store_fpscr, void, env, i64, i32)
 DEF_HELPER_2(fpscr_clrbit, void, env, i32)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 8d5cf0f982..10dbfb6edd 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -633,6 +633,7 @@ static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
     REQUIRE_FPU(ctx);
 
     gen_reset_fpstatus();
+    gen_helper_execute_fp_cached(cpu_env);
     fpscr = place_from_fpscr(a->rt, UINT64_MAX);
     if (a->rc) {
         gen_set_cr1_from_fpscr(ctx);
-- 
2.25.1


