Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF360E6E3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:59:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkcu-0008QC-BE; Wed, 26 Oct 2022 13:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcq-00086b-7L
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcn-0005e4-A0
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666806932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnv0neNcobe/ntnl4axxcr5ar9MYcckbikluPly7YVg=;
 b=GwanLVBMch3vA5Z5xjw1OWINHtKagKXtEOoRKh82BPy2qMZ+FKzyd25gTWmGZm3Jo89qY0
 ENX4GrwgoszlRwJsY9GXPKwUcQx8NaO9WqPbbaonLxzo9vWvMeHNKpOni0jJZAUEhbzqU9
 iqkSEnFk5XbfS873ZERvlFIIjgoS3g8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-W7seIXaJM4CFE39OZI7W1g-1; Wed, 26 Oct 2022 13:55:30 -0400
X-MC-Unique: W7seIXaJM4CFE39OZI7W1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BF5D8828C9;
 Wed, 26 Oct 2022 17:55:30 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (ovpn-192-17.brq.redhat.com
 [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC792166B4C;
 Wed, 26 Oct 2022 17:55:26 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 2/8] qga: Move Linux-specific FS freeze/thaw code to a separate
 file
Date: Wed, 26 Oct 2022 20:55:12 +0300
Message-Id: <20221026175518.2636846-3-kkostiuk@redhat.com>
In-Reply-To: <20221026175518.2636846-1-kkostiuk@redhat.com>
References: <20221026175518.2636846-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

In the next patches we are going to add FreeBSD support for QEMU Guest
Agent. In the result, code in commands-posix.c will be too cumbersome.

Move Linux-specific FS freeze/thaw code to a separate file commands-linux.c
keeping common POSIX code in commands-posix.c.

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-common.h |  34 +++++
 qga/commands-linux.c  | 286 +++++++++++++++++++++++++++++++++++++++++
 qga/commands-posix.c  | 287 +++---------------------------------------
 qga/meson.build       |   3 +
 4 files changed, 338 insertions(+), 272 deletions(-)
 create mode 100644 qga/commands-linux.c

diff --git a/qga/commands-common.h b/qga/commands-common.h
index d0e4a9696f..cb51b1c6e9 100644
--- a/qga/commands-common.h
+++ b/qga/commands-common.h
@@ -10,6 +10,40 @@
 #define QGA_COMMANDS_COMMON_H
 
 #include "qga-qapi-types.h"
+#include "guest-agent-core.h"
+#include "qemu/queue.h"
+
+#if defined(__linux__)
+#include <linux/fs.h>
+#ifdef FIFREEZE
+#define CONFIG_FSFREEZE
+#endif
+#ifdef FITRIM
+#define CONFIG_FSTRIM
+#endif
+#endif /* __linux__ */
+
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
+typedef struct FsMount {
+    char *dirname;
+    char *devtype;
+    unsigned int devmajor, devminor;
+    QTAILQ_ENTRY(FsMount) next;
+} FsMount;
+
+typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
+
+bool build_fs_mount_list(FsMountList *mounts, Error **errp);
+void free_fs_mount_list(FsMountList *mounts);
+#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
+
+#if defined(CONFIG_FSFREEZE)
+int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
+                                          strList *mountpoints,
+                                          FsMountList mounts,
+                                          Error **errp);
+int qmp_guest_fsfreeze_do_thaw(Error **errp);
+#endif /* CONFIG_FSFREEZE */
 
 typedef struct GuestFileHandle GuestFileHandle;
 
