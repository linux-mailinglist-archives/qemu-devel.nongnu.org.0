Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE6C3906A4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:28:37 +0200 (CEST)
Received: from localhost ([::1]:56426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZv2-0004Ro-HB
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeR-0001eP-4Y
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:23 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeH-0006dy-Fh
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:22 -0400
Received: by mail-pj1-x1034.google.com with SMTP id t11so17029864pjm.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UZW48CzleAWs3EEYVj0CQeurJ7gxS/XtjXLc9QsEbJM=;
 b=hHvEcnXEF89YB+M/st1LxzueXdcmbdKouEWdTTBU/yTuI+fNECFsNM8rSmane6HNVy
 NADDYe7eNC41RY2ZA/Wwnaw4SK5rHPA9/Nm7HGmEPHVeZpD8kPE/edsYBqImOLsRRSgM
 Jz+DSMDnTZXBqmpulREDABArK3wu4xPqnDPwizv+4uN9Kw82HWYNwdOukozAQTtH09qS
 ROhmXXk6PURv7th90fyF9K4wcXz5lHsi5EejmCtskY/0ddtsVfU04Oxf4HKHuOReT1iT
 tHaWctONIRgnijp63J/SGI8RgXFRfs/0JOxeAhFYgDTFbdv+jsu17M0YAUJ+VKWyKkzg
 kUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UZW48CzleAWs3EEYVj0CQeurJ7gxS/XtjXLc9QsEbJM=;
 b=eAbJw2dW4vgjKmcgZWm+jCdgb5aAUlS2idGpKErBLAIu7gWRdH4jvphBYAZ3wnG+of
 94u+gf6lS5jH/CDVjQTxCNZ+e917poNPufgeRCKmTsPwq4OzTy1rUvQKZqx/hTzDDPYI
 1hMOcdcM2Atuw9V7c17rVaj3TtvrksDW0wjs2miGGeYmGzCOjPzYO20dE71PFyUxNUDg
 c8dyZiWEA8fWPTNqNDN59X78mWaP6/hnJmda3JYO+poFMlI32zeqKWOw4i8CwC2S2IVG
 n9Txx2x8/1AlbhOLZ7/wy6L0aPVif5PrL3g5iPCw4dLFmeoWsNWWUqccq2VmeQgun9h5
 tsRg==
X-Gm-Message-State: AOAM532dDXvv6rkEsXOqieOHMhB9Ph9rTOVzAxAJDYK2YxKtUfMFyQAZ
 oIGT6FXL8FdZA5XpSBFL4plelVRwcP28DQ==
X-Google-Smtp-Source: ABdhPJzCa0rR8ei/LZqI1kgh3a+95Uy/a8VnJUE+gJjBnHD1EUb4jJHT6+Nnz01g5c6rYeq97ajEbw==
X-Received: by 2002:a17:903:3106:b029:ee:fa93:9546 with SMTP id
 w6-20020a1709033106b02900eefa939546mr31070909plc.23.1621955231425; 
 Tue, 25 May 2021 08:07:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/28] softfloat: Move scalbn_decomposed to
 softfloat-parts.c.inc
