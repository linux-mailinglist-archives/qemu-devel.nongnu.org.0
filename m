Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E9C60E6E7
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 20:00:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkcv-0008Vy-Qu; Wed, 26 Oct 2022 13:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcs-0008IH-7m
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkco-0005eK-Qr
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666806933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OymUfhOXLF9xfFCS1tHul9cBOUru080vQqs3cL3tkFU=;
 b=fVmNgQXguLd/WMM3hJAAGz4myMnwN5vJQC4tBI/iEjtJDUWYNdrHpuCP6BGJnyhz+44g3E
 A6Ab+8VnJ45z6Zpf2HqpQHW8RHZYa1G5uMySFSIsf+VGsQmW0PCU2yY3Fjybv6c9059zil
 E4qrpvQxCtHDnRXPi7H+b8Sr8G9gSBg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-IkXQS7IIOuWswPY2ehufUw-1; Wed, 26 Oct 2022 13:55:32 -0400
X-MC-Unique: IkXQS7IIOuWswPY2ehufUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC5703814957;
 Wed, 26 Oct 2022 17:55:31 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (ovpn-192-17.brq.redhat.com
 [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83D3C2166B2B;
 Wed, 26 Oct 2022 17:55:30 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 3/8] qga: Add UFS freeze/thaw support for FreeBSD
Date: Wed, 26 Oct 2022 20:55:13 +0300
Message-Id: <20221026175518.2636846-4-kkostiuk@redhat.com>
In-Reply-To: <20221026175518.2636846-1-kkostiuk@redhat.com>
References: <20221026175518.2636846-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

UFS supports FS freezing through ioctl UFSSUSPEND on /dev/ufssuspend.
Frozen FS can be thawed by closing /dev/ufssuspend file descriptior.

Use getmntinfo to get a list of mounted FS.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-bsd.c    | 169 +++++++++++++++++++++++
 qga/commands-common.h |  11 ++
 qga/commands-posix.c  | 308 ++++++++++++++++++++----------------------
 qga/main.c            |   7 +-
 qga/meson.build       |   3 +
 5 files changed, 334 insertions(+), 164 deletions(-)
 create mode 100644 qga/commands-bsd.c

diff --git a/qga/commands-bsd.c b/qga/commands-bsd.c
new file mode 100644
index 0000000000..ca06692179
--- /dev/null
+++ b/qga/commands-bsd.c
@@ -0,0 +1,169 @@
+/*
+ * QEMU Guest Agent BSD-specific command implementations
+ *
+ * Copyright (c) Virtuozzo International GmbH.
+ *
+ * Authors:
+ *  Alexander Ivanov  <alexander.ivanov@virtuozzo.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qga-qapi-commands.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/error.h"
+#include "qemu/queue.h"
+#include "commands-common.h"
+#include <sys/ioctl.h>
+#include <sys/param.h>
+#include <sys/ucred.h>
+#include <sys/mount.h>
+#include <paths.h>
+
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
+bool build_fs_mount_list(FsMountList *mounts, Error **errp)
+{
+    FsMount *mount;
+    struct statfs *mntbuf, *mntp;
+    struct stat statbuf;
+    int i, count, ret;
+
+    count = getmntinfo(&mntbuf, MNT_NOWAIT);
+    if (count == 0) {
+        error_setg_errno(errp, errno, "getmntinfo failed");
+        return false;
+    }
+
+    for (i = 0; i < count; i++) {
+        mntp = &mntbuf[i];
+        ret = stat(mntp->f_mntonname, &statbuf);
+        if (ret != 0) {
+            error_setg_errno(errp, errno, "stat failed on %s",
+                             mntp->f_mntonname);
+            return false;
+        }
+
+        mount = g_new0(FsMount, 1);
+
+        mount->dirname = g_strdup(mntp->f_mntonname);
+        mount->devtype = g_strdup(mntp->f_fstypename);
+        mount->devmajor = major(mount->dev);
+        mount->devminor = minor(mount->dev);
+        mount->fsid = mntp->f_fsid;
+        mount->dev = statbuf.st_dev;
+
+        QTAILQ_INSERT_TAIL(mounts, mount, next);
+    }
+    return true;
+}
+#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
+
+#if defined(CONFIG_FSFREEZE)
+static int ufssuspend_fd = -1;
+static int ufssuspend_cnt;
+
+int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
+                                          strList *mountpoints,
+                                          FsMountList mounts,
+                                          Error **errp)
+{
+    int ret;
+    strList *list;
+    struct FsMount *mount;
+
+    if (ufssuspend_fd != -1) {
+        error_setg(errp, "filesystems have already frozen");
+        return -1;
+    }
+
+    ufssuspend_cnt = 0;
+    ufssuspend_fd = qemu_open(_PATH_UFSSUSPEND, O_RDWR, errp);
+    if (ufssuspend_fd == -1) {
+        return -1;
+    }
+
+    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
+        /*
+         * To issue fsfreeze in the reverse order of mounts, check if the
+         * mount is listed in the list here
+         */
+        if (has_mountpoints) {
+            for (list = mountpoints; list; list = list->next) {
+                if (g_str_equal(list->value, mount->dirname)) {
+                    break;
+                }
+            }
+            if (!list) {
+                continue;
+            }
+        }
+
+        /* Only UFS supports suspend */
+        if (!g_str_equal(mount->devtype, "ufs")) {
+            continue;
+        }
+
+        ret = ioctl(ufssuspend_fd, UFSSUSPEND, &mount->fsid);
+        if (ret == -1) {
+            /*
+             * ioctl returns EBUSY for all the FS except the first one
+             * that was suspended
+             */
+            if (errno == EBUSY) {
+                continue;
+            }
+            error_setg_errno(errp, errno, "failed to freeze %s",
+                             mount->dirname);
+            goto error;
+        }
+        ufssuspend_cnt++;
+    }
+    return ufssuspend_cnt;
+error:
+    close(ufssuspend_fd);
+    ufssuspend_fd = -1;
+    return -1;
+
+}
+
+/*
+ * We don't need to call UFSRESUME ioctl because all the frozen FS
+ * are thawed on /dev/ufssuspend closing.
+ */
+int qmp_guest_fsfreeze_do_thaw(Error **errp)
+{
+    int ret = ufssuspend_cnt;
+    ufssuspend_cnt = 0;
+    if (ufssuspend_fd != -1) {
+        close(ufssuspend_fd);
+        ufssuspend_fd = -1;
+    }
+    return ret;
+}
+
+GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestDiskInfoList *qmp_guest_get_disks(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestDiskStatsInfoList *qmp_guest_get_diskstats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+#endif /* CONFIG_FSFREEZE */
diff --git a/qga/commands-common.h b/qga/commands-common.h
index cb51b1c6e9..d0583c6ddb 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -23,11 +23,22 @@
 #endif
 #endif /* __linux__ */
 
+#ifdef __FreeBSD__
+#include <ufs/ffs/fs.h>
+#ifdef UFSSUSPEND
+#define CONFIG_FSFREEZE
+#endif
+#endif /* __FreeBSD__ */
+
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
 typedef struct FsMount {
     char *dirname;
     char *devtype;
     unsigned int devmajor, devminor;
+#if defined(__FreeBSD__)
+    dev_t dev;
+    fsid_t fsid;
+#endif
     QTAILQ_ENTRY(FsMount) next;
 } FsMount;
 
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index d24f2fafd8..6875ea8888 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -33,20 +33,12 @@
 
 #if defined(__linux__)
 #include <mntent.h>
-#include <linux/fs.h>
 #include <sys/statvfs.h>
 #include <linux/nvme_ioctl.h>
 
 #ifdef CONFIG_LIBUDEV
 #include <libudev.h>
 #endif
-
-#ifdef FIFREEZE
-#define CONFIG_FSFREEZE
-#endif
-#ifdef FITRIM
-#define CONFIG_FSTRIM
-#endif
 #endif
 
 #ifdef __FreeBSD__
@@ -623,9 +615,6 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
     }
 }
 
