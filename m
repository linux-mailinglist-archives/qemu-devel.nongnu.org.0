Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C3E39067E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:20:29 +0200 (CEST)
Received: from localhost ([::1]:60832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZnA-0005G7-Ib
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeN-0001UD-7e
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:19 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeG-0006dG-9o
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:18 -0400
Received: by mail-pg1-x530.google.com with SMTP id q15so22958499pgg.12
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cwk6k6WelU2y/W9DtVCo3TZQRRzAyY6JxxIHIEVoyWE=;
 b=xSdbYx+ETf7JwnmVhAOcOOb5/3vAL77+h7Jx8b6ClmhsANtk6Do+pXyecWXdjupRuB
 XRGqCPccLuURyiTc8A7ex9buqaZrOqyM5UIKU2bZylIaBHWQGCKRkDDpNg3Cpb48+hFQ
 bn8oXPWGi2Fa40Mkkehqgw+IAvYuzi8B5nuaqau7B5H6zGdTWY4jejAxpDpIujEzhCLc
 mqth0HOtTHkDzv4Z5/HQeKKz3pKFW4AMcydrTZnfPSHQeb7KKA8OHMcjDMxl2u1C80U4
 VxcJ1MS09IlhoiTYsNLM2ocnYTTOd9U4Rh9sz1TFT/uynZRyA8CX5T7Fl1Rpqhw/7zWD
 f5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cwk6k6WelU2y/W9DtVCo3TZQRRzAyY6JxxIHIEVoyWE=;
 b=jTtCMaGm1/nmIjeFMD85NcG5K3Qs7MAZgoBlZsWMazd/LjpTf7vacbqdIQDb1kQT8I
 l3Xhh/RDcoPKyGXDVXys75TIjAgJhGzbbevOelfnOnYZSIIMWxXpVoiToDL219qOkjb7
 0VZAe8YKjeYZcTUpxe7Rmt1pKYP8qhGH19Mhf4Wa4SpNeUw1JPjrdEQEPp+VdLAEfFfR
 z8HSd8fM8q2/sikxOr5C67/DWvdL0Gm897hbd9IN8mMjhC2uH1z672kShLLpcgZfIqHN
 LLAVk2QRCzNziCth9pO7/W/jsoSX7Q78P3I8F3a4pE1xMxrcvZ2rLT3K64xRrritKkLf
 HETw==
X-Gm-Message-State: AOAM531+nVMOdgfNgAC9Edq5epu4SneEpUsmZI+LwBnZyRfB+TpFglyp
 cGd3b64LR7Ldi8yJzHgzPVbEVgLIwzD2pQ==
X-Google-Smtp-Source: ABdhPJyte7SQZJ3RRrGu7LWrSslE1TSCfITI2I3lsDygMEfe+96v52mpRWWnBHmzi14PStMlF1o8ug==
X-Received: by 2002:a62:8810:0:b029:2db:1af8:fa81 with SMTP id
 l16-20020a6288100000b02902db1af8fa81mr30649805pfd.46.1621955230086; 
 Tue, 25 May 2021 08:07:10 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/28] softfloat: Move minmax_flags to softfloat-parts.c.inc
Date: Tue, 25 May 2021 08:06:42 -0700
Message-Id: <20210525150706.294968-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to parts$N_minmax.  Combine 3 bool arguments to a bitmask,
return a tri-state value to indicate nan vs unchanged operand.
Introduce ftype_minmax functions as a common optimization point.
Fold bfloat16 expansions into the same macro as the other types.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 216 ++++++++++++++++----------------------
 fpu/softfloat-parts.c.inc |  81 ++++++++++++++
 2 files changed, 170 insertions(+), 127 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index db14bd09aa..2dadded0b5 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -482,6 +482,15 @@ enum {
     float_cmask_anynan  = float_cmask_qnan | float_cmask_snan,
 };
 
