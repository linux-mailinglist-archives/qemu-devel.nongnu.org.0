Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9639AD1C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 23:47:11 +0200 (CEST)
Received: from localhost ([::1]:38300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lovBG-0007wi-03
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 17:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5z-0002Ex-Gq
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:43 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lov5w-00014r-Km
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 17:41:43 -0400
Received: by mail-pl1-x630.google.com with SMTP id v12so3580090plo.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 14:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ppZ1jH79N3swPQMu5gvh4yX8BmZmZOhaiSlhleLfgRI=;
 b=WhqXS0Sn8Talgk2LHvsCcZ0eoJvIQSuH9KMIaqVPwzFt/CXUvmIBjNySjuzYC6Bogq
 mzuoosyX6GhaZa/e45hUP6GhjRRLYjmcE8kbu2kAtCeXxGasnunE/TZ8Gp6Nt5+x4nC6
 /l3hecSz/CUQD8uMg+fkWJLW4xmSS8zd+MsMHlwoirJrpwMv0aslwqRChbgxPYznGaB1
 8ZamjSTbe9x70w7cfCFtd4Pcu/DQDxbAiSEHLj1CS+9IVEsZLsRVL+Vy6CzdSomTAanR
 kQ6c40+jpsSRNhk9nqy4vbKOEqCZNqvNMe5n3pGq9t6fw7zocJ04O/1Uhmfn5Zq3Q7U7
 d+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppZ1jH79N3swPQMu5gvh4yX8BmZmZOhaiSlhleLfgRI=;
 b=nizagitmPVRCXExu8KaGeqKtRZ8/9n0dG3GEaEZYWBNlKOSP2atWM8SONpzxr2lCM0
 YuSEszSgsDJGw/ZnVKNI7iOSBc2EGeIPjV8Rf2YZSD54/wAz8Ahk+Cv89TzcbYjLWMnm
 H1SnBRGpKyuK9CHhbgO5BhzfYoMxIuoJtzR7K10GUAqzEtvk9PRr835kcAXJ/vwvzCD/
 NxznkEBzxX8TvkxAJEjh2i6cIzaa4Bjz6q4xN8EReBiO1B7dEv8kFGCTlT7oVvVpX39+
 Fot+OPdM6k9Npadlon8hKgDZHp5zPSJZtnbSwahw2+jzv5wkZBcz2y4yAsfekFG89b5L
 yl/w==
X-Gm-Message-State: AOAM530cBmigjxrTy0eoPpST40iLSmmrzlioUJU+C2PBnQUOWXLniEzB
 +K8JB6V9BRGCDT5tGH3g1cakRWgvshyj2g==
X-Google-Smtp-Source: ABdhPJwZa2oGLsIt0HYbKZNlbRPP5hcGj6plA0nu/zQhmMOoTPMHJZe1YVMtDjCAV1h2TPFWUSmKfg==
X-Received: by 2002:a17:902:cec3:b029:10d:22fa:183c with SMTP id
 d3-20020a170902cec3b029010d22fa183cmr1189303plg.53.1622756499291; 
 Thu, 03 Jun 2021 14:41:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id p65sm40115pfb.62.2021.06.03.14.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:41:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/29] softfloat: Reduce FloatFmt
Date: Thu,  3 Jun 2021 14:41:12 -0700
Message-Id: <20210603214131.629841-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603214131.629841-1-richard.henderson@linaro.org>
References: <20210603214131.629841-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Remove frac_lsb, frac_lsbm1, roundeven_mask.  Compute
these from round_mask in parts$N_uncanon_normal.

With floatx80, round_mask will not be tied to frac_shift.
Everything else is easily computable.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 29 ++++++++++++-----------------
 fpu/softfloat-parts.c.inc |  6 +++---
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ea7ee13201..741480c568 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -563,9 +563,7 @@ typedef struct {
  *   frac_size: the size of the fraction field
  *   frac_shift: shift to normalise the fraction with DECOMPOSED_BINARY_POINT
  * The following are computed based the size of fraction
- *   frac_lsb: least significant bit of fraction
- *   frac_lsbm1: the bit below the least significant bit (for rounding)
- *   round_mask/roundeven_mask: masks used for rounding
+ *   round_mask: bits below lsb which must be rounded
  * The following optional modifiers are available:
  *   arm_althp: handle ARM Alternative Half Precision
  */
@@ -575,24 +573,21 @@ typedef struct {
     int exp_max;
     int frac_size;
     int frac_shift;
-    uint64_t frac_lsb;
-    uint64_t frac_lsbm1;
-    uint64_t round_mask;
-    uint64_t roundeven_mask;
     bool arm_althp;
+    uint64_t round_mask;
 } FloatFmt;
 
 /* Expand fields based on the size of exponent and fraction */
-#define FLOAT_PARAMS(E, F)                                           \
-    .exp_size       = E,                                             \
-    .exp_bias       = ((1 << E) - 1) >> 1,                           \
-    .exp_max        = (1 << E) - 1,                                  \
-    .frac_size      = F,                                             \
-    .frac_shift     = (-F - 1) & 63,                                 \
-    .frac_lsb       = 1ull << ((-F - 1) & 63),                       \
-    .frac_lsbm1     = 1ull << ((-F - 2) & 63),                       \
-    .round_mask     = (1ull << ((-F - 1) & 63)) - 1,                 \
-    .roundeven_mask = (2ull << ((-F - 1) & 63)) - 1
+#define FLOAT_PARAMS_(E, F)                             \
+    .exp_size       = E,                                \
+    .exp_bias       = ((1 << E) - 1) >> 1,              \
+    .exp_max        = (1 << E) - 1,                     \
+    .frac_size      = F
+
+#define FLOAT_PARAMS(E, F)                              \
+    FLOAT_PARAMS_(E, F),                                \
+    .frac_shift     = (-F - 1) & 63,                    \
+    .round_mask     = (1ull << ((-F - 1) & 63)) - 1
 
 static const FloatFmt float16_params = {
     FLOAT_PARAMS(5, 10)
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index e05909db8c..a026581c33 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -145,10 +145,10 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
 {
     const int exp_max = fmt->exp_max;
     const int frac_shift = fmt->frac_shift;
-    const uint64_t frac_lsb = fmt->frac_lsb;
-    const uint64_t frac_lsbm1 = fmt->frac_lsbm1;
     const uint64_t round_mask = fmt->round_mask;
-    const uint64_t roundeven_mask = fmt->roundeven_mask;
+    const uint64_t frac_lsb = round_mask + 1;
+    const uint64_t frac_lsbm1 = round_mask ^ (round_mask >> 1);
+    const uint64_t roundeven_mask = round_mask | frac_lsb;
     uint64_t inc;
     bool overflow_norm = false;
     int exp, flags = 0;
-- 
2.25.1


