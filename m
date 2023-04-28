Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22296F166F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 13:14:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psM1r-0003p3-9U; Fri, 28 Apr 2023 07:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1psM1o-0003oO-R5
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:12:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1psM1m-0008Sp-EX
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 07:12:40 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SB9j2i016937; Fri, 28 Apr 2023 11:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=RoxzS/CNo0DLeaWfjVfF5FkwgUxDHwavIrsNe//3m5c=;
 b=suSxECo9rqEDitbYQJx1nkSQMzraPznRMVzU9jqF7dZzhb1Pc2eRzR3G8BJwcFPkEY7y
 kewSztOy2buuWiOQ4XI/irxIMvbA/kQCIuz0nc/U4eLGBIcNm8zJtX4yIBeNS7eKs10z
 wdfglXRGAFcmcvLrQ0VjTrdJV3geZwJLK1C15WSheZvCMb8UTbLnNLSSOwCNIJm/H0ne
 zJw4lZqIbzsPp58C2DLuOYxVOvdG6eaPD1UgEM1Eu6uET00l8pcpK3H+DiiCkrryTlgv
 2uKph8LbNa3Fvo/8pvJ5NDVvT+lZYWEoa6gLlWBXnbu+poPV5tI7alTK7JYWQZATrG4x RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q89qne65w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 11:12:34 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33SB9xXV017848;
 Fri, 28 Apr 2023 11:12:33 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q89qne64h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 11:12:33 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33S4Sxpq004766;
 Fri, 28 Apr 2023 11:12:31 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3q47772vym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 11:12:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33SBCPxD28443258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Apr 2023 11:12:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C7DE20040;
 Fri, 28 Apr 2023 11:12:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8B902004E;
 Fri, 28 Apr 2023 11:12:24 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 28 Apr 2023 11:12:24 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v6 1/1] util/async-teardown: wire up query-command-line-options
Date: Fri, 28 Apr 2023 13:12:24 +0200
Message-Id: <20230428111224.37140-2-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428111224.37140-1-imbrenda@linux.ibm.com>
References: <20230428111224.37140-1-imbrenda@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pt8lqkn6d0FRREnWajjdwVsFI1twroJN
X-Proofpoint-GUID: gMx0HqUa_RiqHuT0pY8Lm7eo3szFI2gl
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280090
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Add new -run-with option with an async-teardown=on|off parameter. It is
visible in the output of query-command-line-options QMP command, so it
can be discovered and used by libvirt.

The option -async-teardown is now redundant, deprecate it.

Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 docs/about/deprecated.rst |  5 +++++
 os-posix.c                | 15 +++++++++++++++
 qemu-options.hx           | 34 +++++++++++++++++++++++-----------
 util/async-teardown.c     | 21 +++++++++++++++++++++
 4 files changed, 64 insertions(+), 11 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d6..0986db9a86 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -111,6 +111,11 @@ Use ``-machine acpi=off`` instead.
 The HAXM project has been retired (see https://github.com/intel/haxm#status).
 Use "whpx" (on Windows) or "hvf" (on macOS) instead.
 
+``-async-teardown`` (since 8.1)
+,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
+
+Use ``-run-with async-teardown=on`` instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/os-posix.c b/os-posix.c
index 5adc69f560..117ad2bdc1 100644
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
@@ -152,9 +156,20 @@ int os_parse_cmd_args(int index, const char *optarg)
         daemonize = 1;
         break;
 #if defined(CONFIG_LINUX)
+    /* deprecated */
     case QEMU_OPTION_asyncteardown:
         init_async_teardown();
         break;
+    case QEMU_OPTION_run_with:
+        opts = qemu_opts_parse_noisily(qemu_find_opts("run-with"),
+                                       optarg, false);
+        if (!opts) {
+            exit(1);
+        }
+        if (qemu_opt_get_bool(opts, "async-teardown", false)) {
+            init_async_teardown();
+        }
+        break;
 #endif
     default:
         return -1;
diff --git a/qemu-options.hx b/qemu-options.hx
index b5efa648ba..24a1d63bbe 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4799,20 +4799,32 @@ DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
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
-- 
2.40.0


