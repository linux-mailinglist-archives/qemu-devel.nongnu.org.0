Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C78F689290
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 09:48:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNriF-00005c-7k; Fri, 03 Feb 2023 03:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhw-0008NK-TI
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pNrhm-0007VX-OU
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 03:46:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675413957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2MnWFx9wWpXB3+vTh6+XNMO4qdvuyclTiJ5lFzby2c=;
 b=i8s6pL37rmIDqwIvxuEg+Qjy1NdHBJ8OKgbRNMwJtYQ2FxdkWIGV4aG4L1pl+8yFFzeLBN
 OUviID9AooSe3p3aYD1eAJY7DFbhPXim0WD0ycGysgYN8AVm9VGedid3Ii6LBlALBefB3B
 cLUFTWh6myB554xUsleHwgYv7T/J78I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-xi5XqdGwOBK5EnedsU2FNQ-1; Fri, 03 Feb 2023 03:45:54 -0500
X-MC-Unique: xi5XqdGwOBK5EnedsU2FNQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 302BF38149C0;
 Fri,  3 Feb 2023 08:45:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4792C15BAE;
 Fri,  3 Feb 2023 08:45:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 000AF21E6882; Fri,  3 Feb 2023 09:45:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 29/35] monitor: Split file descriptor passing stuff off misc.c
Date: Fri,  3 Feb 2023 09:45:43 +0100
Message-Id: <20230203084549.2622302-30-armbru@redhat.com>
In-Reply-To: <20230203084549.2622302-1-armbru@redhat.com>
References: <20230203084549.2622302-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230124121946.1139465-27-armbru@redhat.com>
---
 monitor/fds.c       | 468 ++++++++++++++++++++++++++++++++++++++++++++
 monitor/misc.c      | 434 ----------------------------------------
 monitor/meson.build |   1 +
 3 files changed, 469 insertions(+), 434 deletions(-)
 create mode 100644 monitor/fds.c

