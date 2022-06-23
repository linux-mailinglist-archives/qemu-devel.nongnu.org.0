Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D107558024
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:43:47 +0200 (CEST)
Received: from localhost ([::1]:34058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Pvm-00065N-NG
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4PtS-0003tW-MH
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4PtP-0004C4-Rr
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656002478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iPiF3/pif9vyGRcIjCuaqS1mkM6paHqhq37uvtLec4M=;
 b=L5SHuOapziqrBiNoh4yJViGzxXl73rWYWizoxMlCEzwAjrt9ad4GpDQYYSiUl5i8CnbM2J
 7W7Ut99YaJs1N3M58MSwpxjEvKzq6K1L1fghSJqH7q7F/5nu4JLCQuUFI7abJOqGtk2Uef
 c+Sr4/y0syi4jjSFF/ZiawJmtswbcB4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-7fbfV7P8MkumNGDZ0NqeUA-1; Thu, 23 Jun 2022 12:41:05 -0400
X-MC-Unique: 7fbfV7P8MkumNGDZ0NqeUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E4DB3815D35;
 Thu, 23 Jun 2022 16:40:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49F0FC15D40;
 Thu, 23 Jun 2022 16:40:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] include/qemu/host-utils: Remove the *_overflow wrappers
Date: Thu, 23 Jun 2022 18:40:51 +0200
Message-Id: <20220623164051.506316-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to commit cec07c0b612975 these wrappers were required
for GCC < 5.0 and Clang < 3.8. We don't support such old compilers
at all anymore, so we can remove the wrappers now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Not sure whether it's nicer to remove these to get rid of some lines
 of code, or whether it's nicer to keep them for the more explicit names...

 include/qemu/host-utils.h    | 235 +----------------------------------
 accel/tcg/tcg-runtime-gvec.c |  16 +--
 fpu/softfloat.c              |  10 +-
 libdecnumber/decNumber.c     |   4 +-
 target/arm/mve_helper.c      |  18 +--
 5 files changed, 29 insertions(+), 254 deletions(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index bc743f5e32..6224815629 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -366,231 +366,6 @@ static inline uint64_t uabs64(int64_t v)
     return v < 0 ? -v : v;
 }
 
