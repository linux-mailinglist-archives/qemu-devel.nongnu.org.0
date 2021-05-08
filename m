Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A45376E62
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:07:11 +0200 (CEST)
Received: from localhost ([::1]:33762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCN4-0002HO-5n
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC52-0004GV-Jz
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:35 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:40747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4n-0003cY-Ft
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:32 -0400
Received: by mail-pf1-x435.google.com with SMTP id x188so9131405pfd.7
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=haSDSlpUM8p9DuI0N+XPpsqo4opBjSRscJfYOaISZlo=;
 b=Hn97pC6az92QTeC7SIiYnEaAq/kWBpSpfH4zW2HFs5JY/eZYzffvqp3t4mTVdhuWB3
 kG91RvByJhB8X1Aw7sola4oPanHqJAOGUjNaLd0wIwsgfKhIM50cY/wqj4Hk/Cr6lIlL
 xAKkHFByWo+W1Gsof1lUtLl1iEqlAtut5HKYvv2qfBhbh/jph+T++khh0Y+0FuEraWUH
 yUVen934zJAcgQMm4aVqtvGcE9gnFaLN3AJjAWARm/GyZU+S/Q2Zp8iXN7lq3cU5B0Mh
 3Rpb35w15VzLvNAhIuhsbLdC3Fo3qKeS8lE76+BTlWxHwIHxR146nS8rXBlX9wHOUCOH
 LHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=haSDSlpUM8p9DuI0N+XPpsqo4opBjSRscJfYOaISZlo=;
 b=kGU+cWtvlzcGNH8BEOwzw6I1rcU/U6oV41Cj8DB53Fr7mcJmURpl7C88Z9MkE6HhuG
 /Y707SV6XVnIDURFf4R4SapgikETtxeUm6dFkMB/ESrtRPP5lKmkhWEwBESSmTA9tKOh
 /lE78HMvDH7bUV4SDnqmTUsJ/laI9Yo0g0jwCWpaRsi37jK63t1ZacA4Oue1cMoXGqQK
 296TevAQOsM3wadyPtFKAcZGj9sCT5KJrao9yKTWe8wxdE6BGV8J+tMBSduEVqscXIif
 mVmvJotVILn5n6twRKGRdTFdIZjKLXgqM27cyw8QZ7glcZEE2NYdM2FGUTQjM3qqQTZa
 ph1w==
X-Gm-Message-State: AOAM5322KFya7dmQqAemKcYarm56e3Bv258B1qabr4K5AtAblD1a7LX4
 9zDKvdJQW7FE3RiiaKsbe979O0jLzb1iZg==
X-Google-Smtp-Source: ABdhPJz6np9NSAlkX9KuQy+lqmKQ/YCdZeEX9VWovy5R0f2RO88OQ3jfXXri30jwS6lE2TeTuYg4wg==
X-Received: by 2002:a63:4e5c:: with SMTP id o28mr13298797pgl.380.1620438496132; 
 Fri, 07 May 2021 18:48:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/72] softfloat: Use pointers with ftype_unpack_raw
Date: Fri,  7 May 2021 18:47:09 -0700
Message-Id: <20210508014802.892561-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 fpu/softfloat.c | 76 +++++++++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 28 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5ff9368012..5a736a46cf 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -593,32 +593,24 @@ static void unpack_raw64(FloatParts64 *r, const FloatFmt *fmt, uint64_t raw)
     };
 }
 
-static inline FloatParts64 float16_unpack_raw(float16 f)
+static inline void float16_unpack_raw(FloatParts64 *p, float16 f)
 {
-    FloatParts64 p;
-    unpack_raw64(&p, &float16_params, f);
-    return p;
+    unpack_raw64(p, &float16_params, f);
 }
 
-static inline FloatParts64 bfloat16_unpack_raw(bfloat16 f)
+static inline void bfloat16_unpack_raw(FloatParts64 *p, bfloat16 f)
 {
-    FloatParts64 p;
-    unpack_raw64(&p, &bfloat16_params, f);
-    return p;
+    unpack_raw64(p, &bfloat16_params, f);
 }
 
-static inline FloatParts64 float32_unpack_raw(float32 f)
+static inline void float32_unpack_raw(FloatParts64 *p, float32 f)
 {
-    FloatParts64 p;
-    unpack_raw64(&p, &float32_params, f);
-    return p;
+    unpack_raw64(p, &float32_params, f);
 }
 
-static inline FloatParts64 float64_unpack_raw(float64 f)
+static inline void float64_unpack_raw(FloatParts64 *p, float64 f)
 {
-    FloatParts64 p;
-    unpack_raw64(&p, &float64_params, f);
-    return p;
+    unpack_raw64(p, &float64_params, f);
 }
 
 /* Pack a float from parts, but do not canonicalize.  */
