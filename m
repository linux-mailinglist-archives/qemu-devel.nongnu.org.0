Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E802639AD57
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:58:39 +0200 (CEST)
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovMM-0005zj-SS
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov6J-00038S-RI
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:42:03 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov66-0001AC-IB
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:42:03 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so6260193pjz.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96c6uJZ3c+bY6czT9boE4Qd+QkQsfFNNXC+3KlgI5bI=;
 b=BM6d3PSuznr1qtaq+jeJeZCPFmK2oO0q8oIZ4QuuUUuXE0sZaRnfRKc4mnY3QuKNzx
 XkRNKSdm67CDTE9UabSoIkYX6zkXA2kBCkX+VXBBz5b880mvu2MLuOYCM6z2M7H2FmEx
 2GqRcSd9E39VcLqTMi/eHaCoskHB/6tdoppD7hHKXUTQ4FoKKutttwI+dQtdv1feBI3M
 uxCFyTXgaij8a8kqxhZ8iwFkDHz7AqrqvUa01uXrQ5xHwLu7HEn4ThoB0B0gKS5wuzop
 /+i4SFBr9ibqmORnbS1XrmH94gMovIHE4YpAO10V+ekyJOKBjp2sG6OJsMnRqX/P0u8W
 AMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96c6uJZ3c+bY6czT9boE4Qd+QkQsfFNNXC+3KlgI5bI=;
 b=GJG2HM+tRDRBM6kYBfalsWWerwWcn+TL8Pf2KuvOEKYUpG+/+bEmh0NmwFCbb5nJLa
 8QcM+rhzZ4tl0d6Tw27rwbsA+AlLjo9jGpWGq5ekcS7lP0bBnFuYwHbeY//VH9dIaEOW
 b6nViB0/EtQnxH6WFQnr+P1fkKOMIEXB+WgkQbwlrWmE17QsDYUDeQ1gf1qfG10cbqwT
 9b5CGRvkpM2UFe32QpWpH7A2/UnsM03QaRTxvz3Jn80Zpng1yzfXRiCcak6tBp2INIr8
 VeQl9aYbUiwMeAlC6LHGZaOIu3ECDXidBWmCVJWDf3gLeZwuY+EWKC+vOI/1CVUa4Hph
 11BQ==
X-Gm-Message-State: AOAM533BBOeZTcqdIN3eGSAH4Ok7XbmbxqjLXHIC33U9Xoge6Eu3a7v6
 OpbU1tiASF4cyuhQzuXVwOrOGc116+c98A==
X-Google-Smtp-Source: ABdhPJze5wDqtLtv8oITz2Pt84vMv9OhJmBf3pjqu3Vmjq2TnO3+TpIGKvGhB3JCRMIucCEWnOJb4g==
X-Received: by 2002:a17:90a:b782:: with SMTP id
 m2mr5154492pjr.147.1622756509057; 
 Thu, 03 Jun 2021 14:41:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/29] softfloat: Convert float32_exp2 to FloatParts
Date: Thu,  3 Jun 2021 14:41:27 -0700
Message-Id: <20210603214131.629841-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Keep the intermediate results in FloatParts instead of
converting back and forth between float64.  Use muladd
instead of separate mul+add.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 53 +++++++++++++++++++++----------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c32b1c7113..27306d6a93 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5210,47 +5210,40 @@ static const float64 float32_exp2_coefficients[15] =
 
 float32 float32_exp2(float32 a, float_status *status)
 {
-    bool aSign;
-    int aExp;
-    uint32_t aSig;
-    float64 r, x, xn;
+    FloatParts64 xp, xnp, tp, rp;
     int i;
-    a = float32_squash_input_denormal(a, status);
 
-    aSig = extractFloat32Frac( a );
-    aExp = extractFloat32Exp( a );
-    aSign = extractFloat32Sign( a );
-
-    if ( aExp == 0xFF) {
-        if (aSig) {
-            return propagateFloat32NaN(a, float32_zero, status);
+    float32_unpack_canonical(&xp, a, status);
+    if (unlikely(xp.cls != float_class_normal)) {
+        switch (xp.cls) {
+        case float_class_snan:
+        case float_class_qnan:
+            parts_return_nan(&xp, status);
+            return float32_round_pack_canonical(&xp, status);
+        case float_class_inf:
+            return xp.sign ? float32_zero : a;
+        case float_class_zero:
+            return float32_one;
+        default:
+            break;
         }
-        return (aSign) ? float32_zero : a;
-    }
-    if (aExp == 0) {
-        if (aSig == 0) return float32_one;
+        g_assert_not_reached();
     }
 
     float_raise(float_flag_inexact, status);
 
-    /* ******************************* */
-    /* using float64 for approximation */
-    /* ******************************* */
-    x = float32_to_float64(a, status);
-    x = float64_mul(x, float64_ln2, status);
+    float64_unpack_canonical(&xnp, float64_ln2, status);
+    xp = *parts_mul(&xp, &tp, status);
+    xnp = xp;
 
-    xn = x;
-    r = float64_one;
+    float64_unpack_canonical(&rp, float64_one, status);
     for (i = 0 ; i < 15 ; i++) {
-        float64 f;
-
-        f = float64_mul(xn, float32_exp2_coefficients[i], status);
-        r = float64_add(r, f, status);
-
-        xn = float64_mul(xn, x, status);
+        float64_unpack_canonical(&tp, float32_exp2_coefficients[i], status);
+        rp = *parts_muladd(&tp, &xp, &rp, 0, status);
+        xnp = *parts_mul(&xnp, &xp, status);
     }
 
-    return float64_to_float32(r, status);
+    return float32_round_pack_canonical(&rp, status);
 }
 
 /*----------------------------------------------------------------------------
-- 
2.25.1


