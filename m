Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCF2294799
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 06:56:46 +0200 (CEST)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kV6B3-0005Yz-PS
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 00:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kV66Z-0000dj-4v
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 00:52:07 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:40874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kV66X-0005jX-5J
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 00:52:06 -0400
Received: by mail-pj1-x1043.google.com with SMTP id l2so499209pjt.5
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 21:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rP/Ck9XlqBeLFMh5U31GkmO/lp+0+vlL//subLjhvvI=;
 b=t7YtLAHiDU5HiHmbepp4UnO7hvx0qwzDTsq3sEn2Fzvqtvu+hFShib9Af1FNTp2opo
 LiMgLsuyWpmJCAD0zVTuUDHXxkJHKMnB5KFx2VFE45a1M5hVuyGjFtMvodHlzKcHlfip
 NWSGYk0yfHo/eaupPhEp6wPLTWtPn0x8GQyes3VXMFGPdNYhwdlfyYUWh9Grgedh8ide
 yiVrVMDV2aaZQcUJWz+8d9JiWSEbYQI30hdF4R/gg2L59fGKYVeKwQCKmKuqvqN8YwDv
 jsmOmeTizBZsG6t2OeKGA6ruhw0h8VSgsD51CVe2wPCtfjvkhv/REcz0yxSF9wdcrqb/
 QFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rP/Ck9XlqBeLFMh5U31GkmO/lp+0+vlL//subLjhvvI=;
 b=PIef2cX3F6K9oKJYqiljM2vl7LnqXIC81Kzg7qG6X94Ih1/Y4DCxVCfzdZfnY9dIdM
 HkZu5Z3Im1oMLUiYuE98H9OaCqWDWC6/KSQOaN5s7OgNnO7jfi+9v14J7LurRcbQ+yuS
 AAgfoFyMoR+PWlzXZHSw0zmPh6MvGojxcXmKeDjiW/+5p7KaxjkZ/TZa3+LiPhOA2tjH
 c1ioC0ZDdeNv+wd0nk6pNaEGH5byLQGvw0oM3SuG9asOEOfvRgNtJL7jGVboufTcU7NX
 j97w1FDNWgTJqKlXuOp1wMuVh1waH97o6luenZX7yN1UFq6obxgiUNY5A7Gnoa+/dYwj
 JUsw==
X-Gm-Message-State: AOAM533ICKq95KyFP4E2QFsrs6gl2uUWXITZOWFROOVCalVGiXPsFXCX
 r+RdRGU0QFV31lnrc9tYUtXZ4/yh1JwN7g==
X-Google-Smtp-Source: ABdhPJw73kUhtXqM5rGtRKpgC05bD8aqVXC7uGyo61SmU7a7MeEzyiNzbdHQtYJjvkdMzJYMWKscnw==
X-Received: by 2002:a17:90a:f617:: with SMTP id
 bw23mr1413214pjb.95.1603255923354; 
 Tue, 20 Oct 2020 21:52:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id j11sm620070pfh.143.2020.10.20.21.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 21:52:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/15] softfloat: Add float_cmask and constants
Date: Tue, 20 Oct 2020 21:51:43 -0700
Message-Id: <20201021045149.1582203-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201021045149.1582203-1-richard.henderson@linaro.org>
References: <20201021045149.1582203-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: alex.bennee@linaro.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Testing more than one class at a time is better done with masks.
This reduces the static branch count.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 9db55d2b11..3e625c47cd 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -469,6 +469,20 @@ typedef enum __attribute__ ((__packed__)) {
     float_class_snan,
 } FloatClass;
 
+#define float_cmask(bit)  (1u << (bit))
+
+enum {
+    float_cmask_zero    = float_cmask(float_class_zero),
+    float_cmask_normal  = float_cmask(float_class_normal),
+    float_cmask_inf     = float_cmask(float_class_inf),
+    float_cmask_qnan    = float_cmask(float_class_qnan),
+    float_cmask_snan    = float_cmask(float_class_snan),
+
+    float_cmask_infzero = float_cmask_zero | float_cmask_inf,
+    float_cmask_anynan  = float_cmask_qnan | float_cmask_snan,
+};
+
+
 /* Simple helpers for checking if, or what kind of, NaN we have */
 static inline __attribute__((unused)) bool is_nan(FloatClass c)
 {
@@ -1335,24 +1349,27 @@ bfloat16 QEMU_FLATTEN bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
 static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
                                 int flags, float_status *s)
 {
-    bool inf_zero = ((1 << a.cls) | (1 << b.cls)) ==
-                    ((1 << float_class_inf) | (1 << float_class_zero));
-    bool p_sign;
+    bool inf_zero, p_sign;
     bool sign_flip = flags & float_muladd_negate_result;
     FloatClass p_class;
     uint64_t hi, lo;
     int p_exp;
+    int ab_mask, abc_mask;
+
+    ab_mask = float_cmask(a.cls) | float_cmask(b.cls);
+    abc_mask = float_cmask(c.cls) | ab_mask;
+    inf_zero = ab_mask == float_cmask_infzero;
 
     /* It is implementation-defined whether the cases of (0,inf,qnan)
      * and (inf,0,qnan) raise InvalidOperation or not (and what QNaN
      * they return if they do), so we have to hand this information
      * off to the target-specific pick-a-NaN routine.
      */
-    if (is_nan(a.cls) || is_nan(b.cls) || is_nan(c.cls)) {
+    if (unlikely(abc_mask & float_cmask_anynan)) {
         return pick_nan_muladd(a, b, c, inf_zero, s);
     }
 
-    if (inf_zero) {
+    if (unlikely(inf_zero)) {
         s->float_exception_flags |= float_flag_invalid;
         return parts_default_nan(s);
     }
@@ -1367,9 +1384,9 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
         p_sign ^= 1;
     }
 
-    if (a.cls == float_class_inf || b.cls == float_class_inf) {
+    if (ab_mask & float_cmask_inf) {
         p_class = float_class_inf;
-    } else if (a.cls == float_class_zero || b.cls == float_class_zero) {
+    } else if (ab_mask & float_cmask_zero) {
         p_class = float_class_zero;
     } else {
         p_class = float_class_normal;
-- 
2.25.1


