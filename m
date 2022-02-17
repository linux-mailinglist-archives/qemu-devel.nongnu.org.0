Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833FF4B9FE6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:15:00 +0100 (CET)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfgZ-0002vu-JZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQ2-0003WR-W8
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfQ0-00013Q-5L
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UlfZCuqM6LNTZ6yi6YgioUXYuPQd/EaB32+8dI7H61o=;
 b=daeY/+FUhvF9okxHyUObsE3UBQUrUs0EADecfO7bzwLZsZYeyvdyUUviwIGyAvllfe0JIr
 p0aPwC3jQFiJs7ea0Y/9dZEcV6jVNwBn2uqWI1xiITm/mKS+Xc5a8V/gUr/dTiz8ZJgykp
 WQGirbdcMkGVHL4WKkL70p/5vnlUO4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-cMnvNdZkMbCqMWOTHWdAug-1; Thu, 17 Feb 2022 06:57:47 -0500
X-MC-Unique: cMnvNdZkMbCqMWOTHWdAug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F9C6801AA6;
 Thu, 17 Feb 2022 11:57:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A7C5108648D;
 Thu, 17 Feb 2022 11:57:44 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] seccomp: add unit test for seccomp filtering
Date: Thu, 17 Feb 2022 11:57:18 +0000
Message-Id: <20220217115723.1782616-6-berrange@redhat.com>
In-Reply-To: <20220217115723.1782616-1-berrange@redhat.com>
References: <20220217115723.1782616-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The handling of some syscalls / libc function is quite subtle. For
example, 'fork' at a libc level doesn't always correspond to 'fork'
at a syscall level, since the 'clone' syscall is preferred usually.

The unit test will help to detect these kind of problems. A point of
difficulty in writing a test though is that the QEMU build process may
already be confined by seccomp. For example, if running inside a
container. Since we can't predict what filtering might have been applied
already, we are quite conservative and skip all tests if we see any kind
of seccomp filter active.

Acked-by: Eduardo Otubo <otubo@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 MAINTAINERS               |   1 +
 tests/unit/meson.build    |   4 +
 tests/unit/test-seccomp.c | 270 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 275 insertions(+)
 create mode 100644 tests/unit/test-seccomp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b3ae2ab08..1fe647eb08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2982,6 +2982,7 @@ M: Eduardo Otubo <otubo@redhat.com>
 S: Supported
 F: softmmu/qemu-seccomp.c
 F: include/sysemu/seccomp.h
+F: tests/unit/test-seccomp.c
 
 Cryptography
 M: Daniel P. Berrange <berrange@redhat.com>
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 64a5e7bfde..cd06f0eaf5 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -53,6 +53,10 @@ if have_system or have_tools
   tests += {
     'test-qmp-event': [testqapi],
   }
+
+  if seccomp.found()
+    tests += {'test-seccomp': ['../../softmmu/qemu-seccomp.c', seccomp]}
+  endif
 endif
 
 if have_block
