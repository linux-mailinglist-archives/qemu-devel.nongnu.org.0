Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7475177C3F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:46:55 +0100 (CET)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Ah4-0000jP-Lm
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:46:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57021)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9AVx-0004Sk-KW
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9AVv-00035Q-SJ
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:25 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55828
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9AVv-00034o-NO
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583253323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=33c4ueoVBGyZ2XGID+Hy1RjDbX+v1BvMmaf5/j0WSSg=;
 b=HFWKI4eUZzaMsm+1TqfFX6BEp2ilT0RpJmScWHzOZk6sa7/esVTa/VqTKbVitycz061jr4
 D3oDmhkothF5WP6OIQ8/SAG2ELn0DmT1ioqwo1Qlqeos/IA249L22q9PZyaCsGAMqPPZfo
 iM9SRSpirJp/Opby/KcfTQmi1O3fIbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-GekqbVbKPS2LUIIGof4y5g-1; Tue, 03 Mar 2020 11:35:19 -0500
X-MC-Unique: GekqbVbKPS2LUIIGof4y5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DDC818CA242;
 Tue,  3 Mar 2020 16:35:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A587C5D9C9;
 Tue,  3 Mar 2020 16:35:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 01C4C11329FD; Tue,  3 Mar 2020 17:35:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/30] qapi: Inline do_qmp_dispatch() into qmp_dispatch()
Date: Tue,  3 Mar 2020 17:34:56 +0100
Message-Id: <20200303163505.32041-22-armbru@redhat.com>
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com>
References: <20200303163505.32041-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: libvir-list@redhat.com, berrange@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both functions check @request is a QDict, and both have code for
QCO_NO_SUCCESS_RESP.  This wasn't the case back when they were
created.  It's a sign of muddled responsibilities.  Inline.  The next
commits will clean up some more.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/qmp-dispatch.c | 90 +++++++++++++++++++++------------------------
 1 file changed, 41 insertions(+), 49 deletions(-)

diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index bc264b3c9b..a588072523 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -75,19 +75,42 @@ static QDict *qmp_dispatch_check_obj(const QObject *req=
uest, bool allow_oob,
     return dict;
 }
=20
-static QObject *do_qmp_dispatch(QmpCommandList *cmds, QObject *request,
-                                bool allow_oob, Error **errp)
+QDict *qmp_error_response(Error *err)
 {
-    Error *local_err =3D NULL;
+    QDict *rsp;
+
+    rsp =3D qdict_from_jsonf_nofail("{ 'error': { 'class': %s, 'desc': %s =
} }",
+                                  QapiErrorClass_str(error_get_class(err))=
,
+                                  error_get_pretty(err));
+    error_free(err);
+    return rsp;
+}
+
+/*
+ * Does @qdict look like a command to be run out-of-band?
+ */
+bool qmp_is_oob(const QDict *dict)
+{
+    return qdict_haskey(dict, "exec-oob")
+        && !qdict_haskey(dict, "execute");
+}
+
+QDict *qmp_dispatch(QmpCommandList *cmds, QObject *request,
+                    bool allow_oob)
+{
+    Error *err =3D NULL;
     bool oob;
     const char *command;
-    QDict *args, *dict;
+    QDict *args;
     QmpCommand *cmd;
+    QDict *dict =3D qobject_to(QDict, request);
+    QObject *id =3D dict ? qdict_get(dict, "id") : NULL;
     QObject *ret =3D NULL;
+    QDict *rsp;
=20
-    dict =3D qmp_dispatch_check_obj(request, allow_oob, errp);
+    dict =3D qmp_dispatch_check_obj(request, allow_oob, &err);
     if (!dict) {
-        return NULL;
+        goto out;
     }
=20
     command =3D qdict_get_try_str(dict, "execute");
@@ -99,27 +122,27 @@ static QObject *do_qmp_dispatch(QmpCommandList *cmds, =
QObject *request,
     }
     cmd =3D qmp_find_command(cmds, command);
     if (cmd =3D=3D NULL) {
-        error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
+        error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
                   "The command %s has not been found", command);
-        return NULL;
+        goto out;
     }
     if (!cmd->enabled) {
-        error_set(errp, ERROR_CLASS_COMMAND_NOT_FOUND,
+        error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
                   "The command %s has been disabled for this instance",
                   command);
-        return NULL;
+        goto out;
     }
     if (oob && !(cmd->options & QCO_ALLOW_OOB)) {
-        error_setg(errp, "The command %s does not support OOB",
+        error_setg(&err, "The command %s does not support OOB",
                    command);
-        return NULL;
+        goto out;
     }
=20
     if (runstate_check(RUN_STATE_PRECONFIG) &&
         !(cmd->options & QCO_ALLOW_PRECONFIG)) {
-        error_setg(errp, "The command '%s' isn't permitted in '%s' state",
+        error_setg(&err, "The command '%s' isn't permitted in '%s' state",
                    cmd->name, RunState_str(RUN_STATE_PRECONFIG));
-        return NULL;
+        goto out;
     }
=20
     if (!qdict_haskey(dict, "arguments")) {
@@ -129,9 +152,9 @@ static QObject *do_qmp_dispatch(QmpCommandList *cmds, Q=
Object *request,
         qobject_ref(args);
     }
=20
-    cmd->fn(args, &ret, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    cmd->fn(args, &ret, &err);
+    if (err) {
+        ;
     } else if (cmd->options & QCO_NO_SUCCESS_RESP) {
         g_assert(!ret);
     } else if (!ret) {
@@ -141,38 +164,7 @@ static QObject *do_qmp_dispatch(QmpCommandList *cmds, =
QObject *request,
=20
     qobject_unref(args);
=20
-    return ret;
-}
-
-QDict *qmp_error_response(Error *err)
-{
-    QDict *rsp;
-
-    rsp =3D qdict_from_jsonf_nofail("{ 'error': { 'class': %s, 'desc': %s =
} }",
-                                  QapiErrorClass_str(error_get_class(err))=
,
-                                  error_get_pretty(err));
-    error_free(err);
-    return rsp;
-}
-
-/*
- * Does @qdict look like a command to be run out-of-band?
- */
-bool qmp_is_oob(const QDict *dict)
-{
-    return qdict_haskey(dict, "exec-oob")
-        && !qdict_haskey(dict, "execute");
-}
-
-QDict *qmp_dispatch(QmpCommandList *cmds, QObject *request,
-                    bool allow_oob)
-{
-    Error *err =3D NULL;
-    QDict *dict =3D qobject_to(QDict, request);
-    QObject *ret, *id =3D dict ? qdict_get(dict, "id") : NULL;
-    QDict *rsp;
-
-    ret =3D do_qmp_dispatch(cmds, request, allow_oob, &err);
+out:
     if (err) {
         rsp =3D qmp_error_response(err);
     } else if (ret) {
--=20
2.21.1


