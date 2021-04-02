Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BAE3530D1
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 23:43:54 +0200 (CEST)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSRa4-0001zN-Un
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 17:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYg-0000EO-Uf
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:27 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYd-0007ey-RZ
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:26 -0400
Received: by mail-pj1-x1030.google.com with SMTP id s21so3243943pjq.1
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2mWsQLvcKb8vumKiyJlzF6R6pJ22LkeGfPO+NZbgZA=;
 b=jRGIYKyktAmAMtRjWC//5Lo6aThqkDvCSnkbMxtOTMqUXFcsCxr14G09idSVY4ea5H
 1ICE8SDyLt0vYS4CHKGuz6qWwVaeTtf53nX5QibSgeAUlIWpjub4NTqpN3RZWwPiiORJ
 Xf2xR7tUHIomWxLb02inIKLEOW/20x7LX3ph+FHbcN2VOFnpe2TY3Ul6NPRruE7z1B4h
 0NHTeN9/4np6k4tY3VDhqZPiMP/UAd/lB8YFWjoT3jD4wre1UJfLUZArO5Hp6C/w/7NT
 SH/9qh5Xr/TARs+HegXkZfXWrvNZnEzdjP6vrIq9jfua4K96Q/0ASy0rD6mZNjBgEKm8
 2/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2mWsQLvcKb8vumKiyJlzF6R6pJ22LkeGfPO+NZbgZA=;
 b=C3pPnqIB1hGuZ8rkzWG8EDP2o1natw8lqvUvbbTDbvXZgKnMleXTTd+HtfsG5xjPRX
 5xGQDvwxtQAJQy2k1CG2H4iqry3t5NHlDDbddEF8SqNmLoM61dfLFI2M9oXBrJLFj3pr
 QIosE10ZJNVwJFtVYiO23osmdnbtuJrO2+ry/qyF0e4T4+TNbetsNUwIDGpwcb33pge+
 dRbk33oWrltjfzERx3c4jmFQ4oCDVtEbIo0wJh8tVLqLhZ2s2ymwIxeWTBN3kHWEeOJo
 iQiXjc6OwZzyY+b14MxHUV7TRseuXTklpU+pMFP6ofM/y9bDZgh/K80H8jMwmD1p1bz0
 CqlQ==
X-Gm-Message-State: AOAM533wgzBHAX2+hNfJbLuL404VTjbPoI6lqZDZD12TgaJjMbfaumxW
 BSPkmuorNt+pevsxyH6pNzOA9f+bEcb+rg==
X-Google-Smtp-Source: ABdhPJxZgrmpX6sBdN5g32JeLfGGYPOUuAXSfr5TztW145XTW5R/iwqyewlmhiA3DiJlbbSFapRemw==
X-Received: by 2002:a17:90a:b108:: with SMTP id
 z8mr1310978pjq.77.1617399741751; 
 Fri, 02 Apr 2021 14:42:21 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/11] accel/tcg: Preserve PAGE_ANON when changing page
 permissions
Date: Fri,  2 Apr 2021 14:42:07 -0700
Message-Id: <20210402214217.422585-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using mprotect() to change PROT_* does not change the MAP_ANON
previously set with mmap().  Our linux-user version of MTE only
works with MAP_ANON pages, so losing PAGE_ANON caused MTE to
stop working.

Reported-by: Stephen Long <steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte.h           |  3 ++-
 accel/tcg/translate-all.c         |  9 +++++--
 tests/tcg/aarch64/mte-6.c         | 43 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 4 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-6.c

diff --git a/tests/tcg/aarch64/mte.h b/tests/tcg/aarch64/mte.h
index 141cef522c..0805676b11 100644
--- a/tests/tcg/aarch64/mte.h
+++ b/tests/tcg/aarch64/mte.h
@@ -48,7 +48,8 @@ static void enable_mte(int tcf)
     }
 }
 
-static void *alloc_mte_mem(size_t size)
+static void * alloc_mte_mem(size_t size) __attribute__((unused));
+static void * alloc_mte_mem(size_t size)
 {
     void *p = mmap(NULL, size, PROT_READ | PROT_WRITE | PROT_MTE,
                    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f32df8b240..ba6ab09790 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2714,6 +2714,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
        a missing call to h2g_valid.  */
     assert(end - 1 <= GUEST_ADDR_MAX);
     assert(start < end);
+    /* Only set PAGE_ANON with new mappings. */
+    assert(!(flags & PAGE_ANON) || (flags & PAGE_RESET));
     assert_memory_lock();
 
     start = start & TARGET_PAGE_MASK;
@@ -2737,11 +2739,14 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
             p->first_tb) {
             tb_invalidate_phys_page(addr, 0);
         }
-        if (reset_target_data && p->target_data) {
+        if (reset_target_data) {
             g_free(p->target_data);
             p->target_data = NULL;
+            p->flags = flags;
+        } else {
+            /* Using mprotect on a page does not change MAP_ANON. */
+            p->flags = (p->flags & PAGE_ANON) | flags;
         }
-        p->flags = flags;
     }
 }
 
diff --git a/tests/tcg/aarch64/mte-6.c b/tests/tcg/aarch64/mte-6.c
new file mode 100644
index 0000000000..60d51d18be
--- /dev/null
+++ b/tests/tcg/aarch64/mte-6.c
@@ -0,0 +1,43 @@
+#include "mte.h"
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(info->si_code == SEGV_MTESERR);
+    exit(0);
+}
+
+int main(void)
+{
+    enable_mte(PR_MTE_TCF_SYNC);
+
+    void *brk = sbrk(16);
+    if (brk == (void *)-1) {
+        perror("sbrk");
+        return 2;
+    }
+
+    if (mprotect(brk, 16, PROT_READ | PROT_WRITE | PROT_MTE)) {
+        perror("mprotect");
+        return 2;
+    }
+
+    int *p1, *p2;
+    long excl = 1;
+
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(brk), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r"(p1));
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(brk), "r"(excl));
+    asm("stg %0,[%0]" : : "r"(p1));
+
+    *p1 = 0;
+
+    struct sigaction sa;
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    *p2 = 0;
+
+    abort();
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 56e48f4b34..05b2622bfc 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -37,7 +37,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-6
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-- 
2.25.1


