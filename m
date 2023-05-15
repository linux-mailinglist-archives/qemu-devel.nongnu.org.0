Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC10F702E32
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:35:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsJ-0006n0-Vv; Mon, 15 May 2023 09:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqw-0004Yu-Ov
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqt-00012g-2p
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/4X6MK/S7xN5LnUoBNIy7QnZbS2togEUduLC8ZtGGhY=;
 b=bCK8hrPdNFSsXW5ojV9w98s99wdXX6PDaA/V4phHAxmsG3vogVIFFNEdDQDms8jdkp4Z/J
 8kR/p5JcYQ++Kse2dsHFytfJKwDMWo/zQr0I5Z76zXQwqj2QJZJp5yuCGEm5Q/tLZCbx6i
 S/3j0T5U0om4uPjuFR0Wk8fTbWE8KIE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-J0jsRpNVPy-T0F4FJ6SOiA-1; Mon, 15 May 2023 09:02:56 -0400
X-MC-Unique: J0jsRpNVPy-T0F4FJ6SOiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86C0E891771;
 Mon, 15 May 2023 13:02:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A17E840C6EC4;
 Mon, 15 May 2023 13:02:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Boris Fiuczynski <fiuczy@linux.ibm.com>
Subject: [PULL 09/21] util/async-teardown: wire up query-command-line-options
Date: Mon, 15 May 2023 15:02:21 +0200
Message-Id: <20230515130233.418183-10-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Claudio Imbrenda <imbrenda@linux.ibm.com>

Add new -run-with option with an async-teardown=on|off parameter. It is
visible in the output of query-command-line-options QMP command, so it
can be discovered and used by libvirt.

The option -async-teardown is now redundant, deprecate it.

Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Message-Id: <20230505120051.36605-2-imbrenda@linux.ibm.com>
[thuth: Add curly braces to fix error with GCC 8.5, fix bug in deprecated.rst]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst |  5 +++++
 os-posix.c                | 14 ++++++++++++++
 util/async-teardown.c     | 21 +++++++++++++++++++++
 qemu-options.hx           | 34 +++++++++++++++++++++++-----------
 4 files changed, 63 insertions(+), 11 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 4c7f08803e..7bb4d2f4f6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -111,6 +111,11 @@ Use ``-machine acpi=off`` instead.
 The HAXM project has been retired (see https://github.com/intel/haxm#status).
 Use "whpx" (on Windows) or "hvf" (on macOS) instead.
 
+``-async-teardown`` (since 8.1)
+'''''''''''''''''''''''''''''''
+
+Use ``-run-with async-teardown=on`` instead.
+
 ``-singlestep`` (since 8.1)
 '''''''''''''''''''''''''''
 
diff --git a/os-posix.c b/os-posix.c
index 5adc69f560..90ea71725f 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -36,6 +36,8 @@
 #include "qemu/log.h"
 #include "sysemu/runstate.h"
 #include "qemu/cutils.h"
+#include "qemu/config-file.h"
+#include "qemu/option.h"
 
 #ifdef CONFIG_LINUX
 #include <sys/prctl.h>
@@ -152,9 +154,21 @@ int os_parse_cmd_args(int index, const char *optarg)
         daemonize = 1;
         break;
 #if defined(CONFIG_LINUX)
+    /* deprecated */
     case QEMU_OPTION_asyncteardown:
         init_async_teardown();
         break;
+    case QEMU_OPTION_run_with: {
+        QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("run-with"),
+                                                 optarg, false);
+        if (!opts) {
+            exit(1);
+        }
+        if (qemu_opt_get_bool(opts, "async-teardown", false)) {
+            init_async_teardown();
+        }
+        break;
+    }
 #endif
     default:
         return -1;
diff --git a/util/async-teardown.c b/util/async-teardown.c
index 62cdeb0f20..3ab19c8740 100644
--- a/util/async-teardown.c
+++ b/util/async-teardown.c
@@ -12,6 +12,9 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/config-file.h"
+#include "qemu/option.h"
+#include "qemu/module.h"
 #include <dirent.h>
 #include <sys/prctl.h>
 #include <sched.h>
@@ -144,3 +147,21 @@ void init_async_teardown(void)
     clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
     sigprocmask(SIG_SETMASK, &old_signals, NULL);
 }
+
+static QemuOptsList qemu_run_with_opts = {
+    .name = "run-with",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_run_with_opts.head),
+    .desc = {
+        {
+            .name = "async-teardown",
+            .type = QEMU_OPT_BOOL,
+        },
+        { /* end of list */ }
+    },
+};
+
+static void register_teardown(void)
+{
+    qemu_add_opts(&qemu_run_with_opts);
+}
+opts_init(register_teardown);
diff --git a/qemu-options.hx b/qemu-options.hx
index 42b9094c10..30690d9c3f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4828,20 +4828,32 @@ DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
 DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
     "-async-teardown enable asynchronous teardown\n",
     QEMU_ARCH_ALL)
-#endif
 SRST
 ``-async-teardown``
-    Enable asynchronous teardown. A new process called "cleanup/<QEMU_PID>"
-    will be created at startup sharing the address space with the main qemu
-    process, using clone. It will wait for the main qemu process to
-    terminate completely, and then exit.
-    This allows qemu to terminate very quickly even if the guest was
-    huge, leaving the teardown of the address space to the cleanup
-    process. Since the cleanup process shares the same cgroups as the
-    main qemu process, accounting is performed correctly. This only
-    works if the cleanup process is not forcefully killed with SIGKILL
-    before the main qemu process has terminated completely.
+    This option is deprecated and should no longer be used. The new option
+    ``-run-with async-teardown=on`` is a replacement.
 ERST
+DEF("run-with", HAS_ARG, QEMU_OPTION_run_with,
+    "-run-with async-teardown[=on|off]\n"
+    "                misc QEMU process lifecycle options\n"
+    "                async-teardown=on enables asynchronous teardown\n",
+    QEMU_ARCH_ALL)
+SRST
+``-run-with``
+    Set QEMU process lifecycle options.
+
+    ``async-teardown=on`` enables asynchronous teardown. A new process called
+    "cleanup/<QEMU_PID>" will be created at startup sharing the address
+    space with the main QEMU process, using clone. It will wait for the
+    main QEMU process to terminate completely, and then exit. This allows
+    QEMU to terminate very quickly even if the guest was huge, leaving the
+    teardown of the address space to the cleanup process. Since the cleanup
+    process shares the same cgroups as the main QEMU process, accounting is
+    performed correctly. This only works if the cleanup process is not
+    forcefully killed with SIGKILL before the main QEMU process has
+    terminated completely.
+ERST
+#endif
 
 DEF("msg", HAS_ARG, QEMU_OPTION_msg,
     "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
-- 
2.31.1