diff --git a/monitor/fds.c b/monitor/fds.c
new file mode 100644
index 0000000000..26b39a0ce6
--- /dev/null
+++ b/monitor/fds.c
@@ -0,0 +1,468 @@
+/*
+ * QEMU monitor file descriptor passing
+ *
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "monitor-internal.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-misc.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu/ctype.h"
+#include "qemu/cutils.h"
+#include "sysemu/runstate.h"
+
+/* file descriptors passed via SCM_RIGHTS */
+typedef struct mon_fd_t mon_fd_t;
+struct mon_fd_t {
+    char *name;
+    int fd;
+    QLIST_ENTRY(mon_fd_t) next;
+};
+
+/* file descriptor associated with a file descriptor set */
+typedef struct MonFdsetFd MonFdsetFd;
+struct MonFdsetFd {
+    int fd;
+    bool removed;
+    char *opaque;
+    QLIST_ENTRY(MonFdsetFd) next;
+};
+
+/* file descriptor set containing fds passed via SCM_RIGHTS */
+typedef struct MonFdset MonFdset;
+struct MonFdset {
+    int64_t id;
+    QLIST_HEAD(, MonFdsetFd) fds;
+    QLIST_HEAD(, MonFdsetFd) dup_fds;
+    QLIST_ENTRY(MonFdset) next;
+};
+
+/* Protects mon_fdsets */
+static QemuMutex mon_fdsets_lock;
+static QLIST_HEAD(, MonFdset) mon_fdsets;
+
+void qmp_getfd(const char *fdname, Error **errp)
+{
+    Monitor *cur_mon = monitor_cur();
+    mon_fd_t *monfd;
+    int fd, tmp_fd;
+
+    fd = qemu_chr_fe_get_msgfd(&cur_mon->chr);
+    if (fd == -1) {
+        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
+        return;
+    }
+
+    if (qemu_isdigit(fdname[0])) {
+        close(fd);
+        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "fdname",
+                   "a name not starting with a digit");
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
+    QLIST_FOREACH(monfd, &cur_mon->fds, next) {
+        if (strcmp(monfd->name, fdname) != 0) {
+            continue;
+        }
+
+        tmp_fd = monfd->fd;
+        monfd->fd = fd;
+        /* Make sure close() is outside critical section */
+        close(tmp_fd);
+        return;
+    }
+
+    monfd = g_new0(mon_fd_t, 1);
+    monfd->name = g_strdup(fdname);
+    monfd->fd = fd;
+
+    QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
+}
+
+void qmp_closefd(const char *fdname, Error **errp)
+{
+    Monitor *cur_mon = monitor_cur();
+    mon_fd_t *monfd;
+    int tmp_fd;
+
+    qemu_mutex_lock(&cur_mon->mon_lock);
+    QLIST_FOREACH(monfd, &cur_mon->fds, next) {
+        if (strcmp(monfd->name, fdname) != 0) {
+            continue;
+        }
+
+        QLIST_REMOVE(monfd, next);
+        tmp_fd = monfd->fd;
+        g_free(monfd->name);
+        g_free(monfd);
+        qemu_mutex_unlock(&cur_mon->mon_lock);
+        /* Make sure close() is outside critical section */
+        close(tmp_fd);
+        return;
+    }
+
+    qemu_mutex_unlock(&cur_mon->mon_lock);
+    error_setg(errp, "File descriptor named '%s' not found", fdname);
+}
+
+int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
+{
+    mon_fd_t *monfd;
+
+    QEMU_LOCK_GUARD(&mon->mon_lock);
+    QLIST_FOREACH(monfd, &mon->fds, next) {
+        int fd;
+
+        if (strcmp(monfd->name, fdname) != 0) {
+            continue;
+        }
+
+        fd = monfd->fd;
+        assert(fd >= 0);
+
+        /* caller takes ownership of fd */
+        QLIST_REMOVE(monfd, next);
+        g_free(monfd->name);
+        g_free(monfd);
+
+        return fd;
+    }
+
+    error_setg(errp, "File descriptor named '%s' has not been found", fdname);
+    return -1;
+}
+
+static void monitor_fdset_cleanup(MonFdset *mon_fdset)
+{
+    MonFdsetFd *mon_fdset_fd;
+    MonFdsetFd *mon_fdset_fd_next;
+
+    QLIST_FOREACH_SAFE(mon_fdset_fd, &mon_fdset->fds, next, mon_fdset_fd_next) {
+        if ((mon_fdset_fd->removed ||
+                (QLIST_EMPTY(&mon_fdset->dup_fds) && mon_refcount == 0)) &&
+                runstate_is_running()) {
+            close(mon_fdset_fd->fd);
+            g_free(mon_fdset_fd->opaque);
+            QLIST_REMOVE(mon_fdset_fd, next);
+            g_free(mon_fdset_fd);
+        }
+    }
+
+    if (QLIST_EMPTY(&mon_fdset->fds) && QLIST_EMPTY(&mon_fdset->dup_fds)) {
+        QLIST_REMOVE(mon_fdset, next);
+        g_free(mon_fdset);
+    }
+}
+
+void monitor_fdsets_cleanup(void)
+{
+    MonFdset *mon_fdset;
+    MonFdset *mon_fdset_next;
+
+    QEMU_LOCK_GUARD(&mon_fdsets_lock);
+    QLIST_FOREACH_SAFE(mon_fdset, &mon_fdsets, next, mon_fdset_next) {
+        monitor_fdset_cleanup(mon_fdset);
+    }
+}
+
+AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id,
+                      const char *opaque, Error **errp)
+{
+    int fd;
+    Monitor *mon = monitor_cur();
+    AddfdInfo *fdinfo;
+
+    fd = qemu_chr_fe_get_msgfd(&mon->chr);
+    if (fd == -1) {
+        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
+        goto error;
+    }
+
+    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id, opaque, errp);
+    if (fdinfo) {
+        return fdinfo;
+    }
+
+error:
+    if (fd != -1) {
+        close(fd);
+    }
+    return NULL;
+}
+
+void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **errp)
+{
+    MonFdset *mon_fdset;
+    MonFdsetFd *mon_fdset_fd;
+    char fd_str[60];
+
+    QEMU_LOCK_GUARD(&mon_fdsets_lock);
+    QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
+        if (mon_fdset->id != fdset_id) {
+            continue;
+        }
+        QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
+            if (has_fd) {
+                if (mon_fdset_fd->fd != fd) {
+                    continue;
+                }
+                mon_fdset_fd->removed = true;
+                break;
+            } else {
+                mon_fdset_fd->removed = true;
+            }
+        }
+        if (has_fd && !mon_fdset_fd) {
+            goto error;
+        }
+        monitor_fdset_cleanup(mon_fdset);
+        return;
+    }
+
+error:
+    if (has_fd) {
+        snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId64 ", fd:%" PRId64,
+                 fdset_id, fd);
+    } else {
+        snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId64, fdset_id);
+    }
+    error_setg(errp, "File descriptor named '%s' not found", fd_str);
+}
+
+FdsetInfoList *qmp_query_fdsets(Error **errp)
+{
+    MonFdset *mon_fdset;
+    MonFdsetFd *mon_fdset_fd;
+    FdsetInfoList *fdset_list = NULL;
+
+    QEMU_LOCK_GUARD(&mon_fdsets_lock);
+    QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
+        FdsetInfo *fdset_info = g_malloc0(sizeof(*fdset_info));
+
+        fdset_info->fdset_id = mon_fdset->id;
+
+        QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
+            FdsetFdInfo *fdsetfd_info;
+
+            fdsetfd_info = g_malloc0(sizeof(*fdsetfd_info));
+            fdsetfd_info->fd = mon_fdset_fd->fd;
+            fdsetfd_info->opaque = g_strdup(mon_fdset_fd->opaque);
+
+            QAPI_LIST_PREPEND(fdset_info->fds, fdsetfd_info);
+        }
+
+        QAPI_LIST_PREPEND(fdset_list, fdset_info);
+    }
+
+    return fdset_list;
+}
+
+AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
+                                const char *opaque, Error **errp)
+{
+    MonFdset *mon_fdset = NULL;
+    MonFdsetFd *mon_fdset_fd;
+    AddfdInfo *fdinfo;
+
+    QEMU_LOCK_GUARD(&mon_fdsets_lock);
+    if (has_fdset_id) {
+        QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
+            /* Break if match found or match impossible due to ordering by ID */
+            if (fdset_id <= mon_fdset->id) {
+                if (fdset_id < mon_fdset->id) {
+                    mon_fdset = NULL;
+                }
+                break;
+            }
+        }
+    }
+
+    if (mon_fdset == NULL) {
+        int64_t fdset_id_prev = -1;
+        MonFdset *mon_fdset_cur = QLIST_FIRST(&mon_fdsets);
+
+        if (has_fdset_id) {
+            if (fdset_id < 0) {
+                error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "fdset-id",
+                           "a non-negative value");
+                return NULL;
+            }
+            /* Use specified fdset ID */
+            QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
+                mon_fdset_cur = mon_fdset;
+                if (fdset_id < mon_fdset_cur->id) {
+                    break;
+                }
+            }
+        } else {
+            /* Use first available fdset ID */
+            QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
+                mon_fdset_cur = mon_fdset;
+                if (fdset_id_prev == mon_fdset_cur->id - 1) {
+                    fdset_id_prev = mon_fdset_cur->id;
+                    continue;
+                }
+                break;
+            }
+        }
+
+        mon_fdset = g_malloc0(sizeof(*mon_fdset));
+        if (has_fdset_id) {
+            mon_fdset->id = fdset_id;
+        } else {
+            mon_fdset->id = fdset_id_prev + 1;
+        }
+
+        /* The fdset list is ordered by fdset ID */
+        if (!mon_fdset_cur) {
+            QLIST_INSERT_HEAD(&mon_fdsets, mon_fdset, next);
+        } else if (mon_fdset->id < mon_fdset_cur->id) {
+            QLIST_INSERT_BEFORE(mon_fdset_cur, mon_fdset, next);
+        } else {
+            QLIST_INSERT_AFTER(mon_fdset_cur, mon_fdset, next);
+        }
+    }
+
+    mon_fdset_fd = g_malloc0(sizeof(*mon_fdset_fd));
+    mon_fdset_fd->fd = fd;
+    mon_fdset_fd->removed = false;
+    mon_fdset_fd->opaque = g_strdup(opaque);
+    QLIST_INSERT_HEAD(&mon_fdset->fds, mon_fdset_fd, next);
+
+    fdinfo = g_malloc0(sizeof(*fdinfo));
+    fdinfo->fdset_id = mon_fdset->id;
+    fdinfo->fd = mon_fdset_fd->fd;
+
+    return fdinfo;
+}
+
+int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags)
+{
+#ifdef _WIN32
+    return -ENOENT;
+#else
+    MonFdset *mon_fdset;
+
+    QEMU_LOCK_GUARD(&mon_fdsets_lock);
+    QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
+        MonFdsetFd *mon_fdset_fd;
+        MonFdsetFd *mon_fdset_fd_dup;
+        int fd = -1;
+        int dup_fd;
+        int mon_fd_flags;
+
+        if (mon_fdset->id != fdset_id) {
+            continue;
+        }
+
+        QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
+            mon_fd_flags = fcntl(mon_fdset_fd->fd, F_GETFL);
+            if (mon_fd_flags == -1) {
+                return -1;
+            }
+
+            if ((flags & O_ACCMODE) == (mon_fd_flags & O_ACCMODE)) {
+                fd = mon_fdset_fd->fd;
+                break;
+            }
+        }
+
+        if (fd == -1) {
+            errno = EACCES;
+            return -1;
+        }
+
+        dup_fd = qemu_dup_flags(fd, flags);
+        if (dup_fd == -1) {
+            return -1;
+        }
+
+        mon_fdset_fd_dup = g_malloc0(sizeof(*mon_fdset_fd_dup));
+        mon_fdset_fd_dup->fd = dup_fd;
+        QLIST_INSERT_HEAD(&mon_fdset->dup_fds, mon_fdset_fd_dup, next);
+        return dup_fd;
+    }
+
+    errno = ENOENT;
+    return -1;
+#endif
+}
+
+static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
+{
+    MonFdset *mon_fdset;
+    MonFdsetFd *mon_fdset_fd_dup;
+
+    QEMU_LOCK_GUARD(&mon_fdsets_lock);
+    QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
+        QLIST_FOREACH(mon_fdset_fd_dup, &mon_fdset->dup_fds, next) {
+            if (mon_fdset_fd_dup->fd == dup_fd) {
+                if (remove) {
+                    QLIST_REMOVE(mon_fdset_fd_dup, next);
+                    g_free(mon_fdset_fd_dup);
+                    if (QLIST_EMPTY(&mon_fdset->dup_fds)) {
+                        monitor_fdset_cleanup(mon_fdset);
+                    }
+                    return -1;
+                } else {
+                    return mon_fdset->id;
+                }
+            }
+        }
+    }
+
+    return -1;
+}
+
+int64_t monitor_fdset_dup_fd_find(int dup_fd)
+{
+    return monitor_fdset_dup_fd_find_remove(dup_fd, false);
+}
+
+void monitor_fdset_dup_fd_remove(int dup_fd)
+{
+    monitor_fdset_dup_fd_find_remove(dup_fd, true);
+}
+
+int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
+{
+    int fd;
+
+    if (!qemu_isdigit(fdname[0]) && mon) {
+        fd = monitor_get_fd(mon, fdname, errp);
+    } else {
+        fd = qemu_parse_fd(fdname);
+        if (fd < 0) {
+            error_setg(errp, "Invalid file descriptor number '%s'",
+                       fdname);
+        }
+    }
+
+    return fd;
+}
+
+static void __attribute__((__constructor__)) monitor_fds_init(void)
+{
+    qemu_mutex_init(&mon_fdsets_lock);
+}
diff --git a/monitor/misc.c b/monitor/misc.c
index c76d583b4f..c531d95b5b 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -27,11 +27,9 @@
 #include "monitor/qdev.h"
 #include "exec/gdbstub.h"
 #include "net/slirp.h"