-/* linux-specific implementations. avoid this if at all possible. */
-#if defined(__linux__)
-
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
 void free_fs_mount_list(FsMountList *mounts)
 {
@@ -644,6 +633,156 @@ void free_fs_mount_list(FsMountList *mounts)
 }
 #endif
 
+#if defined(CONFIG_FSFREEZE)
+typedef enum {
+    FSFREEZE_HOOK_THAW = 0,
+    FSFREEZE_HOOK_FREEZE,
+} FsfreezeHookArg;
+
+static const char *fsfreeze_hook_arg_string[] = {
+    "thaw",
+    "freeze",
+};
+
+static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
+{
+    int status;
+    pid_t pid;
+    const char *hook;
+    const char *arg_str = fsfreeze_hook_arg_string[arg];
+    Error *local_err = NULL;
+
+    hook = ga_fsfreeze_hook(ga_state);
+    if (!hook) {
+        return;
+    }
+    if (access(hook, X_OK) != 0) {
+        error_setg_errno(errp, errno, "can't access fsfreeze hook '%s'", hook);
+        return;
+    }
+
+    slog("executing fsfreeze hook with arg '%s'", arg_str);
+    pid = fork();
+    if (pid == 0) {
+        setsid();
+        reopen_fd_to_null(0);
+        reopen_fd_to_null(1);
+        reopen_fd_to_null(2);
+
+        execl(hook, hook, arg_str, NULL);
+        _exit(EXIT_FAILURE);
+    } else if (pid < 0) {
+        error_setg_errno(errp, errno, "failed to create child process");
+        return;
+    }
+
+    ga_wait_child(pid, &status, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    if (!WIFEXITED(status)) {
+        error_setg(errp, "fsfreeze hook has terminated abnormally");
+        return;
+    }
+
+    status = WEXITSTATUS(status);
+    if (status) {
+        error_setg(errp, "fsfreeze hook has failed with status %d", status);
+        return;
+    }
+}
+
+/*
+ * Return status of freeze/thaw
+ */
+GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
+{
+    if (ga_is_frozen(ga_state)) {
+        return GUEST_FSFREEZE_STATUS_FROZEN;
+    }
+
+    return GUEST_FSFREEZE_STATUS_THAWED;
+}
+
+int64_t qmp_guest_fsfreeze_freeze(Error **errp)
+{
+    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
+}
+
+int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
+                                       strList *mountpoints,
+                                       Error **errp)
+{
+    int ret;
+    FsMountList mounts;
+    Error *local_err = NULL;
+
+    slog("guest-fsfreeze called");
+
+    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return -1;
+    }
+
+    QTAILQ_INIT(&mounts);
+    if (!build_fs_mount_list(&mounts, &local_err)) {
+        error_propagate(errp, local_err);
+        return -1;
+    }
+
+    /* cannot risk guest agent blocking itself on a write in this state */
+    ga_set_frozen(ga_state);
+
+    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoints,
+                                            mounts, errp);
+
+    free_fs_mount_list(&mounts);
+    /* We may not issue any FIFREEZE here.
+     * Just unset ga_state here and ready for the next call.
+     */
+    if (ret == 0) {
+        ga_unset_frozen(ga_state);
+    } else if (ret < 0) {
+        qmp_guest_fsfreeze_thaw(NULL);
+    }
+    return ret;
+}
+
+int64_t qmp_guest_fsfreeze_thaw(Error **errp)
+{
+    int ret;
+
+    ret = qmp_guest_fsfreeze_do_thaw(errp);
+    if (ret >= 0) {
+        ga_unset_frozen(ga_state);
+        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
+    } else {
+        ret = 0;
+    }
+
+    return ret;
+}
+
+static void guest_fsfreeze_cleanup(void)
+{
+    Error *err = NULL;
+
+    if (ga_is_frozen(ga_state) == GUEST_FSFREEZE_STATUS_FROZEN) {
+        qmp_guest_fsfreeze_thaw(&err);
+        if (err) {
+            slog("failed to clean up frozen filesystems: %s",
+                 error_get_pretty(err));
+            error_free(err);
+        }
+    }
+}
+#endif
+
+/* linux-specific implementations. avoid this if at all possible. */
+#if defined(__linux__)
 #if defined(CONFIG_FSFREEZE)
 
 static char *get_pci_driver(char const *syspath, int pathlen, Error **errp)
