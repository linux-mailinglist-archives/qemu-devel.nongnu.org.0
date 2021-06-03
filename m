Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB9539AD52
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:57:19 +0200 (CEST)
Received: from localhost ([::1]:53534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovL4-0003HX-Ru
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6E-0002mB-0e
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:58 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov65-00019x-Dn
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 l10-20020a17090a150ab0290162974722f2so4698503pja.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eDlW17rU8x/GJbEZkz3v/6Nuf9ddIpOuVKL6VdfQvSc=;
 b=B1jqC3pH0WXJBFPhb9AbXf2X67Cd/mvjZfX7Ir1wV1+ZnKOfLdy/+gu4Jmrj6D8Whg
 XugecYvY54nL4j6SVaI1Jo+m3jmCSd/UR/I8HkieRhXkQJ04TxrPIPaQACRqN8GCq8BR
 fuQ1hkzPv6fv4zrl6SdkiEvahMtIpa2hYCX7Y5gzomBTcIdK5aE/T2sq/i4usqciqhds
 MrLvMe3D/WYim8YOEHiwYld0k83a+TbUxUOHhPHmEg/xePYRmxWABpJ44SEh5pzV9XYo
 +2qGh+pY201pAgLh+7nHJpUxBXa+Uw0QIsmQt7GpXw4QSt8XShY7OMlkfe4CzO08H9Ae
 WH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDlW17rU8x/GJbEZkz3v/6Nuf9ddIpOuVKL6VdfQvSc=;
 b=B0Lc6UvK2yva3mO8oGKBvQNA3E013GLJggxJbYzqjSu0kAGwoj4Fod0V4DGHGn0z93
 FHELoTP27qysNjheuTK5H7qIrew+BaAqmsfjsaXFg1/J6LlX+/3dYkWR4RqiFKDoWd+z
 mWW5VfbPYGINw60H1Z2gH67swvpBFSGXYb05ly35QNormj7y7pcD1Os27SzAGUQRgDF0
 hAezcu3hj2uk3aExkquc7l2ny8B07yIafHlYECMoQyy1ypztbZGHHuJC8R4TDhw8/A/X
 LjApuQlPvN/dYfLEXnE6YehUhddN2SnT73mPJ8HZfonr2w437UinRgwtqhgKvIZvfcnW
 yTnA==
X-Gm-Message-State: AOAM5316TpPkAP6sIG1Bz/L289v+QJdMhnCLY8WGjeiv3P3rke0DNl7i
 7+fUh++8HXJ0PZoT+pfdzag1ZA0RkFS00A==
X-Google-Smtp-Source: ABdhPJykl6ATaiz7M2EQyGJG+GxvqO0xUISIWzPUBtdiYKq8E0pUxJ/9EZykmBigsLbplUOzt4s36A==
X-Received: by 2002:a17:902:d643:b029:ef:62cd:eeed with SMTP id
 y3-20020a170902d643b02900ef62cdeeedmr1120652plh.42.1622756507220; 
 Thu, 03 Jun 2021 14:41:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/29] softfloat: Convert floatx80 to integer to FloatParts
Date: Thu,  3 Jun 2021 14:41:24 -0700
Message-Id: <20210603214131.629841-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 336 ++++++------------------------------------------
 1 file changed, 42 insertions(+), 294 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index acaab6a127..5a2a872408 100644
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
@@ -4160,127 +4202,6 @@ bfloat16 bfloat16_squash_input_denormal(bfloat16 a, float_status *status)
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
@@ -5486,179 +5407,6 @@ float64 float64_log2(float64 a, float_status *status)
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