-/**
- * sadd32_overflow - addition with overflow indication
- * @x, @y: addends
- * @ret: Output for sum
- *
- * Computes *@ret = @x + @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
-{
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
-    return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return ((*ret ^ x) & ~(x ^ y)) < 0;
-#endif
-}
-
-/**
- * sadd64_overflow - addition with overflow indication
- * @x, @y: addends
- * @ret: Output for sum
- *
- * Computes *@ret = @x + @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool sadd64_overflow(int64_t x, int64_t y, int64_t *ret)
-{
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
-    return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return ((*ret ^ x) & ~(x ^ y)) < 0;
-#endif
-}
-
-/**
- * uadd32_overflow - addition with overflow indication
- * @x, @y: addends
- * @ret: Output for sum
- *
- * Computes *@ret = @x + @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool uadd32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
-{
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
-    return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return *ret < x;
-#endif
-}
-
-/**
- * uadd64_overflow - addition with overflow indication
- * @x, @y: addends
- * @ret: Output for sum
- *
- * Computes *@ret = @x + @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool uadd64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
-{
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
-    return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return *ret < x;
-#endif
-}
-
-/**
- * ssub32_overflow - subtraction with overflow indication
- * @x: Minuend
- * @y: Subtrahend
- * @ret: Output for difference
- *
- * Computes *@ret = @x - @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool ssub32_overflow(int32_t x, int32_t y, int32_t *ret)
-{
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
-    return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return ((*ret ^ x) & (x ^ y)) < 0;
-#endif
-}
-
-/**
- * ssub64_overflow - subtraction with overflow indication
- * @x: Minuend
- * @y: Subtrahend
- * @ret: Output for sum
- *
- * Computes *@ret = @x - @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool ssub64_overflow(int64_t x, int64_t y, int64_t *ret)
-{
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
-    return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return ((*ret ^ x) & (x ^ y)) < 0;
-#endif
-}
-
-/**
- * usub32_overflow - subtraction with overflow indication
- * @x: Minuend
- * @y: Subtrahend
- * @ret: Output for sum
- *
- * Computes *@ret = @x - @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool usub32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
-{
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
-    return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return x < y;
-#endif
-}
-
-/**
- * usub64_overflow - subtraction with overflow indication
- * @x: Minuend
- * @y: Subtrahend
- * @ret: Output for sum
- *
- * Computes *@ret = @x - @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool usub64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
-{
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
-    return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return x < y;
-#endif
-}
-
-/**
- * smul32_overflow - multiplication with overflow indication
- * @x, @y: Input multipliers
- * @ret: Output for product
- *
- * Computes *@ret = @x * @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool smul32_overflow(int32_t x, int32_t y, int32_t *ret)
-{
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
-    return __builtin_mul_overflow(x, y, ret);
-#else
-    int64_t z = (int64_t)x * y;
-    *ret = z;
-    return *ret != z;
-#endif
-}
-
-/**
- * smul64_overflow - multiplication with overflow indication
- * @x, @y: Input multipliers
- * @ret: Output for product
- *
- * Computes *@ret = @x * @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool smul64_overflow(int64_t x, int64_t y, int64_t *ret)
-{
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
-    return __builtin_mul_overflow(x, y, ret);
-#else
-    uint64_t hi, lo;
-    muls64(&lo, &hi, x, y);
-    *ret = lo;
-    return hi != ((int64_t)lo >> 63);
-#endif
-}
-
-/**
- * umul32_overflow - multiplication with overflow indication
- * @x, @y: Input multipliers
- * @ret: Output for product
- *
- * Computes *@ret = @x * @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool umul32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
-{
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
-    return __builtin_mul_overflow(x, y, ret);
-#else
-    uint64_t z = (uint64_t)x * y;
-    *ret = z;
-    return z > UINT32_MAX;
-#endif
-}
-
-/**
- * umul64_overflow - multiplication with overflow indication
- * @x, @y: Input multipliers
- * @ret: Output for product
- *
- * Computes *@ret = @x * @y, and returns true if and only if that
- * value has been truncated.
- */
-static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
-{
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
-    return __builtin_mul_overflow(x, y, ret);
-#else
-    uint64_t hi;
-    mulu64(ret, &hi, x, y);
-    return hi != 0;
-#endif
-}
-
 /*
  * Unsigned 128x64 multiplication.
  * Returns true if the result got truncated to 128 bits.
@@ -623,7 +398,7 @@ static inline bool mulu128(uint64_t *plow, uint64_t *phigh, uint64_t factor)
     mulu64(plow, &ahi, dlo, factor);
     mulu64(&blo, &bhi, dhi, factor);
 
-    return uadd64_overflow(ahi, blo, phigh) || bhi != 0;
+    return __builtin_add_overflow(ahi, blo, phigh) || bhi != 0;
 #endif
 }
 
@@ -645,8 +420,8 @@ static inline uint64_t uadd64_carry(uint64_t x, uint64_t y, bool *pcarry)
 #else
     bool c = *pcarry;
     /* This is clang's internal expansion of __builtin_addc. */
-    c = uadd64_overflow(x, c, &x);
-    c |= uadd64_overflow(x, y, &x);
+    c = __builtin_add_overflow(x, c, &x);
+    c |= __builtin_add_overflow(x, y, &x);
     *pcarry = c;
     return x;
 #endif
@@ -669,8 +444,8 @@ static inline uint64_t usub64_borrow(uint64_t x, uint64_t y, bool *pborrow)
     return x;
 #else
     bool b = *pborrow;
-    b = usub64_overflow(x, b, &x);
-    b |= usub64_overflow(x, y, &x);
+    b = __builtin_sub_overflow(x, b, &x);
+    b |= __builtin_sub_overflow(x, y, &x);
     *pborrow = b;
     return x;
 #endif
diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
index ac7d28c251..dd4ace857c 100644
--- a/accel/tcg/tcg-runtime-gvec.c
+++ b/accel/tcg/tcg-runtime-gvec.c
@@ -1074,7 +1074,7 @@ void HELPER(gvec_ssadd32)(void *d, void *a, void *b, uint32_t desc)
         int32_t ai = *(int32_t *)(a + i);
         int32_t bi = *(int32_t *)(b + i);
         int32_t di;
