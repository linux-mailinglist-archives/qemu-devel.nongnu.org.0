Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD4376E40
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:53:54 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCAD-0004Wx-R5
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4l-0004A5-Ff
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:47063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4h-0003YO-Lw
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:15 -0400
Received: by mail-pf1-x42b.google.com with SMTP id q2so9076801pfh.13
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2jECUv0KB/VRaKbNWjXBjsVAbH6ZqCf4a3f43XZat8=;
 b=gshKE4ND++11vkoO3VO4AgFOqNGFofzNHQ+eBPT5aS0Tly5wzIwj/xtgl218eHWG3w
 iCPH2HlwiE6pf2TRAmxJEZB6V01CkGtcbHrbACRt3dAyLVDPYkkIrcomLox08xtvgKZ9
 UNJ8k97EzzGJvCpR2LEk2fK7QTix/PB/mWTXkrGwOG8FV4BPXSGKNwOuMrgJwqeucEO7
 C10n33fv6kdrkt6UsvedUXGv1iREIOL8EeVSBrjbpWFF0ivoXCvY2aZtqCqhaUbn4GTc
 Z4m5hz17LEmaGg5QDRBYQt6W4xPJV8C1/aix2PAOxV5UCOA3d8m4MJ0gP6u1ZerJ2sD7
 9TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2jECUv0KB/VRaKbNWjXBjsVAbH6ZqCf4a3f43XZat8=;
 b=pbu0/+miB81BzzOGdTEQmSBJCBDZTEoR5dHIxx3sW8Phcz2Zk7Hfki6FzuKQLBNlV3
 ipnn7TWqAx9eJIOXlUSYjkSz9aqK38CloXUuCBHYPdoSgEnnOWIvSmi8lycHQOg6Vp75
 yKynBjewhB3OlskHseoOIBC5rOW9mUnJLNVf2494AzocwGUl/B9baCr3bJ9KEaaL9Jab
 1UTdXRbccMsxgs9tRdBZ6/cnNjmCZiDBGy3qMY1uzjUUN4TiXZfwdy4OuH4uKp3FSNIN
 2W9CQdy/MkXK8tbDDnJ6S1wtf4SyqeLxjPXEerRLzSaxe1QK+jIi6UksDsnwI5Zo0hpz
 VDjQ==
X-Gm-Message-State: AOAM532Lm3Gi1qV+yFiWBedQ6Akm3ryZ9s8p33hxy/uvWM403fMvmSJ9
 5PWEG7T2QpOW+PNmxYxmufwVfN4L+tPioA==
X-Google-Smtp-Source: ABdhPJzrtcUcTeDdVU2ejVDXo1x4ElrLBXC0xPgwebmBJovskIlprBBOEzS0UALaJXYY8RbhamTYFg==
X-Received: by 2002:a63:4c26:: with SMTP id z38mr13542949pga.415.1620438490406; 
 Fri, 07 May 2021 18:48:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/72] softfloat: Add float_cmask and constants
Date: Fri,  7 May 2021 18:47:00 -0700
Message-Id: <20210508014802.892561-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Testing more than one class at a time is better done with masks.
This reduces the static branch count.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index ee4b5073b6..64edb23793 100644
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
@@ -1338,26 +1352,28 @@ bfloat16 QEMU_FLATTEN bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
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
 
     if (inf_zero) {
         float_raise(float_flag_invalid, s);
-        s->float_exception_flags |= float_flag_invalid;
         return parts_default_nan(s);
     }
 
@@ -1371,9 +1387,9 @@ static FloatParts muladd_floats(FloatParts a, FloatParts b, FloatParts c,
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


