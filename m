Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA6533FBA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:59:01 +0200 (CEST)
Received: from localhost ([::1]:59368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntsTT-00028I-Ve
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntsGn-0003Ex-Rb
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ntsCz-00065X-8g
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653489716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2txoi8kzLWAOR77xToALWlamClGyip6/Kibhx/lHuiE=;
 b=D+QObjo/TCb2c0pylIAUdkTfSskDPa1X8jcfuQl4r8Lwlp3V6jJHrFQ6xEVwCr2GE/ZJLM
 5mzOfxu9HZTgdO+koiGCnqb+OYNjTX/0vfcGNSgtH8Ia+mdaCy7K607Ee3rSszuo9H2leP
 i1/usiXBUUqGjIIhyINL6Fn7o6zjfkM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-XQhbvHz_PsGXPzv5R8tOZQ-1; Wed, 25 May 2022 10:41:55 -0400
X-MC-Unique: XQhbvHz_PsGXPzv5R8tOZQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EDB9811E7A
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 14:41:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5718400F36;
 Wed, 25 May 2022 14:41:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v5 08/15] qga: replace qemu_open_old() with qga_open_cloexec()
Date: Wed, 25 May 2022 16:41:33 +0200
Message-Id: <20220525144140.591926-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220525144140.591926-1-marcandre.lureau@redhat.com>
References: <20220525144140.591926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
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
index 88ccbf2fdf..ff2d21d394 100644
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