-        if (sadd32_overflow(ai, bi, &di)) {
+        if (__builtin_add_overflow(ai, bi, &di)) {
             di = (di < 0 ? INT32_MAX : INT32_MIN);
         }
         *(int32_t *)(d + i) = di;
@@ -1091,7 +1091,7 @@ void HELPER(gvec_ssadd64)(void *d, void *a, void *b, uint32_t desc)
         int64_t ai = *(int64_t *)(a + i);
         int64_t bi = *(int64_t *)(b + i);
         int64_t di;
-        if (sadd64_overflow(ai, bi, &di)) {
+        if (__builtin_add_overflow(ai, bi, &di)) {
             di = (di < 0 ? INT64_MAX : INT64_MIN);
         }
         *(int64_t *)(d + i) = di;
@@ -1142,7 +1142,7 @@ void HELPER(gvec_sssub32)(void *d, void *a, void *b, uint32_t desc)
         int32_t ai = *(int32_t *)(a + i);
         int32_t bi = *(int32_t *)(b + i);
         int32_t di;
-        if (ssub32_overflow(ai, bi, &di)) {
+        if (__builtin_sub_overflow(ai, bi, &di)) {
             di = (di < 0 ? INT32_MAX : INT32_MIN);
         }
         *(int32_t *)(d + i) = di;
@@ -1159,7 +1159,7 @@ void HELPER(gvec_sssub64)(void *d, void *a, void *b, uint32_t desc)
         int64_t ai = *(int64_t *)(a + i);
         int64_t bi = *(int64_t *)(b + i);
         int64_t di;
-        if (ssub64_overflow(ai, bi, &di)) {
+        if (__builtin_sub_overflow(ai, bi, &di)) {
             di = (di < 0 ? INT64_MAX : INT64_MIN);
         }
         *(int64_t *)(d + i) = di;
@@ -1206,7 +1206,7 @@ void HELPER(gvec_usadd32)(void *d, void *a, void *b, uint32_t desc)
         uint32_t ai = *(uint32_t *)(a + i);
         uint32_t bi = *(uint32_t *)(b + i);
         uint32_t di;
-        if (uadd32_overflow(ai, bi, &di)) {
+        if (__builtin_add_overflow(ai, bi, &di)) {
             di = UINT32_MAX;
         }
         *(uint32_t *)(d + i) = di;
@@ -1223,7 +1223,7 @@ void HELPER(gvec_usadd64)(void *d, void *a, void *b, uint32_t desc)
         uint64_t ai = *(uint64_t *)(a + i);
         uint64_t bi = *(uint64_t *)(b + i);
         uint64_t di;
-        if (uadd64_overflow(ai, bi, &di)) {
+        if (__builtin_add_overflow(ai, bi, &di)) {
             di = UINT64_MAX;
         }
         *(uint64_t *)(d + i) = di;
@@ -1270,7 +1270,7 @@ void HELPER(gvec_ussub32)(void *d, void *a, void *b, uint32_t desc)
         uint32_t ai = *(uint32_t *)(a + i);
         uint32_t bi = *(uint32_t *)(b + i);
         uint32_t di;
-        if (usub32_overflow(ai, bi, &di)) {
+        if (__builtin_sub_overflow(ai, bi, &di)) {
             di = 0;
         }
         *(uint32_t *)(d + i) = di;
@@ -1287,7 +1287,7 @@ void HELPER(gvec_ussub64)(void *d, void *a, void *b, uint32_t desc)
         uint64_t ai = *(uint64_t *)(a + i);
         uint64_t bi = *(uint64_t *)(b + i);
         uint64_t di;
-        if (usub64_overflow(ai, bi, &di)) {
+        if (__builtin_sub_overflow(ai, bi, &di)) {
             di = 0;
         }
         *(uint64_t *)(d + i) = di;
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4a871ef2a1..f9c59b0398 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -909,7 +909,7 @@ static void parts128_log2(FloatParts128 *a, float_status *s, const FloatFmt *f);
 
 static bool frac64_add(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
 {
-    return uadd64_overflow(a->frac, b->frac, &r->frac);
+    return __builtin_add_overflow(a->frac, b->frac, &r->frac);
 }
 
 static bool frac128_add(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
@@ -934,13 +934,13 @@ static bool frac256_add(FloatParts256 *r, FloatParts256 *a, FloatParts256 *b)
 
 static bool frac64_addi(FloatParts64 *r, FloatParts64 *a, uint64_t c)
 {
-    return uadd64_overflow(a->frac, c, &r->frac);
+    return __builtin_add_overflow(a->frac, c, &r->frac);
 }
 
 static bool frac128_addi(FloatParts128 *r, FloatParts128 *a, uint64_t c)
 {
-    c = uadd64_overflow(a->frac_lo, c, &r->frac_lo);
-    return uadd64_overflow(a->frac_hi, c, &r->frac_hi);
+    c = __builtin_add_overflow(a->frac_lo, c, &r->frac_lo);
+    return __builtin_add_overflow(a->frac_hi, c, &r->frac_hi);
 }
 
 #define frac_addi(R, A, C)  FRAC_GENERIC_64_128(addi, R)(R, A, C)
@@ -1516,7 +1516,7 @@ static void frac256_shrjam(FloatParts256 *a, int c)
 
 static bool frac64_sub(FloatParts64 *r, FloatParts64 *a, FloatParts64 *b)
 {
-    return usub64_overflow(a->frac, b->frac, &r->frac);
+    return __builtin_sub_overflow(a->frac, b->frac, &r->frac);
 }
 
 static bool frac128_sub(FloatParts128 *r, FloatParts128 *a, FloatParts128 *b)
diff --git a/libdecnumber/decNumber.c b/libdecnumber/decNumber.c
index 31282adafd..1d75ccb178 100644
--- a/libdecnumber/decNumber.c
+++ b/libdecnumber/decNumber.c
@@ -574,8 +574,8 @@ void decNumberIntegralToInt128(const decNumber *dn, decContext *set,
             /* overflow */
             goto Invalid;
         }
-        if (uadd64_overflow(lo, up[d], &lo)) {
-            if (uadd64_overflow(hi, 1, &hi)) {
+        if (__builtin_add_overflow(lo, up[d], &lo)) {
+            if (__builtin_add_overflow(hi, 1, &hi)) {
                 /* overflow */
                 goto Invalid;
             }
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 403b345ea3..557944aefa 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1345,9 +1345,9 @@ static int32_t do_vqdmladh_w(int32_t a, int32_t b, int32_t c, int32_t d,
      * So we add half the rounding constant before doubling rather
      * than adding the rounding constant after the doubling.
      */
-    if (sadd64_overflow(m1, m2, &r) ||
-        sadd64_overflow(r, (round << 30), &r) ||
-        sadd64_overflow(r, r, &r)) {
+    if (__builtin_add_overflow(m1, m2, &r) ||
+        __builtin_add_overflow(r, (round << 30), &r) ||
+        __builtin_add_overflow(r, r, &r)) {
         *sat = true;
         return r < 0 ? INT32_MAX : INT32_MIN;
     }
@@ -1375,9 +1375,9 @@ static int32_t do_vqdmlsdh_w(int32_t a, int32_t b, int32_t c, int32_t d,
     int64_t m2 = (int64_t)c * d;
     int64_t r;
     /* The same ordering issue as in do_vqdmladh_w applies here too */
-    if (ssub64_overflow(m1, m2, &r) ||
-        sadd64_overflow(r, (round << 30), &r) ||
-        sadd64_overflow(r, r, &r)) {
+    if (__builtin_sub_overflow(m1, m2, &r) ||
+        __builtin_add_overflow(r, (round << 30), &r) ||
+        __builtin_add_overflow(r, r, &r)) {
         *sat = true;
         return r < 0 ? INT32_MAX : INT32_MIN;
     }
@@ -1561,9 +1561,9 @@ static int32_t do_vqdmlah_w(int32_t a, int32_t b, int32_t c,
     int64_t m1 = (int64_t)a * b;
     int64_t m2 = (int64_t)c << 31;
     int64_t r;
-    if (sadd64_overflow(m1, m2, &r) ||
-        sadd64_overflow(r, (round << 30), &r) ||
-        sadd64_overflow(r, r, &r)) {
+    if (__builtin_add_overflow(m1, m2, &r) ||
+        __builtin_add_overflow(r, (round << 30), &r) ||
+        __builtin_add_overflow(r, r, &r)) {
         *sat = true;
         return r < 0 ? INT32_MAX : INT32_MIN;
     }
-- 
2.31.1


