Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170F2376E77
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:17:18 +0200 (CEST)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCWr-0004sk-5Y
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC59-0004W6-5J
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:39 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4w-0003eS-7s
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:38 -0400
Received: by mail-pf1-x42d.google.com with SMTP id b21so2035424pft.10
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GGsOu93kCXzgLCre7662W7PfQMUfYI0BS7BA7WHvNaE=;
 b=mauqWjXXLNO3oAjslCx2AUlP9OcSoCnJJXhtVtkFJjmpDeWSUTHSIOmtnu0T02SulB
 CNVzmFCUgL7a97KjStwRHaUaJLdaYd/DlqBrsxlls73Ti97wGboeBn8BkEDA0Lqqif45
 UomxKTch7hot6MaWZ//hr7RwV4cQeUZfQOX2YAMHDJSMWRWu6SkZ+ay2fQLYavijQDEW
 VHc9j9+TvXAPUyPOZm/P4XjO+33v68q1rUIV8I4hTqMZlDBA+txyH8LANd84OmHEkqww
 YkBM2uXj+1Q8Fy2x1S6iJypN6FqOu33E99sP5O5SE2C9ko1+XIEi2OQyfBhbdQyR96Dh
 XGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGsOu93kCXzgLCre7662W7PfQMUfYI0BS7BA7WHvNaE=;
 b=M8VNi8N/jsV7V3wgkSRvW0AffC6Dwf59KIHhvxYzDHy35fzVsk5Y5+NZCJ5YtXQ2UV
 m6ZfvRkvwEKZryEz3yVrfZB2E1Psu3Qe8B8mUSLTy6+5rF6VrVKs9KgchVdYLeAwfoku
 UrnF/+FgQ4fDbddBi92v+gLwtC7trT0vSevSl/o928jz9XnFAsGcDQPpoQFT/iwHXt37
 aXGp7r0yHMBIi5CNpj98g4GBsf1H6TU05Gcfug/a4bgUl+dBhTu731VDlWavRYDcHEEe
 /vr5NNsbKqQsmsvKZdhAVsjTh0fPyLkSCGduk8NA09Q/LEiXk5hHqPVpt3t6/V6khru/
 IC+Q==
X-Gm-Message-State: AOAM533BmPHnkhoV6UbxnmoLm3o4gl1hab+6PJOqtwLISOEYx2sHi83s
 fox1OqgNWXFYeFZ40axCNnsqqwwgGEtSuw==
X-Google-Smtp-Source: ABdhPJzacCBcTfGOvhriu/dfwYvSjaUlROm1gbB2taznsSF3iD9tojERYwJAuGmw3yuwkybHpdZ1gQ==
X-Received: by 2002:a62:1ec1:0:b029:24d:b3de:25be with SMTP id
 e184-20020a621ec10000b029024db3de25bemr13052237pfe.17.1620438503828; 
 Fri, 07 May 2021 18:48:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 31/72] softfloat: Move sf_canonicalize to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:21 -0700
Message-Id: <20210508014802.892561-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

At the same time, convert to pointers, rename to parts$N_canonicalize
and define a macro for parts_canonicalize using QEMU_GENERIC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 117 +++++++++++++++++++++++++-------------
 fpu/softfloat-parts.c.inc |  33 +++++++++++
 2 files changed, 112 insertions(+), 38 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 40ee294e35..bad4b54cd2 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -732,6 +732,14 @@ static FloatParts128 *parts128_pick_nan_muladd(FloatParts128 *a,
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
@@ -758,52 +766,85 @@ static int frac128_cmp(FloatParts128 *a, FloatParts128 *b)
 
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
@@ -983,7 +1024,7 @@ static void float16a_unpack_canonical(FloatParts64 *p, float16 f,
                                       float_status *s, const FloatFmt *params)
 {
     float16_unpack_raw(p, f);
-    *p = sf_canonicalize(*p, params, s);
+    parts_canonicalize(p, s, params);
 }
 
 static void float16_unpack_canonical(FloatParts64 *p, float16 f,
@@ -996,7 +1037,7 @@ static void bfloat16_unpack_canonical(FloatParts64 *p, bfloat16 f,
                                       float_status *s)
 {
     bfloat16_unpack_raw(p, f);
-    *p = sf_canonicalize(*p, &bfloat16_params, s);
+    parts_canonicalize(p, s, &bfloat16_params);
 }
 
 static float16 float16a_round_pack_canonical(FloatParts64 *p,
@@ -1024,7 +1065,7 @@ static void float32_unpack_canonical(FloatParts64 *p, float32 f,
                                      float_status *s)
 {
     float32_unpack_raw(p, f);
-    *p = sf_canonicalize(*p, &float32_params, s);
+    parts_canonicalize(p, s, &float32_params);
 }
 
 static float32 float32_round_pack_canonical(FloatParts64 *p,
@@ -1038,7 +1079,7 @@ static void float64_unpack_canonical(FloatParts64 *p, float64 f,
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


