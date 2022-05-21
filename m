Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ACA52F692
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:09:10 +0200 (CEST)
Received: from localhost ([::1]:57984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCg9-0002mb-0X
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbN-00080X-Mq
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:14 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbK-0003yV-9P
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:12 -0400
Received: by mail-pl1-x633.google.com with SMTP id q4so8553498plr.11
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OyP2Wnw9umWfxtpbUetMIm1XRFLbapKewV58Lgr8fc=;
 b=Vl7I20wHocej6ezd+GOhft8MprLJBf9xVnw8ipS9GDYNOuoT+MHgc+N247SsfEqbxP
 Q1ZIkyYZUJt6DPPjlz+rEWUJwNgF9FNgp7kKe4eFJ4RV41T1/Uz8wqttXA6LQw5GiHvY
 j7c6k+KtcDnUtS8KEDVPoZAXrXciR05F7mWaOio3VLIG+ccDLieB5TJyXhamRXlnReYc
 JDAHpdBhe64aJVLX4GO4l0m5toGLm7r+upvS0rkneXJssuOndMhjoQf+t/FjoMfSVm23
 rjDQRWMZArEmzoRkdXWFf5kUQmWJ8zV/kFKaxqyDX72JKY2s+Dr7S2Mwt0TQNkBU75AC
 lMPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2OyP2Wnw9umWfxtpbUetMIm1XRFLbapKewV58Lgr8fc=;
 b=opOrmB3m6WrWP+N+G18m3BHfYhbbleNxv42Hk7ZsqUN4Pk7LC8bQ+pZqv6rfRAqHgZ
 2h7leq8EIjCKvpQGL3IKgq8PNIIf7Xh+A987mVa1DbYvgRthaWcert8M+qFVdpYwAXZd
 uRI/Zp/WZu2gx5I4qtHcY+2oXnD+iTaGBt6V8KiB6vLk/v45apR6SDRGd1JYZEAzHL3v
 lqBNFLzfzvP7LFPrQ9QR/sUKoBAzjANacWUhXB2sUZx8jW6Mk89zpqJzg/Nne/DbB6bO
 EmGYlbwQd2aJpi0lWm5ho4NBnRFRepbZUtg0gccC2Pr0F/6zLs4My6E8kgM88L9T2Pu7
 aBpQ==
X-Gm-Message-State: AOAM532Cv/stYndlvSK4Y9/ygDXT9cAFzmtDhGPdwYCwgq5lNZD81ErK
 mpKhJIigoszE4Q2574gHBkhHaQmB19Jhkg==
X-Google-Smtp-Source: ABdhPJzB6gVq463DOmcWC06vjYcw/y4qlye6RnVe8nLFqNw33ElSVHl+XRF8wFvMgrdE3+EMULYwmQ==
X-Received: by 2002:a17:902:a387:b0:15e:f63f:237f with SMTP id
 x7-20020a170902a38700b0015ef63f237fmr12010647pla.32.1653091448990; 
 Fri, 20 May 2022 17:04:08 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 05/49] semihosting: Add target_strlen for softmmu-uaccess.h
Date: Fri, 20 May 2022 17:03:16 -0700
Message-Id: <20220521000400.454525-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mirror the interface of the user-only function of the same name.
Use probe_access_flags for the common case of ram, and
cpu_memory_rw_debug for the uncommon case of mmio.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Use probe_access_flags (pmm)
---
 include/semihosting/softmmu-uaccess.h |  3 ++
 semihosting/uaccess.c                 | 49 +++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/softmmu-uaccess.h
index 03300376d3..4f08dfc098 100644
--- a/include/semihosting/softmmu-uaccess.h
+++ b/include/semihosting/softmmu-uaccess.h
@@ -53,4 +53,7 @@ void softmmu_unlock_user(CPUArchState *env, void *p,
                          target_ulong addr, target_ulong len);
 #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
 
+ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr);
+#define target_strlen(p) softmmu_strlen_user(env, p)
+
 #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 0d3b32b75d..51019b79ff 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/exec-all.h"
 #include "semihosting/softmmu-uaccess.h"
 
 void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
@@ -23,6 +24,54 @@ void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
     return p;
 }
 
+ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
+{
+    int mmu_idx = cpu_mmu_index(env, false);
+    size_t len = 0;
+
+    while (1) {
+        size_t left_in_page;
+        int flags;
+        void *h;
+
+        /* Find the number of bytes remaining in the page. */
+        left_in_page = -(addr | TARGET_PAGE_MASK);
+
+        flags = probe_access_flags(env, addr, MMU_DATA_LOAD,
+                                   mmu_idx, true, &h, 0);
+        if (flags & TLB_INVALID_MASK) {
+            return -1;
+        }
+        if (flags & TLB_MMIO) {
+            do {
+                uint8_t c;
+                if (cpu_memory_rw_debug(env_cpu(env), addr, &c, 1, 0)) {
+                    return -1;
+                }
+                if (c == 0) {
+                    return len;
+                }
+                addr++;
+                len++;
+                if (len > INT32_MAX) {
+                    return -1;
+                }
+            } while (--left_in_page != 0);
+        } else {
+            char *p = memchr(h, 0, left_in_page);
+            if (p) {
+                len += p - (char *)h;
+                return len <= INT32_MAX ? (ssize_t)len : -1;
+            }
+            addr += left_in_page;
+            len += left_in_page;
+            if (len > INT32_MAX) {
+                return -1;
+            }
+        }
+    }
+}
+
 char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
 {
     /* TODO: Make this something that isn't fixed size.  */
-- 
2.34.1


