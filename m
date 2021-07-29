Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856543D9AF7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 03:16:58 +0200 (CEST)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ufO-0005mY-Cn
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 21:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uG6-00011L-Vd
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:50:48 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m8uG4-0004qT-3W
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 20:50:46 -0400
Received: by mail-pl1-x630.google.com with SMTP id i10so4887643pla.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 17:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JXEm0LQzBp7FYdF62IKS2HTHAwaTAwDqUq6VzQ5+a94=;
 b=h9U1jAz/cbR1Vu6b2JV5sTg3+g9p63KkSUhM5QBA7Wluuf50ZX2yp/ZG5S2m7M1w+s
 yiVn7qNPA14mu2M4u87T2bYszEqOO28oB3o6L8U6kpW0tbDC+gZckQ45+vdS3xVzoW4p
 Pd5bMZbPLkW32qzcROJ9jyUn5ewLWJoUM+sUbJF+xNveamBZ+F+SBN+CqM58UXUI2MrR
 Wf0sHXgW+hjnwjeT28w4iNpWeCN8QgTu85YyBU78OQsCVmwqarUEDGXU83Q5SAPapG1Y
 cCAXP3K5hW/7KX+Z5Kt79ViFO2WoFv8FIbeBW4lUJ+bgmUYx034OWYjaXhxYemERwTmE
 LQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXEm0LQzBp7FYdF62IKS2HTHAwaTAwDqUq6VzQ5+a94=;
 b=AyZMzZLaln7M47x4PPPRnqGj8/8LtzZMJRaDxgApp+3R6nnTqB6SL/jZ4xt5W8Htsl
 NdCgKrjUqILpdDHtEzcswi6nEYlGu7J1r9UVleHSmp7QpE22vJNSbXyTo8d/Peugo/cG
 6Z7xnHG2Uh1i9NLYov6Atnfko1ghTVwqwyqpgX7wfmEE2FZ/8AohY3ZL2Mro++cFPclm
 lG+UDwJU8xqiMltW302HGbsICox5Bm1XAYo82bpLTqN01tUMRqGA1sTEEQf+XTs7RpTM
 nJ375FQq0yrjKJKRe29JVlsj7iAwYg1K2HXu7i8VYDdCdkRvVtU+WIf8pbatft1ivfDc
 D9Ow==
X-Gm-Message-State: AOAM532VVmBu6MpVcuGXbDtLSaS5LbolmN1mHA7gdXvzPg2KQ/vnvmWJ
 udWiNHw7guRLQSRLBasWkNWVywB7cDJE6w==
X-Google-Smtp-Source: ABdhPJxGxFswUWY2FlRThQTvul7M9QkHVu0y+g66tQOfnRgqyjh03nBif3OqmCmWcH89gh1jgqLFsg==
X-Received: by 2002:a17:90b:1297:: with SMTP id
 fw23mr2413619pjb.115.1627519842785; 
 Wed, 28 Jul 2021 17:50:42 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.gmail.com with ESMTPSA id gg3sm947137pjb.35.2021.07.28.17.50.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 17:50:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 43/43] tests/tcg/multiarch: Add sigbus.c
Date: Wed, 28 Jul 2021 14:46:47 -1000
Message-Id: <20210729004647.282017-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729004647.282017-1-richard.henderson@linaro.org>
References: <20210729004647.282017-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

A mostly generic test for unaligned access raising SIGBUS.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/sigbus.c | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 tests/tcg/multiarch/sigbus.c

diff --git a/tests/tcg/multiarch/sigbus.c b/tests/tcg/multiarch/sigbus.c
new file mode 100644
index 0000000000..8134c5fd56
--- /dev/null
+++ b/tests/tcg/multiarch/sigbus.c
@@ -0,0 +1,68 @@
+#define _GNU_SOURCE 1
+
+#include <assert.h>
+#include <stdlib.h>
+#include <signal.h>
+#include <endian.h>
+
+
+unsigned long long x = 0x8877665544332211ull;
+void * volatile p = (void *)&x + 1;
+
+void sigbus(int sig, siginfo_t *info, void *uc)
+{
+    assert(sig == SIGBUS);
+    assert(info->si_signo == SIGBUS);
+#ifdef BUS_ADRALN
+    assert(info->si_code == BUS_ADRALN);
+#endif
+    assert(info->si_addr == p);
+    exit(EXIT_SUCCESS);
+}
+
+int main()
+{
+    struct sigaction sa = {
+        .sa_sigaction = sigbus,
+        .sa_flags = SA_SIGINFO
+    };
+    int allow_fail = 0;
+    int tmp;
+
+    tmp = sigaction(SIGBUS, &sa, NULL);
+    assert(tmp == 0);
+
+    /*
+     * Select an operation that's likely to enforce alignment.
+     * On many guests that support unaligned accesses by default,
+     * this is often an atomic operation.
+     */
+#if defined(__aarch64__)
+    asm volatile("ldxr %w0,[%1]" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__alpha__)
+    asm volatile("ldl_l %0,0(%1)" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__arm__)
+    asm volatile("ldrex %0,[%1]" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__powerpc__)
+    asm volatile("lwarx %0,0,%1" : "=r"(tmp) : "r"(p) : "memory");
+#elif defined(__riscv_atomic)
+    asm volatile("lr.w %0,(%1)" : "=r"(tmp) : "r"(p) : "memory");
+#else
+    /* No insn known to fault unaligned -- try for a straight load. */
+    allow_fail = 1;
+    tmp = *(volatile int *)p;
+#endif
+
+    assert(allow_fail);
+
+    /*
+     * We didn't see a signal.
+     * We might as well validate the unaligned load worked.
+     */
+    if (BYTE_ORDER == LITTLE_ENDIAN) {
+        assert(tmp == 0x55443322);
+    } else {
+        assert(tmp == 0x77665544);
+    }
+    return EXIT_SUCCESS;
+}
-- 
2.25.1


