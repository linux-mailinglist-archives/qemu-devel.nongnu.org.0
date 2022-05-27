Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D75363C1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 16:07:17 +0200 (CEST)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuacW-0000OT-71
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 10:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nuaR4-00022S-Bh
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nuaR2-0000aS-DA
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:55:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653659720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pMrhehUASX5vta19nQ9AuSJLJ81Nu2JOoMvD0sI/6c=;
 b=P16g/39KclBSNy3agxJHrMyYQ6vX6+vUocLO/5OM3tVUfN0xWBimnUFs6pV+RpfPe9WiiJ
 a+GR0U9/wDDEB7UmjGWON+v0dq15EsuzNWUbdQO9A98Dlv0JTpsDpx1bBG1XFiwYlBKSRs
 pykuwxMOQ5VH/KUag1jugEJijm8uNw4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-teUQvAKcO4WPPuSsnqPawg-1; Fri, 27 May 2022 09:55:15 -0400
X-MC-Unique: teUQvAKcO4WPPuSsnqPawg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40EB6101AA45;
 Fri, 27 May 2022 13:55:15 +0000 (UTC)
Received: from localhost (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2D0D2026D64;
 Fri, 27 May 2022 13:55:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Michael Roth <michael.roth@amd.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 08/15] qga: replace qemu_open_old() with qga_open_cloexec()
Date: Fri, 27 May 2022 15:54:52 +0200
Message-Id: <20220527135459.117877-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220527135459.117877-1-marcandre.lureau@redhat.com>
References: <20220527135459.117877-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
qga_open_cloexec() instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <20220525144140.591926-9-marcandre.lureau@redhat.com>
---
 qga/channel-posix.c  | 13 +++++++++----
 qga/commands-posix.c |  8 ++++----
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index 25fcc5cb1a..6796a02cff 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -1,8 +1,10 @@
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include <termios.h>
 #include "qapi/error.h"
 #include "qemu/sockets.h"
 #include "channel.h"
+#include "cutils.h"
 
 #ifdef CONFIG_SOLARIS
 #include <stropts.h>
@@ -127,11 +129,14 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
     switch (c->method) {
     case GA_CHANNEL_VIRTIO_SERIAL: {
         assert(fd < 0);
-        fd = qemu_open_old(path, O_RDWR | O_NONBLOCK
+        fd = qga_open_cloexec(
+            path,
 #ifndef CONFIG_SOLARIS
-                           | O_ASYNC
+            O_ASYNC |
 #endif
-                           );
+            O_RDWR | O_NONBLOCK,
+            0
+        );
         if (fd == -1) {
             error_setg_errno(errp, errno, "error opening channel");
             return false;
@@ -156,7 +161,7 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
         struct termios tio;
 
         assert(fd < 0);
-        fd = qemu_open_old(path, O_RDWR | O_NOCTTY | O_NONBLOCK);
+        fd = qga_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK, 0);
         if (fd == -1) {
             error_setg_errno(errp, errno, "error opening channel");
             return false;
diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 2ecc43eca9..0047245273 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1406,7 +1406,7 @@ static void get_nvme_smart(GuestDiskInfo *disk)
                  | (((sizeof(log) >> 2) - 1) << 16)
     };
 
-    fd = qemu_open_old(disk->name, O_RDONLY);
+    fd = qga_open_cloexec(disk->name, O_RDONLY, 0);
     if (fd == -1) {
         g_debug("Failed to open device: %s: %s", disk->name, g_strerror(errno));
         return;
@@ -1739,7 +1739,7 @@ int64_t qmp_guest_fsfreeze_freeze_list(bool has_mountpoints,
             }
         }
 
-        fd = qemu_open_old(mount->dirname, O_RDONLY);
+        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
         if (fd == -1) {
             error_setg_errno(errp, errno, "failed to open %s", mount->dirname);
             goto error;
@@ -1806,7 +1806,7 @@ int64_t qmp_guest_fsfreeze_thaw(Error **errp)
 
     QTAILQ_FOREACH(mount, &mounts, next) {
         logged = false;
-        fd = qemu_open_old(mount->dirname, O_RDONLY);
+        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
         if (fd == -1) {
             continue;
         }
@@ -1892,7 +1892,7 @@ qmp_guest_fstrim(bool has_minimum, int64_t minimum, Error **errp)
 
         QAPI_LIST_PREPEND(response->paths, result);
 
-        fd = qemu_open_old(mount->dirname, O_RDONLY);
+        fd = qga_open_cloexec(mount->dirname, O_RDONLY, 0);
         if (fd == -1) {
             result->error = g_strdup_printf("failed to open: %s",
                                             strerror(errno));
-- 
2.36.1


