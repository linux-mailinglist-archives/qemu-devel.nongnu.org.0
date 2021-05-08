Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE295376ECC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:32:00 +0200 (CEST)
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCl5-00068P-Q0
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC80-0002kn-1P
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:36 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7x-0005Qd-Sd
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:35 -0400
Received: by mail-pg1-x530.google.com with SMTP id i5so3886826pgm.0
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NmfQRKXb4KL5cYYsxkAJAYTlB0HbS3cmX2hT3HN7i+I=;
 b=bf2u63eVDvx6kgXw1fwgCnw3JkMlxALkwMBy6d6uIWrBH6aw+Nr3tqm2RyvZNomg5p
 Mrm495QltmimR2Hy+CPDXQBLKCtTR1CCmj/vxihUbxfEfxFiMAlpBfExSOOKTsoEUpGu
 NknGXBrWuSMwWPrJxHLAnBQrlw5eA285WmdKbHpQkC20PWY4ETOZx5yPBcYEfbMsLvPa
 09sJ6pI6MQVih8FgPdmoA+C4mOeqCP8srDbKsLICarBh4e9QZcCYFzo8+/uwsYuygLYH
 zKnwXiDutqYghT0ulArXOAGA3iBVXVnlQ0zAi7cFfw6gw9pGKVphwhaS+y9eFYDXlvlE
 PHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NmfQRKXb4KL5cYYsxkAJAYTlB0HbS3cmX2hT3HN7i+I=;
 b=TDilsDk2Wcs7U/O/ABMExC0Ycd+j215G6h0+ebnRGMuwkKGE8rHh8bcFjAA9tNpEbr
 Zq00bm0GYYwkBYI7nT1q1vkMr7qRtujKPKE2eRvV6fGhxCW+5I5G0YEYxxR8B/AH2FmF
 dI1kwTz5he9NGGLDarWVpu0F3w2zjUfCm0PeA8SNTOaJ0wT01iyprRnITVYWaRUXnmHM
 8aQ0zcMFVT+F/WpC7jDLLV96A84v7Xcd7BZ+dziuGRPaXPJwGHBE9bkuOC6pEIxBLVFJ
 0YGZ9KFpDwj6omyACb1hOZikt9EWlB2eIHhXWqk1S3BLfQnEZPBTSmmeYXdybq+2w+zD
 fu7Q==
X-Gm-Message-State: AOAM533U83PIAf0DgQOYuxCxjEF+Hp8VY2bFmSwf1FR0LipAU/2Ov9ww
 zKVYthV0P702ehFsl5G76R/eb7xAWwilEw==
X-Google-Smtp-Source: ABdhPJwiigpFzl1gTb2+p7QNxEoqYReqOi79QCZ2EduukE1Psq1VtQmOIuUA7nSdJKJ6M5aG3ytDKQ==
X-Received: by 2002:a63:ff45:: with SMTP id s5mr13065095pgk.274.1620438692482; 
 Fri, 07 May 2021 18:51:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 44/72] softfloat: Convert float-to-float conversions with
 float128
Date: Fri,  7 May 2021 18:47:34 -0700
Message-Id: <20210508014802.892561-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
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

Introduce parts_float_to_float_widen and parts_float_to_float_narrow.
Use them for float128_to_float{32,64} and float{32,64}_to_float128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 203 ++++++++++++++++--------------------------------
 1 file changed, 69 insertions(+), 134 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 06fac8f41c..1b86111279 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2091,6 +2091,35 @@ static void parts128_float_to_float(FloatParts128 *a, float_status *s)
 #define parts_float_to_float(P, S) \
     PARTS_GENERIC_64_128(float_to_float, P)(P, S)
 
+static void parts_float_to_float_narrow(FloatParts64 *a, FloatParts128 *b,
+                                        float_status *s)
+{
+    a->cls = b->cls;
+    a->sign = b->sign;
+    a->exp = b->exp;
+
+    if (a->cls == float_class_normal) {
+        frac_truncjam(a, b);
+    } else if (is_nan(a->cls)) {
+        /* Discard the low bits of the NaN. */
+        a->frac = b->frac_hi;
+        parts_return_nan(a, s);
+    }
+}
+
+static void parts_float_to_float_widen(FloatParts128 *a, FloatParts64 *b,
+                                       float_status *s)
+{
+    a->cls = b->cls;
+    a->sign = b->sign;
+    a->exp = b->exp;
+    frac_widen(a, b);
+
+    if (is_nan(a->cls)) {
+        parts_return_nan(a, s);
+    }
+}
+
 float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
@@ -2214,6 +2243,46 @@ bfloat16 float64_to_bfloat16(float64 a, float_status *s)
     return bfloat16_round_pack_canonical(&p, s);
 }
 
