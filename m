Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4995F5798
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:33:00 +0200 (CEST)
Received: from localhost ([::1]:43106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og6OJ-0006Fy-JS
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og5Xl-0005xL-B3; Wed, 05 Oct 2022 10:38:42 -0400
Received: from [200.168.210.66] (port=55228 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1og5Xj-0004bx-MA; Wed, 05 Oct 2022 10:38:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 5 Oct 2022 11:37:24 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9116A8003B3;
 Wed,  5 Oct 2022 11:37:23 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [RFC PATCH 2/4] target/ppc: Implement instruction caching for fsqrt
Date: Wed,  5 Oct 2022 11:37:17 -0300
Message-Id: <20221005143719.65241-3-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
References: <20221005143719.65241-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Oct 2022 14:37:24.0205 (UTC)
 FILETIME=[FBCD31D0:01D8D8C7]
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

This patch adds the code necessary to cache fsqrt for usage
with hardfpu in Power. It is also the first instruction to
use the new cache instruction system.

fsqrt is an instruction that receives two arguments, one f64 and
one status, and returns f64. This info will be cached inside a new
union in env, which will grow when other instructions with other
signatures are added.

Hardfpu in QEMU only works when the inexact is already set. So,
CACHE_FN_3 will check if FP_XX is set, and set float_flag_inexact
to enable the hardfpu behavior. When the instruction is later
reexecuted, it will be with float_flag_inexact cleared, forcing
softfloat and correctly updating the relevant flags, as is today.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h        | 11 +++++++++++
 target/ppc/fpu_helper.c | 39 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1132d60162..b423e33a0c 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1082,6 +1082,14 @@ struct ppc_radix_page_info {
 
 enum {
     CACHED_FN_TYPE_NONE,
+    CACHED_FN_TYPE_F64_F64_FSTATUS,
+
+};
+
+struct cached_fn_f64_f64_fstatus {
+    float64 (*fn)(float64, float_status*);
+    float64 arg1;
+    float_status arg2;
 };
 
 struct CPUArchState {
@@ -1162,6 +1170,9 @@ struct CPUArchState {
     target_ulong fpscr;     /* Floating point status and control register */
 
     int cached_fn_type;
+    union {
+        struct cached_fn_f64_f64_fstatus f64_f64_fstatus;
+    } cached_fn;
 
     /* Internal devices resources */
     ppc_tb_t *tb_env;      /* Time base and decrementer */
diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 6aaee37619..b68f12a1a9 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -30,6 +30,21 @@
         env->cached_fn_type = CACHED_FN_TYPE_NONE;                            \
     } while (0)
 
+#define CACHE_FN_3(env, FN, ARG1, ARG2, FIELD, TYPE)                          \
+    do {                                                                      \
+        if (env->fpscr & FP_XX) {                                             \
+            env->cached_fn_type = TYPE;                                       \
+            env->cached_fn.FIELD.fn = FN;                                     \
+            env->cached_fn.FIELD.arg1 = ARG1;                                 \
+            env->cached_fn.FIELD.arg2 = ARG2;                                 \
+            env->fp_status.float_exception_flags |= float_flag_inexact;       \
+        } else {                                                              \
+            assert(!(env->fp_status.float_exception_flags &                   \
+                     float_flag_inexact));                                    \
+            env->cached_fn_type = CACHED_FN_TYPE_NONE;                        \
+        }                                                                     \
+    } while (0)
+
 static inline float128 float128_snan_to_qnan(float128 x)
 {
     float128 r;
@@ -530,6 +545,27 @@ void helper_execute_fp_cached(CPUPPCState *env)
          * so no need to execute it again
          */
         break;
+    case CACHED_FN_TYPE_F64_F64_FSTATUS:
+        /*
+         * execute the cached insn. At this point, float_exception_flags
+         * should have FI not set, otherwise the result will not be correct
+         */
+        assert((env->cached_fn.f64_f64_fstatus.arg2.float_exception_flags &
+               float_flag_inexact) == 0);
+        env->cached_fn.f64_f64_fstatus.fn(
+            env->cached_fn.f64_f64_fstatus.arg1,
+            &env->cached_fn.f64_f64_fstatus.arg2);
+
+        env->fpscr &= ~FP_FI;
+        /*
+         * if the cached instruction resulted in FI being set
+         * then we update fpscr with this value
+         */
+        if (env->cached_fn.f64_f64_fstatus.arg2.float_exception_flags &
+            float_flag_inexact) {
+            env->fpscr |= FP_FI | FP_XX;
+        }
+        break;
     default:
         g_assert_not_reached();
     }
@@ -872,7 +908,8 @@ static void float_invalid_op_sqrt(CPUPPCState *env, int flags,
 #define FPU_FSQRT(name, op)                                                   \
 float64 helper_##name(CPUPPCState *env, float64 arg)                          \
 {                                                                             \
-    CACHE_FN_NONE(env);                                                       \
+    CACHE_FN_3(env, op, arg, env->fp_status, f64_f64_fstatus,                 \
+        CACHED_FN_TYPE_F64_F64_FSTATUS);                                      \
     float64 ret = op(arg, &env->fp_status);                                   \
     int flags = get_float_exception_flags(&env->fp_status);                   \
                                                                               \
-- 
2.25.1


