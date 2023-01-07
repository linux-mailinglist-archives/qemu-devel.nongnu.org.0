Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9C6610C1
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 19:20:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEDmv-0007Ux-7Z; Sat, 07 Jan 2023 13:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEDms-0007UO-3E
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 13:19:22 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEDmq-0006YO-4B
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 13:19:21 -0500
Received: by mail-pf1-x42e.google.com with SMTP id k19so3335759pfg.11
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 10:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IQeAyI5zLOFgWdoNZIf4Q4x6IS4guci1fUh3rKFs3d0=;
 b=n6Hm4U2DKV/Stsneef0+bTl1Vd+RqBoGJp4QjZHq/2Tc6jjy6/xMHbteIwEIFMIgCG
 AJL0pyKsGTUd1dIwJdS7K+9VL8hXswoPRh5HYpTNcTEY1gA26SSP5qCCYC9lAYdPCpTw
 LFCTI+eveJMkJ1LNUi+rdmzgdZWUnoWg/0Q4Mjscple4XVvkRDZwlBMyX03yg1YkRgYI
 wjEfZ3/SvkuGYX5DCpvcToNcuXAeyvKJm6yBf35Qe2sYGu9S8I7Pq5ukC5SFMAjzp24q
 o/5ABDIrakY40SyQGEkfVh8uNB2xqNLAUvlfE+04f8RVJtVdiGJ/yNHHtl9m8Za2qlBF
 jFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IQeAyI5zLOFgWdoNZIf4Q4x6IS4guci1fUh3rKFs3d0=;
 b=usHdp7JWfZ8iIQdp09FaEPmBJahRWbJzPZu5Qd9NN2gUWvmSBIPrY8x20+ql/dKaiI
 AHVdWSWxtpmIRiwPemaUUboXOhyGwPCX3TjBZlld09ZyLMTsD6/v5mDVIddqGS12yAwJ
 CwX+X4iMJMIa843TH+T04RkNMjgh3Dr8sjQKZzU1qSmTZoxbKVepQcx4/N73uZvdT1TC
 urPKZs8AqVLf1vHMBguKCfEBvDqpaJacNILe2FlddKv0uBcRCjLfncgU4raN4x7miwcm
 VrEEiJWX9dgV2V2qHO/2YYPTwAiuv/NXCZZ7hExCdY51fMfmwVu+6AArEZ+0GTN6GgT4
 PUBQ==
X-Gm-Message-State: AFqh2ko1l0kInsJYL1DeNImjIek6lIgXjQ2WG7aAEFPdcz9MjhIuQ5tV
 boqo96XYkmkCgvEmXzHNIX6HU9zt9qI2OIQ5
X-Google-Smtp-Source: AMrXdXtSsMxAOO3MxeZE0aU8HpXMjSdPXfp9oMx/WmqnEuoFBUIXI+gRqYVxdWJ6lkCsy/o6LNvP3g==
X-Received: by 2002:a62:1c42:0:b0:582:7d77:7fa2 with SMTP id
 c63-20020a621c42000000b005827d777fa2mr22437556pfc.11.1673115558228; 
 Sat, 07 Jan 2023 10:19:18 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 l123-20020a622581000000b005818d429d98sm3094133pfl.136.2023.01.07.10.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 10:19:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
	pbonzini@redhat.com
Subject: [PATCH v2] util/bufferiszero: Use __attribute__((target)) for
 avx2/avx512
Date: Sat,  7 Jan 2023 10:19:16 -0800
Message-Id: <20230107181916.1983949-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
header for these intrinsics -- emmintrin.h and smmintrin.> are
older SSE2 and SSE4 specific headers, while the immintrin.h
includes all of the Intel intrinsics.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Changes for v2:
  - Drop changing --enable-avx512 to auto.
  - Add patch commentary for <immintrin.h>

r~

---
 meson.build         |  8 ++------
 util/bufferiszero.c | 41 ++++++-----------------------------------
 2 files changed, 8 insertions(+), 41 deletions(-)

diff --git a/meson.build b/meson.build
index 827e72609d..0e306cf4e4 100644
--- a/meson.build
+++ b/meson.build
@@ -2330,11 +2330,9 @@ config_host_data.set('CONFIG_CPUID_H', have_cpuid_h)
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
@@ -2344,11 +2342,9 @@ config_host_data.set('CONFIG_AVX2_OPT', get_option('avx2') \
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


