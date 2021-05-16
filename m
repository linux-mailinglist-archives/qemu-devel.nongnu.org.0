Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34857381F03
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 15:09:34 +0200 (CEST)
Received: from localhost ([::1]:35670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liGWT-00058J-9m
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 09:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG27-0003Zs-WE
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:12 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:36653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liG24-0001Lh-B7
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:38:11 -0400
Received: by mail-qv1-xf36.google.com with SMTP id ez19so1870930qvb.3
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CPFctG9/cLngKncN4O5I0codA/JGixseHkiyOUbj7XY=;
 b=VVwu1XhanPZWGSZoJuKeT4TpnU/AVjbP/0mK/2PE5Nl4eQ48x8f07xFvw284kGH7+i
 W0dSDZ9Iriw176kXDgk/dG1QUg8/2vpzN6/Mbw3RFmRsUgOvPU5PemWTHeSmt+4ipCjS
 5/WOUeQDaTt4gn3plkGC30ckQLGQoOtlZbJWtfO5BRMu3Y6ArZJfEwWI617oQC6NmI5o
 rh/X4GFApMJMeA0gKAeieVcMbFdnvttGdrKAx4uO0cE55K/X5lO6+oNnWtoCbpL+fjEg
 U+6jrzrUPerJPtv7o/65kzJ9dapedOQUIDxlZo2POJfg2v5FvZw62NSdoPGrxbA1+jRI
 fWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CPFctG9/cLngKncN4O5I0codA/JGixseHkiyOUbj7XY=;
 b=uN+5XBfiVopgObR3fgi2uiNUClaubi3G0NTzO3kkQmx41GEmGhllp5ZpgmQrSljtVL
 d7jQRG1o1jok42unnmcDiLobolTjOMjG2jDqZo7mWcejE8mOuEAKS1+AxKRlQiwGYwHt
 2XLf8B8hHLGx8LujBnclX4MENrbE2ipRY3q7ZXxpB+NCmbKBSuWz7Ovcw2aBbKU3Onzl
 ITerrkBeEuMvX4u/jiHomlZsXY05bG2CNVggCc2LPZRam5cUYcDiU9tiaAogOR/eLuvx
 c3leuqgoEMDpKL3HAPV7pxiaCFdibdKu2fbXFP7Ge3r0XBwRUi8Q5w6WcTtGZPy8yrHp
 ELpQ==
X-Gm-Message-State: AOAM532Qf4GODA+4LOgkC5UMe78tTOigTyhvFo7fYyc7Wa/FLKweE1Sx
 WIDz+agqMJb6rVvFyNqVrceWZLDIqHgwa4/SFzo=
X-Google-Smtp-Source: ABdhPJwds3UGfLpRk9jEJHQ/r9V3+atckhVgTBuJHLpzei01JaG7kVWyblKDbkFi9UrVFO4qHaxlIw==
X-Received: by 2002:a05:6214:766:: with SMTP id
 f6mr54539192qvz.17.1621168687273; 
 Sun, 16 May 2021 05:38:07 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id 195sm8180765qkj.1.2021.05.16.05.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:38:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/46] softfloat: Introduce sh[lr]_double primitives
Date: Sun, 16 May 2021 07:34:26 -0500
Message-Id: <20210516123431.718318-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have x86_64 assembly for them, with a fallback.
This avoids shuffling values through %cl in the x86 case.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-macros.h |  36 ++++++++++++
 fpu/softfloat.c                | 102 +++++++++++++++++++++++++--------
 2 files changed, 115 insertions(+), 23 deletions(-)

diff --git a/include/fpu/softfloat-macros.h b/include/fpu/softfloat-macros.h
index 672c1db555..ec4e27a595 100644
--- a/include/fpu/softfloat-macros.h
+++ b/include/fpu/softfloat-macros.h
@@ -85,6 +85,42 @@ this code that are retained.
 #include "fpu/softfloat-types.h"
 #include "qemu/host-utils.h"
 
