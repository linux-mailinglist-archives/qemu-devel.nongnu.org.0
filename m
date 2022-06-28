Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9B455BE91
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:01:55 +0200 (CEST)
Received: from localhost ([::1]:48978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64IM-0004MO-Kz
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63F3-0002Jb-Gx
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:25 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63F1-0008IZ-EF
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:24 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 23so11058486pgc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RK5M0Iz9OI0w9+qLU0kfHIVs85xFEebhwh/ygRwPj/8=;
 b=klzn4Mv43gJL6TxdLCxg6gbINvGlfcE3+9h1sQ9wuSeZv1JHa80ZIdtqN/2lIyJL3F
 ZN7k96iXz2rJ9XXGoFgTguWT5G9UPEn3QZc9PjwrMDr/DNjIx5sGt5+Bd9FqTiaDCX0H
 +bLapgOMzHLaT9Sd9Uq6VKzZSDL4IAY4aHfqtwHyJW52HIpbLfZ1Fedh0XEj4kNLUOJn
 9kSgrG/gKEoN0dq8w1569yrkZQBe0C6xqLByICgj8XxwnOa4fRdH5IQxvb2kIikdE9BZ
 DDC2KSKB+jS5DY6/5Fe51HwZfSciQczakkg7dRbRIQJbNkBO/8uRNvMnvzXoEQEuxTsk
 deLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RK5M0Iz9OI0w9+qLU0kfHIVs85xFEebhwh/ygRwPj/8=;
 b=pxQIGm4xy5DsOiuHPVppGx2fuLmF1dZpeUMMjNRoCwkPTB9MKOgTqVlbgLCN7hejFx
 v9VZ6KLuEHsK6NSPQ/nUpdj6kWetftYuCDizQ/vfJ1vOsK3R9NIf9ZrnmZL7/aZFFNev
 PMsoe+umGMvBoPloH2DVHZJ+RQ13xa51cVf8LeXoN8ZQSSsntocABcztrViEFvM6tPIM
 xbLEcA/EGfnkHHpMszgiY+wz0xNzpiaqRnK2C5Ih5jk0R2t5/kMruR6e05B2MmmRiQfw
 rWP37vIZTcslyZPK9rQI+SectrqLR4KLr69VICKr1sgaRFIDI2BiFvWg0VU9Oghqhf3C
 1MaA==
X-Gm-Message-State: AJIora8bGS53atArUtuaqzdZII+a0xJHyxP+1xdzjgFCJ6aRM13e2b8K
 +B61wyuBDBNtCen5cav7XZNzm1ZzvVMr8Q==
X-Google-Smtp-Source: AGRyM1tzHBDiWHBy4VDKmFITU0lVOkoug15hrj96pEWiIvyxgotLBfGudGf3KSUyt8leY6/ZlePYaA==
X-Received: by 2002:a05:6a00:893:b0:51e:77ab:8874 with SMTP id
 q19-20020a056a00089300b0051e77ab8874mr2692434pfj.21.1656392062081; 
 Mon, 27 Jun 2022 21:54:22 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/60] semihosting: Add target_strlen for softmmu-uaccess.h
Date: Tue, 28 Jun 2022 10:23:09 +0530
Message-Id: <20220628045403.508716-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 0d3b32b75d..d6997e3c65 100644
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
+        left_in_page = TARGET_PAGE_SIZE - (addr & ~TARGET_PAGE_MASK);
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


