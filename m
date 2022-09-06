Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7735AE9FA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:37:55 +0200 (CEST)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYm1-00060L-Br
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVY8j-0002DC-Nl; Tue, 06 Sep 2022 08:57:18 -0400
Received: from [200.168.210.66] (port=14617 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVY8h-0002Pq-JY; Tue, 06 Sep 2022 08:57:17 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 6 Sep 2022 09:55:38 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 4DD17800476;
 Tue,  6 Sep 2022 09:55:38 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH v2 8/8] target/ppc: Clear fpstatus flags on helpers missing it
Date: Tue,  6 Sep 2022 09:55:23 -0300
Message-Id: <20220906125523.38765-9-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
References: <20220906125523.38765-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Sep 2022 12:55:38.0772 (UTC)
 FILETIME=[F6B34D40:01D8C1EF]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In ppc emulation, exception flags are not cleared at the end of an
instruction. Instead, the next instruction is responsible to clear
it before its emulation. However, some helpers are not doing it,
causing an issue where the previously set exception flags are being
used and leading to incorrect values being set in FPSCR.
Fix this by clearing fp_status before doing the instruction 'real' work
for the following helpers that were missing this behavior:

- VSX_CVT_INT_TO_FP_VECTOR
- VSX_CVT_FP_TO_FP
- VSX_CVT_FP_TO_INT_VECTOR
- VSX_CVT_FP_TO_INT2
- VSX_CVT_FP_TO_INT
- VSX_CVT_FP_TO_FP_HP
- VSX_CVT_FP_TO_FP_VECTOR
- VSX_CMP
- VSX_ROUND
- xscvqpdp
- xscvdpsp[n]

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/fpu_helper.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 95b22d99b3..331361234f 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2637,6 +2637,8 @@ uint32_t helper_##op(CPUPPCState *env, ppc_vsr_t *xt,                     \
     int all_true = 1;                                                     \
     int all_false = 1;                                                    \
                                                                           \
