Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35639407E45
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:01:57 +0200 (CEST)
Received: from localhost ([::1]:43290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRvW-0005CA-PG
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs4-0002Pn-9o
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:20 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:44544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPRs1-0003wo-C1
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:58:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 gp20-20020a17090adf1400b00196b761920aso4760145pjb.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQDuqbSrDr+qw7KrlgTnp7QFi56WX9RoG9PJ3coNJeg=;
 b=GlXybQsWe+pPyo3VjOdYKrJ932JM7RquMO0mH4xIUVMqZMdN04C8Dhzv8t/pn6PYMB
 VrIfBPdpcNLdLtgcyOPtgYZ/XRbURu2xBhlrX6aEwZeiNKRil4omWQyQ4uMjT+wFObx3
 fd2C3P/ZYKT4o+KNqL1SOnQyJC1WOkTvK1lkMeaWMriw3+8Vn2HfnpXYWPwIYUhjts7u
 JtI9NFiSeQjej/C7bTl1rIywVue8pHGxEogO7/1wc2vZOJjygOQnmp91Iol+sRgPF7qr
 teQBVozIi4GB3weGBOmSzBJWmjXeMb6ctHAUmPvcEWNrJTvrfsnARqaw43VOvKhmF2z9
 lNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQDuqbSrDr+qw7KrlgTnp7QFi56WX9RoG9PJ3coNJeg=;
 b=hBlx18+Z87oviCWyEwjKzONjr8nXnAiv0LcRYtEUDvwMs1OSIbB6Sc3o8eh2LHnG+J
 mpCF087bil6jexRprfqTyxJALGngqwTAbuEVTXTgu1Ntpk8IYGXf3pJi6T08Qjj0ZAsy
 IP0JrtiCgdy8CzoiJvHHgPyHt7BKC64fXTJBZUV5sRqsHmkcdm6NPT//FFt7e1l+EoQI
 Kg0WbYK1r6ngiHlv8neazr+oSWvKe5PBjpYflraWI6hKnqr+T5HFRAN2QqFrYbnCrlrf
 tHxm4tZdJNCFYkdpk/ae+XAa8ZP6s0PnXmEMgdPxLj51X9czWjQp54mj84zd3FIJqiU0
 oPJg==
X-Gm-Message-State: AOAM532qObi9BODcEFBDrTVyIk+tpJ/4TsCjNVD6+XiP7bd/RShKOaUK
 cI1OzZ0wR73zdOxsgi8jY6wCQI2TDH3pow==
X-Google-Smtp-Source: ABdhPJyo/33YDup46veK6AL8CVDKj+QNgntfzDK9kzJuR9WBkXhO5jXa2RctH1eMgGcuVjKjkw0/ZQ==
X-Received: by 2002:a17:902:7d8f:b0:13a:79e7:5bf0 with SMTP id
 a15-20020a1709027d8f00b0013a79e75bf0mr6666987plm.27.1631462295407; 
 Sun, 12 Sep 2021 08:58:15 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v13sm4439415pfm.16.2021.09.12.08.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 08:58:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] include/qemu: Use builtins for bswap
Date: Sun, 12 Sep 2021 08:58:06 -0700
Message-Id: <20210912155809.196236-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912155809.196236-1-richard.henderson@linaro.org>
References: <20210912155809.196236-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All supported compilers have builtins for this.
Drop all of the complicated system detection stuff.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210708181743.750220-1-richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build          |  6 -----
 include/qemu/bswap.h | 53 +++-----------------------------------------
 2 files changed, 3 insertions(+), 56 deletions(-)

diff --git a/meson.build b/meson.build
index 9a64d16943..306797c604 100644
--- a/meson.build
+++ b/meson.build
@@ -1332,8 +1332,6 @@ config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
 # has_header_symbol
-config_host_data.set('CONFIG_BYTESWAP_H',
-                     cc.has_header_symbol('byteswap.h', 'bswap_32'))
 config_host_data.set('CONFIG_EPOLL_CREATE1',
                      cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
 config_host_data.set('CONFIG_HAS_ENVIRON',
@@ -1353,10 +1351,6 @@ config_host_data.set('CONFIG_INOTIFY',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init'))
 config_host_data.set('CONFIG_INOTIFY1',
                      cc.has_header_symbol('sys/inotify.h', 'inotify_init1'))
-config_host_data.set('CONFIG_MACHINE_BSWAP_H',
-                     cc.has_header_symbol('machine/bswap.h', 'bswap32',
-                                          prefix: '''#include <sys/endian.h>
-                                                     #include <sys/types.h>'''))
 config_host_data.set('CONFIG_PRCTL_PR_SET_TIMERSLACK',
                      cc.has_header_symbol('sys/prctl.h', 'PR_SET_TIMERSLACK'))
 config_host_data.set('CONFIG_RTNETLINK',
diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 2d3bb8bbed..9e12bd8073 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -1,73 +1,26 @@
 #ifndef BSWAP_H
 #define BSWAP_H
 
-#ifdef CONFIG_MACHINE_BSWAP_H
-# include <sys/endian.h>
-# include <machine/bswap.h>
-#elif defined(__FreeBSD__)
-# include <sys/endian.h>
-#elif defined(__HAIKU__)
-# include <endian.h>
-#elif defined(CONFIG_BYTESWAP_H)
-# include <byteswap.h>
-#define BSWAP_FROM_BYTESWAP
-# else
-#define BSWAP_FROM_FALLBACKS
-#endif /* ! CONFIG_MACHINE_BSWAP_H */
-
 #ifdef __cplusplus
 extern "C" {
 #endif
 
 #include "fpu/softfloat-types.h"
 
-#ifdef BSWAP_FROM_BYTESWAP
 static inline uint16_t bswap16(uint16_t x)
 {
-    return bswap_16(x);
+    return __builtin_bswap16(x);
 }
 
 static inline uint32_t bswap32(uint32_t x)
 {
-    return bswap_32(x);
+    return __builtin_bswap32(x);
 }
 
 static inline uint64_t bswap64(uint64_t x)
 {
-    return bswap_64(x);
+    return __builtin_bswap64(x);
 }
-#endif
-
-#ifdef BSWAP_FROM_FALLBACKS
-static inline uint16_t bswap16(uint16_t x)
-{
-    return (((x & 0x00ff) << 8) |
-            ((x & 0xff00) >> 8));
-}
-
-static inline uint32_t bswap32(uint32_t x)
-{
-    return (((x & 0x000000ffU) << 24) |
-            ((x & 0x0000ff00U) <<  8) |
-            ((x & 0x00ff0000U) >>  8) |
-            ((x & 0xff000000U) >> 24));
-}
-
-static inline uint64_t bswap64(uint64_t x)
-{
-    return (((x & 0x00000000000000ffULL) << 56) |
-            ((x & 0x000000000000ff00ULL) << 40) |
-            ((x & 0x0000000000ff0000ULL) << 24) |
-            ((x & 0x00000000ff000000ULL) <<  8) |
-            ((x & 0x000000ff00000000ULL) >>  8) |
-            ((x & 0x0000ff0000000000ULL) >> 24) |
-            ((x & 0x00ff000000000000ULL) >> 40) |
-            ((x & 0xff00000000000000ULL) >> 56));
-}
-#endif
-
-#undef BSWAP_FROM_BYTESWAP
-#undef BSWAP_FROM_FALLBACKS
 
 static inline void bswap16s(uint16_t *s)
 {
-- 
2.25.1


