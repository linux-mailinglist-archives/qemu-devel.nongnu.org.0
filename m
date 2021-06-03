Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01F039AD14
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:45:23 +0200 (CEST)
Received: from localhost ([::1]:32788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lov9W-0004CG-It
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5y-0002Ah-99
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:42 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5u-00012e-Oh
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:42 -0400
Received: by mail-pl1-x632.google.com with SMTP id v13so3582253ple.9
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WsA5H1SuomDIfHMs/+kNzjnQxEcCGSovs51rLnUzoiU=;
 b=dP7hLQuVnKWMn920KUn1YXKSwBLOwSDF9yjYp9atbS4QrOYTthuPJlpEAh4oqu1w0T
 +30ja24isQQiEEIAlzixdbtTtkaAhb7ygX8kRP3sL1/KQmn0+l4xA66XQTtUSpMXNOaz
 sbpmVYxh/sG3euRekcSKfMeyyTkG4DGOR9mJpbobGs20fdUPPyX4XmHO9P9LruSbVyHp
 pEPEWZnlLRVyiuhJ7bwwI9ZIM0JLwsKs6cDAcTY5HoJleTM3afR4wpgYwofVlA1FdJkN
 P8lIHFEpGd+KGCVQ34ixxRNQCy+gxBLaW7QuegI4DkoyoDgB9cne1+ByfhIdzqB/o/1J
 wGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WsA5H1SuomDIfHMs/+kNzjnQxEcCGSovs51rLnUzoiU=;
 b=b+E+4rN5rAEbuBIKnN94h/g9Md9YyctexWntp1AMnclb/KjOebQdPOsD981FAtsP8J
 FNqAEx9OU0UjnZSjajiOrRAc/n90DGGoIlUf/BsYPDSEtBi1xj6b+8aTeEmGvWW+ahw+
 X0MYwvwgSsNFZYVO7x4wtBTRhRJUXnDp0KlZWE3jMcYDjy2iCdann+f2+k2Ds1KX1xg1
 zNlyK9fDr2vaz19MT1fiqeJRqGieYo+vXA0eDXTHcd77WIDiqXrY+q39EZqzB6ZzOYEj
 ueaHf0YF76X9L1H422anBNguLFZovynNyn+8UjISqWu50cNqatOKPF+dgK0RA9s69SQC
 NIoA==
X-Gm-Message-State: AOAM530t3CkqhUJoEb7OtbeYO8bD0WT7CYCjA+ZW8oCKrUezn+KH+ShF
 XGg69C2RIvQNNG3IMBI0j1eIz84p5nuuuQ==
X-Google-Smtp-Source: ABdhPJyFjaTI8J3KGHs66RqnyOERwuG68f+KOQO427FOx0YiFyRYQscTUR8hPxDcH2qlIj+ZbLqzBQ==
X-Received: by 2002:a17:902:9f91:b029:107:5976:f9de with SMTP id
 g17-20020a1709029f91b02901075976f9demr1163505plq.38.1622756497301; 
 Thu, 03 Jun 2021 14:41:37 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/29] softfloat: Move scalbn_decomposed to
 softfloat-parts.c.inc
Date: Thu,  3 Jun 2021 14:41:09 -0700
Message-Id: <20210603214131.629841-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to parts$N_scalbn.
Reimplement float128_scalbn with FloatParts128.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 103 +++++++++++++-------------------------
 fpu/softfloat-parts.c.inc |  21 ++++++++
 2 files changed, 55 insertions(+), 69 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6f1bbbe6cf..666b5a25d6 100644
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
@@ -3529,58 +3535,53 @@ FloatRelation float128_compare_quiet(float128 a, float128 b, float_status *s)
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
@@ -6638,42 +6639,6 @@ floatx80 floatx80_scalbn(floatx80 a, int n, float_status *status)
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
index 3dacb5b4f0..bf935c4fc2 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1075,3 +1075,24 @@ static FloatRelation partsN(compare)(FloatPartsN *a, FloatPartsN *b,
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