+/**
+ * shl_double: double-word merging left shift
+ * @l: left or most-significant word
+ * @r: right or least-significant word
+ * @c: shift count
+ *
+ * Shift @l left by @c bits, shifting in bits from @r.
+ */
+static inline uint64_t shl_double(uint64_t l, uint64_t r, int c)
+{
+#if defined(__x86_64__)
+    asm("shld %b2, %1, %0" : "+r"(l) : "r"(r), "ci"(c));
+    return l;
+#else
+    return c ? (l << c) | (r >> (64 - c)) : l;
+#endif
+}
+
+/**
+ * shr_double: double-word merging right shift
+ * @l: left or most-significant word
+ * @r: right or least-significant word
+ * @c: shift count
+ *
+ * Shift @r right by @c bits, shifting in bits from @l.
+ */
+static inline uint64_t shr_double(uint64_t l, uint64_t r, int c)
+{
+#if defined(__x86_64__)
+    asm("shrd %b2, %1, %0" : "+r"(r) : "r"(l), "ci"(c));
+    return r;
+#else
+    return c ? (r >> c) | (l << (64 - c)) : r;
+#endif
+}
+
 /*----------------------------------------------------------------------------
 | Shifts `a' right by the number of bits given in `count'.  If any nonzero
 | bits are shifted off, they are ``jammed'' into the least significant bit of
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 571309e74f..34689959a9 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -957,15 +957,12 @@ static int frac128_normalize(FloatParts128 *a)
 {
     if (a->frac_hi) {
         int shl = clz64(a->frac_hi);
-        if (shl) {
-            int shr = 64 - shl;
-            a->frac_hi = (a->frac_hi << shl) | (a->frac_lo >> shr);
-            a->frac_lo = (a->frac_lo << shl);
-        }
+        a->frac_hi = shl_double(a->frac_hi, a->frac_lo, shl);
+        a->frac_lo <<= shl;
         return shl;
     } else if (a->frac_lo) {
         int shl = clz64(a->frac_lo);
-        a->frac_hi = (a->frac_lo << shl);
+        a->frac_hi = a->frac_lo << shl;
         a->frac_lo = 0;
         return shl + 64;
     }
@@ -976,7 +973,7 @@ static int frac256_normalize(FloatParts256 *a)
 {
     uint64_t a0 = a->frac_hi, a1 = a->frac_hm;
     uint64_t a2 = a->frac_lm, a3 = a->frac_lo;
-    int ret, shl, shr;
+    int ret, shl;
 
     if (likely(a0)) {
         shl = clz64(a0);
@@ -1006,11 +1003,10 @@ static int frac256_normalize(FloatParts256 *a)
         ret += shl;
     }
 
-    shr = -shl & 63;
-    a0 = (a0 << shl) | (a1 >> shr);
-    a1 = (a1 << shl) | (a2 >> shr);
-    a2 = (a2 << shl) | (a3 >> shr);
-    a3 = (a3 << shl);
+    a0 = shl_double(a0, a1, shl);
+    a1 = shl_double(a1, a2, shl);
+    a2 = shl_double(a2, a3, shl);
+    a3 <<= shl;
 
  done:
     a->frac_hi = a0;
@@ -1029,7 +1025,20 @@ static void frac64_shl(FloatParts64 *a, int c)
 
 static void frac128_shl(FloatParts128 *a, int c)
 {
-    shift128Left(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
+    uint64_t a0 = a->frac_hi, a1 = a->frac_lo;
+
+    if (c & 64) {
+        a0 = a1, a1 = 0;
+    }
+
+    c &= 63;
+    if (c) {
+        a0 = shl_double(a0, a1, c);
+        a1 = a1 << c;
+    }
+
+    a->frac_hi = a0;
+    a->frac_lo = a1;
 }
 
 #define frac_shl(A, C)  FRAC_GENERIC_64_128(shl, A)(A, C)
@@ -1041,19 +1050,68 @@ static void frac64_shr(FloatParts64 *a, int c)
 
 static void frac128_shr(FloatParts128 *a, int c)
 {
-    shift128Right(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
+    uint64_t a0 = a->frac_hi, a1 = a->frac_lo;
+
+    if (c & 64) {
+        a1 = a0, a0 = 0;
+    }
+
+    c &= 63;
+    if (c) {
+        a1 = shr_double(a0, a1, c);
+        a0 = a0 >> c;
+    }
+
+    a->frac_hi = a0;
+    a->frac_lo = a1;
 }
 
 #define frac_shr(A, C)  FRAC_GENERIC_64_128(shr, A)(A, C)
 
 static void frac64_shrjam(FloatParts64 *a, int c)
 {
-    shift64RightJamming(a->frac, c, &a->frac);
+    uint64_t a0 = a->frac;
+
+    if (likely(c != 0)) {
+        if (likely(c < 64)) {
+            a0 = (a0 >> c) | (shr_double(a0, 0, c) != 0);
+        } else {
+            a0 = a0 != 0;
+        }
+        a->frac = a0;
+    }
 }
 
 static void frac128_shrjam(FloatParts128 *a, int c)
 {
-    shift128RightJamming(a->frac_hi, a->frac_lo, c, &a->frac_hi, &a->frac_lo);
+    uint64_t a0 = a->frac_hi, a1 = a->frac_lo;
+    uint64_t sticky = 0;
+
+    if (unlikely(c == 0)) {
+        return;
+    } else if (likely(c < 64)) {
+        /* nothing */
+    } else if (likely(c < 128)) {
+        sticky = a1;
+        a1 = a0;
+        a0 = 0;
+        c &= 63;
+        if (c == 0) {
+            goto done;
+        }
+    } else {
+        sticky = a0 | a1;
+        a0 = a1 = 0;
+        goto done;
+    }
+
+    sticky |= shr_double(a1, 0, c);
+    a1 = shr_double(a0, a1, c);
+    a0 = a0 >> c;
+
+ done:
+    a->frac_lo = a1 | (sticky != 0);
+    a->frac_hi = a0;
 }
 
 static void frac256_shrjam(FloatParts256 *a, int c)
@@ -1061,7 +1119,6 @@ static void frac256_shrjam(FloatParts256 *a, int c)
     uint64_t a0 = a->frac_hi, a1 = a->frac_hm;
     uint64_t a2 = a->frac_lm, a3 = a->frac_lo;
     uint64_t sticky = 0;
-    int invc;
 
     if (unlikely(c == 0)) {
         return;
@@ -1086,12 +1143,11 @@ static void frac256_shrjam(FloatParts256 *a, int c)
         goto done;
     }
 
-    invc = -c & 63;
-    sticky |= a3 << invc;
-    a3 = (a3 >> c) | (a2 << invc);
-    a2 = (a2 >> c) | (a1 << invc);
-    a1 = (a1 >> c) | (a0 << invc);
-    a0 = (a0 >> c);
+    sticky |= shr_double(a3, 0, c);
+    a3 = shr_double(a2, a3, c);
+    a2 = shr_double(a1, a2, c);
+    a1 = shr_double(a0, a1, c);
+    a0 = a0 >> c;
 
  done:
     a->frac_lo = a3 | (sticky != 0);
-- 
2.25.1