diff --git a/qga/commands-linux.c b/qga/commands-linux.c
new file mode 100644
index 0000000000..214e408fcd
--- /dev/null
+++ b/qga/commands-linux.c
@@ -0,0 +1,286 @@
+/*
+ * QEMU Guest Agent Linux-specific command implementations
+ *
+ * Copyright IBM Corp. 2011
+ *
+ * Authors:
+ *  Michael Roth      <mdroth@linux.vnet.ibm.com>
+ *  Michal Privoznik  <mprivozn@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "commands-common.h"
+#include "cutils.h"
+#include <mntent.h>
+#include <sys/ioctl.h>
+
+#if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
+static int dev_major_minor(const char *devpath,
+                           unsigned int *devmajor, unsigned int *devminor)
+{
+    struct stat st;
+
+    *devmajor = 0;
+    *devminor = 0;
+
+    if (stat(devpath, &st) < 0) {
+        slog("failed to stat device file '%s': %s", devpath, strerror(errno));
+        return -1;
+    }
+    if (S_ISDIR(st.st_mode)) {
+        /* It is bind mount */
+        return -2;
+    }
+    if (S_ISBLK(st.st_mode)) {
+        *devmajor = major(st.st_rdev);
+        *devminor = minor(st.st_rdev);
+        return 0;
+    }
+    return -1;
+}
+
+static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error **errp)
+{
+    struct mntent *ment;
+    FsMount *mount;
+    char const *mtab = "/proc/self/mounts";
+    FILE *fp;
+    unsigned int devmajor, devminor;
+
+    fp = setmntent(mtab, "r");
+    if (!fp) {
+        error_setg(errp, "failed to open mtab file: '%s'", mtab);
+        return false;
+    }
+
+    while ((ment = getmntent(fp))) {
+        /*
+         * An entry which device name doesn't start with a '/' is
+         * either a dummy file system or a network file system.
+         * Add special handling for smbfs and cifs as is done by
+         * coreutils as well.
+         */
+        if ((ment->mnt_fsname[0] != '/') ||
+            (strcmp(ment->mnt_type, "smbfs") == 0) ||
+            (strcmp(ment->mnt_type, "cifs") == 0)) {
+            continue;
+        }
+        if (dev_major_minor(ment->mnt_fsname, &devmajor, &devminor) == -2) {
+            /* Skip bind mounts */
+            continue;
+        }
+
+        mount = g_new0(FsMount, 1);
+        mount->dirname = g_strdup(ment->mnt_dir);
+        mount->devtype = g_strdup(ment->mnt_type);
+        mount->devmajor = devmajor;
+        mount->devminor = devminor;
+
+        QTAILQ_INSERT_TAIL(mounts, mount, next);
+    }
+
+    endmntent(fp);
+    return true;
+}
+
+static void decode_mntname(char *name, int len)
+{
+    int i, j = 0;
+    for (i = 0; i <= len; i++) {
+        if (name[i] != '\\') {
+            name[j++] = name[i];
+        } else if (name[i + 1] == '\\') {
+            name[j++] = '\\';
+            i++;
+        } else if (name[i + 1] >= '0' && name[i + 1] <= '3' &&
+                   name[i + 2] >= '0' && name[i + 2] <= '7' &&
+                   name[i + 3] >= '0' && name[i + 3] <= '7') {
+            name[j++] = (name[i + 1] - '0') * 64 +
+                        (name[i + 2] - '0') * 8 +
+                        (name[i + 3] - '0');
+            i += 3;
+        } else {
+            name[j++] = name[i];
+        }
+    }
+}
+
+/*
+ * Walk the mount table and build a list of local file systems
+ */
+bool build_fs_mount_list(FsMountList *mounts, Error **errp)
+{
+    FsMount *mount;
+    char const *mountinfo = "/proc/self/mountinfo";
+    FILE *fp;
+    char *line = NULL, *dash;
+    size_t n;
+    char check;
+    unsigned int devmajor, devminor;
+    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
+
+    fp = fopen(mountinfo, "r");
+    if (!fp) {
+        return build_fs_mount_list_from_mtab(mounts, errp);
+    }
+
+    while (getline(&line, &n, fp) != -1) {
+        ret = sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
+                     &devmajor, &devminor, &dir_s, &dir_e, &check);
+        if (ret < 3) {
+            continue;
+        }
+        dash = strstr(line + dir_e, " - ");
+        if (!dash) {
+            continue;
+        }
+        ret = sscanf(dash, " - %n%*s%n %n%*s%n%c",
+                     &type_s, &type_e, &dev_s, &dev_e, &check);
+        if (ret < 1) {
+            continue;
+        }
+        line[dir_e] = 0;
+        dash[type_e] = 0;
+        dash[dev_e] = 0;
+        decode_mntname(line + dir_s, dir_e - dir_s);
+        decode_mntname(dash + dev_s, dev_e - dev_s);
+        if (devmajor == 0) {
+            /* btrfs reports major number = 0 */
+            if (strcmp("btrfs", dash + type_s) != 0 ||
+                dev_major_minor(dash + dev_s, &devmajor, &devminor) < 0) {
+                continue;
+            }
+        }
+
+        mount = g_new0(FsMount, 1);
+        mount->dirname = g_strdup(line + dir_s);
+        mount->devtype = g_strdup(dash + type_s);
+        mount->devmajor = devmajor;
+        mount->devminor = devminor;
+
+        QTAILQ_INSERT_TAIL(mounts, mount, next);
+    }
+    free(line);
+
+    fclose(fp);
+    return true;
+}
+#endif /* CONFIG_FSFREEZE || CONFIG_FSTRIM */
+
+#ifdef CONFIG_FSFREEZE
+/*
+ * Walk list of mounted file systems in the guest, and freeze the ones which
+ * are real local file systems.
+ */
+int64_t qmp_guest_fsfreeze_do_freeze_list(bool has_mountpoints,
+                                          strList *mountpoints,
+                                          FsMountList mounts,
+                                          Error **errp)
+{
+    struct FsMount *mount;
+    strList *list;
+    int fd, ret, i = 0;
+
+    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
+        /* To issue fsfreeze in the reverse order of mounts, check if the
+         * mount is listed in the list here */
+        if (has_mountpoints) {
+            for (list = mountpoints; list; list = list->next) {
+                if (strcmp(list->value, mount->dirname) == 0) {
+                    break;
+                }
+            }
+            if (!list) {
+                continue;
+            }
+        }
+
+        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
+        if (fd == -1) {
+            error_setg_errno(errp, errno, "failed to open %s", mount->dirname);
+            return -1;
+        }
+
+        /* we try to cull filesystems we know won't work in advance, but other
+         * filesystems may not implement fsfreeze for less obvious reasons.
+         * these will report EOPNOTSUPP. we simply ignore these when tallying
+         * the number of frozen filesystems.
+         * if a filesystem is mounted more than once (aka bind mount) a
+         * consecutive attempt to freeze an already frozen filesystem will
+         * return EBUSY.
+         *
+         * any other error means a failure to freeze a filesystem we
+         * expect to be freezable, so return an error in those cases
+         * and return system to thawed state.
+         */
+        ret = ioctl(fd, FIFREEZE);
+        if (ret == -1) {
+            if (errno != EOPNOTSUPP && errno != EBUSY) {
+                error_setg_errno(errp, errno, "failed to freeze %s",
+                                 mount->dirname);
+                close(fd);
+                return -1;
+            }
+        } else {
+            i++;
+        }
+        close(fd);
+    }
+    return i;
+}
+
+int qmp_guest_fsfreeze_do_thaw(Error **errp)
+{
+    int ret;
+    FsMountList mounts;
+    FsMount *mount;
+    int fd, i = 0, logged;
+    Error *local_err = NULL;
+
+    QTAILQ_INIT(&mounts);
+    if (!build_fs_mount_list(&mounts, &local_err)) {
+        error_propagate(errp, local_err);
+        return -1;
+    }
+
+    QTAILQ_FOREACH(mount, &mounts, next) {
+        logged = false;
+        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
+        if (fd == -1) {
+            continue;
+        }
+        /* we have no way of knowing whether a filesystem was actually unfrozen
+         * as a result of a successful call to FITHAW, only that if an error
+         * was returned the filesystem was *not* unfrozen by that particular
+         * call.
+         *
+         * since multiple preceding FIFREEZEs require multiple calls to FITHAW
+         * to unfreeze, continuing issuing FITHAW until an error is returned,
+         * in which case either the filesystem is in an unfreezable state, or,
+         * more likely, it was thawed previously (and remains so afterward).
+         *
+         * also, since the most recent successful call is the one that did
+         * the actual unfreeze, we can use this to provide an accurate count
+         * of the number of filesystems unfrozen by guest-fsfreeze-thaw, which
+         * may * be useful for determining whether a filesystem was unfrozen
+         * during the freeze/thaw phase by a process other than qemu-ga.
+         */
+        do {
+            ret = ioctl(fd, FITHAW);
+            if (ret == 0 && !logged) {
+                i++;
+                logged = true;
+            }
+        } while (ret == 0);
+        close(fd);
+    }
+
+    free_fs_mount_list(&mounts);
+
+    return i;
+}
+#endif /* CONFIG_FSFREEZE */
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 16d67e9f6d..d24f2fafd8 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -16,11 +16,9 @@
 #include <sys/utsname.h>
 #include <sys/wait.h>
 #include <dirent.h>
