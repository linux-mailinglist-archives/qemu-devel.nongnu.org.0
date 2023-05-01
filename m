Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241336F398E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 23:07:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptaih-00069u-PI; Mon, 01 May 2023 17:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptaif-00068m-OQ
 for qemu-devel@nongnu.org; Mon, 01 May 2023 17:06:01 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptaid-0006Rl-Kf
 for qemu-devel@nongnu.org; Mon, 01 May 2023 17:06:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f315712406so144242865e9.0
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682975156; x=1685567156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6Evq+MD3JUEiKzUlp7urbHg+OD3xjvH8WPXX9LOTAPg=;
 b=xcbxO5xAGIEMkddhUGEnkr7RqiUHzyrii/EOyerByRtxn3u7dEqClwMoPxGEZQzWKG
 xaNXme3XMBCq8PY3Dmaw0EXoZkeZoOg3S/5pjBc86m2EAeESqrC0zx9tXHW9XOfcNFmz
 yYR3qaorGD4u/F0krIOYEujRgpt/1KGMQXS1Olr1z3R3YpYVyp6BZle1bGQAH4YCucpD
 2/PgHS7YxbUcZAdXzJtaWcpGDWSxY3P2YdttpGasXftgy4hiz5ZmxIid7w7S398aDP/s
 Kc9AQ7IHcMxyO33yCNOMexG+t3T0GjcCFCtJ6F0M/r6ISIFDLScCQ7GErM7eqQsgaFXz
 NivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682975156; x=1685567156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6Evq+MD3JUEiKzUlp7urbHg+OD3xjvH8WPXX9LOTAPg=;
 b=fkX1t2axgz0q8/XFRhpdeS8Ia1T/sbPVkxpnBbz0gWF179nlOVhpbRihlH8AAtt2Y2
 az5ooVDJIdhBJ6cOuOz1vVaP4435XLBTWD+HrB/aGtR154KAZSgcxf+RHUGWasCtn+qt
 7g4wE4KCBFZ2AjGVw1UGoJLnmDUjNtvhl0wPJbRKjDuED6GDLaUeJPD0dE0C1qG0OtOr
 sSxDMedU3UrJf02BH8xHt6QMux3vlsFgcU5fyytYxgk8es5N8qsAMoM+mkKhsIOISxHC
 +m42w1PdeGkxXz+7uVVxEsbR8Yn7k8rIQbR8P4ZNR8mBmUCffTGzNNMwnenszeE11Ubm
 Rd8Q==
X-Gm-Message-State: AC+VfDwFzEOfaVZgM0IzG7bXRNCmQaADJ1OKmEXXSjWO4H4Ea9KPcmC2
 ffIuU9wU08cc7rdEC88nz/MOtuqV6lNFSjUjDbjF/g==
X-Google-Smtp-Source: ACHHUZ5BgqfB4ina9gBqkfAcZSqrwjvoHMAMNdpPAIQxiXZbfBkYUd27WZcsiXQIQFuWmZz2eI1jyQ==
X-Received: by 2002:adf:f40a:0:b0:2f5:9146:7024 with SMTP id
 g10-20020adff40a000000b002f591467024mr12403792wro.22.1682975156608; 
 Mon, 01 May 2023 14:05:56 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600001ca00b002fab755e10bsm28977061wrx.68.2023.05.01.14.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 14:05:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH] migration/xbzrle: Use __attribute__((target)) for avx512
Date: Mon,  1 May 2023 22:05:55 +0100
Message-Id: <20230501210555.289806-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
---
 migration/xbzrle.c | 9 ++++-----
 meson.build        | 5 +----
 2 files changed, 5 insertions(+), 9 deletions(-)

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
diff --git a/meson.build b/meson.build
index f71653d0c8..4bbdbcef37 100644
--- a/meson.build
+++ b/meson.build
@@ -2386,12 +2386,9 @@ config_host_data.set('CONFIG_AVX512F_OPT', get_option('avx512f') \
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
-- 
2.34.1


