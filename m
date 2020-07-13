Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82362193D7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jul 2020 00:54:01 +0200 (CEST)
Received: from localhost ([::1]:36934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtIwy-0007j5-UZ
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 18:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jtIRy-0002VX-MT
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:21:58 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1jtIRw-000155-Al
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 18:21:58 -0400
Received: by mail-pg1-x52c.google.com with SMTP id z5so24901pgb.6
 for <qemu-devel@nongnu.org>; Wed, 08 Jul 2020 15:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m5mwiR1uGzS0Rpkrb6/VXRgvstz8vbC2nhHqzg+v2Y0=;
 b=j8JwMwF5XTDLl55Y31s7+7Jcm2ghyFdiAqg9Qc+UyWJj78NzxO2dyNRXLF6wzor2Ef
 6kjiIJJt+QGC6ipbJP0dSWUHaHiISS5IgFWeMOv38XcMeXLcSZ4B51F+D7C/TOEwheo6
 JDuBcV0HW1vMtxUa+HCeMG077AM9Z6gtBXyko85HRtFJtCsBmVVBGtanny9sJ0xfzQmm
 KlBmLumDS2VYdregMVuzIDYY2KbfWlfV0Y8qkvPMFBT2CuqtgNZuOMgHGr4Q+uU9/cM6
 GWtdHqwTHruCReoH417/TFmHUze7nXY+hNZegcXdWaPDVQV3sZWqIM8W9RlYUWc2hVXj
 XWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m5mwiR1uGzS0Rpkrb6/VXRgvstz8vbC2nhHqzg+v2Y0=;
 b=qizbahllLDO41egL5BS2ybWtTIoQojAhrR4vIr/mavGFernHOTH4tpfeGPxOiLgtlq
 v+AG2aERcFtTee2+AoAoYDfOCxmSnSicuZet7zhbo8aDwd0IYj7Ji4Pj77eXtS3UxDM7
 GQSkKIK4x7oG9HxKg1G/+AgamJ3VYdMj+gjiw87vrL49peebNhO0Q6XltB1JmnkaVRu9
 b7qiz8V51fm7HLh2M+CpOQIGW16f1TNHlZjDt6tu1qgKn7AWsfO9s3ZsSjBwJg6VpjoE
 7EhIENrXJvDLe4e1PKWBhzcQUcfdCIziy2i7cmHS6UibkKblvLwHpHvFxqFiiVVxmFen
 Mxlw==
X-Gm-Message-State: AOAM532uAVvEtk1mT2T2wr1EzQrBvjW77ZXi132IVsRNvOO+/KFKymdE
 KO+apReV6Jcu57Xj557vII8QwYLD
X-Google-Smtp-Source: ABdhPJz9TB/B92TIGijeZiWnqNhSfC8vUlL2yQT+sGf4in6dUKXKaD82TsiT3cfMsu4AnIob8qdVBg==
X-Received: by 2002:a63:cb05:: with SMTP id p5mr26638286pgg.120.1594246914526; 
 Wed, 08 Jul 2020 15:21:54 -0700 (PDT)
Received: from octofox.cadence.com ([2601:641:400:e00:19b7:f650:7bbe:a7fb])
 by smtp.gmail.com with ESMTPSA id t73sm693517pfc.78.2020.07.08.15.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 15:21:53 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/21] softfloat: pass float_status pointer to pickNaN
Date: Wed,  8 Jul 2020 15:20:42 -0700
Message-Id: <20200708222101.24568-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200708222101.24568-1-jcmvbkbc@gmail.com>
References: <20200708222101.24568-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x52c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass float_status structure pointer to the pickNaN so that
machine-specific settings are available to NaN selection code.
Add use_first_nan property to float_status and use it in Xtensa-specific
pickNaN.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 fpu/softfloat-specialize.inc.c  | 30 ++++++++++++++++++++++++------
 fpu/softfloat.c                 |  2 +-
 include/fpu/softfloat-helpers.h |  5 +++++
 include/fpu/softfloat-types.h   |  1 +
 4 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/fpu/softfloat-specialize.inc.c b/fpu/softfloat-specialize.inc.c
