Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5D757A648
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 20:14:56 +0200 (CEST)
Received: from localhost ([::1]:34122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDrkE-0000Bk-Qo
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 14:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWZ-0006Ys-EA
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:47 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:33502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDrWX-0006Cj-CJ
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 14:00:47 -0400
Received: by mail-oi1-x231.google.com with SMTP id s188so1380436oie.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 11:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPFOytTyiOAOmPN0mlAlgcpVRZ9JRTiBfdZ4lDpMRkM=;
 b=pnjABu4QWaZtkT99PTUpPixlCawEHUXC5ryfCzxmyhpElmFiudM1MiPZLlibPyXWUO
 65yGgm8SLq1QhOAbXg1gqVZpF8Kf2hf8zB1sWDLsSYH/6OwZVh6upxDhTczloWeWrfUb
 zhVbf0opKVr+9bkpkK7KCRpjjGMMp9wIKMM6RWI2yRlE9NVeMFP2BffEvBXQDUvk/O/K
 SAH7499ZsTm1K4q3EXKuH1zMKvUCDIHjnuisFS0IoYlrhtipGehI/6MVD75D/IhzGTHv
 oK6KSR4gZgUe/R4xHCjRU/5AgJ87n0/0itqhq6AsiAGQWHYQOh7ADKZkVKokG6Yt8sFI
 5Z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPFOytTyiOAOmPN0mlAlgcpVRZ9JRTiBfdZ4lDpMRkM=;
 b=LmGCVwKDKivOQNehGAFup+fFvoOa2bPhPCXosA13g2N3tiCq72/YOjAVbmKDviUMUv
 oxGm+oCmDT94EWi83U4ey5A820DZrlMb0cMEWPOEdIinIXq7R4W0WjTRxHECsMkWJGOn
 ZnXrl41k9J5l4sDjpBIkNY9PXDmKp6IA4PIfzWB7M6BSMEPMFtNb3GwaPT2JXPBMShsN
 zWNwysi3IJ6qXBnxCi6ScO7Fmv78QVYBGr5XN6nqL+YHFRf81fTzL6gABRkUdc86mZ8f
 AF1T60gLOqSDzvuAXo+g8FCtnUO0P5EC8aZM7u3Xm3AkGgg7KiiMednclWQW/tqRMxs0
 qJvQ==
X-Gm-Message-State: AJIora96itWbiQZGH5IUm1sT0wpXHXruP0jLAH1OVw36H+sCZsOORXvo
 j1xuF682chzH30KPy+j8n0zIGzZlA6UamSGd
X-Google-Smtp-Source: AGRyM1scRnjLEwKoTKQ1CHFdbcv9Rstpu8YNS385iLPIzkZx3oeUC1SrX6g7mhHj6kiecF9xDPZDAw==
X-Received: by 2002:aca:43d5:0:b0:339:e447:fe2f with SMTP id
 q204-20020aca43d5000000b00339e447fe2fmr305468oia.113.1658253644157; 
 Tue, 19 Jul 2022 11:00:44 -0700 (PDT)
Received: from stoup.. ([172.58.110.182]) by smtp.gmail.com with ESMTPSA id
 c25-20020a4ae259000000b0035eb4e5a6cesm6286747oot.36.2022.07.19.11.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 11:00:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>
Subject: [PULL 09/21] target/loongarch: Fix float_convd/float_convs test
 failing
Date: Tue, 19 Jul 2022 23:29:48 +0530
Message-Id: <20220719180000.378186-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719180000.378186-1-richard.henderson@linaro.org>
References: <20220719180000.378186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Song Gao <gaosong@loongson.cn>

We should result zero when exception is invalid and operation is nan

Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220716085426.3098060-4-gaosong@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
2.34.1


