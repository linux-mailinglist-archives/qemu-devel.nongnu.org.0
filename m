Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280753530E2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 23:48:37 +0200 (CEST)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSRee-0000zN-6m
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 17:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYn-0000WD-C9
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:33 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYj-0007ic-MW
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:33 -0400
Received: by mail-pg1-x536.google.com with SMTP id i6so4295016pgs.1
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
 b=sJ+fRRKRHVe4k1QdnpvFL3P9/4rCwCNXUKcyDTJaKzpzdwZmTWi+X3FpCGgjLYqkUp
 5D3Vdml6HWQXZu4mQh8F2VmyJ+23OO+aR4wx90EDfkkdzJIZWAhc0msVTopSgqTb2Oz6
 SnEbPrH0V8kr18hfobM/a3d1tNNQgUWOPUUk2yRbfFGA33yj6wp5kGG2kQ8G24Lfbxbb
 SUqIOBvkt7ygia4CV5b12NC4jhzZ2HYq48XVlbTDCi5R/I5UjAytkw2ZpgAny77ArJRo
 iwKyRdj6Mgbw6qeZ0emZR8O4DwbTi7RnOvOflokaY2swRT5+OkWnn1ok79U5W5UVm2KL
 BmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7i6Gze7kec69WvQyswSUuzpscM5477tzDtA09nT/yo=;
 b=p5e3JuJBKleenCAgeCVF+OyHy52yACQCc3H/aisf8T8L9L87/1hsc6aCOSJkNjTLPv
 nS/uwj7atAHsylRhmckTqhB0nXJEnyA821Ndj/ET4Z29Uxy/H5RV1dyTM53diwdla8Tz
 02kYvcgyAMVDEihA7MLhS1AHvZTQFGW9uQ8sxvm1+6OxR10Rcd/NJeEg2zViM4Aowrks
 rxJ/1sNYcTHDGZXc5cu7KecUOHCbYlyAUKa89NPmRHak4FTm/A/3etW6G54FnIRcMwHz
 LjcOXOWOPoT4mYyFj6HY/z2CQSANnu1fpWYNkCewpCZT/4DPcx+9phhoiYYr5pN88vpd
 dFzA==
X-Gm-Message-State: AOAM5325LdqA56bb50y4fDcMopUnz2LGPeHdPjKyl4YK2tDkNwMbmSJI
 RVzw1FUMAqAUUcHXXZIDkgFOZ1dN3xgHmQ==
X-Google-Smtp-Source: ABdhPJwJQfdc0+358mDvt2QFHXWQp/J87n7/6Q8Xo89QgFVk1d385Wk2c5OsT8uQiPzzjW7KzrgDWw==
X-Received: by 2002:a63:d40b:: with SMTP id a11mr13262929pgh.192.1617399748187; 
 Fri, 02 Apr 2021 14:42:28 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/11] test/tcg/aarch64: Add mte-5
Date: Fri,  2 Apr 2021 14:42:12 -0700
Message-Id: <20210402214217.422585-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402214217.422585-1-richard.henderson@linaro.org>
References: <20210402214217.422585-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Buglink: https://bugs.launchpad.net/bugs/1921948
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte-5.c         | 44 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c

diff --git a/tests/tcg/aarch64/mte-5.c b/tests/tcg/aarch64/mte-5.c
new file mode 100644
index 0000000000..6dbd6ab3ea
--- /dev/null
+++ b/tests/tcg/aarch64/mte-5.c
@@ -0,0 +1,44 @@
+/*
+ * Memory tagging, faulting unaligned access.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(info->si_code == SEGV_MTESERR);
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    struct sigaction sa;
+    void *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_SYNC);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    /* Create two differently tagged pointers.  */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    /* Store store two different tags in sequential granules. */
+    asm("stg %0, [%0]" : : "r"(p1));
+    asm("stg %0, [%0]" : : "r"(p2 + 16));
+
+    /* Perform an unaligned load crossing the granules. */
+    asm volatile("ldr %0, [%1]" : "=r"(p0) : "r"(p1 + 12));
+    abort();
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 05b2622bfc..928357b10a 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -37,7 +37,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-6
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-- 
2.25.1