-#include "guest-agent-core.h"
 #include "qga-qapi-commands.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
-#include "qemu/queue.h"
 #include "qemu/host-utils.h"
 #include "qemu/sockets.h"
 #include "qemu/base64.h"
@@ -629,16 +627,7 @@ void qmp_guest_file_flush(int64_t handle, Error **errp)
 #if defined(__linux__)
 
 #if defined(CONFIG_FSFREEZE) || defined(CONFIG_FSTRIM)
-typedef struct FsMount {
-    char *dirname;
-    char *devtype;
-    unsigned int devmajor, devminor;
-    QTAILQ_ENTRY(FsMount) next;
-} FsMount;
-
-typedef QTAILQ_HEAD(FsMountList, FsMount) FsMountList;
-
-static void free_fs_mount_list(FsMountList *mounts)
+void free_fs_mount_list(FsMountList *mounts)
 {
      FsMount *mount, *temp;
 
@@ -653,157 +642,6 @@ static void free_fs_mount_list(FsMountList *mounts)
          g_free(mount);
      }
 }
-
-static int dev_major_minor(const char *devpath,
-                           unsigned int *devmajor, unsigned int *devminor)
-{
-    struct stat st;
-
-    *devmajor = 0;
-    *devminor = 0;
-
-    if (stat(devpath, &st) < 0) {
-        slog("failed to stat device file '%s': %s", devpath, strerror(errno));
-        return -1;
-    }
-    if (S_ISDIR(st.st_mode)) {
-        /* It is bind mount */
-        return -2;
-    }
-    if (S_ISBLK(st.st_mode)) {
-        *devmajor = major(st.st_rdev);
-        *devminor = minor(st.st_rdev);
-        return 0;
-    }
-    return -1;
-}
-
-/*
- * Walk the mount table and build a list of local file systems
- */
-static bool build_fs_mount_list_from_mtab(FsMountList *mounts, Error **errp)
-{
-    struct mntent *ment;
-    FsMount *mount;
-    char const *mtab = "/proc/self/mounts";
-    FILE *fp;
-    unsigned int devmajor, devminor;
-
-    fp = setmntent(mtab, "r");
-    if (!fp) {
-        error_setg(errp, "failed to open mtab file: '%s'", mtab);
-        return false;
-    }
-
-    while ((ment = getmntent(fp))) {
-        /*
-         * An entry which device name doesn't start with a '/' is
-         * either a dummy file system or a network file system.
-         * Add special handling for smbfs and cifs as is done by
-         * coreutils as well.
-         */
-        if ((ment->mnt_fsname[0] != '/') ||
-            (strcmp(ment->mnt_type, "smbfs") == 0) ||
-            (strcmp(ment->mnt_type, "cifs") == 0)) {
-            continue;
-        }
-        if (dev_major_minor(ment->mnt_fsname, &devmajor, &devminor) == -2) {
-            /* Skip bind mounts */
-            continue;
-        }
-
-        mount = g_new0(FsMount, 1);
-        mount->dirname = g_strdup(ment->mnt_dir);
-        mount->devtype = g_strdup(ment->mnt_type);
-        mount->devmajor = devmajor;
-        mount->devminor = devminor;
-
-        QTAILQ_INSERT_TAIL(mounts, mount, next);
-    }
-
-    endmntent(fp);
-    return true;
-}
-
-static void decode_mntname(char *name, int len)
-{
-    int i, j = 0;
-    for (i = 0; i <= len; i++) {
-        if (name[i] != '\\') {
-            name[j++] = name[i];
-        } else if (name[i + 1] == '\\') {
-            name[j++] = '\\';
-            i++;
-        } else if (name[i + 1] >= '0' && name[i + 1] <= '3' &&
-                   name[i + 2] >= '0' && name[i + 2] <= '7' &&
-                   name[i + 3] >= '0' && name[i + 3] <= '7') {
-            name[j++] = (name[i + 1] - '0') * 64 +
-                        (name[i + 2] - '0') * 8 +
-                        (name[i + 3] - '0');
-            i += 3;
-        } else {
-            name[j++] = name[i];
-        }
-    }
-}
-
-static bool build_fs_mount_list(FsMountList *mounts, Error **errp)
-{
-    FsMount *mount;
-    char const *mountinfo = "/proc/self/mountinfo";
-    FILE *fp;
-    char *line = NULL, *dash;
-    size_t n;
-    char check;
-    unsigned int devmajor, devminor;
-    int ret, dir_s, dir_e, type_s, type_e, dev_s, dev_e;
-
-    fp = fopen(mountinfo, "r");
-    if (!fp) {
-        return build_fs_mount_list_from_mtab(mounts, errp);
-    }
-
-    while (getline(&line, &n, fp) != -1) {
-        ret = sscanf(line, "%*u %*u %u:%u %*s %n%*s%n%c",
-                     &devmajor, &devminor, &dir_s, &dir_e, &check);
-        if (ret < 3) {
-            continue;
-        }
-        dash = strstr(line + dir_e, " - ");
-        if (!dash) {
-            continue;
-        }
-        ret = sscanf(dash, " - %n%*s%n %n%*s%n%c",
-                     &type_s, &type_e, &dev_s, &dev_e, &check);
-        if (ret < 1) {
-            continue;
-        }
-        line[dir_e] = 0;
-        dash[type_e] = 0;
-        dash[dev_e] = 0;
-        decode_mntname(line + dir_s, dir_e - dir_s);
-        decode_mntname(dash + dev_s, dev_e - dev_s);
-        if (devmajor == 0) {
-            /* btrfs reports major number = 0 */
-            if (strcmp("btrfs", dash + type_s) != 0 ||
-                dev_major_minor(dash + dev_s, &devmajor, &devminor) < 0) {
-                continue;
-            }
-        }
-
-        mount = g_new0(FsMount, 1);
-        mount->dirname = g_strdup(line + dir_s);
-        mount->devtype = g_strdup(dash + type_s);
-        mount->devmajor = devmajor;
-        mount->devminor = devminor;
-
-        QTAILQ_INSERT_TAIL(mounts, mount, next);
-    }
-    free(line);
-
-    fclose(fp);
-    return true;
-}
 #endif
 
 #if defined(CONFIG_FSFREEZE)
