Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D925C3C191C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:20:31 +0200 (CEST)
Received: from localhost ([::1]:40606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YdS-0000Mv-SL
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Yaq-0006nC-G6
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:17:48 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1Yao-0005K6-Cn
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:17:48 -0400
Received: by mail-pl1-x62d.google.com with SMTP id v13so3518845ple.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKlOdzea9GIUuCIW92Q/dNU3AERYUe8yKlo7djvVlCY=;
 b=cyFt4aTWo22AwumWb0Ia3ol5JR1mb5i6KJuMfZu68JTLKLT13vOR06v4iRGteX+bSp
 dw1QMXuhLKZ1RHArrMNTxfETbwR0I39nIohgKONA9ZLXes8dOqwh6q3KX0fnyQoE93kx
 d+apiMYuP+C5gwaQGSl19rE/TVszlgNwilpk2kZlKErrQI07/EquAyxuvNvw0A31+QKf
 pJU2SJwASvuUwdazS/b+PMTxhZYBNtJDCDFtDeqCDE2CaaVNgg3Iix4O85pR86apD6JY
 BRyP/Ksu4gLqZqlk0uQozG6qP1unCRJIRBF5xHgmK/u4p6S5YnR1glw8aGODfxri3J8c
 HUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VKlOdzea9GIUuCIW92Q/dNU3AERYUe8yKlo7djvVlCY=;
 b=KqzbBKwxnyOwniwbJLi3Jy2BKG2My7281vJrJcUcTZxsmEOdICYg2m2u18UXbBwuPf
 YjSmM/gpq2E5dTl0QaeXiZFvTLQ7/rdU0mPlsfclCrBJYJFW95bEmLKoXliW1UwiaNzE
 F86WINNw8PlD1SRfRXSqsDiZjZlYiAGQ42LvCgzHQDeXzF7gTrw0qFxADkUc/d07kq6l
 eezr8vf0qVod0y21a8WzqfbN4gdZgIpeiaQdFdJF4UDKphTKL3vdlzKyt1oRHx4yC9DP
 ExwWMaFiRX2qhQgw2blY54Nn0FHzqHRu2NNTqcgsXkpgoLW1CEWOQqdGHFJAsJGvz9ZQ
 4M3w==
X-Gm-Message-State: AOAM530ONLvcU33dtFRctOmNMdBf3bou0uA5WABbdTJvF45ahk/SCnyf
 vThLNtWvmCuvDRtosh8Nt2X82RKbsNf76Q==
X-Google-Smtp-Source: ABdhPJwLPgqhaU+CJ7Jvauxsq0jfKwBXvTb/tNJFdw3Hv7Oe/vxRqjMBlDzwzocdwQQOSvOPfvZ44A==
X-Received: by 2002:a17:90a:5e01:: with SMTP id
 w1mr17133705pjf.200.1625768264796; 
 Thu, 08 Jul 2021 11:17:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id p14sm3416949pfo.101.2021.07.08.11.17.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:17:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] include/qemu: Use builtins for bswap
Date: Thu,  8 Jul 2021 11:17:43 -0700
Message-Id: <20210708181743.750220-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All supported compilers have builtins for this.
Drop all of the complicated system detection stuff.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build          |  6 -----
 include/qemu/bswap.h | 53 +++-----------------------------------------
 2 files changed, 3 insertions(+), 56 deletions(-)

diff --git a/meson.build b/meson.build
index 7e12de01be..6024f2d6fb 100644
--- a/meson.build
+++ b/meson.build
@@ -1290,8 +1290,6 @@ config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
 # has_header_symbol
-config_host_data.set('CONFIG_BYTESWAP_H',
-                     cc.has_header_symbol('byteswap.h', 'bswap_32'))
 config_host_data.set('CONFIG_EPOLL_CREATE1',
                      cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
 config_host_data.set('CONFIG_HAS_ENVIRON',
@@ -1311,10 +1309,6 @@ config_host_data.set('CONFIG_INOTIFY',
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


