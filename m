Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC4A376E67
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:10:37 +0200 (CEST)
Received: from localhost ([::1]:42774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCQO-0008GQ-GW
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC53-0004GW-6r
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:35 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4r-0003dA-I6
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:32 -0400
Received: by mail-pl1-x635.google.com with SMTP id z18so2556712plg.8
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7MJgtQMBS2ngXY709lmeRGrslyeOuJRTB/k5dCBY0b0=;
 b=ZEzQ62fuZL23i3KzUSjzVnFtRoMPgOLRz60W8vDr/iS/hpaEKguU9nNJbtqx7fos+j
 UakYvqmu3lgKRABCV3KAi8ie9klJvm0KW6lekdVZ97b+w+gFKDB/w2ztwMVbsty0Y1o1
 kapRnJcqpxNGUrHEY7IUYScIqtbrH1Bq4fM7KWMg4hCdISa8I7AFeyMxUdvg1TUE7Jej
 T2hZyhKHrQlf6NngHDQG+tZ+qmMO7f1WTntO50v1J4hwXR6N9GEGNHp58CcZ4PMtDP4Q
 /pvWJpVelHzh25NIcy+etZRJHOlm4DCwnRMLFhDfwSWGqUiDtKJNGhogQKSxVxO+KK20
 Pzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7MJgtQMBS2ngXY709lmeRGrslyeOuJRTB/k5dCBY0b0=;
 b=BMQRvuV7VvUp4R9aaOmK6azY+5R+gBc0VZqCY+dqHe+DYWvFhgJ6KDYTOodan0K8FP
 v5wZPDogmfcB5Z38bKGeWRwan/Vut0FQ5d/ckhdgtMCW+VcWYg24d5Nc0fY8lDExuPj1
 Em1GNFtcDZgRqvi0plZr1pH/McCFnBXSqqEBhEVyXL1H1XSdx/wL8EP5sf+5ROPmg/+K
 +QHPdUM+1gR3rXfR8WV82AZ5eAN6iboH1oPVK/wN6ED6xZQeR5EQwl/EoQftMLZVZnJF
 AxbKDasdWD+I9aBNt47mjnThpP81EHTNU/k0VhBmPXdrp6U+jC1jYR+QMywUR/Tj15q7
 h2Kw==
X-Gm-Message-State: AOAM530tVDyHr+BvmDNumAyxfL6fMGq/TVrC14o8WOG/iUUFtBhEpzQf
 1JMngnKJKW3zoccw3gfq4/7Uz9WKA6+pnQ==
X-Google-Smtp-Source: ABdhPJwEMXsPs+bVzMlQGYffoOm4wFYKsfeIBRI1e4BRHa/PWn6zRX8yQ1wd5sU5GUkZVhSLg4tzQA==
X-Received: by 2002:a17:90a:6289:: with SMTP id
 d9mr13725072pjj.84.1620438499617; 
 Fri, 07 May 2021 18:48:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/72] softfloat: Use pointers with parts_silence_nan
Date: Fri,  7 May 2021 18:47:14 -0700
Message-Id: <20210508014802.892561-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

At the same time, rename to parts64_silence_nan, split out
parts_silence_nan_frac, and define a macro for parts_silence_nan.

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
index 085ddea62b..2a1bc66633 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -177,20 +177,25 @@ static void parts64_default_nan(FloatParts64 *p, float_status *status)
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


