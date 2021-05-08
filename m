Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A2376EF0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:46:00 +0200 (CEST)
Received: from localhost ([::1]:35372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCyd-00038P-FP
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8Q-0003Xd-Ap
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:02 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC8E-0005bK-Lv
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:52:02 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 lj11-20020a17090b344bb029015bc3073608so6553355pjb.3
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Z3suMoiq2NOsSh1nb+Y+UBUwnjAhv5Rkm1TF46BgbU=;
 b=kNopF2bhrMPhCTXvG8jdj/L6NeKzgJe+RsOgZzqLna85kWRBjsZK8vG1y3e+MuxuDQ
 il2YYJUtim8HSngmV9JcxX68zQ4TYLixpQ4JQyNxuQIqOieoSLQY5xLjw7DYWZsAyJ++
 UU09I4133v9taIG5dbm3yZSS8g2OnNRow7FwVCvVIGIWvd+Dxd2MEZgB3vQ4Dv6hZ8rq
 hXjp6DTkzaB5TDIypxC4SYK2Ku9fqX3MZdp6rC/peQvzGpCy0u/anfuMfRDB7EkhWeqc
 rZwrifV8DxVS3Mfdf6LTGNk/jUFmYI1gp9j/FxB1pPKztL1yuvYfJKvhtv1NZ6MPvFrA
 RiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Z3suMoiq2NOsSh1nb+Y+UBUwnjAhv5Rkm1TF46BgbU=;
 b=j9nCRxwcWskoh0M//seAgmhHajT1/Zx71hIwHLQ3FdUeVpoyzhu7KJP5tWKrt3rLHQ
 B0ihMA2GYIc9z7jweeaE5HcOjGk0urCHOQg4X7EJvRtsGgWqwgv41lqEje+D3MMc8TV+
 /Y41n1w6WAPWP9MnwLI9s0Eqa6YnBKjpk/Ogut3pcE6/6ErUJod0gFtBS1aXSBwryMxC
 +I/mqcRbwBzqLumTqGWoCP0Tvl51GKKw+K0of1ujdaBc9ZU0GfBwEGrJaAJoAZmmhz4P
 3E1XlNxzzv2lxW0cEYspCi0SYLq5PE7cU/c5szUAD+wJVocFCsom6LfitzT4PPKbTwEe
 NYkg==
X-Gm-Message-State: AOAM533DlKUJzYUOV8jFvGWxgY053C85nqItePHrINrKExSeBzUZ7L7A
 eOTLhQuIPc1NR4xF11t1rjf7uwMmjnWjMg==
X-Google-Smtp-Source: ABdhPJw34LBuio8V9ocFwQZ0/e1j6tjS3O6oTopCS6gML7NdqnfBXOOV0J6NZNzid6vfOsxW8C+72w==
X-Received: by 2002:a17:90a:410e:: with SMTP id
 u14mr27089522pjf.45.1620438709023; 
 Fri, 07 May 2021 18:51:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 70/72] softfloat: Convert float32_exp2 to FloatParts
Date: Fri,  7 May 2021 18:48:00 -0700
Message-Id: <20210508014802.892561-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Keep the intermediate results in FloatParts instead of
converting back and forth between float64.  Use muladd
instead of separate mul+add.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 53 +++++++++++++++++++++----------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b89ec4b832..906bb427ae 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5212,47 +5212,40 @@ static const float64 float32_exp2_coefficients[15] =
 
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


