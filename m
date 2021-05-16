Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7E381EE6
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:54:02 +0200 (CEST)
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGHQ-0005my-VT
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzC-0007db-0A
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:10 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:39756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz1-0007ox-Eo
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:09 -0400
Received: by mail-qk1-x732.google.com with SMTP id k127so3306379qkc.6
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hfY0ZaTydaVjsCvXo8wfDUit/9H1yCIOT+0mDLtjiOw=;
 b=Vo9CyuGfVqQvqdkoA6+feffTl1rFmLbeEwVy8FifdOmS63Ai+FeJabEe0CbkfjVw5I
 hcmz0JRe8Mb04Pry5/2bZeeIpX66cerzxtP++osfOtr+GPcRZHqk1B3enO/1N0Tq2xxE
 2E0leFbLQsWSBkYJY1Zkp4klAm8XG1QD/yXOUNvTJb4GtDlaHWdfMzuUlUCS9/28GixG
 cj+KL/TkDq+KBprIt1OB25YZG0RovLZZEQgjPwM+taopzj5wpKLF+DQqs62OXB+hMsfR
 Mw06afysHCAErz1VLm4nPw6IzUS8FfF4sE/ItQ1hESd97Kq9mnvPaYR1jJFje6uNsR0p
 m/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hfY0ZaTydaVjsCvXo8wfDUit/9H1yCIOT+0mDLtjiOw=;
 b=Y2d4WZt/Zcqk/RauKXPk4JgPULuDXaiRaLHKjb/1fvUDeX8Ny84werFXoG+UwNp4vW
 Um+TNf4P04o/+SIS626RzPBrnmOr5SLIkmJMomS0wCCq2SAz9/0QvLhEm0x2J3UpCH1m
 0bcglbAYQX+UE9KsWY0BsOMldAdPoRr0ZYKALHapr0ZxxVa2EOUn1rvegVFv0H3x1hkj
 vWTbhlUtKileesFrxoKB5KbEOY1IH4xjFgiAT0TtHMB3lZj0aqyHcQLWuw039eFgE50B
 uGgYCJBsqmro7AKKNxrZT750Va7LR4iA9e3It0e0j0RryI+6HGnkR3PtQQNFDmCnAppE
 LnCw==
X-Gm-Message-State: AOAM532sBMZJtcJc+s6f81Wgg6/lqFnAO1H89Xp9gqgWkuvv03M5laKy
 bJRslgmBJ43VA2D4J2UCkanpelJx1OmdRJLCSqE=
X-Google-Smtp-Source: ABdhPJwm4AX5aYKtXRfmAQ5ffz9cexhuMEYX7uQhez0a/BxYO1ggoOt1nyOa4Q2TSdeaJKCJTdQJEg==
X-Received: by 2002:a37:e40f:: with SMTP id y15mr53427637qkf.314.1621168498339; 
 Sun, 16 May 2021 05:34:58 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/46] softfloat: Move sf_canonicalize to softfloat-parts.c.inc
Date: Sun, 16 May 2021 07:34:16 -0500
Message-Id: <20210516123431.718318-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
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

At the same time, convert to pointers, rename to parts$N_canonicalize
and define a macro for parts_canonicalize using QEMU_GENERIC.

