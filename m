Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2690B381EEF
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:59:29 +0200 (CEST)
Received: from localhost ([::1]:60002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGMi-0000Om-2i
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzW-0007jn-T7
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:30 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz2-0007oo-D1
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:30 -0400
Received: by mail-qk1-x730.google.com with SMTP id i67so3308988qkc.4
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UDg46Ctpds96YRmJNkMfrK5vywLK/33iVAMWDMcAR0s=;
 b=MtubWubTjlAQyAz0c/2NzAhoy77OQ3DYduyIRgQcYU/G15IMtoFMOT31f6y7v3yY7n
 Ne7E6VhedNXejcUGD/6wUhca7VXMYoEAmlzsNidRn9Uq+mIatZAYCxwtSHxdgkkPY+sb
 h6QGc8jBew/xLMTvE3a1Y+tFACTTkyhKsiPZgRgP6uK1oTn1TCYy607O8NfbndKkmOW8
 VlsKDNULvfAzYyQLqG2WPG6N5Na96Wwhv6QGnAWruIlOXom1wUOItxAH+9iNQtMIEZf+
 EATtsPrKUWy/oLlZP5NH/v2NpmUgdwf3j+Re2GZlrkhx+3XGsY8DBkCIdnfdBgfbH5UB
 pw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UDg46Ctpds96YRmJNkMfrK5vywLK/33iVAMWDMcAR0s=;
 b=gepCGA5E/pzpU7I3T7+4l6N5+LLgH0xjJ4w5hehO3ji10lC1Tl3RQ4c+TaGv3DwseZ
 MtRPqMM6CozeASJIdl/WhNfnwQj9+0LM9mg8edz0qhU6CaDO9g7MnEtj+6qdeHtMkRSe
 60w2S9snVRRBNOL5EpUfynLoNdQItRNpflJpm/IwKd8CxSrcfvdYrOuNOHpOF0QMsPOD
 WDNNFYcJ0fxXaFg2DM+1Sy8I8Oso+X3GPIWx+OCL9pw9zxRnvwkQy/VCRYcuzmmi/zfg
 QkIh1l0Q0UmmASJbttR+7I9x2Xpnmq/i/HjORklT88O34A0kC5qDiRPfI7fqbvw2bCtS
 UUIQ==
X-Gm-Message-State: AOAM531lZzxES2N+u001cQCBG0svDVu8pNmreJRu1OE6J4fAPRKD/ajW
 qV8gIqKEZdZqL62APXcdFdap7qza0LVHWTs/8sc=
X-Google-Smtp-Source: ABdhPJw2PeSidB0ZNkn9qi14x34AlELK1dF74z7JsYnmvyKIw/iolhY+dRtBi+kKI/kRGXi04C+TyA==
X-Received: by 2002:a37:9ac1:: with SMTP id
 c184mr52847629qke.201.1621168497491; 
 Sun, 16 May 2021 05:34:57 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/46] softfloat: Move pick_nan_muladd to softfloat-parts.c.inc
Date: Sun, 16 May 2021 07:34:15 -0500
Message-Id: <20210516123431.718318-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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
Cc: peter.maydell@linaro.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the same time, convert to pointers, rename to pick_nan_muladd$N
and define a macro for pick_nan_muladd using QEMU_GENERIC.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 53 ++++++++++-----------------------------
 fpu/softfloat-parts.c.inc | 40 +++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 019b34d378..df004dbe2f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -721,6 +721,18 @@ static FloatParts128 *parts128_pick_nan(FloatParts128 *a, FloatParts128 *b,
 
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
@@ -948,45 +960,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
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
@@ -1497,7 +1470,7 @@ static FloatParts64 muladd_floats(FloatParts64 a, FloatParts64 b, FloatParts64 c
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


