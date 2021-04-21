Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB01366CE1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 15:31:51 +0200 (CEST)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZCxK-0005q3-5M
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 09:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZCvd-0005Hj-Te
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 09:30:06 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZCvR-0003ux-Fe
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 09:30:04 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w4so37664326wrt.5
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 06:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BJfu66hpwqKSDmT3Uj9sIFfOd0WhdWmICqq9eKV8meY=;
 b=jPbdCErjN8rbkdv0bT02LT5Kv37eCLmqytg6SgK9munkqbI4GsIPt6sz9V5ugkBtbr
 upya2Es7V+c5aFFdXg3cl2W8QP6F4Q0uXvtKugrhjKNoCBXdmq0TbOhIe7oXUbWxQpEk
 7a7HuYWDSZfpQVS9Pm4y2Mv7hx1UiiwnfN0/++jW5aYvJ/MvVyC8OsJHRydgh4WpLFRy
 vWSH1pH24aPIoP9/vRgdwFhhrTEMJVd9cp/pzKp+A5UJLreaKe78GSAVujgKubK902t2
 rqi951jkHwFmjr4X5rcFAC4rytK2dnxl16iWdG+TntgkQKN07QDi1aXd37KELHR12fEj
 hQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BJfu66hpwqKSDmT3Uj9sIFfOd0WhdWmICqq9eKV8meY=;
 b=eucS3Gm+1vso/lZ25d4cNgglsUfcSzMQ3Xb7KCIoU8GecycyTaPsivnlOiCDE7a1Ey
 OSiSJpElOam5HR6/bfzguLw1VetEjN8NRmcx3G/X8fGkJfeUfP82XhvKq/ZILoDZNLhr
 LqO90t4HfQlHJHfBPhqf8GAJ7R/0V5KRRjmz5rEoVA430WYSC1hHFc7Y14fxe42wCEA+
 cHlVQVzsFxNhRgT2ZW/QM+H8dvXpZGoHAwBWqR2AuUFO9Dv7fYj2tTd9HmA55IbcnKA7
 uuoFq2fKw7Pi9nVZIFBZMAiG7itHK3K+7RS1dixW22zWCDnwNLTGRwrnaxSrMSXhvONt
 E+Og==
X-Gm-Message-State: AOAM533wWwyN01a6cYA7CnAAqil4qPD24Rhmr/YCnp8awN3gDu/k+QPn
 UNM5jgp/zkhzZGtJHieDJFYmGA==
X-Google-Smtp-Source: ABdhPJzXClpFqwJMoekn8LkyS1pCrJmephN9BlexgOfz+1cT9NvHN5aPCebXx0AXeHVL1FEnUze1Eg==
X-Received: by 2002:adf:d1e1:: with SMTP id g1mr27770697wrd.218.1619011790383; 
 Wed, 21 Apr 2021 06:29:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f6sm2991646wrt.19.2021.04.21.06.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 06:29:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D00851FF7E;
 Wed, 21 Apr 2021 14:29:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/tcg: add a multiarch signals test to stress test
 signal delivery
Date: Wed, 21 Apr 2021 14:29:31 +0100
Message-Id: <20210421132931.11127-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a simple signal test that combines the POSIX timer_create
with signal delivery across multiple threads.

[AJB: So I wrote this in an attempt to flush out issues with the
s390x-linux-user handling. However I suspect I've done something wrong
or opened a can of signal handling worms.

Nominally this runs fine on real hardware but I variously get failures
when running it under translation and while debugging QEMU running the
test. I've also exposed a shortcomming with the gdb stub when dealing
with guest TLS data so yay ;-). So I post this as an RFC in case
anyone else can offer insight or can verify they are seeing the same
strange behaviour?]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/signals.c       | 149 ++++++++++++++++++++++++++++
 tests/tcg/multiarch/Makefile.target |   2 +
 2 files changed, 151 insertions(+)
 create mode 100644 tests/tcg/multiarch/signals.c

