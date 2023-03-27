Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B93F6CA312
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 14:08:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgld5-0003rc-Jp; Mon, 27 Mar 2023 08:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pgld2-0003qu-EV
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:07:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pgld0-00069m-DG
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 08:07:12 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32RBUVcw022121; Mon, 27 Mar 2023 12:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bjWnn+P2F4UIQBvYug5RXtHRshQXgShqa949XZWiG9w=;
 b=EbdMpY21YSr+tL/D3rs9QIF8+u6T/pP9OEcxB4Eps49JoY930YItR6bJWM/g9oEEKkFq
 FBO1yw/BqYp/NugBzcQK/EFpLIDk8ynfiCflyz/RIoBVW8Ym0YDyMP3XW8typidbyY+Q
 gEqZsK7ZhAdLQJpkFQphEAM1fbfaY9szXHXPHK6DTqAb9FMAa8Bd+tu6y11BrEV6x4Oh
 cglv900UZrxKJeKhwQU/GMKljE9qqOn7BL/vRFRpmAE0Can2hiH7aoVJGX62HVPZYSoK
 Y1KwCp9/7bn+7wSL7NGsjNJcKZQBBDDr0hTTpKUQ9bTYdt8Zx8H/zNYL0c3Ckz2Mt2A8 wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb42pvj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:06:57 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RC4QbI012693;
 Mon, 27 Mar 2023 12:05:34 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjb42pshy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:05:33 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32QNnE96015876;
 Mon, 27 Mar 2023 12:04:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3phr7ftcy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Mar 2023 12:04:02 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32RC3xk025887258
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Mar 2023 12:03:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E76A2004B;
 Mon, 27 Mar 2023 12:03:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A2602006A;
 Mon, 27 Mar 2023 12:03:59 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 27 Mar 2023 12:03:57 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v4 1/1] util/async-teardown: wire up query-command-line-options
Date: Mon, 27 Mar 2023 14:03:57 +0200
Message-Id: <20230327120357.34743-2-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327120357.34743-1-imbrenda@linux.ibm.com>
References: <20230327120357.34743-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sw8VBglM260GJIFSK888y8Jl85biHmV3
X-Proofpoint-GUID: P9T6wdOowdpIMsQ_s_0rkA7zbktRfOlB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303270094
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The recently introduced -async-teardown commandline option was not
wired up properly and did not show up in the output of the QMP command
query-command-line-options. This means that libvirt had no way to
discover whether the feature was supported.

This patch fixes the issue by replacing the -async-teardown option with
a new -teardown option with a new async=on|off parameter.
The new option is correctly wired up so that it appears in the output
of query-command-line-options.

Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 os-posix.c            | 15 +++++++++++++--
 qemu-options.hx       | 33 +++++++++++++++++++--------------
 util/async-teardown.c | 21 +++++++++++++++++++++
 3 files changed, 53 insertions(+), 16 deletions(-)

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


