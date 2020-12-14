Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8BC2D92DA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:33:50 +0100 (CET)
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogUX-00041O-6Z
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogEp-00075S-Vy
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:17:37 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogEm-0007Kp-Qy
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:17:35 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5ED74007084;
 Mon, 14 Dec 2020 05:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=7onO0QWGF6zyEbduLaTqggjF9LsEztEHb50dAj2+Jqk=;
 b=GODEe6jeMV+OciqMtoRCMkelC29ojwrgP7BfzSV3re9+t7NzyfqMMm9cL811oHtGR+Wj
 eoXg9hmzMSwzuWNjqJ6LC+lnFFnfZJ5jI/mwNyyomRj5xZQKAv3PcYO9Qk+ygu0//tgz
 1OYo/yxcY+Bx/vLivySdYWa97b3BZesPq/jWJqdDMOnjjVF2ZRNinPtSp3uSHKkvQux4
 18M8WTguzQ/RF5dnr31J1MdcfqUP4/YD0zDXqeNwb5ph7lSb6R3iZfvvUtTx7FE3kYXi
 AvBLbVlMx0i9hJ/eGlKKcGciKEiaycHElE5ItssyyyDSlO/+Y2SVyVcgWGVWXT5H2ywo FA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35cn9r3cj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 05:17:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5B40U125125;
 Mon, 14 Dec 2020 05:15:24 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 35d7ek1bhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 05:15:24 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BE5FMHx019088;
 Mon, 14 Dec 2020 05:15:22 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 13 Dec 2020 21:15:21 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 08/19] multi-process: define MPQemuMsg format and
 transmission functions
Date: Mon, 14 Dec 2020 00:14:48 -0500
Message-Id: <8599076d98e8000d959185b1ae3a02bb7bb61b35.1607922214.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140040
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Defines MPQemuMsg, which is the message that is sent to the remote
process. This message is sent over QIOChannel and is used to
command the remote process to perform various tasks.
Define transmission functions used by proxy and by remote.

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 meson.build                     |   1 +
 hw/remote/trace.h               |   1 +
 include/hw/remote/mpqemu-link.h |  63 ++++++++++++
 include/sysemu/iothread.h       |   6 ++
 hw/remote/mpqemu-link.c         | 205 ++++++++++++++++++++++++++++++++++++++++
 iothread.c                      |   6 ++
 MAINTAINERS                     |   2 +
 hw/remote/meson.build           |   1 +
 hw/remote/trace-events          |   4 +
 9 files changed, 289 insertions(+)
 create mode 100644 hw/remote/trace.h
 create mode 100644 include/hw/remote/mpqemu-link.h
 create mode 100644 hw/remote/mpqemu-link.c
 create mode 100644 hw/remote/trace-events

diff --git a/meson.build b/meson.build
index f344b25..7fd19d5 100644
--- a/meson.build
+++ b/meson.build
@@ -1483,6 +1483,7 @@ if have_system
     'net',
     'softmmu',
     'ui',
