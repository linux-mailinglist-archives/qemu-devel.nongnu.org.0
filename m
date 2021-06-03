Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1E39AD3D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:53:19 +0200 (CEST)
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovHC-0007vo-2j
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov66-0002WO-SV
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:51 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5z-00017B-Gs
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:50 -0400
Received: by mail-pg1-x532.google.com with SMTP id e22so6157069pgv.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdB+URSmwAXojvo8XHizqXqw1GaDXnIRRudI5sdslWY=;
 b=yVLdHeCcT8I8Irb3DMBW427lsq1qyJAmm8vG6/tlOfTauhKQCMvxYMKiVLTmFquCan
 wPrs74hGl8bM8RAeSVFEyBRnzHZN3o1CxW3oxNEDtqGNC0PW51CGmEu5ZBuyDLpzu/9V
 ieskC84K61XLDIw/HXGe7pbtCto9Ots8G/51N1daX4H0CcqFpag/Cwe9cgUXpc5w9svi
 fCkdUw6fZTj2yBBMX2He5bbKr3Raz8UpRnpHxf1nynnZs9fIm/Zmnl0tInLRBKfZcQrN
 7JXROHPCiwDilKT56ZZ0eOmftnLsi33I6L8zH7+cKbhoWuLN6i20PfP2ZjDMwn/7JYQ/
 UBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdB+URSmwAXojvo8XHizqXqw1GaDXnIRRudI5sdslWY=;
 b=A12w28GVy8QQ6+0yUGnaSkuaRqq2UOeRA9IY2+Z1R/EfEWCCdYrfO5ampa7NIH3CZp
 /tpB/DtnWv600JnoNug4q8aSCzMwqp7g3LrAQy9nFGaFNJb+8T7nkRLUlY8/GPBtmPYj
 /aQjnTyQozLdiAyXe9scawUk7bG5Aw/4nQfq/UlEQdORMguCwBbM33u5Wf62h7EzlfeR
 X9PUVefgKJi/Ne6zjF8rYiOAJ3BVr95acD6pa/z9iSHZas8hY1gqpF3ufjau2Y2gJ+7w
 EqxFat+rKhn91V8BdsR5xfF2Vi1Tw3ADplxw+/3NU+nPclzyFb3udEyro0vB5SSKL3Dl
 Z4kQ==
X-Gm-Message-State: AOAM531QFO3v0cShxmoAK7WpkhvKvjEZpDnXBDIZkBrYEtCw2nj5PnWp
 VuMtWozl54G/sCqWeKidnRdfrvfwjtRK8A==
X-Google-Smtp-Source: ABdhPJzJTrvQSv6y1+jtwo33nOcBumbt5ivq8Ns62bGQXVG6NSxDl71csiqqLukqlOUkSBm/iJoedg==
X-Received: by 2002:a63:5b66:: with SMTP id l38mr1467292pgm.241.1622756501976; 
 Thu, 03 Jun 2021 14:41:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/29] softfloat: Convert floatx80_add/sub to FloatParts
Date: Thu,  3 Jun 2021 14:41:16 -0700
Message-Id: <20210603214131.629841-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

Since this is the first such, this includes all of the
packing and unpacking routines as well.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 339 +++++++++++++++++++-----------------------------
 1 file changed, 136 insertions(+), 203 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b6a50e5e95..737f5d7701 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -578,14 +578,14 @@ typedef struct {
 } FloatFmt;
 
 /* Expand fields based on the size of exponent and fraction */
-#define FLOAT_PARAMS_(E, F)                             \
+#define FLOAT_PARAMS_(E)                                \
     .exp_size       = E,                                \
     .exp_bias       = ((1 << E) - 1) >> 1,              \
-    .exp_max        = (1 << E) - 1,                     \
-    .frac_size      = F
+    .exp_max        = (1 << E) - 1
 
 #define FLOAT_PARAMS(E, F)                              \
-    FLOAT_PARAMS_(E, F),                                \
+    FLOAT_PARAMS_(E),                                   \
+    .frac_size      = F,                                \
     .frac_shift     = (-F - 1) & 63,                    \
     .round_mask     = (1ull << ((-F - 1) & 63)) - 1
 
