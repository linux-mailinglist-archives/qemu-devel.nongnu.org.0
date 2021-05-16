Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3BE381F02
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:08:54 +0200 (CEST)
Received: from localhost ([::1]:34174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGVp-000483-T8
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFzW-0007jA-Nq
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:30 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:43932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFz2-0007of-Ch
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:35:30 -0400
Received: by mail-qk1-x735.google.com with SMTP id a22so3278957qkl.10
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=higXGsISKjfG3yJhtMKpkIr13//TTmgs1GnUua1I9hQ=;
 b=he/Zlmrw7OWrgJ+2o97ljFy/BTPc7CDvFDDN97Ci3ceaXVxVaYIwCnKfEwsXQThBDN
 7haFuvRsBLmVld3qvjkUcW7MEAvcSjHo3u6zPeBGtiEDP+QVI9qhwttv3ZzfuriMkQzk
 Jyo2lCASoVMlv+mSWjJsIS0UCLdPqPOVzOvTd5RK5JDyAbY6TlQ3AvkPttm4YvSaorWv
 dVdjuzmPuPmVz1wJB6M6eVX3y1GjFXvGX0WzWNQ9iXftvKP5us2DywD3Bb+UJIOlFUN1
 bnlMZIjpC2N8buixtrYX8Zf4SU3CGp95ia9IAbigk+RWvF8YuLd6qPnAzVjVapoX9qGa
 o0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=higXGsISKjfG3yJhtMKpkIr13//TTmgs1GnUua1I9hQ=;
 b=IGZfGNYV6JjyQK/nIPpdyFfAXANuw99/Yb7LZdmmAXMie/vWVfLxCUERUVHVVpbNaw
 tf/kLnIu7kf/0UUQzzSgyKFcoFgNGHK7OM/un9X4XRawr0WbcAOEhWHAusG/VN3s+E9I
 vwGwobC9REuwyiK19AAd5SHJuYLPDA9Ah2Tazp9HDKINOs8yVS8lLkb7qX43nx1jJvRv
 k4RTzKGoVHl3Ly+FeQTAYDRFlbuCSm92DbNCyOPGIJlzkboSo6CWx2l0hKtEZX47M6wE
 TmjlRO3ANKNbb7/MZH/VQJeVjn/vCyLm+XTFHnFC0w7G7qEIugf2be7zENIule+fDaNe
 Kb1Q==
X-Gm-Message-State: AOAM533E8diEp3QaqksTQY4W1dn4/3ywZShT0k9fGwdiWQt1b5Vxj9Ht
 n/rBURhBc7+7T/tAT27uMu99U6jGTr8+1oU2FiE=
X-Google-Smtp-Source: ABdhPJyEno3HDtP1mWBLWkQVW4OercLbq+vcAcQVW2LkWEJJUXNjCuosOA5KEOSW9CD7IyOAv1vOcA==
X-Received: by 2002:a05:620a:945:: with SMTP id
 w5mr48465037qkw.68.1621168495979; 
 Sun, 16 May 2021 05:34:55 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/46] softfloat: Move return_nan to softfloat-parts.c.inc
Date: Sun, 16 May 2021 07:34:13 -0500
Message-Id: <20210516123431.718318-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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

At the same time, convert to pointers, rename to return_nan$N
and define a macro for return_nan using QEMU_GENERIC.

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 45 ++++++++++++++++++++++-----------------
 fpu/softfloat-parts.c.inc | 37 ++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 20 deletions(-)
 create mode 100644 fpu/softfloat-parts.c.inc

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 08fd812ea0..bdc3125e5c 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -709,6 +709,10 @@ static float128 float128_pack_raw(const FloatParts128 *p)
 #define parts_default_nan(P, S)    PARTS_GENERIC_64_128(default_nan, P)(P, S)
 #define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
 
+static void parts64_return_nan(FloatParts64 *a, float_status *s);
+static void parts128_return_nan(FloatParts128 *a, float_status *s);
+
+#define parts_return_nan(P, S)     PARTS_GENERIC_64_128(return_nan, P)(P, S)
 
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
@@ -915,22 +919,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
     return p;
 }
 
