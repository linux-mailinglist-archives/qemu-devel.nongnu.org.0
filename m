Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E15939AD0C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:43:19 +0200 (CEST)
Received: from localhost ([::1]:49268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lov7V-0004q0-VU
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5u-0001zP-GU
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:38 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5r-0000zu-BK
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:38 -0400
Received: by mail-pg1-x535.google.com with SMTP id t8so6149200pgb.9
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jExZoW94fQf1KTDSzPZo60kTKr+L9V1ApVnhdi+DwN4=;
 b=omRWt91qfFzA3nkkwRbpAZIY+cSyYlCri9Bj5NJ4zOYe2ZfSLMB+r+wtG5kI2wNG+Y
 r8XWdO6XgS+8pxSJpYT/qrv+C+d30RFlHrurwvwbdjXq7Kdd4uV+YDa1hKyql1vDs5XX
 IIODnjr9NzdkV7TaG/XLrR+YwLakawYTnY8LM/A70OokKXkAC7lLVYobUEDJYIj3QVG2
 J+lOzXQ0dlT5ZVNFAci5r5oJfLCrjipO9fooRlddtp4FRmmnMVKbe9K63n1pAdJiTOUR
 raSxAmGqjgGqCYTYgpgL0pqJC6XuL+Qss/CGLcDaoHOlsxGfvboSkfxELULBT6G/k57X
 rkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jExZoW94fQf1KTDSzPZo60kTKr+L9V1ApVnhdi+DwN4=;
 b=EjTLwQKNvYVM7NyshoicmvN//KfMEPEPtQOmH/2tT8yTdRESt+Dlabouh+ubKfQdJ3
 Zu5r/NNmInMQfUiKu303RJB/gX5OfAnZcDlHFtsX+9cB28wzmWNSvwj8XUn0T5sr6326
 zC7tn157A00nL4ZbJHjkKWvyGec0eJphY9DQR6YFBiHb35b7lzutXpEKDn8CWr9lEN3o
 y0fKa5LzEbuAaWugpJ8k0t9Cdp52I6k5NH8Sx+OE43sjM3pwg3V6mNgIDWVOyH9OqYaa
 HtEqWNr8nSEyKWL1eYf93n2NnDDWSoziLNL4ZjX/etIU5Yw879Wp8jZalNcv7B3XLsPc
 WLLw==
X-Gm-Message-State: AOAM530/vroE5hyDJtzXxGck1YS8eVmBAw596iavrLvpgc3lFf4wjpX9
 nOSuS99ZPr9ci79h9OxSrWaJOxLuxDpc/Q==
X-Google-Smtp-Source: ABdhPJzpdE+pzVSyyjTIysF9sRjfPSZ6u6++fWd7ZXhehDhio03UoRw1cgdnGCKGOT8b20kHILoOdA==
X-Received: by 2002:a62:3344:0:b029:24c:735c:4546 with SMTP id
 z65-20020a6233440000b029024c735c4546mr1409766pfz.1.1622756494055; 
 Thu, 03 Jun 2021 14:41:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/29] softfloat: Move int_to_float to softfloat-parts.c.inc
Date: Thu,  3 Jun 2021 14:41:04 -0700
Message-Id: <20210603214131.629841-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to parts$N_sint_to_float.
Reimplement int{32,64}_to_float128 with FloatParts128.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 136 +++++++++++---------------------------
 fpu/softfloat-parts.c.inc |  32 +++++++++
 2 files changed, 70 insertions(+), 98 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 3181678ea9..6404a2997f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -849,6 +849,14 @@ static uint64_t parts128_float_to_uint(FloatParts128 *p, FloatRoundMode rmode,
 #define parts_float_to_uint(P, R, Z, M, S) \
     PARTS_GENERIC_64_128(float_to_uint, P)(P, R, Z, M, S)
 
+static void parts64_sint_to_float(FloatParts64 *p, int64_t a,
+                                  int scale, float_status *s);
+static void parts128_sint_to_float(FloatParts128 *p, int64_t a,
+                                   int scale, float_status *s);
+
+#define parts_sint_to_float(P, I, Z, S) \
+    PARTS_GENERIC_64_128(sint_to_float, P)(P, I, Z, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -2940,42 +2948,15 @@ uint64_t bfloat16_to_uint64_round_to_zero(bfloat16 a, float_status *s)
 }
 
 /*
- * Integer to float conversions
- *
- * Returns the result of converting the two's complement integer `a'
- * to the floating-point format. The conversion is performed according
- * to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+ * Signed integer to floating-point conversions
  */
 
-static FloatParts64 int_to_float(int64_t a, int scale, float_status *status)
-{
-    FloatParts64 r = { .sign = false };
-
-    if (a == 0) {
-        r.cls = float_class_zero;
-    } else {
-        uint64_t f = a;
-        int shift;
-
-        r.cls = float_class_normal;
-        if (a < 0) {
-            f = -f;
-            r.sign = true;
-        }
-        shift = clz64(f);
-        scale = MIN(MAX(scale, -0x10000), 0x10000);
-
-        r.exp = DECOMPOSED_BINARY_POINT - shift + scale;
-        r.frac = f << shift;
-    }
-
-    return r;
-}
-
 float16 int64_to_float16_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = int_to_float(a, scale, status);
-    return float16_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_sint_to_float(&p, a, scale, status);
+    return float16_round_pack_canonical(&p, status);
 }
 
 float16 int32_to_float16_scalbn(int32_t a, int scale, float_status *status)
