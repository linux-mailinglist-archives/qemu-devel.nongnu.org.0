Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B654CC12
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:01:38 +0200 (CEST)
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UWW-0005YO-Ul
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOW-0007Db-F1
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:20 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOT-00012z-QM
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:20 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE7fdE002108;
 Wed, 15 Jun 2022 14:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=wgOgQ2fKkp2nz73gI3RaCuUh5lP4MvzBJD8B11cmTjQ=;
 b=niQYA2C9bJP7GG94eyPpwvFufVjPsc9ZP/O9ozR24LtK3yyTbXMuaZwhlFGNjVmktO3h
 1ZaS4IB8DQRpvPquYrV9/pkJwt+XoL9ZNmCANm2RxVsYiN+LsJYBN/irwAJhTXU2HJAV
 fHOJNSpTOqV5LR7JCD7eTU7mZpl6LUqB8Vl676n04oThXOzp9Fcx8QOh5T+QIanDVEXO
 zGGiL6emI4rDsBPpqeDQWgi33BuiF2Ei72P+/HwqDgpLkOpNHExKflcnYCFYrXLewL1z
 bRX336sSylPYwGi0IkqFvHqLw9oi//cJfKCa2V49ygBVdi7Kydogp9GGUE3+mnQ+CzBQ IQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcrsjj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:52 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ737023089; Wed, 15 Jun 2022 14:52:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:51 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNL018501;
 Wed, 15 Jun 2022 14:52:51 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-20; Wed, 15 Jun 2022 14:52:51 +0000
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
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 19/39] cpr: preserve extra state
Date: Wed, 15 Jun 2022 07:52:06 -0700
Message-Id: <1655304746-102776-20-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: fjNeTMlFeq3jgD_RjOzKvIIKCGPEu_ax
X-Proofpoint-GUID: fjNeTMlFeq3jgD_RjOzKvIIKCGPEu_ax
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

cpr must save state that is needed after qemu is restarted, when devices are
realized.  Thus the extra state cannot be saved in the cpr-load vmstate file,
as objects must already exist before that file can be loaded.  Instead,
define auxilliary state structures and vmstate descriptions, not associated
with any registered object, and serialize the aux state to a memfd file.
Deserialize after qemu restarts, before devices are realized.

The following state is saved:
  * cpr mode
  * file descriptor names and values
  * memfd values and properties for anonymous ram blocks

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS             |   2 +
 include/migration/cpr.h |  16 +++
 migration/cpr-state.c   | 330 ++++++++++++++++++++++++++++++++++++++++++++++++
 migration/cpr.c         |  12 --
 migration/meson.build   |   1 +
 migration/trace-events  |   8 ++
 stubs/cpr-state.c       |  27 ++++
 stubs/meson.build       |   1 +
 8 files changed, 385 insertions(+), 12 deletions(-)
 create mode 100644 migration/cpr-state.c
 create mode 100644 stubs/cpr-state.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f9a6362..74a43e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3161,6 +3161,8 @@ F: migration/cpr.c
 F: qapi/cpr.json
 F: stubs/cpr.c
 F: tests/unit/test-strlist.c
+F: migration/cpr-state.c
+F: stubs/cpr-state.c
 
 Record/replay
 M: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index f236cbf..b75dec4 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -15,6 +15,22 @@ void cpr_set_mode(CprMode mode);
 CprMode cpr_get_mode(void);
 bool cpr_enabled(CprMode mode);
 
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
+int cpr_resave_fd(const char *name, int id, int fd, Error **errp);
+int cpr_state_save(Error **errp);
+int cpr_state_load(Error **errp);
+void cpr_state_print(void);
+
 #define CPR_MODE_ALL CPR_MODE__MAX
 
 int cpr_add_blocker(Error **reasonp, Error **errp, CprMode mode, ...);
