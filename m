Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DC39068F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 18:23:20 +0200 (CEST)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llZpv-0004EZ-BP
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 12:23:19 -0400
Received: from [2001:470:142:3::10] (port=60606 helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYem-0002Ag-Gf
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:44 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llYeS-0006lb-Ez
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:07:43 -0400
Received: by mail-pf1-x436.google.com with SMTP id x18so19535009pfi.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFUF30PagAXhKM0dixbmpt9CMC+0KnqcFmUJiQifWoM=;
 b=PMLlTlkvPOWxRykFfR0i0BtrNbCKbeO3YwHzCKjfpPtcrz7amfVClToEdEsSuvFlyE
 xfUBybHPo3OVYeZuq0MIn4BAV+MQArljh6BbHyeKctJu0gPOE3+GHU5BZZ85Ooobw6ds
 CrOjlyFAdYDepHE06qhooXCaqXmP3RL6Xn4nBiPSoou/+ZyrD8YxljfkJzqs7y/KOsBX
 1edgB5l8wpRRbVjbANoplrJ2Fs8Cy00wZcYiTCV4v8F417BZt0fzsynui+zFj81o0bYi
 dQ3g0XKawb5s6u5ZtL+IYByy1IxV2G2viLmRjCIL0ewpi0Wm8BQG7JIgnQbGZE1LQha2
 GNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oFUF30PagAXhKM0dixbmpt9CMC+0KnqcFmUJiQifWoM=;
 b=SEDggpXtDlhA+hLPy2RThcrvmGAnOt1bVPo8YqMM+YiySU5EcDDsYGVioOislrY75N
 Lh1UDJM4IVmqif3E2g4G28B47U4hJ4iz2e1X+PKukKqDysHKs/D8PiqlNi0d6Kutv3wl
 Eqzyp93JALjeOxhtgPFJ+IV0idJ8kTR5ratcYr3DcLxB0gxmv4SsQ/BMkWYm6A37mNoI
 G0c0odVsiTfPKqxfNro0kscFQEAJOa5O5E2VE4/2eUJYxD5UuXUgDpxhXMes6GcWuZhA
 MzQjy7nOQGUE2GTuIxV3pHDnvCmmHhgSyhFhMFrACbdCSLl90Ico4Ezgf9x48IWjN57O
 +CAQ==
X-Gm-Message-State: AOAM531FLtUp1Mf0i0X/CliEkiVVKDzs+QtN2kzCG54iwG6uanBIGbXH
 tvtHmqrYRAQN2gh4ixkN9r/2mHrWO+kYKA==
X-Google-Smtp-Source: ABdhPJxk8vPoUZk/1Ysv0JvFTqiMulCHdBsBCVF7lsM8hWMPi9H9BVOZWpqub1bU8SDSvA0eYGGiPg==
X-Received: by 2002:a62:d447:0:b029:291:19f7:ddcd with SMTP id
 u7-20020a62d4470000b029029119f7ddcdmr30705548pfl.54.1621955242990; 
 Tue, 25 May 2021 08:07:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id z19sm2231943pjq.11.2021.05.25.08.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:07:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/28] softfloat: Convert float32_exp2 to FloatParts
Date: Tue, 25 May 2021 08:07:02 -0700
Message-Id: <20210525150706.294968-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525150706.294968-1-richard.henderson@linaro.org>
References: <20210525150706.294968-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
index b86441d0c9..c778b96c37 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -5213,47 +5213,40 @@ static const float64 float32_exp2_coefficients[15] =
 
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