@@ -3010,8 +2991,10 @@ float16 int8_to_float16(int8_t a, float_status *status)
 
 float32 int64_to_float32_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = int_to_float(a, scale, status);
-    return float32_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts64_sint_to_float(&p, a, scale, status);
+    return float32_round_pack_canonical(&p, status);
 }
 
 float32 int32_to_float32_scalbn(int32_t a, int scale, float_status *status)
@@ -3041,8 +3024,10 @@ float32 int16_to_float32(int16_t a, float_status *status)
 
 float64 int64_to_float64_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = int_to_float(a, scale, status);
-    return float64_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_sint_to_float(&p, a, scale, status);
+    return float64_round_pack_canonical(&p, status);
 }
 
 float64 int32_to_float64_scalbn(int32_t a, int scale, float_status *status)
@@ -3070,15 +3055,12 @@ float64 int16_to_float64(int16_t a, float_status *status)
     return int64_to_float64_scalbn(a, 0, status);
 }
 
-/*
- * Returns the result of converting the two's complement integer `a'
- * to the bfloat16 format.
- */
-
 bfloat16 int64_to_bfloat16_scalbn(int64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = int_to_float(a, scale, status);
-    return bfloat16_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_sint_to_float(&p, a, scale, status);
+    return bfloat16_round_pack_canonical(&p, status);
 }
 
 bfloat16 int32_to_bfloat16_scalbn(int32_t a, int scale, float_status *status)
@@ -3106,6 +3088,19 @@ bfloat16 int16_to_bfloat16(int16_t a, float_status *status)
     return int64_to_bfloat16_scalbn(a, 0, status);
 }
 
+float128 int64_to_float128(int64_t a, float_status *status)
+{
+    FloatParts128 p;
+
+    parts_sint_to_float(&p, a, 0, status);
+    return float128_round_pack_canonical(&p, status);
+}
+
+float128 int32_to_float128(int32_t a, float_status *status)
+{
+    return int64_to_float128(a, status);
+}
+
 /*
  * Unsigned Integer to float conversions
  *
@@ -4956,28 +4951,6 @@ floatx80 int32_to_floatx80(int32_t a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the 32-bit two's complement integer `a' to
-| the quadruple-precision floating-point format.  The conversion is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 int32_to_float128(int32_t a, float_status *status)
-{
-    bool zSign;
-    uint32_t absA;
-    int8_t shiftCount;
-    uint64_t zSig0;
-
-    if ( a == 0 ) return packFloat128( 0, 0, 0, 0 );
-    zSign = ( a < 0 );
-    absA = zSign ? - a : a;
-    shiftCount = clz32(absA) + 17;
-    zSig0 = absA;
-    return packFloat128( zSign, 0x402E - shiftCount, zSig0<<shiftCount, 0 );
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the 64-bit two's complement integer `a'
 | to the extended double-precision floating-point format.  The conversion
@@ -4999,39 +4972,6 @@ floatx80 int64_to_floatx80(int64_t a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the 64-bit two's complement integer `a' to
-| the quadruple-precision floating-point format.  The conversion is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 int64_to_float128(int64_t a, float_status *status)
-{
-    bool zSign;
-    uint64_t absA;
-    int8_t shiftCount;
-    int32_t zExp;
-    uint64_t zSig0, zSig1;
-
-    if ( a == 0 ) return packFloat128( 0, 0, 0, 0 );
-    zSign = ( a < 0 );
-    absA = zSign ? - a : a;
-    shiftCount = clz64(absA) + 49;
-    zExp = 0x406E - shiftCount;
-    if ( 64 <= shiftCount ) {
-        zSig1 = 0;
-        zSig0 = absA;
-        shiftCount -= 64;
-    }
-    else {
-        zSig1 = absA;
-        zSig0 = 0;
-    }
-    shortShift128Left( zSig0, zSig1, shiftCount, &zSig0, &zSig1 );
-    return packFloat128( zSign, zExp, zSig0, zSig1 );
-
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the 64-bit unsigned integer `a'
 | to the quadruple-precision floating-point format.  The conversion is performed
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 483bdc0e21..b7486f02db 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -883,3 +883,35 @@ static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
     float_raise(flags, s);
     return r;
 }
+
+/*
+ * Integer to float conversions
+ *
+ * Returns the result of converting the two's complement integer `a'
+ * to the floating-point format. The conversion is performed according
+ * to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+ */
+static void partsN(sint_to_float)(FloatPartsN *p, int64_t a,
+                                  int scale, float_status *s)
+{
+    uint64_t f = a;
+    int shift;
+
+    memset(p, 0, sizeof(*p));
+
+    if (a == 0) {
+        p->cls = float_class_zero;
+        return;
+    }
+
+    p->cls = float_class_normal;
+    if (a < 0) {
+        f = -f;
+        p->sign = true;
+    }
+    shift = clz64(f);
+    scale = MIN(MAX(scale, -0x10000), 0x10000);
+
+    p->exp = DECOMPOSED_BINARY_POINT - shift + scale;
+    p->frac_hi = f << shift;
+}
-- 
2.25.1


