Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF48869B41
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 21:13:58 +0200 (CEST)
Received: from localhost ([::1]:42106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn6Q8-00086w-D3
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 15:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40292)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6Pa-0006W2-5C
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:13:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6PV-0003zM-Dt
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:13:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40392)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hn6PU-0003yD-E8
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:13:17 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3B41930832C9;
 Mon, 15 Jul 2019 19:13:14 +0000 (UTC)
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BF8D19C68;
 Mon, 15 Jul 2019 19:13:07 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:09:58 +0400
Message-Id: <20190715191001.1188-18-marcandre.lureau@redhat.com>
In-Reply-To: <20190715191001.1188-1-marcandre.lureau@redhat.com>
References: <20190715191001.1188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Mon, 15 Jul 2019 19:13:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 17/20] console: make screendump asynchronous
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

Make screendump asynchronous to provide correct screendumps.

For now, HMP doesn't have async support, so it has to remain
synchronous and potentially incorrect to avoid races (following
patches will add HMP asynchronous commands)

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1230527

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h |   3 ++
 monitor/hmp-cmds.c   |   2 +-
 qapi/ui.json         |   3 +-
 ui/console.c         | 103 +++++++++++++++++++++++++++++++++++++++----
 4 files changed, 100 insertions(+), 11 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 281f9c145b..a1935557cc 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -74,6 +74,9 @@ typedef struct MouseTransformInfo {
 } MouseTransformInfo;
=20
 void hmp_mouse_set(Monitor *mon, const QDict *qdict);
+void hmp_screendump_sync(const char *filename,
+                         bool has_device, const char *device,
+                         bool has_head, int64_t head, Error **errp);
=20
 /* keysym is a unicode code except for special keys (see QEMU_KEY_xxx
    constants) */
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 5ca3ebe942..50a25a1ddc 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -2341,7 +2341,7 @@ void hmp_screendump(Monitor *mon, const QDict *qdic=
t)
     int64_t head =3D qdict_get_try_int(qdict, "head", 0);
     Error *err =3D NULL;
=20
-    qmp_screendump(filename, id !=3D NULL, id, id !=3D NULL, head, &err)=
;
+    hmp_screendump_sync(filename, id !=3D NULL, id, id !=3D NULL, head, =
&err);
     hmp_handle_error(mon, &err);
 }
=20
diff --git a/qapi/ui.json b/qapi/ui.json
index 59e412139a..cbb3979172 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -96,7 +96,8 @@
 #
 ##
 { 'command': 'screendump',
-  'data': {'filename': 'str', '*device': 'str', '*head': 'int'} }
+  'data': {'filename': 'str', '*device': 'str', '*head': 'int'},
+  'async': true }
=20
 ##
 # =3D=3D Spice
diff --git a/ui/console.c b/ui/console.c
index 3c941528d2..29c850c31c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -33,6 +33,7 @@
 #include "chardev/char-fe.h"
 #include "trace.h"
 #include "exec/memory.h"
+#include "monitor/monitor.h"
=20
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -117,6 +118,12 @@ typedef enum {
     TEXT_CONSOLE_FIXED_SIZE
 } console_type_t;
