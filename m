Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF06F5218
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:45:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pT-0008Oj-SQ; Wed, 03 May 2023 03:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6p2-000727-So
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:45 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ow-0007JF-Hv
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f192c23fffso29604085e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098554; x=1685690554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj2D2cXdtATJYKpTPKE6VX0lPTFHJNgX6DGhwMqHkxw=;
 b=CiBMUHFHnz5jxmdPfb83Zhqf624LXQZHXN/DfAbz1e/kpmQQygeqy6frhzpQ2CvyLg
 rWbmdd3PIqDdsusnt0Lo29VsfQt7UrwDvqucGqEBKU3OKIl4Ir6wgGCuGJfb5C3TrLDC
 DoRnBMMMMAOwG3S2g1AQXNa9Xy3Qhc/6EWT6mexT93ZkQzLMSKehIQapLNS+xElJrite
 dozt1Mw8g+Epb83SyF9RcFF8ONgibZ4/yczuqYLGj0OtRC1q3iC1rK/QR4QpAkYAWQlS
 wsnbr9Kz4jziXRRxfIx7610x0edj/nJY4Z1acF26Q9/sFJuQR3nJTjSSRF4ART+qHXWD
 GPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098554; x=1685690554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lj2D2cXdtATJYKpTPKE6VX0lPTFHJNgX6DGhwMqHkxw=;
 b=MegkqNWtDvR7O+j4UmFMeCxkbmzl7TaWvOJtu12CCiWpybVEIeEUOSNYsULX2/R3sx
 uQsFzcszzHYRkamKQsSku+GYX8oOGca9VpRHyR5rbbXLNRr2BE2yPa4FoWjZ+XyWVfcM
 FdyMvy/XQfG1Bak308dE98O8pUU+f+W2aox9CPj0qMLRSxtwuZhtzwNZPWiukXRdm0R3
 3WY9jdv9XBzoJTwotJKL4R2T+DDX5MIXN7r5R3BE5zO2LzSczvv3SwFVfdi02rbMwvfg
 DM+1f7zv1ybCFuMbZeNnZhYcBZJEvsYEagvP+QqE3R3eYcjQ8F/noHrJR9jzU2OFiheI
 cFpA==
X-Gm-Message-State: AC+VfDybFIaWFyTdwaG4SWOtmaNicIoNbEKkWuk1Q9WAdluwWCcmq7GM
 67N9OCC9jYaq5fyLRAsS927zTCYRihaSz6vio6ECSw==
X-Google-Smtp-Source: ACHHUZ70BCJmpnHvIbPEVu3mEpEzMiF+q1fe3AKcyFmiB94VrOwVaYdrI15fTllaXDDzaWgoX7uROw==
X-Received: by 2002:a05:600c:228f:b0:3f0:44d1:3ba5 with SMTP id
 15-20020a05600c228f00b003f044d13ba5mr13750662wmf.5.1683098554129; 
 Wed, 03 May 2023 00:22:34 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, Juan Quintela <quintela@redhat.com>
Subject: [PULL v2 08/12] migration/xbzrle: Use __attribute__((target)) for
 avx512
Date: Wed,  3 May 2023 08:21:01 +0100
Message-Id: <20230503072221.1746802-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the attribute, which is supported by clang, instead of
the #pragma, which is not supported and, for some reason,
also not detected by the meson probe, so we fail by -Werror.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <20230501210555.289806-1-richard.henderson@linaro.org>
---
 meson.build        | 5 +----
 migration/xbzrle.c | 9 ++++-----
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/meson.build b/meson.build
index c44d05a13f..77d42898c8 100644
--- a/meson.build
+++ b/meson.build
@@ -2370,12 +2370,9 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
 config_host_data.set('CONFIG_AVX512BW_OPT', get_option('avx512bw') \
   .require(have_cpuid_h, error_message: 'cpuid.h not available, cannot enable AVX512BW') \
   .require(cc.links('''
-    #pragma GCC push_options
-    #pragma GCC target("avx512bw")
     #include <cpuid.h>
     #include <immintrin.h>
-    static int bar(void *a) {
-
+    static int __attribute__((target("avx512bw"))) bar(void *a) {
       __m512i *x = a;
       __m512i res= _mm512_abs_epi8(*x);
       return res[1];
diff --git a/migration/xbzrle.c b/migration/xbzrle.c
index c6f8b20917..258e4959c9 100644
--- a/migration/xbzrle.c
+++ b/migration/xbzrle.c
@@ -177,11 +177,11 @@ int xbzrle_decode_buffer(uint8_t *src, int slen, uint8_t *dst, int dlen)
 }
 
 #if defined(CONFIG_AVX512BW_OPT)
-#pragma GCC push_options
-#pragma GCC target("avx512bw")
 #include <immintrin.h>
-int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
-                             uint8_t *dst, int dlen)
+
+int __attribute__((target("avx512bw")))
+xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
+                            uint8_t *dst, int dlen)
 {
     uint32_t zrun_len = 0, nzrun_len = 0;
     int d = 0, i = 0, num = 0;
@@ -296,5 +296,4 @@ int xbzrle_encode_buffer_avx512(uint8_t *old_buf, uint8_t *new_buf, int slen,
     }
     return d;
 }
-#pragma GCC pop_options
 #endif
-- 
2.34.1