diff --git a/migration/cpr-state.c b/migration/cpr-state.c
new file mode 100644
index 0000000..ff1e122
--- /dev/null
+++ b/migration/cpr-state.c
@@ -0,0 +1,330 @@
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
+#include "migration/vmstate.h"
+#include "migration/cpr.h"
+#include "migration/qemu-file.h"
+#include "migration/qemu-file-channel.h"
+#include "trace.h"
+
+/*************************************************************************/
+/* cpr state container for all information to be saved. */
+
+typedef QLIST_HEAD(CprNameList, CprName) CprNameList;
+
+typedef struct CprState {
+    CprMode mode;
+    CprNameList fds;            /* list of CprFd */
+    CprNameList memfd;          /* list of CprMemfd */
+} CprState;
+
+static CprState cpr_state = {
+    .mode = CPR_MODE_NONE,
+};
+
+/*************************************************************************/
+/* Misc accessors. */
+
+CprMode cpr_get_mode(void)
+{
+    return cpr_state.mode;
+}
+
+void cpr_set_mode(CprMode mode)
+{
+    cpr_state.mode = mode;
+}
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
+int cpr_resave_fd(const char *name, int id, int fd, Error **errp)
+{
+    int old_fd = cpr_find_fd(name, id);
+
+    if (old_fd < 0) {
+        cpr_save_fd(name, id, fd);
+        return 0;
+    } else if (old_fd == fd) {
+        return 0;
+    } else {
+        error_setg(errp, "fd %s %d already saved with a different value %d",
+                   name, fd, old_fd);
+        return 1;
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
+    qemu_clear_cloexec(mfd);
+    f = qemu_fopen_fd(mfd, true, CPR_STATE_NAME);
+    if (!f) {
+        error_setg(errp, "qemu_fopen_fd %d failed", mfd);
+        return -1;
+    }
+
+    ret = vmstate_save_state(f, &vmstate_cpr_state, &cpr_state, 0);
+    if (ret) {
+        error_setg(errp, "vmstate_save_state error %d", ret);
+        return ret;
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
+    f = qemu_fopen_fd(mfd, false, CPR_STATE_NAME);
+    ret = vmstate_load_state(f, &vmstate_cpr_state, &cpr_state, 1);
+    qemu_fclose(f);
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
diff --git a/migration/cpr.c b/migration/cpr.c
index 76b9225..1cc8738 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -17,18 +17,6 @@
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 
-static CprMode cpr_mode = CPR_MODE_NONE;
-
-CprMode cpr_get_mode(void)
-{
-    return cpr_mode;
-}
-
-void cpr_set_mode(CprMode mode)
-{
-    cpr_mode = mode;
-}
-
 static int cpr_enabled_modes;
 
 void cpr_init(int modes)
diff --git a/migration/meson.build b/migration/meson.build
index 76fcfdb..6bb502d 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -16,6 +16,7 @@ softmmu_ss.add(files(
   'colo-failover.c',
   'colo.c',
   'cpr.c',
+  'cpr-state.c',
   'exec.c',
   'fd.c',
   'global_state.c',
diff --git a/migration/trace-events b/migration/trace-events
index 1aec580..bfde1ac 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -310,6 +310,14 @@ colo_receive_message(const char *msg) "Receive '%s' message"
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
index 0000000..cdd32aa
--- /dev/null
+++ b/stubs/cpr-state.c
@@ -0,0 +1,27 @@
+/*
+ * Copyright (c) 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "migration/cpr.h"
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
+int cpr_resave_fd(const char *name, int id, int fd, Error **errp)
+{
+    return 0;
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index 0d7565b..8186834 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -5,6 +5,7 @@ stub_ss.add(files('blockdev-close-all-bdrv-states.c'))
 stub_ss.add(files('change-state-handler.c'))
 stub_ss.add(files('cmos.c'))
 stub_ss.add(files('cpr.c'))
+stub_ss.add(files('cpr-state.c'))
 stub_ss.add(files('cpu-get-clock.c'))
 stub_ss.add(files('cpus-get-virtual-clock.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
-- 
1.8.3.1


