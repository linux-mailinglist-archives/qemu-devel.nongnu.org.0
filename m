Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026F264EC75
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 14:58:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6BAr-0008D5-0C; Fri, 16 Dec 2022 08:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAo-0008C4-Lt
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p6BAn-0007lG-1s
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 08:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671198888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aeU+V+762DrW/G51sF+7UgvhP2eL8Vqyi36GFbtZGBw=;
 b=fx0pTRw8Nc9ipzInTU5RsRDYCvPJTvlSZs/FPKrMrvrpYs1WGhyTywKewiUNYVGQKyxYee
 Xcn93q3NKEtVC7guFh3pzMP32/vLKFuMawHi132JNpqv/xCc661BYSlo3ayDlTF6fzp0VQ
 a6scAO+ga/lqqOFlRHxXEK3hJ3a2kUc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-PFM8c4gYMEOMugelkjYTmw-1; Fri, 16 Dec 2022 08:54:44 -0500
X-MC-Unique: PFM8c4gYMEOMugelkjYTmw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97D4A857F42;
 Fri, 16 Dec 2022 13:54:44 +0000 (UTC)
Received: from kostyanf14nb.lan (ovpn-193-42.brq.redhat.com [10.40.193.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43CAC40C2005;
 Fri, 16 Dec 2022 13:54:43 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 1/8] qga: Move FS TRIM code to commands-linux.c
Date: Fri, 16 Dec 2022 15:54:32 +0200
Message-Id: <20221216135439.465033-2-kkostiuk@redhat.com>
In-Reply-To: <20221216135439.465033-1-kkostiuk@redhat.com>
References: <20221216135439.465033-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

In the next patch ZFS TRIM support for FreeBSD will be added. Move
Linux-specific TRIM code to commands-linux.c file.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/commands-linux.c | 73 ++++++++++++++++++++++++++++++++++++++++++++
 qga/commands-posix.c | 72 -------------------------------------------
 2 files changed, 73 insertions(+), 72 deletions(-)

diff --git a/qga/commands-linux.c b/qga/commands-linux.c
index 214e408fcd..fb01114153 100644
--- a/qga/commands-linux.c
+++ b/qga/commands-linux.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qga-qapi-commands.h"
 #include "commands-common.h"
 #include "cutils.h"
 #include <mntent.h>
@@ -284,3 +285,75 @@ int qmp_guest_fsfreeze_do_thaw(Error **errp)
     return i;
 }
 #endif /* CONFIG_FSFREEZE */
+
+#if defined(CONFIG_FSTRIM)
+/*
+ * Walk list of mounted file systems in the guest, and trim them.
+ */
+GuestFilesystemTrimResponse *
+qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
+{
+    GuestFilesystemTrimResponse *response;
+    GuestFilesystemTrimResult *result;
+    int ret = 0;
+    FsMountList mounts;
+    struct FsMount *mount;
+    int fd;
+    struct fstrim_range r;
+
+    slog("guest-fstrim called");
+
+    QTAILQ_INIT(&mounts);
+    if (!build_fs_mount_list(&mounts, errp)) {
+        return NULL;
+    }
+
+    response = g_malloc0(sizeof(*response));
+
+    QTAILQ_FOREACH(mount, &mounts, next) {
+        result = g_malloc0(sizeof(*result));
+        result->path = g_strdup(mount->dirname);
+
+        QAPI_LIST_PREPEND(response->paths, result);
+
+        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
+        if (fd == -1) {
+            result->error = g_strdup_printf("failed to open: %s",
+                                            strerror(errno));
+            result->has_error = true;
+            continue;
+        }
+
+        /* We try to cull filesystems we know won't work in advance, but other
+         * filesystems may not implement fstrim for less obvious reasons.
+         * These will report EOPNOTSUPP; while in some other cases ENOTTY
+         * will be reported (e.g. CD-ROMs).
+         * Any other error means an unexpected error.
+         */
+        r.start = 0;
+        r.len = -1;
+        r.minlen = has_minimum ? minimum : 0;
+        ret = ioctl(fd, FITRIM, &r);
+        if (ret == -1) {
+            result->has_error = true;
+            if (errno == ENOTTY || errno == EOPNOTSUPP) {
+                result->error = g_strdup("trim not supported");
+            } else {
+                result->error = g_strdup_printf("failed to trim: %s",
+                                                strerror(errno));
+            }
+            close(fd);
+            continue;
+        }
+
+        result->has_minimum = true;
+        result->minimum = r.minlen;
+        result->has_trimmed = true;
+        result->trimmed = r.len;
+        close(fd);
+    }
+
+    free_fs_mount_list(&mounts);
+    return response;
+}
+#endif /* CONFIG_FSTRIM */
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 32493d6383..b2a6d8b227 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1607,78 +1607,6 @@ GuestFilesystemInfoList *qmp_guest_get_fsinfo(Error **errp)
 }
 #endif /* CONFIG_FSFREEZE */
 
-#if defined(CONFIG_FSTRIM)
-/*
- * Walk list of mounted file systems in the guest, and trim them.
- */
-GuestFilesystemTrimResponse *
-qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
-{
-    GuestFilesystemTrimResponse *response;
-    GuestFilesystemTrimResult *result;
-    int ret = 0;
-    FsMountList mounts;
-    struct FsMount *mount;
-    int fd;
-    struct fstrim_range r;
-
-    slog("guest-fstrim called");
-
-    QTAILQ_INIT(&mounts);
-    if (!build_fs_mount_list(&mounts, errp)) {
-        return NULL;
-    }
-
-    response = g_malloc0(sizeof(*response));
-
-    QTAILQ_FOREACH(mount, &mounts, next) {
-        result = g_malloc0(sizeof(*result));
-        result->path = g_strdup(mount->dirname);
-
-        QAPI_LIST_PREPEND(response->paths, result);
-
-        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
-        if (fd == -1) {
-            result->error = g_strdup_printf("failed to open: %s",
-                                            strerror(errno));
-            result->has_error = true;
-            continue;
-        }
-
-        /* We try to cull filesystems we know won't work in advance, but other
-         * filesystems may not implement fstrim for less obvious reasons.
-         * These will report EOPNOTSUPP; while in some other cases ENOTTY
-         * will be reported (e.g. CD-ROMs).
-         * Any other error means an unexpected error.
-         */
-        r.start = 0;
-        r.len = -1;
-        r.minlen = has_minimum ? minimum : 0;
-        ret = ioctl(fd, FITRIM, &r);
-        if (ret == -1) {
-            result->has_error = true;
-            if (errno == ENOTTY || errno == EOPNOTSUPP) {
-                result->error = g_strdup("trim not supported");
-            } else {
-                result->error = g_strdup_printf("failed to trim: %s",
-                                                strerror(errno));
-            }
-            close(fd);
-            continue;
-        }
-
-        result->has_minimum = true;
-        result->minimum = r.minlen;
-        result->has_trimmed = true;
-        result->trimmed = r.len;
-        close(fd);
-    }
-
-    free_fs_mount_list(&mounts);
-    return response;
-}
-#endif /* CONFIG_FSTRIM */
-
 
 #define LINUX_SYS_STATE_FILE "/sys/power/state"
 #define SUSPEND_SUPPORTED 0
-- 
2.25.1