@@ -931,7 +923,10 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
 static FloatParts64 float16a_unpack_canonical(float16 f, float_status *s,
                                             const FloatFmt *params)
 {
-    return sf_canonicalize(float16_unpack_raw(f), params, s);
+    FloatParts64 p;
+
+    float16_unpack_raw(&p, f);
+    return sf_canonicalize(p, params, s);
 }
 
 static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
@@ -941,7 +936,10 @@ static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
 
 static FloatParts64 bfloat16_unpack_canonical(bfloat16 f, float_status *s)
 {
-    return sf_canonicalize(bfloat16_unpack_raw(f), &bfloat16_params, s);
+    FloatParts64 p;
+
+    bfloat16_unpack_raw(&p, f);
+    return sf_canonicalize(p, &bfloat16_params, s);
 }
 
 static float16 float16a_round_pack_canonical(FloatParts64 p, float_status *s,
@@ -962,7 +960,10 @@ static bfloat16 bfloat16_round_pack_canonical(FloatParts64 p, float_status *s)
 
 static FloatParts64 float32_unpack_canonical(float32 f, float_status *s)
 {
-    return sf_canonicalize(float32_unpack_raw(f), &float32_params, s);
+    FloatParts64 p;
+
+    float32_unpack_raw(&p, f);
+    return sf_canonicalize(p, &float32_params, s);
 }
 
 static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
@@ -972,7 +973,10 @@ static float32 float32_round_pack_canonical(FloatParts64 p, float_status *s)
 
 static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
 {
-    return sf_canonicalize(float64_unpack_raw(f), &float64_params, s);
+    FloatParts64 p;
+
+    float64_unpack_raw(&p, f);
+    return sf_canonicalize(p, &float64_params, s);
 }
 
 static float64 float64_round_pack_canonical(FloatParts64 p, float_status *s)
@@ -3648,7 +3652,9 @@ bfloat16 bfloat16_default_nan(float_status *status)
 
 float16 float16_silence_nan(float16 a, float_status *status)
 {
-    FloatParts64 p = float16_unpack_raw(a);
+    FloatParts64 p;
+
+    float16_unpack_raw(&p, a);
     p.frac <<= float16_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= float16_params.frac_shift;
@@ -3657,7 +3663,9 @@ float16 float16_silence_nan(float16 a, float_status *status)
 
 float32 float32_silence_nan(float32 a, float_status *status)
 {
-    FloatParts64 p = float32_unpack_raw(a);
+    FloatParts64 p;
+
+    float32_unpack_raw(&p, a);
     p.frac <<= float32_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= float32_params.frac_shift;
@@ -3666,7 +3674,9 @@ float32 float32_silence_nan(float32 a, float_status *status)
 
 float64 float64_silence_nan(float64 a, float_status *status)
 {
-    FloatParts64 p = float64_unpack_raw(a);
+    FloatParts64 p;
+
+    float64_unpack_raw(&p, a);
     p.frac <<= float64_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= float64_params.frac_shift;
@@ -3675,7 +3685,9 @@ float64 float64_silence_nan(float64 a, float_status *status)
 
 bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
 {
-    FloatParts64 p = bfloat16_unpack_raw(a);
+    FloatParts64 p;
+
+    bfloat16_unpack_raw(&p, a);
     p.frac <<= bfloat16_params.frac_shift;
     p = parts_silence_nan(p, status);
     p.frac >>= bfloat16_params.frac_shift;
@@ -3700,7 +3712,9 @@ static bool parts_squash_denormal(FloatParts64 p, float_status *status)
 float16 float16_squash_input_denormal(float16 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts64 p = float16_unpack_raw(a);
+        FloatParts64 p;
+
+        float16_unpack_raw(&p, a);
         if (parts_squash_denormal(p, status)) {
             return float16_set_sign(float16_zero, p.sign);
         }
@@ -3711,7 +3725,9 @@ float16 float16_squash_input_denormal(float16 a, float_status *status)
 float32 float32_squash_input_denormal(float32 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts64 p = float32_unpack_raw(a);
+        FloatParts64 p;
+
+        float32_unpack_raw(&p, a);
         if (parts_squash_denormal(p, status)) {
             return float32_set_sign(float32_zero, p.sign);
         }
@@ -3722,7 +3738,9 @@ float32 float32_squash_input_denormal(float32 a, float_status *status)
 float64 float64_squash_input_denormal(float64 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts64 p = float64_unpack_raw(a);
+        FloatParts64 p;
+
+        float64_unpack_raw(&p, a);
         if (parts_squash_denormal(p, status)) {
             return float64_set_sign(float64_zero, p.sign);
         }
@@ -3733,7 +3751,9 @@ float64 float64_squash_input_denormal(float64 a, float_status *status)
 bfloat16 bfloat16_squash_input_denormal(bfloat16 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts64 p = bfloat16_unpack_raw(a);
+        FloatParts64 p;
+
+        bfloat16_unpack_raw(&p, a);
         if (parts_squash_denormal(p, status)) {
             return bfloat16_set_sign(bfloat16_zero, p.sign);
         }
-- 
2.25.1


