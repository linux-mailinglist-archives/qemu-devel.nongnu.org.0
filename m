Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8D66D1D4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 23:37:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHY6D-0000gf-Tc; Mon, 16 Jan 2023 17:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY62-0000a3-91
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:59 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHY5w-0001Mn-Kp
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 17:36:50 -0500
Received: by mail-pl1-x632.google.com with SMTP id jn22so31642958plb.13
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 14:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+D/HiblqeSFw2GirhfaFCRyev36g0CtLDjZtrpyEfc=;
 b=DxdrDPS+LR6MmGfCoxvr2gDPhFcyeycCwe5lJ+nlGXBKMu2tqsU+Sg2+qTTyVdGQbp
 FZxaMC6+UozFE1WMeSMZd4XOS+E0M0X1UmVfmABMiODSTGjs29z7cwQLoAOK7+faRvIM
 BmSJ9HCCwu06jjQ9ySR/Q75frpey/QBcIZtmd4RsKhoCyorIK6z2hRyuLkjV/xYmmU+F
 fUBO6We7/7ThqgArfV22EpE+SGCuavAtFtgUwB8wzPMNywZLIYzJ1dx3uNOS/pmt+10Q
 jPdUOgumcHwcvRfY6FBnSGc+ETkb5+GLuq9cU+YmbZCGiPrh368KLOR8e0tnx8YdNqr1
 1Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+D/HiblqeSFw2GirhfaFCRyev36g0CtLDjZtrpyEfc=;
 b=tfvbIEi67gb041eEVla8v6SRvoYeMUsFnl+ZsHIyA3V6DsMApK2x82+ZYiqMCcLFjv
 MWdXxUnHaOaik0IIeKRw/K9pXbMva7eUxqJ1HxvohjmyttYs+L+K8YZ/g8WgGfASxGHp
 sq82I6uqTxMS4uQUl1NaGa0G9iDbCPlbT/AEFnwn9PjOUxjbXVX4ZFeYTFfIT4tO+KEc
 rQgGoDvOykfEegCwWyw3yzehCb60n/owlxPSqqxec/IETredPiuUnh4REnrJJfgQUuHS
 R6V/ovMVjDvFlnzJ+U2cijP6TbRd1tE/Fc+hTbDf19ineOl8GPsMiRfBH0YGmm1k7fXQ
 737g==
X-Gm-Message-State: AFqh2kr6wD3JhZMEpfl+1diFCELwQHYCQrI5lpz56thpcB+wF+70TFJy
 sgSA9FGsjM0+GAWFq8kpZ1273qdNHqrbicAy
X-Google-Smtp-Source: AMrXdXv6ZKxv5zh2Ye7nD2Kz/tq91CEUs6fGdUH9t/pqjjZE13rHmKQ1g8MYPpPZIMW6BP6ds7E8GA==
X-Received: by 2002:a17:902:720a:b0:193:25b6:71bc with SMTP id
 ba10-20020a170902720a00b0019325b671bcmr1416721plb.25.1673908607199; 
 Mon, 16 Jan 2023 14:36:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170903110300b00189f2fdbdd0sm19742492plh.234.2023.01.16.14.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 14:36:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 4/5] util/bufferiszero: Use __attribute__((target)) for
 avx2/avx512
Date: Mon, 16 Jan 2023 12:36:36 -1000
Message-Id: <20230116223637.3512814-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116223637.3512814-1-richard.henderson@linaro.org>
References: <20230116223637.3512814-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the attribute, which is supported by clang, instead of
the #pragma, which is not supported and, for some reason,
also not detected by the meson probe, so we fail by -Werror.

Include only <immintrin.h> as that is the outermost "official"
header for these intrinsics -- emmintrin.h and smmintrin -- are
older SSE2 and SSE4 specific headers, while the immintrin.h
includes all of the Intel intrinsics.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build         |  8 ++------
 util/bufferiszero.c | 41 ++++++-----------------------------------
 2 files changed, 8 insertions(+), 41 deletions(-)