index 9d919ee2d993..f519beca1b74 100644
--- a/fpu/softfloat-specialize.inc.c
+++ b/fpu/softfloat-specialize.inc.c
@@ -379,7 +379,7 @@ static float32 commonNaNToFloat32(commonNaNT a, float_status *status)
 *----------------------------------------------------------------------------*/
 
 static int pickNaN(FloatClass a_cls, FloatClass b_cls,
-                   bool aIsLargerSignificand)
+                   bool aIsLargerSignificand, float_status *status)
 {
 #if defined(TARGET_ARM) || defined(TARGET_MIPS) || defined(TARGET_HPPA)
     /* ARM mandated NaN propagation rules (see FPProcessNaNs()), take
@@ -412,7 +412,7 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     } else {
         return 1;
     }
-#elif defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
+#elif defined(TARGET_PPC) || defined(TARGET_M68K)
     /* PowerPC propagation rules:
      *  1. A if it sNaN or qNaN
      *  2. B if it sNaN or qNaN
@@ -437,6 +437,24 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     } else {
         return 1;
     }
+#elif defined(TARGET_XTENSA)
+    /*
+     * Xtensa has two NaN propagation modes.
+     * Which one is active is controlled by float_status::use_first_nan.
+     */
+    if (status->use_first_nan) {
+        if (is_nan(a_cls)) {
+            return 0;
+        } else {
+            return 1;
+        }
+    } else {
+        if (is_nan(b_cls)) {
+            return 1;
+        } else {
+            return 0;
+        }
+    }
 #else
     /* This implements x87 NaN propagation rules:
      * SNaN + QNaN => return the QNaN
@@ -624,7 +642,7 @@ static float32 propagateFloat32NaN(float32 a, float32 b, float_status *status)
         aIsLargerSignificand = (av < bv) ? 1 : 0;
     }
 
-    if (pickNaN(a_cls, b_cls, aIsLargerSignificand)) {
+    if (pickNaN(a_cls, b_cls, aIsLargerSignificand, status)) {
         if (is_snan(b_cls)) {
             return float32_silence_nan(b, status);
         }
@@ -762,7 +780,7 @@ static float64 propagateFloat64NaN(float64 a, float64 b, float_status *status)
         aIsLargerSignificand = (av < bv) ? 1 : 0;
     }
 
-    if (pickNaN(a_cls, b_cls, aIsLargerSignificand)) {
+    if (pickNaN(a_cls, b_cls, aIsLargerSignificand, status)) {
         if (is_snan(b_cls)) {
             return float64_silence_nan(b, status);
         }
@@ -926,7 +944,7 @@ floatx80 propagateFloatx80NaN(floatx80 a, floatx80 b, float_status *status)
         aIsLargerSignificand = (a.high < b.high) ? 1 : 0;
     }
 
-    if (pickNaN(a_cls, b_cls, aIsLargerSignificand)) {
+    if (pickNaN(a_cls, b_cls, aIsLargerSignificand, status)) {
         if (is_snan(b_cls)) {
             return floatx80_silence_nan(b, status);
         }
@@ -1074,7 +1092,7 @@ static float128 propagateFloat128NaN(float128 a, float128 b,
         aIsLargerSignificand = (a.high < b.high) ? 1 : 0;
     }
 
-    if (pickNaN(a_cls, b_cls, aIsLargerSignificand)) {
+    if (pickNaN(a_cls, b_cls, aIsLargerSignificand, status)) {
         if (is_snan(b_cls)) {
             return float128_silence_nan(b, status);
         }
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5e9746c2876f..a89056a1816e 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -881,7 +881,7 @@ static FloatParts pick_nan(FloatParts a, FloatParts b, float_status *s)
     } else {
         if (pickNaN(a.cls, b.cls,
                     a.frac > b.frac ||
-                    (a.frac == b.frac && a.sign < b.sign))) {
+                    (a.frac == b.frac && a.sign < b.sign), s)) {
             a = b;
         }
         if (is_snan(a.cls)) {
diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index e842f83a1285..2f0674fbddec 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -95,6 +95,11 @@ static inline void set_snan_bit_is_one(bool val, float_status *status)
     status->snan_bit_is_one = val;
 }
 
+static inline void set_use_first_nan(bool val, float_status *status)
+{
+    status->use_first_nan = val;
+}
+
 static inline void set_no_signaling_nans(bool val, float_status *status)
 {
     status->no_signaling_nans = val;
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index d6f167c1b0c4..c7ddcab8caee 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -171,6 +171,7 @@ typedef struct float_status {
      * softfloat-specialize.inc.c)
      */
     bool snan_bit_is_one;
+    bool use_first_nan;
     bool no_signaling_nans;
 } float_status;
 
-- 
2.20.1


