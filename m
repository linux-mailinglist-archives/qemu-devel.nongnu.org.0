Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D039AD32
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:49:23 +0200 (CEST)
Received: from localhost ([::1]:46652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovDO-00057N-A6
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5x-00028u-Oi
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:41 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5u-00011r-6X
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:41 -0400
Received: by mail-pg1-x52b.google.com with SMTP id n12so6135079pgs.13
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mH+tBMzgWSEdrBM44cETXcgu3S/9bsd4y7eciPgdKaQ=;
 b=GEBYsj+xwXsyz5iTrIAIm4WNtRTzfubAC5blxqb4mKwHOiPcLEIIPKNlLJeFQNNPR6
 w2JerqyCqwaQgVMMdYTjR6IN4JlLFFapLalfbpKg/TidN5Wb/05R5StlvTUV+B5n1PTi
 RC1DZOCXJ2jxbid+7YfYmDgkWJATqHMgw1rVAr0ByyHv5h6r2emxZemN0moLafWGRnAI
 IxI+8h6HA4eA+3LNADyEqDe0YFOR+iuB27JKnXcSiZboby4nbrkOaofNgb/a4jgpKuos
 jszG+e+3iQtVx96lME2+XbgxWdZivbSDykKdcF9PT3JchQi1VjFm2Z9busdSxDQqkuYW
 5LFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mH+tBMzgWSEdrBM44cETXcgu3S/9bsd4y7eciPgdKaQ=;
 b=rUUwnXVzlUs83BY6AKcCy5XE4iJ5g1QW0UjO+S3v43MOesa99MuuHZyqEnldIVgJhe
 s/erVd5XTQbwPMdUeDsg8ymuYN+jhrq60Di5yU9oAjDfydp3GTmZZGDWoKkJ4yPbQnNZ
 9grWnm5koPGYzV/BTJ71Cf9GRrRzfDD8I+G10wgRSHyEU3A2bBVlAebvQFeDVBL1c8+O
 v5n9knmBFjaoInXkSthRPsn0ZQBSzk5AXrQmYpbdJVB/6bt01vZxVbyN456Z0BQu6Lbl
 SximNNO8YCh+WbYidkI9Ia7xh/PoSNmDdVTP+ZDRd7AtwDK3ADFBASlA+71Du2Av/IpQ
 erSw==
X-Gm-Message-State: AOAM532wuGGF9db5LVRPIu3SPR5Pvwbtt2vF0599XFus1qXSQ/Ld05ol
 nYF6UeHpngXJBB7VD3mFGAlOXAOb35dQXQ==
X-Google-Smtp-Source: ABdhPJwUhbTfWpBoF/8VJcztnr/XnAd7ZBY/Cdso83nZbD9AzM6SR+zrLke/thf1Q5lCQJLCG8aTzQ==
X-Received: by 2002:a63:fc20:: with SMTP id j32mr1515221pgi.8.1622756496756;
 Thu, 03 Jun 2021 14:41:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/29] softfloat: Move compare_floats to softfloat-parts.c.inc
