Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3FF376EC3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:29:45 +0200 (CEST)
Received: from localhost ([::1]:34916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCiu-0007SU-EQ
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC84-00031y-A9
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:40 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:56035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC81-0005TG-Pc
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id gj14so6202079pjb.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YFLKka0iYCXD41zHCVcvWrqgkoEzdfWn73QZrRjsYNY=;
 b=abEIsfOsqPKfS2cbgywp1cLBCn0g/xw6dRoNcSHBMQ8I8O8NUaej+enLAQQdq7Sxe2
 K8ix1ndNL6XTeuDaApFfum7VCUaX4r24ZW+h37LMxd5e/BzNm5I1Py78JuICII+Lm7y5
 AEh60pTbtcVvrcneXA220DLWAZMtvj8iySc0FgPtyEyz5wg3xVAl2KFnvy7h+CAGci+a
 vUZ4NH5CnSMGHY/2nwSfRlS9922bLafgis682snva6SReX3dU92ahIm7jX4vApy97GwO
 SINbn205Y4SEbkKv0j9SzkFrfPHEGqW1h54lcM/q2r3rVa6Iyb/GTDSnRVv7P4RSb5iv
 15oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YFLKka0iYCXD41zHCVcvWrqgkoEzdfWn73QZrRjsYNY=;
 b=pc+xFa2zHy+M08LGS8S9m2C3qs6JPpnOccZWASoeXPp/LvWnAlCOjB3ztY7dpnFFx/
 dmT7P3YcfZU9XJ6kw77GCQA8oJSp/teVC04MyjnAyf/0gqZTGaqUkiIR8ozJ62w0JUbe
 DPDv5QB76qmagruqUPx0jweeD0veEsR2jK6W01ohuYM+OkpDC5OoBhsqw4uJth3sjt26
 8rx0j1nqsrHnUlbGAPzYBpDIJVQtquho/qFIIG8AIu43qfUpXIGJGFDLR47yMF1Hl06Z
 sVk7FtUaRCrnCEHmLCYZm49KzF0jx1NPkblyYH6+FfvsMeRO4bWPaX0z+IK6bJiKS42t
 5CuA==
X-Gm-Message-State: AOAM530f4oRvqw/zZ91Wa7Vr1WXH1LQWeK++VIO1rmQ91sDjaK7WwW27
 WeA5qNm0T50nLUn7wji43ncAReMwuV5B3A==
X-Google-Smtp-Source: ABdhPJwGleZDKua6aBeL3/bAJ+aN7t0Zp60cvf1B/4vb4MY7TXaaPlLL5VbvsCqTBk4lidT0Ewro3g==
X-Received: by 2002:a17:90a:9f02:: with SMTP id
 n2mr26923831pjp.190.1620438696366; 
 Fri, 07 May 2021 18:51:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 50/72] softfloat: Move minmax_flags to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:40 -0700
Message-Id: <20210508014802.892561-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
 fpu/softfloat-parts.c.inc |  69 ++++++++++++
 2 files changed, 158 insertions(+), 127 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 586ea5d67a..4c04e88a3a 100644
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
+    minmax_ismag = 4 | minmax_isnum
+};
 
 /* Simple helpers for checking if, or what kind of, NaN we have */
 static inline __attribute__((unused)) bool is_nan(FloatClass c)
@@ -864,6 +873,14 @@ static void parts128_uint_to_float(FloatParts128 *p, uint64_t a,
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
@@ -3257,145 +3274,90 @@ float128 uint64_to_float128(uint64_t a, float_status *status)
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
+    MINMAX_1(type, maxnummag, minmax_ismag)                     \
+    MINMAX_1(type, min, minmax_ismin)                           \
+    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
+    MINMAX_1(type, minnummag, minmax_ismin | minmax_ismag)
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
index f3c4f8c8d2..4d91ef0d32 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -936,3 +936,72 @@ static void partsN(uint_to_float)(FloatPartsN *p, uint64_t a,
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
+    int a_exp, b_exp;
+    bool a_less;
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
+            a_exp = INT_MAX;
+            break;
+        case float_class_zero:
+            a_exp = INT_MIN;
+            break;
+        default:
+            g_assert_not_reached();
+            break;
+        }
+        switch (b->cls) {
+        case float_class_normal:
+            break;
+        case float_class_inf:
+            b_exp = INT_MAX;
+            break;
+        case float_class_zero:
+            b_exp = INT_MIN;
+            break;
+        default:
+            g_assert_not_reached();
+            break;
+        }
+    }
+
+    if (a->sign != b->sign && !(flags & minmax_ismag)) {
+        a_less = a->sign;
+    } else if (a_exp != b_exp) {
+        a_less = a_exp < b_exp;
+    } else {
+        a_less = frac_cmp(a, b) < 0;
+    }
+    return a_less ^ !!(flags & minmax_ismin);
+}
-- 
2.25.1


