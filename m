Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4740576CAE
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 11:02:44 +0200 (CEST)
Received: from localhost ([::1]:43596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCdhD-0000nx-SC
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 05:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oCdZO-0005ct-Ud
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50108 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oCdZL-0006ea-F5
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 04:54:38 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9PCfNJijWQiAA--.28082S5; 
 Sat, 16 Jul 2022 16:54:30 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, f4bug@amsat.org,
 gaosong@loongson.cn, peter.maydell@linaro.org, yangxiaojuan@loongson.cn
Subject: [PATCH 3/8] target/loongarch: Fix float_convd/float_convs test failing
Date: Sat, 16 Jul 2022 16:54:21 +0800
Message-Id: <20220716085426.3098060-4-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220716085426.3098060-1-gaosong@loongson.cn>
References: <20220716085426.3098060-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9PCfNJijWQiAA--.28082S5
X-Coremail-Antispam: 1UD129KBjvxXoW7GFWkAF1UXw18ZoXrpw4rWFbEqFWxWFykWr
 s8CrWavF4jg34UCryUKFnYqry7A34Yvryq9F1DG34xCF1jgF13GayfW343Jryj9rnrWFyI
 yry3ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT9fnUUIcS
 sGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We should result zero when exception is invalid and operation is nan

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/fpu_helper.c | 143 +++++++++++++++++++---------------
 1 file changed, 80 insertions(+), 63 deletions(-)

diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 3d0cb8dd0d..bd76529219 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -13,9 +13,6 @@
 #include "fpu/softfloat.h"
 #include "internals.h"
 
-#define FLOAT_TO_INT32_OVERFLOW 0x7fffffff
-#define FLOAT_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
-
 static inline uint64_t nanbox_s(float32 fp)
 {
     return fp | MAKE_64BIT_MASK(32, 32);
@@ -544,9 +541,10 @@ uint64_t helper_ftintrm_l_d(CPULoongArchState *env, uint64_t fj)
     fd = float64_to_int64(fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -561,9 +559,10 @@ uint64_t helper_ftintrm_l_s(CPULoongArchState *env, uint64_t fj)
     fd = float32_to_int64((uint32_t)fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -578,9 +577,10 @@ uint64_t helper_ftintrm_w_d(CPULoongArchState *env, uint64_t fj)
     fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -595,9 +595,10 @@ uint64_t helper_ftintrm_w_s(CPULoongArchState *env, uint64_t fj)
     fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -612,9 +613,10 @@ uint64_t helper_ftintrp_l_d(CPULoongArchState *env, uint64_t fj)
     fd = float64_to_int64(fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -629,9 +631,10 @@ uint64_t helper_ftintrp_l_s(CPULoongArchState *env, uint64_t fj)
     fd = float32_to_int64((uint32_t)fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -646,9 +649,10 @@ uint64_t helper_ftintrp_w_d(CPULoongArchState *env, uint64_t fj)
     fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -663,9 +667,10 @@ uint64_t helper_ftintrp_w_s(CPULoongArchState *env, uint64_t fj)
     fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -679,9 +684,10 @@ uint64_t helper_ftintrz_l_d(CPULoongArchState *env, uint64_t fj)
     fd = float64_to_int64_round_to_zero(fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -695,9 +701,10 @@ uint64_t helper_ftintrz_l_s(CPULoongArchState *env, uint64_t fj)
     fd = float32_to_int64_round_to_zero((uint32_t)fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -711,9 +718,10 @@ uint64_t helper_ftintrz_w_d(CPULoongArchState *env, uint64_t fj)
     fd = (uint64_t)float64_to_int32_round_to_zero(fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -727,9 +735,10 @@ uint64_t helper_ftintrz_w_s(CPULoongArchState *env, uint64_t fj)
     fd = float32_to_int32_round_to_zero((uint32_t)fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return (uint64_t)fd;
@@ -744,9 +753,10 @@ uint64_t helper_ftintrne_l_d(CPULoongArchState *env, uint64_t fj)
     fd = float64_to_int64(fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -761,9 +771,10 @@ uint64_t helper_ftintrne_l_s(CPULoongArchState *env, uint64_t fj)
     fd = float32_to_int64((uint32_t)fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -778,9 +789,10 @@ uint64_t helper_ftintrne_w_d(CPULoongArchState *env, uint64_t fj)
     fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -795,9 +807,10 @@ uint64_t helper_ftintrne_w_s(CPULoongArchState *env, uint64_t fj)
     fd = float32_to_int32((uint32_t)fj, &env->fp_status);
     set_float_rounding_mode(old_mode, &env->fp_status);
 
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return (uint64_t)fd;
@@ -808,9 +821,10 @@ uint64_t helper_ftint_l_d(CPULoongArchState *env, uint64_t fj)
     uint64_t fd;
 
     fd = float64_to_int64(fj, &env->fp_status);
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -821,9 +835,10 @@ uint64_t helper_ftint_l_s(CPULoongArchState *env, uint64_t fj)
     uint64_t fd;
 
     fd = float32_to_int64((uint32_t)fj, &env->fp_status);
-    if (get_float_exception_flags(&env->fp_status) &
-        (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT64_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -834,9 +849,10 @@ uint64_t helper_ftint_w_s(CPULoongArchState *env, uint64_t fj)
     uint64_t fd;
 
     fd = (uint64_t)float32_to_int32((uint32_t)fj, &env->fp_status);
-    if (get_float_exception_flags(&env->fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float32_is_any_nan((uint32_t)fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
@@ -847,9 +863,10 @@ uint64_t helper_ftint_w_d(CPULoongArchState *env, uint64_t fj)
     uint64_t fd;
 
     fd = (uint64_t)float64_to_int32(fj, &env->fp_status);
-    if (get_float_exception_flags(&env->fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        fd = FLOAT_TO_INT32_OVERFLOW;
+    if (get_float_exception_flags(&env->fp_status) & (float_flag_invalid)) {
+        if (float64_is_any_nan(fj)) {
+            fd = 0;
+        }
     }
     update_fcsr0(env, GETPC());
     return fd;
-- 
2.31.1


