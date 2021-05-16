Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D086381F00
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:07:25 +0200 (CEST)
Received: from localhost ([::1]:57308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGUO-0000ll-Cs
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzd-0007vN-5I
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:37 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:44623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz5-0007qw-An
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:36 -0400
Received: by mail-qk1-x72c.google.com with SMTP id a2so3284900qkh.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFY3fKXhekP71qJT+a+OBWAvDgyOl17zqQbajQIX2VE=;
 b=V0/BjNRInnqxyX4DCQvJM0RlSXEp81J13tvBs33XiQ6iBxg2bA5RbQoheiBK8wFCa1
 b+wQf2+9VpUkqT7jiX1YVf9+7n+egtNUG6uUK0LpQeJGR87ZjRKF7P0nhyXv6O9mC+im
 AEotjpuY5vlu3ZnOc9vPQsDAMumSFZ3jiK8OodmJji9XI4JtUntROxwj7s++uhR/f7Ju
 tbpRRzRqnoTs188tJKzfjf0suT/NKbWb4ca0xOLN3id75AU+dHnYi8H+2ZWc6BB20R5N
 6T2jS+QaKNCYBqCowubMwyuvheYS2BdJZf2f92Eq6eMoIZKjVon6zyYGlRDDycKQ8fcn
 XJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFY3fKXhekP71qJT+a+OBWAvDgyOl17zqQbajQIX2VE=;
 b=Y1aX3/YKvXVEDd0EuvVA2aASeHg+PpSfbBW32T8bBskcMGYDi0UzvITxS5omt1s16P
 DhoXDC/wadHUJQsrxQ2NzjY5XBYJeMq2FwT6Y6jOlOuOOouAaHXxNB9Q8rdW/sDbAcOT
 IJUaDvS1E+QsB+A0/6Fmjf+DNlajGJMjTLTLBBkHeTnwfcp8RkZCJCPP2gi9EDURsN55
 Lf1SV12KQe/4ddbxxpCo+ToGAsdYmeTrKfTzSwUi3OMUyjfKP/82G58Yp//nfkuG+Cyx
 9buXWyVReXzogDWrGd/L7oprckqiaHhz2p+Q0Xk6CGU9rNv/lm7jTTMPn9XHgDFkugig
 eX+w==
X-Gm-Message-State: AOAM533bbkXD7m9kOANeE8uRV0l0/kF6VSTlCUYUqTFvFI87OuTNzO8S
 ixszkM/3lwVMRjwAtT5h0o46FMKlcSW3J//qO7c=
X-Google-Smtp-Source: ABdhPJx1A/mN3PJzyQi1vF6L7oonZNzgE2x3QxlmcwGK308FrJk3wzMcEKFW5H1j9sz3hFU8gM8PhA==
X-Received: by 2002:a37:5f41:: with SMTP id t62mr51744725qkb.458.1621168502265; 
 Sun, 16 May 2021 05:35:02 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:35:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/46] softfloat: Move mul_floats to softfloat-parts.c.inc
Date: Sun, 16 May 2021 07:34:21 -0500
Message-Id: <20210516123431.718318-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to parts$N_mul.
Reimplement float128_mul with FloatParts128.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 206 ++++++++++++++------------------------
 fpu/softfloat-parts.c.inc |  51 ++++++++++
 2 files changed, 128 insertions(+), 129 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 8f734f6020..ac7959557c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -533,6 +533,16 @@ typedef struct {
     uint64_t frac_lo;
 } FloatParts128;
 
+typedef struct {
+    FloatClass cls;
+    bool sign;
+    int32_t exp;
+    uint64_t frac_hi;
+    uint64_t frac_hm;  /* high-middle */
+    uint64_t frac_lm;  /* low-middle */
+    uint64_t frac_lo;
+} FloatParts256;
+
 /* These apply to the most significant word of each FloatPartsN. */
 #define DECOMPOSED_BINARY_POINT    63
 #define DECOMPOSED_IMPLICIT_BIT    (1ull << DECOMPOSED_BINARY_POINT)
