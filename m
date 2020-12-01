Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A722CAD84
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 21:40:09 +0100 (CET)
Received: from localhost ([::1]:40720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCRU-0001wU-7E
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 15:40:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCDI-0000EZ-46
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:25:28 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:46078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kkCDF-0001H5-0F
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 15:25:27 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KPJKl149735;
 Tue, 1 Dec 2020 20:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references : mime-version : content-type : content-transfer-encoding;
 s=corp-2020-01-29; bh=+XaAH/2m+xOt4M9tbAvYu1uFho058HeY7VrHr67B+YQ=;
 b=zW6WIhankL2MR8xsBSynKG0M/fjG5NYnge5RYTI9PkKNSJwLuNHL4AXu/I4pnnzFHUuA
 wHF0UgQDFV3aNZ1E66emBcGPM5WXToQVPhUm/hSao4lKaa1nuoGoIMMq5rtFVtTr05RQ
 tuWNLCAWVwjUoFJNN8PiW4wIU5ryC4W+4jow35Mj5ggnZ0U8gbxJVKGk099U/fEB3bLB
 I+hw1xH12SZhxKNDYRQ+z5Vsk3v9gZZMkCxqruKrxvhi9eLMPEdzmEOZp3YOEXMoPSPX
 Rn8sPHkO4319bD0pCS7Sa9HYSXfV6ZSVNRsbH+aM18PBk6L0hfryQMB6Euz9KPSk8wM5 MA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 353egkmmc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 20:25:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B1KGIbs119917;
 Tue, 1 Dec 2020 20:23:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 3540asyv7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 20:23:18 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B1KNHOG012949;
 Tue, 1 Dec 2020 20:23:17 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 01 Dec 2020 20:23:17 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 08/19] multi-process: define MPQemuMsg format and
 transmission functions
Date: Tue,  1 Dec 2020 15:22:43 -0500
Message-Id: <b9bcba65f98a763669255dd1bc6533bc8310a235.1606853298.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1606853298.git.jag.raman@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <cover.1606853298.git.jag.raman@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=4
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012010122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9822
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 suspectscore=4
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010123
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
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
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Defines MPQemuMsg, which is the message that is sent to the remote
process. This message is sent over QIOChannel and is used to
command the remote process to perform various tasks.
Define transmission functions used by proxy and by remote.
There are certain restrictions on where its safe to use these
functions:
  - From main loop in co-routine context. Will block the main loop if not in
    co-routine context;
  - From vCPU thread with no co-routine context and if the channel is not part
    of the main loop handling;
  - From IOThread within co-routine context, outside of co-routine context will
    block IOThread;

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 include/hw/remote/mpqemu-link.h |  60 ++++++++++
 hw/remote/mpqemu-link.c         | 242 ++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                     |   2 +
 hw/remote/meson.build           |   1 +
 4 files changed, 305 insertions(+)
 create mode 100644 include/hw/remote/mpqemu-link.h
 create mode 100644 hw/remote/mpqemu-link.c

diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
new file mode 100644
index 0000000..2d79ff8
--- /dev/null
+++ b/include/hw/remote/mpqemu-link.h
@@ -0,0 +1,60 @@
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
+ */
+typedef enum {
+    MPQEMU_CMD_INIT,
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
+void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
+void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp);
+
+bool mpqemu_msg_valid(MPQemuMsg *msg);
+
+#endif
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
new file mode 100644
index 0000000..e535ed2
--- /dev/null
+++ b/hw/remote/mpqemu-link.c
@@ -0,0 +1,242 @@
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
+
+/*
+ * Send message over the ioc QIOChannel.
+ * This function is safe to call from:
+ * - From main loop in co-routine context. Will block the main loop if not in
+ *   co-routine context;
+ * - From vCPU thread with no co-routine context and if the channel is not part
+ *   of the main loop handling;
+ * - From IOThread within co-routine context, outside of co-routine context
+ *   will block IOThread;
+ */
+void mpqemu_msg_send(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
+{
+    bool iolock = qemu_mutex_iothread_locked();
+    bool iothread = qemu_get_current_aio_context() == qemu_get_aio_context() ?
+                    false : true;
+    Error *local_err = NULL;
+    struct iovec send[2] = {0};
+    int *fds = NULL;
+    size_t nfds = 0;
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
+    /*
+     * Dont use in IOThread out of co-routine context as
+     * it will block IOThread.
+     */
+    if (iothread) {
+        assert(qemu_in_coroutine());
+    }
+    /*
+     * Skip unlocking/locking iothread when in IOThread running
+     * in co-routine context. Co-routine context is asserted above
+     * for IOThread case.
+     * Also skip this while in a co-routine in the main context.
+     */
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        qemu_mutex_unlock_iothread();
+    }
+
+    (void)qio_channel_writev_full_all(ioc, send, G_N_ELEMENTS(send), fds, nfds,
+                                      &local_err);
+
+    if (iolock && !iothread && !qemu_in_coroutine()) {
+        /* See above comment why skip locking here. */
+        qemu_mutex_lock_iothread();
+    }
+
+    if (errp) {
+        error_propagate(errp, local_err);
+    } else if (local_err) {
+        error_report_err(local_err);
+    }
+
+    return;
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
+    struct iovec iov = { .iov_base = buf, .iov_len = len };
+    bool iolock = qemu_mutex_iothread_locked();
+    bool iothread = qemu_get_current_aio_context() == qemu_get_aio_context()
+                        ? false : true;
+    struct iovec *iovp = &iov;
+    Error *local_err = NULL;
+    unsigned int niov = 1;
+    size_t *l_nfds = nfds;
+    int **l_fds = fds;
+    ssize_t bytes = 0;
+    size_t size;
+
+    size = iov.iov_len;
+
+    /*
+     * Dont use in IOThread out of co-routine context as
+     * it will block IOThread.
+     */
+    if (iothread) {
+        assert(qemu_in_coroutine());
+    }
+
+    while (size > 0) {
+        bytes = qio_channel_readv_full(ioc, iovp, niov, l_fds, l_nfds,
+                                       &local_err);
+        if (bytes == QIO_CHANNEL_ERR_BLOCK) {
+            /*
+             * Skip unlocking/locking iothread when in IOThread running
+             * in co-routine context. Co-routine context is asserted above
+             * for IOThread case.
+             * Also skip this while in a co-routine in the main context.
+             */
+            if (iolock && !iothread && !qemu_in_coroutine()) {
+                qemu_mutex_unlock_iothread();
+            }
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(ioc, G_IO_IN);
+            } else {
+                qio_channel_wait(ioc, G_IO_IN);
+            }
+            /* See above comment why skip locking here. */
+            if (iolock && !iothread && !qemu_in_coroutine()) {
+                qemu_mutex_lock_iothread();
+            }
+            continue;
+        }
+
+        if (bytes <= 0) {
+            error_propagate(errp, local_err);
+            return -EIO;
+        }
+
+        l_fds = NULL;
+        l_nfds = NULL;
+
+        size -= bytes;
+
+        (void)iov_discard_front(&iovp, &niov, bytes);
+    }
+
+    return len - size;
+}
+
+void mpqemu_msg_recv(MPQemuMsg *msg, QIOChannel *ioc, Error **errp)
+{
+    Error *local_err = NULL;
+    int *fds = NULL;
+    size_t nfds = 0;
+    ssize_t len;
+
+    len = mpqemu_read(ioc, (void *)msg, MPQEMU_MSG_HDR_SIZE, &fds, &nfds,
+                      &local_err);
+    if (!local_err) {
+        if (len == -EIO) {
+            error_setg(&local_err, "Connection closed.");
+            goto fail;
+        }
+        if (len < 0) {
+            error_setg(&local_err, "Message length is less than 0");
+            goto fail;
+        }
+        if (len != MPQEMU_MSG_HDR_SIZE) {
+            error_setg(&local_err, "Message header corrupted");
+            goto fail;
+        }
+    } else {
+        goto fail;
+    }
+
+    if (msg->size > sizeof(msg->data)) {
+        error_setg(&local_err, "Invalid size for message");
+        goto fail;
+    }
+
+    if (mpqemu_read(ioc, (void *)&msg->data, msg->size, NULL, NULL,
+                    &local_err) < 0) {
+        goto fail;
+    }
+
+    msg->num_fds = nfds;
+    if (nfds > G_N_ELEMENTS(msg->fds)) {
+        error_setg(&local_err,
+                   "Overflow error: received %zu fds, more than max of %d fds",
+                   nfds, REMOTE_MAX_FDS);
+        goto fail;
+    } else if (nfds) {
+        memcpy(msg->fds, fds, nfds * sizeof(int));
+    }
+
+fail:
+    while (local_err && nfds) {
+        close(fds[nfds - 1]);
+        nfds--;
+    }
+
+    g_free(fds);
+
+    if (errp) {
+        error_propagate(errp, local_err);
+    } else if (local_err) {
+        error_report_err(local_err);
+    }
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
diff --git a/MAINTAINERS b/MAINTAINERS
index c45ac1d..d0c891a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3141,6 +3141,8 @@ F: hw/pci-host/remote.c
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
-- 
1.8.3.1


