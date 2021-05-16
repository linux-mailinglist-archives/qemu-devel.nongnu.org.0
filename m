Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB10381F05
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:10:34 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGXR-0008O6-Fm
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG2C-0003r1-7V
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:16 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG28-0001OJ-OO
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:15 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id o59so1879831qva.1
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hGH6lSBF2ucXpR+KjGUauv5JDd302RCzJcJtTVF6swc=;
 b=wbbIU4Ki4ry4K+xVhpt0OE/D91iR+I5VKEQ7NWJkRIr408sOG8h6PGIWh4UiB/DPha
 XbFXd6swxF7OqQ4UpeUcrTqvR8edru8K3qC0tOQOSXtvR418OfxwGA4hffk/6nU46XWj
 uVsj26fTWg7g6neudksSDcyu0JkSzUCdSlu//bpRX+aw0S4Z02Uh9pyV6Gp/oyil3swB
 6GTM/n+/fwlzQN3e7u6qdtkbcIPOXmYvbzfXof6dpSLoR/EijF9Jgs5XogHquidMCQ+Y
 CYmc0VDiPpfPNSXrgfAzMuQCxwThW55HWJLWiaHgtmyxHhwzqd8jiqVNh8CK/9X6Quy6
 oB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hGH6lSBF2ucXpR+KjGUauv5JDd302RCzJcJtTVF6swc=;
 b=F+IcuU3OT1ijW80dlzpDoeXBItFMmqKXWBVv6vD7tgEzpS44mEnYlzAPPHJCnMz5J+
 Nr2QW2JFQegBTtn4qD3prdpz9rMrrl5kDlhJ9shAdsv2vFag5gkOcSXnloTpQUveLzfy
 HinXCuL1XEaD0LQ+TCGZuigF0i07b+MNqxnUkUKTiJuDXU8I1DDIu40rvt37aY7BkbCZ
 Mr6MI+0Uvy8yp3pptEiJFz+jR52VS2N+P29Yqeh03elRhL47m7TTXjotN3YKWhsg+NBF
 0FUO45PAL2BuD9zKxHmwCyLf57XRkXqpGq1xjxqqrif10E5iZB63kAY0FngXHCYyETy4
 iR0g==
X-Gm-Message-State: AOAM533uN2Yvm6OyLp+Kf7UAKOiwp68CP/6KTW7y/0bPLXdHxIpHab5a
 w6d5tZncxB1cpkAbclp00b1CKi3SzjqCVEL9P28=
X-Google-Smtp-Source: ABdhPJzGNMP3ovL78eSXeEDCFU8tSVGDqeZ8h2wCqm8YJ7phKWNiL9Fop8F2rIhCKeohdWlByDl1aQ==
X-Received: by 2002:a0c:e6c5:: with SMTP id l5mr55790665qvn.2.1621168691690;
 Sun, 16 May 2021 05:38:11 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 195sm8180765qkj.1.2021.05.16.05.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:38:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/46] softfloat: Move round_to_int_and_pack to
 softfloat-parts.c.inc
Date: Sun, 16 May 2021 07:34:31 -0500
Message-Id: <20210516123431.718318-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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