@@ -614,6 +614,18 @@ static const FloatFmt float128_params = {
     FLOAT_PARAMS(15, 112)
 };
 
+#define FLOATX80_PARAMS(R)              \
+    FLOAT_PARAMS_(15),                  \
+    .frac_size = R == 64 ? 63 : R,      \
+    .frac_shift = 0,                    \
+    .round_mask = R == 64 ? -1 : (1ull << ((-R - 1) & 63)) - 1
+
+static const FloatFmt floatx80_params[3] = {
+    [floatx80_precision_s] = { FLOATX80_PARAMS(23) },
+    [floatx80_precision_d] = { FLOATX80_PARAMS(52) },
+    [floatx80_precision_x] = { FLOATX80_PARAMS(64) },
+};
+
 /* Unpack a float to parts, but do not canonicalize.  */
 static void unpack_raw64(FloatParts64 *r, const FloatFmt *fmt, uint64_t raw)
 {
@@ -648,6 +660,16 @@ static inline void float64_unpack_raw(FloatParts64 *p, float64 f)
     unpack_raw64(p, &float64_params, f);
 }
 
+static void floatx80_unpack_raw(FloatParts128 *p, floatx80 f)
+{
+    *p = (FloatParts128) {
+        .cls = float_class_unclassified,
+        .sign = extract32(f.high, 15, 1),
+        .exp = extract32(f.high, 0, 15),
+        .frac_hi = f.low
+    };
+}
+
 static void float128_unpack_raw(FloatParts128 *p, float128 f)
 {
     const int f_size = float128_params.frac_size - 64;
@@ -1536,6 +1558,92 @@ static float128 float128_round_pack_canonical(FloatParts128 *p,
     return float128_pack_raw(p);
 }
 
+/* Returns false if the encoding is invalid. */
+static bool floatx80_unpack_canonical(FloatParts128 *p, floatx80 f,
+                                      float_status *s)
+{
+    /* Ensure rounding precision is set before beginning. */
+    switch (s->floatx80_rounding_precision) {
+    case floatx80_precision_x:
+    case floatx80_precision_d:
+    case floatx80_precision_s:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (unlikely(floatx80_invalid_encoding(f))) {
+        float_raise(float_flag_invalid, s);
+        return false;
+    }
+
+    floatx80_unpack_raw(p, f);
+
+    if (likely(p->exp != floatx80_params[floatx80_precision_x].exp_max)) {
+        parts_canonicalize(p, s, &floatx80_params[floatx80_precision_x]);
+    } else {
+        /* The explicit integer bit is ignored, after invalid checks. */
+        p->frac_hi &= MAKE_64BIT_MASK(0, 63);
+        p->cls = (p->frac_hi == 0 ? float_class_inf
+                  : parts_is_snan_frac(p->frac_hi, s)
+                  ? float_class_snan : float_class_qnan);
+    }
+    return true;
+}
+
+static floatx80 floatx80_round_pack_canonical(FloatParts128 *p,
+                                              float_status *s)
+{
+    const FloatFmt *fmt = &floatx80_params[s->floatx80_rounding_precision];
+    uint64_t frac;
+    int exp;
+
+    switch (p->cls) {
+    case float_class_normal:
+        if (s->floatx80_rounding_precision == floatx80_precision_x) {
+            parts_uncanon_normal(p, s, fmt);
+            frac = p->frac_hi;
+            exp = p->exp;
+        } else {
+            FloatParts64 p64;
+
+            p64.sign = p->sign;
+            p64.exp = p->exp;
+            frac_truncjam(&p64, p);
+            parts_uncanon_normal(&p64, s, fmt);
+            frac = p64.frac;
+            exp = p64.exp;
+        }
+        if (exp != fmt->exp_max) {
+            break;
+        }
+        /* rounded to inf -- fall through to set frac correctly */
+
+    case float_class_inf:
+        /* x86 and m68k differ in the setting of the integer bit. */
+        frac = floatx80_infinity_low;
+        exp = fmt->exp_max;
+        break;
+
+    case float_class_zero:
+        frac = 0;
+        exp = 0;
+        break;
+
+    case float_class_snan:
+    case float_class_qnan:
+        /* NaNs have the integer bit set. */
+        frac = p->frac_hi | (1ull << 63);
+        exp = fmt->exp_max;
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    return packFloatx80(p->sign, exp, frac);
+}
+
 /*
  * Addition and subtraction
  */
@@ -1725,6 +1833,30 @@ float128 float128_sub(float128 a, float128 b, float_status *status)
     return float128_addsub(a, b, status, true);
 }
 
+static floatx80 QEMU_FLATTEN
+floatx80_addsub(floatx80 a, floatx80 b, float_status *status, bool subtract)
+{
+    FloatParts128 pa, pb, *pr;
+
+    if (!floatx80_unpack_canonical(&pa, a, status) ||
+        !floatx80_unpack_canonical(&pb, b, status)) {
+        return floatx80_default_nan(status);
+    }
+
+    pr = parts_addsub(&pa, &pb, status, subtract);
+    return floatx80_round_pack_canonical(pr, status);
+}
+
+floatx80 floatx80_add(floatx80 a, floatx80 b, float_status *status)
+{
+    return floatx80_addsub(a, b, status, false);
+}
+
+floatx80 floatx80_sub(floatx80 a, floatx80 b, float_status *status)
+{
+    return floatx80_addsub(a, b, status, true);
+}
+
 /*
  * Multiplication
  */
@@ -5731,205 +5863,6 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of adding the absolute values of the extended double-
-| precision floating-point values `a' and `b'.  If `zSign' is 1, the sum is
-| negated before being returned.  `zSign' is ignored if the result is a NaN.
-| The addition is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-static floatx80 addFloatx80Sigs(floatx80 a, floatx80 b, bool zSign,
-                                float_status *status)
-{
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig, bSig, zSig0, zSig1;
-    int32_t expDiff;
-
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    bSig = extractFloatx80Frac( b );
-    bExp = extractFloatx80Exp( b );
-    expDiff = aExp - bExp;
-    if ( 0 < expDiff ) {
-        if ( aExp == 0x7FFF ) {
-            if ((uint64_t)(aSig << 1)) {
-                return propagateFloatx80NaN(a, b, status);
-            }
-            return a;
-        }
-        if ( bExp == 0 ) --expDiff;
-        shift64ExtraRightJamming( bSig, 0, expDiff, &bSig, &zSig1 );
-        zExp = aExp;
-    }
-    else if ( expDiff < 0 ) {
-        if ( bExp == 0x7FFF ) {
-            if ((uint64_t)(bSig << 1)) {
-                return propagateFloatx80NaN(a, b, status);
-            }
-            return packFloatx80(zSign,
-                                floatx80_infinity_high,
-                                floatx80_infinity_low);
-        }
-        if ( aExp == 0 ) ++expDiff;
-        shift64ExtraRightJamming( aSig, 0, - expDiff, &aSig, &zSig1 );
-        zExp = bExp;
-    }
-    else {
-        if ( aExp == 0x7FFF ) {
-            if ( (uint64_t) ( ( aSig | bSig )<<1 ) ) {
-                return propagateFloatx80NaN(a, b, status);
-            }
-            return a;
-        }
-        zSig1 = 0;
-        zSig0 = aSig + bSig;
-        if ( aExp == 0 ) {
-            if ((aSig | bSig) & UINT64_C(0x8000000000000000) && zSig0 < aSig) {
-                /* At least one of the values is a pseudo-denormal,
-                 * and there is a carry out of the result.  */
-                zExp = 1;
-                goto shiftRight1;
-            }
-            if (zSig0 == 0) {
-                return packFloatx80(zSign, 0, 0);
-            }
-            normalizeFloatx80Subnormal( zSig0, &zExp, &zSig0 );
-            goto roundAndPack;
-        }
-        zExp = aExp;
-        goto shiftRight1;
-    }
-    zSig0 = aSig + bSig;
-    if ( (int64_t) zSig0 < 0 ) goto roundAndPack;
- shiftRight1:
-    shift64ExtraRightJamming( zSig0, zSig1, 1, &zSig0, &zSig1 );
-    zSig0 |= UINT64_C(0x8000000000000000);
-    ++zExp;
- roundAndPack:
-    return roundAndPackFloatx80(status->floatx80_rounding_precision,
-                                zSign, zExp, zSig0, zSig1, status);
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of subtracting the absolute values of the extended
-| double-precision floating-point values `a' and `b'.  If `zSign' is 1, the
-| difference is negated before being returned.  `zSign' is ignored if the
-| result is a NaN.  The subtraction is performed according to the IEC/IEEE
-| Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-static floatx80 subFloatx80Sigs(floatx80 a, floatx80 b, bool zSign,
-                                float_status *status)
-{
-    int32_t aExp, bExp, zExp;
-    uint64_t aSig, bSig, zSig0, zSig1;
-    int32_t expDiff;
-
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    bSig = extractFloatx80Frac( b );
-    bExp = extractFloatx80Exp( b );
-    expDiff = aExp - bExp;
-    if ( 0 < expDiff ) goto aExpBigger;
-    if ( expDiff < 0 ) goto bExpBigger;
-    if ( aExp == 0x7FFF ) {
-        if ( (uint64_t) ( ( aSig | bSig )<<1 ) ) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    if ( aExp == 0 ) {
-        aExp = 1;
-        bExp = 1;
-    }
-    zSig1 = 0;
-    if ( bSig < aSig ) goto aBigger;
-    if ( aSig < bSig ) goto bBigger;
-    return packFloatx80(status->float_rounding_mode == float_round_down, 0, 0);
- bExpBigger:
-    if ( bExp == 0x7FFF ) {
-        if ((uint64_t)(bSig << 1)) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        return packFloatx80(zSign ^ 1, floatx80_infinity_high,
-                            floatx80_infinity_low);
-    }
-    if ( aExp == 0 ) ++expDiff;
-    shift128RightJamming( aSig, 0, - expDiff, &aSig, &zSig1 );
- bBigger:
-    sub128( bSig, 0, aSig, zSig1, &zSig0, &zSig1 );
-    zExp = bExp;
-    zSign ^= 1;
-    goto normalizeRoundAndPack;
- aExpBigger:
-    if ( aExp == 0x7FFF ) {
-        if ((uint64_t)(aSig << 1)) {
-            return propagateFloatx80NaN(a, b, status);
-        }
-        return a;
-    }
-    if ( bExp == 0 ) --expDiff;
-    shift128RightJamming( bSig, 0, expDiff, &bSig, &zSig1 );
- aBigger:
-    sub128( aSig, 0, bSig, zSig1, &zSig0, &zSig1 );
-    zExp = aExp;
- normalizeRoundAndPack:
-    return normalizeRoundAndPackFloatx80(status->floatx80_rounding_precision,
-                                         zSign, zExp, zSig0, zSig1, status);
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of adding the extended double-precision floating-point
-| values `a' and `b'.  The operation is performed according to the IEC/IEEE
-| Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_add(floatx80 a, floatx80 b, float_status *status)
-{
-    bool aSign, bSign;
-
-    if (floatx80_invalid_encoding(a) || floatx80_invalid_encoding(b)) {
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    aSign = extractFloatx80Sign( a );
-    bSign = extractFloatx80Sign( b );
-    if ( aSign == bSign ) {
-        return addFloatx80Sigs(a, b, aSign, status);
-    }
-    else {
-        return subFloatx80Sigs(a, b, aSign, status);
-    }
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of subtracting the extended double-precision floating-
-| point values `a' and `b'.  The operation is performed according to the
-| IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_sub(floatx80 a, floatx80 b, float_status *status)
-{
-    bool aSign, bSign;
-
-    if (floatx80_invalid_encoding(a) || floatx80_invalid_encoding(b)) {
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    aSign = extractFloatx80Sign( a );
-    bSign = extractFloatx80Sign( b );
-    if ( aSign == bSign ) {
-        return subFloatx80Sigs(a, b, aSign, status);
-    }
-    else {
-        return addFloatx80Sigs(a, b, aSign, status);
-    }
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of multiplying the extended double-precision floating-
 | point values `a' and `b'.  The operation is performed according to the
-- 
2.25.1


