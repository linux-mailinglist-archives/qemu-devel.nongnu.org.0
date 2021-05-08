Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33186376E72
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:16:18 +0200 (CEST)
Received: from localhost ([::1]:59206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCVt-0002Rm-89
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC58-0004Tv-Nj
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:38 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4t-0003e8-EE
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:38 -0400
Received: by mail-pl1-x634.google.com with SMTP id n16so6142830plf.7
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wdvnl/BT8EpxSM2u6kGkXFgWaAcTOrO0eZtHA1yV7g8=;
 b=b+2D+jy47RtHzEaXEdKXxMlpv4MRONgMNHezoqY4AQqlpdHZ5NkJQqbpksVk2+S6e2
 hIQaBQP7qqf9Dsz/akYSa9A++AJCie471KE8pFZjGNJ8pvM0MRvHasgZRjjintPWCGKl
 oa0hsz5QRudTmR3+Xcd1y5hw8ybHjjllGFwv8bZeVbLO3Apr8yej0UpvAbYtJJcapysT
 o6XwM5gtpCt64m1jxCsW+prlM1Eif2RqyQX7HXVorU1lLVKAb7GEC9AmFqAQbsZ+zTuh
 gJ0N0jzakBTKXX57gdFC+rcE+bG1fehX4BwQHJrboLrxMAtARkpIKjy44l7riC3X8i+n
 cmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wdvnl/BT8EpxSM2u6kGkXFgWaAcTOrO0eZtHA1yV7g8=;
 b=fRN/jfiSUW7ARG7agnJrBClyLrALEz1i2b5FgAENF//0DGsCz1oD9Rsu4MFa1rbskI
 cWHzyltYGVkBaJLSEz+GgMiKjGdfgPsZCMRXkZOLxkjFJYmHdc2HBOK8AcPYkL+HFl1w
 EpCqPf1mq4R+L7kZaGtoShrtygZebWvl6/nqYAKwX39FpyKak0vOG/pSYa04sd6n8zHz
 dwxTgiRqfT+XdGIvOt4Z+/IpEjgWURwswb/zgPwuxtaFuRQmlcZXqmQ6u2XgaGbTTUDh
 d51RS/2iwwtgtvyNaTv7lK5cwl0irT8Rc08JL0iQXaeW6/bfF/hGAmuFZYJO9V+2Exj5
 VyQg==
X-Gm-Message-State: AOAM531k390MdhUizjnd0RGXPFaz2A6k8SGTcydioSTJVJEY7HFFwRMu
 TPtpn/GDJUsK8j/Gd79bQOTf25XA7p5JBQ==
X-Google-Smtp-Source: ABdhPJziAuEvGXdVRHgUbu6FA9zMlTIAxutUe436CB/ZaeMCgpxTGhGQl8v7cyNav3/RTtmHRIEbng==
X-Received: by 2002:a17:90a:73c4:: with SMTP id
 n4mr25581579pjk.201.1620438501965; 
 Fri, 07 May 2021 18:48:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/72] softfloat: Move return_nan to softfloat-parts.c.inc
Date: Fri,  7 May 2021 18:47:18 -0700
Message-Id: <20210508014802.892561-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

At the same time, convert to pointers, rename to return_nan$N
and define a macro for return_nan using QEMU_GENERIC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 45 ++++++++++++++++++++++-----------------
 fpu/softfloat-parts.c.inc | 37 ++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 20 deletions(-)
 create mode 100644 fpu/softfloat-parts.c.inc

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6d5392aeab..5b26696078 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -708,6 +708,10 @@ static float128 float128_pack_raw(const FloatParts128 *p)
 #define parts_default_nan(P, S)    PARTS_GENERIC_64_128(default_nan, P)(P, S)
 #define parts_silence_nan(P, S)    PARTS_GENERIC_64_128(silence_nan, P)(P, S)
 
+static void parts64_return_nan(FloatParts64 *a, float_status *s);
+static void parts128_return_nan(FloatParts128 *a, float_status *s);
+
+#define parts_return_nan(P, S)     PARTS_GENERIC_64_128(return_nan, P)(P, S)
 
 /*
  * Helper functions for softfloat-parts.c.inc, per-size operations.
@@ -914,22 +918,6 @@ static FloatParts64 round_canonical(FloatParts64 p, float_status *s,
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
@@ -991,6 +979,21 @@ static FloatParts64 pick_nan_muladd(FloatParts64 a, FloatParts64 b, FloatParts64
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
@@ -2065,7 +2068,7 @@ static FloatParts64 float_to_float(FloatParts64 a, const FloatFmt *dstf,
             break;
         }
     } else if (is_nan(a.cls)) {
-        return return_nan(a, s);
+        parts_return_nan(&a, s);
     }
     return a;
 }
@@ -2194,7 +2197,8 @@ static FloatParts64 round_to_int(FloatParts64 a, FloatRoundMode rmode,
     switch (a.cls) {
     case float_class_qnan:
     case float_class_snan:
-        return return_nan(a, s);
+        parts_return_nan(&a, s);
+        break;
 
     case float_class_zero:
     case float_class_inf:
@@ -3590,7 +3594,7 @@ FloatRelation bfloat16_compare_quiet(bfloat16 a, bfloat16 b, float_status *s)
 static FloatParts64 scalbn_decomposed(FloatParts64 a, int n, float_status *s)
 {
     if (unlikely(is_nan(a.cls))) {
-        return return_nan(a, s);
+        parts_return_nan(&a, s);
     }
     if (a.cls == float_class_normal) {
         /* The largest float type (even though not supported by FloatParts64)
@@ -3658,7 +3662,8 @@ static FloatParts64 sqrt_float(FloatParts64 a, float_status *s, const FloatFmt *
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