+/* Flags for parts_minmax. */
+enum {
+    /* Set for minimum; clear for maximum. */
+    minmax_ismin = 1,
+    /* Set for the IEEE 754-2008 minNum() and maxNum() operations. */
+    minmax_isnum = 2,
+    /* Set for the IEEE 754-2008 minNumMag() and minNumMag() operations. */
+    minmax_ismag = 4,
+};
 
 /* Simple helpers for checking if, or what kind of, NaN we have */
 static inline __attribute__((unused)) bool is_nan(FloatClass c)
@@ -865,6 +874,14 @@ static void parts128_uint_to_float(FloatParts128 *p, uint64_t a,
 #define parts_uint_to_float(P, I, Z, S) \
     PARTS_GENERIC_64_128(uint_to_float, P)(P, I, Z, S)
 
+static int parts64_minmax(FloatParts64 *a, FloatParts64 *b,
+                          float_status *s, int flags, const FloatFmt *fmt);
+static int parts128_minmax(FloatParts128 *a, FloatParts128 *b,
+                           float_status *s, int flags, const FloatFmt *fmt);
+
+#define parts_minmax(A, B, S, Z, F) \
+    PARTS_GENERIC_64_128(minmax, A)(A, B, S, Z, F)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -3258,145 +3275,90 @@ float128 uint64_to_float128(uint64_t a, float_status *status)
     return float128_round_pack_canonical(&p, status);
 }
 
-/* Float Min/Max */
-/* min() and max() functions. These can't be implemented as
- * 'compare and pick one input' because that would mishandle
- * NaNs and +0 vs -0.
- *
- * minnum() and maxnum() functions. These are similar to the min()
- * and max() functions but if one of the arguments is a QNaN and
- * the other is numerical then the numerical argument is returned.
- * SNaNs will get quietened before being returned.
- * minnum() and maxnum correspond to the IEEE 754-2008 minNum()
- * and maxNum() operations. min() and max() are the typical min/max
- * semantics provided by many CPUs which predate that specification.
- *
- * minnummag() and maxnummag() functions correspond to minNumMag()
- * and minNumMag() from the IEEE-754 2008.
+/*
+ * Minimum and maximum
  */
-static FloatParts64 minmax_floats(FloatParts64 a, FloatParts64 b, bool ismin,
-                                bool ieee, bool ismag, float_status *s)
+
+static float16 float16_minmax(float16 a, float16 b, float_status *s, int flags)
 {
-    if (unlikely(is_nan(a.cls) || is_nan(b.cls))) {
-        if (ieee) {
-            /* Takes two floating-point values `a' and `b', one of
-             * which is a NaN, and returns the appropriate NaN
-             * result. If either `a' or `b' is a signaling NaN,
-             * the invalid exception is raised.
-             */
-            if (is_snan(a.cls) || is_snan(b.cls)) {
-                return *parts_pick_nan(&a, &b, s);
-            } else if (is_nan(a.cls) && !is_nan(b.cls)) {
-                return b;
-            } else if (is_nan(b.cls) && !is_nan(a.cls)) {
-                return a;
-            }
-        }
-        return *parts_pick_nan(&a, &b, s);
-    } else {
-        int a_exp, b_exp;
+    FloatParts64 pa, pb;
+    int which;
 
-        switch (a.cls) {
-        case float_class_normal:
-            a_exp = a.exp;
-            break;
-        case float_class_inf:
-            a_exp = INT_MAX;
-            break;
-        case float_class_zero:
-            a_exp = INT_MIN;
-            break;
-        default:
-            g_assert_not_reached();
-            break;
-        }
-        switch (b.cls) {
-        case float_class_normal:
-            b_exp = b.exp;
-            break;
-        case float_class_inf:
-            b_exp = INT_MAX;
-            break;
-        case float_class_zero:
-            b_exp = INT_MIN;
-            break;
-        default:
-            g_assert_not_reached();
-            break;
-        }
-
-        if (ismag && (a_exp != b_exp || a.frac != b.frac)) {
-            bool a_less = a_exp < b_exp;
-            if (a_exp == b_exp) {
-                a_less = a.frac < b.frac;
-            }
-            return a_less ^ ismin ? b : a;
-        }
-
-        if (a.sign == b.sign) {
-            bool a_less = a_exp < b_exp;
-            if (a_exp == b_exp) {
-                a_less = a.frac < b.frac;
-            }
-            return a.sign ^ a_less ^ ismin ? b : a;
-        } else {
-            return a.sign ^ ismin ? b : a;
-        }
+    float16_unpack_canonical(&pa, a, s);
+    float16_unpack_canonical(&pb, b, s);
+    which = parts_minmax(&pa, &pb, s, flags, &float16_params);
+    if (unlikely(which < 0)) {
+        /* Some sort of nan, need to repack default and silenced nans. */
+        return float16_round_pack_canonical(&pa, s);
     }
+    return which ? b : a;
 }
 
-#define MINMAX(sz, name, ismin, isiee, ismag)                           \
-float ## sz float ## sz ## _ ## name(float ## sz a, float ## sz b,      \
-                                     float_status *s)                   \
-{                                                                       \
-    FloatParts64 pa, pb, pr;                                            \
-    float ## sz ## _unpack_canonical(&pa, a, s);                        \
-    float ## sz ## _unpack_canonical(&pb, b, s);                        \
-    pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);                 \
-    return float ## sz ## _round_pack_canonical(&pr, s);                \
+static bfloat16 bfloat16_minmax(bfloat16 a, bfloat16 b,
+                                float_status *s, int flags)
+{
+    FloatParts64 pa, pb;
+    int which;
+
+    bfloat16_unpack_canonical(&pa, a, s);
+    bfloat16_unpack_canonical(&pb, b, s);
+    which = parts_minmax(&pa, &pb, s, flags, &float16_params);
+    if (unlikely(which < 0)) {
+        /* Some sort of nan, need to repack default and silenced nans. */
+        return bfloat16_round_pack_canonical(&pa, s);
+    }
+    return which ? b : a;
 }
 
