Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87E1376EC8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:31:12 +0200 (CEST)
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCkJ-0002ud-PA
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC82-0002vM-N0
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:38 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC80-0005Rp-Ep
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:38 -0400
Received: by mail-pg1-x52f.google.com with SMTP id m124so8603148pgm.13
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Od39KgKMdYhwkyR5c/sGxfaCPXmuk0Ca5kCuFG8rqg=;
 b=IF7kVHgRdpduJYwf3ykC3rP1wJOb9RxNKG7me5v76JPWL3/rZrKtwg5S9e+7mrrcgx
 Zaiocmb6pnHrk3mcgttwIrDk4El8Jcm397Wl37Ie3ipU3RXcKeD7NDRUwuYMeS0bO0lB
 dflQQ3ZoFRmgg/tpxw+L2pje3eAgMyVmdOwB4M0KUYSVkYXvVQbyxjrVMTOWWxJvT9Vo
 B4jy/nxcsWg87CCg/p/wYkODgiORHRMEE2Nw6KA82PdsxHo8gfE4W9euU0Qj02lAKyWT
 YW5b2dsHZ36H5ISROCL0b5fdtDmkR1GsMDTY0e3vBFFiCwzo+WXjKrGi9NpynpZutOqM
 p5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Od39KgKMdYhwkyR5c/sGxfaCPXmuk0Ca5kCuFG8rqg=;
 b=Y7l2Pj/SfTf59RAuMbvoljeQOrsQEd0vgqEnunZAu/p+KaTRsxhX+dCi2IOzlOyDZ2
 1wF283506/Zj+UKqz+Vfgejt/jolpAQbmertGnbka+dCwcRzj4czqA89+LCVt7bnQL8v
 2sK1xKkbHhZ5P+72q8BopS3AkcYSVQC1qpHjTEb57JPfc66jRAtj5mm8JTlRdtPNjYJH
 jD4Oj4Kvlo3RGhEYaRYRrPPq1aeqdIHhDOA/sfRsguffMPYP1hJ9W82ERnYZW56NPp6h
 QpsxdcT3QgzXaI7u8xszd8InoyK7lL65UERubAsOwZBBh4gughkJ9mSuHLbDixxMVOe7
 8kww==
X-Gm-Message-State: AOAM532MC1f3jjuXKt8lF2TcM5Gr5frBza86fegntJI/0tdw3WudP83G
 ypEGheS0jWw849oWp8+l/dyVYF5XymzoJA==
X-Google-Smtp-Source: ABdhPJwmk15h4bFF5YpiHFBshL0rrA77oOC+D42wOxVJbVo1Pqx7x3oYMEZmG8WfUj8cLBYybNO0ww==
X-Received: by 2002:a62:8fd2:0:b029:28e:8c64:52a4 with SMTP id
 n201-20020a628fd20000b029028e8c6452a4mr13447910pfd.3.1620438695142; 
 Fri, 07 May 2021 18:51:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 48/72] softfloat: Move int_to_float to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:38 -0700
Message-Id: <20210508014802.892561-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Rename to parts$N_sint_to_float.
Reimplement int{32,64}_to_float128 with FloatParts128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 136 +++++++++++---------------------------
 fpu/softfloat-parts.c.inc |  32 +++++++++
 2 files changed, 70 insertions(+), 98 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 235ddda7a0..d843ea67c4 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -848,6 +848,14 @@ static uint64_t parts128_float_to_uint(FloatParts128 *p, FloatRoundMode rmode,
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
@@ -2939,42 +2947,15 @@ uint64_t bfloat16_to_uint64_round_to_zero(bfloat16 a, float_status *s)
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
@@ -3009,8 +2990,10 @@ float16 int8_to_float16(int8_t a, float_status *status)
 
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
@@ -3040,8 +3023,10 @@ float32 int16_to_float32(int16_t a, float_status *status)
 
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
@@ -3069,15 +3054,12 @@ float64 int16_to_float64(int16_t a, float_status *status)
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
@@ -3105,6 +3087,19 @@ bfloat16 int16_to_bfloat16(int16_t a, float_status *status)
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
@@ -4955,28 +4950,6 @@ floatx80 int32_to_floatx80(int32_t a, float_status *status)
 
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
@@ -4998,39 +4971,6 @@ floatx80 int64_to_floatx80(int64_t a, float_status *status)
 
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
index c6e327547f..8102de1307 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -881,3 +881,35 @@ static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
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


