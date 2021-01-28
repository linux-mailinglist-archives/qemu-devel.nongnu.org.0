Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D833081A9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 00:06:27 +0100 (CET)
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GMs-0003yS-Hf
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 18:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzm-00064x-Hz
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:34 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzc-0008F9-AB
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:34 -0500
Received: by mail-pf1-x429.google.com with SMTP id i63so4966029pfg.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HKtHUyeX46/E9EoVvwvRWE1/PXHFC9tVF6JjxX+JLd4=;
 b=YYg6OH7Z73IlMQyvPM01NdWvtipolaDlWRVbDrgk6X5tBSWv0iuqTuRzf/3FdrkEgJ
 gCluzxNeI5KRLfUgJiFYzvd6w2LWCFX/LqC3nbhZg5WXfz2ZVT1Vh1J4qovo+RUC6Kys
 NXhEywqrUW5AWYatQk/W9HLgE+WQw0jYB60HK5tBUHzqik2siBYmMDcHwgUNK1b5XcX2
 uveoWvQK54EktXycrMDojnyGWWO6vmE1woE4/5HV87fvQDvJLnV+CBlo+QoiQuAHezNR
 jM538vbv5O8c7BGIWm4KdXctH+fYQVO28b1KOcaRoy0VK5IO2klGGCw37X+LIPlt90V0
 G0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HKtHUyeX46/E9EoVvwvRWE1/PXHFC9tVF6JjxX+JLd4=;
 b=WfnDqc6raOZO5UjueultXYMGt+KrU3Srj36Mu2uoJBinJjHHhZDFBrcnh4NA5Le2JY
 ThZwK3KZi+fHWoUojimu3yPv/9NRyriCw/PB55stqTuEtmgJZSpOrPjO6KhaAl6VuTtw
 RBJqsJywntXvUFaXxiMyI5MrVkrft1szDmbGqXmGLgNF8X/GYqP3Gd/WdnKRb4H/cWYM
 8w7d3JLWFphud4CroFhyxnU1doj7pcKURFHekkPaIBBxnPYhP3fE/yuPV+kQZoHbLJjs
 Yjakeovtt3LbCRBpheLSvgzOqayhUCpVO0K30SPxVY3hjHDC7uqawoEUCZ7O9LLWTaII
 U0kw==
X-Gm-Message-State: AOAM532qeE9K0xu+jD88I+iQkmweps4w840J6j7LwmE0L2QFEmB66dOT
 ftOiiPtcmptuSJ04nQAuVIWWiM6vRtGPJYdV
X-Google-Smtp-Source: ABdhPJxDijDPc/+P7djzgykFzeG67JGObz2bAhqWRWXQrK8yooy0NKK4iBkJRrX4Kiyz8N/wuzYfKQ==
X-Received: by 2002:a05:6a00:2d5:b029:1b9:67bd:b60f with SMTP id
 b21-20020a056a0002d5b02901b967bdb60fmr1482173pft.10.1611873742378; 
 Thu, 28 Jan 2021 14:42:22 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/23] tests/tcg/aarch64: Add mte smoke tests
Date: Thu, 28 Jan 2021 12:41:41 -1000
Message-Id: <20210128224141.638790-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte.h           | 60 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/mte-1.c         | 28 +++++++++++++++
 tests/tcg/aarch64/mte-2.c         | 45 +++++++++++++++++++++++
 tests/tcg/aarch64/mte-3.c         | 51 ++++++++++++++++++++++++++
 tests/tcg/aarch64/mte-4.c         | 45 +++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  6 ++++
 tests/tcg/configure.sh            |  4 +++
 7 files changed, 239 insertions(+)
 create mode 100644 tests/tcg/aarch64/mte.h
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c
 create mode 100644 tests/tcg/aarch64/mte-3.c
 create mode 100644 tests/tcg/aarch64/mte-4.c