+float32 float128_to_float32(float128 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float128_unpack_canonical(&p128, a, s);
+    parts_float_to_float_narrow(&p64, &p128, s);
+    return float32_round_pack_canonical(&p64, s);
+}
+
+float64 float128_to_float64(float128 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float128_unpack_canonical(&p128, a, s);
+    parts_float_to_float_narrow(&p64, &p128, s);
+    return float64_round_pack_canonical(&p64, s);
+}
+
+float128 float32_to_float128(float32 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float32_unpack_canonical(&p64, a, s);
+    parts_float_to_float_widen(&p128, &p64, s);
+    return float128_round_pack_canonical(&p128, s);
+}
+
+float128 float64_to_float128(float64 a, float_status *s)
+{
+    FloatParts64 p64;
+    FloatParts128 p128;
+
+    float64_unpack_canonical(&p64, a, s);
+    parts_float_to_float_widen(&p128, &p64, s);
+    return float128_round_pack_canonical(&p128, s);
+}
+
 /*
  * Rounds the floating-point value `a' to an integer, and returns the
  * result as a floating-point value. The operation is performed
@@ -5174,38 +5243,6 @@ floatx80 float32_to_floatx80(float32 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the single-precision floating-point value
-| `a' to the double-precision floating-point format.  The conversion is
-| performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float32_to_float128(float32 a, float_status *status)
-{
-    bool aSign;
-    int aExp;
-    uint32_t aSig;
-
-    a = float32_squash_input_denormal(a, status);
-    aSig = extractFloat32Frac( a );
-    aExp = extractFloat32Exp( a );
-    aSign = extractFloat32Sign( a );
-    if ( aExp == 0xFF ) {
-        if (aSig) {
-            return commonNaNToFloat128(float32ToCommonNaN(a, status), status);
-        }
-        return packFloat128( aSign, 0x7FFF, 0, 0 );
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloat128( aSign, 0, 0, 0 );
-        normalizeFloat32Subnormal( aSig, &aExp, &aSig );
-        --aExp;
-    }
-    return packFloat128( aSign, aExp + 0x3F80, ( (uint64_t) aSig )<<25, 0 );
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the single-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
@@ -5479,40 +5516,6 @@ floatx80 float64_to_floatx80(float64 a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the double-precision floating-point value
-| `a' to the quadruple-precision floating-point format.  The conversion is
-| performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 float64_to_float128(float64 a, float_status *status)
-{
-    bool aSign;
-    int aExp;
-    uint64_t aSig, zSig0, zSig1;
-
-    a = float64_squash_input_denormal(a, status);
-    aSig = extractFloat64Frac( a );
-    aExp = extractFloat64Exp( a );
-    aSign = extractFloat64Sign( a );
-    if ( aExp == 0x7FF ) {
-        if (aSig) {
-            return commonNaNToFloat128(float64ToCommonNaN(a, status), status);
-        }
-        return packFloat128( aSign, 0x7FFF, 0, 0 );
-    }
-    if ( aExp == 0 ) {
-        if ( aSig == 0 ) return packFloat128( aSign, 0, 0, 0 );
-        normalizeFloat64Subnormal( aSig, &aExp, &aSig );
-        --aExp;
-    }
-    shift128Right( aSig, 0, 4, &zSig0, &zSig1 );
-    return packFloat128( aSign, aExp + 0x3C00, zSig0, zSig1 );
-
-}
-
-
 /*----------------------------------------------------------------------------
 | Returns the remainder of the double-precision floating-point value `a'
 | with respect to the corresponding value `b'.  The operation is performed
@@ -6914,74 +6917,6 @@ uint32_t float128_to_uint32(float128 a, float_status *status)
     return res;
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the single-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float32 float128_to_float32(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t aSig0, aSig1;
-    uint32_t zSig;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ( aSig0 | aSig1 ) {
-            return commonNaNToFloat32(float128ToCommonNaN(a, status), status);
-        }
-        return packFloat32( aSign, 0xFF, 0 );
-    }
-    aSig0 |= ( aSig1 != 0 );
-    shift64RightJamming( aSig0, 18, &aSig0 );
-    zSig = aSig0;
-    if ( aExp || zSig ) {
-        zSig |= 0x40000000;
-        aExp -= 0x3F81;
-    }
-    return roundAndPackFloat32(aSign, aExp, zSig, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the double-precision floating-point format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float64 float128_to_float64(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t aSig0, aSig1;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ( aSig0 | aSig1 ) {
-            return commonNaNToFloat64(float128ToCommonNaN(a, status), status);
-        }
-        return packFloat64( aSign, 0x7FF, 0 );
-    }
-    shortShift128Left( aSig0, aSig1, 14, &aSig0, &aSig1 );
-    aSig0 |= ( aSig1 != 0 );
-    if ( aExp || aSig0 ) {
-        aSig0 |= UINT64_C(0x4000000000000000);
-        aExp -= 0x3C01;
-    }
-    return roundAndPackFloat64(aSign, aExp, aSig0, status);
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the quadruple-precision floating-point
 | value `a' to the extended double-precision floating-point format.  The
-- 
2.25.1


