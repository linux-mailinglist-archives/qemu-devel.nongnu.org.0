Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1ED680BE9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:26:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSIe-0007e6-4E; Mon, 30 Jan 2023 06:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSIA-0006kQ-A8
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:25:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pMSHs-0008JA-L9
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D0NMcNO6/51Fu/VS0lTmBN7sXx0ZBFyu0L1jNrhRXXM=;
 b=cGSAVIj4lpE9DkC8CPiQLFIH7KzRqtU9Wi734YyJnvSSl5RB7Pct/+2hf4MM1I5tfHjinP
 p3du0DrDmRVDo4vF3rqU+KxS4qUj34AhVhxB2lwsgPrzWBkWmy8GGYNS9Z0D8UZeS3GBSy
 gVheKRcPX8+lXD7E5zfBBaJ1Jkv0nHM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-SxW4asfkO1WHo-NO6bFipA-1; Mon, 30 Jan 2023 06:25:08 -0500
X-MC-Unique: SxW4asfkO1WHo-NO6bFipA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBC282999B25
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:25:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B92B1121315;
 Mon, 30 Jan 2023 11:25:06 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 08/11] ui: keep current cursor with QemuConsole
Date: Mon, 30 Jan 2023 15:24:28 +0400
Message-Id: <20230130112431.69559-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230130112431.69559-1-marcandre.lureau@redhat.com>
References: <20230130112431.69559-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Keeping the current cursor around is useful, not only for VNC, but for
other displays. Let's move it down, see the following patches for other
usages.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h | 1 +
 ui/vnc.h             | 1 -
 ui/console.c         | 8 ++++++++
 ui/vnc.c             | 7 ++-----
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 3afb5c73a8..e87284da22 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -460,6 +460,7 @@ QemuConsole *qemu_console_lookup_by_device(DeviceState *dev, uint32_t head);
 QemuConsole *qemu_console_lookup_by_device_name(const char *device_id,
                                                 uint32_t head, Error **errp);
 QemuConsole *qemu_console_lookup_unused(void);
+QEMUCursor *qemu_console_get_cursor(QemuConsole *con);
 bool qemu_console_is_visible(QemuConsole *con);
 bool qemu_console_is_graphic(QemuConsole *con);
 bool qemu_console_is_fixedsize(QemuConsole *con);
diff --git a/ui/vnc.h b/ui/vnc.h
index a60fb13115..757fa83044 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -159,7 +159,6 @@ struct VncDisplay
     QKbdState *kbd;
     QemuMutex mutex;
 
-    QEMUCursor *cursor;
     int cursor_msize;
     uint8_t *cursor_mask;
 
diff --git a/ui/console.c b/ui/console.c
index ab43561fe1..4e88941165 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -93,6 +93,7 @@ struct QemuConsole {
     uint32_t head;
     QemuUIInfo ui_info;
     QEMUTimer *ui_timer;
+    QEMUCursor *cursor;
     const GraphicHwOps *hw_ops;
     void *hw;
 
@@ -1922,6 +1923,8 @@ void dpy_cursor_define(QemuConsole *con, QEMUCursor *cursor)
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    cursor_unref(con->cursor);
+    con->cursor = cursor_ref(cursor);
     if (!qemu_console_is_visible(con)) {
         return;
     }
@@ -2287,6 +2290,11 @@ QemuConsole *qemu_console_lookup_unused(void)
     return NULL;
 }
 
+QEMUCursor *qemu_console_get_cursor(QemuConsole *con)
+{
+    return con->cursor;
+}
+
 bool qemu_console_is_visible(QemuConsole *con)
 {
     return (con == active_console) || (con->dcls > 0);
diff --git a/ui/vnc.c b/ui/vnc.c
index 8aec5d751e..bbd8b6baae 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -988,10 +988,10 @@ static void vnc_mouse_set(DisplayChangeListener *dcl,
 
 static int vnc_cursor_define(VncState *vs)
 {
-    QEMUCursor *c = vs->vd->cursor;
+    QEMUCursor *c = qemu_console_get_cursor(vs->vd->dcl.con);
     int isize;
 
-    if (!vs->vd->cursor) {
+    if (!c) {
         return -1;
     }
 
@@ -1029,10 +1029,7 @@ static void vnc_dpy_cursor_define(DisplayChangeListener *dcl,
     VncDisplay *vd = container_of(dcl, VncDisplay, dcl);
     VncState *vs;
 
-    cursor_unref(vd->cursor);
     g_free(vd->cursor_mask);
-
-    vd->cursor = cursor_ref(vd->cursor);
     vd->cursor_msize = cursor_get_mono_bpl(c) * c->height;
     vd->cursor_mask = g_malloc0(vd->cursor_msize);
     cursor_get_mono_mask(c, 0, vd->cursor_mask);
-- 
2.39.1


