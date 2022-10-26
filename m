Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364760E906
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:33:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onm3I-0007qR-Cb; Wed, 26 Oct 2022 15:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1onm3G-0007gT-QH; Wed, 26 Oct 2022 15:26:58 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1onm3E-0003oy-Ne; Wed, 26 Oct 2022 15:26:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 26 Oct 2022 16:26:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0EB6980023A;
 Wed, 26 Oct 2022 16:26:36 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [RFC PATCH v2 4/5] target/ppc: Implement instruction caching for
 add/sub/mul/div
Date: Wed, 26 Oct 2022 16:25:47 -0300
Message-Id: <20221026192548.67303-5-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026192548.67303-1-victor.colombo@eldorado.org.br>
References: <20221026192548.67303-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Oct 2022 19:26:36.0453 (UTC)
 FILETIME=[DD38DD50:01D8E970]
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch adds the code necessary to cache add/sub/mul/div
instructions for usage with hardfpu in Power.

These instructions receives three arguments, two f64 and
one status, and returns f64. This info will be cached inside the
union in env, which grows when other instructions with other
signatures are added.

Hardfpu in QEMU only works when the inexact is already set. So,
CACHE_FN_4 will check if FP_XX is set, and set float_flag_inexact
to enable the hardfpu behavior. When the instruction is later
reexecuted, it will be with float_flag_inexact cleared, forcing
softfloat and correctly updating the relevant flags, as is today.

