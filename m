Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE158D3F8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 08:44:30 +0200 (CEST)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLIyb-0002dg-00
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 02:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLIur-0000ry-DF
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 02:40:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oLIuo-0000S5-Ev
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 02:40:37 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2796WkPE022186;
 Tue, 9 Aug 2022 06:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=pkRcvYKbKgTd6k7+CL7R6MIRAZoC8azZ30ClAYvxNkk=;
 b=d76KeHOM7y86B2Jr/pz7WWxcGej05dDSG9W1+eQWKHuVnpA+Ex0Cm6+o9spmyEUHMgX/
 we/8qHqupsshlUeMBfgWT8g5AI2BBYYldo8BXnINVxqXrUI2mwf+GKpn4ARLhiVdGI5g
 joUt4oRmn9NcyR8Vc9ZnRKlhAosAaVHN7rBx8oieHrxrGFoRMPPAbp6/mi0LP6s4tRxQ
 Ykcv4tgMvZD/DdIog0OhlhCmuml10LVHms80WjFP7KsU8x0+ggpaP/fTua8RapHOoLmn
 XPqPnQdnc9jFfFdj4oymAXk31KQEW/ba6tCTSIohTvMA6HztaTZIStlfsgoS9LsNxERq PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hujdh06gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 06:40:31 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2796X44p023378;
 Tue, 9 Aug 2022 06:40:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hujdh06ft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 06:40:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2796aP3p024297;
 Tue, 9 Aug 2022 06:40:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3hsfx8u2tj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 06:40:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2796ePMu33816996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Aug 2022 06:40:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA27DAE045;
 Tue,  9 Aug 2022 06:40:25 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E336AE051;
 Tue,  9 Aug 2022 06:40:25 +0000 (GMT)
Received: from p-imbrenda.bredband2.com (unknown [9.145.14.147])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  9 Aug 2022 06:40:25 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, cohuck@redhat.com,
 thuth@redhat.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 fiuczy@linux.ibm.com, pasic@linux.ibm.com, berrange@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on Linux
Date: Tue,  9 Aug 2022 08:40:24 +0200
Message-Id: <20220809064024.15259-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0HZMOA7mfUHXfVzl97Umtg3q5ruFHgGO
X-Proofpoint-GUID: 6iX1EEVyoYwtjZjzkwGzDYJsaQP7nxOt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208090029
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds support for asynchronously tearing down a VM on Linux.

When qemu terminates, either naturally or because of a fatal signal,
the VM is torn down. If the VM is huge, it can take a considerable
amount of time for it to be cleaned up. In case of a protected VM, it
might take even longer than a non-protected VM (this is the case on
s390x, for example).

Some users might want to shut down a VM and restart it immediately,
without having to wait. This is especially true if management
infrastructure like libvirt is used.

This patch implements a simple trick on Linux to allow qemu to return
immediately, with the teardown of the VM being performed
asynchronously.

If the new commandline option -async-teardown is used, a new process is
spawned from qemu at startup, using the clone syscall, in such way that
it will share its address space with qemu.

The new process will have the name "cleanup/<QEMU_PID>". It will wait
until qemu terminates, and then it will exit itself.

This allows qemu to terminate quickly, without having to wait for the
whole address space to be torn down. The teardown process will exit
after qemu, so it will be the last user of the address space, and
therefore it will take care of the actual teardown.

The teardown process will share the same cgroups as qemu, so both
memory usage and cpu time will be accounted properly.

This feature can already be used with libvirt by adding the following
to the XML domain definition to pass the parameter to qemu directly:

  <commandline xmlns="http://libvirt.org/schemas/domain/qemu/1.0">
  <arg value='-async-teardown'/>
  </commandline>

More advanced interfaces like pidfd or close_range have intentionally
been avoided in order to be more compatible with older kernels.

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 include/qemu/async-teardown.h |  22 ++++++
 os-posix.c                    |   6 ++
 qemu-options.hx               |  17 +++++
 util/async-teardown.c         | 123 ++++++++++++++++++++++++++++++++++
 util/meson.build              |   1 +
 5 files changed, 169 insertions(+)
 create mode 100644 include/qemu/async-teardown.h
 create mode 100644 util/async-teardown.c

