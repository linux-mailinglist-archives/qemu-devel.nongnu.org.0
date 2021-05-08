Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF52376EED
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:44:26 +0200 (CEST)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCx7-0007X5-Jq
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8S-0003Yg-VS
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:52917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8G-0005cG-8q
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:04 -0400
Received: by mail-pj1-x1031.google.com with SMTP id ge1so6202803pjb.2
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jyFTCsiIz4vQ/b29mHqKyxCY82vLhUnZ9Ckfj2MLd9w=;
 b=K5Ouhzh59Gfkgrr3h9fFkv4zdpIee3dmJ5BazJRK2y8CKVz+4tmrt6sN/XTXPATNdS
 J+0zI8KaJepy+9eehy42hoaUJXoXwpo5VnSQw8fPJ0Af2u8ep8jYggOAPRwP9Ks8PxRH
 SlmKtPWykgVUx9n8/TW2VbcFyhJs6AFwnjTthHMsOkzgIjeRv7QxVnPPE+tfePyPKX3y
 Hx7iyY86v71T7zZPl9i7ALrlid2vo8hY5iNi4P6b3CcnDaDdrB5jPCdUsi+mgKxTzegE
 crWFBBikbxcy7ZOisocpzVi15ifJCJbFJKWK+Mat0tU3QbH2+Ixusk/Lc1aqz+AvgNjY
 MNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jyFTCsiIz4vQ/b29mHqKyxCY82vLhUnZ9Ckfj2MLd9w=;
 b=Ab+Yo3Ru103DNxuV0PockGLYJ6ZnHo2ZwYWAtJO0VWcbaJQQEyNhm09rNAWcOeGeYe
 ep9kB7p39akDKFYH3Wg/RWm8UQyThpID1lGlZEptiBSBKEwZJKs4mI2410rCBJut2/ga
 uYp2RlO8EVxahMR8XZRxuBa0cD0ILbjrAw2um+HVuhCi34xInOK29HGmjKnFDuPFyrqS
 v5n1QZ6zKr4ai9+EnINY3AvCW7xSc9WgCLV9Lx2QGpYou7AvLSGEmBsWFXukbF0d9+6R
 au/ztPn8jvlteFnp6FR6Hb9SYiTXKBPOBjpNCiLZ9GW0+NRAz2FMxlh5HYLpeJV2I6KE
 4gBw==
X-Gm-Message-State: AOAM531/XeN80v6kiJvS0vgin3xN2arFt7x39kJnVfpwM5D1iJvQUxJs
 KlGdLvfecz3ykaOUJwosn7Mo+VhL+GpmGw==
X-Google-Smtp-Source: ABdhPJwIc6l3lP5LUouqmTTzioIOV3AexYUJs5b9ew7PUQ4/9skkXw/clDa7sn1MpltQgPTUxo3/wA==
X-Received: by 2002:a17:903:4091:b029:ec:fbd2:3192 with SMTP id
 z17-20020a1709034091b02900ecfbd23192mr12855673plc.21.1620438710496; 
 Fri, 07 May 2021 18:51:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 72/72] softfloat: Convert modrem operations to FloatParts
Date: Fri,  7 May 2021 18:48:02 -0700
Message-Id: <20210508014802.892561-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Rename to parts$N_modrem.  This was the last use of a lot
of the legacy infrastructure, so remove it as required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h |   34 +
 fpu/softfloat.c                | 1339 +++++++-------------------------
 fpu/softfloat-parts.c.inc      |   34 +
 fpu/softfloat-specialize.c.inc |  165 ----
 4 files changed, 329 insertions(+), 1243 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index ec4e27a595..81c3fe8256 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -745,4 +745,38 @@ static inline bool ne128(uint64_t a0, uint64_t a1, uint64_t b0, uint64_t b1)
     return a0 != b0 || a1 != b1;
 }
 