diff --git a/meson.build b/meson.build
index 6d212f6c8e..58d8cd68a6 100644
--- a/meson.build
+++ b/meson.build
@@ -2338,11 +2338,9 @@ config_host_data.set('CONFIG_CPUID_H', have_cpuid_h)
 config_host_data.set('CONFIG_AVX2_OPT', get_option('avx2') \
   .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot enable AVX2') \
   .require(cc.links('''
-    #pragma GCC push_options
-    #pragma GCC target("avx2")
     #include <cpuid.h>
     #include <immintrin.h>
-    static int bar(void *a) {
+    static int __attribute__((target("avx2"))) bar(void *a) {
       __m256i x = *(__m256i *)a;
       return _mm256_testz_si256(x, x);
     }
@@ -2352,11 +2350,9 @@ config_host_data.set('CONFIG_AVX2_OPT', get_option('avx2') \
 config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
   .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot enable AVX512F') \
   .require(cc.links('''
-    #pragma GCC push_options
-    #pragma GCC target("avx512f")
     #include <cpuid.h>
     #include <immintrin.h>
-    static int bar(void *a) {
+    static int __attribute__((target("avx512f"))) bar(void *a) {
       __m512i x = *(__m512i *)a;
       return _mm512_test_epi64_mask(x, x);
     }
diff --git a/util/bufferiszero.c b/util/bufferiszero.c
index ec3cd4ca15..1790ded7d4 100644
--- a/util/bufferiszero.c
+++ b/util/bufferiszero.c
@@ -64,18 +64,11 @@ buffer_zero_int(const void *buf, size_t len)
 }
 
 #if defined(CONFIG_AVX512F_OPT) || defined(CONFIG_AVX2_OPT) || defined(__SSE2__)
-/* Do not use push_options pragmas unnecessarily, because clang
- * does not support them.
- */
-#if defined(CONFIG_AVX512F_OPT) || defined(CONFIG_AVX2_OPT)
-#pragma GCC push_options
-#pragma GCC target("sse2")
-#endif
-#include <emmintrin.h>
+#include <immintrin.h>
 
 /* Note that each of these vectorized functions require len >= 64.  */
 
-static bool
+static bool __attribute__((target("sse2")))
 buffer_zero_sse2(const void *buf, size_t len)
 {
     __m128i t = _mm_loadu_si128(buf);
@@ -104,20 +97,9 @@ buffer_zero_sse2(const void *buf, size_t len)
 
     return _mm_movemask_epi8(_mm_cmpeq_epi8(t, zero)) == 0xFFFF;
 }
-#if defined(CONFIG_AVX512F_OPT) || defined(CONFIG_AVX2_OPT)
-#pragma GCC pop_options
-#endif
 
 #ifdef CONFIG_AVX2_OPT
-/* Note that due to restrictions/bugs wrt __builtin functions in gcc <= 4.8,
- * the includes have to be within the corresponding push_options region, and
- * therefore the regions themselves have to be ordered with increasing ISA.
- */
-#pragma GCC push_options
-#pragma GCC target("sse4")
-#include <smmintrin.h>
-
-static bool
+static bool __attribute__((target("sse4")))
 buffer_zero_sse4(const void *buf, size_t len)
 {
     __m128i t = _mm_loadu_si128(buf);
@@ -145,12 +127,7 @@ buffer_zero_sse4(const void *buf, size_t len)
     return _mm_testz_si128(t, t);
 }
 
-#pragma GCC pop_options
-#pragma GCC push_options
-#pragma GCC target("avx2")
-#include <immintrin.h>
-
-static bool
+static bool __attribute__((target("avx2")))
 buffer_zero_avx2(const void *buf, size_t len)
 {
     /* Begin with an unaligned head of 32 bytes.  */
@@ -176,15 +153,10 @@ buffer_zero_avx2(const void *buf, size_t len)
 
     return _mm256_testz_si256(t, t);
 }
-#pragma GCC pop_options
 #endif /* CONFIG_AVX2_OPT */
 
 #ifdef CONFIG_AVX512F_OPT
-#pragma GCC push_options
-#pragma GCC target("avx512f")
-#include <immintrin.h>
-
-static bool
+static bool __attribute__((target("avx512f")))
 buffer_zero_avx512(const void *buf, size_t len)
 {
     /* Begin with an unaligned head of 64 bytes.  */
@@ -210,8 +182,7 @@ buffer_zero_avx512(const void *buf, size_t len)
     return !_mm512_test_epi64_mask(t, t);
 
 }
-#pragma GCC pop_options
-#endif
+#endif /* CONFIG_AVX512F_OPT */
 
 
 /* Note that for test_buffer_is_zero_next_accel, the most preferred
-- 
2.34.1