Date: Thu,  3 Jun 2021 14:41:08 -0700
Message-Id: <20210603214131.629841-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to parts$N_compare.  Rename all of the intermediate
functions to ftype_do_compare.  Rename the hard-float functions
to ftype_hs_compare.  Convert float128 to FloatParts128.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 208 ++++++++++++++------------------------
 fpu/softfloat-parts.c.inc |  57 +++++++++++
 2 files changed, 133 insertions(+), 132 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4fee5a6cb7..6f1bbbe6cf 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -882,6 +882,14 @@ static FloatParts128 *parts128_minmax(FloatParts128 *a, FloatParts128 *b,
 #define parts_minmax(A, B, S, F) \
     PARTS_GENERIC_64_128(minmax, A)(A, B, S, F)
 
+static int parts64_compare(FloatParts64 *a, FloatParts64 *b,
+                           float_status *s, bool q);
+static int parts128_compare(FloatParts128 *a, FloatParts128 *b,
+                            float_status *s, bool q);
+
+#define parts_compare(A, B, S, Q) \
+    PARTS_GENERIC_64_128(compare, A)(A, B, S, Q)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -3357,92 +3365,42 @@ MINMAX_2(float128)
 #undef MINMAX_1
 #undef MINMAX_2
 
-/* Floating point compare */
-static FloatRelation compare_floats(FloatParts64 a, FloatParts64 b, bool is_quiet,
-                                    float_status *s)
+/*
+ * Floating point compare
+ */
+
+static FloatRelation QEMU_FLATTEN
+float16_do_compare(float16 a, float16 b, float_status *s, bool is_quiet)
 {
-    if (is_nan(a.cls) || is_nan(b.cls)) {
-        if (!is_quiet ||
-            a.cls == float_class_snan ||
-            b.cls == float_class_snan) {
-            float_raise(float_flag_invalid, s);
-        }
-        return float_relation_unordered;
-    }
+    FloatParts64 pa, pb;
 
-    if (a.cls == float_class_zero) {
-        if (b.cls == float_class_zero) {
-            return float_relation_equal;
-        }
-        return b.sign ? float_relation_greater : float_relation_less;
-    } else if (b.cls == float_class_zero) {
-        return a.sign ? float_relation_less : float_relation_greater;
-    }
-
-    /* The only really important thing about infinity is its sign. If
-     * both are infinities the sign marks the smallest of the two.
-     */
-    if (a.cls == float_class_inf) {
-        if ((b.cls == float_class_inf) && (a.sign == b.sign)) {
-            return float_relation_equal;
-        }
-        return a.sign ? float_relation_less : float_relation_greater;
-    } else if (b.cls == float_class_inf) {
-        return b.sign ? float_relation_greater : float_relation_less;
-    }
-
-    if (a.sign != b.sign) {
-        return a.sign ? float_relation_less : float_relation_greater;
-    }
-
-    if (a.exp == b.exp) {
-        if (a.frac == b.frac) {
-            return float_relation_equal;
-        }
-        if (a.sign) {
-            return a.frac > b.frac ?
-                float_relation_less : float_relation_greater;
-        } else {
-            return a.frac > b.frac ?
-                float_relation_greater : float_relation_less;
-        }
-    } else {
-        if (a.sign) {
-            return a.exp > b.exp ? float_relation_less : float_relation_greater;
-        } else {
-            return a.exp > b.exp ? float_relation_greater : float_relation_less;
-        }
-    }
+    float16_unpack_canonical(&pa, a, s);
+    float16_unpack_canonical(&pb, b, s);
+    return parts_compare(&pa, &pb, s, is_quiet);
 }
 
-#define COMPARE(name, attr, sz)                                         \
-static int attr                                                         \
-name(float ## sz a, float ## sz b, bool is_quiet, float_status *s)      \
-{                                                                       \
-    FloatParts64 pa, pb;                                                \
-    float ## sz ## _unpack_canonical(&pa, a, s);                        \
-    float ## sz ## _unpack_canonical(&pb, b, s);                        \
-    return compare_floats(pa, pb, is_quiet, s);                         \
-}
-
-COMPARE(soft_f16_compare, QEMU_FLATTEN, 16)
-COMPARE(soft_f32_compare, QEMU_SOFTFLOAT_ATTR, 32)
-COMPARE(soft_f64_compare, QEMU_SOFTFLOAT_ATTR, 64)
-
-#undef COMPARE
-
 FloatRelation float16_compare(float16 a, float16 b, float_status *s)
 {
-    return soft_f16_compare(a, b, false, s);
+    return float16_do_compare(a, b, s, false);
 }
 
 FloatRelation float16_compare_quiet(float16 a, float16 b, float_status *s)
 {
-    return soft_f16_compare(a, b, true, s);
+    return float16_do_compare(a, b, s, true);
+}
+
+static FloatRelation QEMU_SOFTFLOAT_ATTR
+float32_do_compare(float32 a, float32 b, float_status *s, bool is_quiet)
+{
+    FloatParts64 pa, pb;
+
+    float32_unpack_canonical(&pa, a, s);
+    float32_unpack_canonical(&pb, b, s);
+    return parts_compare(&pa, &pb, s, is_quiet);
 }
 
 static FloatRelation QEMU_FLATTEN
-f32_compare(float32 xa, float32 xb, bool is_quiet, float_status *s)
+float32_hs_compare(float32 xa, float32 xb, float_status *s, bool is_quiet)
 {
     union_float32 ua, ub;
 
@@ -3463,25 +3421,36 @@ f32_compare(float32 xa, float32 xb, bool is_quiet, float_status *s)
     if (likely(isless(ua.h, ub.h))) {
         return float_relation_less;
     }
-    /* The only condition remaining is unordered.
+    /*
+     * The only condition remaining is unordered.
      * Fall through to set flags.
      */
  soft:
-    return soft_f32_compare(ua.s, ub.s, is_quiet, s);
+    return float32_do_compare(ua.s, ub.s, s, is_quiet);
 }
 
 FloatRelation float32_compare(float32 a, float32 b, float_status *s)
 {
-    return f32_compare(a, b, false, s);
+    return float32_hs_compare(a, b, s, false);
 }
 
 FloatRelation float32_compare_quiet(float32 a, float32 b, float_status *s)
 {
-    return f32_compare(a, b, true, s);
+    return float32_hs_compare(a, b, s, true);
+}
+
+static FloatRelation QEMU_SOFTFLOAT_ATTR
+float64_do_compare(float64 a, float64 b, float_status *s, bool is_quiet)
+{
+    FloatParts64 pa, pb;
+
+    float64_unpack_canonical(&pa, a, s);
+    float64_unpack_canonical(&pb, b, s);
+    return parts_compare(&pa, &pb, s, is_quiet);
 }
 
 static FloatRelation QEMU_FLATTEN
-f64_compare(float64 xa, float64 xb, bool is_quiet, float_status *s)
+float64_hs_compare(float64 xa, float64 xb, float_status *s, bool is_quiet)
 {
     union_float64 ua, ub;
 
@@ -3502,41 +3471,62 @@ f64_compare(float64 xa, float64 xb, bool is_quiet, float_status *s)
     if (likely(isless(ua.h, ub.h))) {
         return float_relation_less;
     }
-    /* The only condition remaining is unordered.
+    /*
+     * The only condition remaining is unordered.
      * Fall through to set flags.
      */
  soft:
-    return soft_f64_compare(ua.s, ub.s, is_quiet, s);
+    return float64_do_compare(ua.s, ub.s, s, is_quiet);
 }
 
 FloatRelation float64_compare(float64 a, float64 b, float_status *s)
 {
-    return f64_compare(a, b, false, s);
+    return float64_hs_compare(a, b, s, false);
 }
 
 FloatRelation float64_compare_quiet(float64 a, float64 b, float_status *s)
 {
-    return f64_compare(a, b, true, s);
+    return float64_hs_compare(a, b, s, true);
 }
 
 static FloatRelation QEMU_FLATTEN
-soft_bf16_compare(bfloat16 a, bfloat16 b, bool is_quiet, float_status *s)
+bfloat16_do_compare(bfloat16 a, bfloat16 b, float_status *s, bool is_quiet)
 {
     FloatParts64 pa, pb;
 
     bfloat16_unpack_canonical(&pa, a, s);
     bfloat16_unpack_canonical(&pb, b, s);
-    return compare_floats(pa, pb, is_quiet, s);
+    return parts_compare(&pa, &pb, s, is_quiet);
 }
 
 FloatRelation bfloat16_compare(bfloat16 a, bfloat16 b, float_status *s)
 {
-    return soft_bf16_compare(a, b, false, s);
+    return bfloat16_do_compare(a, b, s, false);
 }
 
 FloatRelation bfloat16_compare_quiet(bfloat16 a, bfloat16 b, float_status *s)
 {
-    return soft_bf16_compare(a, b, true, s);
+    return bfloat16_do_compare(a, b, s, true);
+}
+
+static FloatRelation QEMU_FLATTEN
+float128_do_compare(float128 a, float128 b, float_status *s, bool is_quiet)
+{
+    FloatParts128 pa, pb;
+
+    float128_unpack_canonical(&pa, a, s);
+    float128_unpack_canonical(&pb, b, s);
+    return parts_compare(&pa, &pb, s, is_quiet);
+}
+
+FloatRelation float128_compare(float128 a, float128 b, float_status *s)
+{
+    return float128_do_compare(a, b, s, false);
+}
+
+FloatRelation float128_compare_quiet(float128 a, float128 b, float_status *s)
+{
+    return float128_do_compare(a, b, s, true);
 }
 
 /* Multiply A by 2 raised to the power N.  */
@@ -6609,52 +6599,6 @@ FloatRelation floatx80_compare_quiet(floatx80 a, floatx80 b,
     return floatx80_compare_internal(a, b, 1, status);
 }
 
-static inline FloatRelation
-float128_compare_internal(float128 a, float128 b, bool is_quiet,
-                          float_status *status)
-{
-    bool aSign, bSign;
-
-    if (( ( extractFloat128Exp( a ) == 0x7fff ) &&
-          ( extractFloat128Frac0( a ) | extractFloat128Frac1( a ) ) ) ||
-        ( ( extractFloat128Exp( b ) == 0x7fff ) &&
-          ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )) {
-        if (!is_quiet ||
-            float128_is_signaling_nan(a, status) ||
-            float128_is_signaling_nan(b, status)) {
-            float_raise(float_flag_invalid, status);
-        }
-        return float_relation_unordered;
-    }
-    aSign = extractFloat128Sign( a );
-    bSign = extractFloat128Sign( b );
-    if ( aSign != bSign ) {
-        if ( ( ( ( a.high | b.high )<<1 ) | a.low | b.low ) == 0 ) {
-            /* zero case */
-            return float_relation_equal;
-        } else {
-            return 1 - (2 * aSign);
-        }
-    } else {
-        if (a.low == b.low && a.high == b.high) {
-            return float_relation_equal;
-        } else {
-            return 1 - 2 * (aSign ^ ( lt128( a.high, a.low, b.high, b.low ) ));
-        }
-    }
-}
-
-FloatRelation float128_compare(float128 a, float128 b, float_status *status)
-{
-    return float128_compare_internal(a, b, 0, status);
-}
-
-FloatRelation float128_compare_quiet(float128 a, float128 b,
-                                     float_status *status)
-{
-    return float128_compare_internal(a, b, 1, status);
-}
-
 floatx80 floatx80_scalbn(floatx80 a, int n, float_status *status)
 {
     bool aSign;
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index b9094768db..3dacb5b4f0 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1018,3 +1018,60 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
     }
     return cmp < 0 ? b : a;
 }
+
+/*
+ * Floating point compare
+ */
+static FloatRelation partsN(compare)(FloatPartsN *a, FloatPartsN *b,
+                                     float_status *s, bool is_quiet)
+{
+    int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
+    int cmp;
+
+    if (likely(ab_mask == float_cmask_normal)) {
+        if (a->sign != b->sign) {
+            goto a_sign;
+        }
+        if (a->exp != b->exp) {
+            cmp = a->exp < b->exp ? -1 : 1;
+        } else {
+            cmp = frac_cmp(a, b);
+        }
+        if (a->sign) {
+            cmp = -cmp;
+        }
+        return cmp;
+    }
+
+    if (unlikely(ab_mask & float_cmask_anynan)) {
+        if (!is_quiet || (ab_mask & float_cmask_snan)) {
+            float_raise(float_flag_invalid, s);
+        }
+        return float_relation_unordered;
+    }
+
+    if (ab_mask & float_cmask_zero) {
+        if (ab_mask == float_cmask_zero) {
+            return float_relation_equal;
+        } else if (a->cls == float_class_zero) {
+            goto b_sign;
+        } else {
+            goto a_sign;
+        }
+    }
+
+    if (ab_mask == float_cmask_inf) {
+        if (a->sign == b->sign) {
+            return float_relation_equal;
+        }
+    } else if (b->cls == float_class_inf) {
+        goto b_sign;
+    } else {
+        g_assert(a->cls == float_class_inf);
+    }
+
+ a_sign:
+    return a->sign ? float_relation_less : float_relation_greater;
+ b_sign:
+    return b->sign ? float_relation_greater : float_relation_less;
+}
-- 
2.25.1


