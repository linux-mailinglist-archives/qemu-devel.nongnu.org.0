Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBEA177C0F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:39:23 +0100 (CET)
Received: from localhost ([::1]:49986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9AZm-0001VQ-1z
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9AVr-0004IK-0Q
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9AVp-00030J-Ns
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:18 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20589
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9AVp-000301-Jw
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583253317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaqqrU7+ycxBpa7UVzZzOOY0KUMW86V9JtKDT0zf7k0=;
 b=evgskU6rc9Rv86DnhsKftKHNq8qYeM0TyXCdVe68P8wB+3OUmtPORWE6aArHc0GX2QToR/
 LctPBvHLtBab/E3ZKmtW/c3LAPlDj8QiDcsRa7lASUuHUYFLOLzgaKlbSxpRA6KmVoY2/z
 0TTTH4OwKwoxTfUfd5FRDtDkA5Ing24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-dIzalZkpMQqQah_-5MnAXQ-1; Tue, 03 Mar 2020 11:35:15 -0500
X-MC-Unique: dIzalZkpMQqQah_-5MnAXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86067107ACCD;
 Tue,  3 Mar 2020 16:35:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BC9960C80;
 Tue,  3 Mar 2020 16:35:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BEFCA113639D; Tue,  3 Mar 2020 17:35:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/30] tests/test-qmp-cmds: Factor out qmp_dispatch() test
 helpers
Date: Tue,  3 Mar 2020 17:34:40 +0100
Message-Id: <20200303163505.32041-6-armbru@redhat.com>
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com>
References: <20200303163505.32041-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

Checking the value of qmp_dispatch() is repetitive.  Factor out
helpers do_qmp_dispatch() and do_qmp_dispatch_error().  Without this,
the next commit would make things even more repetitive.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/test-qmp-cmds.c | 72 +++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/tests/test-qmp-cmds.c b/tests/test-qmp-cmds.c
index 79507d9e54..b31064b064 100644
--- a/tests/test-qmp-cmds.c
+++ b/tests/test-qmp-cmds.c
@@ -145,34 +145,55 @@ __org_qemu_x_Union1 *qmp___org_qemu_x_command(__org_q=
emu_x_EnumList *a,
 }
=20
=20
+static QObject *do_qmp_dispatch(QDict *req, bool allow_oob)
+{
+    QDict *resp;
+    QObject *ret;
+
+    resp =3D qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob);
+    g_assert(resp && !qdict_haskey(resp, "error"));
+    ret =3D qdict_get(resp, "return");
+    g_assert(ret);
+
+    qobject_ref(ret);
+    qobject_unref(resp);
+    return ret;
+}
+
+static void do_qmp_dispatch_error(QDict *req, bool allow_oob, ErrorClass c=
ls)
+{
+    QDict *resp;
+
+    resp =3D qmp_dispatch(&qmp_commands, QOBJECT(req), allow_oob);
+    g_assert(resp && qdict_haskey(resp, "error"));
+
+    qobject_unref(resp);
+}
+
 /* test commands with no input and no return value */
 static void test_dispatch_cmd(void)
 {
     QDict *req =3D qdict_new();
-    QDict *resp;
+    QObject *ret;
=20
     qdict_put_str(req, "execute", "user_def_cmd");
=20
-    resp =3D qmp_dispatch(&qmp_commands, QOBJECT(req), false);
-    assert(resp !=3D NULL);
-    assert(!qdict_haskey(resp, "error"));
+    ret =3D do_qmp_dispatch(req, false);
=20
-    qobject_unref(resp);
+    qobject_unref(ret);
     qobject_unref(req);
 }
=20
 static void test_dispatch_cmd_oob(void)
 {
     QDict *req =3D qdict_new();
-    QDict *resp;
+    QObject *ret;
=20
     qdict_put_str(req, "exec-oob", "test-flags-command");
=20
-    resp =3D qmp_dispatch(&qmp_commands, QOBJECT(req), true);
-    assert(resp !=3D NULL);
-    assert(!qdict_haskey(resp, "error"));
+    ret =3D do_qmp_dispatch(req, true);
=20
-    qobject_unref(resp);
+    qobject_unref(ret);
     qobject_unref(req);
 }
=20
@@ -181,15 +202,11 @@ static void test_dispatch_cmd_failure(void)
 {
     QDict *req =3D qdict_new();
     QDict *args =3D qdict_new();
-    QDict *resp;
=20
     qdict_put_str(req, "execute", "user_def_cmd2");
=20
-    resp =3D qmp_dispatch(&qmp_commands, QOBJECT(req), false);
-    assert(resp !=3D NULL);
-    assert(qdict_haskey(resp, "error"));
+    do_qmp_dispatch_error(req, false, ERROR_CLASS_GENERIC_ERROR);
=20
-    qobject_unref(resp);
     qobject_unref(req);
=20
     /* check that with extra arguments it throws an error */
@@ -199,11 +216,8 @@ static void test_dispatch_cmd_failure(void)
=20
     qdict_put_str(req, "execute", "user_def_cmd");
=20
-    resp =3D qmp_dispatch(&qmp_commands, QOBJECT(req), false);
-    assert(resp !=3D NULL);
-    assert(qdict_haskey(resp, "error"));
+    do_qmp_dispatch_error(req, false, ERROR_CLASS_GENERIC_ERROR);
=20
-    qobject_unref(resp);
     qobject_unref(req);
 }
=20
@@ -218,20 +232,6 @@ static void test_dispatch_cmd_success_response(void)
     qobject_unref(req);
 }
=20
-static QObject *test_qmp_dispatch(QDict *req)
-{
-    QDict *resp;
-    QObject *ret;
-
-    resp =3D qmp_dispatch(&qmp_commands, QOBJECT(req), false);
-    assert(resp && !qdict_haskey(resp, "error"));
-    ret =3D qdict_get(resp, "return");
-    assert(ret);
-    qobject_ref(ret);
-    qobject_unref(resp);
-    return ret;
-}
-
 /* test commands that involve both input parameters and return values */
 static void test_dispatch_cmd_io(void)
 {
@@ -254,7 +254,7 @@ static void test_dispatch_cmd_io(void)
     qdict_put(req, "arguments", args);
     qdict_put_str(req, "execute", "user_def_cmd2");
=20
-    ret =3D qobject_to(QDict, test_qmp_dispatch(req));
+    ret =3D qobject_to(QDict, do_qmp_dispatch(req, false));
=20
     assert(!strcmp(qdict_get_str(ret, "string0"), "blah1"));
     ret_dict =3D qdict_get_qdict(ret, "dict1");
@@ -275,12 +275,10 @@ static void test_dispatch_cmd_io(void)
     qdict_put(req, "arguments", args3);
     qdict_put_str(req, "execute", "guest-get-time");
=20
-    ret3 =3D qobject_to(QNum, test_qmp_dispatch(req));
+    ret3 =3D qobject_to(QNum, do_qmp_dispatch(req, false));
     g_assert(qnum_get_try_int(ret3, &val));
     g_assert_cmpint(val, =3D=3D, 66);
     qobject_unref(ret3);
-
-    qobject_unref(req);
 }
=20
 /* test generated dealloc functions for generated types */
--=20
2.21.1