Rearrange the cases to recognize float_class_normal as
early as possible.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 117 +++++++++++++++++++++++++-------------
 fpu/softfloat-parts.c.inc |  33 +++++++++++
 2 files changed, 112 insertions(+), 38 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index df004dbe2f..535261db44 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -733,6 +733,14 @@ static FloatParts128 *parts128_pick_nan_muladd(FloatParts128 *a,
 #define parts_pick_nan_muladd(A, B, C, S, ABM, ABCM) \
     PARTS_GENERIC_64_128(pick_nan_muladd, A)(A, B, C, S, ABM, ABCM)
 
+static void parts64_canonicalize(FloatParts64 *p, float_status *status,
+                                 const FloatFmt *fmt);
+static void parts128_canonicalize(FloatParts128 *p, float_status *status,
+                                  const FloatFmt *fmt);
+
+#define parts_canonicalize(A, S, F) \
+    PARTS_GENERIC_64_128(canonicalize, A)(A, S, F)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -759,52 +767,85 @@ static int frac128_cmp(FloatParts128 *a, FloatParts128 *b)
 
 #define frac_cmp(A, B)  FRAC_GENERIC_64_128(cmp, A)(A, B)
 
+static void frac64_clear(FloatParts64 *a)
+{
+    a->frac = 0;
+}
+
+static void frac128_clear(FloatParts128 *a)
+{
+    a->frac_hi = a->frac_lo = 0;
+}
+
+#define frac_clear(A)  FRAC_GENERIC_64_128(clear, A)(A)
+
+static bool frac64_eqz(FloatParts64 *a)
+{
+    return a->frac == 0;
+}
+
+static bool frac128_eqz(FloatParts128 *a)
+{
+    return (a->frac_hi | a->frac_lo) == 0;
+}
+
+#define frac_eqz(A)  FRAC_GENERIC_64_128(eqz, A)(A)
+
+static int frac64_normalize(FloatParts64 *a)
+{
+    if (a->frac) {
+        int shift = clz64(a->frac);
+        a->frac <<= shift;
+        return shift;
+    }
+    return 64;
+}
+
+static int frac128_normalize(FloatParts128 *a)
+{
+    if (a->frac_hi) {
+        int shl = clz64(a->frac_hi);
+        if (shl) {
+            int shr = 64 - shl;
+            a->frac_hi = (a->frac_hi << shl) | (a->frac_lo >> shr);
+            a->frac_lo = (a->frac_lo << shl);
+        }
+        return shl;
+    } else if (a->frac_lo) {
+        int shl = clz64(a->frac_lo);
+        a->frac_hi = (a->frac_lo << shl);
+        a->frac_lo = 0;
+        return shl + 64;
+    }
+    return 128;
+}
+
+#define frac_normalize(A)  FRAC_GENERIC_64_128(normalize, A)(A)
+
+static void frac64_shl(FloatParts64 *a, int c)
+{
+    a->frac <<= c;
+}
+
 static void frac128_shl(FloatParts128 *a, int c)
 {
     shift128Left(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
 }
 
-#define frac_shl(A, C)             frac128_shl(A, C)
+#define frac_shl(A, C)  FRAC_GENERIC_64_128(shl, A)(A, C)
+
+static void frac64_shr(FloatParts64 *a, int c)
+{
+    a->frac >>= c;
+}
 
 static void frac128_shr(FloatParts128 *a, int c)
 {
     shift128Right(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
 }
 
-#define frac_shr(A, C)             frac128_shr(A, C)
+#define frac_shr(A, C)  FRAC_GENERIC_64_128(shr, A)(A, C)
 
-/* Canonicalize EXP and FRAC, setting CLS.  */
-static FloatParts64 sf_canonicalize(FloatParts64 part, const FloatFmt *parm,
-                                  float_status *status)
-{
-    if (part.exp == parm->exp_max && !parm->arm_althp) {
-        if (part.frac == 0) {
-            part.cls = float_class_inf;
-        } else {
-            part.frac <<= parm->frac_shift;
-            part.cls = (parts_is_snan_frac(part.frac, status)
-                        ? float_class_snan : float_class_qnan);
-        }
-    } else if (part.exp == 0) {
-        if (likely(part.frac == 0)) {
-            part.cls = float_class_zero;
-        } else if (status->flush_inputs_to_zero) {
-            float_raise(float_flag_input_denormal, status);
-            part.cls = float_class_zero;
-            part.frac = 0;
-        } else {
-            int shift = clz64(part.frac);
-            part.cls = float_class_normal;
-            part.exp = parm->frac_shift - parm->exp_bias - shift + 1;
-            part.frac <<= shift;
-        }
-    } else {
-        part.cls = float_class_normal;
-        part.exp -= parm->exp_bias;
-        part.frac = DECOMPOSED_IMPLICIT_BIT + (part.frac << parm->frac_shift);
-    }
-    return part;
-}
 
 /* Round and uncanonicalize a floating-point number by parts. There
  * are FRAC_SHIFT bits that may require rounding at the bottom of the
@@ -984,7 +1025,7 @@ static void float16a_unpack_canonical(FloatParts64 *p, float16 f,
                                       float_status *s, const FloatFmt *params)
 {
     float16_unpack_raw(p, f);
-    *p = sf_canonicalize(*p, params, s);
+    parts_canonicalize(p, s, params);
 }
 
 static void float16_unpack_canonical(FloatParts64 *p, float16 f,
@@ -997,7 +1038,7 @@ static void bfloat16_unpack_canonical(FloatParts64 *p, bfloat16 f,
                                       float_status *s)
 {
     bfloat16_unpack_raw(p, f);
-    *p = sf_canonicalize(*p, &bfloat16_params, s);
+    parts_canonicalize(p, s, &bfloat16_params);
 }
 
 static float16 float16a_round_pack_canonical(FloatParts64 *p,
@@ -1025,7 +1066,7 @@ static void float32_unpack_canonical(FloatParts64 *p, float32 f,
                                      float_status *s)
 {
     float32_unpack_raw(p, f);
-    *p = sf_canonicalize(*p, &float32_params, s);
+    parts_canonicalize(p, s, &float32_params);
 }
 
 static float32 float32_round_pack_canonical(FloatParts64 *p,
@@ -1039,7 +1080,7 @@ static void float64_unpack_canonical(FloatParts64 *p, float64 f,
                                      float_status *s)
 {
     float64_unpack_raw(p, f);
-    *p = sf_canonicalize(*p, &float64_params, s);
+    parts_canonicalize(p, s, &float64_params);
 }
 
 static float64 float64_round_pack_canonical(FloatParts64 *p,
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a78d61ea07..25bf99bd0f 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -100,3 +100,36 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
     }
     return a;
 }
+
+/*
+ * Canonicalize the FloatParts structure.  Determine the class,
+ * unbias the exponent, and normalize the fraction.
+ */
+static void partsN(canonicalize)(FloatPartsN *p, float_status *status,
+                                 const FloatFmt *fmt)
+{
+    if (unlikely(p->exp == 0)) {
+        if (likely(frac_eqz(p))) {
+            p->cls = float_class_zero;
+        } else if (status->flush_inputs_to_zero) {
+            float_raise(float_flag_input_denormal, status);
+            p->cls = float_class_zero;
+            frac_clear(p);
+        } else {
+            int shift = frac_normalize(p);
+            p->cls = float_class_normal;
+            p->exp = fmt->frac_shift - fmt->exp_bias - shift + 1;
+        }
+    } else if (likely(p->exp < fmt->exp_max) || fmt->arm_althp) {
+        p->cls = float_class_normal;
+        p->exp -= fmt->exp_bias;
+        frac_shl(p, fmt->frac_shift);
+        p->frac_hi |= DECOMPOSED_IMPLICIT_BIT;
+    } else if (likely(frac_eqz(p))) {
+        p->cls = float_class_inf;
+    } else {
+        frac_shl(p, fmt->frac_shift);
+        p->cls = (parts_is_snan_frac(p->frac_hi, status)
+                  ? float_class_snan : float_class_qnan);
+    }
+}
-- 
2.25.1


