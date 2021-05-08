Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6349E376E73
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:16:24 +0200 (CEST)
Received: from localhost ([::1]:59762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCVz-0002qc-D3
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC59-0004Wh-D0
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:39 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4u-0003eF-OP
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:39 -0400
Received: by mail-pf1-x42d.google.com with SMTP id c17so9137550pfn.6
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gajbVTC/w/ZxYm9yG0LEQm64t4i0pLPCyc/kXjmw2Fo=;
 b=rN6OohNKRX89WzvH5Xl4isUTNIxNQOXI3rrki+GhMOWVqb+51SMd9CJzW0FSZxFh/Y
 IlJALOuzrNKYJhuPJ0z5rAPtEXYvNBqDzlerZWn+nbpNmoVFrfgaqTozyLhydh0Vq5fz
 FucrUTs9pjb9DD87pm21Mh9NS+kYBazbo6p7EgAJBGz4LDogHqefT9kavPyGL9SOIRKm
 qgNPGsR4Wys9FbYxRlxHU2Imn9msMr2QHhe7/T5t8MvR7/F0UgnMROEIb4WsDsTrMoqj
 l4mfxnhmLe7+zSAEEOejM7byk2AthM9Ty253SmN6gpAVVedWP7Ja4XztTINbseA37BEv
 fjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gajbVTC/w/ZxYm9yG0LEQm64t4i0pLPCyc/kXjmw2Fo=;
 b=hyRLpPKJAsqi//cRECxbacwGKA+QCYhGMvbUXVDvzdtoORovbHB1eflzlTav8cyQgL
 GBNOcDTrBYJNmhkbEaFfjbQirpsUzvPbENK4EVIS1207azuIAbb/D7AgM1ium9uEDw+9
 M+qrRPM6eBzsYoMrF5mlqclFdftuge45rR2U//D5Gsk73eJGtmk8ybB05N374R9n9F05
 3IQUqsOKvsxHHkJ9tEzPf9q4HhvOX+ydoPHlqcd6/rXHApr5tID0/nptqZmvs50i8k2r
 lRs+BE69SXxYY3SHXkIBSHpLIgYHmzftaplCQ6FPuiZamTP/qP7y3GEGaaSjfEi83u3X
 uvKg==
X-Gm-Message-State: AOAM533Z97lN81ZWF6g/lCese/iuFIG+P2zVwgMxW/m/JGkOeYVynxBL
 E7hQnmuX4dn67tR4xIu+kYaJtpAdIPsbFg==
X-Google-Smtp-Source: ABdhPJxsa+1cr2T/iprH8msYvPx2oSV90PgrWH2iOz5DPk3Sdx/BqrHYKhUV7owj+/g4bRcPbaC5mQ==
X-Received: by 2002:a62:d108:0:b029:25d:497e:2dfd with SMTP id
 z8-20020a62d1080000b029025d497e2dfdmr13570459pfg.29.1620438502595; 
 Fri, 07 May 2021 18:48:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/72] softfloat: Move pick_nan to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:19 -0700
Message-Id: <20210508014802.892561-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

At the same time, convert to pointers, rename to parts$N_pick_nan
and define a macro for parts_pick_nan using QEMU_GENERIC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 62 ++++++++++++++++++++++-----------------
 fpu/softfloat-parts.c.inc | 25 ++++++++++++++++
 2 files changed, 60 insertions(+), 27 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5b26696078..77efaedeaa 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -713,10 +713,39 @@ static void parts128_return_nan(FloatParts128 *a, float_status *s);
 
 #define parts_return_nan(P, S)     PARTS_GENERIC_64_128(return_nan, P)(P, S)
 
+static FloatParts64 *parts64_pick_nan(FloatParts64 *a, FloatParts64 *b,
+                                      float_status *s);
+static FloatParts128 *parts128_pick_nan(FloatParts128 *a, FloatParts128 *b,
+                                        float_status *s);
+
+#define parts_pick_nan(A, B, S)    PARTS_GENERIC_64_128(pick_nan, A)(A, B, S)
+
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
  */
 
