Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30735381EF6
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:02:19 +0200 (CEST)
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGPS-0005MG-4y
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz9-0007Zl-K8
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:07 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:40954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFys-0007mT-2l
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:07 -0400
Received: by mail-qt1-x82c.google.com with SMTP id j19so3002381qtp.7
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qwLatIcg1M2jQdAtiotIU2QCLhsJTV7Ha800ap1A6gk=;
 b=NgZ/dI/m8zMI9E6VE/v9zUmBGWGadTA4jQESYKVMbMTDWk/oaZa2vrBCLwTuna7D4g
 gVhtie1/jQyRZ+9Qbq/ucJBlmTdix7A2XjHuVSVTBfdZcu8qQDyTHr8HUt2ctkwE5Naz
 ITmLoAMnXwzsRzYd8PaNCZ0F7ecyHbvwntcpMusIcfIrRSPYSfvW7CTcjCn9UC3Ihcuy
 /G3U/wO/DwuYuLa0g+bjIJ5ckyYpZJ32aBtFDBb0T1saYqM53PkXNDRPnncPjuWC8jlh
 VkS0sH2qoD6R3Rn93lCmzE0MOiDwwAbrpGthNbyAXNKwffM5xmVaa7ov73QE7JBLiamP
 ktHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qwLatIcg1M2jQdAtiotIU2QCLhsJTV7Ha800ap1A6gk=;
 b=C5U5WnQMogBZXGJ6CCChH9+rU9bPswYNy+bridJSsYFWSaF7CkRcdrBkAL1LzdwGOL
 iRR/dglswdDs7uf8T62LM0hMnJC35V0vj/qENoaL+fMLYgU+Jz+1nmj+3uxdyVRJmJUI
 eWw9svJDdhti4UnupVygXE2u3X2+tqRu9F0iXkuCqNDqlxg2g/xB1QfBr2SQGDRh24NB
 byh0m9XYf6L2h8qeCUjnLvbfOEIADSuWA8pedvvgNZwpZWA4G12MYoVkg38fnQ5bfldo
 MOenqZo0/gCPi3NvSEjSoyIfYNHZVoDkfP6SdSMv+zkD/dNVrLzGIArM1bULPRt5EG1S
 2GnQ==
X-Gm-Message-State: AOAM532r91WUhQivvM91B+wP+DNTF0NijsTqU8hembpYcWRH44TgNi3T
 VMjBTabVFH2p0vMJLRA8mO/Q1MwTth2MmZ1FDx0=
X-Google-Smtp-Source: ABdhPJzWULCbaEFvK9rzcBWcQjw5KSgvU+UUIAs6kdaGIRcxTs1qJapjkRCmh3ro8Lgod8tvdtpagg==
X-Received: by 2002:ac8:5854:: with SMTP id h20mr51899218qth.87.1621168487287; 
 Sun, 16 May 2021 05:34:47 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/46] softfloat: Use pointers with parts_default_nan
Date: Sun, 16 May 2021 07:34:02 -0500
Message-Id: <20210516123431.718318-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: peter.maydell@linaro.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, rename to parts64_default_nan and add a
macro for parts_default_nan.  This will be flushed out once
128-bit support is added.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c                | 47 +++++++++++++++++++++++-----------
 fpu/softfloat-specialize.c.inc |  4 +--
 2 files changed, 34 insertions(+), 17 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 398a068b58..c7f95961cf 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -650,6 +650,8 @@ static inline float64 float64_pack_raw(FloatParts64 p)
 *----------------------------------------------------------------------------*/
 #include "softfloat-specialize.c.inc"
 
+#define parts_default_nan  parts64_default_nan
+
 /* Canonicalize EXP and FRAC, setting CLS.  */
 static FloatParts64 sf_canonicalize(FloatParts64 part, const FloatFmt *parm,
                                   float_status *status)
@@ -848,7 +850,8 @@ static FloatParts64 return_nan(FloatParts64 a, float_status *s)
     } else if (!s->default_nan_mode) {
         return a;
     }
-    return parts_default_nan(s);
+    parts_default_nan(&a, s);
+    return a;
 }
 
 static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
