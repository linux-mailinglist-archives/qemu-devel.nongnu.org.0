Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70F6C8394
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:47:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pflUq-0006xx-Mg; Fri, 24 Mar 2023 13:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pflUp-0006xY-5p
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:46:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pflUm-0001or-Q4
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:46:34 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32OG4Jk7038345; Fri, 24 Mar 2023 17:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=35EUl/AYS3vuPVij8cSeQWM+SoLu8r0cuEgoMUGOCQ4=;
 b=BtClEKcC6v243g/ZFDK2azwS3XAU/jOji+AB5z872KA4Qa7VVZpyWTf9/Ygkspd5J2ZQ
 tmYoj395ubdoulUYDIatuYV9OAjEljvx3/CPZ9G1bvYQpO6iykeK4nzXUPTwN79EBNef
 2i2FLfnfsVKfxzeHPbEclMWXXczB3NpLiATw7r827+yUKMk+26xw05y5oGkgCVoQZmEi
 1N4rm2z/GG6bQUwv2cnAhzH34PJYm1DYMVDqSznqr0kbxcg2D2mgBIXuNM+WSXOUBJfa
 mss5J1NSQws9djcMMhlujn0NJnWmaMUaXfVi/lHiNsg+LGYO4Bh1D4s3iWGm6hGqR/CD 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phd4c5j07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 17:46:18 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32OF9vsQ039789;
 Fri, 24 Mar 2023 17:46:18 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3phd4c5hy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 17:46:18 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32OFvuIQ006252;
 Fri, 24 Mar 2023 17:46:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3pgxv78wx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 17:46:15 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32OHkAO449611076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Mar 2023 17:46:11 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D485420040;
 Fri, 24 Mar 2023 17:46:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B1B220043;
 Fri, 24 Mar 2023 17:46:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.179.5.149])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 24 Mar 2023 17:46:10 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, fiuczy@linux.ibm.com,
 pasic@linux.ibm.com, nsg@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v3 1/1] util/async-teardown: wire up query-command-line-options
Date: Fri, 24 Mar 2023 18:45:59 +0100
Message-Id: <20230324174559.44933-2-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324174559.44933-1-imbrenda@linux.ibm.com>
References: <20230324174559.44933-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fPgjVDe2OUP50NTw_ByB-qDitbi5QMWL
X-Proofpoint-ORIG-GUID: uN5Pa1DvnMFHlBp9OoauSEqP6tpMGwo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303240138
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

The recently introduced -async-teardown commandline option was not
wired up properly and did not show up in the output of the QMP command
query-command-line-options. This means that libvirt will have no way to
discover whether the feature is supported.

This patch fixes the issue by correctly wiring up the commandline
option so that it appears in the output of query-command-line-options.

Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 os-posix.c            | 14 ++++++++++++++
 qemu-options.hx       | 35 ++++++++++++++++++++++++-----------
 util/async-teardown.c | 21 +++++++++++++++++++++
 3 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/os-posix.c b/os-posix.c
index 5adc69f560..48acd7acf5 100644
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
@@ -155,6 +159,16 @@ int os_parse_cmd_args(int index, const char *optarg)
     case QEMU_OPTION_asyncteardown:
         init_async_teardown();
         break;
+    case QEMU_OPTION_teardown:
+        opts = qemu_opts_parse_noisily(qemu_find_opts("teardown"),
+                                       optarg, false);
+        if (!opts) {
+            return -1;
+        }
+        if (qemu_opt_get_bool(opts, "async", false)) {
+            init_async_teardown();
+        }
+        break;
 #endif
     default:
         return -1;
diff --git a/qemu-options.hx b/qemu-options.hx
index d42f60fb91..8582980b12 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4766,20 +4766,33 @@ DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
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
+    Equivalent to -teardown async=on
+ERST
+
+DEF("teardown", HAS_ARG, QEMU_OPTION_teardown,
+    "-teardown async[=on|off]\n"
+    "                process teardown options\n"
+    "                async=on enables asynchronous teardown\n"
+   ,
+    QEMU_ARCH_ALL)
+SRST
+``-teardown``
+    Set process teardown options.
+
+    ``async=on`` enables asynchronous teardown.  A new process called
+    "cleanup/<QEMU_PID>" will be created at startup sharing the address
+    space with the main qemu process, using clone.  It will wait for the
+    main qemu process to terminate completely, and then exit.  This allows
+    qemu to terminate very quickly even if the guest was huge, leaving the
+    teardown of the address space to the cleanup process.  Since the cleanup
+    process shares the same cgroups as the main qemu process, accounting is
+    performed correctly.  This only works if the cleanup process is not
+    forcefully killed with SIGKILL before the main qemu process has
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