=20
+struct qmp_screendump {
+    gchar *filename;
+    QmpReturn *ret;
+    QLIST_ENTRY(qmp_screendump) link;
+};
+
 struct QemuConsole {
     Object parent;
=20
@@ -167,6 +174,8 @@ struct QemuConsole {
     uint8_t out_fifo_buf[16];
     QEMUTimer *kbd_timer;
=20
+    QLIST_HEAD(, qmp_screendump) qmp_screendumps;
+
     QTAILQ_ENTRY(QemuConsole) next;
 };
=20
@@ -193,6 +202,8 @@ static void dpy_refresh(DisplayState *s);
 static DisplayState *get_alloc_displaystate(void);
 static void text_console_update_cursor_timer(void);
 static void text_console_update_cursor(void *opaque);
+static void ppm_save(const char *filename, DisplaySurface *ds,
+                     Error **errp);
=20
 static void gui_update(void *opaque)
 {
@@ -259,8 +270,48 @@ static void gui_setup_refresh(DisplayState *ds)
     ds->have_text =3D have_text;
 }
=20
+static void qmp_screendump_finish(QemuConsole *con, struct qmp_screendum=
p *dump)
+{
+    Error *err =3D NULL;
+    DisplaySurface *surface;
+    Monitor *prev_mon =3D cur_mon;
+
+    if (qmp_return_is_cancelled(dump->ret)) {
+        goto cleanup;
+    }
+
+    cur_mon =3D qmp_return_get_monitor(dump->ret);
+    surface =3D qemu_console_surface(con);
+    if (!surface) {
+        error_setg(&err, "no surface");
+    } else {
+        /*
+         * FIXME: async save with coroutine? it would have to copy or
+         * lock the surface.
+         */
+        ppm_save(dump->filename, surface, &err);
+    }
+
+    if (err) {
+        qmp_return_error(dump->ret, err);
+    } else {
+        qmp_screendump_return(dump->ret);
+    }
+    cur_mon =3D prev_mon;
+
+cleanup:
+    g_free(dump->filename);
+    QLIST_REMOVE(dump, link);
+    g_free(dump);
+}
+
 void graphic_hw_update_done(QemuConsole *con)
 {
+    struct qmp_screendump *dump, *next;
+
+    QLIST_FOREACH_SAFE(dump, &con->qmp_screendumps, link, next) {
+        qmp_screendump_finish(con, dump);
+    }
 }
=20
 void graphic_hw_update(QemuConsole *con)
@@ -356,30 +407,41 @@ write_err:
     goto out;
 }
=20
-void qmp_screendump(const char *filename, bool has_device, const char *d=
evice,
-                    bool has_head, int64_t head, Error **errp)
+
+static QemuConsole *get_console(bool has_device, const char *device,
+                                bool has_head, int64_t head, Error **err=
p)
 {
-    QemuConsole *con;
-    DisplaySurface *surface;
+    QemuConsole *con =3D NULL;
=20
     if (has_device) {
         con =3D qemu_console_lookup_by_device_name(device, has_head ? he=
ad : 0,
                                                  errp);
-        if (!con) {
-            return;
-        }
     } else {
         if (has_head) {
             error_setg(errp, "'head' must be specified together with 'de=
vice'");
-            return;
+            return NULL;
         }
         con =3D qemu_console_lookup_by_index(0);
         if (!con) {
             error_setg(errp, "There is no console to take a screendump f=
rom");
-            return;
         }
     }
=20
+    return con;
+}
+
+void hmp_screendump_sync(const char *filename,
+                         bool has_device, const char *device,
+                         bool has_head, int64_t head, Error **errp)
+{
+    DisplaySurface *surface;
+    QemuConsole *con =3D get_console(has_device, device, has_head, head,=
 errp);
+
+    if (!con) {
+        return;
+    }
+    /* This may not complete the drawing with Spice, you may have
+     * glitches or outdated dumps, use qmp instead! */
     graphic_hw_update(con);
     surface =3D qemu_console_surface(con);
     if (!surface) {
@@ -390,6 +452,28 @@ void qmp_screendump(const char *filename, bool has_d=
evice, const char *device,
     ppm_save(filename, surface, errp);
 }
=20
+void qmp_screendump(const char *filename,
+                    bool has_device, const char *device,
+                    bool has_head, int64_t head,
+                    QmpReturn *qret)
+{
+    Error *err =3D NULL;
+    struct qmp_screendump *dump =3D NULL;
+    QemuConsole *con =3D get_console(has_device, device, has_head, head,=
 &err);
+
+    if (!con) {
+        qmp_return_error(qret, err);
+        return;
+    }
+
+    dump =3D g_new(struct qmp_screendump, 1);
+    dump->filename =3D g_strdup(filename);
+    dump->ret =3D qret;
+    QLIST_INSERT_HEAD(&con->qmp_screendumps, dump, link);
+
+    graphic_hw_update(con);
+}
+
 void graphic_hw_text_update(QemuConsole *con, console_ch_t *chardata)
 {
     if (!con) {
@@ -1300,6 +1384,7 @@ static QemuConsole *new_console(DisplayState *ds, c=
onsole_type_t console_type,
     obj =3D object_new(TYPE_QEMU_CONSOLE);
     s =3D QEMU_CONSOLE(obj);
     s->head =3D head;
+    QLIST_INIT(&s->qmp_screendumps);
     object_property_add_link(obj, "device", TYPE_DEVICE,
                              (Object **)&s->device,
                              object_property_allow_set_link,
--=20
2.22.0.428.g6d5b264208


