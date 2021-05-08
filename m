Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054B1376E58
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:03:02 +0200 (CEST)
Received: from localhost ([::1]:48414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCJ3-0001Mz-2u
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC57-0004Oo-80
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:37 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4u-0003eN-OR
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:36 -0400
Received: by mail-pg1-x52e.google.com with SMTP id j12so2566629pgh.7
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ki4FuXvK7BJh92SU9AyENZ1CnGAywIA26sz/52XFR5g=;
 b=W0aWBJ6hx1o6EpJVP6o5BKN0s1DWl46OWhP+JKf74OoOtDFZJVAgJ8Kui630YRx04X
 w5saoQwqa8Gj/UqvgqfEmH4+xOxx2NKoiSNMxszk/z1T5MTt6B/irhZ30RNApvyrAPsO
 zbwQFP/DVlsc4Wu+kYBdL3SFgFg/D2e3a9/VxgvqIouDC9088hsiasq85SPKKbaUOmCB
 86wpnIS9+FeK/eOGBeMtziW0PmyqPPetwWNDaGs1QZNOSF+KrKkqp7NiDVpTVDhnCqYN
 g+c/B32nulApwc1RpcD4kOxOHduBDpnNK2pMeXbSPvdIRC2wVdv9m6/nFFR5JjLGaVMM
 Z9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ki4FuXvK7BJh92SU9AyENZ1CnGAywIA26sz/52XFR5g=;
 b=cZ1wqxNM5SIigyyTiw9fotGuxLQzoflVRP5oE5Qm2wnqr2tEmxARaVDy86BjJiTaX9
 YwU47Eg8uGbT5apswu3hpoUfj5jwgrsopQq0Kj7StHk02Uqrd2S1kmuxOPOeMEcEbTOI
 4HOhpWzpHGrDB7qMo8I1Xr0HK4wAOLBVXevl6BF0HTvauHR4Es8oelPlhflvZcyOyS33
 47V04sqRz85a4j5r/WRllAWGuPOg5tsj3KWa/bJDb9R17oTwtAe6WqXfvFm5HHA+XBH1
 ijJzoNmC/aMVuHhlPdtjwe/G+faRPkr1l/hokXpse1Drt1gYjmm2M6JI6zBlosGFSXmh
 qSKw==
X-Gm-Message-State: AOAM5303SeCMEQgOl/yYODtGWNVpB2dhaQsj57BGxQysMg7EPUCtxW+u
 EnNrUqItpbC05GOkN7nPWbSrZrheWJ2VbA==
X-Google-Smtp-Source: ABdhPJx/KcRzMwVo/L9fRhfEqIfdKCc0JMcj1gacDegdUDJ76cYrCCFThMZDWlYjNH8r9zyZGEZJBw==
X-Received: by 2002:aa7:8d5a:0:b029:227:7b07:7d8b with SMTP id
 s26-20020aa78d5a0000b02902277b077d8bmr12918248pfe.26.1620438503234; 
 Fri, 07 May 2021 18:48:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/72] softfloat: Move pick_nan_muladd to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:20 -0700
Message-Id: <20210508014802.892561-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

At the same time, convert to pointers, rename to pick_nan_muladd$N
and define a macro for pick_nan_muladd using QEMU_GENERIC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 53 ++++++++++-----------------------------
 fpu/softfloat-parts.c.inc | 40 +++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 77efaedeaa..40ee294e35 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -720,6 +720,18 @@ static FloatParts128 *parts128_pick_nan(FloatParts128 *a, FloatParts128 *b,
 
 #define parts_pick_nan(A, B, S)    PARTS_GENERIC_64_128(pick_nan, A)(A, B, S)
 
+static FloatParts64 *parts64_pick_nan_muladd(FloatParts64 *a, FloatParts64 *b,
+                                             FloatParts64 *c, float_status *s,
+                                             int ab_mask, int abc_mask);
+static FloatParts128 *parts128_pick_nan_muladd(FloatParts128 *a,
+                                               FloatParts128 *b,
+                                               FloatParts128 *c,
+                                               float_status *s,
+                                               int ab_mask, int abc_mask);
+
+#define parts_pick_nan_muladd(A, B, C, S, ABM, ABCM) \
+    PARTS_GENERIC_64_128(pick_nan_muladd, A)(A, B, C, S, ABM, ABCM)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
@@ -947,45 +959,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
     return p;
 }
 
-static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64 c,
-                                  bool inf_zero, float_status *s)
-{
-    int which;
-
-    if (is_snan(a.cls) || is_snan(b.cls) || is_snan(c.cls)) {
-        float_raise(float_flag_invalid, s);
-    }
-
-    which = pickNaNMulAdd(a.cls, b.cls, c.cls, inf_zero, s);
-
-    if (s->default_nan_mode) {
-        /* Note that this check is after pickNaNMulAdd so that function
-         * has an opportunity to set the Invalid flag.
-         */
-        which = 3;
-    }
-
-    switch (which) {
-    case 0:
-        break;
-    case 1:
-        a = b;
-        break;
-    case 2:
-        a = c;
-        break;
-    case 3:
-        parts_default_nan(&a, s);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (is_snan(a.cls)) {
-        parts_silence_nan(&a, s);
-    }
-    return a;
-}
 
 #define partsN(NAME)   parts64_##NAME
 #define FloatPartsN    FloatParts64
@@ -1496,7 +1469,7 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
      * off to the target-specific pick-a-NaN routine.
      */
     if (unlikely(abc_mask & float_cmask_anynan)) {
-        return pick_nan_muladd(a, b, c, inf_zero, s);
+        return *parts_pick_nan_muladd(&a, &b, &c, s, ab_mask, abc_mask);
     }
 
     if (inf_zero) {
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 11a71650f7..a78d61ea07 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -60,3 +60,43 @@ static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, FloatPartsN *b,
     }
     return a;
 }
+
+static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
+                                            FloatPartsN *c, float_status *s,
+                                            int ab_mask, int abc_mask)
+{
+    int which;
+
+    if (unlikely(abc_mask & float_cmask_snan)) {
+        float_raise(float_flag_invalid, s);
+    }
+
+    which = pickNaNMulAdd(a->cls, b->cls, c->cls,
+                          ab_mask == float_cmask_infzero, s);
+
+    if (s->default_nan_mode || which == 3) {
+        /*
+         * Note that this check is after pickNaNMulAdd so that function
+         * has an opportunity to set the Invalid flag for infzero.
+         */
+        parts_default_nan(a, s);
+        return a;
+    }
+
+    switch (which) {
+    case 0:
+        break;
+    case 1:
+        a = b;
+        break;
+    case 2:
+        a = c;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    if (is_snan(a->cls)) {
+        parts_silence_nan(a, s);
+    }
+    return a;
+}
-- 
2.25.1


