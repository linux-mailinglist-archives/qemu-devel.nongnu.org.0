Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546673906BE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:36:48 +0200 (CEST)
Received: from localhost ([::1]:50884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lla2x-0003Yd-9O
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeh-00020W-FE
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:39 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:37875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeQ-0006km-K1
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:39 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u7so7928776plq.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CI/R/53O81mXWi9nTuhnEYZUkbwrVqzqCqbujiTaNEg=;
 b=wnQiYUJ8E86Ndlp0TOSzjXXk/6Ril2ez3ITu9iluONdOOe/Z0EXK+QHNd19tBovTQ9
 I1dWSumbnLfQ5rswhRa0POpmG3NYE5sg9/NB/BxzcPzcieyUV/ooPIUBmNqUBrGcuNv5
 EC6/Zh9PpFnsq/DAXObPSHHNBOdeGwP6OnGg2eyGMgNnYCa9Y8zAt7qMjkvX7X2UK4QG
 tWFe0G20yavm+rrNJ2ihDPy3QOsGN8sdTxEUmJgXUu0w3/nmFggMaou5yhMSLb8AR3RQ
 R4w06ECQ5K1VZhvXZoN5ZCuEJZQQ75qLEZHyq/pknWxtZE6MGJxFy4f8nblNBUGgvG0o
 bmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CI/R/53O81mXWi9nTuhnEYZUkbwrVqzqCqbujiTaNEg=;
 b=FXqf3F587FT4t7Ope52ri4wmkzhbXioeM3tIMU1U3S3wSNSTEDl3VGy3h54L5gZZHe
 NP69u4/xYudRE4aCJaDwyzk/XHPmWoX/hmZjgisTwVpXz3SoSX/Ac8AG9xCRGrdJiRkN
 bJ27NooNk7EsUt2nl9SdQHSR2CULFiXMNaElrCP47ujCusYIECr0YqLusIvSWLOZCSH9
 Poj0lRVSRwoTJuhDWT7FlJtopXvLmsjU2995bjIV0OY2HkbHyBhtFgR0NelQL895yurt
 TgODQ8NHMQ0akBZ1jG6YJ86IfY1+lrdC7g9udr8Sn88FQ4dr7IiQV5spHJXqpSBs6vm6
 VqIA==
X-Gm-Message-State: AOAM532nftglzpHQWy8tJ4EtQHCuj8D4CNAfFaeebQjx5tEzAUcjNo8M
 rL7XZhSnrmcFNtpMMUyzf2Tvy070Qt9w4g==
X-Google-Smtp-Source: ABdhPJzraaLODrAKECNtwyIWK7qjABStI7WeMR1o3GfvOyuMhGrpIKz1xD/M0aHRpInajPauTS9p4Q==
X-Received: by 2002:a17:90a:e2c7:: with SMTP id
 fr7mr31156346pjb.145.1621955240964; 
 Tue, 25 May 2021 08:07:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/28] softfloat: Convert floatx80 to integer to FloatParts
