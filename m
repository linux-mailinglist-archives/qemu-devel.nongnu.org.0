Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F9E4694CC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:12:25 +0100 (CET)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBuy-0003eP-BA
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:12:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1muBpN-0005cS-2x
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:06:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1muBpG-0002x2-MR
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:06:36 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6ALSxI009156
 for <qemu-devel@nongnu.org>; Mon, 6 Dec 2021 11:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Ur3NXafEJU8cAzcWm/2Fk7ATIeNnhlF3vXX6ZSJF5Es=;
 b=Nfhe+fKYZYMp03ZeIZGLoXweL98ojlI/6ebwaUBDg62i6fkI1sij4AcUdl5z8IX7QnrY
 XC7yQxhrOYgGbvXDxFx3069KVc8iUonSSWlpRthubiEuJuaV/ePYayUYx89A5aR5h+Op
 9yy4ba1HnXDSts4r+nRr7BcsYeYQx2ivu0KSn4xvzGlIAdW7znIvU10yoJtA1JVuAKF8
 ag2RFSnMQgQQagkQh8dqVeTq6Man38cbI8FoaTLsHN9Y6mO/jhQ7KFaH0MRZM92FJfda
 qIopBFPfgmod0wiNqOhA+Mo0ln9+FCu8UzqMzRPiqoWZJYG1vXpBppglQjKfco2Ld7w3 Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3csgpsgt1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 11:06:24 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B6ARkwr011685
 for <qemu-devel@nongnu.org>; Mon, 6 Dec 2021 11:06:24 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3csgpsgt13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 11:06:24 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Av64Q020755;
 Mon, 6 Dec 2021 11:06:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3cqyyabfdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 11:06:21 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B6B6C6U33227154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 11:06:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED8E7A405C;
 Mon,  6 Dec 2021 11:06:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E87AA407E;
 Mon,  6 Dec 2021 11:06:11 +0000 (GMT)
Received: from p-imbrenda.bredband2.com (unknown [9.145.0.173])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 11:06:11 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Subject: [PATCH v1 1/1] osdep: asynchronous teardown for shutdown on Linux
Date: Mon,  6 Dec 2021 12:06:11 +0100
Message-Id: <20211206110611.27283-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -zQplLIXMfybMEibmH-q6vyuwIR2e7xZ
X-Proofpoint-ORIG-GUID: w4rSyVeFZuJlLZEnzqxOi6N4G3etJoaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_04,2021-12-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 malwarescore=0 mlxlogscore=875 mlxscore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112060066
Received-SPF: pass client-ip=148.163.156.1;
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, borntraeger@de.ibm.com
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
spawned from qemu using the clone syscall, so that it will share its
address space with qemu.

The new process will then wait until qemu terminates, and then it will
exit itself.

This allows qemu to terminate quickly, without having to wait for the
whole address space to be torn down. The teardown process will exit
after qemu, so it will be the last user of the address space, and
therefore it will take care of the actual teardown.

The teardown process will share the same cgroups as qemu, so both
memory usage and cpu time will be accounted properly.

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 include/qemu/osdep.h |  2 ++
 os-posix.c           |  3 +++
 qemu-options.hx      | 17 ++++++++++++++++
 util/osdep.c         | 47 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 69 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 60718fc342..f5493c9489 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -657,6 +657,8 @@ const char *qemu_hw_version(void);
 void fips_set_state(bool requested);
 bool fips_get_state(void);
 
+void init_async_teardown(void);
+
 /* Return a dynamically allocated pathname denoting a file or directory that is
  * appropriate for storing local state.
  *
diff --git a/os-posix.c b/os-posix.c
index ae6c9f2a5e..d37a654e2c 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -158,6 +158,9 @@ int os_parse_cmd_args(int index, const char *optarg)
                     "to enable FIPS compliance");
         fips_set_state(true);
         break;
+    case QEMU_OPTION_asyncteardown:
+        init_async_teardown();
+        break;
 #endif
     default:
         return -1;
diff --git a/qemu-options.hx b/qemu-options.hx
index ae2c6dbbfc..b4ce828726 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4600,6 +4600,23 @@ SRST
     Enable FIPS 140-2 compliance mode.
 ERST
 
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
diff --git a/util/osdep.c b/util/osdep.c
index 42a0a4986a..f36be51262 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -33,6 +33,14 @@
 extern int madvise(char *, size_t, int);
 #endif
 
+#ifdef CONFIG_LINUX
+#include <sys/types.h>
+#include <sys/select.h>
+#include <sys/unistd.h>
+#include <sys/syscall.h>
+#include <signal.h>
+#endif
+
 #include "qemu-common.h"
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
@@ -548,6 +556,45 @@ bool fips_get_state(void)
     return fips_enabled;
 }
 
+#ifdef __linux__
+static int async_teardown_fn(void *arg)
+{
+    sigset_t all_signals;
+    fd_set r, w, e;
+    int fd;
+
+    /* open a pidfd descriptor for the parent qemu process */
+    fd = syscall(__NR_pidfd_open, getppid(), 0);
+    /* if something went wrong, or if the file descriptor is too big */
+    if ((fd < 0) || (fd >= FD_SETSIZE)) {
+        _exit(1);
+    }
+    /* zero all fd sets */
+    FD_ZERO(&r);
+    FD_ZERO(&w);
+    FD_ZERO(&e);
+    /* set the fd for the pidfd in the "read" set */
+    FD_SET(fd, &r);
+    /* block all signals */
+    sigfillset(&all_signals);
+    sigprocmask(SIG_BLOCK, &all_signals, NULL);
+    /* wait for the pid to disappear -> fd will appear as ready for read */
+    (void) select(fd + 1, &r, &w, &e, NULL);
+    _exit(0);
+}
+
+void init_async_teardown(void)
+{
+    const int size = 8192; /* should be more than enough */
+    char *stack = malloc(size);
+
+    /* start a new process sharing the address space with qemu */
+    clone(async_teardown_fn, stack + size, CLONE_VM, NULL, NULL, NULL, NULL);
+}
+#else /* __linux__ */
+void init_async_teardown(void) {}
+#endif
+
 #ifdef _WIN32
 static void socket_cleanup(void)
 {
-- 
2.31.1


