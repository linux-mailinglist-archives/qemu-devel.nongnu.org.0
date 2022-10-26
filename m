Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FD960E8FC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 21:27:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onm3G-0006rG-1A; Wed, 26 Oct 2022 15:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1onm3D-00065o-LA; Wed, 26 Oct 2022 15:26:55 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1onm3A-0003oy-Sk; Wed, 26 Oct 2022 15:26:55 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 26 Oct 2022 16:26:36 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BE5428001F1;
 Wed, 26 Oct 2022 16:26:35 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [RFC PATCH v2 3/5] target/ppc: Implement instruction caching for
 muladd
Date: Wed, 26 Oct 2022 16:25:46 -0300
Message-Id: <20221026192548.67303-4-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026192548.67303-1-victor.colombo@eldorado.org.br>
References: <20221026192548.67303-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Oct 2022 19:26:36.0234 (UTC)
 FILETIME=[DD1772A0:01D8E970]
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

This patch adds the code necessary to cache muladd instructions
for usage with hardfpu in Power.

muladd is an instruction that receives four arguments, three f64 and
one status, and returns f64. This info will be cached inside the
union in env, which grows when other instructions with other
signatures are added.

Hardfpu in QEMU only works when the inexact is already set. So,
CACHE_FN_5 will check if FP_XX is set, and set float_flag_inexact
to enable the hardfpu behavior. When the instruction is later
reexecuted, it will be with float_flag_inexact cleared, forcing
softfloat and correctly updating the relevant flags, as is today.

This implementation only works in linux-user. No test or effort
was done in this patch to make it work for softmmu. Future work
will be required to make it work correctly in this scenario.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h        | 11 +++++++++++
 target/ppc/fpu_helper.c | 35 +++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e55c10b0db..f6803bf37b 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1083,6 +1083,7 @@ struct ppc_radix_page_info {
 enum {
     CACHED_FN_TYPE_NONE,
     CACHED_FN_TYPE_F64_F64_FSTATUS,
+    CACHED_FN_TYPE_F64_F64_F64_F64_I_FSTATUS,
 
 };
 
@@ -1092,6 +1093,15 @@ struct cached_fn_f64_f64_fstatus {
     float_status arg2;
 };
 
+struct cached_fn_f64_f64_f64_f64_i_fstatus {
+    float64 (*fn)(float64, float64, float64, int, float_status*);
+    float64 arg1;
+    float64 arg2;
+    float64 arg3;
+    int arg4;
+    float_status arg5;
+};
+
 struct CPUArchState {
     /* Most commonly used resources during translated code execution first */
     target_ulong gpr[32];  /* general purpose registers */
@@ -1172,6 +1182,7 @@ struct CPUArchState {
     int cached_fn_type;
     union {
         struct cached_fn_f64_f64_fstatus f64_f64_fstatus;
+        struct cached_fn_f64_f64_f64_f64_i_fstatus f64_f64_f64_f64_i_fstatus;
     } cached_fn;
 
     /* Internal devices resources */
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 1756719664..a152c018b2 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -45,9 +45,27 @@
             env->cached_fn_type = CACHED_FN_TYPE_NONE;                        \
         }                                                                     \
     } while (0)
+
+#define CACHE_FN_5(env, FN, ARG1, ARG2, ARG3, ARG4, FIELD, TYPE)              \
+    do {                                                                      \
+        if (env->fpscr & FP_XX) {                                             \
+            env->cached_fn_type = TYPE;                                       \
+            env->cached_fn.FIELD.fn = FN;                                     \
+            env->cached_fn.FIELD.arg1 = ARG1;                                 \
+            env->cached_fn.FIELD.arg2 = ARG2;                                 \
+            env->cached_fn.FIELD.arg3 = ARG3;                                 \
+            env->cached_fn.FIELD.arg4 = ARG4;                                 \
+            env->fp_status.float_exception_flags |= float_flag_inexact;       \
+        } else {                                                              \
+            assert(!(env->fp_status.float_exception_flags &                   \
+                     float_flag_inexact));                                    \
+            env->cached_fn_type = CACHED_FN_TYPE_NONE;                        \
+        }                                                                     \
+    } while (0)
 #else
 #define CACHE_FN_NONE(env)
 #define CACHE_FN_3(env, FN, ARG1, ARG2, FIELD, TYPE)
+#define CACHE_FN_5(env, FN, ARG1, ARG2, ARG3, ARG4, FIELD, TYPE)
 #endif
 
 static inline float128 float128_snan_to_qnan(float128 x)
@@ -572,6 +590,17 @@ void helper_execute_fp_cached(CPUPPCState *env)
             env->fpscr |= FP_FI | FP_XX;
         }
         break;
+    case CACHED_FN_TYPE_F64_F64_F64_F64_I_FSTATUS:
+        ; /* hack to allow declaration below */
+        struct cached_fn_f64_f64_f64_f64_i_fstatus args =
+            env->cached_fn.f64_f64_f64_f64_i_fstatus;
+        assert(!(args.arg5.float_exception_flags & float_flag_inexact));
+        args.fn(args.arg1, args.arg2, args.arg3, args.arg4, &args.arg5);
+        env->fpscr &= ~FP_FI;
+        if (args.arg5.float_exception_flags & float_flag_inexact) {
+            env->fpscr |= FP_FI | FP_XX;
+        }
+        break;
     default:
         g_assert_not_reached();
     }
@@ -843,7 +872,8 @@ static void float_invalid_op_madd(CPUPPCState *env, int flags,
 static float64 do_fmadd(CPUPPCState *env, float64 a, float64 b,
                          float64 c, int madd_flags, uintptr_t retaddr)
 {
-    CACHE_FN_NONE(env);
+    CACHE_FN_5(env, float64_muladd, a, b, c, madd_flags,
+        f64_f64_f64_f64_i_fstatus, CACHED_FN_TYPE_F64_F64_F64_F64_I_FSTATUS);
     float64 ret = float64_muladd(a, b, c, madd_flags, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
@@ -856,7 +886,8 @@ static float64 do_fmadd(CPUPPCState *env, float64 a, float64 b,
 static uint64_t do_fmadds(CPUPPCState *env, float64 a, float64 b,
                           float64 c, int madd_flags, uintptr_t retaddr)
 {
-    CACHE_FN_NONE(env);
+    CACHE_FN_5(env, float64r32_muladd, a, b, c, madd_flags,
+        f64_f64_f64_f64_i_fstatus, CACHED_FN_TYPE_F64_F64_F64_F64_I_FSTATUS);
     float64 ret = float64r32_muladd(a, b, c, madd_flags, &env->fp_status);
     int flags = get_float_exception_flags(&env->fp_status);
 
-- 
2.25.1


