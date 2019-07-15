Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56A69B40
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 21:13:57 +0200 (CEST)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn6Q5-00086Y-Vh
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 15:13:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40254)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6PP-0005ix-HD
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:13:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6PL-0003va-Jg
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:13:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56530)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hn6PJ-0003tv-Kc
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:13:07 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF94628DE;
 Mon, 15 Jul 2019 19:13:03 +0000 (UTC)
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AD755D784;
 Mon, 15 Jul 2019 19:12:57 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:09:57 +0400
Message-Id: <20190715191001.1188-17-marcandre.lureau@redhat.com>
In-Reply-To: <20190715191001.1188-1-marcandre.lureau@redhat.com>
References: <20190715191001.1188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 15 Jul 2019 19:13:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 16/20] console: add graphic_hw_update_done()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function to be called when a graphic update is done.

Declare the QXL renderer as async: render_update_cookie_num counts the
number of outstanding updates, and graphic_hw_update_done() is called
when it reaches none.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/qxl-render.c | 9 +++++++--
 hw/display/qxl.c        | 1 +
 include/ui/console.h    | 2 ++
 ui/console.c            | 9 +++++++++
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index 14ad2b352d..102fa0b7e9 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -108,7 +108,7 @@ static void qxl_render_update_area_unlocked(PCIQXLDev=
ice *qxl)
                                                 qxl->guest_primary.surfa=
ce.mem,
                                                 MEMSLOT_GROUP_GUEST);
         if (!qxl->guest_primary.data) {
-            return;
+            goto end;
         }
         qxl_set_rect_to_surface(qxl, &qxl->dirty[0]);
         qxl->num_dirty_rects =3D 1;
@@ -136,7 +136,7 @@ static void qxl_render_update_area_unlocked(PCIQXLDev=
ice *qxl)
     }
=20
     if (!qxl->guest_primary.data) {
-        return;
+        goto end;
     }
     for (i =3D 0; i < qxl->num_dirty_rects; i++) {
         if (qemu_spice_rect_is_empty(qxl->dirty+i)) {
@@ -157,6 +157,11 @@ static void qxl_render_update_area_unlocked(PCIQXLDe=
vice *qxl)
                        qxl->dirty[i].bottom - qxl->dirty[i].top);
     }
     qxl->num_dirty_rects =3D 0;
+
+end:
+    if (qxl->render_update_cookie_num =3D=3D 0) {
+        graphic_hw_update_done(qxl->ssd.dcl.con);
+    }
 }
=20
 /*
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 98c7410032..188399acd1 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1178,6 +1178,7 @@ static const QXLInterface qxl_interface =3D {
=20
 static const GraphicHwOps qxl_ops =3D {
     .gfx_update  =3D qxl_hw_update,
+    .gfx_update_async =3D true,
 };
=20
 static void qxl_enter_vga_mode(PCIQXLDevice *d)
diff --git a/include/ui/console.h b/include/ui/console.h
index f981696848..281f9c145b 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -365,6 +365,7 @@ static inline void console_write_ch(console_ch_t *des=
t, uint32_t ch)
 typedef struct GraphicHwOps {
     void (*invalidate)(void *opaque);
     void (*gfx_update)(void *opaque);
+    bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
     void (*update_interval)(void *opaque, uint64_t interval);
     int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
@@ -380,6 +381,7 @@ void graphic_console_set_hwops(QemuConsole *con,
 void graphic_console_close(QemuConsole *con);
=20
 void graphic_hw_update(QemuConsole *con);
+void graphic_hw_update_done(QemuConsole *con);
 void graphic_hw_invalidate(QemuConsole *con);
 void graphic_hw_text_update(QemuConsole *con, console_ch_t *chardata);
 void graphic_hw_gl_block(QemuConsole *con, bool block);
diff --git a/ui/console.c b/ui/console.c
index 82d1ddac9c..3c941528d2 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -259,13 +259,22 @@ static void gui_setup_refresh(DisplayState *ds)
     ds->have_text =3D have_text;
 }
=20
+void graphic_hw_update_done(QemuConsole *con)
+{
+}
+
 void graphic_hw_update(QemuConsole *con)
 {
+    bool async =3D false;
     if (!con) {
         con =3D active_console;
     }
     if (con && con->hw_ops->gfx_update) {
         con->hw_ops->gfx_update(con->hw);
+        async =3D con->hw_ops->gfx_update_async;
+    }
+    if (!async) {
+        graphic_hw_update_done(con);
     }
 }
=20
--=20
2.22.0.428.g6d5b264208


