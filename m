Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D71F18903E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 22:21:02 +0100 (CET)
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEJe1-0003Wc-5u
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 17:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEJL9-0002pA-KJ
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEJL4-0002en-8J
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:30 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:34474)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEJL4-0002Zr-0g
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584478885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8GmbqSh3ezRn1NFaS+ndpRqNAtKDr0pi8ONRoKBSgk=;
 b=J+mbOPtkYesqbX79EwFNp6xAnuDwAFDSRw0HgdOx37o4glhO0aHdqPzpCHOdqW9t5yRo8y
 5sfK14/xsReVEIJeEHX9aaqgcz3kKvN6uw3kUwJfOnvuMtSSWWkO+HqpIpIM26qvAXS//X
 LOvs8Pbvy3JS4jKDGx0NPD73omZleqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-Hhif-pAuPXacuDXq7veM5Q-1; Tue, 17 Mar 2020 17:01:24 -0400
X-MC-Unique: Hhif-pAuPXacuDXq7veM5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AEC3107ACC4
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 21:01:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC8FC7E31B;
 Tue, 17 Mar 2020 21:01:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 86E261135234; Tue, 17 Mar 2020 22:01:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/30] qapi: Simplify how qmp_dispatch() gets the request ID
Date: Tue, 17 Mar 2020 22:01:09 +0100
Message-Id: <20200317210115.8864-25-armbru@redhat.com>
In-Reply-To: <20200317210115.8864-1-armbru@redhat.com>
References: <20200317210115.8864-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We convert the request object to a QDict twice: first in
qmp_dispatch() to get the request ID, and then again in
qmp_dispatch_check_obj(), which converts to QDict, then checks and
returns it.  We can't get the request ID from the latter, because it's
null when the qdict flunks the checks.

Move the checked conversion to QDict from qmp_dispatch_check_obj() to
qmp_dispatch(), and drop the duplicate there.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200317115459.31821-24-armbru@redhat.com>
---
 qapi/qmp-dispatch.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 550d1fe8d2..91e50fa0dd 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -19,20 +19,13 @@
 #include "sysemu/runstate.h"
 #include "qapi/qmp/qbool.h"
=20
-static QDict *qmp_dispatch_check_obj(const QObject *request, bool allow_oo=
b,
+static QDict *qmp_dispatch_check_obj(QDict *dict, bool allow_oob,
                                      Error **errp)
 {
     const char *exec_key =3D NULL;
     const QDictEntry *ent;
     const char *arg_name;
     const QObject *arg_obj;
-    QDict *dict;
-
-    dict =3D qobject_to(QDict, request);
-    if (!dict) {
-        error_setg(errp, "QMP input must be a JSON object");
-        return NULL;
-    }
=20
     for (ent =3D qdict_first(dict); ent;
          ent =3D qdict_next(dict, ent)) {
@@ -103,13 +96,21 @@ QDict *qmp_dispatch(QmpCommandList *cmds, QObject *req=
uest,
     const char *command;
     QDict *args;
     QmpCommand *cmd;
-    QDict *dict =3D qobject_to(QDict, request);
-    QObject *id =3D dict ? qdict_get(dict, "id") : NULL;
+    QDict *dict;
+    QObject *id;
     QObject *ret =3D NULL;
     QDict *rsp =3D NULL;
=20
-    dict =3D qmp_dispatch_check_obj(request, allow_oob, &err);
+    dict =3D qobject_to(QDict, request);
     if (!dict) {
+        id =3D NULL;
+        error_setg(&err, "QMP input must be a JSON object");
+        goto out;
+    }
+
+    id =3D qdict_get(dict, "id");
+
+    if (!qmp_dispatch_check_obj(dict, allow_oob, &err)) {
         goto out;
     }
=20
--=20
2.21.1