-#include "qemu/ctype.h"
 #include "disas/disas.h"
 #include "qemu/log.h"
 #include "sysemu/hw_accel.h"
-#include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/device_tree.h"
 #include "qapi/qmp/qdict.h"
@@ -56,36 +54,6 @@
 /* Make devices configuration available for use in hmp-commands*.hx templates */
 #include CONFIG_DEVICES
 
-/* file descriptors passed via SCM_RIGHTS */
-typedef struct mon_fd_t mon_fd_t;
-struct mon_fd_t {
-    char *name;
-    int fd;
-    QLIST_ENTRY(mon_fd_t) next;
-};
-
-/* file descriptor associated with a file descriptor set */
-typedef struct MonFdsetFd MonFdsetFd;
-struct MonFdsetFd {
-    int fd;
-    bool removed;
-    char *opaque;
-    QLIST_ENTRY(MonFdsetFd) next;
-};
-
-/* file descriptor set containing fds passed via SCM_RIGHTS */
-typedef struct MonFdset MonFdset;
-struct MonFdset {
-    int64_t id;
-    QLIST_HEAD(, MonFdsetFd) fds;
-    QLIST_HEAD(, MonFdsetFd) dup_fds;
-    QLIST_ENTRY(MonFdset) next;
-};
-
-/* Protects mon_fdsets */
-static QemuMutex mon_fdsets_lock;
-static QLIST_HEAD(, MonFdset) mon_fdsets;
-
 static HMPCommand hmp_info_cmds[];
 
 char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
