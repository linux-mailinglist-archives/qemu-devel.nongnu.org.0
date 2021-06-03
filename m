Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D039AD17
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:46:36 +0200 (CEST)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovAh-000663-PC
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5w-00025j-Sl
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:40 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5s-000117-1f
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:40 -0400
Received: by mail-pf1-x42a.google.com with SMTP id u126so1935757pfu.13
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/O3G+s5zkrQ27z7duiC08BP2nW9q9ClatbZtV+eVQt0=;
 b=AdXiEiXz11/DSAfCNJlFbgdN1GA1QAjYQX+j1qseJZEdu0oxXrsxodCmygAuVA5JRU
 jDX4bpxKJFI2qVyRwwJi6Lu4LIr+xtVYgPV0e8fBdedH1babfzDGHY5OKjOJ8QIQo0ou
 YdyI0jQK+/+Uf4hMDT2WMdFgNBwOXbpaFiOUObtlpjKByUAHWLDJdtbnULk8mdT/FShP
 mK6pEVZUl7zvhJQSMLOU77AYLc3pTJA/hxSYiEe9LYh3JAtZCUMEaWDsHKs+jxjqyqK5
 tg7v+aDO/2pWFxY2YNvuwWbjl5u0RavUp2R3NT62pZ6GVvTvafOfMeLf5zszK6CnpHRJ
 iz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/O3G+s5zkrQ27z7duiC08BP2nW9q9ClatbZtV+eVQt0=;
 b=NvAk19pSV/hdHK49RrCBfOPSWaDsqKVnJvgpfbx/eSoHrgwlgNOiEfuO+k0fByoYGr
 RC8zWPs7JsE3rlqbXWeEKPQiIx7vM/G6RnqpAhSy8Fsi1+WsMMdZ6Yfmpp5YSdWIjbSE
 zt6QYIawQj11vjBajpp9/6gZoakMRbBgTg1IPqL5TNrjqAB9rtOCQk/sgL+wV3w1rXyH
 gJQNDmAjf3W+Ybv3413dbopASz1uvouDmXt5KqZ7UyK8wOLtGLyyJ9ET2j6zCxpLd3kM
 NN3tZ/hVJUqngC31CF3YCcUgVdknLMaKOzUAMXBi+UZ9OZKHRj9CHGtONA8PJdstAEuN
 BGMQ==
X-Gm-Message-State: AOAM5327eMUkf6UXH2oz7tHBax9wUIwwtBuy4xKh42ld1xOL641PnAlt
 yNvDewDDD5755nbSLdwez/8oFvq2Q7Iq4g==
X-Google-Smtp-Source: ABdhPJw6C1uqfHrCsBLhS/ERYIRyrVUG79bLDe2I6pCfqNi2YtXXCmDj/dRSlmQ4gpTdWusyU6pA4g==
X-Received: by 2002:a63:4b42:: with SMTP id k2mr1481437pgl.33.1622756494694;
 Thu, 03 Jun 2021 14:41:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/29] softfloat: Move uint_to_float to softfloat-parts.c.inc
Date: Thu,  3 Jun 2021 14:41:05 -0700
Message-Id: <20210603214131.629841-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

