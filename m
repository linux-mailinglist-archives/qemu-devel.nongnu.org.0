Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9365891C1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 19:49:36 +0200 (CEST)
Received: from localhost ([::1]:48014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJIUy-0007xX-2f
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 13:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJIDz-0006sb-9j
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:32:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1oJIDo-0007tW-Ep
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 13:31:59 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 273HG0iN011800;
 Wed, 3 Aug 2022 17:31:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=83RM9jSidSZ6tShDJcQnYXbc/aS6s9wfg8Nj2G3mw0g=;
 b=J8umJSl3hNnHzZXy0Jcv4VqN9rd9epGirwJWswvpz6ZQ5NbybasXEbEXpm0BbTKOvTGv
 lidWJ7UPHMDGv95isiVPsaYxgbj9MClibp4u6mvh/f3lG1Z1NlWuyAw6LBPDyh8V3qgG
 8e+CHOY/Ws1XyxJXui5OswenB67mm0UtK5RPXioGK6VcuhzTJQxEow00q+cJR5Df/47Q
 htKoEqWxv/MwJjefyQLSGhlQx1At7e6dU6DkdHeY01KfoMxAaRlH7o89zUiEYKA+2wSb
 42j4zPkShGPiXh+HOd+kRXkyk+oyzfOxDZcPVHw3dvepvHw2/RsX8u12V66pEAZ5bIxu dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hqw92gcsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Aug 2022 17:31:48 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 273HG65P011980;
 Wed, 3 Aug 2022 17:31:48 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hqw92gcrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Aug 2022 17:31:47 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 273HTj1b019367;
 Wed, 3 Aug 2022 17:31:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3hmuwhstu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Aug 2022 17:31:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 273HVgEq16384308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Aug 2022 17:31:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1D3742042;
 Wed,  3 Aug 2022 17:31:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B9E54203F;
 Wed,  3 Aug 2022 17:31:41 +0000 (GMT)
Received: from p-imbrenda.bredband2.com (unknown [9.145.1.230])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Aug 2022 17:31:41 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, david@redhat.com, cohuck@redhat.com,
 thuth@redhat.com, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, alex.bennee@linaro.org
Subject: [PATCH v2 1/1] osdep: asynchronous teardown for shutdown on Linux
Date: Wed,  3 Aug 2022 19:31:41 +0200
Message-Id: <20220803173141.52711-1-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4RF1atoDUhzUhl-yEDRKwcPypcyNGJpM
X-Proofpoint-GUID: 2uFlu6hSlPZcKj8uphaae-KhiDZWWw4v
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_04,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=705 mlxscore=0 impostorscore=0 clxscore=1011 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030078
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

The new process will then simpy wait until qemu terminates, and then it
will exit itself.

This allows qemu to terminate quickly, without having to wait for the
whole address space to be torn down. The teardown process will exit
after qemu, so it will be the last user of the address space, and
therefore it will take care of the actual teardown.

The teardown process will share the same cgroups as qemu, so both
memory usage and cpu time will be accounted properly.

This feature can already be used with libvirt by adding the following
to the XML domain definition:

  <commandline xmlns="http://libvirt.org/schemas/domain/qemu/1.0">
  <arg value='-async-teardown'/>
  </commandline>

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 include/qemu/osdep.h |  2 ++
 os-posix.c           |  5 ++++
 qemu-options.hx      | 17 ++++++++++++++
 util/osdep.c         | 55 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 79 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index b1c161c035..3154759d79 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -549,6 +549,8 @@ ssize_t qemu_write_full(int fd, const void *buf, size_t count)
 
 void qemu_set_cloexec(int fd);
 
+void init_async_teardown(void);
+
 /* Return a dynamically allocated directory path that is appropriate for storing
  * local state.
  *
diff --git a/os-posix.c b/os-posix.c
index 321fc4bd13..dd3e42b4c4 100644
--- a/os-posix.c
+++ b/os-posix.c
@@ -150,6 +150,11 @@ int os_parse_cmd_args(int index, const char *optarg)
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
diff --git a/util/osdep.c b/util/osdep.c
index 60fcbbaebe..bb0baf97a0 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -23,6 +23,15 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+
+#ifdef CONFIG_LINUX
+#include <sys/types.h>
+#include <sys/select.h>
+#include <sys/unistd.h>
+#include <sys/syscall.h>
+#include <signal.h>
+#endif
+
 #include "qemu/cutils.h"
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
@@ -512,6 +521,52 @@ const char *qemu_hw_version(void)
     return hw_version;
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
+
+    /*
+     * Close all file descriptors that might have been inherited from the
+     * main qemu process when doing clone. This is needed to make libvirt
+     * happy.
+     */
+    close_range(0, ~0U, 0);
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
2.37.1