+/*
+ * Similarly, comparisons of 192-bit values.
+ */
+
+static inline bool eq192(uint64_t a0, uint64_t a1, uint64_t a2,
+                         uint64_t b0, uint64_t b1, uint64_t b2)
+{
+    return ((a0 ^ b0) | (a1 ^ b1) | (a2 ^ b2)) == 0;
+}
+
+static inline bool le192(uint64_t a0, uint64_t a1, uint64_t a2,
+                         uint64_t b0, uint64_t b1, uint64_t b2)
+{
+    if (a0 != b0) {
+        return a0 < b0;
+    }
+    if (a1 != b1) {
+        return a1 < b1;
+    }
+    return a2 <= b2;
+}
+
+static inline bool lt192(uint64_t a0, uint64_t a1, uint64_t a2,
+                         uint64_t b0, uint64_t b1, uint64_t b2)
+{
+    if (a0 != b0) {
+        return a0 < b0;
+    }
+    if (a1 != b1) {
+        return a1 < b1;
+    }
+    return a2 < b2;
+}
+
 #endif
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 3823a7ec6f..7376b3470c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -401,60 +401,6 @@ float64_gen2(float64 xa, float64 xb, float_status *s,
     return soft(ua.s, ub.s, s);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the fraction bits of the single-precision floating-point value `a'.
-*----------------------------------------------------------------------------*/
-
-static inline uint32_t extractFloat32Frac(float32 a)
-{
-    return float32_val(a) & 0x007FFFFF;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the exponent bits of the single-precision floating-point value `a'.
-*----------------------------------------------------------------------------*/
-
-static inline int extractFloat32Exp(float32 a)
-{
-    return (float32_val(a) >> 23) & 0xFF;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the sign bit of the single-precision floating-point value `a'.
-*----------------------------------------------------------------------------*/
-
-static inline bool extractFloat32Sign(float32 a)
-{
-    return float32_val(a) >> 31;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the fraction bits of the double-precision floating-point value `a'.
-*----------------------------------------------------------------------------*/
-
-static inline uint64_t extractFloat64Frac(float64 a)
-{
-    return float64_val(a) & UINT64_C(0x000FFFFFFFFFFFFF);
-}
-
-/*----------------------------------------------------------------------------
-| Returns the exponent bits of the double-precision floating-point value `a'.
-*----------------------------------------------------------------------------*/
-
-static inline int extractFloat64Exp(float64 a)
-{
-    return (float64_val(a) >> 52) & 0x7FF;
-}
-
-/*----------------------------------------------------------------------------
-| Returns the sign bit of the double-precision floating-point value `a'.
-*----------------------------------------------------------------------------*/
-
-static inline bool extractFloat64Sign(float64 a)
-{
-    return float64_val(a) >> 63;
-}
-
 /*
  * Classify a floating point number. Everything above float_class_qnan
  * is a NaN so cls >= float_class_qnan is any NaN.
@@ -844,6 +790,14 @@ static FloatParts128 *parts128_div(FloatParts128 *a, FloatParts128 *b,
 #define parts_div(A, B, S) \
     PARTS_GENERIC_64_128(div, A)(A, B, S)
 
+static FloatParts64 *parts64_modrem(FloatParts64 *a, FloatParts64 *b,
+                                    uint64_t *mod_quot, float_status *s);
+static FloatParts128 *parts128_modrem(FloatParts128 *a, FloatParts128 *b,
+                                      uint64_t *mod_quot, float_status *s);
+
+#define parts_modrem(A, B, Q, S) \
+    PARTS_GENERIC_64_128(modrem, A)(A, B, Q, S)
+
 static void parts64_sqrt(FloatParts64 *a, float_status *s, const FloatFmt *f);
 static void parts128_sqrt(FloatParts128 *a, float_status *s, const FloatFmt *f);
 
@@ -1228,6 +1182,186 @@ static int frac256_normalize(FloatParts256 *a)
 
 #define frac_normalize(A)  FRAC_GENERIC_64_128_256(normalize, A)(A)
 
+static void frac64_modrem(FloatParts64 *a, FloatParts64 *b, uint64_t *mod_quot)
+{
+    uint64_t a0, a1, b0, t0, t1, q, quot;
+    int exp_diff = a->exp - b->exp;
+    int shift;
+
+    a0 = a->frac;
+    a1 = 0;
+
+    if (exp_diff < -1) {
+        if (mod_quot) {
+            *mod_quot = 0;
+        }
+        return;
+    }
+    if (exp_diff == -1) {
+        a0 >>= 1;
+        exp_diff = 0;
+    }
+
+    b0 = b->frac;
+    quot = q = b0 <= a0;
+    if (q) {
+        a0 -= b0;
+    }
+
+    exp_diff -= 64;
+    while (exp_diff > 0) {
+        q = estimateDiv128To64(a0, a1, b0);
+        q = q > 2 ? q - 2 : 0;
+        mul64To128(b0, q, &t0, &t1);
+        sub128(a0, a1, t0, t1, &a0, &a1);
+        shortShift128Left(a0, a1, 62, &a0, &a1);
+        exp_diff -= 62;
+        quot = (quot << 62) + q;
+    }
+
+    exp_diff += 64;
+    if (exp_diff > 0) {
+        q = estimateDiv128To64(a0, a1, b0);
+        q = q > 2 ? (q - 2) >> (64 - exp_diff) : 0;
+        mul64To128(b0, q << (64 - exp_diff), &t0, &t1);
+        sub128(a0, a1, t0, t1, &a0, &a1);
+        shortShift128Left(0, b0, 64 - exp_diff, &t0, &t1);
+        while (le128(t0, t1, a0, a1)) {
+            ++q;
+            sub128(a0, a1, t0, t1, &a0, &a1);
+        }
+        quot = (exp_diff < 64 ? quot << exp_diff : 0) + q;
+    } else {
+        t0 = b0;
+        t1 = 0;
+    }
+
+    if (mod_quot) {
+        *mod_quot = quot;
+    } else {
+        sub128(t0, t1, a0, a1, &t0, &t1);
+        if (lt128(t0, t1, a0, a1) ||
+            (eq128(t0, t1, a0, a1) && (q & 1))) {
+            a0 = t0;
+            a1 = t1;
+            a->sign = !a->sign;
+        }
+    }
+
+    if (likely(a0)) {
+        shift = clz64(a0);
+        shortShift128Left(a0, a1, shift, &a0, &a1);
+    } else if (likely(a1)) {
+        shift = clz64(a1);
+        a0 = a1 << shift;
+        a1 = 0;
+        shift += 64;
+    } else {
+        a->cls = float_class_zero;
+        return;
+    }
+
+    a->exp = b->exp + exp_diff - shift;
+    a->frac = a0 | (a1 != 0);
+}
+
+static void frac128_modrem(FloatParts128 *a, FloatParts128 *b,
+                           uint64_t *mod_quot)
+{
+    uint64_t a0, a1, a2, b0, b1, t0, t1, t2, q, quot;
+    int exp_diff = a->exp - b->exp;
+    int shift;
+
+    a0 = a->frac_hi;
+    a1 = a->frac_lo;
+    a2 = 0;
+
+    if (exp_diff < -1) {
+        if (mod_quot) {
+            *mod_quot = 0;
+        }
+        return;
+    }
+    if (exp_diff == -1) {
+        shift128Right(a0, a1, 1, &a0, &a1);
+        exp_diff = 0;
+    }
+
+    b0 = b->frac_hi;
+    b1 = b->frac_lo;
+
+    quot = q = le128(b0, b1, a0, a1);
+    if (q) {
+        sub128(a0, a1, b0, b1, &a0, &a1);
+    }
+
+    exp_diff -= 64;
+    while (exp_diff > 0) {
+        q = estimateDiv128To64(a0, a1, b0);
+        q = q > 4 ? q - 4 : 0;
+        mul128By64To192(b0, b1, q, &t0, &t1, &t2);
+        sub192(a0, a1, a2, t0, t1, t2, &a0, &a1, &a2);
+        shortShift192Left(a0, a1, a2, 61, &a0, &a1, &a2);
+        exp_diff -= 61;
+        quot = (quot << 61) + q;
+    }
+
+    exp_diff += 64;
+    if (exp_diff > 0) {
+        q = estimateDiv128To64(a0, a1, b0);
+        q = q > 4 ? (q - 4) >> (64 - exp_diff) : 0;
+        mul128By64To192(b0, b1, q << (64 - exp_diff), &t0, &t1, &t2);
+        sub192(a0, a1, a2, t0, t1, t2, &a0, &a1, &a2);
+        shortShift192Left(0, b0, b1, 64 - exp_diff, &t0, &t1, &t2);
+        while (le192(t0, t1, t2, a0, a1, a2)) {
+            ++q;
+            sub192(a0, a1, a2, t0, t1, t2, &a0, &a1, &a2);
+        }
+        quot = (exp_diff < 64 ? quot << exp_diff : 0) + q;
+    } else {
+        t0 = b0;
+        t1 = b1;
+        t2 = 0;
+    }
+
+    if (mod_quot) {
+        *mod_quot = quot;
+    } else {
+        sub192(t0, t1, t2, a0, a1, a2, &t0, &t1, &t2);
+        if (lt192(t0, t1, t2, a0, a1, a2) ||
+            (eq192(t0, t1, t2, a0, a1, a2) && (q & 1))) {
+            a0 = t0;
+            a1 = t1;
+            a2 = t2;
+            a->sign = !a->sign;
+        }
+    }
+
+    if (likely(a0)) {
+        shift = clz64(a0);
+        shortShift192Left(a0, a1, a2, shift, &a0, &a1, &a2);
+    } else if (likely(a1)) {
+        shift = clz64(a1);
+        shortShift128Left(a1, a2, shift, &a0, &a1);
+        a2 = 0;
+        shift += 64;
+    } else if (likely(a2)) {
+        shift = clz64(a2);
+        a0 = a2 << shift;
+        a1 = a2 = 0;
+        shift += 128;
+    } else {
+        a->cls = float_class_zero;
+        return;
+    }
+
+    a->exp = b->exp + exp_diff - shift;
+    a->frac_hi = a0;
+    a->frac_lo = a1 | (a2 != 0);
+}
+
+#define frac_modrem(A, B, Q)  FRAC_GENERIC_64_128(modrem, A)(A, B, Q)
+
 static void frac64_shl(FloatParts64 *a, int c)
 {
     a->frac <<= c;
@@ -2312,6 +2446,79 @@ floatx80 floatx80_div(floatx80 a, floatx80 b, float_status *status)
     return floatx80_round_pack_canonical(pr, status);
 }
 
+/*
+ * Remainder
+ */
+
+float32 float32_rem(float32 a, float32 b, float_status *status)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float32_unpack_canonical(&pa, a, status);
+    float32_unpack_canonical(&pb, b, status);
+    pr = parts_modrem(&pa, &pb, NULL, status);
+
+    return float32_round_pack_canonical(pr, status);
+}
+
+float64 float64_rem(float64 a, float64 b, float_status *status)
+{
+    FloatParts64 pa, pb, *pr;
+
+    float64_unpack_canonical(&pa, a, status);
+    float64_unpack_canonical(&pb, b, status);
+    pr = parts_modrem(&pa, &pb, NULL, status);
+
+    return float64_round_pack_canonical(pr, status);
+}
+
+float128 float128_rem(float128 a, float128 b, float_status *status)
+{
+    FloatParts128 pa, pb, *pr;
+
+    float128_unpack_canonical(&pa, a, status);
+    float128_unpack_canonical(&pb, b, status);
+    pr = parts_modrem(&pa, &pb, NULL, status);
+
+    return float128_round_pack_canonical(pr, status);
+}
+
+/*
+ * Returns the remainder of the extended double-precision floating-point value
+ * `a' with respect to the corresponding value `b'.
+ * If 'mod' is false, the operation is performed according to the IEC/IEEE
+ * Standard for Binary Floating-Point Arithmetic.  If 'mod' is true, return
+ * the remainder based on truncating the quotient toward zero instead and
+ * *quotient is set to the low 64 bits of the absolute value of the integer
+ * quotient.
+ */
+floatx80 floatx80_modrem(floatx80 a, floatx80 b, bool mod,
+                         uint64_t *quotient, float_status *status)
+{
+    FloatParts128 pa, pb, *pr;
+
+    *quotient = 0;
+    if (!floatx80_unpack_canonical(&pa, a, status) ||
+        !floatx80_unpack_canonical(&pb, b, status)) {
+        return floatx80_default_nan(status);
+    }
+    pr = parts_modrem(&pa, &pb, mod ? quotient : NULL, status);
+
+    return floatx80_round_pack_canonical(pr, status);
+}
+
+floatx80 floatx80_rem(floatx80 a, floatx80 b, float_status *status)
+{
+    uint64_t quotient;
+    return floatx80_modrem(a, b, false, &quotient, status);
+}
+
+floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *status)
+{
+    uint64_t quotient;
+    return floatx80_modrem(a, b, true, &quotient, status);
+}
+
 /*
  * Float to Float conversions
  *
@@ -4264,300 +4471,6 @@ bfloat16 bfloat16_squash_input_denormal(bfloat16 a, float_status *status)
     return a;
 }
 
-/*----------------------------------------------------------------------------
-| Normalizes the subnormal single-precision floating-point value represented
-| by the denormalized significand `aSig'.  The normalized exponent and
-| significand are stored at the locations pointed to by `zExpPtr' and
-| `zSigPtr', respectively.
-*----------------------------------------------------------------------------*/
-
-static void
- normalizeFloat32Subnormal(uint32_t aSig, int *zExpPtr, uint32_t *zSigPtr)
-{
-    int8_t shiftCount;
-
-    shiftCount = clz32(aSig) - 8;
-    *zSigPtr = aSig<<shiftCount;
-    *zExpPtr = 1 - shiftCount;
-
-}
-
-/*----------------------------------------------------------------------------
-| Takes an abstract floating-point value having sign `zSign', exponent `zExp',
-| and significand `zSig', and returns the proper single-precision floating-
-| point value corresponding to the abstract input.  Ordinarily, the abstract
-| value is simply rounded and packed into the single-precision format, with
-| the inexact exception raised if the abstract input cannot be represented
-| exactly.  However, if the abstract value is too large, the overflow and
-| inexact exceptions are raised and an infinity or maximal finite value is
-| returned.  If the abstract value is too small, the input value is rounded to
-| a subnormal number, and the underflow and inexact exceptions are raised if
-| the abstract input cannot be represented exactly as a subnormal single-
-| precision floating-point number.
-|     The input significand `zSig' has its binary point between bits 30
-| and 29, which is 7 bits to the left of the usual location.  This shifted
-| significand must be normalized or smaller.  If `zSig' is not normalized,
-| `zExp' must be 0; in that case, the result returned is a subnormal number,
-| and it must not require rounding.  In the usual case that `zSig' is
-| normalized, `zExp' must be 1 less than the ``true'' floating-point exponent.
-| The handling of underflow and overflow follows the IEC/IEEE Standard for
-| Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-static float32 roundAndPackFloat32(bool zSign, int zExp, uint32_t zSig,
-                                   float_status *status)
-{
-    int8_t roundingMode;
-    bool roundNearestEven;
-    int8_t roundIncrement, roundBits;
-    bool isTiny;
-
-    roundingMode = status->float_rounding_mode;
-    roundNearestEven = ( roundingMode == float_round_nearest_even );
-    switch (roundingMode) {
-    case float_round_nearest_even:
-    case float_round_ties_away:
-        roundIncrement = 0x40;
-        break;
-    case float_round_to_zero:
-        roundIncrement = 0;
-        break;
-    case float_round_up:
-        roundIncrement = zSign ? 0 : 0x7f;
-        break;
-    case float_round_down:
-        roundIncrement = zSign ? 0x7f : 0;
-        break;
-    case float_round_to_odd:
-        roundIncrement = zSig & 0x80 ? 0 : 0x7f;
-        break;
-    default:
-        abort();
-        break;
-    }
-    roundBits = zSig & 0x7F;
-    if ( 0xFD <= (uint16_t) zExp ) {
-        if (    ( 0xFD < zExp )
-             || (    ( zExp == 0xFD )
-                  && ( (int32_t) ( zSig + roundIncrement ) < 0 ) )
-           ) {
-            bool overflow_to_inf = roundingMode != float_round_to_odd &&
-                                   roundIncrement != 0;
-            float_raise(float_flag_overflow | float_flag_inexact, status);
-            return packFloat32(zSign, 0xFF, -!overflow_to_inf);
-        }
-        if ( zExp < 0 ) {
-            if (status->flush_to_zero) {
-                float_raise(float_flag_output_denormal, status);
-                return packFloat32(zSign, 0, 0);
-            }
-            isTiny = status->tininess_before_rounding
-                  || (zExp < -1)
-                  || (zSig + roundIncrement < 0x80000000);
-            shift32RightJamming( zSig, - zExp, &zSig );
-            zExp = 0;
-            roundBits = zSig & 0x7F;
-            if (isTiny && roundBits) {
-                float_raise(float_flag_underflow, status);
-            }
-            if (roundingMode == float_round_to_odd) {
-                /*
-                 * For round-to-odd case, the roundIncrement depends on
-                 * zSig which just changed.
-                 */
-                roundIncrement = zSig & 0x80 ? 0 : 0x7f;
-            }
-        }
-    }
-    if (roundBits) {
-        float_raise(float_flag_inexact, status);
-    }
-    zSig = ( zSig + roundIncrement )>>7;
-    if (!(roundBits ^ 0x40) && roundNearestEven) {
-        zSig &= ~1;
-    }
-    if ( zSig == 0 ) zExp = 0;
-    return packFloat32( zSign, zExp, zSig );
-
-}
-
-/*----------------------------------------------------------------------------
-| Takes an abstract floating-point value having sign `zSign', exponent `zExp',
-| and significand `zSig', and returns the proper single-precision floating-
-| point value corresponding to the abstract input.  This routine is just like
-| `roundAndPackFloat32' except that `zSig' does not have to be normalized.
-| Bit 31 of `zSig' must be zero, and `zExp' must be 1 less than the ``true''
-| floating-point exponent.
-*----------------------------------------------------------------------------*/
-
-static float32
- normalizeRoundAndPackFloat32(bool zSign, int zExp, uint32_t zSig,
-                              float_status *status)
-{
-    int8_t shiftCount;
-
-    shiftCount = clz32(zSig) - 1;
-    return roundAndPackFloat32(zSign, zExp - shiftCount, zSig<<shiftCount,
-                               status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Normalizes the subnormal double-precision floating-point value represented
-| by the denormalized significand `aSig'.  The normalized exponent and
-| significand are stored at the locations pointed to by `zExpPtr' and
-| `zSigPtr', respectively.
-*----------------------------------------------------------------------------*/
-
-static void
- normalizeFloat64Subnormal(uint64_t aSig, int *zExpPtr, uint64_t *zSigPtr)
-{
-    int8_t shiftCount;
-
-    shiftCount = clz64(aSig) - 11;
-    *zSigPtr = aSig<<shiftCount;
-    *zExpPtr = 1 - shiftCount;
-
-}
-
-/*----------------------------------------------------------------------------
-| Packs the sign `zSign', exponent `zExp', and significand `zSig' into a
-| double-precision floating-point value, returning the result.  After being
-| shifted into the proper positions, the three fields are simply added
-| together to form the result.  This means that any integer portion of `zSig'
-| will be added into the exponent.  Since a properly normalized significand
-| will have an integer portion equal to 1, the `zExp' input should be 1 less
-| than the desired result exponent whenever `zSig' is a complete, normalized
-| significand.
-*----------------------------------------------------------------------------*/
-
-static inline float64 packFloat64(bool zSign, int zExp, uint64_t zSig)
-{
-
-    return make_float64(
-        ( ( (uint64_t) zSign )<<63 ) + ( ( (uint64_t) zExp )<<52 ) + zSig);
-
-}
-
-/*----------------------------------------------------------------------------
-| Takes an abstract floating-point value having sign `zSign', exponent `zExp',
-| and significand `zSig', and returns the proper double-precision floating-
-| point value corresponding to the abstract input.  Ordinarily, the abstract
-| value is simply rounded and packed into the double-precision format, with
-| the inexact exception raised if the abstract input cannot be represented
-| exactly.  However, if the abstract value is too large, the overflow and
-| inexact exceptions are raised and an infinity or maximal finite value is
-| returned.  If the abstract value is too small, the input value is rounded to
-| a subnormal number, and the underflow and inexact exceptions are raised if
-| the abstract input cannot be represented exactly as a subnormal double-
-| precision floating-point number.
-|     The input significand `zSig' has its binary point between bits 62
-| and 61, which is 10 bits to the left of the usual location.  This shifted
-| significand must be normalized or smaller.  If `zSig' is not normalized,
-| `zExp' must be 0; in that case, the result returned is a subnormal number,
-| and it must not require rounding.  In the usual case that `zSig' is
-| normalized, `zExp' must be 1 less than the ``true'' floating-point exponent.
-| The handling of underflow and overflow follows the IEC/IEEE Standard for
-| Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-static float64 roundAndPackFloat64(bool zSign, int zExp, uint64_t zSig,
-                                   float_status *status)
-{
-    int8_t roundingMode;
-    bool roundNearestEven;
-    int roundIncrement, roundBits;
-    bool isTiny;
-
-    roundingMode = status->float_rounding_mode;
-    roundNearestEven = ( roundingMode == float_round_nearest_even );
-    switch (roundingMode) {
-    case float_round_nearest_even:
-    case float_round_ties_away:
-        roundIncrement = 0x200;
-        break;
-    case float_round_to_zero:
-        roundIncrement = 0;
-        break;
-    case float_round_up:
-        roundIncrement = zSign ? 0 : 0x3ff;
-        break;
-    case float_round_down:
-        roundIncrement = zSign ? 0x3ff : 0;
-        break;
-    case float_round_to_odd:
-        roundIncrement = (zSig & 0x400) ? 0 : 0x3ff;
-        break;
-    default:
-        abort();
-    }
-    roundBits = zSig & 0x3FF;
-    if ( 0x7FD <= (uint16_t) zExp ) {
-        if (    ( 0x7FD < zExp )
-             || (    ( zExp == 0x7FD )
-                  && ( (int64_t) ( zSig + roundIncrement ) < 0 ) )
-           ) {
-            bool overflow_to_inf = roundingMode != float_round_to_odd &&
-                                   roundIncrement != 0;
-            float_raise(float_flag_overflow | float_flag_inexact, status);
-            return packFloat64(zSign, 0x7FF, -(!overflow_to_inf));
-        }
-        if ( zExp < 0 ) {
-            if (status->flush_to_zero) {
-                float_raise(float_flag_output_denormal, status);
-                return packFloat64(zSign, 0, 0);
-            }
-            isTiny = status->tininess_before_rounding
-                  || (zExp < -1)
-                  || (zSig + roundIncrement < UINT64_C(0x8000000000000000));
-            shift64RightJamming( zSig, - zExp, &zSig );
-            zExp = 0;
-            roundBits = zSig & 0x3FF;
-            if (isTiny && roundBits) {
-                float_raise(float_flag_underflow, status);
-            }
-            if (roundingMode == float_round_to_odd) {
-                /*
-                 * For round-to-odd case, the roundIncrement depends on
-                 * zSig which just changed.
-                 */
-                roundIncrement = (zSig & 0x400) ? 0 : 0x3ff;
-            }
-        }
-    }
-    if (roundBits) {
-        float_raise(float_flag_inexact, status);
-    }
-    zSig = ( zSig + roundIncrement )>>10;
-    if (!(roundBits ^ 0x200) && roundNearestEven) {
-        zSig &= ~1;
-    }
-    if ( zSig == 0 ) zExp = 0;
-    return packFloat64( zSign, zExp, zSig );
-
-}
-
-/*----------------------------------------------------------------------------
-| Takes an abstract floating-point value having sign `zSign', exponent `zExp',
-| and significand `zSig', and returns the proper double-precision floating-
-| point value corresponding to the abstract input.  This routine is just like
-| `roundAndPackFloat64' except that `zSig' does not have to be normalized.
-| Bit 63 of `zSig' must be zero, and `zExp' must be 1 less than the ``true''
-| floating-point exponent.
-*----------------------------------------------------------------------------*/
-
-static float64
- normalizeRoundAndPackFloat64(bool zSign, int zExp, uint64_t zSig,
-                              float_status *status)
-{
-    int8_t shiftCount;
-
-    shiftCount = clz64(zSig) - 1;
-    return roundAndPackFloat64(zSign, zExp - shiftCount, zSig<<shiftCount,
-                               status);
-
-}
-
 /*----------------------------------------------------------------------------
 | Normalizes the subnormal extended double-precision floating-point value
 | represented by the denormalized significand `aSig'.  The normalized exponent
@@ -4818,388 +4731,6 @@ floatx80 normalizeRoundAndPackFloatx80(FloatX80RoundPrec roundingPrecision,
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the least-significant 64 fraction bits of the quadruple-precision
-| floating-point value `a'.
-*----------------------------------------------------------------------------*/
-
-static inline uint64_t extractFloat128Frac1( float128 a )
-{
-
-    return a.low;
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the most-significant 48 fraction bits of the quadruple-precision
-| floating-point value `a'.
-*----------------------------------------------------------------------------*/
-
-static inline uint64_t extractFloat128Frac0( float128 a )
-{
-
-    return a.high & UINT64_C(0x0000FFFFFFFFFFFF);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the exponent bits of the quadruple-precision floating-point value
-| `a'.
-*----------------------------------------------------------------------------*/
-
-static inline int32_t extractFloat128Exp( float128 a )
-{
-
-    return ( a.high>>48 ) & 0x7FFF;
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the sign bit of the quadruple-precision floating-point value `a'.
-*----------------------------------------------------------------------------*/
-
-static inline bool extractFloat128Sign(float128 a)
-{
-    return a.high >> 63;
-}
-
-/*----------------------------------------------------------------------------
-| Normalizes the subnormal quadruple-precision floating-point value
-| represented by the denormalized significand formed by the concatenation of
-| `aSig0' and `aSig1'.  The normalized exponent is stored at the location
-| pointed to by `zExpPtr'.  The most significant 49 bits of the normalized
-| significand are stored at the location pointed to by `zSig0Ptr', and the
-| least significant 64 bits of the normalized significand are stored at the
-| location pointed to by `zSig1Ptr'.
-*----------------------------------------------------------------------------*/
-
-static void
- normalizeFloat128Subnormal(
-     uint64_t aSig0,
-     uint64_t aSig1,
-     int32_t *zExpPtr,
-     uint64_t *zSig0Ptr,
-     uint64_t *zSig1Ptr
- )
-{
-    int8_t shiftCount;
-
-    if ( aSig0 == 0 ) {
-        shiftCount = clz64(aSig1) - 15;
-        if ( shiftCount < 0 ) {
-            *zSig0Ptr = aSig1>>( - shiftCount );
-            *zSig1Ptr = aSig1<<( shiftCount & 63 );
-        }
-        else {
-            *zSig0Ptr = aSig1<<shiftCount;
-            *zSig1Ptr = 0;
-        }
-        *zExpPtr = - shiftCount - 63;
-    }
-    else {
-        shiftCount = clz64(aSig0) - 15;
-        shortShift128Left( aSig0, aSig1, shiftCount, zSig0Ptr, zSig1Ptr );
-        *zExpPtr = 1 - shiftCount;
-    }
-
-}
-
-/*----------------------------------------------------------------------------
-| Packs the sign `zSign', the exponent `zExp', and the significand formed
-| by the concatenation of `zSig0' and `zSig1' into a quadruple-precision
-| floating-point value, returning the result.  After being shifted into the
-| proper positions, the three fields `zSign', `zExp', and `zSig0' are simply
-| added together to form the most significant 32 bits of the result.  This
-| means that any integer portion of `zSig0' will be added into the exponent.
-| Since a properly normalized significand will have an integer portion equal
-| to 1, the `zExp' input should be 1 less than the desired result exponent
-| whenever `zSig0' and `zSig1' concatenated form a complete, normalized
-| significand.
-*----------------------------------------------------------------------------*/
-
-static inline float128
-packFloat128(bool zSign, int32_t zExp, uint64_t zSig0, uint64_t zSig1)
-{
-    float128 z;
-
-    z.low = zSig1;
-    z.high = ((uint64_t)zSign << 63) + ((uint64_t)zExp << 48) + zSig0;
-    return z;
-}
-
-/*----------------------------------------------------------------------------
-| Takes an abstract floating-point value having sign `zSign', exponent `zExp',
-| and extended significand formed by the concatenation of `zSig0', `zSig1',
-| and `zSig2', and returns the proper quadruple-precision floating-point value
-| corresponding to the abstract input.  Ordinarily, the abstract value is
-| simply rounded and packed into the quadruple-precision format, with the
-| inexact exception raised if the abstract input cannot be represented
-| exactly.  However, if the abstract value is too large, the overflow and
-| inexact exceptions are raised and an infinity or maximal finite value is
-| returned.  If the abstract value is too small, the input value is rounded to
-| a subnormal number, and the underflow and inexact exceptions are raised if
-| the abstract input cannot be represented exactly as a subnormal quadruple-
-| precision floating-point number.
-|     The input significand must be normalized or smaller.  If the input
-| significand is not normalized, `zExp' must be 0; in that case, the result
-| returned is a subnormal number, and it must not require rounding.  In the
-| usual case that the input significand is normalized, `zExp' must be 1 less
-| than the ``true'' floating-point exponent.  The handling of underflow and
-| overflow follows the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-static float128 roundAndPackFloat128(bool zSign, int32_t zExp,
-                                     uint64_t zSig0, uint64_t zSig1,
-                                     uint64_t zSig2, float_status *status)
-{
-    int8_t roundingMode;
-    bool roundNearestEven, increment, isTiny;
-
-    roundingMode = status->float_rounding_mode;
-    roundNearestEven = ( roundingMode == float_round_nearest_even );
-    switch (roundingMode) {
-    case float_round_nearest_even:
-    case float_round_ties_away:
-        increment = ((int64_t)zSig2 < 0);
-        break;
-    case float_round_to_zero:
-        increment = 0;
-        break;
-    case float_round_up:
-        increment = !zSign && zSig2;
-        break;
-    case float_round_down:
-        increment = zSign && zSig2;
-        break;
-    case float_round_to_odd:
-        increment = !(zSig1 & 0x1) && zSig2;
-        break;
-    default:
-        abort();
-    }
-    if ( 0x7FFD <= (uint32_t) zExp ) {
-        if (    ( 0x7FFD < zExp )
-             || (    ( zExp == 0x7FFD )
-                  && eq128(
-                         UINT64_C(0x0001FFFFFFFFFFFF),
-                         UINT64_C(0xFFFFFFFFFFFFFFFF),
-                         zSig0,
-                         zSig1
-                     )
-                  && increment
-                )
-           ) {
-            float_raise(float_flag_overflow | float_flag_inexact, status);
-            if (    ( roundingMode == float_round_to_zero )
-                 || ( zSign && ( roundingMode == float_round_up ) )
-                 || ( ! zSign && ( roundingMode == float_round_down ) )
-                 || (roundingMode == float_round_to_odd)
-               ) {
-                return
-                    packFloat128(
-                        zSign,
-                        0x7FFE,
-                        UINT64_C(0x0000FFFFFFFFFFFF),
-                        UINT64_C(0xFFFFFFFFFFFFFFFF)
-                    );
-            }
-            return packFloat128( zSign, 0x7FFF, 0, 0 );
-        }
-        if ( zExp < 0 ) {
-            if (status->flush_to_zero) {
-                float_raise(float_flag_output_denormal, status);
-                return packFloat128(zSign, 0, 0, 0);
-            }
-            isTiny = status->tininess_before_rounding
-                  || (zExp < -1)
-                  || !increment
-                  || lt128(zSig0, zSig1,
-                           UINT64_C(0x0001FFFFFFFFFFFF),
-                           UINT64_C(0xFFFFFFFFFFFFFFFF));
-            shift128ExtraRightJamming(
-                zSig0, zSig1, zSig2, - zExp, &zSig0, &zSig1, &zSig2 );
-            zExp = 0;
-            if (isTiny && zSig2) {
-                float_raise(float_flag_underflow, status);
-            }
-            switch (roundingMode) {
-            case float_round_nearest_even:
-            case float_round_ties_away:
-                increment = ((int64_t)zSig2 < 0);
-                break;
-            case float_round_to_zero:
-                increment = 0;
-                break;
-            case float_round_up:
-                increment = !zSign && zSig2;
-                break;
-            case float_round_down:
-                increment = zSign && zSig2;
-                break;
-            case float_round_to_odd:
-                increment = !(zSig1 & 0x1) && zSig2;
-                break;
-            default:
-                abort();
-            }
-        }
-    }
-    if (zSig2) {
-        float_raise(float_flag_inexact, status);
-    }
-    if ( increment ) {
-        add128( zSig0, zSig1, 0, 1, &zSig0, &zSig1 );
-        if ((zSig2 + zSig2 == 0) && roundNearestEven) {
-            zSig1 &= ~1;
-        }
-    }
-    else {
-        if ( ( zSig0 | zSig1 ) == 0 ) zExp = 0;
-    }
-    return packFloat128( zSign, zExp, zSig0, zSig1 );
-
-}
-
-/*----------------------------------------------------------------------------
-| Takes an abstract floating-point value having sign `zSign', exponent `zExp',
-| and significand formed by the concatenation of `zSig0' and `zSig1', and
-| returns the proper quadruple-precision floating-point value corresponding
-| to the abstract input.  This routine is just like `roundAndPackFloat128'
-| except that the input significand has fewer bits and does not have to be
-| normalized.  In all cases, `zExp' must be 1 less than the ``true'' floating-
-| point exponent.
-*----------------------------------------------------------------------------*/
-
-static float128 normalizeRoundAndPackFloat128(bool zSign, int32_t zExp,
-                                              uint64_t zSig0, uint64_t zSig1,
-                                              float_status *status)
-{
-    int8_t shiftCount;
-    uint64_t zSig2;
-
-    if ( zSig0 == 0 ) {
-        zSig0 = zSig1;
-        zSig1 = 0;
-        zExp -= 64;
-    }
-    shiftCount = clz64(zSig0) - 15;
-    if ( 0 <= shiftCount ) {
-        zSig2 = 0;
-        shortShift128Left( zSig0, zSig1, shiftCount, &zSig0, &zSig1 );
-    }
-    else {
-        shift128ExtraRightJamming(
-            zSig0, zSig1, 0, - shiftCount, &zSig0, &zSig1, &zSig2 );
-    }
-    zExp -= shiftCount;
-    return roundAndPackFloat128(zSign, zExp, zSig0, zSig1, zSig2, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the remainder of the single-precision floating-point value `a'
-| with respect to the corresponding value `b'.  The operation is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float32 float32_rem(float32 a, float32 b, float_status *status)
-{
-    bool aSign, zSign;
-    int aExp, bExp, expDiff;
-    uint32_t aSig, bSig;
-    uint32_t q;
-    uint64_t aSig64, bSig64, q64;
-    uint32_t alternateASig;
-    int32_t sigMean;
-    a = float32_squash_input_denormal(a, status);
-    b = float32_squash_input_denormal(b, status);
-
-    aSig = extractFloat32Frac( a );
-    aExp = extractFloat32Exp( a );
-    aSign = extractFloat32Sign( a );
-    bSig = extractFloat32Frac( b );
-    bExp = extractFloat32Exp( b );
-    if ( aExp == 0xFF ) {
-        if ( aSig || ( ( bExp == 0xFF ) && bSig ) ) {
-            return propagateFloat32NaN(a, b, status);
-        }
-        float_raise(float_flag_invalid, status);
-        return float32_default_nan(status);
-    }
-    if ( bExp == 0xFF ) {
-        if (bSig) {
-            return propagateFloat32NaN(a, b, status);
-        }
-        return a;
-    }
-    if ( bExp == 0 ) {
-        if ( bSig == 0 ) {
-            float_raise(float_flag_invalid, status);
-            return float32_default_nan(status);
-        }
-        normalizeFloat32Subnormal( bSig, &bExp, &bSig );
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return a;
-        normalizeFloat32Subnormal( aSig, &aExp, &aSig );
-    }
-    expDiff = aExp - bExp;
-    aSig |= 0x00800000;
-    bSig |= 0x00800000;
-    if ( expDiff < 32 ) {
-        aSig <<= 8;
-        bSig <<= 8;
-        if ( expDiff < 0 ) {
-            if ( expDiff < -1 ) return a;
-            aSig >>= 1;
-        }
-        q = ( bSig <= aSig );
-        if ( q ) aSig -= bSig;
-        if ( 0 < expDiff ) {
-            q = ( ( (uint64_t) aSig )<<32 ) / bSig;
-            q >>= 32 - expDiff;
-            bSig >>= 2;
-            aSig = ( ( aSig>>1 )<<( expDiff - 1 ) ) - bSig * q;
-        }
-        else {
-            aSig >>= 2;
-            bSig >>= 2;
-        }
-    }
-    else {
-        if ( bSig <= aSig ) aSig -= bSig;
-        aSig64 = ( (uint64_t) aSig )<<40;
-        bSig64 = ( (uint64_t) bSig )<<40;
-        expDiff -= 64;
-        while ( 0 < expDiff ) {
-            q64 = estimateDiv128To64( aSig64, 0, bSig64 );
-            q64 = ( 2 < q64 ) ? q64 - 2 : 0;
-            aSig64 = - ( ( bSig * q64 )<<38 );
-            expDiff -= 62;
-        }
-        expDiff += 64;
-        q64 = estimateDiv128To64( aSig64, 0, bSig64 );
-        q64 = ( 2 < q64 ) ? q64 - 2 : 0;
-        q = q64>>( 64 - expDiff );
-        bSig <<= 6;
-        aSig = ( ( aSig64>>33 )<<( expDiff - 1 ) ) - bSig * q;
-    }
-    do {
-        alternateASig = aSig;
-        ++q;
-        aSig -= bSig;
-    } while ( 0 <= (int32_t) aSig );
-    sigMean = aSig + alternateASig;
-    if ( ( sigMean < 0 ) || ( ( sigMean == 0 ) && ( q & 1 ) ) ) {
-        aSig = alternateASig;
-    }
-    zSign = ( (int32_t) aSig < 0 );
-    if ( zSign ) aSig = - aSig;
-    return normalizeRoundAndPackFloat32(aSign ^ zSign, bExp, aSig, status);
-}
-
-
-
 /*----------------------------------------------------------------------------
 | Returns the binary exponential of the single-precision floating-point value
 | `a'. The operation is performed according to the IEC/IEEE Standard for
@@ -5275,94 +4806,6 @@ float32 float32_exp2(float32 a, float_status *status)
     return float32_round_pack_canonical(&rp, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the remainder of the double-precision floating-point value `a'
-| with respect to the corresponding value `b'.  The operation is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float64 float64_rem(float64 a, float64 b, float_status *status)
-{
-    bool aSign, zSign;
-    int aExp, bExp, expDiff;
-    uint64_t aSig, bSig;
-    uint64_t q, alternateASig;
-    int64_t sigMean;
-
-    a = float64_squash_input_denormal(a, status);
-    b = float64_squash_input_denormal(b, status);
-    aSig = extractFloat64Frac( a );
-    aExp = extractFloat64Exp( a );
-    aSign = extractFloat64Sign( a );
-    bSig = extractFloat64Frac( b );
-    bExp = extractFloat64Exp( b );
-    if ( aExp == 0x7FF ) {
-        if ( aSig || ( ( bExp == 0x7FF ) && bSig ) ) {
-            return propagateFloat64NaN(a, b, status);
-        }
-        float_raise(float_flag_invalid, status);
-        return float64_default_nan(status);
-    }
-    if ( bExp == 0x7FF ) {
-        if (bSig) {
-            return propagateFloat64NaN(a, b, status);
-        }
-        return a;
-    }
-    if ( bExp == 0 ) {
-        if ( bSig == 0 ) {
-            float_raise(float_flag_invalid, status);
-            return float64_default_nan(status);
-        }
-        normalizeFloat64Subnormal( bSig, &bExp, &bSig );
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return a;
-        normalizeFloat64Subnormal( aSig, &aExp, &aSig );
-    }
-    expDiff = aExp - bExp;
-    aSig = (aSig | UINT64_C(0x0010000000000000)) << 11;
-    bSig = (bSig | UINT64_C(0x0010000000000000)) << 11;
-    if ( expDiff < 0 ) {
-        if ( expDiff < -1 ) return a;
-        aSig >>= 1;
-    }
-    q = ( bSig <= aSig );
-    if ( q ) aSig -= bSig;
-    expDiff -= 64;
-    while ( 0 < expDiff ) {
-        q = estimateDiv128To64( aSig, 0, bSig );
-        q = ( 2 < q ) ? q - 2 : 0;
-        aSig = - ( ( bSig>>2 ) * q );
-        expDiff -= 62;
-    }
-    expDiff += 64;
-    if ( 0 < expDiff ) {
-        q = estimateDiv128To64( aSig, 0, bSig );
-        q = ( 2 < q ) ? q - 2 : 0;
-        q >>= 64 - expDiff;
-        bSig >>= 2;
-        aSig = ( ( aSig>>1 )<<( expDiff - 1 ) ) - bSig * q;
-    }
-    else {
-        aSig >>= 2;
-        bSig >>= 2;
-    }
-    do {
-        alternateASig = aSig;
-        ++q;
-        aSig -= bSig;
-    } while ( 0 <= (int64_t) aSig );
-    sigMean = aSig + alternateASig;
-    if ( ( sigMean < 0 ) || ( ( sigMean == 0 ) && ( q & 1 ) ) ) {
-        aSig = alternateASig;
-    }
-    zSign = ( (int64_t) aSig < 0 );
-    if ( zSign ) aSig = - aSig;
-    return normalizeRoundAndPackFloat64(aSign ^ zSign, bExp, aSig, status);
-
-}
-
 /*----------------------------------------------------------------------------
 | Rounds the extended double-precision floating-point value `a'
 | to the precision provided by floatx80_rounding_precision and returns the
@@ -5381,266 +4824,6 @@ floatx80 floatx80_round(floatx80 a, float_status *status)
     return floatx80_round_pack_canonical(&p, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the remainder of the extended double-precision floating-point value
-| `a' with respect to the corresponding value `b'.  The operation is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic,
-| if 'mod' is false; if 'mod' is true, return the remainder based on truncating
-| the quotient toward zero instead.  '*quotient' is set to the low 64 bits of
-| the absolute value of the integer quotient.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_modrem(floatx80 a, floatx80 b, bool mod, uint64_t *quotient,
-                         float_status *status)
-{
-    bool aSign, zSign;
-    int32_t aExp, bExp, expDiff, aExpOrig;
-    uint64_t aSig0, aSig1, bSig;
-    uint64_t q, term0, term1, alternateASig0, alternateASig1;
-
-    *quotient = 0;
-    if (floatx80_invalid_encoding(a) || floatx80_invalid_encoding(b)) {
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    aSig0 = extractFloatx80Frac( a );
-    aExpOrig = aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    bSig = extractFloatx80Frac( b );
-    bExp = extractFloatx80Exp( b );
-    if ( aExp == 0x7FFF ) {
-        if (    (uint64_t) ( aSig0<<1 )
-             || ( ( bExp == 0x7FFF ) && (uint64_t) ( bSig<<1 ) ) ) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        goto invalid;
-    }
-    if ( bExp == 0x7FFF ) {
-        if ((uint64_t)(bSig << 1)) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        if (aExp == 0 && aSig0 >> 63) {
-            /*
-             * Pseudo-denormal argument must be returned in normalized
-             * form.
-             */
-            return packFloatx80(aSign, 1, aSig0);
-        }
-        return a;
-    }
-    if ( bExp == 0 ) {
-        if ( bSig == 0 ) {
- invalid:
-            float_raise(float_flag_invalid, status);
-            return floatx80_default_nan(status);
-        }
-        normalizeFloatx80Subnormal( bSig, &bExp, &bSig );
-    }
-    if ( aExp == 0 ) {
-        if ( aSig0 == 0 ) return a;
-        normalizeFloatx80Subnormal( aSig0, &aExp, &aSig0 );
-    }
-    zSign = aSign;
-    expDiff = aExp - bExp;
-    aSig1 = 0;
-    if ( expDiff < 0 ) {
-        if ( mod || expDiff < -1 ) {
-            if (aExp == 1 && aExpOrig == 0) {
-                /*
-                 * Pseudo-denormal argument must be returned in
-                 * normalized form.
-                 */
-                return packFloatx80(aSign, aExp, aSig0);
-            }
-            return a;
-        }
-        shift128Right( aSig0, 0, 1, &aSig0, &aSig1 );
-        expDiff = 0;
-    }
-    *quotient = q = ( bSig <= aSig0 );
-    if ( q ) aSig0 -= bSig;
-    expDiff -= 64;
-    while ( 0 < expDiff ) {
-        q = estimateDiv128To64( aSig0, aSig1, bSig );
-        q = ( 2 < q ) ? q - 2 : 0;
-        mul64To128( bSig, q, &term0, &term1 );
-        sub128( aSig0, aSig1, term0, term1, &aSig0, &aSig1 );
-        shortShift128Left( aSig0, aSig1, 62, &aSig0, &aSig1 );
-        expDiff -= 62;
-        *quotient <<= 62;
-        *quotient += q;
-    }
-    expDiff += 64;
-    if ( 0 < expDiff ) {
-        q = estimateDiv128To64( aSig0, aSig1, bSig );
-        q = ( 2 < q ) ? q - 2 : 0;
-        q >>= 64 - expDiff;
-        mul64To128( bSig, q<<( 64 - expDiff ), &term0, &term1 );
-        sub128( aSig0, aSig1, term0, term1, &aSig0, &aSig1 );
-        shortShift128Left( 0, bSig, 64 - expDiff, &term0, &term1 );
-        while ( le128( term0, term1, aSig0, aSig1 ) ) {
-            ++q;
-            sub128( aSig0, aSig1, term0, term1, &aSig0, &aSig1 );
-        }
-        if (expDiff < 64) {
-            *quotient <<= expDiff;
-        } else {
-            *quotient = 0;
-        }
-        *quotient += q;
-    }
-    else {
-        term1 = 0;
-        term0 = bSig;
-    }
-    if (!mod) {
-        sub128( term0, term1, aSig0, aSig1, &alternateASig0, &alternateASig1 );
-        if (    lt128( alternateASig0, alternateASig1, aSig0, aSig1 )
-                || (    eq128( alternateASig0, alternateASig1, aSig0, aSig1 )
-                        && ( q & 1 ) )
-            ) {
-            aSig0 = alternateASig0;
-            aSig1 = alternateASig1;
-            zSign = ! zSign;
-            ++*quotient;
-        }
-    }
-    return
-        normalizeRoundAndPackFloatx80(
-            floatx80_precision_x, zSign, bExp + expDiff, aSig0, aSig1, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the remainder of the extended double-precision floating-point value
-| `a' with respect to the corresponding value `b'.  The operation is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_rem(floatx80 a, floatx80 b, float_status *status)
-{
-    uint64_t quotient;
-    return floatx80_modrem(a, b, false, &quotient, status);
-}
-
-/*----------------------------------------------------------------------------
-| Returns the remainder of the extended double-precision floating-point value
-| `a' with respect to the corresponding value `b', with the quotient truncated
-| toward zero.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *status)
-{
-    uint64_t quotient;
-    return floatx80_modrem(a, b, true, &quotient, status);
-}
-
-/*----------------------------------------------------------------------------
-| Returns the remainder of the quadruple-precision floating-point value `a'
-| with respect to the corresponding value `b'.  The operation is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float128_rem(float128 a, float128 b, float_status *status)
-{
-    bool aSign, zSign;
-    int32_t aExp, bExp, expDiff;
-    uint64_t aSig0, aSig1, bSig0, bSig1, q, term0, term1, term2;
-    uint64_t allZero, alternateASig0, alternateASig1, sigMean1;
-    int64_t sigMean0;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    bSig1 = extractFloat128Frac1( b );
-    bSig0 = extractFloat128Frac0( b );
-    bExp = extractFloat128Exp( b );
-    if ( aExp == 0x7FFF ) {
-        if (    ( aSig0 | aSig1 )
-             || ( ( bExp == 0x7FFF ) && ( bSig0 | bSig1 ) ) ) {
-            return propagateFloat128NaN(a, b, status);
-        }
-        goto invalid;
-    }
-    if ( bExp == 0x7FFF ) {
-        if (bSig0 | bSig1) {
-            return propagateFloat128NaN(a, b, status);
-        }
-        return a;
-    }
-    if ( bExp == 0 ) {
-        if ( ( bSig0 | bSig1 ) == 0 ) {
- invalid:
-            float_raise(float_flag_invalid, status);
-            return float128_default_nan(status);
-        }
-        normalizeFloat128Subnormal( bSig0, bSig1, &bExp, &bSig0, &bSig1 );
-    }
-    if ( aExp == 0 ) {
-        if ( ( aSig0 | aSig1 ) == 0 ) return a;
-        normalizeFloat128Subnormal( aSig0, aSig1, &aExp, &aSig0, &aSig1 );
-    }
-    expDiff = aExp - bExp;
-    if ( expDiff < -1 ) return a;
-    shortShift128Left(
-        aSig0 | UINT64_C(0x0001000000000000),
-        aSig1,
-        15 - ( expDiff < 0 ),
-        &aSig0,
-        &aSig1
-    );
-    shortShift128Left(
-        bSig0 | UINT64_C(0x0001000000000000), bSig1, 15, &bSig0, &bSig1 );
-    q = le128( bSig0, bSig1, aSig0, aSig1 );
-    if ( q ) sub128( aSig0, aSig1, bSig0, bSig1, &aSig0, &aSig1 );
-    expDiff -= 64;
-    while ( 0 < expDiff ) {
-        q = estimateDiv128To64( aSig0, aSig1, bSig0 );
-        q = ( 4 < q ) ? q - 4 : 0;
-        mul128By64To192( bSig0, bSig1, q, &term0, &term1, &term2 );
-        shortShift192Left( term0, term1, term2, 61, &term1, &term2, &allZero );
-        shortShift128Left( aSig0, aSig1, 61, &aSig0, &allZero );
-        sub128( aSig0, 0, term1, term2, &aSig0, &aSig1 );
-        expDiff -= 61;
-    }
-    if ( -64 < expDiff ) {
-        q = estimateDiv128To64( aSig0, aSig1, bSig0 );
-        q = ( 4 < q ) ? q - 4 : 0;
-        q >>= - expDiff;
-        shift128Right( bSig0, bSig1, 12, &bSig0, &bSig1 );
-        expDiff += 52;
-        if ( expDiff < 0 ) {
-            shift128Right( aSig0, aSig1, - expDiff, &aSig0, &aSig1 );
-        }
-        else {
-            shortShift128Left( aSig0, aSig1, expDiff, &aSig0, &aSig1 );
-        }
-        mul128By64To192( bSig0, bSig1, q, &term0, &term1, &term2 );
-        sub128( aSig0, aSig1, term1, term2, &aSig0, &aSig1 );
-    }
-    else {
-        shift128Right( aSig0, aSig1, 12, &aSig0, &aSig1 );
-        shift128Right( bSig0, bSig1, 12, &bSig0, &bSig1 );
-    }
-    do {
-        alternateASig0 = aSig0;
-        alternateASig1 = aSig1;
-        ++q;
-        sub128( aSig0, aSig1, bSig0, bSig1, &aSig0, &aSig1 );
-    } while ( 0 <= (int64_t) aSig0 );
-    add128(
-        aSig0, aSig1, alternateASig0, alternateASig1, (uint64_t *)&sigMean0, &sigMean1 );
-    if (    ( sigMean0 < 0 )
-         || ( ( ( sigMean0 | sigMean1 ) == 0 ) && ( q & 1 ) ) ) {
-        aSig0 = alternateASig0;
-        aSig1 = alternateASig1;
-    }
-    zSign = ( (int64_t) aSig0 < 0 );
-    if ( zSign ) sub128( 0, 0, aSig0, aSig1, &aSig0, &aSig1 );
-    return normalizeRoundAndPackFloat128(aSign ^ zSign, bExp - 4, aSig0, aSig1,
-                                         status);
-}
 static void __attribute__((constructor)) softfloat_init(void)
 {
     union_float64 ua, ub, uc, ur;
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 3659c6a4c0..1bc8db4cf1 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -625,6 +625,40 @@ static FloatPartsN *partsN(div)(FloatPartsN *a, FloatPartsN *b,
     return a;
 }
 
+/*
+ * Floating point remainder, per IEC/IEEE, or modulus.
+ */
+static FloatPartsN *partsN(modrem)(FloatPartsN *a, FloatPartsN *b,
+                                   uint64_t *mod_quot, float_status *s)
+{
+    int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
+
+    if (likely(ab_mask == float_cmask_normal)) {
+        frac_modrem(a, b, mod_quot);
+        return a;
+    }
+
+    if (mod_quot) {
+        *mod_quot = 0;
+    }
+
+    /* All the NaN cases */
+    if (unlikely(ab_mask & float_cmask_anynan)) {
+        return parts_pick_nan(a, b, s);
+    }
+
+    /* Inf % N; N % 0 */
+    if (a->cls == float_class_inf || b->cls == float_class_zero) {
+        float_raise(float_flag_invalid, s);
+        parts_default_nan(a, s);
+        return a;
+    }
+
+    /* N % Inf; 0 % N */
+    g_assert(b->cls == float_class_inf || a->cls == float_class_zero);
+    return a;
+}
+
 /*
  * Square Root
  *
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 88eab344df..6754a94afc 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -636,62 +636,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
 #endif
 }
 
-/*----------------------------------------------------------------------------
-| Takes two single-precision floating-point values `a' and `b', one of which
-| is a NaN, and returns the appropriate NaN result.  If either `a' or `b' is a
-| signaling NaN, the invalid exception is raised.
-*----------------------------------------------------------------------------*/
-
-static float32 propagateFloat32NaN(float32 a, float32 b, float_status *status)
-{
-    bool aIsLargerSignificand;
-    uint32_t av, bv;
-    FloatClass a_cls, b_cls;
-
-    /* This is not complete, but is good enough for pickNaN.  */
-    a_cls = (!float32_is_any_nan(a)
-             ? float_class_normal
-             : float32_is_signaling_nan(a, status)
-             ? float_class_snan
-             : float_class_qnan);
-    b_cls = (!float32_is_any_nan(b)
-             ? float_class_normal
-             : float32_is_signaling_nan(b, status)
-             ? float_class_snan
-             : float_class_qnan);
-
-    av = float32_val(a);
-    bv = float32_val(b);
-
-    if (is_snan(a_cls) || is_snan(b_cls)) {
-        float_raise(float_flag_invalid, status);
-    }
-
-    if (status->default_nan_mode) {
-        return float32_default_nan(status);
-    }
-
-    if ((uint32_t)(av << 1) < (uint32_t)(bv << 1)) {
-        aIsLargerSignificand = 0;
-    } else if ((uint32_t)(bv << 1) < (uint32_t)(av << 1)) {
-        aIsLargerSignificand = 1;
-    } else {
-        aIsLargerSignificand = (av < bv) ? 1 : 0;
-    }
-
-    if (pickNaN(a_cls, b_cls, aIsLargerSignificand, status)) {
-        if (is_snan(b_cls)) {
-            return float32_silence_nan(b, status);
-        }
-        return b;
-    } else {
-        if (is_snan(a_cls)) {
-            return float32_silence_nan(a, status);
-        }
-        return a;
-    }
-}
-
 /*----------------------------------------------------------------------------
 | Returns 1 if the double-precision floating-point value `a' is a quiet
 | NaN; otherwise returns 0.
@@ -732,62 +676,6 @@ bool float64_is_signaling_nan(float64 a_, float_status *status)
     }
 }
 
-/*----------------------------------------------------------------------------
-| Takes two double-precision floating-point values `a' and `b', one of which
-| is a NaN, and returns the appropriate NaN result.  If either `a' or `b' is a
-| signaling NaN, the invalid exception is raised.
-*----------------------------------------------------------------------------*/
-
-static float64 propagateFloat64NaN(float64 a, float64 b, float_status *status)
-{
-    bool aIsLargerSignificand;
-    uint64_t av, bv;
-    FloatClass a_cls, b_cls;
-
-    /* This is not complete, but is good enough for pickNaN.  */
-    a_cls = (!float64_is_any_nan(a)
-             ? float_class_normal
-             : float64_is_signaling_nan(a, status)
-             ? float_class_snan
-             : float_class_qnan);
-    b_cls = (!float64_is_any_nan(b)
-             ? float_class_normal
-             : float64_is_signaling_nan(b, status)
-             ? float_class_snan
-             : float_class_qnan);
-
-    av = float64_val(a);
-    bv = float64_val(b);
-
-    if (is_snan(a_cls) || is_snan(b_cls)) {
-        float_raise(float_flag_invalid, status);
-    }
-
-    if (status->default_nan_mode) {
-        return float64_default_nan(status);
-    }
-
-    if ((uint64_t)(av << 1) < (uint64_t)(bv << 1)) {
-        aIsLargerSignificand = 0;
-    } else if ((uint64_t)(bv << 1) < (uint64_t)(av << 1)) {
-        aIsLargerSignificand = 1;
-    } else {
-        aIsLargerSignificand = (av < bv) ? 1 : 0;
-    }
-
-    if (pickNaN(a_cls, b_cls, aIsLargerSignificand, status)) {
-        if (is_snan(b_cls)) {
-            return float64_silence_nan(b, status);
-        }
-        return b;
-    } else {
-        if (is_snan(a_cls)) {
-            return float64_silence_nan(a, status);
-        }
-        return a;
-    }
-}
-
 /*----------------------------------------------------------------------------
 | Returns 1 if the extended double-precision floating-point value `a' is a
 | quiet NaN; otherwise returns 0. This slightly differs from the same
@@ -942,56 +830,3 @@ bool float128_is_signaling_nan(float128 a, float_status *status)
         }
     }
 }
-
-/*----------------------------------------------------------------------------
-| Takes two quadruple-precision floating-point values `a' and `b', one of
-| which is a NaN, and returns the appropriate NaN result.  If either `a' or
-| `b' is a signaling NaN, the invalid exception is raised.
-*----------------------------------------------------------------------------*/
-
-static float128 propagateFloat128NaN(float128 a, float128 b,
-                                     float_status *status)
-{
-    bool aIsLargerSignificand;
-    FloatClass a_cls, b_cls;
-
-    /* This is not complete, but is good enough for pickNaN.  */
-    a_cls = (!float128_is_any_nan(a)
-             ? float_class_normal
-             : float128_is_signaling_nan(a, status)
-             ? float_class_snan
-             : float_class_qnan);
-    b_cls = (!float128_is_any_nan(b)
-             ? float_class_normal
-             : float128_is_signaling_nan(b, status)
-             ? float_class_snan
-             : float_class_qnan);
-
-    if (is_snan(a_cls) || is_snan(b_cls)) {
-        float_raise(float_flag_invalid, status);
-    }
-
-    if (status->default_nan_mode) {
-        return float128_default_nan(status);
-    }
-
-    if (lt128(a.high << 1, a.low, b.high << 1, b.low)) {
-        aIsLargerSignificand = 0;
-    } else if (lt128(b.high << 1, b.low, a.high << 1, a.low)) {
-        aIsLargerSignificand = 1;
-    } else {
-        aIsLargerSignificand = (a.high < b.high) ? 1 : 0;
-    }
-
-    if (pickNaN(a_cls, b_cls, aIsLargerSignificand, status)) {
-        if (is_snan(b_cls)) {
-            return float128_silence_nan(b, status);
-        }
-        return b;
-    } else {
-        if (is_snan(a_cls)) {
-            return float128_silence_nan(a, status);
-        }
-        return a;
-    }
-}
-- 
2.25.1