+#define FRAC_GENERIC_64_128(NAME, P) \
+    QEMU_GENERIC(P, (FloatParts128 *, frac128_##NAME), frac64_##NAME)
+
+static int frac64_cmp(FloatParts64 *a, FloatParts64 *b)
+{
+    return a->frac == b->frac ? 0 : a->frac < b->frac ? -1 : 1;
+}
+
+static int frac128_cmp(FloatParts128 *a, FloatParts128 *b)
+{
+    uint64_t ta = a->frac_hi, tb = b->frac_hi;
+    if (ta == tb) {
+        ta = a->frac_lo, tb = b->frac_lo;
+        if (ta == tb) {
+            return 0;
+        }
+    }
+    return ta < tb ? -1 : 1;
+}
+
+#define frac_cmp(A, B)  FRAC_GENERIC_64_128(cmp, A)(A, B)
+
 static void frac128_shl(FloatParts128 *a, int c)
 {
     shift128Left(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
@@ -918,27 +947,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
     return p;
 }
 
-static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
-{
-    if (is_snan(a.cls) || is_snan(b.cls)) {
-        float_raise(float_flag_invalid, s);
-    }
-
-    if (s->default_nan_mode) {
-        parts_default_nan(&a, s);
-    } else {
-        if (pickNaN(a.cls, b.cls,
-                    a.frac > b.frac ||
-                    (a.frac == b.frac && a.sign < b.sign), s)) {
-            a = b;
-        }
-        if (is_snan(a.cls)) {
-            parts_silence_nan(&a, s);
-        }
-    }
-    return a;
-}
-
 static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64 c,
                                   bool inf_zero, float_status *s)
 {
@@ -1106,7 +1114,7 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
             return a;
         }
         if (is_nan(a.cls) || is_nan(b.cls)) {
-            return pick_nan(a, b, s);
+            return *parts_pick_nan(&a, &b, s);
         }
         if (a.cls == float_class_inf) {
             if (b.cls == float_class_inf) {
@@ -1144,7 +1152,7 @@ static FloatParts64 addsub_floats(FloatParts64 a, FloatParts64 b, bool subtract,
             return a;
         }
         if (is_nan(a.cls) || is_nan(b.cls)) {
-            return pick_nan(a, b, s);
+            return *parts_pick_nan(&a, &b, s);
         }
         if (a.cls == float_class_inf || b.cls == float_class_zero) {
             return a;
@@ -1360,7 +1368,7 @@ static FloatParts64 mul_floats(FloatParts64 a, FloatParts64 b, float_status *s)
     }
     /* handle all the NaN cases */
     if (is_nan(a.cls) || is_nan(b.cls)) {
-        return pick_nan(a, b, s);
+        return *parts_pick_nan(&a, &b, s);
     }
     /* Inf * Zero == NaN */
     if ((a.cls == float_class_inf && b.cls == float_class_zero) ||
@@ -1887,7 +1895,7 @@ static FloatParts64 div_floats(FloatParts64 a, FloatParts64 b, float_status *s)
     }
     /* handle all the NaN cases */
     if (is_nan(a.cls) || is_nan(b.cls)) {
-        return pick_nan(a, b, s);
+        return *parts_pick_nan(&a, &b, s);
     }
     /* 0/0 or Inf/Inf */
     if (a.cls == b.cls
@@ -3295,14 +3303,14 @@ static FloatParts64 minmax_floats(FloatParts64 a, FloatParts64 b, bool ismin,
              * the invalid exception is raised.
              */
             if (is_snan(a.cls) || is_snan(b.cls)) {
-                return pick_nan(a, b, s);
+                return *parts_pick_nan(&a, &b, s);
             } else if (is_nan(a.cls) && !is_nan(b.cls)) {
                 return b;
             } else if (is_nan(b.cls) && !is_nan(a.cls)) {
                 return a;
             }
         }
-        return pick_nan(a, b, s);
+        return *parts_pick_nan(&a, &b, s);
     } else {
         int a_exp, b_exp;
 
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 2a3075d6fe..11a71650f7 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -35,3 +35,28 @@ static void partsN(return_nan)(FloatPartsN *a, float_status *s)
         g_assert_not_reached();
     }
 }
+
+static FloatPartsN *partsN(pick_nan)(FloatPartsN *a, FloatPartsN *b,
+                                     float_status *s)
+{
+    if (is_snan(a->cls) || is_snan(b->cls)) {
+        float_raise(float_flag_invalid, s);
+    }
+
+    if (s->default_nan_mode) {
+        parts_default_nan(a, s);
+    } else {
+        int cmp = frac_cmp(a, b);
+        if (cmp == 0) {
+            cmp = a->sign < b->sign;
+        }
+
+        if (pickNaN(a->cls, b->cls, cmp > 0, s)) {
+            a = b;
+        }
+        if (is_snan(a->cls)) {
+            parts_silence_nan(a, s);
+        }
+    }
+    return a;
+}
-- 
2.25.1