Rename to parts$N_uint_to_float.
Reimplement uint64_to_float128 with FloatParts128.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 83 ++++++++++++++++-----------------------
 fpu/softfloat-parts.c.inc | 23 +++++++++++
 2 files changed, 56 insertions(+), 50 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6404a2997f..db14bd09aa 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -857,6 +857,14 @@ static void parts128_sint_to_float(FloatParts128 *p, int64_t a,
 #define parts_sint_to_float(P, I, Z, S) \
     PARTS_GENERIC_64_128(sint_to_float, P)(P, I, Z, S)
 
+static void parts64_uint_to_float(FloatParts64 *p, uint64_t a,
+                                  int scale, float_status *s);
+static void parts128_uint_to_float(FloatParts128 *p, uint64_t a,
+                                   int scale, float_status *s);
+
+#define parts_uint_to_float(P, I, Z, S) \
+    PARTS_GENERIC_64_128(uint_to_float, P)(P, I, Z, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -3102,35 +3110,15 @@ float128 int32_to_float128(int32_t a, float_status *status)
 }
 
 /*
- * Unsigned Integer to float conversions
- *
- * Returns the result of converting the unsigned integer `a' to the
- * floating-point format. The conversion is performed according to the
- * IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+ * Unsigned Integer to floating-point conversions
  */
 
-static FloatParts64 uint_to_float(uint64_t a, int scale, float_status *status)
-{
-    FloatParts64 r = { .sign = false };
-    int shift;
-
-    if (a == 0) {
-        r.cls = float_class_zero;
-    } else {
-        scale = MIN(MAX(scale, -0x10000), 0x10000);
-        shift = clz64(a);
-        r.cls = float_class_normal;
-        r.exp = DECOMPOSED_BINARY_POINT - shift + scale;
-        r.frac = a << shift;
-    }
-
-    return r;
-}
-
 float16 uint64_to_float16_scalbn(uint64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = uint_to_float(a, scale, status);
-    return float16_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_uint_to_float(&p, a, scale, status);
+    return float16_round_pack_canonical(&p, status);
 }
 
 float16 uint32_to_float16_scalbn(uint32_t a, int scale, float_status *status)
@@ -3165,8 +3153,10 @@ float16 uint8_to_float16(uint8_t a, float_status *status)
 
 float32 uint64_to_float32_scalbn(uint64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = uint_to_float(a, scale, status);
-    return float32_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_uint_to_float(&p, a, scale, status);
+    return float32_round_pack_canonical(&p, status);
 }
 
 float32 uint32_to_float32_scalbn(uint32_t a, int scale, float_status *status)
@@ -3196,8 +3186,10 @@ float32 uint16_to_float32(uint16_t a, float_status *status)
 
 float64 uint64_to_float64_scalbn(uint64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = uint_to_float(a, scale, status);
-    return float64_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_uint_to_float(&p, a, scale, status);
+    return float64_round_pack_canonical(&p, status);
 }
 
 float64 uint32_to_float64_scalbn(uint32_t a, int scale, float_status *status)
@@ -3225,15 +3217,12 @@ float64 uint16_to_float64(uint16_t a, float_status *status)
     return uint64_to_float64_scalbn(a, 0, status);
 }
 
-/*
- * Returns the result of converting the unsigned integer `a' to the
- * bfloat16 format.
- */
-
 bfloat16 uint64_to_bfloat16_scalbn(uint64_t a, int scale, float_status *status)
 {
-    FloatParts64 pa = uint_to_float(a, scale, status);
-    return bfloat16_round_pack_canonical(&pa, status);
+    FloatParts64 p;
+
+    parts_uint_to_float(&p, a, scale, status);
+    return bfloat16_round_pack_canonical(&p, status);
 }
 
 bfloat16 uint32_to_bfloat16_scalbn(uint32_t a, int scale, float_status *status)
@@ -3261,6 +3250,14 @@ bfloat16 uint16_to_bfloat16(uint16_t a, float_status *status)
     return uint64_to_bfloat16_scalbn(a, 0, status);
 }
 
+float128 uint64_to_float128(uint64_t a, float_status *status)
+{
+    FloatParts128 p;
+
+    parts_uint_to_float(&p, a, 0, status);
+    return float128_round_pack_canonical(&p, status);
+}
+
 /* Float Min/Max */
 /* min() and max() functions. These can't be implemented as
  * 'compare and pick one input' because that would mishandle
@@ -4972,20 +4969,6 @@ floatx80 int64_to_floatx80(int64_t a, float_status *status)
 
 }
 
-/*----------------------------------------------------------------------------
-| Returns the result of converting the 64-bit unsigned integer `a'
-| to the quadruple-precision floating-point format.  The conversion is performed
-| according to the IEC/IEEE Standard for Binary Floating-Point Arithmetic.
-*----------------------------------------------------------------------------*/
-
-float128 uint64_to_float128(uint64_t a, float_status *status)
-{
-    if (a == 0) {
-        return float128_zero;
-    }
-    return normalizeRoundAndPackFloat128(0, 0x406E, 0, a, status);
-}
-
 /*----------------------------------------------------------------------------
 | Returns the result of converting the single-precision floating-point value
 | `a' to the extended double-precision floating-point format.  The conversion
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index b7486f02db..2eb7bb96b3 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -915,3 +915,26 @@ static void partsN(sint_to_float)(FloatPartsN *p, int64_t a,
     p->exp = DECOMPOSED_BINARY_POINT - shift + scale;
     p->frac_hi = f << shift;
 }
+
+/*
+ * Unsigned Integer to float conversions
+ *
+ * Returns the result of converting the unsigned integer `a' to the
+ * floating-point format. The conversion is performed according to the
+ * IEC/IEEE Standard for Binary Floating-Point Arithmetic.
+ */
+static void partsN(uint_to_float)(FloatPartsN *p, uint64_t a,
+                                  int scale, float_status *status)
+{
+    memset(p, 0, sizeof(*p));
+
+    if (a == 0) {
+        p->cls = float_class_zero;
+    } else {
+        int shift = clz64(a);
+        scale = MIN(MAX(scale, -0x10000), 0x10000);
+        p->cls = float_class_normal;
+        p->exp = DECOMPOSED_BINARY_POINT - shift + scale;
+        p->frac_hi = a << shift;
+    }
+}
-- 
2.25.1