Rename to parts$N_float_to_sint.  Reimplement
float128_to_int{32,64}{_round_to_zero} with FloatParts128.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 365 +++++++++-----------------------------
 fpu/softfloat-parts.c.inc |  64 +++++++
 2 files changed, 145 insertions(+), 284 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5647a05d5d..0dc2203477 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -829,6 +829,16 @@ static void parts128_round_to_int(FloatParts128 *a, FloatRoundMode r,
 #define parts_round_to_int(A, R, C, S, F) \
     PARTS_GENERIC_64_128(round_to_int, A)(A, R, C, S, F)
 
+static int64_t parts64_float_to_sint(FloatParts64 *p, FloatRoundMode rmode,
+                                     int scale, int64_t min, int64_t max,
+                                     float_status *s);
+static int64_t parts128_float_to_sint(FloatParts128 *p, FloatRoundMode rmode,
+                                     int scale, int64_t min, int64_t max,
+                                     float_status *s);
+
+#define parts_float_to_sint(P, R, Z, MN, MX, S) \
+    PARTS_GENERIC_64_128(float_to_sint, P)(P, R, Z, MN, MX, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -2352,69 +2362,8 @@ float128 float128_round_to_int(float128 a, float_status *s)
 }
 
 /*
- * Returns the result of converting the floating-point value `a' to
- * the two's complement integer format. The conversion is performed
- * according to the IEC/IEEE Standard for Binary Floating-Point
- * Arithmetic---which means in particular that the conversion is
- * rounded according to the current rounding mode. If `a' is a NaN,
- * the largest positive integer is returned. Otherwise, if the
- * conversion overflows, the largest integer with the same sign as `a'
- * is returned.
-*/
-
-static int64_t round_to_int_and_pack(FloatParts64 p, FloatRoundMode rmode,
-                                     int scale, int64_t min, int64_t max,
-                                     float_status *s)
-{
-    int flags = 0;
-    uint64_t r;
-
-    switch (p.cls) {
-    case float_class_snan:
-    case float_class_qnan:
-        flags = float_flag_invalid;
-        r = max;
-        break;
-
-    case float_class_inf:
-        flags = float_flag_invalid;
-        r = p.sign ? min : max;
-        break;
-
-    case float_class_zero:
-        return 0;
-
-    case float_class_normal:
-        /* TODO: 62 = N - 2, frac_size for rounding */
-        if (parts_round_to_int_normal(&p, rmode, scale, 62)) {
-            flags = float_flag_inexact;
-        }
-
-        if (p.exp <= DECOMPOSED_BINARY_POINT) {
-            r = p.frac >> (DECOMPOSED_BINARY_POINT - p.exp);
-        } else {
-            r = UINT64_MAX;
-        }
-        if (p.sign) {
-            if (r <= -(uint64_t)min) {
-                r = -r;
-            } else {
-                flags = float_flag_invalid;
-                r = min;
-            }
-        } else if (r > max) {
-            flags = float_flag_invalid;
-            r = max;
-        }
-        break;
-
-    default:
-        g_assert_not_reached();
-    }
-
-    float_raise(flags, s);
-    return r;
-}
+ * Floating-point to signed integer conversions
+ */
 
 int8_t float16_to_int8_scalbn(float16 a, FloatRoundMode rmode, int scale,
                               float_status *s)
@@ -2422,7 +2371,7 @@ int8_t float16_to_int8_scalbn(float16 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT8_MIN, INT8_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT8_MIN, INT8_MAX, s);
 }
 
 int16_t float16_to_int16_scalbn(float16 a, FloatRoundMode rmode, int scale,
@@ -2431,7 +2380,7 @@ int16_t float16_to_int16_scalbn(float16 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT16_MIN, INT16_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT16_MIN, INT16_MAX, s);
 }
 
 int32_t float16_to_int32_scalbn(float16 a, FloatRoundMode rmode, int scale,
@@ -2440,7 +2389,7 @@ int32_t float16_to_int32_scalbn(float16 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT32_MIN, INT32_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT32_MIN, INT32_MAX, s);
 }
 
 int64_t float16_to_int64_scalbn(float16 a, FloatRoundMode rmode, int scale,
@@ -2449,7 +2398,7 @@ int64_t float16_to_int64_scalbn(float16 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT64_MIN, INT64_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
 int16_t float32_to_int16_scalbn(float32 a, FloatRoundMode rmode, int scale,
@@ -2458,7 +2407,7 @@ int16_t float32_to_int16_scalbn(float32 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT16_MIN, INT16_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT16_MIN, INT16_MAX, s);
 }
 
 int32_t float32_to_int32_scalbn(float32 a, FloatRoundMode rmode, int scale,
@@ -2467,7 +2416,7 @@ int32_t float32_to_int32_scalbn(float32 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT32_MIN, INT32_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT32_MIN, INT32_MAX, s);
 }
 
 int64_t float32_to_int64_scalbn(float32 a, FloatRoundMode rmode, int scale,
@@ -2476,7 +2425,7 @@ int64_t float32_to_int64_scalbn(float32 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT64_MIN, INT64_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
 int16_t float64_to_int16_scalbn(float64 a, FloatRoundMode rmode, int scale,
@@ -2485,7 +2434,7 @@ int16_t float64_to_int16_scalbn(float64 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT16_MIN, INT16_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT16_MIN, INT16_MAX, s);
 }
 
 int32_t float64_to_int32_scalbn(float64 a, FloatRoundMode rmode, int scale,
@@ -2494,7 +2443,7 @@ int32_t float64_to_int32_scalbn(float64 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT32_MIN, INT32_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT32_MIN, INT32_MAX, s);
 }
 
 int64_t float64_to_int64_scalbn(float64 a, FloatRoundMode rmode, int scale,
@@ -2503,7 +2452,52 @@ int64_t float64_to_int64_scalbn(float64 a, FloatRoundMode rmode, int scale,
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT64_MIN, INT64_MAX, s);
+    return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
+}
+
+int16_t bfloat16_to_int16_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
+                                 float_status *s)
+{
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return parts_float_to_sint(&p, rmode, scale, INT16_MIN, INT16_MAX, s);
+}
+
+int32_t bfloat16_to_int32_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
+                                 float_status *s)
+{
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return parts_float_to_sint(&p, rmode, scale, INT32_MIN, INT32_MAX, s);
+}
+
+int64_t bfloat16_to_int64_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
+                                 float_status *s)
+{
+    FloatParts64 p;
+
+    bfloat16_unpack_canonical(&p, a, s);
+    return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
+}
+
+static int32_t float128_to_int32_scalbn(float128 a, FloatRoundMode rmode,
+                                        int scale, float_status *s)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+    return parts_float_to_sint(&p, rmode, scale, INT32_MIN, INT32_MAX, s);
+}
+
+static int64_t float128_to_int64_scalbn(float128 a, FloatRoundMode rmode,
+                                        int scale, float_status *s)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, s);
+    return parts_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
 int8_t float16_to_int8(float16 a, float_status *s)
