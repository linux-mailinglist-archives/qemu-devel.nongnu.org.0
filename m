Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F418C381F07
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:13:03 +0200 (CEST)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGZq-0006EQ-HJ
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG2A-0003iC-2r
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:14 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:41589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG26-0001MQ-KN
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:13 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id ee9so1849054qvb.8
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZ1hSMuOPZm/hbcoYgOK5xvaD0/Vou60KStb6uIk1O0=;
 b=cxV/kNjx+kl08cEQIkTjmm0C7mwFE6qxrkOBQNDPzg7geZrHI8rcFIDRaBRw8q/jhs
 XvFwF75Ay+TDBhzeGlO7ZhVf2+n8TRt/9J2Bo8IleEPdGVnrJO+DZ40JhdoovCU59JaH
 BgmMIQXDcFa7sdnPEDyuuUJDbs3Q6VZDyc51+V+QkjheD6y734KXv0DpCWF0b8eS1UEb
 dHNxuRuDS4cyMlLAwBigDSO57+Bgb1/tJ6hoN2q4uxdk6ci5U22taWCzOuS+N84cA9dC
 dMzikZrMOlOVgCMAO1EbRmQ4YIOnH7rjQyAW4gfB/YIxuWkxhcB5rEB+8yAvCw15/HNR
 tjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZ1hSMuOPZm/hbcoYgOK5xvaD0/Vou60KStb6uIk1O0=;
 b=GvVrOC7n1hjFgwVz8h8mvEzbJzsbJEWaO0Lc3xgw/gvO+cmwNn9m7wrdrbNlsL0eah
 CFxy+NJWcXPLknA2vpxQxyhFXbs1CfganNSHZ0wPhlsB9WkVVBgfykaERDsstNERA5kP
 7e/vkzb305rWbMVeJVWjZ3IgFoufnvchOKp84tu3MAFTgfFYUVv2honxSiP1uhRSsANb
 IhZX2cPN8isAOt7pjAvPY6WWnDFX2VKcjQaoLUL/QDXik8UbdR5vEPquxlI2jKreQGgl
 netlYTsncClmtCZAKYZuxQ+p2tJRw2ZHBJl/Mxzs222pBFQpY66Ew+yNAtgQ5+yYD2KP
 E2Lg==
X-Gm-Message-State: AOAM533FWyk9nX2w1cS9AYYdA1wiayMtFIx2ULelKZdeOx1NtcE832Af
 L7AQkKkwlv2lJ9dqfFZMwvXiyLsvYf0KIcxPEQ8=
X-Google-Smtp-Source: ABdhPJzMlrOSn8AUuq1PAesNv7Id/5YarKGRjKSUIGY3Grv8bCe4zSS8Cdt1S/kKqu3hCaDty1zn1g==
X-Received: by 2002:a0c:e20f:: with SMTP id q15mr2879415qvl.56.1621168688965; 
 Sun, 16 May 2021 05:38:08 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 195sm8180765qkj.1.2021.05.16.05.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:38:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/46] softfloat: Split float_to_float
Date: Sun, 16 May 2021 07:34:28 -0500
Message-Id: <20210516123431.718318-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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

Split out parts_float_to_ahp and parts_float_to_float.
Convert to pointers.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 174 ++++++++++++++++++++++++++++--------------------
 1 file changed, 101 insertions(+), 73 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index a6dbb1dabf..80025539ef 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2037,83 +2037,105 @@ float128_div(float128 a, float128 b, float_status *status)
  * conversion is performed according to the IEC/IEEE Standard for
  * Binary Floating-Point Arithmetic.
  *
- * The float_to_float helper only needs to take care of raising
- * invalid exceptions and handling the conversion on NaNs.
+ * Usually this only needs to take care of raising invalid exceptions
+ * and handling the conversion on NaNs.
  */
 