+    helper_reset_fpstatus(env);                                           \
+                                                                          \
     for (i = 0; i < nels; i++) {                                          \
         if (unlikely(tp##_is_any_nan(xa->fld) ||                          \
                      tp##_is_any_nan(xb->fld))) {                         \
@@ -2690,6 +2692,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     ppc_vsr_t t = { };                                             \
     int i;                                                         \
                                                                    \
+    helper_reset_fpstatus(env);                                    \
+                                                                   \
     for (i = 0; i < nels; i++) {                                   \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);        \
         if (unlikely(stp##_is_signaling_nan(xb->sfld,              \
@@ -2715,6 +2719,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)      \
     ppc_vsr_t t = { };                                                \
     int i;                                                            \
                                                                       \
+    helper_reset_fpstatus(env);                                       \
+                                                                      \
     for (i = 0; i < nels; i++) {                                      \
         t.VsrW(2 * i) = stp##_to_##ttp(xb->VsrD(i), &env->fp_status); \
         if (unlikely(stp##_is_signaling_nan(xb->VsrD(i),              \
@@ -2752,6 +2758,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
     ppc_vsr_t t = *xt;                                                  \
     int i;                                                              \
                                                                         \
+    helper_reset_fpstatus(env);                                         \
+                                                                        \
     for (i = 0; i < nels; i++) {                                        \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);             \
         if (unlikely(stp##_is_signaling_nan(xb->sfld,                   \
@@ -2787,6 +2795,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)   \
     ppc_vsr_t t = { };                                             \
     int i;                                                         \
                                                                    \
+    helper_reset_fpstatus(env);                                    \
+                                                                   \
     for (i = 0; i < nels; i++) {                                   \
         t.tfld = stp##_to_##ttp(xb->sfld, 1, &env->fp_status);     \
         if (unlikely(stp##_is_signaling_nan(xb->sfld,              \
@@ -2834,6 +2844,8 @@ void helper_XSCVQPDP(CPUPPCState *env, uint32_t ro, ppc_vsr_t *xt,
     ppc_vsr_t t = { };
     float_status tstat;
 
+    helper_reset_fpstatus(env);
+
     tstat = env->fp_status;
     if (ro != 0) {
         tstat.float_rounding_mode = float_round_to_odd;
@@ -2855,6 +2867,7 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
 {
     uint64_t result, sign, exp, frac;
 
+    helper_reset_fpstatus(env);
     float_status tstat = env->fp_status;
     set_float_exception_flags(0, &tstat);
 
@@ -2910,22 +2923,20 @@ uint64_t helper_XSCVSPDPN(uint64_t xb)
 #define VSX_CVT_FP_TO_INT(op, nels, stp, ttp, sfld, tfld, sfi, rnan)         \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
-    int all_flags = env->fp_status.float_exception_flags, flags;             \
     ppc_vsr_t t = { };                                                       \
-    int i;                                                                   \
+    int i, flags;                                                            \
+                                                                             \
+    helper_reset_fpstatus(env);                                              \
                                                                              \
     for (i = 0; i < nels; i++) {                                             \
-        env->fp_status.float_exception_flags = 0;                            \
         t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);  \
         flags = env->fp_status.float_exception_flags;                        \
         if (unlikely(flags & float_flag_invalid)) {                          \
             t.tfld = float_invalid_cvt(env, flags, t.tfld, rnan, 0, GETPC());\
         }                                                                    \
-        all_flags |= flags;                                                  \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    env->fp_status.float_exception_flags = all_flags;                        \
     do_float_check_status(env, sfi, GETPC());                                \
 }
 
@@ -2977,12 +2988,12 @@ VSX_CVT_FP_TO_INT128(XSCVQPSQZ, int128, 0x8000000000000000ULL);
 #define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, sfi, rnan)                    \
 void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
 {                                                                            \
-    int all_flags = env->fp_status.float_exception_flags, flags;             \
     ppc_vsr_t t = { };                                                       \
-    int i;                                                                   \
+    int i, flags;                                                            \
+                                                                             \
+    helper_reset_fpstatus(env);                                              \
                                                                              \
     for (i = 0; i < nels; i++) {                                             \
-        env->fp_status.float_exception_flags = 0;                            \
         t.VsrW(2 * i) = stp##_to_##ttp##_round_to_zero(xb->VsrD(i),          \
                                                        &env->fp_status);     \
         flags = env->fp_status.float_exception_flags;                        \
@@ -2991,11 +3002,9 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
                                               rnan, 0, GETPC());             \
         }                                                                    \
         t.VsrW(2 * i + 1) = t.VsrW(2 * i);                                   \
-        all_flags |= flags;                                                  \
     }                                                                        \
                                                                              \
     *xt = t;                                                                 \
-    env->fp_status.float_exception_flags = all_flags;                        \
     do_float_check_status(env, sfi, GETPC());                                \
 }
 
@@ -3020,6 +3029,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
     ppc_vsr_t t = { };                                                       \
     int flags;                                                               \
                                                                              \
+    helper_reset_fpstatus(env);                                              \
+                                                                             \
     t.tfld = stp##_to_##ttp##_round_to_zero(xb->sfld, &env->fp_status);      \
     flags = get_float_exception_flags(&env->fp_status);                      \
     if (flags & float_flag_invalid) {                                        \
@@ -3032,7 +3043,6 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                          \
 
 VSX_CVT_FP_TO_INT_VECTOR(xscvqpsdz, float128, int64, f128, VsrD(0),          \
                   0x8000000000000000ULL)
-
 VSX_CVT_FP_TO_INT_VECTOR(xscvqpswz, float128, int32, f128, VsrD(0),          \
                   0xffffffff80000000ULL)
 VSX_CVT_FP_TO_INT_VECTOR(xscvqpudz, float128, uint64, f128, VsrD(0), 0x0ULL)
@@ -3055,6 +3065,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
     ppc_vsr_t t = { };                                                  \
     int i;                                                              \
                                                                         \
+    helper_reset_fpstatus(env);                                         \
+                                                                        \
     for (i = 0; i < nels; i++) {                                        \
         t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);             \
         if (r2sp) {                                                     \
@@ -3124,6 +3136,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode,                     \
 {                                                                       \
     ppc_vsr_t t = *xt;                                                  \
                                                                         \
+    helper_reset_fpstatus(env);                                         \
     t.tfld = stp##_to_##ttp(xb->sfld, &env->fp_status);                 \
     helper_compute_fprf_##ttp(env, t.tfld);                             \
                                                                         \
@@ -3157,6 +3170,8 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)       \
     int i;                                                             \
     FloatRoundMode curr_rounding_mode;                                 \
                                                                        \
+    helper_reset_fpstatus(env);                                        \
+                                                                       \
     if (rmode != FLOAT_ROUND_CURRENT) {                                \
         curr_rounding_mode = get_float_rounding_mode(&env->fp_status); \
         set_float_rounding_mode(rmode, &env->fp_status);               \
-- 
2.25.1