-MINMAX(16, min, true, false, false)
-MINMAX(16, minnum, true, true, false)
-MINMAX(16, minnummag, true, true, true)
-MINMAX(16, max, false, false, false)
-MINMAX(16, maxnum, false, true, false)
-MINMAX(16, maxnummag, false, true, true)
+static float32 float32_minmax(float32 a, float32 b, float_status *s, int flags)
+{
+    FloatParts64 pa, pb;
+    int which;
 
-MINMAX(32, min, true, false, false)
-MINMAX(32, minnum, true, true, false)
-MINMAX(32, minnummag, true, true, true)
-MINMAX(32, max, false, false, false)
-MINMAX(32, maxnum, false, true, false)
-MINMAX(32, maxnummag, false, true, true)
-
-MINMAX(64, min, true, false, false)
-MINMAX(64, minnum, true, true, false)
-MINMAX(64, minnummag, true, true, true)
-MINMAX(64, max, false, false, false)
-MINMAX(64, maxnum, false, true, false)
-MINMAX(64, maxnummag, false, true, true)
-
-#undef MINMAX
-
-#define BF16_MINMAX(name, ismin, isiee, ismag)                          \
-bfloat16 bfloat16_ ## name(bfloat16 a, bfloat16 b, float_status *s)     \
-{                                                                       \
-    FloatParts64 pa, pb, pr;                                            \
-    bfloat16_unpack_canonical(&pa, a, s);                               \
-    bfloat16_unpack_canonical(&pb, b, s);                               \
-    pr = minmax_floats(pa, pb, ismin, isiee, ismag, s);                 \
-    return bfloat16_round_pack_canonical(&pr, s);                       \
+    float32_unpack_canonical(&pa, a, s);
+    float32_unpack_canonical(&pb, b, s);
+    which = parts_minmax(&pa, &pb, s, flags, &float32_params);
+    if (unlikely(which < 0)) {
+        /* Some sort of nan, need to repack default and silenced nans. */
+        return float32_round_pack_canonical(&pa, s);
+    }
+    return which ? b : a;
 }
 
-BF16_MINMAX(min, true, false, false)
-BF16_MINMAX(minnum, true, true, false)
-BF16_MINMAX(minnummag, true, true, true)
-BF16_MINMAX(max, false, false, false)
-BF16_MINMAX(maxnum, false, true, false)
-BF16_MINMAX(maxnummag, false, true, true)
+static float64 float64_minmax(float64 a, float64 b, float_status *s, int flags)
+{
+    FloatParts64 pa, pb;
+    int which;
 
-#undef BF16_MINMAX
+    float64_unpack_canonical(&pa, a, s);
+    float64_unpack_canonical(&pb, b, s);
+    which = parts_minmax(&pa, &pb, s, flags, &float64_params);
+    if (unlikely(which < 0)) {
+        /* Some sort of nan, need to repack default and silenced nans. */
+        return float64_round_pack_canonical(&pa, s);
+    }
+    return which ? b : a;
+}
+
+#define MINMAX_1(type, name, flags) \
+    type type##_##name(type a, type b, float_status *s) \
+    { return type##_minmax(a, b, s, flags); }
+
+#define MINMAX_2(type) \
+    MINMAX_1(type, max, 0)                                      \
+    MINMAX_1(type, maxnum, minmax_isnum)                        \
+    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)      \
+    MINMAX_1(type, min, minmax_ismin)                           \
+    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
+    MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag)
+
+MINMAX_2(float16)
+MINMAX_2(bfloat16)
+MINMAX_2(float32)
+MINMAX_2(float64)
+
+#undef MINMAX_1
+#undef MINMAX_2
 
 /* Floating point compare */
 static FloatRelation compare_floats(FloatParts64 a, FloatParts64 b, bool is_quiet,
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index f3c4f8c8d2..d68ab8fee0 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -936,3 +936,84 @@ static void partsN(uint_to_float)(FloatPartsN *p, uint64_t a,
         p->frac_hi = a << shift;
     }
 }