-static FloatParts64 return_nan(FloatParts64 a, float_status *s)
-{
-    g_assert(is_nan(a.cls));
-    if (is_snan(a.cls)) {
-        float_raise(float_flag_invalid, s);
-        if (!s->default_nan_mode) {
-            parts_silence_nan(&a, s);
-            return a;
-        }
-    } else if (!s->default_nan_mode) {
-        return a;
-    }
-    parts_default_nan(&a, s);
-    return a;
-}
-
 static FloatParts64 pick_nan(FloatParts64 a, FloatParts64 b, float_status *s)
 {
     if (is_snan(a.cls) || is_snan(b.cls)) {
@@ -992,6 +980,21 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
     return a;
 }
 
+#define partsN(NAME)   parts64_##NAME
+#define FloatPartsN    FloatParts64
+
+#include "softfloat-parts.c.inc"
+
+#undef  partsN
+#undef  FloatPartsN
+#define partsN(NAME)   parts128_##NAME
+#define FloatPartsN    FloatParts128
+
+#include "softfloat-parts.c.inc"
+
+#undef  partsN
+#undef  FloatPartsN
+
 /*
  * Pack/unpack routines with a specific FloatFmt.
  */
@@ -2066,7 +2069,7 @@ static FloatParts64 float_to_float(FloatParts64 a, const FloatFmt *dstf,
             break;
         }
     } else if (is_nan(a.cls)) {
-        return return_nan(a, s);
+        parts_return_nan(&a, s);
     }
     return a;
 }
@@ -2195,7 +2198,8 @@ static FloatParts64 round_to_int(FloatParts64 a, FloatRoundMode rmode,
     switch (a.cls) {
     case float_class_qnan:
     case float_class_snan:
-        return return_nan(a, s);
+        parts_return_nan(&a, s);
+        break;
 
     case float_class_zero:
     case float_class_inf:
@@ -3591,7 +3595,7 @@ FloatRelation bfloat16_compare_quiet(bfloat16 a, bfloat16 b, float_status *s)
 static FloatParts64 scalbn_decomposed(FloatParts64 a, int n, float_status *s)
 {
     if (unlikely(is_nan(a.cls))) {
-        return return_nan(a, s);
+        parts_return_nan(&a, s);
     }
     if (a.cls == float_class_normal) {
         /* The largest float type (even though not supported by FloatParts64)
@@ -3659,7 +3663,8 @@ static FloatParts64 sqrt_float(FloatParts64 a, float_status *s, const FloatFmt *
     int bit, last_bit;
 
     if (is_nan(a.cls)) {
-        return return_nan(a, s);
+        parts_return_nan(&a, s);
+        return a;
     }
     if (a.cls == float_class_zero) {
         return a;  /* sqrt(+-0) = +-0 */
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
new file mode 100644
index 0000000000..2a3075d6fe
--- /dev/null
+++ b/fpu/softfloat-parts.c.inc
@@ -0,0 +1,37 @@
+/*
+ * QEMU float support
+ *
+ * The code in this source file is derived from release 2a of the SoftFloat
+ * IEC/IEEE Floating-point Arithmetic Package. Those parts of the code (and
+ * some later contributions) are provided under that license, as detailed below.
+ * It has subsequently been modified by contributors to the QEMU Project,
+ * so some portions are provided under:
+ *  the SoftFloat-2a license
+ *  the BSD license
+ *  GPL-v2-or-later
+ *
+ * Any future contributions to this file after December 1st 2014 will be
+ * taken to be licensed under the Softfloat-2a license unless specifically
+ * indicated otherwise.
+ */
+
+static void partsN(return_nan)(FloatPartsN *a, float_status *s)
+{
+    switch (a->cls) {
+    case float_class_snan:
+        float_raise(float_flag_invalid, s);
+        if (s->default_nan_mode) {
+            parts_default_nan(a, s);
+        } else {
+            parts_silence_nan(a, s);
+        }
+        break;
+    case float_class_qnan:
+        if (s->default_nan_mode) {
+            parts_default_nan(a, s);
+        }
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
-- 
2.25.1


