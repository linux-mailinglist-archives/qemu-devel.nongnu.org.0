Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D50D614054
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:03:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcrI-00064V-EU; Mon, 31 Oct 2022 18:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcqz-0005YB-IZ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:59 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcqj-0001Ms-KR
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:49 -0400
Received: by mail-io1-xd2f.google.com with SMTP id p184so10915588iof.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p5pSoZP8flpR+zy8VVBNx48l3eYCAiXbKfe8EtMZICo=;
 b=RbS5xbnEvbXKRZtRdJP78X+Rzst6xzsKb35fcVvbGfAFYJhGU7hUvqqwa5kZiVWWLu
 IEYlteBIXC7qUaI+YUw/rNk+fwR/Ipv7EKkxbjdII3e2GMCMoml3zmglSSGCRa4xqYMV
 rEqFzZ3Nu8N6EQSuSVjLjipTrYzdRuYXn4urUvZ84QlcobVGgV+0YyKQqQqsC5hWd+ev
 Zt8+N1s0qVT3D2boppH+hXnk0D5R3BMhHk+Yba8gl/TWrQbvVHtnJmg1s9bCakgxCcHG
 mqPPcd1PqmO/PrEqq1/RcIrWouxDCbNXiAULCr89h+YQ55UItfixLPp/CBiOseaiEX2K
 UnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p5pSoZP8flpR+zy8VVBNx48l3eYCAiXbKfe8EtMZICo=;
 b=Uk8iHM2omifycXW+mbkpeLexKzBMoxo5wG+A1GkfIksnaVairjSym0vMTtKTF4BL7k
 HOfMpVO/mcq9ewpL3PVKPSNniXJ1axH04nCvwQfARxNOM2okGluQMUD2cSZv9bKSMDtX
 U5ogmmcJMBSX69Y/mkyfK+KrAX9a29elctjkaDi163brLrgoS7XzCkW/1oWjS3YNp/Ng
 /JHJQ7PVdJz3WaaWlWqA2AzexJlPyRb7hQLQDVzAn+P0qKIcTEHNs68H3rDWdCnZKcRH
 0FFj4JdejyGD3pNjj35Sq9i13iGWuXoiGDvFstQXnqmuDLhIgI2NmPkuHn2IdV5d3lF/
 OgXA==
X-Gm-Message-State: ACrzQf2jqV6AZW7xl/RdEkFdweqTFWGUQwb2SP2g6wgH0PwnnaDTuOd0
 mA+zHmR+fph2yg0m87EXpUlx1DJYhQY6hw==
X-Google-Smtp-Source: AMsMyM5UE3KL6OWrCsVtE7XkCRirYGNQ0e5DlltOjA7MgiOLPcbfZVHsXcgOXx/KC0Rbo6e8upFN6g==
X-Received: by 2002:a05:6638:f13:b0:375:4ae5:6be7 with SMTP id
 h19-20020a0566380f1300b003754ae56be7mr7114147jas.57.1667253700361; 
 Mon, 31 Oct 2022 15:01:40 -0700 (PDT)
Received: from stoup.. ([172.58.176.58]) by smtp.gmail.com with ESMTPSA id
 s7-20020a02c507000000b00363ec4dcaacsm3203039jam.22.2022.10.31.15.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:01:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v2 13/13] tests/tcg/multiarch: Add munmap-pthread.c
Date: Tue,  1 Nov 2022 09:01:13 +1100
Message-Id: <20221031220113.414796-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031220113.414796-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
 <20221031220113.414796-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a test to detect races between munmap() and creating new threads.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221028124227.2354792-3-iii@linux.ibm.com>
[rth: add more return insns]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/munmap-pthread.c | 79 ++++++++++++++++++++++++++++
 tests/tcg/multiarch/Makefile.target  |  3 ++
 2 files changed, 82 insertions(+)
 create mode 100644 tests/tcg/multiarch/munmap-pthread.c

diff --git a/tests/tcg/multiarch/munmap-pthread.c b/tests/tcg/multiarch/munmap-pthread.c
new file mode 100644
index 0000000000..d7143b00d5
--- /dev/null
+++ b/tests/tcg/multiarch/munmap-pthread.c
@@ -0,0 +1,79 @@
+/* Test that munmap() and thread creation do not race. */
+#include <assert.h>
+#include <pthread.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+static const char nop_func[] = {
+#if defined(__aarch64__)
+    0xc0, 0x03, 0x5f, 0xd6,     /* ret */
+#elif defined(__alpha__)
+    0x01, 0x80, 0xFA, 0x6B,     /* ret */
+#elif defined(__arm__)
+    0x1e, 0xff, 0x2f, 0xe1,     /* bx lr */
+#elif defined(__riscv)
+    0x67, 0x80, 0x00, 0x00,     /* ret */
+#elif defined(__s390__)
+    0x07, 0xfe,                 /* br %r14 */
+#elif defined(__i386__) || defined(__x86_64__)
+    0xc3,                       /* ret */
+#endif
+};
+
+static void *thread_mmap_munmap(void *arg)
+{
+    volatile bool *run = arg;
+    char *p;
+    int ret;
+
+    while (*run) {
+        p = mmap(NULL, getpagesize(), PROT_READ | PROT_WRITE | PROT_EXEC,
+                 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+        assert(p != MAP_FAILED);
+
+        /* Create a small translation block.  */
+        memcpy(p, nop_func, sizeof(nop_func));
+        ((void(*)(void))p)();
+
+        ret = munmap(p, getpagesize());
+        assert(ret == 0);
+    }
+
+    return NULL;
+}
+
+static void *thread_dummy(void *arg)
+{
+    return NULL;
+}
+
+int main(void)
+{
+    pthread_t mmap_munmap, dummy;
+    volatile bool run = true;
+    int i, ret;
+
+    /* Without a template, nothing to test. */
+    if (sizeof(nop_func) == 0) {
+        return EXIT_SUCCESS;
+    }
+
+    ret = pthread_create(&mmap_munmap, NULL, thread_mmap_munmap, (void *)&run);
+    assert(ret == 0);
+
+    for (i = 0; i < 1000; i++) {
+        ret = pthread_create(&dummy, NULL, thread_dummy, NULL);
+        assert(ret == 0);
+        ret = pthread_join(dummy, NULL);
+        assert(ret == 0);
+    }
+
+    run = false;
+    ret = pthread_join(mmap_munmap, NULL);
+    assert(ret == 0);
+
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 78104f9bbb..5f0fee1aad 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -36,6 +36,9 @@ threadcount: LDFLAGS+=-lpthread
 
 signals: LDFLAGS+=-lrt -lpthread
 
+munmap-pthread: CFLAGS+=-pthread
+munmap-pthread: LDFLAGS+=-pthread
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
-- 
2.34.1