+
+/*
+ * Float min/max.
+ *
+ * Return -1 to return the chosen nan in *a;
+ * return 0 to use the a input unchanged; 1 to use the b input unchanged.
+ */
+static int partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
+                          float_status *s, int flags, const FloatFmt *fmt)
+{
+    int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
+    int a_exp, b_exp, cmp;
+
+    if (unlikely(ab_mask & float_cmask_anynan)) {
+        /*
+         * For minnum/maxnum, if one operand is a QNaN, and the other
+         * operand is numerical, then return numerical argument.
+         */
+        if ((flags & minmax_isnum)
+            && !(ab_mask & float_cmask_snan)
+            && (ab_mask & ~float_cmask_qnan)) {
+            return is_nan(a->cls);
+        }
+        *a = *parts_pick_nan(a, b, s);
+        return -1;
+    }
+
+    a_exp = a->exp;
+    b_exp = b->exp;
+
+    if (unlikely(ab_mask != float_cmask_normal)) {
+        switch (a->cls) {
+        case float_class_normal:
+            break;
+        case float_class_inf:
+            a_exp = INT16_MAX;
+            break;
+        case float_class_zero:
+            a_exp = INT16_MIN;
+            break;
+        default:
+            g_assert_not_reached();
+            break;
+        }
+        switch (b->cls) {
+        case float_class_normal:
+            break;
+        case float_class_inf:
+            b_exp = INT16_MAX;
+            break;
+        case float_class_zero:
+            b_exp = INT16_MIN;
+            break;
+        default:
+            g_assert_not_reached();
+            break;
+        }
+    }
+
+    /* Compare magnitudes. */
+    cmp = a_exp - b_exp;
+    if (cmp == 0) {
+        cmp = frac_cmp(a, b);
+    }
+
+    /*
+     * Take the sign into account.
+     * For ismag, only do this if the magnitudes are equal.
+     */
+    if (!(flags & minmax_ismag) || cmp == 0) {
+        if (a->sign != b->sign) {
+            /* For differing signs, the negative operand is less. */
+            cmp = a->sign ? -1 : 1;
+        } else if (a->sign) {
+            /* For two negative operands, invert the magnitude comparison. */
+            cmp = -cmp;
+        }
+    }
+
+    return (cmp < 0) ^ !!(flags & minmax_ismin);
+}
-- 
2.25.1