Date: Tue, 25 May 2021 08:06:59 -0700
Message-Id: <20210525150706.294968-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 336 ++++++------------------------------------------
 1 file changed, 42 insertions(+), 294 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 435be2a0bf..52a9aa1837 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2829,6 +2829,28 @@ static int64_t float128_to_int64_scalbn(float128 a, FloatRoundMode rmode,
     return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
+static int32_t floatx80_to_int32_scalbn(floatx80 a, FloatRoundMode rmode,
+                                        int scale, float_status *s)
+{
+    FloatParts128 p;
+
+    if (!floatx80_unpack_canonical(&p, a, s)) {
+        parts_default_nan(&p, s);
+    }
+    return parts_float_to_sint(&p, rmode, scale, INT32_MIN, INT32_MAX, s);
+}
+
+static int64_t floatx80_to_int64_scalbn(floatx80 a, FloatRoundMode rmode,
+                                        int scale, float_status *s)
+{
+    FloatParts128 p;
+
+    if (!floatx80_unpack_canonical(&p, a, s)) {
+        parts_default_nan(&p, s);
+    }
+    return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
+}
+
 int8_t float16_to_int8(float16 a, float_status *s)
 {
     return float16_to_int8_scalbn(a, s->float_rounding_mode, 0, s);
@@ -2889,6 +2911,16 @@ int64_t float128_to_int64(float128 a, float_status *s)
     return float128_to_int64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+int32_t floatx80_to_int32(floatx80 a, float_status *s)
+{
+    return floatx80_to_int32_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
+int64_t floatx80_to_int64(floatx80 a, float_status *s)
+{
+    return floatx80_to_int64_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
 int16_t float16_to_int16_round_to_zero(float16 a, float_status *s)
 {
     return float16_to_int16_scalbn(a, float_round_to_zero, 0, s);
@@ -2944,6 +2976,16 @@ int64_t float128_to_int64_round_to_zero(float128 a, float_status *s)
     return float128_to_int64_scalbn(a, float_round_to_zero, 0, s);
 }
 
+int32_t floatx80_to_int32_round_to_zero(floatx80 a, float_status *s)
+{
+    return floatx80_to_int32_scalbn(a, float_round_to_zero, 0, s);
+}
+
+int64_t floatx80_to_int64_round_to_zero(floatx80 a, float_status *s)
+{
+    return floatx80_to_int64_scalbn(a, float_round_to_zero, 0, s);
+}
+
 int16_t bfloat16_to_int16(bfloat16 a, float_status *s)
 {
     return bfloat16_to_int16_scalbn(a, s->float_rounding_mode, 0, s);
@@ -4163,127 +4205,6 @@ bfloat16 bfloat16_squash_input_denormal(bfloat16 a, float_status *status)
     return a;
 }
 
-/*----------------------------------------------------------------------------
-| Takes a 64-bit fixed-point value `absZ' with binary point between bits 6
-| and 7, and returns the properly rounded 32-bit integer corresponding to the
-| input.  If `zSign' is 1, the input is negated before being converted to an
-| integer.  Bit 63 of `absZ' must be zero.  Ordinarily, the fixed-point input
-| is simply rounded to an integer, with the inexact exception raised if the
-| input cannot be represented exactly as an integer.  However, if the fixed-
-| point input is too large, the invalid exception is raised and the largest
-| positive or negative integer is returned.
-*----------------------------------------------------------------------------*/
-
-static int32_t roundAndPackInt32(bool zSign, uint64_t absZ,
-                                 float_status *status)
-{
-    int8_t roundingMode;
-    bool roundNearestEven;
-    int8_t roundIncrement, roundBits;
-    int32_t z;
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
-        roundIncrement = absZ & 0x80 ? 0 : 0x7f;
-        break;
-    default:
-        abort();
-    }
-    roundBits = absZ & 0x7F;
-    absZ = ( absZ + roundIncrement )>>7;
-    if (!(roundBits ^ 0x40) && roundNearestEven) {
-        absZ &= ~1;
-    }
-    z = absZ;
-    if ( zSign ) z = - z;
-    if ( ( absZ>>32 ) || ( z && ( ( z < 0 ) ^ zSign ) ) ) {
-        float_raise(float_flag_invalid, status);
-        return zSign ? INT32_MIN : INT32_MAX;
-    }
-    if (roundBits) {
-        float_raise(float_flag_inexact, status);
-    }
-    return z;
-
-}
-
-/*----------------------------------------------------------------------------
-| Takes the 128-bit fixed-point value formed by concatenating `absZ0' and
-| `absZ1', with binary point between bits 63 and 64 (between the input words),
-| and returns the properly rounded 64-bit integer corresponding to the input.
-| If `zSign' is 1, the input is negated before being converted to an integer.
-| Ordinarily, the fixed-point input is simply rounded to an integer, with
-| the inexact exception raised if the input cannot be represented exactly as
-| an integer.  However, if the fixed-point input is too large, the invalid
-| exception is raised and the largest positive or negative integer is
-| returned.
-*----------------------------------------------------------------------------*/
-
-static int64_t roundAndPackInt64(bool zSign, uint64_t absZ0, uint64_t absZ1,
-                               float_status *status)
-{
-    int8_t roundingMode;
-    bool roundNearestEven, increment;
-    int64_t z;
-
-    roundingMode = status->float_rounding_mode;
-    roundNearestEven = ( roundingMode == float_round_nearest_even );
-    switch (roundingMode) {
-    case float_round_nearest_even:
-    case float_round_ties_away:
-        increment = ((int64_t) absZ1 < 0);
-        break;
-    case float_round_to_zero:
-        increment = 0;
-        break;
-    case float_round_up:
-        increment = !zSign && absZ1;
-        break;
-    case float_round_down:
-        increment = zSign && absZ1;
-        break;
-    case float_round_to_odd:
-        increment = !(absZ0 & 1) && absZ1;
-        break;
-    default:
-        abort();
-    }
-    if ( increment ) {
-        ++absZ0;
-        if ( absZ0 == 0 ) goto overflow;
-        if (!(absZ1 << 1) && roundNearestEven) {
-            absZ0 &= ~1;
-        }
-    }
-    z = absZ0;
-    if ( zSign ) z = - z;
-    if ( z && ( ( z < 0 ) ^ zSign ) ) {
- overflow:
-        float_raise(float_flag_invalid, status);
-        return zSign ? INT64_MIN : INT64_MAX;
-    }
-    if (absZ1) {
-        float_raise(float_flag_inexact, status);
-    }
-    return z;
-
-}
-
 /*----------------------------------------------------------------------------
 | Normalizes the subnormal single-precision floating-point value represented
 | by the denormalized significand `aSig'.  The normalized exponent and
@@ -5489,179 +5410,6 @@ float64 float64_log2(float64 a, float_status *status)
     return normalizeRoundAndPackFloat64(zSign, 0x408, zSig, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the extended double-precision floating-
-| point value `a' to the 32-bit two's complement integer format.  The
-| conversion is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic---which means in particular that the conversion
-| is rounded according to the current rounding mode.  If `a' is a NaN, the
-| largest positive integer is returned.  Otherwise, if the conversion
-| overflows, the largest integer with the same sign as `a' is returned.
-*----------------------------------------------------------------------------*/
-
-int32_t floatx80_to_int32(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, shiftCount;
-    uint64_t aSig;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return 1 << 31;
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig<<1 ) ) aSign = 0;
-    shiftCount = 0x4037 - aExp;
-    if ( shiftCount <= 0 ) shiftCount = 1;
-    shift64RightJamming( aSig, shiftCount, &aSig );
-    return roundAndPackInt32(aSign, aSig, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the extended double-precision floating-
-| point value `a' to the 32-bit two's complement integer format.  The
-| conversion is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic, except that the conversion is always rounded
-| toward zero.  If `a' is a NaN, the largest positive integer is returned.
-| Otherwise, if the conversion overflows, the largest integer with the same
-| sign as `a' is returned.
-*----------------------------------------------------------------------------*/
-
-int32_t floatx80_to_int32_round_to_zero(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, shiftCount;
-    uint64_t aSig, savedASig;
-    int32_t z;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return 1 << 31;
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    if ( 0x401E < aExp ) {
-        if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig<<1 ) ) aSign = 0;
-        goto invalid;
-    }
-    else if ( aExp < 0x3FFF ) {
-        if (aExp || aSig) {
-            float_raise(float_flag_inexact, status);
-        }
-        return 0;
-    }
-    shiftCount = 0x403E - aExp;
-    savedASig = aSig;
-    aSig >>= shiftCount;
-    z = aSig;
-    if ( aSign ) z = - z;
-    if ( ( z < 0 ) ^ aSign ) {
- invalid:
-        float_raise(float_flag_invalid, status);
-        return aSign ? (int32_t) 0x80000000 : 0x7FFFFFFF;
-    }
-    if ( ( aSig<<shiftCount ) != savedASig ) {
-        float_raise(float_flag_inexact, status);
-    }
-    return z;
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the extended double-precision floating-
-| point value `a' to the 64-bit two's complement integer format.  The
-| conversion is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic---which means in particular that the conversion
-| is rounded according to the current rounding mode.  If `a' is a NaN,
-| the largest positive integer is returned.  Otherwise, if the conversion
-| overflows, the largest integer with the same sign as `a' is returned.
-*----------------------------------------------------------------------------*/
-
-int64_t floatx80_to_int64(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, shiftCount;
-    uint64_t aSig, aSigExtra;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return 1ULL << 63;
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    shiftCount = 0x403E - aExp;
-    if ( shiftCount <= 0 ) {
-        if ( shiftCount ) {
-            float_raise(float_flag_invalid, status);
-            if (!aSign || floatx80_is_any_nan(a)) {
-                return INT64_MAX;
-            }
-            return INT64_MIN;
-        }
-        aSigExtra = 0;
-    }
-    else {
-        shift64ExtraRightJamming( aSig, 0, shiftCount, &aSig, &aSigExtra );
-    }
-    return roundAndPackInt64(aSign, aSig, aSigExtra, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the extended double-precision floating-
-| point value `a' to the 64-bit two's complement integer format.  The
-| conversion is performed according to the IEC/IEEE Standard for Binary
-| Floating-Point Arithmetic, except that the conversion is always rounded
-| toward zero.  If `a' is a NaN, the largest positive integer is returned.
-| Otherwise, if the conversion overflows, the largest integer with the same
-| sign as `a' is returned.
-*----------------------------------------------------------------------------*/
-
-int64_t floatx80_to_int64_round_to_zero(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, shiftCount;
-    uint64_t aSig;
-    int64_t z;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return 1ULL << 63;
-    }
-    aSig = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    shiftCount = aExp - 0x403E;
-    if ( 0 <= shiftCount ) {
-        aSig &= UINT64_C(0x7FFFFFFFFFFFFFFF);
-        if ( ( a.high != 0xC03E ) || aSig ) {
-            float_raise(float_flag_invalid, status);
-            if ( ! aSign || ( ( aExp == 0x7FFF ) && aSig ) ) {
-                return INT64_MAX;
-            }
-        }
-        return INT64_MIN;
-    }
-    else if ( aExp < 0x3FFF ) {
-        if (aExp | aSig) {
-            float_raise(float_flag_inexact, status);
-        }
-        return 0;
-    }
-    z = aSig>>( - shiftCount );
-    if ( (uint64_t) ( aSig<<( shiftCount & 63 ) ) ) {
-        float_raise(float_flag_inexact, status);
-    }
-    if ( aSign ) z = - z;
-    return z;
-
-}
-
 /*----------------------------------------------------------------------------
 | Rounds the extended double-precision floating-point value `a'
 | to the precision provided by floatx80_rounding_precision and returns the
-- 
2.25.1


