Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA66F429B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:22:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3m-0000h7-2Q; Tue, 02 May 2023 07:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3g-0000es-EO
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3d-0003Fn-7U
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f193ca059bso21556665e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026429; x=1685618429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lj2D2cXdtATJYKpTPKE6VX0lPTFHJNgX6DGhwMqHkxw=;
 b=WPkKvB2CAMRkFtOdXRXZRQ914DBu4y6s4PSOR7ST92BO7xCLm5Ep4kJ7TKOFieqp5C
 dmqyKM9mFgQqlG4maT70FsEdnw8Vc/ew0QC10nYsU6C8P4xPze2DmW2OilIFpNg0gDLT
 JRGA85oihZvJJJ4gdrHT/K+wsM2dWtqGR6irbfuP2aA4+IYtUf5pBksS1+46MoedsXhQ
 /+rtk6fJ1waMABVRGgE/ngUGgv+Dl5RzcnQjz/F9krqeXVkNDj6XRdSS2WpipPqdUFA8
 bdU+Beu9D1zjziU41tx/IAWRKf8+aqsdp/ajGOiggsix+lG7VgSbX1DK0HF/EvSHqvAe
 7Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026429; x=1685618429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lj2D2cXdtATJYKpTPKE6VX0lPTFHJNgX6DGhwMqHkxw=;
 b=AOamun6WY1xSTLMnPXpnrRJxJ/+D2o4e+GF6kLTospwN8tNOgbeMN89pqn6iyxP3k4
 o6vw/F5H23W49UL90Maa4PI67ho8O9h3z6RrJVqjOMAb8JDR+YplIwJ5AE6MCxEcai7O
 u6gMnOesambmfhqT830Ly6EFni0uQyvP+6cW8ZpV+7wzlalhFBY4FIoMEgVT7k0FbUSA
 Bq6gTnqwAbrsM5Mv0obXSLV/3mRiDuPiUja5rGM+Rfc55Kpw6LPbVUHgDfDQFLYoa/ge
 N1PqMjukw3HI+v+zV3LcokxtTmuxn7eJ3YBXErHR4euZy1N3lgYFvj6wYZCL02IhvHh0
 vSLA==
X-Gm-Message-State: AC+VfDz03AGq/ZZNKig67joWN8U/ruB3UWhDAKUrLyAYo2Jq1WjEvQMj
 97yQa2kKhzYr41XLlHa/twGlBWfMy/GU+pOdcvJBIw==
X-Google-Smtp-Source: ACHHUZ5VeVs270UCyNIbMOhwM2DpQ89c2bk6o5orHpjkMIJQCsEJpbFdnZd9qIx/bONGnYTXu9/6zQ==
X-Received: by 2002:a05:600c:3797:b0:3f1:82c6:2d80 with SMTP id
 o23-20020a05600c379700b003f182c62d80mr11937607wmr.5.1683026429400; 
 Tue, 02 May 2023 04:20:29 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>
Subject: [PULL 08/12] migration/xbzrle: Use __attribute__((target)) for avx512
Date: Tue,  2 May 2023 12:20:19 +0100
Message-Id: <20230502112023.776823-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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


