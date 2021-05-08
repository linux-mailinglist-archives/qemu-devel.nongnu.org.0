Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918F8376EEC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:44:06 +0200 (CEST)
Received: from localhost ([::1]:57412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCwn-0007Tm-F7
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8H-0003V2-Hl
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:54 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC87-0005XX-Kc
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:53 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t4so6147284plc.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgYCwPvh5My93odn7SHxHn9PhuRLyEzfRYFAgcYen7A=;
 b=jXechgJwtehhJeIZED74Mozp6a0EamovWsC8DS9Pmhis8Hfw0+kGbSdMhTVZe6jgQ6
 +v2KedTdHuA1hxEAQPtiic8bLJ25yTOtk5m+f4Epjf7NVzKaMfOzvRBQqEuMD23DpsB1
 08NzDqBybEoQ0+kg72MSOJA97Lm4OOI3dKahWszpfYn3jEzymiI+uf7E4zD6yyB1kJiG
 +ayQ8OSSmg+aohZEEQ8dtsVlEW7SayLC98Iyd4ZMPNwswn95g/hiL5eaNqB7NUKb98Za
 JiHsVEx7HWfY2XK4d5nl7XoDz+QcrMcizQCtcYyD7m18GKBTZ9EfiQMZ2ADA+OlrraUb
 CNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgYCwPvh5My93odn7SHxHn9PhuRLyEzfRYFAgcYen7A=;
 b=sr7Jq8xbywcXnxj0kvvIqDGE1UMnEpDyaSZMuA8jJFs3r3wvpfOplCzN2vevKIqx/1
 oxIBGWdnDoIGpTxaBYeB60DHyxhiewfEZgL6eVYRPNwrACpS3sJYMu/eKtTcIMyfdElm
 U+qCAv3oxAe+fbihYA82EUxNrUZApNzujWIlqioadfhGAUY0vR1UkoOVYt9xLQWVjnC2
 +TfxQqCpzh+HuG5Jes8dFvRK5wBkYqgexCw340HpvZXBHrATNSrS92UQDIQX6Ez+JJMk
 kpAPfgPelWnsOd79D7gkUrDarexpUeyVZLY7IKsYO4EzVrhLsQp4PTcak8XT2GF7TvAY
 ME2A==
X-Gm-Message-State: AOAM531KXfT5+4FiGcA1U9p8u9ZJBY2swmZcu7+fkf08T+jJDbxbS7mj
 bRi76IKH/unoYGHrH4ppRBJJW6ILBbkhMg==
X-Google-Smtp-Source: ABdhPJyzzjBxwapp7/wmQbE7PCBP2EnTdl5kjF1584LdWU3CJybMXq2t88R6e0GIgHrh2YPKLV99nA==
X-Received: by 2002:a17:90a:1382:: with SMTP id
 i2mr26470687pja.83.1620438702294; 
 Fri, 07 May 2021 18:51:42 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 59/72] softfloat: Convert floatx80_add/sub to FloatParts
Date: Fri,  7 May 2021 18:47:49 -0700
Message-Id: <20210508014802.892561-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Since this is the first such, this includes all of the
packing and unpacking routines as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 339 +++++++++++++++++++-----------------------------
 1 file changed, 136 insertions(+), 203 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 441b8f9dc1..3c6751e4d0 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -577,14 +577,14 @@ typedef struct {
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
 
@@ -613,6 +613,18 @@ static const FloatFmt float128_params = {
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
@@ -647,6 +659,16 @@ static inline void float64_unpack_raw(FloatParts64 *p, float64 f)
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
@@ -1535,6 +1557,92 @@ static float128 float128_round_pack_canonical(FloatParts128 *p,
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
@@ -1724,6 +1832,30 @@ float128 float128_sub(float128 a, float128 b, float_status *status)
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
@@ -5733,205 +5865,6 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
 
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


