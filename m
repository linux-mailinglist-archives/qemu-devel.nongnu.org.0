Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C983B457294
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:15:02 +0100 (CET)
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6XV-0004Ig-SQ
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:15:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OL-0005CR-HS
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:33 -0500
Received: from [2a00:1450:4864:20::431] (port=37440
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6OH-0004B5-6N
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:33 -0500
Received: by mail-wr1-x431.google.com with SMTP id b12so18962095wrh.4
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4BlPSapSoRLhPtz3EiNir8BjapFixp+XfQGhc9HNiJA=;
 b=VPEMeoG1OHFO7Wem0r1ZtnlAs5nrOm748Ys9G7pfUpxTZtJULRXgVCkB67pFUe1MnS
 gIC+UhrlcSbzWuT0ntV0tp/sk5q/GtAcJgIFPt1pajOriQkMUXy3F00DkcDyV+SGB0FY
 ysHK4T0093uCQJKfZZIeIc1gNWyIs5g0OQiIDAyXivIx6hbiyZbM+s600M90lTZsYnR8
 7fdcaSoTyFHQfCaLOM6J017ykwl6OSH3SqiAV+2hVZjQGBjVRP+ZRs3Ge6QyDENnqqVx
 2UDW0M+3ueMjxgLap0QXDkUDDKsWBCCKFkRqyt8nT6C1YmcebSK/j5snOWrEZbiIA5Ml
 xqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4BlPSapSoRLhPtz3EiNir8BjapFixp+XfQGhc9HNiJA=;
 b=HyfGQjN7q6WbYh0CEf/5kQCiUAaWY5NdiHt+qFhrVyg8TsKCnrYZD5Asu2mt6DSVG3
 PgVJufaAS8BuSNL8C+FQDzvCtXs11H7iv2/xu21dKNl3MG+H/6Yh8roNvg7Memu0JjSe
 pgt3WO56Pu15JKfWKq3Sk6HDCGZzqUYSVhFtLPYdjXqPktQdt9p1ixsBVpqkFUWMz98W
 tCU1vFY0ZiKAtWkBnK5xWmtPKld2kX3UqsaRhkFrzZEZQB6F4xZqD9XDB/Do2JWe0fUI
 yS06zqYE8bs/JF56py2VFjceQl2nJTcS0dv/MNqNVzlMuqFMF/6E07fFsWybTdnXtSpg
 BC5Q==
X-Gm-Message-State: AOAM533uxlfUYKarHhA5jPdiC6huY0fyRPBiZ6/iQPF93UC2EZTgJN1p
 Vq8uCAfidI+cFPQCs3fb0C8Uo0EhyTHBnJQ6N+c=
X-Google-Smtp-Source: ABdhPJyAEZqawr91TQe8Ui9YxmUwfZrBqMrNMJjdtbP73xRgix8m2Eo7Pq26oCoMwyl6Pv+3cI5Deg==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr8995571wru.380.1637337924336; 
 Fri, 19 Nov 2021 08:05:24 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/35] softfloat: Add flag specific to signaling nans
Date: Fri, 19 Nov 2021 17:04:34 +0100
Message-Id: <20211119160502.17432-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119160502.17432-1-richard.henderson@linaro.org>
References: <20211119160502.17432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PowerPC has this flag, and it's easier to compute it here
than after the fact.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-types.h |  1 +
 fpu/softfloat.c               |  4 +++-
 fpu/softfloat-parts.c.inc     | 18 ++++++++++++------
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 9ca50e930b..8abd9ab4ec 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -158,6 +158,7 @@ enum {
     float_flag_invalid_zdz     = 0x0400,  /* 0 / 0 */
     float_flag_invalid_sqrt    = 0x0800,  /* sqrt(-x) */
     float_flag_invalid_cvti    = 0x1000,  /* non-nan to integer */
+    float_flag_invalid_snan    = 0x2000,  /* any operand was snan */
 };
 
 /*
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 9a28720d82..834ed3a054 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2543,8 +2543,10 @@ floatx80 floatx80_mod(floatx80 a, floatx80 b, float_status *status)
 static void parts_float_to_ahp(FloatParts64 *a, float_status *s)
 {
     switch (a->cls) {
-    case float_class_qnan:
     case float_class_snan:
+        float_raise(float_flag_invalid_snan, s);
+        /* fall through */
+    case float_class_qnan:
         /*
          * There is no NaN in the destination format.  Raise Invalid
          * and return a zero with the sign of the input NaN.
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index ce580347dd..db3e1f393d 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -19,7 +19,7 @@ static void partsN(return_nan)(FloatPartsN *a, float_status *s)
 {
     switch (a->cls) {
     case float_class_snan:
-        float_raise(float_flag_invalid, s);
+        float_raise(float_flag_invalid | float_flag_invalid_snan, s);
         if (s->default_nan_mode) {
             parts_default_nan(a, s);
         } else {
@@ -40,7 +40,7 @@ static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, FloatPartsN *b,
                                      float_status *s)
 {
     if (is_snan(a->cls) || is_snan(b->cls)) {
-        float_raise(float_flag_invalid, s);
+        float_raise(float_flag_invalid | float_flag_invalid_snan, s);
     }
 
     if (s->default_nan_mode) {
@@ -68,7 +68,7 @@ static FloatPartsN *partsN(pick_nan_muladd)(FloatPartsN *a, FloatPartsN *b,
     int which;
 
     if (unlikely(abc_mask & float_cmask_snan)) {
-        float_raise(float_flag_invalid, s);
+        float_raise(float_flag_invalid | float_flag_invalid_snan, s);
     }
 
     which = pickNaNMulAdd(a->cls, b->cls, c->cls,
@@ -1049,8 +1049,10 @@ static int64_t partsN(float_to_sint)(FloatPartsN *p, FloatRoundMode rmode,
 
     switch (p->cls) {
     case float_class_snan:
+        flags |= float_flag_invalid_snan;
+        /* fall through */
     case float_class_qnan:
-        flags = float_flag_invalid;
+        flags |= float_flag_invalid;
         r = max;
         break;
 
@@ -1114,8 +1116,10 @@ static uint64_t partsN(float_to_uint)(FloatPartsN *p, FloatRoundMode rmode,
 
     switch (p->cls) {
     case float_class_snan:
+        flags |= float_flag_invalid_snan;
+        /* fall through */
     case float_class_qnan:
-        flags = float_flag_invalid;
+        flags |= float_flag_invalid;
         r = max;
         break;
 
@@ -1341,7 +1345,9 @@ static FloatRelation partsN(compare)(FloatPartsN *a, FloatPartsN *b,
     }
 
     if (unlikely(ab_mask & float_cmask_anynan)) {
-        if (!is_quiet || (ab_mask & float_cmask_snan)) {
+        if (ab_mask & float_cmask_snan) {
+            float_raise(float_flag_invalid | float_flag_invalid_snan, s);
+        } else if (!is_quiet) {
             float_raise(float_flag_invalid, s);
         }
         return float_relation_unordered;
-- 
2.25.1