diff --git a/tests/unit/test-seccomp.c b/tests/unit/test-seccomp.c
new file mode 100644
index 0000000000..10ab3e8fe5
--- /dev/null
+++ b/tests/unit/test-seccomp.c
@@ -0,0 +1,270 @@
+/*
+ * QEMU seccomp test suite
+ *
+ * Copyright (c) 2021 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/config-file.h"
+#include "qemu/option.h"
+#include "sysemu/seccomp.h"
+#include "qapi/error.h"
+#include "qemu/module.h"
+
+#include <unistd.h>
+#include <sys/syscall.h>
+
+static void test_seccomp_helper(const char *args, bool killed,
+                                int errnum, int (*doit)(void))
+{
+    if (g_test_subprocess()) {
+        QemuOptsList *olist;
+        QemuOpts *opts;
+        int ret;
+
+        module_call_init(MODULE_INIT_OPTS);
+        olist = qemu_find_opts("sandbox");
+        g_assert(olist != NULL);
+
+        opts = qemu_opts_parse_noisily(olist, args, true);
+        g_assert(opts != NULL);
+
+        parse_sandbox(NULL, opts, &error_abort);
+
+        /* Running in a child process */
+        ret = doit();
+
+        if (errnum != 0) {
+            g_assert(ret != 0);
+            g_assert(errno == errnum);
+        } else {
+            g_assert(ret == 0);
+        }
+
+        _exit(0);
+    } else {
+        /* Running in main test process, spawning the child */
+        g_test_trap_subprocess(NULL, 0, 0);
+        if (killed) {
+            g_test_trap_assert_failed();
+        } else {
+            g_test_trap_assert_passed();
+        }
+    }
+}
+
+
+static void test_seccomp_killed(const char *args, int (*doit)(void))
+{
+    test_seccomp_helper(args, true, 0, doit);
+}
+
+static void test_seccomp_errno(const char *args, int errnum, int (*doit)(void))
+{
+    test_seccomp_helper(args, false, errnum, doit);
+}
+
+static void test_seccomp_passed(const char *args, int (*doit)(void))
+{
+    test_seccomp_helper(args, false, 0, doit);
+}
+
+#ifdef SYS_fork
+static int doit_sys_fork(void)
+{
+    int ret = syscall(SYS_fork);
+    if (ret < 0) {
+        return ret;
+    }
+    if (ret == 0) {
+        _exit(0);
+    }
+    return 0;
+}
+
+static void test_seccomp_sys_fork_on_nospawn(void)
+{
+    test_seccomp_killed("on,spawn=deny", doit_sys_fork);
+}
+
+static void test_seccomp_sys_fork_on(void)
+{
+    test_seccomp_passed("on", doit_sys_fork);
+}
+
+static void test_seccomp_sys_fork_off(void)
+{
+    test_seccomp_passed("off", doit_sys_fork);
+}
+#endif
+
+static int doit_fork(void)
+{
+    int ret = fork();
+    if (ret < 0) {
+        return ret;
+    }
+    if (ret == 0) {
+        _exit(0);
+    }
+    return 0;
+}
+
+static void test_seccomp_fork_on_nospawn(void)
+{
+    /* XXX fixme - should be killed */
+    test_seccomp_passed("on,spawn=deny", doit_fork);
+}
+
+static void test_seccomp_fork_on(void)
+{
+    test_seccomp_passed("on", doit_fork);
+}
+
+static void test_seccomp_fork_off(void)
+{
+    test_seccomp_passed("off", doit_fork);
+}
+
+static void *noop(void *arg)
+{
+    return arg;
+}
+
+static int doit_thread(void)
+{
+    pthread_t th;
+    int ret = pthread_create(&th, NULL, noop, NULL);
+    if (ret != 0) {
+        errno = ret;
+        return -1;
+    } else {
+        pthread_join(th, NULL);
+        return 0;
+    }
+}
+
+static void test_seccomp_thread_on(void)
+{
+    test_seccomp_passed("on", doit_thread);
+}
+
+static void test_seccomp_thread_on_nospawn(void)
+{
+    test_seccomp_passed("on,spawn=deny", doit_thread);
+}
+
+static void test_seccomp_thread_off(void)
+{
+    test_seccomp_passed("off", doit_thread);
+}
+
+static int doit_sched(void)
+{
+    struct sched_param param = { .sched_priority = 0 };
+    return sched_setscheduler(getpid(), SCHED_OTHER, &param);
+}
+
+static void test_seccomp_sched_on_nores(void)
+{
+    test_seccomp_errno("on,resourcecontrol=deny", EPERM, doit_sched);
+}
+
+static void test_seccomp_sched_on(void)
+{
+    test_seccomp_passed("on", doit_sched);
+}
+
+static void test_seccomp_sched_off(void)
+{
+    test_seccomp_passed("off", doit_sched);
+}
+
+static bool can_play_with_seccomp(void)
+{
+    g_autofree char *status = NULL;
+    g_auto(GStrv) lines = NULL;
+    size_t i;
+
+    if (!g_file_get_contents("/proc/self/status", &status, NULL, NULL)) {
+        return false;
+    }
+
+    lines = g_strsplit(status, "\n", 0);
+
+    for (i = 0; lines[i] != NULL; i++) {
+        if (g_str_has_prefix(lines[i], "Seccomp:")) {
+            /*
+             * "Seccomp: 1" or "Seccomp: 2" indicate we're already
+             * confined, probably as we're inside a container. In
+             * this case our tests might get unexpected results,
+             * so we can't run reliably
+             */
+            if (!strchr(lines[i], '0')) {
+                return false;
+            }
+
+            return true;
+        }
+    }
+
+    /* Doesn't look like seccomp is enabled in the kernel */
+    return false;
+}
+
+int main(int argc, char **argv)
+{
+    g_test_init(&argc, &argv, NULL);
+    if (can_play_with_seccomp()) {
+#ifdef SYS_fork
+        g_test_add_func("/softmmu/seccomp/sys-fork/on",
+                        test_seccomp_sys_fork_on);
+        g_test_add_func("/softmmu/seccomp/sys-fork/on-nospawn",
+                        test_seccomp_sys_fork_on_nospawn);
+        g_test_add_func("/softmmu/seccomp/sys-fork/off",
+                        test_seccomp_sys_fork_off);
+#endif
+
+        g_test_add_func("/softmmu/seccomp/fork/on",
+                        test_seccomp_fork_on);
+        g_test_add_func("/softmmu/seccomp/fork/on-nospawn",
+                        test_seccomp_fork_on_nospawn);
+        g_test_add_func("/softmmu/seccomp/fork/off",
+                        test_seccomp_fork_off);
+
+        g_test_add_func("/softmmu/seccomp/thread/on",
+                        test_seccomp_thread_on);
+        g_test_add_func("/softmmu/seccomp/thread/on-nospawn",
+                        test_seccomp_thread_on_nospawn);
+        g_test_add_func("/softmmu/seccomp/thread/off",
+                        test_seccomp_thread_off);
+
+        if (doit_sched() == 0) {
+            /*
+             * musl doesn't impl sched_setscheduler, hence
+             * we check above if it works first
+             */
+            g_test_add_func("/softmmu/seccomp/sched/on",
+                            test_seccomp_sched_on);
+            g_test_add_func("/softmmu/seccomp/sched/on-nores",
+                            test_seccomp_sched_on_nores);
+            g_test_add_func("/softmmu/seccomp/sched/off",
+                            test_seccomp_sched_off);
+        }
+    }
+    return g_test_run();
+}
-- 
2.34.1