@@ -2556,6 +2550,16 @@ int64_t float64_to_int64(float64 a, float_status *s)
     return float64_to_int64_scalbn(a, s->float_rounding_mode, 0, s);
 }
 
+int32_t float128_to_int32(float128 a, float_status *s)
+{
+    return float128_to_int32_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
+int64_t float128_to_int64(float128 a, float_status *s)
+{
+    return float128_to_int64_scalbn(a, s->float_rounding_mode, 0, s);
+}
+
 int16_t float16_to_int16_round_to_zero(float16 a, float_status *s)
 {
     return float16_to_int16_scalbn(a, float_round_to_zero, 0, s);
@@ -2601,36 +2605,14 @@ int64_t float64_to_int64_round_to_zero(float64 a, float_status *s)
     return float64_to_int64_scalbn(a, float_round_to_zero, 0, s);
 }
 
-/*
- * Returns the result of converting the floating-point value `a' to
- * the two's complement integer format.
- */
-
-int16_t bfloat16_to_int16_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
-                                 float_status *s)
+int32_t float128_to_int32_round_to_zero(float128 a, float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT16_MIN, INT16_MAX, s);
+    return float128_to_int32_scalbn(a, float_round_to_zero, 0, s);
 }
 
-int32_t bfloat16_to_int32_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
-                                 float_status *s)
+int64_t float128_to_int64_round_to_zero(float128 a, float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT32_MIN, INT32_MAX, s);
-}
-
-int64_t bfloat16_to_int64_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
-                                 float_status *s)
-{
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
-    return round_to_int_and_pack(p, rmode, scale, INT64_MIN, INT64_MAX, s);
+    return float128_to_int64_scalbn(a, float_round_to_zero, 0, s);
 }
 
 int16_t bfloat16_to_int16(bfloat16 a, float_status *s)
@@ -6554,191 +6536,6 @@ floatx80 floatx80_sqrt(floatx80 a, float_status *status)
                                 0, zExp, zSig0, zSig1, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the 32-bit two's complement integer format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic---which means in particular that the conversion is rounded
