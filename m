Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EA0641A4C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 02:53:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1eAJ-0001ZT-Sa; Sat, 03 Dec 2022 20:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1eAH-0001YP-HP
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 20:51:33 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p1eAC-0006o0-B7
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 20:51:33 -0500
Received: by mail-oi1-x22d.google.com with SMTP id c129so9349248oia.0
 for <qemu-devel@nongnu.org>; Sat, 03 Dec 2022 17:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9u/Uw0Ie39D5553Yw1gw6awZ7nIzmtrFVt1jBUP4Idk=;
 b=GwyGbZT8GMyvoj87AhyMO7u2kmw47u0gdfg6Hr4MwMAzlHjtZul7h/8oMeWiasRGyC
 5D02yx8Ma/mJoXTT8jYoHf89GqADv82ss987/VcGzTsYHWUDa6efoLKUU70pYu72PkHw
 3Ms4ctJjdxTW7O0ax0ZBfaRLEhGe5BUYjrcXPX2sAHm4cYGW/nqSrkna5T1rTfs12XqA
 YNfXaH9xn1LNHHcyolZryZgD2H9AmwNCt9tkSuwVqBzLNxItnrnJhyV2DEkQeW6SFpIE
 i0vWapJrlgRpW7rBTIrYjeHAGNqPbUauvHTEx16OoVful0fD2ECdOyCIlswh332fbsVn
 pEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9u/Uw0Ie39D5553Yw1gw6awZ7nIzmtrFVt1jBUP4Idk=;
 b=nNkuvSgdgr0SwOtRkRtqgCVHd6vQDsq/9XA0UutXhRQ9cxijzakp5k5+hngy/YH4Ci
 bPGUoIE4cVFT63xBqt7ha8UfyYu1WTT3kz0dMnQ3O5GYgEc94++aIXP1e3nAkMzqsc8E
 wTSIKo0fgy1eagTKUQsWQjUJ/l+2okPxmzxJsrk18taEQSWkX3mtrCmooozeSgOWc0Wk
 ncSgf1vtv1L+FCVsIYJ3Q2Av6SveHkG8EWR5JlJFMMj6h1ZwQ+DHpF5G8wnbTK+ENb+e
 BlgQ0TiaTSclZSRCuinx09y2CIXkM3EsNmSksHwPY/G3bN93LN0NHUQCtS0j5un2Hcp2
 0kbw==
X-Gm-Message-State: ANoB5pkDqf98sFPdmSe3DoLT3L7wX0IaGsbL3+NXTKdaTXHgt6JVgNq0
 9nNXxU2f7mP+HZVMVVPnDuvHD2pqCcb9QaqWCTY=
X-Google-Smtp-Source: AA0mqf708eU1JFcV2nif5DD/DTIIZEo5ihNaHFmMgwOGBuJW5gpKqBlNFtE4NL53pbiDeDuXnly63A==
X-Received: by 2002:a05:6808:170d:b0:35a:757a:ef9d with SMTP id
 bc13-20020a056808170d00b0035a757aef9dmr36816882oib.121.1670118686952; 
 Sat, 03 Dec 2022 17:51:26 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:6b63:a06c:99b3:833])
 by smtp.gmail.com with ESMTPSA id
 e16-20020aca2310000000b003436fa2c23bsm4964215oie.7.2022.12.03.17.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 17:51:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	tstellar@redhat.com,
	berrange@redhat.com
Subject: [PATCH 1/2] util/bufferiszero: Use __attribute__((target)) for
 avx2/avx512
Date: Sat,  3 Dec 2022 19:51:22 -0600
Message-Id: <20221204015123.362726-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204015123.362726-1-richard.henderson@linaro.org>
References: <20221204015123.362726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build         |  8 ++------
 util/bufferiszero.c | 41 ++++++-----------------------------------
 2 files changed, 8 insertions(+), 41 deletions(-)

diff --git a/meson.build b/meson.build
index 5c6b5a1c75..11b873f911 100644
--- a/meson.build
+++ b/meson.build
@@ -2324,11 +2324,9 @@ config_host_data.set('CONFIG_CPUID_H', have_cpuid_h)
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
@@ -2338,11 +2336,9 @@ config_host_data.set('CONFIG_AVX2_OPT', get_option('avx2') \
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