@@ -769,6 +779,14 @@ static FloatParts128 *parts128_addsub(FloatParts128 *a, FloatParts128 *b,
 #define parts_addsub(A, B, S, Z) \
     PARTS_GENERIC_64_128(addsub, A)(A, B, S, Z)
 
+static FloatParts64 *parts64_mul(FloatParts64 *a, FloatParts64 *b,
+                                 float_status *s);
+static FloatParts128 *parts128_mul(FloatParts128 *a, FloatParts128 *b,
+                                   float_status *s);
+
+#define parts_mul(A, B, S) \
+    PARTS_GENERIC_64_128(mul, A)(A, B, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -859,6 +877,19 @@ static bool frac128_eqz(FloatParts128 *a)
 
 #define frac_eqz(A)  FRAC_GENERIC_64_128(eqz, A)(A)
 
+static void frac64_mulw(FloatParts128 *r, FloatParts64 *a, FloatParts64 *b)
+{
+    mulu64(&r->frac_lo, &r->frac_hi, a->frac, b->frac);
+}
+
+static void frac128_mulw(FloatParts256 *r, FloatParts128 *a, FloatParts128 *b)
+{
+    mul128To256(a->frac_hi, a->frac_lo, b->frac_hi, b->frac_lo,
+                &r->frac_hi, &r->frac_hm, &r->frac_lm, &r->frac_lo);
+}
+
+#define frac_mulw(R, A, B)  FRAC_GENERIC_64_128(mulw, A)(R, A, B)
+
 static void frac64_neg(FloatParts64 *a)
 {
     a->frac = -a->frac;
@@ -955,23 +986,42 @@ static bool frac128_sub(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
 
 #define frac_sub(R, A, B)  FRAC_GENERIC_64_128(sub, R)(R, A, B)
 
+static void frac64_truncjam(FloatParts64 *r, FloatParts128 *a)
+{
+    r->frac = a->frac_hi | (a->frac_lo != 0);
+}
+
+static void frac128_truncjam(FloatParts128 *r, FloatParts256 *a)
+{
+    r->frac_hi = a->frac_hi;
+    r->frac_lo = a->frac_hm | ((a->frac_lm | a->frac_lo) != 0);
+}
+
+#define frac_truncjam(R, A)  FRAC_GENERIC_64_128(truncjam, R)(R, A)
+
 #define partsN(NAME)   glue(glue(glue(parts,N),_),NAME)
 #define FloatPartsN    glue(FloatParts,N)
+#define FloatPartsW    glue(FloatParts,W)
 
 #define N 64
+#define W 128
 
 #include "softfloat-parts-addsub.c.inc"
 #include "softfloat-parts.c.inc"
 
 #undef  N
+#undef  W
 #define N 128
+#define W 256
 
 #include "softfloat-parts-addsub.c.inc"
 #include "softfloat-parts.c.inc"
 
 #undef  N
+#undef  W
 #undef  partsN
 #undef  FloatPartsN
+#undef  FloatPartsW
 
 /*
  * Pack/unpack routines with a specific FloatFmt.
@@ -1250,89 +1300,42 @@ float128 float128_sub(float128 a, float128 b, float_status *status)
 }
 
 /*
- * Returns the result of multiplying the floating-point values `a' and
- * `b'. The operation is performed according to the IEC/IEEE Standard
- * for Binary Floating-Point Arithmetic.
+ * Multiplication
  */
 
-static FloatParts64 mul_floats(FloatParts64 a, FloatParts64 b, float_status *s)
-{
-    bool sign = a.sign ^ b.sign;
-
-    if (a.cls == float_class_normal && b.cls == float_class_normal) {
-        uint64_t hi, lo;
-        int exp = a.exp + b.exp;
-
-        mul64To128(a.frac, b.frac, &hi, &lo);
-        if (hi & DECOMPOSED_IMPLICIT_BIT) {
-            exp += 1;
-        } else {
-            hi <<= 1;
-        }
-        hi |= (lo != 0);
-
-        /* Re-use a */
-        a.exp = exp;
-        a.sign = sign;
-        a.frac = hi;
-        return a;
-    }
-    /* handle all the NaN cases */
-    if (is_nan(a.cls) || is_nan(b.cls)) {
-        return *parts_pick_nan(&a, &b, s);
-    }
-    /* Inf * Zero == NaN */
-    if ((a.cls == float_class_inf && b.cls == float_class_zero) ||
-        (a.cls == float_class_zero && b.cls == float_class_inf)) {
-        float_raise(float_flag_invalid, s);
-        parts_default_nan(&a, s);
-        return a;
-    }
-    /* Multiply by 0 or Inf */
-    if (a.cls == float_class_inf || a.cls == float_class_zero) {
-        a.sign = sign;
-        return a;
-    }
-    if (b.cls == float_class_inf || b.cls == float_class_zero) {
-        b.sign = sign;
-        return b;
-    }
-    g_assert_not_reached();
-}
-
 float16 QEMU_FLATTEN float16_mul(float16 a, float16 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     float16_unpack_canonical(&pa, a, status);
     float16_unpack_canonical(&pb, b, status);
-    pr = mul_floats(pa, pb, status);
+    pr = parts_mul(&pa, &pb, status);
 
-    return float16_round_pack_canonical(&pr, status);
+    return float16_round_pack_canonical(pr, status);
 }
 
 static float32 QEMU_SOFTFLOAT_ATTR
 soft_f32_mul(float32 a, float32 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     float32_unpack_canonical(&pa, a, status);
     float32_unpack_canonical(&pb, b, status);
-    pr = mul_floats(pa, pb, status);
+    pr = parts_mul(&pa, &pb, status);
 
-    return float32_round_pack_canonical(&pr, status);
+    return float32_round_pack_canonical(pr, status);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_f64_mul(float64 a, float64 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     float64_unpack_canonical(&pa, a, status);
     float64_unpack_canonical(&pb, b, status);
-    pr = mul_floats(pa, pb, status);
+    pr = parts_mul(&pa, &pb, status);
 
-    return float64_round_pack_canonical(&pr, status);
+    return float64_round_pack_canonical(pr, status);
 }
 
 static float hard_f32_mul(float a, float b)
@@ -1359,20 +1362,28 @@ float64_mul(float64 a, float64 b, float_status *s)
                         f64_is_zon2, f64_addsubmul_post);
 }
 
-/*
- * Returns the result of multiplying the bfloat16
- * values `a' and `b'.
- */
-
-bfloat16 QEMU_FLATTEN bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
+bfloat16 QEMU_FLATTEN
+bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts64 pa, pb, pr;
+    FloatParts64 pa, pb, *pr;
 
     bfloat16_unpack_canonical(&pa, a, status);
     bfloat16_unpack_canonical(&pb, b, status);
-    pr = mul_floats(pa, pb, status);
+    pr = parts_mul(&pa, &pb, status);
 
-    return bfloat16_round_pack_canonical(&pr, status);
+    return bfloat16_round_pack_canonical(pr, status);
+}
+
+float128 QEMU_FLATTEN
+float128_mul(float128 a, float128 b, float_status *status)
+{
+    FloatParts128 pa, pb, *pr;
+
+    float128_unpack_canonical(&pa, a, status);
+    float128_unpack_canonical(&pb, b, status);
+    pr = parts_mul(&pa, &pb, status);
+
+    return float128_round_pack_canonical(pr, status);
 }
 
 /*
@@ -7068,69 +7079,6 @@ float128 float128_round_to_int(float128 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of multiplying the quadruple-precision floating-point
-| values `a' and `b'.  The operation is performed according to the IEC/IEEE
-| Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float128_mul(float128 a, float128 b, float_status *status)
-{
-    bool aSign, bSign, zSign;
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2, zSig3;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    bSig1 = extractFloat128Frac1( b );
-    bSig0 = extractFloat128Frac0( b );
-    bExp = extractFloat128Exp( b );
-    bSign = extractFloat128Sign( b );
-    zSign = aSign ^ bSign;
-    if ( aExp == 0x7FFF ) {
-        if (    ( aSig0 | aSig1 )
-             || ( ( bExp == 0x7FFF ) && ( bSig0 | bSig1 ) ) ) {
-            return propagateFloat128NaN(a, b, status);
-        }
-        if ( ( bExp | bSig0 | bSig1 ) == 0 ) goto invalid;
-        return packFloat128( zSign, 0x7FFF, 0, 0 );
-    }
-    if ( bExp == 0x7FFF ) {
-        if (bSig0 | bSig1) {
-            return propagateFloat128NaN(a, b, status);
-        }
-        if ( ( aExp | aSig0 | aSig1 ) == 0 ) {
- invalid:
-            float_raise(float_flag_invalid, status);
-            return float128_default_nan(status);
-        }
-        return packFloat128( zSign, 0x7FFF, 0, 0 );
-    }
-    if ( aExp == 0 ) {
-        if ( ( aSig0 | aSig1 ) == 0 ) return packFloat128( zSign, 0, 0, 0 );
-        normalizeFloat128Subnormal( aSig0, aSig1, &aExp, &aSig0, &aSig1 );
-    }
-    if ( bExp == 0 ) {
-        if ( ( bSig0 | bSig1 ) == 0 ) return packFloat128( zSign, 0, 0, 0 );
-        normalizeFloat128Subnormal( bSig0, bSig1, &bExp, &bSig0, &bSig1 );
-    }
-    zExp = aExp + bExp - 0x4000;
-    aSig0 |= UINT64_C(0x0001000000000000);
-    shortShift128Left( bSig0, bSig1, 16, &bSig0, &bSig1 );
-    mul128To256( aSig0, aSig1, bSig0, bSig1, &zSig0, &zSig1, &zSig2, &zSig3 );
-    add128( zSig0, zSig1, aSig0, aSig1, &zSig0, &zSig1 );
-    zSig2 |= ( zSig3 != 0 );
-    if (UINT64_C( 0x0002000000000000) <= zSig0 ) {
-        shift128ExtraRightJamming(
-            zSig0, zSig1, zSig2, 1, &zSig0, &zSig1, &zSig2 );
-        ++zExp;
-    }
-    return roundAndPackFloat128(zSign, zExp, zSig0, zSig1, zSig2, status);
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of dividing the quadruple-precision floating-point value
 | `a' by the corresponding value `b'.  The operation is performed according to
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index cfce9f6421..9a67ab2bea 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -362,3 +362,54 @@ static FloatPartsN *partsN(addsub)(FloatPartsN *a, FloatPartsN *b,
  p_nan:
     return parts_pick_nan(a, b, s);
 }
+
+/*
+ * Returns the result of multiplying the floating-point values `a' and
+ * `b'. The operation is performed according to the IEC/IEEE Standard
+ * for Binary Floating-Point Arithmetic.
+ */
+static FloatPartsN *partsN(mul)(FloatPartsN *a, FloatPartsN *b,
+                                float_status *s)
+{
+    int ab_mask = float_cmask(a->cls) | float_cmask(b->cls);
+    bool sign = a->sign ^ b->sign;
+
+    if (likely(ab_mask == float_cmask_normal)) {
+        FloatPartsW tmp;
+
+        frac_mulw(&tmp, a, b);
+        frac_truncjam(a, &tmp);
+
+        a->exp += b->exp + 1;
+        if (!(a->frac_hi & DECOMPOSED_IMPLICIT_BIT)) {
+            frac_add(a, a, a);
+            a->exp -= 1;
+        }
+
+        a->sign = sign;
+        return a;
+    }
+
+    /* Inf * Zero == NaN */
+    if (unlikely(ab_mask == float_cmask_infzero)) {
+        float_raise(float_flag_invalid, s);
+        parts_default_nan(a, s);
+        return a;
+    }
+
+    if (unlikely(ab_mask & float_cmask_anynan)) {
+        return parts_pick_nan(a, b, s);
+    }
+
+    /* Multiply by 0 or Inf */
+    if (ab_mask & float_cmask_inf) {
+        a->cls = float_class_inf;
+        a->sign = sign;
+        return a;
+    }
+
+    g_assert(ab_mask & float_cmask_zero);
+    a->cls = float_class_zero;
+    a->sign = sign;
+    return a;
+}
-- 
2.25.1