@@ -858,7 +861,7 @@ static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
     }
 
     if (s->default_nan_mode) {
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
     } else {
         if (pickNaN(a.cls, b.cls,
                     a.frac > b.frac ||
@@ -900,7 +903,8 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
         a = c;
         break;
     case 3:
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -1011,7 +1015,7 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
         if (a.cls == float_class_inf) {
             if (b.cls == float_class_inf) {
                 float_raise(float_flag_invalid, s);
-                return parts_default_nan(s);
+                parts_default_nan(&a, s);
             }
             return a;
         }
@@ -1254,7 +1258,8 @@ static FloatParts64 mul_floats(FloatParts64 a, FloatParts64 b, float_status *s)
     if ((a.cls == float_class_inf && b.cls == float_class_zero) ||
         (a.cls == float_class_zero && b.cls == float_class_inf)) {
         float_raise(float_flag_invalid, s);
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        return a;
     }
     /* Multiply by 0 or Inf */
     if (a.cls == float_class_inf || a.cls == float_class_zero) {
@@ -1372,7 +1377,8 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
 
     if (inf_zero) {
         float_raise(float_flag_invalid, s);
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        return a;
     }
 
     if (flags & float_muladd_negate_c) {
@@ -1396,11 +1402,11 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
     if (c.cls == float_class_inf) {
         if (p_class == float_class_inf && p_sign != c.sign) {
             float_raise(float_flag_invalid, s);
-            return parts_default_nan(s);
+            parts_default_nan(&c, s);
         } else {
             c.sign ^= sign_flip;
-            return c;
         }
+        return c;
     }
 
     if (p_class == float_class_inf) {
@@ -1764,7 +1770,8 @@ static FloatParts64 div_floats(FloatParts64 a, FloatParts64 b, float_status *s)
         &&
         (a.cls == float_class_inf || a.cls == float_class_zero)) {
         float_raise(float_flag_invalid, s);
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        return a;
     }
     /* Inf / x or 0 / x */
     if (a.cls == float_class_inf || a.cls == float_class_zero) {
@@ -3438,7 +3445,8 @@ static FloatParts64 sqrt_float(FloatParts64 a, float_status *s, const FloatFmt *
     }
     if (a.sign) {
         float_raise(float_flag_invalid, s);
-        return parts_default_nan(s);
+        parts_default_nan(&a, s);
+        return a;
     }
     if (a.cls == float_class_inf) {
         return a;  /* sqrt(+inf) = +inf */
@@ -3573,30 +3581,37 @@ bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 
 float16 float16_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
+
+    parts_default_nan(&p, status);
     p.frac >>= float16_params.frac_shift;
     return float16_pack_raw(p);
 }
 
 float32 float32_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
+
+    parts_default_nan(&p, status);
     p.frac >>= float32_params.frac_shift;
     return float32_pack_raw(p);
 }
 
 float64 float64_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
+
+    parts_default_nan(&p, status);
     p.frac >>= float64_params.frac_shift;
     return float64_pack_raw(p);
 }
 
 float128 float128_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
     float128 r;
 
+    parts_default_nan(&p, status);
     /* Extrapolate from the choices made by parts_default_nan to fill
      * in the quad-floating format.  If the low bit is set, assume we
      * want to set all non-snan bits.
@@ -3611,7 +3626,9 @@ float128 float128_default_nan(float_status *status)
 
 bfloat16 bfloat16_default_nan(float_status *status)
 {
-    FloatParts64 p = parts_default_nan(status);
+    FloatParts64 p;
+
+    parts_default_nan(&p, status);
     p.frac >>= bfloat16_params.frac_shift;
     return bfloat16_pack_raw(p);
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index bb928b0b9f..47c3652d63 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -129,7 +129,7 @@ static bool parts_is_snan_frac(uint64_t frac, float_status *status)
 | The pattern for a default generated deconstructed floating-point NaN.
 *----------------------------------------------------------------------------*/
 
-static FloatParts64 parts_default_nan(float_status *status)
+static void parts64_default_nan(FloatParts64 *p, float_status *status)
 {
     bool sign = 0;
     uint64_t frac;
@@ -163,7 +163,7 @@ static FloatParts64 parts_default_nan(float_status *status)
     }
 #endif
 
-    return (FloatParts64) {
+    *p = (FloatParts64) {
         .cls = float_class_qnan,
         .sign = sign,
         .exp = INT_MAX,
-- 
2.25.1


