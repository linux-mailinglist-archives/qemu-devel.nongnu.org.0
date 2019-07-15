Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE1969B3E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 21:13:23 +0200 (CEST)
Received: from localhost ([::1]:42088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn6Pa-0005wF-GS
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 15:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40178)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6P1-00043S-DT
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:12:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1hn6Oy-0003lB-Vo
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:12:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62510)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1hn6Oy-0003kY-Nh
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 15:12:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0E6D781F11;
 Mon, 15 Jul 2019 19:12:42 +0000 (UTC)
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AFE219C78;
 Mon, 15 Jul 2019 19:12:35 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 23:09:55 +0400
Message-Id: <20190715191001.1188-15-marcandre.lureau@redhat.com>
In-Reply-To: <20190715191001.1188-1-marcandre.lureau@redhat.com>
References: <20190715191001.1188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 15 Jul 2019 19:12:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 14/20] qmp: add qmp_return_is_cancelled()
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

If the client is gone, and the session finished, no need to
return. The async handler can use this information to avoid
unnecessary work and exit earlier.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/qmp/dispatch.h |  8 ++++++++
 qapi/qmp-dispatch.c         | 10 ++++++++++
 tests/test-qmp-cmds.c       | 39 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
index 6aef0abc70..6673902e95 100644
--- a/include/qapi/qmp/dispatch.h
+++ b/include/qapi/qmp/dispatch.h
@@ -91,6 +91,14 @@ void qmp_return_free(QmpReturn *qret);
 void qmp_return(QmpReturn *qret, QObject *rsp);
 void qmp_return_error(QmpReturn *qret, Error *err);
=20
+/*
+ * @qmp_return_is_cancelled:
+ *
+ * Return true if the QmpReturn is cancelled, and free the QmpReturn
+ * in this case.
+ */
+bool qmp_return_is_cancelled(QmpReturn *qret);
+
 void qmp_register_command(QmpCommandList *cmds, const char *name,
                           QmpCommandFunc *fn, QmpCommandOptions options)=
;
 void qmp_register_async_command(QmpCommandList *cmds, const char *name,
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 1f493af67a..8653c17901 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -64,6 +64,16 @@ void qmp_return_free(QmpReturn *qret)
     }
 }
=20
+bool qmp_return_is_cancelled(QmpReturn *qret)
+{
+    if (!qret->session) {
+        qmp_return_free(qret);
+        return true;
+    }
+
+    return false;
+}
+
 static void qmp_return_orderly(QmpReturn *qret)
 {
     QmpSession *session =3D qret->session;
diff --git a/tests/test-qmp-cmds.c b/tests/test-qmp-cmds.c
index f567ac2fb0..d4c27f0be1 100644
--- a/tests/test-qmp-cmds.c
+++ b/tests/test-qmp-cmds.c
@@ -34,17 +34,29 @@ void qmp_cmd_success_response(Error **errp)
 {
 }
=20
+static GMainLoop *loop;
+
 static gboolean cmd_async_idle(gpointer user_data)
 {
     QmpReturn *qret =3D user_data;
=20
-    qmp_cmd_async_return(qret, g_new0(Empty2, 1));
+    if (!qret->session) {
+        g_assert(qmp_return_is_cancelled(qret));
+        g_main_loop_quit(loop);
+        g_main_loop_unref(loop);
+        loop =3D NULL;
+    } else {
+        qmp_cmd_async_return(qret, g_new0(Empty2, 1));
+    }
=20
     return G_SOURCE_REMOVE;
 }
=20
 void qmp_cmd_async(const char *filename, QmpReturn *qret)
 {
+    if (g_str_equal(filename, "cancel")) {
+        qmp_session_destroy(qret->session);
+    }
     g_idle_add(cmd_async_idle, qret);
 }
=20
@@ -425,6 +437,30 @@ static void test_qmp_return_async(void)
     qobject_unref(req);
 }
=20
+static void test_qmp_return_async_cancel(void)
+{
+    QmpReturnAsync a =3D { { 0, }, };
+    QDict *args =3D qdict_new();
+    QDict *req =3D qdict_new();
+
+    a.loop =3D g_main_loop_new(NULL, TRUE);
+    qmp_session_init(&a.session, &qmp_commands,
+                     NULL, dispatch_return_async);
+
+    qdict_put_str(args, "filename", "cancel");
+    qdict_put_str(req, "execute", "cmd-async");
+    qdict_put(req, "arguments", args);
+    qmp_dispatch(&a.session, QOBJECT(req), false);
+    g_assert(a.loop);
+
+    loop =3D a.loop;
+    g_main_loop_run(loop);
+    g_assert(!loop);
+
+    qmp_session_destroy(&a.session);
+    qobject_unref(req);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -439,6 +475,7 @@ int main(int argc, char **argv)
     g_test_add_func("/qmp/dealloc_partial", test_dealloc_partial);
     g_test_add_func("/qmp/return_orderly", test_qmp_return_orderly);
     g_test_add_func("/qmp/return_async", test_qmp_return_async);
+    g_test_add_func("/qmp/return_async_cancel", test_qmp_return_async_ca=
ncel);
=20
     test_qmp_init_marshal(&qmp_commands);
     g_test_run();
--=20
2.22.0.428.g6d5b264208