Date: Tue, 25 May 2021 08:06:44 -0700
Message-Id: <20210525150706.294968-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Rename to parts$N_scalbn.
Reimplement float128_scalbn with FloatParts128.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 103 +++++++++++++-------------------------
 fpu/softfloat-parts.c.inc |  21 ++++++++
 2 files changed, 55 insertions(+), 69 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 3c2c3ec8f8..45194f5d14 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -890,6 +890,12 @@ static int parts128_compare(FloatParts128 *a, FloatParts128 *b,
 #define parts_compare(A, B, S, Q) \
     PARTS_GENERIC_64_128(compare, A)(A, B, S, Q)
 
+static void parts64_scalbn(FloatParts64 *a, int n, float_status *s);
+static void parts128_scalbn(FloatParts128 *a, int n, float_status *s);
+
+#define parts_scalbn(A, N, S) \
+    PARTS_GENERIC_64_128(scalbn, A)(A, N, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -3532,58 +3538,53 @@ FloatRelation float128_compare_quiet(float128 a, float128 b, float_status *s)
     return float128_do_compare(a, b, s, true);
 }
 
-/* Multiply A by 2 raised to the power N.  */
-static FloatParts64 scalbn_decomposed(FloatParts64 a, int n, float_status *s)
-{
-    if (unlikely(is_nan(a.cls))) {
-        parts_return_nan(&a, s);
-    }
-    if (a.cls == float_class_normal) {
-        /* The largest float type (even though not supported by FloatParts64)
-         * is float128, which has a 15 bit exponent.  Bounding N to 16 bits
-         * still allows rounding to infinity, without allowing overflow
-         * within the int32_t that backs FloatParts64.exp.
-         */
-        n = MIN(MAX(n, -0x10000), 0x10000);
-        a.exp += n;
-    }
-    return a;
-}
+/*
+ * Scale by 2**N
+ */
 
 float16 float16_scalbn(float16 a, int n, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float16_unpack_canonical(&pa, a, status);
-    pr = scalbn_decomposed(pa, n, status);
-    return float16_round_pack_canonical(&pr, status);
+    float16_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return float16_round_pack_canonical(&p, status);
 }
 
 float32 float32_scalbn(float32 a, int n, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float32_unpack_canonical(&pa, a, status);
-    pr = scalbn_decomposed(pa, n, status);
-    return float32_round_pack_canonical(&pr, status);
+    float32_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return float32_round_pack_canonical(&p, status);
 }
 
 float64 float64_scalbn(float64 a, int n, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    float64_unpack_canonical(&pa, a, status);
-    pr = scalbn_decomposed(pa, n, status);
-    return float64_round_pack_canonical(&pr, status);
+    float64_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return float64_round_pack_canonical(&p, status);
 }
 
 bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
 {
-    FloatParts64 pa, pr;
+    FloatParts64 p;
 
-    bfloat16_unpack_canonical(&pa, a, status);
-    pr = scalbn_decomposed(pa, n, status);
-    return bfloat16_round_pack_canonical(&pr, status);
+    bfloat16_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return bfloat16_round_pack_canonical(&p, status);
+}
+
+float128 float128_scalbn(float128 a, int n, float_status *status)
+{
+    FloatParts128 p;
+
+    float128_unpack_canonical(&p, a, status);
+    parts_scalbn(&p, n, status);
+    return float128_round_pack_canonical(&p, status);
 }
 
 /*
@@ -6641,42 +6642,6 @@ floatx80 floatx80_scalbn(floatx80 a, int n, float_status *status)
                                          aSign, aExp, aSig, 0, status);
 }
 
-float128 float128_scalbn(float128 a, int n, float_status *status)
-{
-    bool aSign;
-    int32_t aExp;
-    uint64_t aSig0, aSig1;
-
-    aSig1 = extractFloat128Frac1( a );
-    aSig0 = extractFloat128Frac0( a );
-    aExp = extractFloat128Exp( a );
-    aSign = extractFloat128Sign( a );
-    if ( aExp == 0x7FFF ) {
-        if ( aSig0 | aSig1 ) {
-            return propagateFloat128NaN(a, a, status);
-        }
-        return a;
-    }
-    if (aExp != 0) {
-        aSig0 |= UINT64_C(0x0001000000000000);
-    } else if (aSig0 == 0 && aSig1 == 0) {
-        return a;
-    } else {
-        aExp++;
-    }
-
-    if (n > 0x10000) {
-        n = 0x10000;
-    } else if (n < -0x10000) {
-        n = -0x10000;
-    }
-
-    aExp += n - 1;
-    return normalizeRoundAndPackFloat128( aSign, aExp, aSig0, aSig1
-                                         , status);
-
-}
-
 static void __attribute__((constructor)) softfloat_init(void)
 {
     union_float64 ua, ub, uc, ur;
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 6f9ae7f887..6b553c70a5 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1074,3 +1074,24 @@ static FloatRelation partsN(compare)(FloatPartsN *a, FloatPartsN *b,
  b_sign:
     return b->sign ? float_relation_greater : float_relation_less;
 }
+
+/*
+ * Multiply A by 2 raised to the power N.
+ */
+static void partsN(scalbn)(FloatPartsN *a, int n, float_status *s)
+{
+    switch (a->cls) {
+    case float_class_snan:
+    case float_class_qnan:
+        parts_return_nan(a, s);
+        break;
+    case float_class_zero:
+    case float_class_inf:
+        break;
+    case float_class_normal:
+        a->exp += MIN(MAX(n, -0x10000), 0x10000);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.25.1


