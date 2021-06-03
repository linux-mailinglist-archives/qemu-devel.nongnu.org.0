Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2139AD12
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:44:41 +0200 (CEST)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lov8q-0001sx-5K
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5v-00020o-2q
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:39 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:50901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5s-00011T-O3
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:38 -0400
Received: by mail-pj1-x102b.google.com with SMTP id i22so4470922pju.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZyqAk3JV1lMheoleEpLdtdhruI6JP69rj7H32n7LYXs=;
 b=RSVhTeGQm/Y7zgKdYqb0hfCRi7df6m1rpJB9L5tyag2dP+VEPzb8nUAfw8o+mBdklf
 l3Rzwk5pIcusQf0Gfmc7M2LRDYD9m3Y6ajgsBmBC+bCOvWIq4tbmakoIATPFI8aIKUtN
 rdgY4gVLJBFtN+gbApAAnRRAMyqWOCgzRdNmyAaxj5S5xI+gm7eLR9EbpcIA7kbgIjZC
 Z/Axjr7nzyA5G18Zzhnxa7vfXvlhOX99OnA/xS4Uw/7AzDbr7giE4wRfMA1adP2k1BTu
 rpzIvh6hWkdh09XBmbq7IgJ1Nfno7s/s/dccNRBhWxqG8ia+mbIIjwgkALZbcAGzQXJh
 2vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZyqAk3JV1lMheoleEpLdtdhruI6JP69rj7H32n7LYXs=;
 b=LzAlBmSik1crI2bkgrhPIRFS+BoKCCoYnrsh7OQUvnFmuqd8AiRj7M21thh0uJeQBF
 h4VOaZ4P+Le2ReSzyXhz/6jNQTcpxU04oJ/4n7ERDORbQ08Eqq1jjGSQSpV77GchdIfN
 pxiHSn9RKVXAQ58mtmnIf0z4ACoYztoRyDchq7xEASXZar9dR4EoP3AuIReN52TMvTXO
 J+sxvu2UNogi3T5Im3wAU7/OtE06XnMhBnBFkzB57nYcloNdCYOaSOdRHI/pWpdEFv1m
 LP7bWgz6EtMTm6IE1vZzh0JiOB6uIZYcuioOVScUgUJGF6sHpuzsyXWgPhHU2N0j/ncU
 makQ==
X-Gm-Message-State: AOAM530UUfTETpBbyHLfvFT3FxR7AIdHSuLvkO8jU9JZm9FtuitRF7Ag
 Z6M/PEEkz4dQU7z3Y8DJUf4LH4hQ9e+Eew==
X-Google-Smtp-Source: ABdhPJzHsRHSVHsTLbg+/IZUDLxUpA5ivvPW+gm1hP55PkVrXNHA0HTiVXLY+2YmB7v01qQxl1q8NQ==
X-Received: by 2002:a17:902:728c:b029:f6:6aff:4d66 with SMTP id
 d12-20020a170902728cb02900f66aff4d66mr1114100pll.20.1622756495406; 
 Thu, 03 Jun 2021 14:41:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/29] softfloat: Move minmax_flags to softfloat-parts.c.inc
Date: Thu,  3 Jun 2021 14:41:06 -0700
Message-Id: <20210603214131.629841-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to parts$N_minmax.  Combine 3 bool arguments to a bitmask.
Introduce ftype_minmax functions as a common optimization point.
Fold bfloat16 expansions into the same macro as the other types.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 198 ++++++++++++++------------------------
 fpu/softfloat-parts.c.inc |  80 +++++++++++++++
 2 files changed, 152 insertions(+), 126 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index db14bd09aa..ef750e1e95 100644
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
 
+static FloatParts64 *parts64_minmax(FloatParts64 *a, FloatParts64 *b,
+                                    float_status *s, int flags);
+static FloatParts128 *parts128_minmax(FloatParts128 *a, FloatParts128 *b,
+                                      float_status *s, int flags);
+
+#define parts_minmax(A, B, S, F) \
+    PARTS_GENERIC_64_128(minmax, A)(A, B, S, F)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -3258,145 +3275,74 @@ float128 uint64_to_float128(uint64_t a, float_status *status)
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
+    FloatParts64 pa, pb, *pr;
 
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
+    float16_unpack_canonical(&pa, a, s);
+    float16_unpack_canonical(&pb, b, s);
+    pr = parts_minmax(&pa, &pb, s, flags);
 
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
-    }
+    return float16_round_pack_canonical(pr, s);
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
+    FloatParts64 pa, pb, *pr;
+
+    bfloat16_unpack_canonical(&pa, a, s);
+    bfloat16_unpack_canonical(&pb, b, s);
+    pr = parts_minmax(&pa, &pb, s, flags);
+
+    return bfloat16_round_pack_canonical(pr, s);
 }
 
-MINMAX(16, min, true, false, false)
-MINMAX(16, minnum, true, true, false)
-MINMAX(16, minnummag, true, true, true)
-MINMAX(16, max, false, false, false)
-MINMAX(16, maxnum, false, true, false)
-MINMAX(16, maxnummag, false, true, true)
+static float32 float32_minmax(float32 a, float32 b, float_status *s, int flags)
+{
+    FloatParts64 pa, pb, *pr;
 
-MINMAX(32, min, true, false, false)
-MINMAX(32, minnum, true, true, false)
-MINMAX(32, minnummag, true, true, true)
-MINMAX(32, max, false, false, false)
-MINMAX(32, maxnum, false, true, false)
-MINMAX(32, maxnummag, false, true, true)
+    float32_unpack_canonical(&pa, a, s);
+    float32_unpack_canonical(&pb, b, s);
+    pr = parts_minmax(&pa, &pb, s, flags);
 
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
+    return float32_round_pack_canonical(pr, s);
 }
 
-BF16_MINMAX(min, true, false, false)
-BF16_MINMAX(minnum, true, true, false)
-BF16_MINMAX(minnummag, true, true, true)
-BF16_MINMAX(max, false, false, false)
-BF16_MINMAX(maxnum, false, true, false)
-BF16_MINMAX(maxnummag, false, true, true)
+static float64 float64_minmax(float64 a, float64 b, float_status *s, int flags)
+{
+    FloatParts64 pa, pb, *pr;
 
-#undef BF16_MINMAX
+    float64_unpack_canonical(&pa, a, s);
+    float64_unpack_canonical(&pb, b, s);
+    pr = parts_minmax(&pa, &pb, s, flags);
+
+    return float64_round_pack_canonical(pr, s);
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
index 2eb7bb96b3..b9094768db 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -938,3 +938,83 @@ static void partsN(uint_to_float)(FloatPartsN *p, uint64_t a,
         p->frac_hi = a << shift;
     }
 }
+
+/*
+ * Float min/max.
+ */
+static FloatPartsN *partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
+                                   float_status *s, int flags)
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
+            return is_nan(a->cls) ? b : a;
+        }
+        return parts_pick_nan(a, b, s);
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
+    if (flags & minmax_ismin) {
+        cmp = -cmp;
+    }
+    return cmp < 0 ? b : a;
+}
-- 
2.25.1


