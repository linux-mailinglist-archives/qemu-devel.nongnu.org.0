Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6757376E82
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 04:24:47 +0200 (CEST)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfCe6-00089w-QD
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 22:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7y-0002ct-6P
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:34 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC7w-0005P4-2p
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:51:33 -0400
Received: by mail-pl1-x630.google.com with SMTP id h20so6154138plr.4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DbYb1T7r/x3Vwe1nQCdfG81vfl3PJk8e2zSpVeaOReo=;
 b=Jk9Rb53gn0a4EI/UwbCmmd2tlpBEsza6c5Z065EydPF+WDTo15koUsSumX+ApKlae7
 BS093z7uml3IfHXxYTI0jc7EnZB9NXUYCZDx9o2DQSQZHrz451x+WMHCp67rATlqk8LD
 rO2u/B2FAZ3bVKDEyWzwIK8NY2nsmRKKpMhW4gr6wXDDW0qI9NtM+In3Y2tJK7Hx9Tey
 4G29RTe0ZTa+3Y2h1R7u0AI3r6CcyHTOWv/7AKFVz2hXrWVBbczVi8T70C0G1nn8L/A2
 G2o3w44fPYCOQISWogTKIuJ41pcmPqFjP3C+/7fGztdG8RLbe1vPBClzw+Yvd3D3cSsY
 XDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DbYb1T7r/x3Vwe1nQCdfG81vfl3PJk8e2zSpVeaOReo=;
 b=tky9zVBkx+MFb3uQv0pvu9sBlLT6ggOyukQfOxDp1l6ZzwCtN5/ydA9MJ6XUMOcf8N
 Gg4dnsRXzr6u4LivC+VQpLV6tGUgiQXZya+6z5JVRBzkoiTxVUkS2YG9oPPAkH5Zd+fb
 PHO2W2rO/lW3SUYvlUjMojx0FDTDUdAKDj8aPsFyCyKI8MKzfFt5Y/Kt5uwXY13bh+Yv
 HDIw6KeIgD41DncHGen6x0u641nuNVIG9WQZz/67bNefoB4vrrGAtvTUdmfTzkp8B1KG
 lxl59fA8M7NX2/kkBMyeMpNkt+nhiZdqPwA/+fj0Dchkp/b+xlVP5+hwUvYZ1t2YvO7N
 vKpA==
X-Gm-Message-State: AOAM531IS+bh0QE50K8J43wvTBkldMVhMDUGGcF7fow1DlIuaf1YpF30
 q9XkvyhbLtvmSnzb0PLN9VIMzQNfb+IprA==
X-Google-Smtp-Source: ABdhPJwAvFVrKa1r8CZvT82AoofUiiJrh2Y+iP4qaG2sVHy3LDEWNt3anX6D84vJMVLcMNXwpHFa5w==
X-Received: by 2002:a17:90a:5806:: with SMTP id
 h6mr13646331pji.14.1620438690628; 
 Fri, 07 May 2021 18:51:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 204sm5861396pfw.158.2021.05.07.18.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:51:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 41/72] softfloat: Introduce sh[lr]_double primitives
Date: Fri,  7 May 2021 18:47:31 -0700
Message-Id: <20210508014802.892561-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have x86_64 assembly for them, with a fallback.
This avoids shuffling values through %cl in the x86 case.

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
index a9ee8498ae..a42c297828 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -956,15 +956,12 @@ static int frac128_normalize(FloatParts128 *a)
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
@@ -975,7 +972,7 @@ static int frac256_normalize(FloatParts256 *a)
 {
     uint64_t a0 = a->frac_hi, a1 = a->frac_hm;
     uint64_t a2 = a->frac_lm, a3 = a->frac_lo;
-    int ret, shl, shr;
+    int ret, shl;
 
     if (likely(a0)) {
         shl = clz64(a0);
@@ -1005,11 +1002,10 @@ static int frac256_normalize(FloatParts256 *a)
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
@@ -1028,7 +1024,20 @@ static void frac64_shl(FloatParts64 *a, int c)
 
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
@@ -1040,19 +1049,68 @@ static void frac64_shr(FloatParts64 *a, int c)
 
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
@@ -1060,7 +1118,6 @@ static void frac256_shrjam(FloatParts256 *a, int c)
     uint64_t a0 = a->frac_hi, a1 = a->frac_hm;
     uint64_t a2 = a->frac_lm, a3 = a->frac_lo;
     uint64_t sticky = 0;
-    int invc;
 
     if (unlikely(c == 0)) {
         return;
@@ -1085,12 +1142,11 @@ static void frac256_shrjam(FloatParts256 *a, int c)
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


