Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C8541DB4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:19:33 +0200 (CEST)
Received: from localhost ([::1]:57284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhXw-0008Uq-Eu
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5Z-000789-Q8
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:09 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5V-0001J4-A7
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:09 -0400
Received: by mail-pf1-x430.google.com with SMTP id p8so16526537pfh.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RK5M0Iz9OI0w9+qLU0kfHIVs85xFEebhwh/ygRwPj/8=;
 b=MMBZPsXYmM6XJJ+aG7cEo5GCutXmUIDRixJee7hzlfDkcOlUHyFYgOPXZNy4z2Anvg
 8vbgHplRfGGJcByPSzmdpEkM3xMQKDHYLpi9MKcs20LKU49ipTue1WU7U3rwltu7c7Wm
 ajpB++4hX+AKgTDiyrmBHuCZNkzg0jdmEZ3ahwcWfD4DToCLwdwScfCxRUoLOAi5jCv8
 Y1jnsUoiEDySRsYhoN8OjcHbwZ9diaa9nqUSdC6w5aQpwRC7dmP4EMvOh69cCVLmlZZ0
 C2mSbw4OPANHn+s228Qp2l9SUE4rIlo89SGh/aKnQPo0EgLehxDpv2xHET8dj1StjP2H
 qjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RK5M0Iz9OI0w9+qLU0kfHIVs85xFEebhwh/ygRwPj/8=;
 b=tOufjB2w65u0qD56VxXbwPY8yDszo2UUBzZHf2X+CVRHjkap1cO2+dhBI6EzXI8l0k
 FHzagfkseGSc1/fvV6/vfaVVB+zmAykWcHts4gqTwdUy3+71lYAAcA7+E9DaPI9b/6l+
 8lZhpZYCG5Oi7vSkCLyOt/sbAKL9eg/XzuysqnzFMaBmy68Van5YMFm5J9J1+Ht4GHSS
 ka9QbFZH06Y4SA1nBhk31Gswz8uahfhdVPQhtxmhvoACEdNwrA315DjqWU1YjodU0nrb
 FGuoJIEM4vzJZ3YCU/fecCySJhX84xege91X4WSYfNOxcn1lDxObTUbf7XSHsZ6/xoQJ
 k02Q==
X-Gm-Message-State: AOAM531u85/ijXLnMdpmE40zuQrnocIDGzEvnkNEBKVZMvgHbI/Ufk16
 /Z6v26HW81JwFyM8ubWzXwkslQAqf3Qvgw==
X-Google-Smtp-Source: ABdhPJzh+JKEO1SRYL84yrpASWLGXuGK/p1Q7eXT3GrVN64rjtGMT5mSgBRqVWtHaFH6Z7qae48wXg==
X-Received: by 2002:a05:6a00:1f1a:b0:51b:fac8:e00c with SMTP id
 be26-20020a056a001f1a00b0051bfac8e00cmr18055349pfb.26.1654634764547; 
 Tue, 07 Jun 2022 13:46:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 06/53] semihosting: Add target_strlen for softmmu-uaccess.h
Date: Tue,  7 Jun 2022 13:45:10 -0700
Message-Id: <20220607204557.658541-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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