@@ -1708,20 +1546,13 @@ int64_t qmp_guest_fsfreeze_freeze(Error **errp)
     return qmp_guest_fsfreeze_freeze_list(false, NULL, errp);
 }
 
-/*
- * Walk list of mounted file systems in the guest, and freeze the ones which
- * are real local file systems.
- */
 int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
                                        strList *mountpoints,
                                        Error **errp)
 {
-    int ret = 0, i = 0;
-    strList *list;
+    int ret;
     FsMountList mounts;
-    struct FsMount *mount;
     Error *local_err = NULL;
-    int fd;
 
     slog("guest-fsfreeze called");
 
@@ -1740,122 +1571,34 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
     /* cannot risk guest agent blocking itself on a write in this state */
     ga_set_frozen(ga_state);
 
-    QTAILQ_FOREACH_REVERSE(mount, &mounts, next) {
-        /* To issue fsfreeze in the reverse order of mounts, check if the
-         * mount is listed in the list here */
-        if (has_mountpoints) {
-            for (list = mountpoints; list; list = list->next) {
-                if (strcmp(list->value, mount->dirname) == 0) {
-                    break;
-                }
-            }
-            if (!list) {
-                continue;
-            }
-        }
-
-        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
-        if (fd == -1) {
-            error_setg_errno(errp, errno, "failed to open %s", mount->dirname);
-            goto error;
-        }
-
-        /* we try to cull filesystems we know won't work in advance, but other
-         * filesystems may not implement fsfreeze for less obvious reasons.
-         * these will report EOPNOTSUPP. we simply ignore these when tallying
-         * the number of frozen filesystems.
-         * if a filesystem is mounted more than once (aka bind mount) a
-         * consecutive attempt to freeze an already frozen filesystem will
-         * return EBUSY.
-         *
-         * any other error means a failure to freeze a filesystem we
-         * expect to be freezable, so return an error in those cases
-         * and return system to thawed state.
-         */
-        ret = ioctl(fd, FIFREEZE);
-        if (ret == -1) {
-            if (errno != EOPNOTSUPP && errno != EBUSY) {
-                error_setg_errno(errp, errno, "failed to freeze %s",
-                                 mount->dirname);
-                close(fd);
-                goto error;
-            }
-        } else {
-            i++;
-        }
-        close(fd);
-    }
+    ret = qmp_guest_fsfreeze_do_freeze_list(has_mountpoints, mountpoints,
+                                            mounts, errp);
 
     free_fs_mount_list(&mounts);
     /* We may not issue any FIFREEZE here.
      * Just unset ga_state here and ready for the next call.
      */
-    if (i == 0) {
+    if (ret == 0) {
         ga_unset_frozen(ga_state);
+    } else if (ret < 0) {
+        qmp_guest_fsfreeze_thaw(NULL);
     }
-    return i;
-
-error:
-    free_fs_mount_list(&mounts);
-    qmp_guest_fsfreeze_thaw(NULL);
-    return 0;
+    return ret;
 }
 
-/*
- * Walk list of frozen file systems in the guest, and thaw them.
- */
 int64_t qmp_guest_fsfreeze_thaw(Error **errp)
 {
     int ret;
-    FsMountList mounts;
-    FsMount *mount;
-    int fd, i = 0, logged;
-    Error *local_err = NULL;
 
-    QTAILQ_INIT(&mounts);
-    if (!build_fs_mount_list(&mounts, &local_err)) {
-        error_propagate(errp, local_err);
-        return 0;
-    }
-
-    QTAILQ_FOREACH(mount, &mounts, next) {
-        logged = false;
-        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
-        if (fd == -1) {
-            continue;
-        }
-        /* we have no way of knowing whether a filesystem was actually unfrozen
-         * as a result of a successful call to FITHAW, only that if an error
-         * was returned the filesystem was *not* unfrozen by that particular
-         * call.
-         *
-         * since multiple preceding FIFREEZEs require multiple calls to FITHAW
-         * to unfreeze, continuing issuing FITHAW until an error is returned,
-         * in which case either the filesystem is in an unfreezable state, or,
-         * more likely, it was thawed previously (and remains so afterward).
-         *
-         * also, since the most recent successful call is the one that did
-         * the actual unfreeze, we can use this to provide an accurate count
-         * of the number of filesystems unfrozen by guest-fsfreeze-thaw, which
-         * may * be useful for determining whether a filesystem was unfrozen
-         * during the freeze/thaw phase by a process other than qemu-ga.
-         */
-        do {
-            ret = ioctl(fd, FITHAW);
-            if (ret == 0 && !logged) {
-                i++;
-                logged = true;
-            }
-        } while (ret == 0);
-        close(fd);
+    ret = qmp_guest_fsfreeze_do_thaw(errp);
+    if (ret >= 0) {
+        ga_unset_frozen(ga_state);
+        execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
+    } else {
+        ret = 0;
     }
 
-    ga_unset_frozen(ga_state);
-    free_fs_mount_list(&mounts);
-
-    execute_fsfreeze_hook(FSFREEZE_HOOK_THAW, errp);
-
-    return i;
+    return ret;
 }
 
 static void guest_fsfreeze_cleanup(void)
diff --git a/qga/meson.build b/qga/meson.build
index a0ffd6d268..932b4e7ca8 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -72,6 +72,9 @@ qga_ss.add(when: 'CONFIG_POSIX', if_true: files(
   'commands-posix.c',
   'commands-posix-ssh.c',
 ))
+qga_ss.add(when: 'CONFIG_LINUX', if_true: files(
+  'commands-linux.c',
+))
 qga_ss.add(when: 'CONFIG_WIN32', if_true: files(
   'channel-win32.c',
   'commands-win32.c',
-- 
2.25.1


