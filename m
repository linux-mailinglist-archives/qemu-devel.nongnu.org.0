Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B07376E88
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:26:14 +0200 (CEST)
Received: from localhost ([::1]:54854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCfV-0001o8-RC
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC83-00030T-VB
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:40 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:44901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC81-0005So-46
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:39 -0400
Received: by mail-pg1-x533.google.com with SMTP id y32so8617324pga.11
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WxNVLgCyElMY37gn22Vy5J3sqRsrYp5DRRH+JnN2jwQ=;
 b=fRFdX00Lqr+Vz736N4H6f4pLbQA/G/fE5+tANfIl8AndT8+zWbYwKdpHuPnAfk30ov
 +6xpWLhR/4SaNyBw5QE1M8SF0VvN0ofdagbu1tTnekGy7X/uQ5KNz4mCVJFUQMmTD37i
 wMf7dugsii3SD9Ayqdp9dg1gYELG3i9NxD1BDBfpsy+snSfn5geoOoZyy4v+NFtsRrYJ
 WHXCBGguR21gji2VePNKxVke2TfOGpdlLiOHXYNta0uoU+JV+JmJSJl26xDtUuvRW14a
 Fs6hM7gqzozH8qbzp7pCA+S5nT8rMyzlRx9fIorixfpoy+w9JY5dd0N45ZQkabsI+gkN
 bQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WxNVLgCyElMY37gn22Vy5J3sqRsrYp5DRRH+JnN2jwQ=;
 b=Ui4M19yNIKgmBZYDqq9jVImc7RRVsx6BpUVwZhAq/tWDc+xgn3IS8o9iKuVjcFQQFW
 QGdifkIMcYb6TkY2wEaAv4H7X5KYQmC5G+oKLRvt5KVSP/X4Fs9piKLiglygbJMz8O+r
 YwLakdCGqNOosy0lOn6IsZ1Q6Bo3Ajf8iijl6UkiiOoyAxPYjl4KgTYaZ5wIH6geco4I
 7p2FrxmV78xt7kppFWa+dEMIvi/mnPVe7fOGUxDJD12me/MKafP67o2AlRStHN4LuAZ0
 9Z+y8f1zilrAaA4DPtNeIHeph/0TvTR9IgALA8UA6HEKyaS4q2a0hcewNzWUehCjwR3x
 sNXw==
X-Gm-Message-State: AOAM531NPrVfWwWEGDFc9ZwhTDbpEcR2+3Stpawi3KHJfcwCmLUxHewF
 M79EIjQ0qAHf5GUpI9ul6JcJWjWGD6zplA==
X-Google-Smtp-Source: ABdhPJxHb9O1/dXq3eUHZll29DL0lAN7MWq89haerAHD4penYS97LJlNAkqKXgLNdaBfKeH7H6IPXg==
X-Received: by 2002:a05:6a00:198f:b029:2a9:7589:e78a with SMTP id
 d15-20020a056a00198fb02902a97589e78amr5139566pfl.35.1620438695732; 
 Fri, 07 May 2021 18:51:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 49/72] softfloat: Move uint_to_float to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:39 -0700
Message-Id: <20210508014802.892561-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Rename to parts$N_uint_to_float.
Reimplement uint64_to_float128 with FloatParts128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 83 ++++++++++++++++-----------------------
 fpu/softfloat-parts.c.inc | 23 +++++++++++
 2 files changed, 56 insertions(+), 50 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index d843ea67c4..586ea5d67a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -856,6 +856,14 @@ static void parts128_sint_to_float(FloatParts128 *p, int64_t a,
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
@@ -3101,35 +3109,15 @@ float128 int32_to_float128(int32_t a, float_status *status)
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
@@ -3164,8 +3152,10 @@ float16 uint8_to_float16(uint8_t a, float_status *status)
 
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
@@ -3195,8 +3185,10 @@ float32 uint16_to_float32(uint16_t a, float_status *status)
 
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
@@ -3224,15 +3216,12 @@ float64 uint16_to_float64(uint16_t a, float_status *status)
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
@@ -3260,6 +3249,14 @@ bfloat16 uint16_to_bfloat16(uint16_t a, float_status *status)
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
@@ -4971,20 +4968,6 @@ floatx80 int64_to_floatx80(int64_t a, float_status *status)
 
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
index 8102de1307..f3c4f8c8d2 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -913,3 +913,26 @@ static void partsN(sint_to_float)(FloatPartsN *p, int64_t a,
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