diff --git a/tests/tcg/multiarch/signals.c b/tests/tcg/multiarch/signals.c
new file mode 100644
index 0000000000..998c8fdefd
--- /dev/null
+++ b/tests/tcg/multiarch/signals.c
@@ -0,0 +1,149 @@
+/*
+ * linux-user signal handling tests.
+ *
+ * Copyright (c) 2021 Linaro Ltd
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <stdarg.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <errno.h>
+#include <pthread.h>
+#include <string.h>
+#include <signal.h>
+#include <time.h>
+#include <sys/time.h>
+
+static void error1(const char *filename, int line, const char *fmt, ...)
+{
+    va_list ap;
+    va_start(ap, fmt);
+    fprintf(stderr, "%s:%d: ", filename, line);
+    vfprintf(stderr, fmt, ap);
+    fprintf(stderr, "\n");
+    va_end(ap);
+    exit(1);
+}
+
+static int __chk_error(const char *filename, int line, int ret)
+{
+    if (ret < 0) {
+        error1(filename, line, "%m (ret=%d, errno=%d/%s)",
+               ret, errno, strerror(errno));
+    }
+    return ret;
+}
+
+#define error(fmt, ...) error1(__FILE__, __LINE__, fmt, ## __VA_ARGS__)
+
+#define chk_error(ret) __chk_error(__FILE__, __LINE__, (ret))
+
+/*
+ * Thread handling
+ */
+typedef struct ThreadJob ThreadJob;
+
+struct ThreadJob {
+    int number;
+    int sleep;
+    int count;
+};
+
+static pthread_t *threads;
+static int max_threads = 10;
+__thread int signal_count;
+int total_signal_count;
+
+static void *background_thread_func(void *arg)
+{
+    ThreadJob *job = (ThreadJob *) arg;
+
+    printf("thread%d: started\n", job->number);
+    while (total_signal_count < job->count) {
+        usleep(job->sleep);
+    }
+    printf("thread%d: saw %d alarms from %d\n", job->number,
+           signal_count, total_signal_count);
+    return NULL;
+}
+
+static void spawn_threads(void)
+{
+    int i;
+    threads = calloc(sizeof(pthread_t), max_threads);
+
+    for (i = 0; i < max_threads; i++) {
+        ThreadJob *job = calloc(sizeof(ThreadJob), 1);
+        job->number = i;
+        job->sleep = i * 1000;
+        job->count = i * 100;
+        pthread_create(threads + i, NULL, background_thread_func, job);
+    }
+}
+
+static void close_threads(void)
+{
+    int i;
+    for (i = 0; i < max_threads; i++) {
+        pthread_join(threads[i], NULL);
+    }
+    free(threads);
+    threads = NULL;
+}
+
+static void sig_alarm(int sig, siginfo_t *info, void *puc)
+{
+    if (sig != SIGRTMIN) {
+        error("unexpected signal");
+    }
+    signal_count++;
+    __atomic_fetch_add(&total_signal_count, 1, __ATOMIC_SEQ_CST);
+}
+
+static void test_signals(void)
+{
+    struct sigaction act;
+    struct itimerspec it;
+    timer_t tid;
+    struct sigevent sev;
+
+    /* Set up SIG handler */
+    act.sa_sigaction = sig_alarm;
+    sigemptyset(&act.sa_mask);
+    act.sa_flags = SA_SIGINFO;
+    chk_error(sigaction(SIGRTMIN, &act, NULL));
+
+    /* Create POSIX timer */
+    sev.sigev_notify = SIGEV_SIGNAL;
+    sev.sigev_signo = SIGRTMIN;
+    sev.sigev_value.sival_ptr = &tid;
+    chk_error(timer_create(CLOCK_REALTIME, &sev, &tid));
+
+    it.it_interval.tv_sec = 0;
+    it.it_interval.tv_nsec = 1000000;
+    it.it_value.tv_sec = 0;
+    it.it_value.tv_nsec = 1000000;
+    chk_error(timer_settime(tid, 0, &it, NULL));
+
+    spawn_threads();
+
+    do {
+        usleep(1000);
+    } while (total_signal_count < 2000);
+
+    printf("shutting down after: %d signals\n", total_signal_count);
+
+    close_threads();
+
+    chk_error(timer_delete(tid));
+}
+
+int main(int argc, char **argv)
+{
+    test_signals();
+    return 0;
+}
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index a3a751723d..3f283eabe6 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -30,6 +30,8 @@ testthread: LDFLAGS+=-lpthread
 
 threadcount: LDFLAGS+=-lpthread
 
+signals: LDFLAGS+=-lrt -lpthread
+
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
 # additional page sizes are defined we only run the default test.
-- 
2.20.1


