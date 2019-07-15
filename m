Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116D69B30
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 21:11:30 +0200 (CEST)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn6Nl-0006Fy-2c
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 15:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39823)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6NS-0005NE-VM
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:11:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6NR-0003G1-LG
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:11:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51036)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hn6NR-0003Fa-Dd
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:11:09 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D84C882EF;
 Mon, 15 Jul 2019 19:11:08 +0000 (UTC)
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 807351992C;
 Mon, 15 Jul 2019 19:11:03 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:09:46 +0400
Message-Id: <20190715191001.1188-6-marcandre.lureau@redhat.com>
In-Reply-To: <20190715191001.1188-1-marcandre.lureau@redhat.com>
References: <20190715191001.1188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 15 Jul 2019 19:11:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 05/20] QmpSession: add json parser and use
 it in qga
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

Move JSON parser to QmpSession, and implement a simple handler to check
the parsed tokens and call qmp_dispatch(). This is enough for a simple
QMP client, like QGA.

The QEMU monitor has more complicated handling of dispatching which
will be addressed in a following patch to benefit from more common
code.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/qmp/dispatch.h |  7 +++++++
 qapi/qmp-dispatch.c         | 19 +++++++++++++++++++
 qga/main.c                  | 31 +------------------------------
 3 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index d1ce631a93..c84edff7d2 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -15,6 +15,7 @@
 #define QAPI_QMP_DISPATCH_H
=20
 #include "qemu/queue.h"
+#include "qapi/qmp/json-parser.h"
=20
 typedef void (QmpCommandFunc)(QDict *, QObject **, Error **);
=20
@@ -42,6 +43,7 @@ typedef void (QmpDispatchReturn) (QmpSession *session, =
QDict *rsp);
=20
 struct QmpSession {
     const QmpCommandList *cmds;
+    JSONMessageParser parser;
     QmpDispatchReturn *return_cb;
 };
=20
@@ -52,6 +54,11 @@ const QmpCommand *qmp_find_command(const QmpCommandLis=
t *cmds,
 void qmp_session_init(QmpSession *session,
                       const QmpCommandList *cmds,
                       QmpDispatchReturn *return_cb);
+static inline void
+qmp_session_feed(QmpSession *session, const char *buf, size_t count)
+{
+    json_message_parser_feed(&session->parser, buf, count);
+}
 void qmp_session_destroy(QmpSession *session);
 void qmp_disable_command(QmpCommandList *cmds, const char *name);
 void qmp_enable_command(QmpCommandList *cmds, const char *name);
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 37b058cf97..803ec626cd 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -163,6 +163,23 @@ bool qmp_is_oob(const QDict *dict)
         && !qdict_haskey(dict, "execute");
 }
=20
+static void qmp_json_emit(void *opaque, QObject *obj, Error *err)
+{
+    QmpSession *session =3D opaque;
+
+    assert(!obj !=3D !err);
+
+    if (err) {
+        QDict *rsp =3D qmp_error_response(err);
+        session->return_cb(session, rsp);
+        qobject_unref(rsp);
+    } else {
+        qmp_dispatch(session, obj, false);
+    }
+
+    qobject_unref(obj);
+}
+
 void qmp_session_init(QmpSession *session,
                       const QmpCommandList *cmds,
                       QmpDispatchReturn *return_cb)
@@ -170,6 +187,7 @@ void qmp_session_init(QmpSession *session,
     assert(return_cb);
     assert(!session->return_cb);
=20
+    json_message_parser_init(&session->parser, qmp_json_emit, session, N=
ULL);
     session->cmds =3D cmds;
     session->return_cb =3D return_cb;
 }
@@ -182,6 +200,7 @@ void qmp_session_destroy(QmpSession *session)
=20
     session->cmds =3D NULL;
     session->return_cb =3D NULL;
+    json_message_parser_destroy(&session->parser);
 }
=20
 void qmp_dispatch(QmpSession *session, QObject *request, bool allow_oob)
diff --git a/qga/main.c b/qga/main.c
index c291d06491..057368eb16 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -19,7 +19,6 @@
 #include <sys/wait.h>
 #endif
 #include "qemu-common.h"
-#include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qstring.h"
@@ -75,7 +74,6 @@ typedef struct GAConfig GAConfig;
=20
 struct GAState {
     QmpSession session;
-    JSONMessageParser parser;
     GMainLoop *main_loop;
     GAChannel *channel;
     bool virtio; /* fastpath to check for virtio to deal with poll() qui=
rks */
@@ -567,31 +565,6 @@ static void dispatch_return_cb(QmpSession *session, =
QDict *rsp)
     }
 }
=20
-/* handle requests/control events coming in over the channel */
-static void process_event(void *opaque, QObject *obj, Error *err)
-{
-    GAState *s =3D opaque;
-    int ret;
-
-    g_debug("process_event: called");
-    assert(!obj !=3D !err);
-
-    if (err) {
-        QDict *rsp =3D qmp_error_response(err);
-
-        ret =3D send_response(s, rsp);
-        if (ret < 0) {
-            g_warning("error sending error response: %s", strerror(-ret)=
);
-        }
-        qobject_unref(rsp);
-    } else {
-        g_debug("processing command");
-        qmp_dispatch(&s->session, obj, false);
-    }
-
-    qobject_unref(obj);
-}
-
 /* false return signals GAChannel to close the current client connection=
 */
 static gboolean channel_event_cb(GIOCondition condition, gpointer data)
 {
@@ -607,7 +580,7 @@ static gboolean channel_event_cb(GIOCondition conditi=
on, gpointer data)
     case G_IO_STATUS_NORMAL:
         buf[count] =3D 0;
         g_debug("read data, count: %d, data: %s", (int)count, buf);
-        json_message_parser_feed(&s->parser, (char *)buf, (int)count);
+        qmp_session_feed(&s->session, (char *)buf, (int)count);
         break;
     case G_IO_STATUS_EOF:
         g_debug("received EOF");
@@ -1346,7 +1319,6 @@ static GAState *initialize_agent(GAConfig *config, =
int socket_activation)
     s->command_state =3D ga_command_state_new();
     ga_command_state_init(s, s->command_state);
     ga_command_state_init_all(s->command_state);
-    json_message_parser_init(&s->parser, process_event, s, NULL);
     qmp_session_init(&s->session, &ga_commands, dispatch_return_cb);
=20
 #ifndef _WIN32
@@ -1382,7 +1354,6 @@ static void cleanup_agent(GAState *s)
         qmp_session_destroy(&s->session);
         ga_command_state_cleanup_all(s->command_state);
         ga_command_state_free(s->command_state);
-        json_message_parser_destroy(&s->parser);
     }
     g_free(s->pstate_filepath);
     g_free(s->state_filepath_isfrozen);
--=20
2.22.0.428.g6d5b264208