-static FloatParts64 float_to_float(FloatParts64 a, const FloatFmt *dstf,
-                                 float_status *s)
+static void parts_float_to_ahp(FloatParts64 *a, float_status *s)
 {
-    if (dstf->arm_althp) {
-        switch (a.cls) {
-        case float_class_qnan:
-        case float_class_snan:
-            /* There is no NaN in the destination format.  Raise Invalid
-             * and return a zero with the sign of the input NaN.
-             */
-            float_raise(float_flag_invalid, s);
-            a.cls = float_class_zero;
-            a.frac = 0;
-            a.exp = 0;
-            break;
+    switch (a->cls) {
+    case float_class_qnan:
+    case float_class_snan:
+        /*
+         * There is no NaN in the destination format.  Raise Invalid
+         * and return a zero with the sign of the input NaN.
+         */
+        float_raise(float_flag_invalid, s);
+        a->cls = float_class_zero;
+        break;
 
-        case float_class_inf:
-            /* There is no Inf in the destination format.  Raise Invalid
-             * and return the maximum normal with the correct sign.
-             */
-            float_raise(float_flag_invalid, s);
-            a.cls = float_class_normal;
-            a.exp = dstf->exp_max;
-            a.frac = ((1ull << dstf->frac_size) - 1) << dstf->frac_shift;
-            break;
+    case float_class_inf:
+        /*
+         * There is no Inf in the destination format.  Raise Invalid
+         * and return the maximum normal with the correct sign.
+         */
+        float_raise(float_flag_invalid, s);
+        a->cls = float_class_normal;
+        a->exp = float16_params_ahp.exp_max;
+        a->frac = MAKE_64BIT_MASK(float16_params_ahp.frac_shift,
+                                  float16_params_ahp.frac_size + 1);
+        break;
 
-        default:
-            break;
-        }
-    } else if (is_nan(a.cls)) {
-        parts_return_nan(&a, s);
+    case float_class_normal:
+    case float_class_zero:
+        break;
+
+    default:
+        g_assert_not_reached();
     }
-    return a;
 }
 
+static void parts64_float_to_float(FloatParts64 *a, float_status *s)
+{
+    if (is_nan(a->cls)) {
+        parts_return_nan(a, s);
+    }
+}
+
+static void parts128_float_to_float(FloatParts128 *a, float_status *s)
+{
+    if (is_nan(a->cls)) {
+        parts_return_nan(a, s);
+    }
+}
+
+#define parts_float_to_float(P, S) \
+    PARTS_GENERIC_64_128(float_to_float, P)(P, S)
+
 float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float16a_unpack_canonical(&pa, a, s, fmt16);
-    pr = float_to_float(pa, &float32_params, s);
-    return float32_round_pack_canonical(&pr, s);
+    float16a_unpack_canonical(&p, a, s, fmt16);
+    parts_float_to_float(&p, s);
+    return float32_round_pack_canonical(&p, s);
 }
 
 float64 float16_to_float64(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float16a_unpack_canonical(&pa, a, s, fmt16);
-    pr = float_to_float(pa, &float64_params, s);
-    return float64_round_pack_canonical(&pr, s);
+    float16a_unpack_canonical(&p, a, s, fmt16);
+    parts_float_to_float(&p, s);
+    return float64_round_pack_canonical(&p, s);
 }
 
 float16 float32_to_float16(float32 a, bool ieee, float_status *s)
 {
-    const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 pa, pr;
+    FloatParts64 p;
+    const FloatFmt *fmt;
 
-    float32_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, fmt16, s);
-    return float16a_round_pack_canonical(&pr, s, fmt16);
+    float32_unpack_canonical(&p, a, s);
+    if (ieee) {
+        parts_float_to_float(&p, s);
+        fmt = &float16_params;
+    } else {
+        parts_float_to_ahp(&p, s);
+        fmt = &float16_params_ahp;
+    }
+    return float16a_round_pack_canonical(&p, s, fmt);
 }
 
 static float64 QEMU_SOFTFLOAT_ATTR
 soft_float32_to_float64(float32 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float32_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &float64_params, s);
-    return float64_round_pack_canonical(&pr, s);
+    float32_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return float64_round_pack_canonical(&p, s);
 }
 
 float64 float32_to_float64(float32 a, float_status *s)
@@ -2134,57 +2156,63 @@ float64 float32_to_float64(float32 a, float_status *s)
 
 float16 float64_to_float16(float64 a, bool ieee, float_status *s)
 {
-    const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 pa, pr;
+    FloatParts64 p;
+    const FloatFmt *fmt;
 
-    float64_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, fmt16, s);
-    return float16a_round_pack_canonical(&pr, s, fmt16);
+    float64_unpack_canonical(&p, a, s);
+    if (ieee) {
+        parts_float_to_float(&p, s);
+        fmt = &float16_params;
+    } else {
+        parts_float_to_ahp(&p, s);
+        fmt = &float16_params_ahp;
+    }
+    return float16a_round_pack_canonical(&p, s, fmt);
 }
 
 float32 float64_to_float32(float64 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float64_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &float32_params, s);
-    return float32_round_pack_canonical(&pr, s);
+    float64_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return float32_round_pack_canonical(&p, s);
 }
 
 float32 bfloat16_to_float32(bfloat16 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    bfloat16_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &float32_params, s);
-    return float32_round_pack_canonical(&pr, s);
+    bfloat16_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return float32_round_pack_canonical(&p, s);
 }
 
 float64 bfloat16_to_float64(bfloat16 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    bfloat16_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &float64_params, s);
-    return float64_round_pack_canonical(&pr, s);
+    bfloat16_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return float64_round_pack_canonical(&p, s);
 }
 
 bfloat16 float32_to_bfloat16(float32 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float32_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &bfloat16_params, s);
-    return bfloat16_round_pack_canonical(&pr, s);
+    float32_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return bfloat16_round_pack_canonical(&p, s);
 }
 
 bfloat16 float64_to_bfloat16(float64 a, float_status *s)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float64_unpack_canonical(&pa, a, s);
-    pr = float_to_float(pa, &bfloat16_params, s);
-    return bfloat16_round_pack_canonical(&pr, s);
+    float64_unpack_canonical(&p, a, s);
+    parts_float_to_float(&p, s);
+    return bfloat16_round_pack_canonical(&p, s);
 }
 
 /*
-- 
2.25.1