diff --git a/tests/tcg/aarch64/mte.h b/tests/tcg/aarch64/mte.h
new file mode 100644
index 0000000000..141cef522c
--- /dev/null
+++ b/tests/tcg/aarch64/mte.h
@@ -0,0 +1,60 @@
+/*
+ * Linux kernel fallback API definitions for MTE and test helpers.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <assert.h>
+#include <string.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <unistd.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+
+#ifndef PR_SET_TAGGED_ADDR_CTRL
+# define PR_SET_TAGGED_ADDR_CTRL  55
+#endif
+#ifndef PR_TAGGED_ADDR_ENABLE
+# define PR_TAGGED_ADDR_ENABLE    (1UL << 0)
+#endif
+#ifndef PR_MTE_TCF_SHIFT
+# define PR_MTE_TCF_SHIFT         1
+# define PR_MTE_TCF_NONE          (0UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_SYNC          (1UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TCF_ASYNC         (2UL << PR_MTE_TCF_SHIFT)
+# define PR_MTE_TAG_SHIFT         3
+#endif
+
+#ifndef PROT_MTE
+# define PROT_MTE 0x20
+#endif
+
+#ifndef SEGV_MTEAERR
+# define SEGV_MTEAERR    8
+# define SEGV_MTESERR    9
+#endif
+
+static void enable_mte(int tcf)
+{
+    int r = prctl(PR_SET_TAGGED_ADDR_CTRL,
+                  PR_TAGGED_ADDR_ENABLE | tcf | (0xfffe << PR_MTE_TAG_SHIFT),
+                  0, 0, 0);
+    if (r < 0) {
+        perror("PR_SET_TAGGED_ADDR_CTRL");
+        exit(2);
+    }
+}
+
+static void *alloc_mte_mem(size_t size)
+{
+    void *p = mmap(NULL, size, PROT_READ | PROT_WRITE | PROT_MTE,
+                   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (p == MAP_FAILED) {
+        perror("mmap PROT_MTE");
+        exit(2);
+    }
+    return p;
+}
diff --git a/tests/tcg/aarch64/mte-1.c b/tests/tcg/aarch64/mte-1.c
new file mode 100644
index 0000000000..88dcd617ad
--- /dev/null
+++ b/tests/tcg/aarch64/mte-1.c
@@ -0,0 +1,28 @@
+/*
+ * Memory tagging, basic pass cases.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+int main(int ac, char **av)
+{
+    int *p0, *p1, *p2;
+    long c;
+
+    enable_mte(PR_MTE_TCF_NONE);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(1));
+    assert(p1 != p0);
+    asm("subp %0,%1,%2" : "=r"(c) : "r"(p0), "r"(p1));
+    assert(c == 0);
+
+    asm("stg %0, [%0]" : : "r"(p1));
+    asm("ldg %0, [%1]" : "=r"(p2) : "r"(p0), "0"(p0));
+    assert(p1 == p2);
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/mte-2.c b/tests/tcg/aarch64/mte-2.c
new file mode 100644
index 0000000000..a62278276a
--- /dev/null
+++ b/tests/tcg/aarch64/mte-2.c
@@ -0,0 +1,45 @@
+/*
+ * Memory tagging, basic fail cases, synchronous signals.
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
+    int *p0, *p1, *p2;
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
+    /* Store the tag from the first pointer.  */
+    asm("stg %0, [%0]" : : "r"(p1));
+
+    *p1 = 0;
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    *p2 = 0;
+
+    abort();
+}
diff --git a/tests/tcg/aarch64/mte-3.c b/tests/tcg/aarch64/mte-3.c
new file mode 100644
index 0000000000..424ea685c2
--- /dev/null
+++ b/tests/tcg/aarch64/mte-3.c
@@ -0,0 +1,51 @@
+/*
+ * Memory tagging, basic fail cases, asynchronous signals.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(info->si_code == SEGV_MTEAERR);
+    exit(0);
+}
+
+int main(int ac, char **av)
+{
+    struct sigaction sa;
+    long *p0, *p1, *p2;
+    long excl = 1;
+
+    enable_mte(PR_MTE_TCF_ASYNC);
+    p0 = alloc_mte_mem(sizeof(*p0));
+
+    /* Create two differently tagged pointers.  */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r" (p1));
+    assert(excl != 1);
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(p0), "r"(excl));
+    assert(p1 != p2);
+
+    /* Store the tag from the first pointer.  */
+    asm("stg %0, [%0]" : : "r"(p1));
+
+    *p1 = 0;
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    /*
+     * Signal for async error will happen eventually.
+     * For a real kernel this should be after the next IRQ (e.g. timer).
+     * For qemu linux-user, we kick the cpu and exit at the next TB.
+     * In either case, loop until this happens (or killed by timeout).
+     * For extra sauce, yield, producing EXCP_YIELD to cpu_loop().
+     */
+    asm("str %0, [%0]; yield" : : "r"(p2));
+    while (1);
+}
diff --git a/tests/tcg/aarch64/mte-4.c b/tests/tcg/aarch64/mte-4.c
new file mode 100644
index 0000000000..a8cc9f5984
--- /dev/null
+++ b/tests/tcg/aarch64/mte-4.c
@@ -0,0 +1,45 @@
+/*
+ * Memory tagging, re-reading tag checks.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "mte.h"
+
+void __attribute__((noinline)) tagset(void *p, size_t size)
+{
+    size_t i;
+    for (i = 0; i < size; i += 16) {
+        asm("stg %0, [%0]" : : "r"(p + i));
+    }
+}
+
+void __attribute__((noinline)) tagcheck(void *p, size_t size)
+{
+    size_t i;
+    void *c;
+
+    for (i = 0; i < size; i += 16) {
+        asm("ldg %0, [%1]" : "=r"(c) : "r"(p + i), "0"(p));
+        assert(c == p);
+    }
+}
+
+int main(int ac, char **av)
+{
+    size_t size = getpagesize() * 4;
+    long excl = 1;
+    int *p0, *p1;
+
+    enable_mte(PR_MTE_TCF_ASYNC);
+    p0 = alloc_mte_mem(size);
+
+    /* Tag the pointer. */
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(p0), "r"(excl));
+
+    tagset(p1, size);
+    tagcheck(p1, size);
+
+    return 0;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index d7d33e293c..bf53ad0087 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -35,6 +35,12 @@ endif
 # bti-2 tests PROT_BTI, so no special compiler support required.
 AARCH64_TESTS += bti-2
 
+# MTE Tests
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4
+mte-%: CFLAGS += -march=armv8.5-a+memtag
+endif
+
 # Semihosting smoke test for linux-user
 AARCH64_TESTS += semihosting
 run-semihosting: semihosting
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index e1b70e25f2..ba8ac9a93e 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -244,6 +244,10 @@ for target in $target_list; do
                -mbranch-protection=standard -o $TMPE $TMPC; then
                 echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
             fi
+            if do_compiler "$target_compiler" $target_compiler_cflags \
+               -march=armv8.5-a+memtag -o $TMPE $TMPC; then
+                echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+            fi
         ;;
     esac
 
-- 
2.25.1


