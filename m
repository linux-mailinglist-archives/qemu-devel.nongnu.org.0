Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F38739AD34
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:50:07 +0200 (CEST)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovE6-0007Pn-Bs
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6B-0002gK-CR
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:56 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov61-00018E-Fo
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:55 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 27so6185220pgy.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JCtl3D+YOh8X1zQYr/wZ8dY/TYd7h1wTuPlU6E6ST7c=;
 b=LFSWzP1RsHR87z55Pf+z5JcHJqYYlIjXi332fm7PJMiVsw6wJ/D+eXlqlF59pW2oJ7
 Y/GxX3LWRJxVDBBA4FmZrQtj/1re7e7+Q5YQoBbL26dcBO53n6KrpP3ZQ2oVPH80tYXH
 IO4TPgLvoGp+eqLSEy7oum66PpspSDrl9JZC6hHAatdXbYssdsaAIMpBsiXBCd1I6xDq
 q7PTPrqfj5BiDQbKH5p45yzMJO6n5h5CMAuAHZ+jnmT1kNCUAWMh/L3eytlOrNJWeUEJ
 /CgJJxMMTv1lqGGoLrxJoo4zw8gCAkGIX7oJSjLcEY0A9W+2MgksaaXPXsLRk8hgB0cr
 grKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JCtl3D+YOh8X1zQYr/wZ8dY/TYd7h1wTuPlU6E6ST7c=;
 b=nKmYwzdaXeln4yri7H18kNJdPJ331zTCs6bWiaoGGRuzXn+XFEMXutmKVK5FjVg2KI
 YQCCxGWGa5LA9Ja96cytj7OPS2tOm4S4RTGv9lkUmUZX3BTdjzOxI2gihWKHkbyqCH4g
 YwJJGKZgrygJr5LhHMGo1RMryAoq54+MP5E8pC5z7c+iiwrdHHbQ+d7FFDOwLWWPYk6x
 jNWm/YwlDgEM5n5S0sWZXQnmONgET1hPEN+KCUNjfhD0TMcjS1SFvRZsnMqW+PHYOnSL
 Inf+jr++1Q+0TZR/KoPw+8O4z+KWfAFT02mcD8+EA951BHd49ALkSSlkzJQ8Qj1f1ld+
 I/iA==
X-Gm-Message-State: AOAM532Ih98cxKIBC8Em9kHByvQFhOeQlcyYNTGoKeNPG0l1+KAgGWri
 tUa8x0LN2S6wm1SNCSG9wMLVz1iUR9s1Dw==
X-Google-Smtp-Source: ABdhPJy9VMAj+OVonhtbFm9l1wHJ10GZxson0o+8Ay4haXv4uVFU92wA9CcK5ojljinxETgI2pqhCA==
X-Received: by 2002:a63:fc06:: with SMTP id j6mr1501156pgi.226.1622756503686; 
 Thu, 03 Jun 2021 14:41:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/29] softfloat: Convert floatx80_sqrt to FloatParts
Date: Thu,  3 Jun 2021 14:41:19 -0700
Message-Id: <20210603214131.629841-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
 fpu/softfloat.c | 82 +++++++------------------------------------------
 1 file changed, 11 insertions(+), 71 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 9c26ba5960..5a320e5302 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3881,6 +3881,17 @@ float128 QEMU_FLATTEN float128_sqrt(float128 a, float_status *status)
     return float128_round_pack_canonical(&p, status);
 }
 
+floatx80 floatx80_sqrt(floatx80 a, float_status *s)
+{
+    FloatParts128 p;
+
+    if (!floatx80_unpack_canonical(&p, a, s)) {
+        return floatx80_default_nan(s);
+    }
+    parts_sqrt(&p, s, &floatx80_params[s->floatx80_rounding_precision]);
+    return floatx80_round_pack_canonical(&p, s);
+}
+
 /*----------------------------------------------------------------------------
 | The pattern for a default generated NaN.
 *----------------------------------------------------------------------------*/
@@ -6044,77 +6055,6 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *status)
     return floatx80_modrem(a, b, true, &quotient, status);
 }
 
-/*----------------------------------------------------------------------------
-| Returns the square root of the extended double-precision floating-point
-| value `a'.  The operation is performed according to the IEC/IEEE Standard
-| for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-floatx80 floatx80_sqrt(floatx80 a, float_status *status)
-{
-    bool aSign;
-    int32_t aExp, zExp;
-    uint64_t aSig0, aSig1, zSig0, zSig1, doubleZSig0;
-    uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-
-    if (floatx80_invalid_encoding(a)) {
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    aSig0 = extractFloatx80Frac( a );
-    aExp = extractFloatx80Exp( a );
-    aSign = extractFloatx80Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ((uint64_t)(aSig0 << 1)) {
-            return propagateFloatx80NaN(a, a, status);
-        }
-        if ( ! aSign ) return a;
-        goto invalid;
-    }
-    if ( aSign ) {
-        if ( ( aExp | aSig0 ) == 0 ) return a;
- invalid:
-        float_raise(float_flag_invalid, status);
-        return floatx80_default_nan(status);
-    }
-    if ( aExp == 0 ) {
-        if ( aSig0 == 0 ) return packFloatx80( 0, 0, 0 );
-        normalizeFloatx80Subnormal( aSig0, &aExp, &aSig0 );
-    }
-    zExp = ( ( aExp - 0x3FFF )>>1 ) + 0x3FFF;
-    zSig0 = estimateSqrt32( aExp, aSig0>>32 );
-    shift128Right( aSig0, 0, 2 + ( aExp & 1 ), &aSig0, &aSig1 );
-    zSig0 = estimateDiv128To64( aSig0, aSig1, zSig0<<32 ) + ( zSig0<<30 );
-    doubleZSig0 = zSig0<<1;
-    mul64To128( zSig0, zSig0, &term0, &term1 );
-    sub128( aSig0, aSig1, term0, term1, &rem0, &rem1 );
-    while ( (int64_t) rem0 < 0 ) {
-        --zSig0;
-        doubleZSig0 -= 2;
-        add128( rem0, rem1, zSig0>>63, doubleZSig0 | 1, &rem0, &rem1 );
-    }
-    zSig1 = estimateDiv128To64( rem1, 0, doubleZSig0 );
-    if ( ( zSig1 & UINT64_C(0x3FFFFFFFFFFFFFFF) ) <= 5 ) {
-        if ( zSig1 == 0 ) zSig1 = 1;
-        mul64To128( doubleZSig0, zSig1, &term1, &term2 );
-        sub128( rem1, 0, term1, term2, &rem1, &rem2 );
-        mul64To128( zSig1, zSig1, &term2, &term3 );
-        sub192( rem1, rem2, 0, 0, term2, term3, &rem1, &rem2, &rem3 );
-        while ( (int64_t) rem1 < 0 ) {
-            --zSig1;
-            shortShift128Left( 0, zSig1, 1, &term2, &term3 );
-            term3 |= 1;
-            term2 |= doubleZSig0;
-            add192( rem1, rem2, rem3, 0, term2, term3, &rem1, &rem2, &rem3 );
-        }
-        zSig1 |= ( ( rem1 | rem2 | rem3 ) != 0 );
-    }
-    shortShift128Left( 0, zSig1, 1, &zSig0, &zSig1 );
-    zSig0 |= doubleZSig0;
-    return roundAndPackFloatx80(status->floatx80_rounding_precision,
-                                0, zExp, zSig0, zSig1, status);
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the quadruple-precision floating-point
 | value `a' to the extended double-precision floating-point format.  The
-- 
2.25.1


