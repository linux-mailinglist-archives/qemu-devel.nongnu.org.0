Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750DC6F82CD
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:20:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuPL-0002yk-Eh; Fri, 05 May 2023 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1puuPJ-0002y6-8o
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:19:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1puuPG-0008US-HG
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:19:29 -0400
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345C3Ow4032195; Fri, 5 May 2023 12:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=xwnx901UsVfy7zR7wfkEkIPv9bQsRSAnp1mEpgKEuwQ=;
 b=Km3qNbjluWBcADfRp3rPCkDVy1m6EyLkcxLVjFjbldZBbjbYZIRdQQOf9yZYpuxCfSxV
 mVrA5XlSIKqJF9Hd6/UxmSalbbDmUp+sgb8g3ZymuKLhu9WJm97sTMlgwTLDEj+C2NOS
 Zqq1OSuCRTDH46A3WRQ/trXaBsq99c8VCIOAPDZeCtF6OO4I1Ep3HIetAygjgmTBuRY/
 X5nMZ7WBsqORJyNI9dnq8D1OXxqZ2qgC8li7z00hGI41OR68vZtGXygRxUMb2cJxpiB3
 7T4ZvNr2Nr+FvPfAMjaJghFKOE626hBKGhqhF1Q3eTbIEtc7vE9Sa+hFuIHWCkiIBIMA Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd0hdaqjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 12:19:23 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 345C0aV6028097;
 Fri, 5 May 2023 12:19:23 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd0hdaqh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 12:19:22 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3459asJB032605;
 Fri, 5 May 2023 12:00:58 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3q8tv6tu70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 12:00:58 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 345C0qYK40829418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 May 2023 12:00:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9534420040;
 Fri,  5 May 2023 12:00:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 460002004B;
 Fri,  5 May 2023 12:00:52 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  5 May 2023 12:00:52 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v7 1/1] util/async-teardown: wire up query-command-line-options
Date: Fri,  5 May 2023 14:00:51 +0200
Message-Id: <20230505120051.36605-2-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505120051.36605-1-imbrenda@linux.ibm.com>
References: <20230505120051.36605-1-imbrenda@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w3zrBT4PjCMrCdc6Q9P0vgqSlyQFkTJe
X-Proofpoint-ORIG-GUID: EbcgbWJAh4hIKwc0oA16eqyPDRQPfLnS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050099
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
 os-posix.c                | 13 +++++++++++++
 qemu-options.hx           | 34 +++++++++++++++++++++++-----------
 util/async-teardown.c     | 21 +++++++++++++++++++++
 4 files changed, 62 insertions(+), 11 deletions(-)

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
index 5adc69f560..ef910aaf94 100644
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
@@ -152,9 +154,20 @@ int os_parse_cmd_args(int index, const char *optarg)
         daemonize = 1;
         break;
 #if defined(CONFIG_LINUX)
+    /* deprecated */
     case QEMU_OPTION_asyncteardown:
         init_async_teardown();
         break;
+    case QEMU_OPTION_run_with:
+        QemuOpts *opts = qemu_opts_parse_noisily(qemu_find_opts("run-with"),
+                                                 optarg, false);
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
2.40.1


