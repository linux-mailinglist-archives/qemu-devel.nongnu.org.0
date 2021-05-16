Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6D381EFF
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:07:09 +0200 (CEST)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGU8-000878-Ic
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzQ-0007he-RY
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:26 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:38504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz2-0007nl-9A
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:17 -0400
Received: by mail-qt1-x836.google.com with SMTP id h21so3018447qtu.5
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uD8kmoDvMjgobthd5uZZXJmvbO539JQ1A2VRyt45llE=;
 b=fLolXtvE+vr/GXEKIrkewEMB6H9XPK/CklMuzcM5OkYQAqzWMoPs5AHa4RNyKWHpNe
 uOEbin93lr40KpGjjr68gUmL0YfccNZIOW9YZulUiSdZwlnAahLCu7h3uUfYgVBFBV7y
 3uYAlVmTynE1psVjjVh9Fm2Q5B7xPSWf3KWu0j9sU5GyVIjmfOk2uljWNUGJKXSoKRIm
 lhBmRyWqpgOMSJAAHTG9vhk9gTWeczfW8ViM1il7S+C8nCbsCO4lk+NkUadNw6IeuZH3
 /y2VniMdxhN9o3Pf5M1MwlfA07M8EPsjaV8N/AC9ZGZ/Eh8FNe5590XLVLYy62JdSO2J
 IA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uD8kmoDvMjgobthd5uZZXJmvbO539JQ1A2VRyt45llE=;
 b=L02ZrUUdTlR+zKIIWLBAu7QQmG61uWTHBkSts4whuPtH/vqE9Rarv3+JNaqw0o1lfd
 OM/OCcDnjeyA0DZyIMpSKWjA5tpU1vbxBchKLf5W3pqnJGY4ZLSz3eE2Ow+ymhzNWesO
 0pQo5QTs8wtxks3WgUqy2FfpG6O1a9cn4yuIzg5oNlvWlAoKmBLUgSmAPhzWYSikzDKE
 Hix9GNBl/PYf0eX0oLNKM3Dz4hu5eMFFOBRKWGi8JTWVThsrPvWLpZBnjmyZYEdVMMDn
 bJnlps7IBF+p36er0uWiH6DnwVGkABzxA4x+zd3boQukdbrY+nvFEpUhs3qvX/gBdvgj
 PqCw==
X-Gm-Message-State: AOAM532G+4ufYnMjEz0O99HC73JZYzXdMRd9q/8ZYQYZB7cokxDN4Rkf
 sQeByMua7smTOhMr0tVKKJa5CftI73X6fnRCihg=
X-Google-Smtp-Source: ABdhPJwdGoOmbeWg6FU+0BtGPgKYA2RpC8ChRj+M/w350pB2gyn354CIgR27OiiXBlTKHrbx0dO6DA==
X-Received: by 2002:ac8:5550:: with SMTP id o16mr51695608qtr.7.1621168492909; 
 Sun, 16 May 2021 05:34:52 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/46] softfloat: Use pointers with parts_silence_nan
Date: Sun, 16 May 2021 07:34:09 -0500
Message-Id: <20210516123431.718318-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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

At the same time, rename to parts64_silence_nan, split out
parts_silence_nan_frac, and define a macro for parts_silence_nan.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c                | 16 +++++++++-------
 fpu/softfloat-specialize.c.inc | 17 +++++++++++------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b0cbd5941c..2123453d40 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -657,6 +657,7 @@ static inline float64 float64_pack_raw(const FloatParts64 *p)
 #include "softfloat-specialize.c.inc"
 
 #define parts_default_nan  parts64_default_nan
+#define parts_silence_nan  parts64_silence_nan
 
 /* Canonicalize EXP and FRAC, setting CLS.  */
 static FloatParts64 sf_canonicalize(FloatParts64 part, const FloatFmt *parm,
@@ -851,7 +852,8 @@ static FloatParts64 return_nan(FloatParts64 a, float_status *s)
     if (is_snan(a.cls)) {
         float_raise(float_flag_invalid, s);
         if (!s->default_nan_mode) {
-            return parts_silence_nan(a, s);
+            parts_silence_nan(&a, s);
+            return a;
         }
     } else if (!s->default_nan_mode) {
         return a;
@@ -875,7 +877,7 @@ static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
             a = b;
         }
         if (is_snan(a.cls)) {
-            return parts_silence_nan(a, s);
+            parts_silence_nan(&a, s);
         }
     }
     return a;
@@ -916,7 +918,7 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
     }
 
     if (is_snan(a.cls)) {
-        return parts_silence_nan(a, s);
+        parts_silence_nan(&a, s);
     }
     return a;
 }
@@ -3801,7 +3803,7 @@ float16 float16_silence_nan(float16 a, float_status *status)
 
     float16_unpack_raw(&p, a);
     p.frac <<= float16_params.frac_shift;
-    p = parts_silence_nan(p, status);
+    parts_silence_nan(&p, status);
     p.frac >>= float16_params.frac_shift;
     return float16_pack_raw(&p);
 }
@@ -3812,7 +3814,7 @@ float32 float32_silence_nan(float32 a, float_status *status)
 
     float32_unpack_raw(&p, a);
     p.frac <<= float32_params.frac_shift;
-    p = parts_silence_nan(p, status);
+    parts_silence_nan(&p, status);
     p.frac >>= float32_params.frac_shift;
     return float32_pack_raw(&p);
 }
@@ -3823,7 +3825,7 @@ float64 float64_silence_nan(float64 a, float_status *status)
 
     float64_unpack_raw(&p, a);
     p.frac <<= float64_params.frac_shift;
-    p = parts_silence_nan(p, status);
+    parts_silence_nan(&p, status);
     p.frac >>= float64_params.frac_shift;
     return float64_pack_raw(&p);
 }
@@ -3834,7 +3836,7 @@ bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
 
     bfloat16_unpack_raw(&p, a);
     p.frac <<= bfloat16_params.frac_shift;
-    p = parts_silence_nan(p, status);
+    parts_silence_nan(&p, status);
     p.frac >>= bfloat16_params.frac_shift;
     return bfloat16_pack_raw(&p);
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 47c3652d63..4038955379 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -176,20 +176,25 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
 | floating-point parts.
 *----------------------------------------------------------------------------*/
 
-static FloatParts64 parts_silence_nan(FloatParts64 a, float_status *status)
+static uint64_t parts_silence_nan_frac(uint64_t frac, float_status *status)
 {
     g_assert(!no_signaling_nans(status));
     g_assert(!status->default_nan_mode);
 
     /* The only snan_bit_is_one target without default_nan_mode is HPPA. */
     if (snan_bit_is_one(status)) {
-        a.frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
-        a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
+        frac &= ~(1ULL << (DECOMPOSED_BINARY_POINT - 1));
+        frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 2);
     } else {
-        a.frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 1);
+        frac |= 1ULL << (DECOMPOSED_BINARY_POINT - 1);
     }
-    a.cls = float_class_qnan;
-    return a;
+    return frac;
+}
+
+static void parts64_silence_nan(FloatParts64 *p, float_status *status)
+{
+    p->frac = parts_silence_nan_frac(p->frac, status);
+    p->cls = float_class_qnan;
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


