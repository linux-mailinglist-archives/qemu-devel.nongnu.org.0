Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA456ADE1D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:58:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVwg-0002cI-LK; Tue, 07 Mar 2023 06:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwY-0002YM-NJ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pZVwX-00035M-AP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678190240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qe7J5Ktw3Y8AFalGM+UhHqZ+i10pyYP2ot8WGgkWLjA=;
 b=ES2O9WyVLic/vqxm0pP7erguIOlda/pcDaJviAXKrTFa4S8UO0F6tCl5M0Veuz6y3ujgZY
 FNODMjy99taHIlX9VB/isn0Xo8BVpFG03nj9EUE4rs7+WyY68SZl43pQuy9vLAZV6bO9I9
 1sF9pHQnzRSnR0rn5FBF4Uu4xjp9DMU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-_dJcL3Z0OC6qV9DeboRdQw-1; Tue, 07 Mar 2023 06:57:17 -0500
X-MC-Unique: _dJcL3Z0OC6qV9DeboRdQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EEC13C10ED2;
 Tue,  7 Mar 2023 11:57:17 +0000 (UTC)
Received: from localhost (unknown [10.39.208.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57B2F140EBF4;
 Tue,  7 Mar 2023 11:57:16 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 08/18] ui: keep current cursor with QemuConsole
Date: Tue,  7 Mar 2023 15:56:27 +0400
Message-Id: <20230307115637.2464377-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
index 0b01df947e..2a8fab091f 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -459,6 +459,7 @@ QemuConsole *qemu_console_lookup_by_device(DeviceState *dev, uint32_t head);
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
index 98b701f5a3..0dccbdd4be 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -94,6 +94,7 @@ struct QemuConsole {
     uint32_t head;
     QemuUIInfo ui_info;
     QEMUTimer *ui_timer;
+    QEMUCursor *cursor;
     const GraphicHwOps *hw_ops;
     void *hw;
 
@@ -1923,6 +1924,8 @@ void dpy_cursor_define(QemuConsole *con, QEMUCursor *cursor)
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
+    cursor_unref(con->cursor);
+    con->cursor = cursor_ref(cursor);
     if (!qemu_console_is_visible(con)) {
         return;
     }
@@ -2288,6 +2291,11 @@ QemuConsole *qemu_console_lookup_unused(void)
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
2.39.2


