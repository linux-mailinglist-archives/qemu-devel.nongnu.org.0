Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFEC51BA75
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:29:55 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWry-0004JK-Je
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWeg-00077N-CY
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:10 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:47350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nmWee-0007wM-GI
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651738567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNQ/c09URpcdOpejx2bIqowJdwTpNyRlw871zeo0Abo=;
 b=WPtbZRQjP3b444LHNhEWaCQTlfUGV1JKpxulFJKC5A1FpDoll1Apv8EBVTYQleXXJOG3c/
 cEBc5aCLr3b5xqA1WHCBU2tzQXAKEVMpiFMOEL29oXBY8dK315iHNR2NUDeE9/62pV8apn
 9L9UH2SoyUH5y9AS20DD0hjtIFdEcXM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-3nlkgYiTOr2WhGZ08vbaIw-1; Thu, 05 May 2022 04:16:04 -0400
X-MC-Unique: 3nlkgYiTOr2WhGZ08vbaIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 618BA803D4E;
 Thu,  5 May 2022 08:16:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B7BB400E86A;
 Thu,  5 May 2022 08:16:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 09/15] qga: replace qemu_open_old() with qemu_open_cloexec()
Date: Thu,  5 May 2022 12:14:25 +0400
Message-Id: <20220505081431.934739-10-marcandre.lureau@redhat.com>
In-Reply-To: <20220505081431.934739-1-marcandre.lureau@redhat.com>
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.74;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

qemu_open_old() uses qemu_open_internal() which handles special
"/dev/fdset/" path for monitor fd sets, set CLOEXEC, and uses Error
reporting (and some O_DIRECT special error casing).

The monitor fdset handling is unnecessary for qga, use
qemu_open_cloexec() instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/channel-posix.c  | 14 +++++++++-----
 qga/commands-posix.c | 24 ++++++++++++------------
 2 files changed, 21 insertions(+), 17 deletions(-)

diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index 0ce594bc36c2..a1262b130145 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include <termios.h>
 #include "qapi/error.h"
 #include "qemu/sockets.h"
@@ -128,11 +129,15 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
     switch (c->method) {
     case GA_CHANNEL_VIRTIO_SERIAL: {
         assert(fd < 0);
-        fd = qemu_open_old(path, O_RDWR | O_NONBLOCK
+        fd = qemu_open_cloexec(
+            path,
 #ifndef CONFIG_SOLARIS
-                           | O_ASYNC
+            O_ASYNC |
 #endif
-                           );
+            O_RDWR | O_NONBLOCK,
+            0,
+            errp
+        );
         if (fd == -1) {
             error_setg_errno(errp, errno, "error opening channel");
             return false;
@@ -157,9 +162,8 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
         struct termios tio;
 
         assert(fd < 0);
-        fd = qemu_open_old(path, O_RDWR | O_NOCTTY | O_NONBLOCK);
+        fd = qemu_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK, 0, errp);
         if (fd == -1) {
-            error_setg_errno(errp, errno, "error opening channel");
             return false;
         }
         tcgetattr(fd, &tio);
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 8ebc327c5e02..f82205e25813 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1392,6 +1392,7 @@ static GuestDiskInfoList *get_disk_partitions(
 
 static void get_nvme_smart(GuestDiskInfo *disk)
 {
+    Error *err = NULL;
     int fd;
     GuestNVMeSmart *smart;
     NvmeSmartLog log = {0};
@@ -1404,9 +1405,10 @@ static void get_nvme_smart(GuestDiskInfo *disk)
                  | (((sizeof(log) >> 2) - 1) << 16)
     };
 
-    fd = qemu_open_old(disk->name, O_RDONLY);
+    fd = qemu_open_cloexec(disk->name, O_RDONLY, 0, &err);
     if (fd == -1) {
-        g_debug("Failed to open device: %s: %s", disk->name, g_strerror(errno));
+        g_debug("Failed to open device: %s: %s", disk->name, error_get_pretty(err));
+        error_free(err);
         return;
     }
 
@@ -1737,9 +1739,8 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
             }
         }
 
-        fd = qemu_open_old(mount->dirname, O_RDONLY);
+        fd = qemu_open_cloexec(mount->dirname, O_RDONLY, 0, errp);
         if (fd == -1) {
-            error_setg_errno(errp, errno, "failed to open %s", mount->dirname);
             goto error;
         }
 
@@ -1804,7 +1805,7 @@ int64_t qmp_guest_fsfreeze_thaw(Error **errp)
 
     QTAILQ_FOREACH(mount, &mounts, next) {
         logged = false;
-        fd = qemu_open_old(mount->dirname, O_RDONLY);
+        fd = qemu_open_cloexec(mount->dirname, O_RDONLY, 0, NULL);
         if (fd == -1) {
             continue;
         }
@@ -1864,21 +1865,20 @@ static void guest_fsfreeze_cleanup(void)
 GuestFilesystemTrimResponse *
 qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
 {
+    ERRP_GUARD();
     GuestFilesystemTrimResponse *response;
     GuestFilesystemTrimResult *result;
     int ret = 0;
     FsMountList mounts;
     struct FsMount *mount;
     int fd;
-    Error *local_err = NULL;
     struct fstrim_range r;
 
     slog("guest-fstrim called");
 
     QTAILQ_INIT(&mounts);
-    build_fs_mount_list(&mounts, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    build_fs_mount_list(&mounts, errp);
+    if (*errp) {
         return NULL;
     }
 
@@ -1890,11 +1890,11 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
 
         QAPI_LIST_PREPEND(response->paths, result);
 
-        fd = qemu_open_old(mount->dirname, O_RDONLY);
+        fd = qemu_open_cloexec(mount->dirname, O_RDONLY, 0, errp);
         if (fd == -1) {
-            result->error = g_strdup_printf("failed to open: %s",
-                                            strerror(errno));
+            result->error = g_strdup(error_get_pretty(*errp));
             result->has_error = true;
+            g_clear_pointer(errp, error_free);
             continue;
         }
 
-- 
2.36.0.44.g0f828332d5ac