-| according to the current rounding mode.  If `a' is a NaN, the largest
-| positive integer is returned.  Otherwise, if the conversion overflows, the
-| largest integer with the same sign as `a' is returned.
-*----------------------------------------------------------------------------*/
-
-int32_t float128_to_int32(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, shiftCount;
-    uint64_t aSig0, aSig1;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( ( aExp == 0x7FFF ) && ( aSig0 | aSig1 ) ) aSign = 0;
-    if ( aExp ) aSig0 |= UINT64_C(0x0001000000000000);
-    aSig0 |= ( aSig1 != 0 );
-    shiftCount = 0x4028 - aExp;
-    if ( 0 < shiftCount ) shift64RightJamming( aSig0, shiftCount, &aSig0 );
-    return roundAndPackInt32(aSign, aSig0, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the 32-bit two's complement integer format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic, except that the conversion is always rounded toward zero.  If
-| `a' is a NaN, the largest positive integer is returned.  Otherwise, if the
-| conversion overflows, the largest integer with the same sign as `a' is
-| returned.
-*----------------------------------------------------------------------------*/
-
-int32_t float128_to_int32_round_to_zero(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, shiftCount;
-    uint64_t aSig0, aSig1, savedASig;
-    int32_t z;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    aSig0 |= ( aSig1 != 0 );
-    if ( 0x401E < aExp ) {
-        if ( ( aExp == 0x7FFF ) && aSig0 ) aSign = 0;
-        goto invalid;
-    }
-    else if ( aExp < 0x3FFF ) {
-        if (aExp || aSig0) {
-            float_raise(float_flag_inexact, status);
-        }
-        return 0;
-    }
-    aSig0 |= UINT64_C(0x0001000000000000);
-    shiftCount = 0x402F - aExp;
-    savedASig = aSig0;
-    aSig0 >>= shiftCount;
-    z = aSig0;
-    if ( aSign ) z = - z;
-    if ( ( z < 0 ) ^ aSign ) {
- invalid:
-        float_raise(float_flag_invalid, status);
-        return aSign ? INT32_MIN : INT32_MAX;
-    }
-    if ( ( aSig0<<shiftCount ) != savedASig ) {
-        float_raise(float_flag_inexact, status);
-    }
-    return z;
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the 64-bit two's complement integer format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic---which means in particular that the conversion is rounded
-| according to the current rounding mode.  If `a' is a NaN, the largest
-| positive integer is returned.  Otherwise, if the conversion overflows, the
-| largest integer with the same sign as `a' is returned.
-*----------------------------------------------------------------------------*/
-
-int64_t float128_to_int64(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, shiftCount;
-    uint64_t aSig0, aSig1;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( aExp ) aSig0 |= UINT64_C(0x0001000000000000);
-    shiftCount = 0x402F - aExp;
-    if ( shiftCount <= 0 ) {
-        if ( 0x403E < aExp ) {
-            float_raise(float_flag_invalid, status);
-            if (    ! aSign
-                 || (    ( aExp == 0x7FFF )
-                      && ( aSig1 || ( aSig0 != UINT64_C(0x0001000000000000) ) )
-                    )
-               ) {
-                return INT64_MAX;
-            }
-            return INT64_MIN;
-        }
-        shortShift128Left( aSig0, aSig1, - shiftCount, &aSig0, &aSig1 );
-    }
-    else {
-        shift64ExtraRightJamming( aSig0, aSig1, shiftCount, &aSig0, &aSig1 );
-    }
-    return roundAndPackInt64(aSign, aSig0, aSig1, status);
-
-}
-
-/*----------------------------------------------------------------------------
-| Returns the result of converting the quadruple-precision floating-point
-| value `a' to the 64-bit two's complement integer format.  The conversion
-| is performed according to the IEC/IEEE Standard for Binary Floating-Point
-| Arithmetic, except that the conversion is always rounded toward zero.
-| If `a' is a NaN, the largest positive integer is returned.  Otherwise, if
-| the conversion overflows, the largest integer with the same sign as `a' is
-| returned.
-*----------------------------------------------------------------------------*/
-
-int64_t float128_to_int64_round_to_zero(float128 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, shiftCount;
-    uint64_t aSig0, aSig1;
-    int64_t z;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( aExp ) aSig0 |= UINT64_C(0x0001000000000000);
-    shiftCount = aExp - 0x402F;
-    if ( 0 < shiftCount ) {
-        if ( 0x403E <= aExp ) {
-            aSig0 &= UINT64_C(0x0000FFFFFFFFFFFF);
-            if (    ( a.high == UINT64_C(0xC03E000000000000) )
-                 && ( aSig1 < UINT64_C(0x0002000000000000) ) ) {
-                if (aSig1) {
-                    float_raise(float_flag_inexact, status);
-                }
-            }
-            else {
-                float_raise(float_flag_invalid, status);
-                if ( ! aSign || ( ( aExp == 0x7FFF ) && ( aSig0 | aSig1 ) ) ) {
-                    return INT64_MAX;
-                }
-            }
-            return INT64_MIN;
-        }
-        z = ( aSig0<<shiftCount ) | ( aSig1>>( ( - shiftCount ) & 63 ) );
-        if ( (uint64_t) ( aSig1<<shiftCount ) ) {
-            float_raise(float_flag_inexact, status);
-        }
-    }
-    else {
-        if ( aExp < 0x3FFF ) {
-            if ( aExp | aSig0 | aSig1 ) {
-                float_raise(float_flag_inexact, status);
-            }
-            return 0;
-        }
-        z = aSig0>>( - shiftCount );
-        if (    aSig1
-             || ( shiftCount && (uint64_t) ( aSig0<<( shiftCount & 63 ) ) ) ) {
-            float_raise(float_flag_inexact, status);
-        }
-    }
-    if ( aSign ) z = - z;
-    return z;
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the quadruple-precision floating-point value
 | `a' to the 64-bit unsigned integer format.  The conversion is
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index b2c4624d8c..a897a5a743 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -751,3 +751,67 @@ static void partsN(round_to_int)(FloatPartsN *a, FloatRoundMode rmode,
         g_assert_not_reached();
     }
 }
+
+/*
+ * Returns the result of converting the floating-point value `a' to
+ * the two's complement integer format. The conversion is performed
+ * according to the IEC/IEEE Standard for Binary Floating-Point
+ * Arithmetic---which means in particular that the conversion is
+ * rounded according to the current rounding mode. If `a' is a NaN,
+ * the largest positive integer is returned. Otherwise, if the
+ * conversion overflows, the largest integer with the same sign as `a'
+ * is returned.
+*/
+static int64_t partsN(float_to_sint)(FloatPartsN *p, FloatRoundMode rmode,
+                                     int scale, int64_t min, int64_t max,
+                                     float_status *s)
+{
+    int flags = 0;
+    uint64_t r;
+
+    switch (p->cls) {
+    case float_class_snan:
+    case float_class_qnan:
+        flags = float_flag_invalid;
+        r = max;
+        break;
+
+    case float_class_inf:
+        flags = float_flag_invalid;
+        r = p->sign ? min : max;
+        break;
+
+    case float_class_zero:
+        return 0;
+
+    case float_class_normal:
+        /* TODO: N - 2 is frac_size for rounding; could use input fmt. */
+        if (parts_round_to_int_normal(p, rmode, scale, N - 2)) {
+            flags = float_flag_inexact;
+        }
+
+        if (p->exp <= DECOMPOSED_BINARY_POINT) {
+            r = p->frac_hi >> (DECOMPOSED_BINARY_POINT - p->exp);
+        } else {
+            r = UINT64_MAX;
+        }
+        if (p->sign) {
+            if (r <= -(uint64_t)min) {
+                r = -r;
+            } else {
+                flags = float_flag_invalid;
+                r = min;
+            }
+        } else if (r > max) {
+            flags = float_flag_invalid;
+            r = max;
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+
+    float_raise(flags, s);
+    return r;
+}
-- 
2.25.1