@@ -746,407 +714,6 @@ static void hmp_info_mtree(Monitor *mon, const QDict *qdict)
     mtree_info(flatview, dispatch_tree, owner, disabled);
 }
 
-void qmp_getfd(const char *fdname, Error **errp)
-{
-    Monitor *cur_mon = monitor_cur();
-    mon_fd_t *monfd;
-    int fd, tmp_fd;
-
-    fd = qemu_chr_fe_get_msgfd(&cur_mon->chr);
-    if (fd == -1) {
-        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
-        return;
-    }
-
-    if (qemu_isdigit(fdname[0])) {
-        close(fd);
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "fdname",
-                   "a name not starting with a digit");
-        return;
-    }
-
-    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
-    QLIST_FOREACH(monfd, &cur_mon->fds, next) {
-        if (strcmp(monfd->name, fdname) != 0) {
-            continue;
-        }
-
-        tmp_fd = monfd->fd;
-        monfd->fd = fd;
-        /* Make sure close() is outside critical section */
-        close(tmp_fd);
-        return;
-    }
-
-    monfd = g_new0(mon_fd_t, 1);
-    monfd->name = g_strdup(fdname);
-    monfd->fd = fd;
-
-    QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
-}
-
-void qmp_closefd(const char *fdname, Error **errp)
-{
-    Monitor *cur_mon = monitor_cur();
-    mon_fd_t *monfd;
-    int tmp_fd;
-
-    qemu_mutex_lock(&cur_mon->mon_lock);
-    QLIST_FOREACH(monfd, &cur_mon->fds, next) {
-        if (strcmp(monfd->name, fdname) != 0) {
-            continue;
-        }
-
-        QLIST_REMOVE(monfd, next);
-        tmp_fd = monfd->fd;
-        g_free(monfd->name);
-        g_free(monfd);
-        qemu_mutex_unlock(&cur_mon->mon_lock);
-        /* Make sure close() is outside critical section */
-        close(tmp_fd);
-        return;
-    }
-
-    qemu_mutex_unlock(&cur_mon->mon_lock);
-    error_setg(errp, "File descriptor named '%s' not found", fdname);
-}
-
-int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
-{
-    mon_fd_t *monfd;
-
-    QEMU_LOCK_GUARD(&mon->mon_lock);
-    QLIST_FOREACH(monfd, &mon->fds, next) {
-        int fd;
-
-        if (strcmp(monfd->name, fdname) != 0) {
-            continue;
-        }
-
-        fd = monfd->fd;
-        assert(fd >= 0);
-
-        /* caller takes ownership of fd */
-        QLIST_REMOVE(monfd, next);
-        g_free(monfd->name);
-        g_free(monfd);
-
-        return fd;
-    }
-
-    error_setg(errp, "File descriptor named '%s' has not been found", fdname);
-    return -1;
-}
-
-static void monitor_fdset_cleanup(MonFdset *mon_fdset)
-{
-    MonFdsetFd *mon_fdset_fd;
-    MonFdsetFd *mon_fdset_fd_next;
-
-    QLIST_FOREACH_SAFE(mon_fdset_fd, &mon_fdset->fds, next, mon_fdset_fd_next) {
-        if ((mon_fdset_fd->removed ||
-                (QLIST_EMPTY(&mon_fdset->dup_fds) && mon_refcount == 0)) &&
-                runstate_is_running()) {
-            close(mon_fdset_fd->fd);
-            g_free(mon_fdset_fd->opaque);
-            QLIST_REMOVE(mon_fdset_fd, next);
-            g_free(mon_fdset_fd);
-        }
-    }
-
-    if (QLIST_EMPTY(&mon_fdset->fds) && QLIST_EMPTY(&mon_fdset->dup_fds)) {
-        QLIST_REMOVE(mon_fdset, next);
-        g_free(mon_fdset);
-    }
-}
-
-void monitor_fdsets_cleanup(void)
-{
-    MonFdset *mon_fdset;
-    MonFdset *mon_fdset_next;
-
-    QEMU_LOCK_GUARD(&mon_fdsets_lock);
-    QLIST_FOREACH_SAFE(mon_fdset, &mon_fdsets, next, mon_fdset_next) {
-        monitor_fdset_cleanup(mon_fdset);
-    }
-}
-
-AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id,
-                      const char *opaque, Error **errp)
-{
-    int fd;
-    Monitor *mon = monitor_cur();
-    AddfdInfo *fdinfo;
-
-    fd = qemu_chr_fe_get_msgfd(&mon->chr);
-    if (fd == -1) {
-        error_setg(errp, "No file descriptor supplied via SCM_RIGHTS");
-        goto error;
-    }
-
-    fdinfo = monitor_fdset_add_fd(fd, has_fdset_id, fdset_id, opaque, errp);
-    if (fdinfo) {
-        return fdinfo;
-    }
-
-error:
-    if (fd != -1) {
-        close(fd);
-    }
-    return NULL;
-}
-
-void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **errp)
-{
-    MonFdset *mon_fdset;
-    MonFdsetFd *mon_fdset_fd;
-    char fd_str[60];
-
-    QEMU_LOCK_GUARD(&mon_fdsets_lock);
-    QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
-        if (mon_fdset->id != fdset_id) {
-            continue;
-        }
-        QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
-            if (has_fd) {
-                if (mon_fdset_fd->fd != fd) {
-                    continue;
-                }
-                mon_fdset_fd->removed = true;
-                break;
-            } else {
-                mon_fdset_fd->removed = true;
-            }
-        }
-        if (has_fd && !mon_fdset_fd) {
-            goto error;
-        }
-        monitor_fdset_cleanup(mon_fdset);
-        return;
-    }
-
-error:
-    if (has_fd) {
-        snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId64 ", fd:%" PRId64,
-                 fdset_id, fd);
-    } else {
-        snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId64, fdset_id);
-    }
-    error_setg(errp, "File descriptor named '%s' not found", fd_str);
-}
-
-FdsetInfoList *qmp_query_fdsets(Error **errp)
-{
-    MonFdset *mon_fdset;
-    MonFdsetFd *mon_fdset_fd;
-    FdsetInfoList *fdset_list = NULL;
-
-    QEMU_LOCK_GUARD(&mon_fdsets_lock);
-    QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
-        FdsetInfo *fdset_info = g_malloc0(sizeof(*fdset_info));
-
-        fdset_info->fdset_id = mon_fdset->id;
-
-        QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
-            FdsetFdInfo *fdsetfd_info;
-
-            fdsetfd_info = g_malloc0(sizeof(*fdsetfd_info));
-            fdsetfd_info->fd = mon_fdset_fd->fd;
-            fdsetfd_info->opaque = g_strdup(mon_fdset_fd->opaque);
-
-            QAPI_LIST_PREPEND(fdset_info->fds, fdsetfd_info);
-        }
-
-        QAPI_LIST_PREPEND(fdset_list, fdset_info);
-    }
-
-    return fdset_list;
-}
-
-AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
-                                const char *opaque, Error **errp)
-{
-    MonFdset *mon_fdset = NULL;
-    MonFdsetFd *mon_fdset_fd;
-    AddfdInfo *fdinfo;
-
-    QEMU_LOCK_GUARD(&mon_fdsets_lock);
-    if (has_fdset_id) {
-        QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
-            /* Break if match found or match impossible due to ordering by ID */
-            if (fdset_id <= mon_fdset->id) {
-                if (fdset_id < mon_fdset->id) {
-                    mon_fdset = NULL;
-                }
-                break;
-            }
-        }
-    }
-
-    if (mon_fdset == NULL) {
-        int64_t fdset_id_prev = -1;
-        MonFdset *mon_fdset_cur = QLIST_FIRST(&mon_fdsets);
-
-        if (has_fdset_id) {
-            if (fdset_id < 0) {
-                error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "fdset-id",
-                           "a non-negative value");
-                return NULL;
-            }
-            /* Use specified fdset ID */
-            QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
-                mon_fdset_cur = mon_fdset;
-                if (fdset_id < mon_fdset_cur->id) {
-                    break;
-                }
-            }
-        } else {
-            /* Use first available fdset ID */
-            QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
-                mon_fdset_cur = mon_fdset;
-                if (fdset_id_prev == mon_fdset_cur->id - 1) {
-                    fdset_id_prev = mon_fdset_cur->id;
-                    continue;
-                }
-                break;
-            }
-        }
-
-        mon_fdset = g_malloc0(sizeof(*mon_fdset));
-        if (has_fdset_id) {
-            mon_fdset->id = fdset_id;
-        } else {
-            mon_fdset->id = fdset_id_prev + 1;
-        }
-
-        /* The fdset list is ordered by fdset ID */
-        if (!mon_fdset_cur) {
-            QLIST_INSERT_HEAD(&mon_fdsets, mon_fdset, next);
-        } else if (mon_fdset->id < mon_fdset_cur->id) {
-            QLIST_INSERT_BEFORE(mon_fdset_cur, mon_fdset, next);
-        } else {
-            QLIST_INSERT_AFTER(mon_fdset_cur, mon_fdset, next);
-        }
-    }
-
-    mon_fdset_fd = g_malloc0(sizeof(*mon_fdset_fd));
-    mon_fdset_fd->fd = fd;
-    mon_fdset_fd->removed = false;
-    mon_fdset_fd->opaque = g_strdup(opaque);
-    QLIST_INSERT_HEAD(&mon_fdset->fds, mon_fdset_fd, next);
-
-    fdinfo = g_malloc0(sizeof(*fdinfo));
-    fdinfo->fdset_id = mon_fdset->id;
-    fdinfo->fd = mon_fdset_fd->fd;
-
-    return fdinfo;
-}
-
-int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags)
-{
-#ifdef _WIN32
-    return -ENOENT;
-#else
-    MonFdset *mon_fdset;
-
-    QEMU_LOCK_GUARD(&mon_fdsets_lock);
-    QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
-        MonFdsetFd *mon_fdset_fd;
-        MonFdsetFd *mon_fdset_fd_dup;
-        int fd = -1;
-        int dup_fd;
-        int mon_fd_flags;
-
-        if (mon_fdset->id != fdset_id) {
-            continue;
-        }
-
-        QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
-            mon_fd_flags = fcntl(mon_fdset_fd->fd, F_GETFL);
-            if (mon_fd_flags == -1) {
-                return -1;
-            }
-
-            if ((flags & O_ACCMODE) == (mon_fd_flags & O_ACCMODE)) {
-                fd = mon_fdset_fd->fd;
-                break;
-            }
-        }
-
-        if (fd == -1) {
-            errno = EACCES;
-            return -1;
-        }
-
-        dup_fd = qemu_dup_flags(fd, flags);
-        if (dup_fd == -1) {
-            return -1;
-        }
-
-        mon_fdset_fd_dup = g_malloc0(sizeof(*mon_fdset_fd_dup));
-        mon_fdset_fd_dup->fd = dup_fd;
-        QLIST_INSERT_HEAD(&mon_fdset->dup_fds, mon_fdset_fd_dup, next);
-        return dup_fd;
-    }
-
-    errno = ENOENT;
-    return -1;
-#endif
-}
-
-static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
-{
-    MonFdset *mon_fdset;
-    MonFdsetFd *mon_fdset_fd_dup;
-
-    QEMU_LOCK_GUARD(&mon_fdsets_lock);
-    QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
-        QLIST_FOREACH(mon_fdset_fd_dup, &mon_fdset->dup_fds, next) {
-            if (mon_fdset_fd_dup->fd == dup_fd) {
-                if (remove) {
-                    QLIST_REMOVE(mon_fdset_fd_dup, next);
-                    g_free(mon_fdset_fd_dup);
-                    if (QLIST_EMPTY(&mon_fdset->dup_fds)) {
-                        monitor_fdset_cleanup(mon_fdset);
-                    }
-                    return -1;
-                } else {
-                    return mon_fdset->id;
-                }
-            }
-        }
-    }
-
-    return -1;
-}
-
-int64_t monitor_fdset_dup_fd_find(int dup_fd)
-{
-    return monitor_fdset_dup_fd_find_remove(dup_fd, false);
-}
-
-void monitor_fdset_dup_fd_remove(int dup_fd)
-{
-    monitor_fdset_dup_fd_find_remove(dup_fd, true);
-}
-
-int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
-{
-    int fd;
-
-    if (!qemu_isdigit(fdname[0]) && mon) {
-        fd = monitor_get_fd(mon, fdname, errp);
-    } else {
-        fd = qemu_parse_fd(fdname);
-        if (fd < 0) {
-            error_setg(errp, "Invalid file descriptor number '%s'",
-                       fdname);
-        }
-    }
-
-    return fd;
-}
-
 /* Please update hmp-commands.hx when adding or changing commands */
 static HMPCommand hmp_info_cmds[] = {
 #include "hmp-commands-info.h"
@@ -1260,5 +827,4 @@ void monitor_init_globals(void)
     monitor_init_globals_core();
     monitor_init_qmp_commands();
     sortcmdlist();
-    qemu_mutex_init(&mon_fdsets_lock);
 }
diff --git a/monitor/meson.build b/monitor/meson.build
index 6d00985ace..435d8abd06 100644
--- a/monitor/meson.build
+++ b/monitor/meson.build
@@ -1,6 +1,7 @@
 qmp_ss.add(files('monitor.c', 'qmp.c', 'qmp-cmds-control.c'))
 
 softmmu_ss.add(files(
+  'fds.c',
   'hmp-cmds.c',
   'hmp.c',
 ))
-- 
2.39.0


