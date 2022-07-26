Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D52558176A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 18:27:02 +0200 (CEST)
Received: from localhost ([::1]:48398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGNOf-0000E2-6i
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 12:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9f-0002hR-G1
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:31 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGN9b-00069m-NS
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 12:11:31 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26QFn3YC031760;
 Tue, 26 Jul 2022 16:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2022-7-12;
 bh=x9IWBCn4oIQGc5lzeOKqfAYzc9jsiabJWl/fQQx2PfA=;
 b=vpnrEoUPlAOz8fVg+E9OfxE/+H72gn5+16reAtyJXYV0TWFSZuwf0R2VAmhY2Yu9p3Ma
 oRYKIJwqYQIoa/6a3OeNq1qtGeG4qpXDiHY0090bj0r7M/pTiiXUsck4Ha9Lq9aFZDWX
 SW+AacvYRby9vp43Bt4pT+b7j3TCfyVqkahOVkS+HFHAOQEc0HDkrwMyhwVdZjL0an//
 3Fpdka+tKY+Kukmrzzkwvw7ww9OPuJRvdG4m3yHO6+Q0B7OBY3shmZxmMFyLhMm6pAps
 fxTVxP1wq3koieo81a9/gL5BsAAr348KAh9rB4uU66xBxhWNamhJx0vJD/s7eY2VNgmJ aw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4q1ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:16 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26QFswoh006211; Tue, 26 Jul 2022 16:11:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh65bq1y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jul 2022 16:11:15 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26QG5uSp023334;
 Tue, 26 Jul 2022 16:11:15 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with
 ESMTP id 3hh65bq0y5-22; Tue, 26 Jul 2022 16:11:14 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
Subject: [PATCH V9 21/46] cpr: preserve extra state
Date: Tue, 26 Jul 2022 09:10:18 -0700
Message-Id: <1658851843-236870-22-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_04,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207260063
X-Proofpoint-ORIG-GUID: kS9TTxf5SO5XpnF9bWqqNkoWjDO9O2SG
X-Proofpoint-GUID: kS9TTxf5SO5XpnF9bWqqNkoWjDO9O2SG
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

cpr must save state that is needed after qemu is restarted, when devices
are realized.  Thus the extra state cannot be saved in the migration stream
file, as objects must already exist before that file can be loaded.  Instead,
define auxilliary state structures and vmstate descriptions, not associated
with any registered object, and serialize the aux state to a memfd file.
Deserialize after qemu restarts, before devices are realized.

The following state is saved:
  * cpr mode
  * file descriptor names and values
  * memfd values and properties for ram blocks

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS                   |   3 +
 include/migration/cpr-state.h |  30 ++++
 migration/cpr-state.c         | 362 ++++++++++++++++++++++++++++++++++++++++++
 migration/meson.build         |   1 +
 migration/trace-events        |   8 +
 stubs/cpr-state.c             |  26 +++
 stubs/meson.build             |   1 +
 7 files changed, 431 insertions(+)
 create mode 100644 include/migration/cpr-state.h
 create mode 100644 migration/cpr-state.c
 create mode 100644 stubs/cpr-state.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 362cfde..122af30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3165,6 +3165,9 @@ M: Steve Sistare <steven.sistare@oracle.com>
 R: Mark Kanda <mark.kanda@oracle.com>
 S: Maintained
 F: tests/unit/test-strlist.c
+F: include/migration/cpr-state.h
+F: migration/cpr-state.c
+F: stubs/cpr-state.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/include/migration/cpr-state.h b/include/migration/cpr-state.h
new file mode 100644
index 0000000..a9ae6ae
--- /dev/null
+++ b/include/migration/cpr-state.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright (c) 2021, 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef MIGRATION_CPR_STATE_H
+#define MIGRATION_CPR_STATE_H
+
+#include "qapi/qapi-types-migration.h"
+
+typedef int (*cpr_walk_fd_cb)(const char *name, int id, int fd, void *opaque);
+
+void cpr_save_fd(const char *name, int id, int fd);
+void cpr_delete_fd(const char *name, int id);
+int cpr_find_fd(const char *name, int id);
+int cpr_walk_fd(cpr_walk_fd_cb cb, void *handle);
+void cpr_save_memfd(const char *name, int fd, size_t len, size_t maxlen,
+                    uint64_t align);
+int cpr_find_memfd(const char *name, size_t *lenp, size_t *maxlenp,
+                   uint64_t *alignp);
+void cpr_delete_memfd(const char *name);
+void cpr_resave_fd(const char *name, int id, int fd);
+int cpr_state_save(Error **errp);
+void cpr_state_unsave(void);
+int cpr_state_load(Error **errp);
+void cpr_state_print(void);
+
+#endif
diff --git a/migration/cpr-state.c b/migration/cpr-state.c
new file mode 100644
index 0000000..fb34b1a
--- /dev/null
+++ b/migration/cpr-state.c
@@ -0,0 +1,362 @@
+/*
+ * Copyright (c) 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "qemu/queue.h"
+#include "qemu/memfd.h"
+#include "qapi/error.h"
+#include "io/channel-file.h"
+#include "migration/vmstate.h"
+#include "migration/cpr-state.h"
+#include "migration/migration.h"
+#include "migration/misc.h"
+#include "migration/qemu-file.h"
+#include "trace.h"
+
+/*************************************************************************/
+/* cpr state container for all information to be saved. */
+
+typedef QLIST_HEAD(CprNameList, CprName) CprNameList;
+
+typedef struct CprState {
+    MigMode mode;
+    CprNameList fds;            /* list of CprFd */
+    CprNameList memfd;          /* list of CprMemfd */
+} CprState;
+
+static CprState cpr_state = {
+    .mode = MIG_MODE_NORMAL,
+};
+
+/*************************************************************************/
+/* Generic list of names. */
+
+typedef struct CprName {
+    char *name;
+    unsigned int namelen;
+    int id;
+    QLIST_ENTRY(CprName) next;
+} CprName;
+
+static const VMStateDescription vmstate_cpr_name = {
+    .name = "cpr name",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(namelen, CprName),
+        VMSTATE_VBUFFER_ALLOC_UINT32(name, CprName, 0, NULL, namelen),
+        VMSTATE_INT32(id, CprName),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void
+add_name(CprNameList *head, const char *name, int id, CprName *elem)
+{
+    elem->name = g_strdup(name);
+    elem->namelen = strlen(name) + 1;
+    elem->id = id;
+    QLIST_INSERT_HEAD(head, elem, next);
+}
+
+static CprName *find_name(CprNameList *head, const char *name, int id)
+{
+    CprName *elem;
+
+    QLIST_FOREACH(elem, head, next) {
+        if (!strcmp(elem->name, name) && elem->id == id) {
+            return elem;
+        }
+    }
+    return NULL;
+}
+
+static void delete_name(CprNameList *head, const char *name, int id)
+{
+    CprName *elem = find_name(head, name, id);
+
+    if (elem) {
+        QLIST_REMOVE(elem, next);
+        g_free(elem->name);
+        g_free(elem);
+    }
+}
+
+/****************************************************************************/
+/* Lists of named things.  The first field of each entry must be a CprName. */
+
+typedef struct CprFd {
+    CprName name;               /* must be first */
+    int fd;
+} CprFd;
+
+static const VMStateDescription vmstate_cpr_fd = {
+    .name = "cpr fd",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(name, CprFd, 1, vmstate_cpr_name, CprName),
+        VMSTATE_INT32(fd, CprFd),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define CPR_FD(elem)        ((CprFd *)(elem))
+#define CPR_FD_FD(elem)     (CPR_FD(elem)->fd)
+
+void cpr_save_fd(const char *name, int id, int fd)
+{
+    CprFd *elem = g_new0(CprFd, 1);
+
+    trace_cpr_save_fd(name, id, fd);
+    elem->fd = fd;
+    add_name(&cpr_state.fds, name, id, &elem->name);
+}
+
+void cpr_delete_fd(const char *name, int id)
+{
+    trace_cpr_delete_fd(name, id);
+    delete_name(&cpr_state.fds, name, id);
+}
+
+int cpr_find_fd(const char *name, int id)
+{
+    CprName *elem = find_name(&cpr_state.fds, name, id);
+    int fd = elem ? CPR_FD_FD(elem) : -1;
+
+    if (fd >= 0) {
+        /* Set cloexec to prevent fd leaks from fork until the next cpr-exec */
+        qemu_set_cloexec(fd);
+    }
+
+    trace_cpr_find_fd(name, id, fd);
+    return fd;
+}
+
+int cpr_walk_fd(cpr_walk_fd_cb cb, void *opaque)
+{
+    CprName *elem;
+
+    QLIST_FOREACH(elem, &cpr_state.fds, next) {
+        if (cb(elem->name, elem->id, CPR_FD_FD(elem), opaque)) {
+            return 1;
+        }
+    }
+    return 0;
+}
+
+void cpr_resave_fd(const char *name, int id, int fd)
+{
+    CprName *elem = find_name(&cpr_state.fds, name, id);
+    int old_fd = elem ? CPR_FD_FD(elem) : -1;
+
+    if (old_fd < 0) {
+        cpr_save_fd(name, id, fd);
+    } else if (old_fd != fd) {
+        error_setg(&error_fatal,
+                   "internal error: cpr fd '%s' id %d value %d "
+                   "already saved with a different value %d",
+                   name, id, fd, old_fd);
+    }
+}
+
+/*************************************************************************/
+/* A memfd ram block. */
+
+typedef struct CprMemfd {
+    CprName name;               /* must be first */
+    size_t len;
+    size_t maxlen;
+    uint64_t align;
+} CprMemfd;
+
+static const VMStateDescription vmstate_cpr_memfd = {
+    .name = "cpr memfd",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT(name, CprMemfd, 1, vmstate_cpr_name, CprName),
+        VMSTATE_UINT64(len, CprMemfd),
+        VMSTATE_UINT64(maxlen, CprMemfd),
+        VMSTATE_UINT64(align, CprMemfd),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define CPR_MEMFD(elem)        ((CprMemfd *)(elem))
+#define CPR_MEMFD_LEN(elem)    (CPR_MEMFD(elem)->len)
+#define CPR_MEMFD_MAXLEN(elem) (CPR_MEMFD(elem)->maxlen)
+#define CPR_MEMFD_ALIGN(elem)  (CPR_MEMFD(elem)->align)
+
+void cpr_save_memfd(const char *name, int fd, size_t len, size_t maxlen,
+                    uint64_t align)
+{
+    CprMemfd *elem = g_new0(CprMemfd, 1);
+
+    trace_cpr_save_memfd(name, len, maxlen, align);
+    elem->len = len;
+    elem->maxlen = maxlen;
+    elem->align = align;
+    add_name(&cpr_state.memfd, name, 0, &elem->name);
+    cpr_save_fd(name, 0, fd);
+}
+
+void cpr_delete_memfd(const char *name)
+{
+    trace_cpr_delete_memfd(name);
+    delete_name(&cpr_state.memfd, name, 0);
+    cpr_delete_fd(name, 0);
+}
+
+int cpr_find_memfd(const char *name, size_t *lenp, size_t *maxlenp,
+                   uint64_t *alignp)
+{
+    int fd = cpr_find_fd(name, 0);
+    CprName *elem = find_name(&cpr_state.memfd, name, 0);
+
+    if (elem) {
+        *lenp = CPR_MEMFD_LEN(elem);
+        *maxlenp = CPR_MEMFD_MAXLEN(elem);
+        *alignp = CPR_MEMFD_ALIGN(elem);
+    } else {
+        *lenp = 0;
+        *maxlenp = 0;
+        *alignp = 0;
+    }
+
+    trace_cpr_find_memfd(name, *lenp, *maxlenp, *alignp);
+    return fd;
+}
+
+/*************************************************************************/
+/* cpr state container interface and implementation. */
+
+#define CPR_STATE_NAME "QEMU_CPR_STATE"
+
+static const VMStateDescription vmstate_cpr_state = {
+    .name = CPR_STATE_NAME,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(mode, CprState),
+        VMSTATE_QLIST_V(fds, CprState, 1, vmstate_cpr_fd, CprFd, name.next),
+        VMSTATE_QLIST_V(memfd, CprState, 1, vmstate_cpr_memfd, CprMemfd,
+                        name.next),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static QEMUFile *qemu_file_new_fd_input(int fd, const char *name)
+{
+    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
+    QIOChannel *ioc = QIO_CHANNEL(fioc);
+    qio_channel_set_name(ioc, name);
+    return qemu_file_new_input(ioc);
+}
+
+static QEMUFile *qemu_file_new_fd_output(int fd, const char *name)
+{
+    g_autoptr(QIOChannelFile) fioc = qio_channel_file_new_fd(fd);
+    QIOChannel *ioc = QIO_CHANNEL(fioc);
+    qio_channel_set_name(ioc, name);
+    return qemu_file_new_output(ioc);
+}
+
+int cpr_state_save(Error **errp)
+{
+    int ret, mfd;
+    QEMUFile *f;
+    char val[16];
+
+    mfd = memfd_create(CPR_STATE_NAME, 0);
+    if (mfd < 0) {
+        error_setg_errno(errp, errno, "memfd_create failed");
+        return -1;
+    }
+
+    cpr_state.mode = migrate_mode();
+    qemu_clear_cloexec(mfd);
+
+    f = qemu_file_new_fd_output(mfd, CPR_STATE_NAME);
+    ret = vmstate_save_state(f, &vmstate_cpr_state, &cpr_state, 0);
+    if (ret) {
+        error_setg(errp, "vmstate_save_state error %d", ret);
+        goto error;
+    }
+
+    /* Do not close f, as mfd must remain open. */
+    qemu_fflush(f);
+    lseek(mfd, 0, SEEK_SET);
+
+    /* Remember mfd for post-exec cpr_state_load */
+    snprintf(val, sizeof(val), "%d", mfd);
+    g_setenv(CPR_STATE_NAME, val, 1);
+
+    return 0;
+
+error:
+    close(mfd);
+    cpr_state.mode = MIG_MODE_NORMAL;
+    return ret;
+}
+
+void cpr_state_unsave(void)
+{
+    int mfd;
+    const char *val = g_getenv(CPR_STATE_NAME);
+
+    if (val) {
+        g_unsetenv(CPR_STATE_NAME);
+        if (!qemu_strtoi(val, NULL, 10, &mfd)) {
+            close(mfd);
+        }
+    }
+}
+
+int cpr_state_load(Error **errp)
+{
+    int ret, mfd;
+    QEMUFile *f;
+    const char *val = g_getenv(CPR_STATE_NAME);
+
+    if (!val) {
+        return 0;
+    }
+    g_unsetenv(CPR_STATE_NAME);
+    if (qemu_strtoi(val, NULL, 10, &mfd)) {
+        error_setg(errp, "Bad %s env value %s", CPR_STATE_NAME, val);
+        return 1;
+    }
+    f = qemu_file_new_fd_input(mfd, CPR_STATE_NAME);
+    ret = vmstate_load_state(f, &vmstate_cpr_state, &cpr_state, 1);
+    qemu_fclose(f);
+
+    if (!ret) {
+        migrate_get_current()->parameters.mode = cpr_state.mode;
+    } else {
+        error_setg(errp, "vmstate_load_state error %d", ret);
+    }
+
+    return ret;
+}
+
+void cpr_state_print(void)
+{
+    CprName *elem;
+
+    printf("cpr_state:\n");
+    printf("- mode = %d\n", cpr_state.mode);
+    QLIST_FOREACH(elem, &cpr_state.fds, next) {
+        printf("- %s %d : fd=%d\n", elem->name, elem->id, CPR_FD_FD(elem));
+    }
+    QLIST_FOREACH(elem, &cpr_state.memfd, next) {
+        printf("- %s : len=%lu, maxlen=%lu, align=%lu\n", elem->name,
+               CPR_MEMFD_LEN(elem), CPR_MEMFD_MAXLEN(elem),
+               CPR_MEMFD_ALIGN(elem));
+    }
+}
diff --git a/migration/meson.build b/migration/meson.build
index 30a8392..f7d130d 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -15,6 +15,7 @@ softmmu_ss.add(files(
   'channel-block.c',
   'colo-failover.c',
   'colo.c',
+  'cpr-state.c',
   'exec.c',
   'fd.c',
   'file.c',
diff --git a/migration/trace-events b/migration/trace-events
index d72dd85..ed15a22 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -327,6 +327,14 @@ colo_receive_message(const char *msg) "Receive '%s' message"
 # colo-failover.c
 colo_failover_set_state(const char *new_state) "new state %s"
 
+# cpr-state.c
+cpr_save_fd(const char *name, int id, int fd) "%s, id %d, fd %d"
+cpr_delete_fd(const char *name, int id) "%s, id %d"
+cpr_find_fd(const char *name, int id, int fd) "%s, id %d returns %d"
+cpr_save_memfd(const char *name, size_t len, size_t maxlen, uint64_t align) "%s, len %lu, maxlen %lu, align %lu"
+cpr_delete_memfd(const char *name) "%s"
+cpr_find_memfd(const char *name, size_t len, size_t maxlen, uint64_t align) "%s, len %lu, maxlen %lu, align %lu"
+
 # block-dirty-bitmap.c
 send_bitmap_header_enter(void) ""
 send_bitmap_bits(uint32_t flags, uint64_t start_sector, uint32_t nr_sectors, uint64_t data_size) "flags: 0x%x, start_sector: %" PRIu64 ", nr_sectors: %" PRIu32 ", data_size: %" PRIu64
diff --git a/stubs/cpr-state.c b/stubs/cpr-state.c
new file mode 100644
index 0000000..1c9dc78
--- /dev/null
+++ b/stubs/cpr-state.c
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "migration/cpr-state.h"
+
+void cpr_save_fd(const char *name, int id, int fd)
+{
+}
+
+void cpr_delete_fd(const char *name, int id)
+{
+}
+
+int cpr_find_fd(const char *name, int id)
+{
+    return -1;
+}
+
+void cpr_resave_fd(const char *name, int id, int fd)
+{
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index d8f3fd5..392b1b5 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -4,6 +4,7 @@ stub_ss.add(files('blk-exp-close-all.c'))
 stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
+stub_ss.add(files('cpr-state.c'))
 stub_ss.add(files('cpu-get-clock.c'))
 stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
-- 
1.8.3.1