@@ -1467,153 +1606,6 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
     free_fs_mount_list(&mounts);
     return ret;
 }
-
-
-typedef enum {
-    FSFREEZE_HOOK_THAW = 0,
-    FSFREEZE_HOOK_FREEZE,
-} FsfreezeHookArg;
-
-static const char *fsfreeze_hook_arg_string[] = {
-    "thaw",
-    "freeze",
-};
-
-static void execute_fsfreeze_hook(FsfreezeHookArg arg, Error **errp)
-{
-    int status;
-    pid_t pid;
-    const char *hook;
-    const char *arg_str = fsfreeze_hook_arg_string[arg];
-    Error *local_err = NULL;
-
-    hook = ga_fsfreeze_hook(ga_state);
-    if (!hook) {
-        return;
-    }
-    if (access(hook, X_OK) != 0) {
-        error_setg_errno(errp, errno, "can't access fsfreeze hook '%s'", hook);
-        return;
-    }
-
-    slog("executing fsfreeze hook with arg '%s'", arg_str);
-    pid = fork();
-    if (pid == 0) {
-        setsid();
-        reopen_fd_to_null(0);
-        reopen_fd_to_null(1);
-        reopen_fd_to_null(2);
-
-        execl(hook, hook, arg_str, NULL);
-        _exit(EXIT_FAILURE);
-    } else if (pid < 0) {
-        error_setg_errno(errp, errno, "failed to create child process");
-        return;
-    }
-
-    ga_wait_child(pid, &status, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
-    if (!WIFEXITED(status)) {
-        error_setg(errp, "fsfreeze hook has terminated abnormally");
-        return;
-    }
-
-    status = WEXITSTATUS(status);
-    if (status) {
-        error_setg(errp, "fsfreeze hook has failed with status %d", status);
-        return;
-    }
-}
-
-/*
- * Return status of freeze/thaw
- */
-GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **errp)
-{
-    if (ga_is_frozen(ga_state)) {
-        return GUEST_FSFREEZE_STATUS_FROZEN;
-    }
-
-    return GUEST_FSFREEZE_STATUS_THAWED;
-}
-
-int64_t qmp_guest_fsfreeze_freeze(Error **errp)
-{
-    return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
-}
-
-int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
-                                       strList *mountpoints,
-                                       Error **errp)
-{
-    int ret;
-    FsMountList mounts;
-    Error *local_err = NULL;
-
-    slog("guest-fsfreeze called");
-
-    execute_fsfreeze_hook(FSFREEZE_HOOK_FREEZE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return -1;
-    }
-
-    QTAILQ_INIT(&mounts);
-    if (!build_fs_mount_list(&mounts, &local_err)) {
-        error_propagate(errp, local_err);
-        return -1;
-    }
-
-    /* cannot risk guest agent blocking itself on a write in this state */
-    ga_set_frozen(ga_state);
-
-    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoints,
-                                            mounts, errp);
-
-    free_fs_mount_list(&mounts);
-    /* We may not issue any FIFREEZE here.
-     * Just unset ga_state here and ready for the next call.
-     */
-    if (ret == 0) {
-        ga_unset_frozen(ga_state);
-    } else if (ret < 0) {
-        qmp_guest_fsfreeze_thaw(NULL);
-    }
-    return ret;
-}
-
-int64_t qmp_guest_fsfreeze_thaw(Error **errp)
-{
-    int ret;
-
-    ret = qmp_guest_fsfreeze_do_thaw(errp);
-    if (ret >= 0) {
-        ga_unset_frozen(ga_state);
-        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
-    } else {
-        ret = 0;
-    }
-
-    return ret;
-}
-
-static void guest_fsfreeze_cleanup(void)
-{
-    Error *err = NULL;
-
-    if (ga_is_frozen(ga_state) == GUEST_FSFREEZE_STATUS_FROZEN) {
-        qmp_guest_fsfreeze_thaw(&err);
-        if (err) {
-            slog("failed to clean up frozen filesystems: %s",
-                 error_get_pretty(err));
-            error_free(err);
-        }
-    }
-}
 #endif /* CONFIG_FSFREEZE */
 
 #if defined(CONFIG_FSTRIM)
diff --git a/qga/main.c b/qga/main.c
index 0d27c97d38..b3580508fa 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -37,12 +37,7 @@
 #include "qga/service-win32.h"
 #include "qga/vss-win32.h"
 #endif
-#ifdef __linux__
-#include <linux/fs.h>
-#ifdef FIFREEZE
-#define CONFIG_FSFREEZE
-#endif
-#endif
+#include "commands-common.h"
 
 #ifndef _WIN32
 #ifdef __FreeBSD__
diff --git a/qga/meson.build b/qga/meson.build
index 932b4e7ca8..3cfb9166e5 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -75,6 +75,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
 qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
   'commands-linux.c',
 ))
+qga_ss.add(when: 'CONFIG_BSD', if_true: files(
+  'commands-bsd.c',
+))
 qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
   'channel-win32.c',
   'commands-win32.c',
-- 
2.25.1


