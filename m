Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A0A376EE3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:39:23 +0200 (CEST)
Received: from localhost ([::1]:43534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCsE-0006al-VU
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC86-00039V-70
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:42 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC84-0005VH-D5
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:41 -0400
Received: by mail-pg1-x535.google.com with SMTP id y32so8617369pga.11
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zL439EHx3BPOhexd35s+Xkdi6C28utf2wKmRbPR2CBI=;
 b=Xey1+YXBlzvQ+XRKDOTSi4J19G9eWajaJyQTd4PukhpSnIX9gaxXRNme2bKqp7za1o
 CAEcAZ5ihkqzT/CwcSjMNGMM2STzyNwO2cuUsrk3ln+peKvBum3Mx7xt0yNEC2uIgRYw
 49cptIz+sBVEcVj5nGjTV4+4EItUWu5qhRmVCxPAJDd931TmowV5OA8CYEcD90vjbAGZ
 pdWu+56H44gIspc0AMnkkc9HC2NEFB+Fabv/wloG42kDTJh/u4f2gy04q2M0mgdEqurU
 Sla3L64Boa/gdK9YgNpwo1yNjYVpe6G11ge20RA42/EG/x3iork8waEeNDqah3O9lINq
 B+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zL439EHx3BPOhexd35s+Xkdi6C28utf2wKmRbPR2CBI=;
 b=qOVgiHUfxbNQabcHBxFG5JEZlkGtQ017CmfM/3rNYMk5pc14U/gCa23ZKw2F61jF0n
 qYIQRwKPJalxyIiAXW2rgQ/TnGrm6CkRoc3BzSyl6T0/U9Mo27QPnVeKbm1Y+HyadG4H
 6pGV5mg9dpNrIfC44AxXdl/gnVDISVzRQHrHytSxMKWlil8dHaQuWS1p5rRn+doKrMJq
 tDMHGv7z822y2zOPURhM9lbKdW+cPlp4Af15JaAEpysv3kru8OSdvUNBiUvB7N6yFzbX
 5R77UutSViOOZ60dNhLqEStLjMoNIFp9rOdolUMbfqUCo34P3yGHWY6HLmwjDR//vsXJ
 ylhw==
X-Gm-Message-State: AOAM533SWh6a6iL2/xYG/j7o3Hko+EUdy7j+t54mGaelGtSW0vrN5lx8
 Ho0ZhDlR1uWdyasMWK3zrbTa49oXle37EQ==
X-Google-Smtp-Source: ABdhPJy6eFTQk6dZCxYbHk+K9MFVStlFjNbfvpm8xKXyA3T3i4stSovRrSpCxvq3fLKCyC7vEFGK6Q==
X-Received: by 2002:aa7:9104:0:b029:279:e897:2825 with SMTP id
 4-20020aa791040000b0290279e8972825mr13447797pfh.51.1620438699041; 
 Fri, 07 May 2021 18:51:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 54/72] softfloat: Split out parts_uncanon_normal
Date: Fri,  7 May 2021 18:47:44 -0700
Message-Id: <20210508014802.892561-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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

We will need to treat the non-normal cases of floatx80 specially,
so split out the normal case that we can reuse.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           |  8 ++++++
 fpu/softfloat-parts.c.inc | 56 ++++++++++++++++++++++-----------------
 2 files changed, 39 insertions(+), 25 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 75a3bb881d..4df69029ec 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -763,6 +763,14 @@ static void parts128_canonicalize(FloatParts128 *p, float_status *status,
 #define parts_canonicalize(A, S, F) \
     PARTS_GENERIC_64_128(canonicalize, A)(A, S, F)
 
+static void parts64_uncanon_normal(FloatParts64 *p, float_status *status,
+                                   const FloatFmt *fmt);
+static void parts128_uncanon_normal(FloatParts128 *p, float_status *status,
+                                    const FloatFmt *fmt);
+
+#define parts_uncanon_normal(A, S, F) \
+    PARTS_GENERIC_64_128(uncanon_normal, A)(A, S, F)
+
 static void parts64_uncanon(FloatParts64 *p, float_status *status,
                             const FloatFmt *fmt);
 static void parts128_uncanon(FloatParts128 *p, float_status *status,
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 293029711c..65462bf6cb 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -140,8 +140,8 @@ static void partsN(canonicalize)(FloatPartsN *p, float_status *status,
  * fraction; these bits will be removed. The exponent will be biased
  * by EXP_BIAS and must be bounded by [EXP_MAX-1, 0].
  */
-static void partsN(uncanon)(FloatPartsN *p, float_status *s,
-                            const FloatFmt *fmt)
+static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
+                                   const FloatFmt *fmt)
 {
     const int exp_max = fmt->exp_max;
     const int frac_shift = fmt->frac_shift;
@@ -153,29 +153,6 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
     bool overflow_norm;
     int exp, flags = 0;
 
-    if (unlikely(p->cls != float_class_normal)) {
-        switch (p->cls) {
-        case float_class_zero:
-            p->exp = 0;
-            frac_clear(p);
-            return;
-        case float_class_inf:
-            g_assert(!fmt->arm_althp);
-            p->exp = fmt->exp_max;
-            frac_clear(p);
-            return;
-        case float_class_qnan:
-        case float_class_snan:
-            g_assert(!fmt->arm_althp);
-            p->exp = fmt->exp_max;
-            frac_shr(p, fmt->frac_shift);
-            return;
-        default:
-            break;
-        }
-        g_assert_not_reached();
-    }
-
     switch (s->float_rounding_mode) {
     case float_round_nearest_even:
         overflow_norm = false;
@@ -282,6 +259,35 @@ static void partsN(uncanon)(FloatPartsN *p, float_status *s,
     float_raise(flags, s);
 }
 
+static void partsN(uncanon)(FloatPartsN *p, float_status *s,
+                            const FloatFmt *fmt)
+{
+    if (likely(p->cls == float_class_normal)) {
+        parts_uncanon_normal(p, s, fmt);
+    } else {
+        switch (p->cls) {
+        case float_class_zero:
+            p->exp = 0;
+            frac_clear(p);
+            return;
+        case float_class_inf:
+            g_assert(!fmt->arm_althp);
+            p->exp = fmt->exp_max;
+            frac_clear(p);
+            return;
+        case float_class_qnan:
+        case float_class_snan:
+            g_assert(!fmt->arm_althp);
+            p->exp = fmt->exp_max;
+            frac_shr(p, fmt->frac_shift);
+            return;
+        default:
+            break;
+        }
+        g_assert_not_reached();
+    }
+}
+
 /*
  * Returns the result of adding or subtracting the values of the
  * floating-point values `a' and `b'. The operation is performed
-- 
2.25.1


