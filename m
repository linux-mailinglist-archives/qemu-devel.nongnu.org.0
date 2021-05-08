Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F14BC376EE2
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:38:58 +0200 (CEST)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCrp-00050J-KJ
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8K-0003WM-7w
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8D-0005Zw-Dr
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:55 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 b14-20020a17090a6e0eb0290155c7f6a356so5542395pjk.0
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FAQ0+Arx3hcf96RReOfO4wuHa+U02gZo3qBKfpYs2sk=;
 b=yC4xlohb0tUF/oOtI74jouRTzO7PRrGiSU1KIsKcnm/aTb+Ax3xa49oWWya8PNFOpk
 Msca6B/49y/qNL5HOyq8bDC8OGDOjdkh/EIp3coT9nbKiAmhLXXUJerPUG/T94T4XZZ+
 IK1lQsjjWMlfY3tGyKySY4WT1K7g5ecJ1iP/ah2nh/L3XAzbRgBvsBRUqERWrOUmo19r
 ST8HtZhX4IMMtj2rk0LtuFUyn4sMAhjcXVS/Tq0GA6S1/pyWkpYUIer2/HtlsO46BKFU
 WD2YtUm/a4Q8tsWgQ3+DeKqPzt9sNNGK9ym4ogcWMBaYjHKkCm61JSASwg+XQ8bRk8vh
 K2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FAQ0+Arx3hcf96RReOfO4wuHa+U02gZo3qBKfpYs2sk=;
 b=GVFoN+bUZCPh1++hBCnMQq/4POPo1fBV6nRzLFIIOp4XZZJb2bSToBR2eIHGuYhybr
 l/iU+Mg6PV9rNsAakMOMImvD6XaIFh+9llf9ol9JVg7Fl6Wn2qRX7O/2QV+Iyp5BgkiL
 ao9uYyG7sBGIqtjPimHcl456beK46aLLq6ovNocCby9xTXxSDMhd04AOFrF68hBoFB1M
 1FWLN60UZ4GizMcF1v700sCz5NSXyFSdW6D5E83Br5E3PXreI/21PtKhpH3CGF00yap6
 XH1ikayzZCD6VbvjpAwCZHb8wRnIj97wCpWFX6Rf1U+i5v1G+2gV7dM1AfKTAfcVjZb3
 0taA==
X-Gm-Message-State: AOAM532opjbohl6Ysiw93PMy8oEf9pOkUoMgVPzSanRkvIziNeZj3l7k
 BZgDEFMDM4k+CvA7FEl60ADmnxnWzuPhxQ==
X-Google-Smtp-Source: ABdhPJxsmJXvUm96IAVESzGBPEOaRiL3q3+zEy80LTLAB2ol7+euATAs7EMHL3SmnrpunxcKlSjvAg==
X-Received: by 2002:a17:90a:6285:: with SMTP id
 d5mr13829613pjj.136.1620438707213; 
 Fri, 07 May 2021 18:51:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 67/72] softfloat: Convert floatx80 to integer to FloatParts
Date: Fri,  7 May 2021 18:47:57 -0700
Message-Id: <20210508014802.892561-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 336 ++++++------------------------------------------
 1 file changed, 42 insertions(+), 294 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index d7c6c37d99..9f28c5c058 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2828,6 +2828,28 @@ static int64_t float128_to_int64_scalbn(float128 a, FloatRoundMode rmode,
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
@@ -2888,6 +2910,16 @@ int64_t float128_to_int64(float128 a, float_status *s)
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
@@ -2943,6 +2975,16 @@ int64_t float128_to_int64_round_to_zero(float128 a, float_status *s)
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
@@ -4162,127 +4204,6 @@ bfloat16 bfloat16_squash_input_denormal(bfloat16 a, float_status *status)
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
@@ -5488,179 +5409,6 @@ float64 float64_log2(float64 a, float_status *status)
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


