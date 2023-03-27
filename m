Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C36CA60C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:36:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgn0y-0005Vk-J3; Mon, 27 Mar 2023 09:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pgn0g-0005UF-Ow
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:35:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pgn0c-00070t-7K
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 09:35:41 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RD4Df6029881; Mon, 27 Mar 2023 13:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=fw89jmihmPbqmAoSKqBitbMEPE7MNX1Jlbq8Yx9Firs=;
 b=i/7EQ7AQV77W3zxi8JvPx+8K7p4Y+77c6LdKdy1oeFOQyQ2aUpg7BppRHzAKkb7/c4xp
 7rfNJmAKz66TY6DwFniYWOpHFVja3rUHCjZw8ftJJTu8AG6LGhwVIeHrl4uv7m/AdSYe
 679fLUtusGFqb5b4TPbJiL+7DDuuTyU+3VrqDmPYfuwx3fgRXOzXSSlKGFysugsEXmKr
 FJP33FSnupQSfoGgE69duz6m3kTF1vlvTHBUGxHc7yfdHrAPYtxGsZc5k+aIBuZh1T5/
 CfbYtaD/QGx2tD1QbuGci+JDOYqILVxfgmGxhC0T5zZXS7j+j8nEhxW9ZsjK6B2wUkhT SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjarua2aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:35:33 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RD7Fff019000;
 Mon, 27 Mar 2023 13:35:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjarua29j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:35:33 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32RAa3YH009344;
 Mon, 27 Mar 2023 13:35:30 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6jts1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 13:35:30 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RDZRP413697694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 13:35:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0DC12004D;
 Mon, 27 Mar 2023 13:35:26 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99A862004B;
 Mon, 27 Mar 2023 13:35:26 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 13:35:26 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v5 1/1] util/async-teardown: wire up query-command-line-options
Date: Mon, 27 Mar 2023 15:35:25 +0200
Message-Id: <20230327133525.50318-2-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327133525.50318-1-imbrenda@linux.ibm.com>
References: <20230327133525.50318-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8z9_ouKq3lhxeNGVk6qZ0ONTmR-otipJ
X-Proofpoint-GUID: P-Rw7mAobjTdTi3duNuHqcbYI3V7Bzgu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270107
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add new -teardown option with an async=on|off parameter. It is visible
in the output of query-command-line-options QMP command, so it can be
discovered and used by libvirt.

The option -async-teardown is now redundant. We'd normally deprecate it
and remove it after a grace period, but it was introduced only in the
previous version and it had no users, since it was not visible in the
query-command-line-options QMP command. Drop it.

Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 docs/about/removed-features.rst |  5 +++++
 os-posix.c                      | 15 +++++++++++++--
 qemu-options.hx                 | 33 +++++++++++++++++++--------------
 util/async-teardown.c           | 21 +++++++++++++++++++++
 4 files changed, 58 insertions(+), 16 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 5b258b446b..6d89f69be9 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -416,6 +416,11 @@ Input parameters that take a size value should only use a size suffix
 the value is hexadecimal.  That is, '0x20M' should be written either as
 '32M' or as '0x2000000'.
 
+``-async-teardown`` (removed in 8.0)
+,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
+
+Use ``-teardown async=on`` instead.
+
 ``-chardev`` backend aliases ``tty`` and ``parport`` (removed in 8.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/os-posix.c b/os-posix.c
index 5adc69f560..c1ca7b1cb3 100644
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
@@ -132,6 +134,8 @@ static bool os_parse_runas_uid_gid(const char *optarg)
  */
 int os_parse_cmd_args(int index, const char *optarg)
 {
+    QemuOpts *opts;
+
     switch (index) {
     case QEMU_OPTION_runas:
         user_pwd = getpwnam(optarg);
@@ -152,8 +156,15 @@ int os_parse_cmd_args(int index, const char *optarg)
         daemonize = 1;
         break;
 #if defined(CONFIG_LINUX)
-    case QEMU_OPTION_asyncteardown:
-        init_async_teardown();
+    case QEMU_OPTION_teardown:
+        opts = qemu_opts_parse_noisily(qemu_find_opts("teardown"),
+                                       optarg, false);
+        if (!opts) {
+            exit(1);
+        }
+        if (qemu_opt_get_bool(opts, "async", false)) {
+            init_async_teardown();
+        }
         break;
 #endif
     default:
diff --git a/qemu-options.hx b/qemu-options.hx
index d42f60fb91..6a69b84f3c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4763,23 +4763,28 @@ DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
 DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
 
 #ifdef __linux__
-DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
-    "-async-teardown enable asynchronous teardown\n",
+DEF("teardown", HAS_ARG, QEMU_OPTION_teardown,
+    "-teardown async[=on|off]\n"
+    "                process teardown options\n"
+    "                async=on enables asynchronous teardown\n"
+   ,
     QEMU_ARCH_ALL)
-#endif
 SRST
-``-async-teardown``
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
+``-teardown``
+    Set process teardown options.
+
+    ``async=on`` enables asynchronous teardown. A new process called
+    "cleanup/<QEMU_PID>" will be created at startup sharing the address
+    space with the main QEMU process, using clone. It will wait for the
+    main QEMU process to terminate completely, and then exit. This allows
+    QEMU to terminate very quickly even if the guest was huge, leaving the
+    teardown of the address space to the cleanup process. Since the cleanup
+    process shares the same cgroups as the main QEMU process, accounting is
+    performed correctly. This only works if the cleanup process is not
+    forcefully killed with SIGKILL before the main QEMU process has
+    terminated completely.
 ERST
+#endif
 
 DEF("msg", HAS_ARG, QEMU_OPTION_msg,
     "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
diff --git a/util/async-teardown.c b/util/async-teardown.c
index 62cdeb0f20..4a5dbce958 100644
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
+static QemuOptsList qemu_teardown_opts = {
+    .name = "teardown",
+    .head = QTAILQ_HEAD_INITIALIZER(qemu_teardown_opts.head),
+    .desc = {
+        {
+            .name = "async",
+            .type = QEMU_OPT_BOOL,
+        },
+        { /* end of list */ }
+    },
+};
+
+static void register_teardown(void)
+{
+    qemu_add_opts(&qemu_teardown_opts);
+}
+opts_init(register_teardown);
-- 
2.39.2