diff --git a/include/qemu/async-teardown.h b/include/qemu/async-teardown.h
new file mode 100644
index 0000000000..092e7a37e7
--- /dev/null
+++ b/include/qemu/async-teardown.h
@@ -0,0 +1,22 @@
+/*
+ * Asynchronous teardown
+ *
+ * Copyright IBM, Corp. 2022
+ *
+ * Authors:
+ *  Claudio Imbrenda <imbrenda@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+#ifndef QEMU_ASYNC_TEARDOWN_H
+#define QEMU_ASYNC_TEARDOWN_H
+
+#include "config-host.h"
+
+#ifdef CONFIG_LINUX
+void init_async_teardown(void);
+#endif
+
+#endif
diff --git a/os-posix.c b/os-posix.c
index 321fc4bd13..4858650c3e 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -39,6 +39,7 @@
 
 #ifdef CONFIG_LINUX
 #include <sys/prctl.h>
+#include "qemu/async-teardown.h"
 #endif
 
 /*
@@ -150,6 +151,11 @@ int os_parse_cmd_args(int index, const char *optarg)
     case QEMU_OPTION_daemonize:
         daemonize = 1;
         break;
+#if defined(CONFIG_LINUX)
+    case QEMU_OPTION_asyncteardown:
+        init_async_teardown();
+        break;
+#endif
     default:
         return -1;
     }
diff --git a/qemu-options.hx b/qemu-options.hx
index 3f23a42fa8..d434353159 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4743,6 +4743,23 @@ HXCOMM Internal use
 DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
 DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
 
+#ifdef __linux__
+DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
+    "-async-teardown enable asynchronous teardown\n",
+    QEMU_ARCH_ALL)
+#endif
+SRST
+``-async-teardown``
+    Enable asynchronous teardown. A new teardown process will be
+    created at startup, using clone. The teardown process will share
+    the address space of the main qemu process, and wait for the main
+    process to terminate. At that point, the teardown process will
+    also exit. This allows qemu to terminate quickly if the guest was
+    huge, leaving the teardown of the address space to the teardown
+    process. Since the teardown process shares the same cgroups as the
+    main qemu process, accounting is performed correctly.
+ERST
+
 DEF("msg", HAS_ARG, QEMU_OPTION_msg,
     "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
     "                control error message format\n"
diff --git a/util/async-teardown.c b/util/async-teardown.c
new file mode 100644
index 0000000000..07fe549891
--- /dev/null
+++ b/util/async-teardown.c
@@ -0,0 +1,123 @@
+/*
+ * Asynchronous teardown
+ *
+ * Copyright IBM, Corp. 2022
+ *
+ * Authors:
+ *  Claudio Imbrenda <imbrenda@linux.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or (at your
+ * option) any later version.  See the COPYING file in the top-level directory.
+ *
+ */
+#include <stdlib.h>
+#include <stdio.h>
+#include <sys/types.h>
+#include <sys/unistd.h>
+#include <dirent.h>
+#include <sys/prctl.h>
+#include <signal.h>
+#include <sched.h>
+
+#include "qemu/async-teardown.h"
+
+static pid_t the_ppid;
+
+/*
+ * Close all open file descriptors.
+ */
+static void close_all_open_fd(void)
+{
+    struct dirent *de;
+    int fd, dfd;
+    DIR *dir;
+
+    dir = opendir("/proc/self/fd");
+    if (!dir) {
+        return;
+    }
+    /* Avoid closing the directory. */
+    dfd = dirfd(dir);
+
+    for (de = readdir(dir); de; de = readdir(dir)) {
+        fd = atoi(de->d_name);
+        if (fd != dfd) {
+            close(fd);
+        }
+    }
+    closedir(dir);
+}
+
+static void hup_handler(int signal)
+{
+    /* Check every second if this process has been reparented. */
+    while (the_ppid == getppid()) {
+        /* sleep() is safe to use in a signal handler. */
+        sleep(1);
+    }
+
+    /* At this point the parent process has terminated completely. */
+    _exit(0);
+}
+
+static int async_teardown_fn(void *arg)
+{
+    struct sigaction sa = { .sa_handler = hup_handler };
+    sigset_t hup_signal;
+    char name[16];
+
+    /* Set a meaningful name for this process. */
+    snprintf(name, 16, "cleanup/%d", the_ppid);
+    prctl(PR_SET_NAME, (unsigned long)name);
+
+    /*
+     * Close all file descriptors that might have been inherited from the
+     * main qemu process when doing clone, needed to make libvirt happy.
+     * Not using close_range for increased compatibility with older kernels.
+     */
+    close_all_open_fd();
+
+    /* Set up a handler for SIGHUP and unblock SIGHUP. */
+    sigaction(SIGHUP, &sa, NULL);
+    sigemptyset(&hup_signal);
+    sigaddset(&hup_signal, SIGHUP);
+    sigprocmask(SIG_UNBLOCK, &hup_signal, NULL);
+
+    /* Ask to receive SIGHUP when the parent dies. */
+    prctl(PR_SET_PDEATHSIG, SIGHUP);
+
+    /*
+     * Sleep forever, unless the parent process has already terminated. The
+     * only interruption can come from the SIGHUP signal, which in normal
+     * operation is received when the parent process dies.
+     */
+    if (the_ppid == getppid()) {
+        pause();
+    }
+
+    /* At this point the parent process has terminated completely. */
+    _exit(0);
+}
+
+/*
+ * Block all signals, start (clone) a new process sharing the address space
+ * with qemu (CLONE_VM), then restore signals.
+ */
+void init_async_teardown(void)
+{
+    sigset_t all_signals, old_signals;
+    const int stack_size = 8192; /* Should be more than enough */
+    char *stack, *stack_ptr;
+
+    the_ppid = getpid();
+    stack = malloc(stack_size);
+    if (!stack) {
+        return;
+    }
+    stack_ptr = stack + stack_size;
+
+    sigfillset(&all_signals);
+    sigprocmask(SIG_BLOCK, &all_signals, &old_signals);
+    clone(async_teardown_fn, stack_ptr, CLONE_VM, NULL, NULL, NULL, NULL);
+    sigprocmask(SIG_SETMASK, &old_signals, NULL);
+}
diff --git a/util/meson.build b/util/meson.build
index 5e282130df..63acd59bb0 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -2,6 +2,7 @@ util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
 if not config_host_data.get('CONFIG_ATOMIC64')
   util_ss.add(files('atomic64.c'))
 endif
+util_ss.add(when: 'CONFIG_LINUX', if_true: files('async-teardown.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
 if config_host_data.get('CONFIG_EPOLL_CREATE1')
-- 
2.37.1