+    'hw/remote',
   ]
 endif
 trace_events_subdirs += [
diff --git a/hw/remote/trace.h b/hw/remote/trace.h
new file mode 100644
index 0000000..5d5e3ac
--- /dev/null
+++ b/hw/remote/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-hw_remote.h"
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
new file mode 100644
index 0000000..b763bda
--- /dev/null
+++ b/include/hw/remote/mpqemu-link.h
@@ -0,0 +1,63 @@
+/*
+ * Communication channel between QEMU and remote device process
+ *
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef MPQEMU_LINK_H
+#define MPQEMU_LINK_H
+
+#include "qom/object.h"
+#include "qemu/thread.h"
+#include "io/channel.h"
+
+#define REMOTE_MAX_FDS 8
+
+#define MPQEMU_MSG_HDR_SIZE offsetof(MPQemuMsg, data.u64)
+
+/**
+ * MPQemuCmd:
+ *
+ * MPQemuCmd enum type to specify the command to be executed on the remote
+ * device.
+ *
+ * This uses a private protocol between QEMU and the remote process. vfio-user
+ * protocol would supersede this in the future.
+ *
+ */
+typedef enum {
+    MPQEMU_CMD_MAX,
+} MPQemuCmd;
+
+/**
+ * MPQemuMsg:
+ * @cmd: The remote command
+ * @size: Size of the data to be shared
+ * @data: Structured data
+ * @fds: File descriptors to be shared with remote device
+ *
+ * MPQemuMsg Format of the message sent to the remote device from QEMU.
+ *
+ */
+typedef struct {
+    int cmd;
+    size_t size;
+
+    union {
+        uint64_t u64;
+    } data;
+
+    int fds[REMOTE_MAX_FDS];
+    int num_fds;
+} MPQemuMsg;
+
+bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
+bool mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
+
+bool mpqemu_msg_valid(MPQemuMsg *msg);
+
+#endif
diff --git a/include/sysemu/iothread.h b/include/sysemu/iothread.h
index 0c5284d..f177142 100644
--- a/include/sysemu/iothread.h
+++ b/include/sysemu/iothread.h
@@ -57,4 +57,10 @@ IOThread *iothread_create(const char *id, Error **errp);
 void iothread_stop(IOThread *iothread);
 void iothread_destroy(IOThread *iothread);
 
+/*
+ * Returns true if executing withing IOThread context,
+ * false otherwise.
+ */
+bool qemu_in_iothread(void);
+
 #endif /* IOTHREAD_H */
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
new file mode 100644
index 0000000..b50e9a0
--- /dev/null
+++ b/hw/remote/mpqemu-link.c
@@ -0,0 +1,205 @@
+/*
+ * Communication channel between QEMU and remote device process
+ *
+ * Copyright © 2018, 2020 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qemu/module.h"
+#include "hw/remote/mpqemu-link.h"
+#include "qapi/error.h"
+#include "qemu/iov.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "io/channel.h"
+#include "sysemu/iothread.h"
+#include "trace.h"
+
+/*
+ * Send message over the ioc QIOChannel.
+ * This function is safe to call from:
+ * - main loop in co-routine context. Will block the main loop if not in
+ *   co-routine context;
+ * - vCPU thread with no co-routine context and if the channel is not part
+ *   of the main loop handling;
+ * - IOThread within co-routine context, outside of co-routine context
+ *   will block IOThread;
+ * Returns true if no errors were encountered, false otherwise.
+ */
+bool mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
+{
+    ERRP_GUARD();
+    bool iolock = qemu_mutex_iothread_locked();
+    bool iothread = qemu_in_iothread();
+    struct iovec send[2] = {0};
+    int *fds = NULL;
+    size_t nfds = 0;
+    bool ret = false;
+
+    send[0].iov_base = msg;
+    send[0].iov_len = MPQEMU_MSG_HDR_SIZE;
+
+    send[1].iov_base = (void *)&msg->data;
+    send[1].iov_len = msg->size;
+
+    if (msg->num_fds) {
+        nfds = msg->num_fds;
+        fds = msg->fds;
+    }
+
+    /*
+     * Dont use in IOThread out of co-routine context as
+     * it will block IOThread.
+     */
+    assert(qemu_in_coroutine() || !iothread);
+
+    /*
+     * Skip unlocking/locking iothread lock when the IOThread is running
+     * in co-routine context. Co-routine context is asserted above
+     * for IOThread case.
+     * Also skip lock handling while in a co-routine in the main context.
+     */
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_unlock_iothread();
+    }
+
+    if (!qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send),
+                                    fds, nfds, errp)) {
+        ret = true;
+    } else {
+        trace_mpqemu_send_io_error(msg->cmd, msg->size, nfds);
+    }
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        /* See above comment why skip locking here. */
+        qemu_mutex_lock_iothread();
+    }
+
+    return ret;
+}
+
+/*
+ * Read message from the ioc QIOChannel.
+ * This function is safe to call from:
+ * - From main loop in co-routine context. Will block the main loop if not in
+ *   co-routine context;
+ * - From vCPU thread with no co-routine context and if the channel is not part
+ *   of the main loop handling;
+ * - From IOThread within co-routine context, outside of co-routine context
+ *   will block IOThread;
+ */
+static ssize_t mpqemu_read(QIOChannel *ioc, void *buf, size_t len, int **fds,
+                           size_t *nfds, Error **errp)
+{
+    ERRP_GUARD();
+    struct iovec iov = { .iov_base = buf, .iov_len = len };
+    bool iolock = qemu_mutex_iothread_locked();
+    bool iothread = qemu_in_iothread();
+    int ret = -1;
+
+    /*
+     * Dont use in IOThread out of co-routine context as
+     * it will block IOThread.
+     */
+    assert(qemu_in_coroutine() || !iothread);
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_unlock_iothread();
+    }
+
+    ret = qio_channel_readv_full_all(ioc, &iov, 1, fds, nfds, errp);
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_lock_iothread();
+    }
+
+    return (ret <= 0) ? ret : iov.iov_len;
+}
+
+bool mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
+{
+    ERRP_GUARD();
+    g_autofree int *fds = NULL;
+    size_t nfds = 0;
+    ssize_t len;
+    bool ret = false;
+
+    len = mpqemu_read(ioc, msg, MPQEMU_MSG_HDR_SIZE, &fds, &nfds, errp);
+    if (len <= 0) {
+        goto fail;
+    } else if (len != MPQEMU_MSG_HDR_SIZE) {
+        error_setg(errp, "Message header corrupted");
+        goto fail;
+    }
+
+    if (msg->size > sizeof(msg->data)) {
+        error_setg(errp, "Invalid size for message");
+        goto fail;
+    }
+
+    if (!msg->size) {
+        goto copy_fds;
+    }
+
+    len = mpqemu_read(ioc, &msg->data, msg->size, NULL, NULL, errp);
+    if (len <= 0) {
+        goto fail;
+    }
+    if (len != msg->size) {
+        error_setg(errp, "Unable to read full message");
+        goto fail;
+    }
+
+copy_fds:
+    msg->num_fds = nfds;
+    if (nfds > G_N_ELEMENTS(msg->fds)) {
+        error_setg(errp,
+                   "Overflow error: received %zu fds, more than max of %d fds",
+                   nfds, REMOTE_MAX_FDS);
+        goto fail;
+    }
+    if (nfds) {
+        memcpy(msg->fds, fds, nfds * sizeof(int));
+    }
+
+    ret = true;
+
+fail:
+    if (*errp) {
+        trace_mpqemu_recv_io_error(msg->cmd, msg->size, nfds);
+    }
+    while (*errp && nfds) {
+        close(fds[nfds - 1]);
+        nfds--;
+    }
+
+    return ret;
+}
+
+bool mpqemu_msg_valid(MPQemuMsg *msg)
+{
+    if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
+        return false;
+    }
+
+    /* Verify FDs. */
+    if (msg->num_fds >= REMOTE_MAX_FDS) {
+        return false;
+    }
+
+    if (msg->num_fds > 0) {
+        for (int i = 0; i < msg->num_fds; i++) {
+            if (fcntl(msg->fds[i], F_GETFL) == -1) {
+                return false;
+            }
+        }
+    }
+
+    return true;
+}
diff --git a/iothread.c b/iothread.c
index 69eff9e..f606871 100644
--- a/iothread.c
+++ b/iothread.c
@@ -375,3 +375,9 @@ IOThread *iothread_by_id(const char *id)
 {
     return IOTHREAD(object_resolve_path_type(id, TYPE_IOTHREAD, NULL));
 }
+
+bool qemu_in_iothread(void)
+{
+    return qemu_get_current_aio_context() == qemu_get_aio_context() ?
+                    false : true;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 6ec2c26..68d3733 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3157,6 +3157,8 @@ F: hw/pci-host/remote.c
 F: include/hw/pci-host/remote.h
 F: hw/remote/machine.c
 F: include/hw/remote/machine.h
+F: hw/remote/mpqemu-link.c
+F: include/hw/remote/mpqemu-link.h
 
 Build and test automation
 -------------------------
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 197b038..a2b2fc0 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -1,5 +1,6 @@
 remote_ss = ss.source_set()
 
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('machine.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('mpqemu-link.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
new file mode 100644
index 0000000..0b23974
--- /dev/null
+++ b/hw/remote/trace-events
@@ -0,0 +1,4 @@
+# multi-process trace events
+
+mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
+mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
-- 
1.8.3.1