This implementation only works in linux-user. No test or effort
was done in this patch to make it work for softmmu. Future work
will be required to make it work correctly in this scenario.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h        |  9 +++++++
 target/ppc/fpu_helper.c | 56 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 60 insertions(+), 5 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index f6803bf37b..a25787d939 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1083,6 +1083,7 @@ struct ppc_radix_page_info {
 enum {
     CACHED_FN_TYPE_NONE,
     CACHED_FN_TYPE_F64_F64_FSTATUS,
+    CACHED_FN_TYPE_F64_F64_F64_FSTATUS,
     CACHED_FN_TYPE_F64_F64_F64_F64_I_FSTATUS,
 
 };
@@ -1093,6 +1094,13 @@ struct cached_fn_f64_f64_fstatus {
     float_status arg2;
 };
 
+struct cached_fn_f64_f64_f64_fstatus {
+    float64 (*fn)(float64, float64, float_status*);
+    float64 arg1;
+    float64 arg2;
+    float_status arg3;
+};
+
 struct cached_fn_f64_f64_f64_f64_i_fstatus {
     float64 (*fn)(float64, float64, float64, int, float_status*);
     float64 arg1;
@@ -1182,6 +1190,7 @@ struct CPUArchState {
     int cached_fn_type;
     union {
         struct cached_fn_f64_f64_fstatus f64_f64_fstatus;
+        struct cached_fn_f64_f64_f64_fstatus f64_f64_f64_fstatus;
         struct cached_fn_f64_f64_f64_f64_i_fstatus f64_f64_f64_f64_i_fstatus;
     } cached_fn;
 
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index a152c018b2..0bea9df361 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -46,6 +46,22 @@
         }                                                                     \
     } while (0)
 
+#define CACHE_FN_4(env, FN, ARG1, ARG2, ARG3, FIELD, TYPE)                    \
+    do {                                                                      \
+        if (env->fpscr & FP_XX) {                                             \
+            env->cached_fn_type = TYPE;                                       \
+            env->cached_fn.FIELD.fn = FN;                                     \
+            env->cached_fn.FIELD.arg1 = ARG1;                                 \
+            env->cached_fn.FIELD.arg2 = ARG2;                                 \
+            env->cached_fn.FIELD.arg3 = ARG3;                                 \
+            env->fp_status.float_exception_flags |= float_flag_inexact;       \
+        } else {                                                              \
+            assert(!(env->fp_status.float_exception_flags &                   \
+                     float_flag_inexact));                                    \
+            env->cached_fn_type = CACHED_FN_TYPE_NONE;                        \
+        }                                                                     \
+    } while (0)
+
 #define CACHE_FN_5(env, FN, ARG1, ARG2, ARG3, ARG4, FIELD, TYPE)              \
     do {                                                                      \
         if (env->fpscr & FP_XX) {                                             \
@@ -65,6 +81,7 @@
 #else
 #define CACHE_FN_NONE(env)
 #define CACHE_FN_3(env, FN, ARG1, ARG2, FIELD, TYPE)
+#define CACHE_FN_4(env, FN, ARG1, ARG2, ARG3, FIELD, TYPE)
 #define CACHE_FN_5(env, FN, ARG1, ARG2, ARG3, ARG4, FIELD, TYPE)
 #endif
 
@@ -590,6 +607,24 @@ void helper_execute_fp_cached(CPUPPCState *env)
             env->fpscr |= FP_FI | FP_XX;
         }
         break;
+    case CACHED_FN_TYPE_F64_F64_F64_FSTATUS:
+        assert((env->cached_fn.f64_f64_f64_fstatus.arg3.float_exception_flags &
+               float_flag_inexact) == 0);
+        env->cached_fn.f64_f64_f64_fstatus.fn(
+            env->cached_fn.f64_f64_f64_fstatus.arg1,
+            env->cached_fn.f64_f64_f64_fstatus.arg2,
+            &env->cached_fn.f64_f64_f64_fstatus.arg3);
+
+        env->fpscr &= ~FP_FI;
+        /*
+         * if the cached instruction resulted in FI being set
+         * then we update fpscr with this value
+         */
+        if (env->cached_fn.f64_f64_f64_fstatus.arg3.float_exception_flags &
+            float_flag_inexact) {
+            env->fpscr |= FP_FI | FP_XX;
+        }
+        break;
     case CACHED_FN_TYPE_F64_F64_F64_F64_I_FSTATUS:
         ; /* hack to allow declaration below */
         struct cached_fn_f64_f64_f64_f64_i_fstatus args =
@@ -622,7 +657,8 @@ static void float_invalid_op_addsub(CPUPPCState *env, int flags,
 /* fadd - fadd. */
 float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
 {
-    CACHE_FN_NONE(env);
+    CACHE_FN_4(env, float64_add, arg1, arg2, env->fp_status,
+        f64_f64_f64_fstatus, CACHED_FN_TYPE_F64_F64_F64_FSTATUS);
     float64 ret = float64_add(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -636,7 +672,8 @@ float64 helper_fadd(CPUPPCState *env, float64 arg1, float64 arg2)
 /* fadds - fadds. */
 float64 helper_fadds(CPUPPCState *env, float64 arg1, float64 arg2)
 {
-    CACHE_FN_NONE(env);
+    CACHE_FN_4(env, float64r32_add, arg1, arg2, env->fp_status,
+        f64_f64_f64_fstatus, CACHED_FN_TYPE_F64_F64_F64_FSTATUS);
     float64 ret = float64r32_add(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -649,7 +686,8 @@ float64 helper_fadds(CPUPPCState *env, float64 arg1, float64 arg2)
 /* fsub - fsub. */
 float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
 {
-    CACHE_FN_NONE(env);
+    CACHE_FN_4(env, float64_sub, arg1, arg2, env->fp_status,
+        f64_f64_f64_fstatus, CACHED_FN_TYPE_F64_F64_F64_FSTATUS);
     float64 ret = float64_sub(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -663,7 +701,8 @@ float64 helper_fsub(CPUPPCState *env, float64 arg1, float64 arg2)
 /* fsubs - fsubs. */
 float64 helper_fsubs(CPUPPCState *env, float64 arg1, float64 arg2)
 {
-    CACHE_FN_NONE(env);
+    CACHE_FN_4(env, float64r32_sub, arg1, arg2, env->fp_status,
+        f64_f64_f64_fstatus, CACHED_FN_TYPE_F64_F64_F64_FSTATUS);
     float64 ret = float64r32_sub(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -686,7 +725,8 @@ static void float_invalid_op_mul(CPUPPCState *env, int flags,
 /* fmul - fmul. */
 float64 helper_fmul(CPUPPCState *env, float64 arg1, float64 arg2)
 {
-    CACHE_FN_NONE(env);
+    CACHE_FN_4(env, float64_mul, arg1, arg2, env->fp_status,
+        f64_f64_f64_fstatus, CACHED_FN_TYPE_F64_F64_F64_FSTATUS);
     float64 ret = float64_mul(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -701,6 +741,8 @@ float64 helper_fmul(CPUPPCState *env, float64 arg1, float64 arg2)
 float64 helper_fmuls(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     CACHE_FN_NONE(env);
+    CACHE_FN_4(env, float64r32_mul, arg1, arg2, env->fp_status,
+        f64_f64_f64_fstatus, CACHED_FN_TYPE_F64_F64_F64_FSTATUS);
     float64 ret = float64r32_mul(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -726,6 +768,8 @@ static void float_invalid_op_div(CPUPPCState *env, int flags,
 float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     CACHE_FN_NONE(env);
+    CACHE_FN_4(env, float64_div, arg1, arg2, env->fp_status,
+        f64_f64_f64_fstatus, CACHED_FN_TYPE_F64_F64_F64_FSTATUS);
     float64 ret = float64_div(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -743,6 +787,8 @@ float64 helper_fdiv(CPUPPCState *env, float64 arg1, float64 arg2)
 float64 helper_fdivs(CPUPPCState *env, float64 arg1, float64 arg2)
 {
     CACHE_FN_NONE(env);
+    CACHE_FN_4(env, float64r32_div, arg1, arg2, env->fp_status,
+        f64_f64_f64_fstatus, CACHED_FN_TYPE_F64_F64_F64_FSTATUS);
     float64 ret = float64r32_div(arg1, arg2, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
-- 
2.25.1


