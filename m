Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C807177C12
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:39:59 +0100 (CET)
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9AaM-0003Ba-29
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9AVp-0004Ga-5U
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9AVn-0002z6-Ry
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55051
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9AVn-0002yv-OQ
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583253315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VNM4FcuvpDlHlX1gsPH6mZYVPEgw3i0rjSojdcghyfE=;
 b=BH/0nQK90s7NvJbu1ZGgo3i+hoRo/9x/T77YuUwIkfwsl0zcUvq5sirXQHTFR+ys+sC1K4
 6KLXAb9WPEqwvHrrgNuV+68D6WmYClus9rp9HO3JcWVkUYow7RELQ3aPBprIRPUq3GPKTB
 OWJRW04RsfPHN9rDYPQEMihxdtYy3sU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-fwm9goPfMby_M_ayFfNR2A-1; Tue, 03 Mar 2020 11:35:13 -0500
X-MC-Unique: fwm9goPfMby_M_ayFfNR2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88BF0800D5F;
 Tue,  3 Mar 2020 16:35:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E82F5D9C9;
 Tue,  3 Mar 2020 16:35:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CC33011336BC; Tue,  3 Mar 2020 17:35:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/30] tests/test-qmp-event: Use qobject_is_equal()
Date: Tue,  3 Mar 2020 17:34:44 +0100
Message-Id: <20200303163505.32041-10-armbru@redhat.com>
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com>
References: <20200303163505.32041-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

Locally defined helper qdict_cmp_simple() implements just enough of a
comparison to serve here.  Replace it by qobject_is_equal(), which
implements all of it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/test-qmp-event.c | 66 +-----------------------------------------
 1 file changed, 1 insertion(+), 65 deletions(-)

diff --git a/tests/test-qmp-event.c b/tests/test-qmp-event.c
index 430001e622..d64066139c 100644
--- a/tests/test-qmp-event.c
+++ b/tests/test-qmp-event.c
@@ -28,73 +28,9 @@ typedef struct TestEventData {
     QDict *expect;
 } TestEventData;
=20
-typedef struct QDictCmpData {
-    QDict *expect;
-    bool result;
-} QDictCmpData;
-
 TestEventData *test_event_data;
 static GMutex test_event_lock;
=20
-/* Only compares bool, int, string */
-static
-void qdict_cmp_do_simple(const char *key, QObject *obj1, void *opaque)
-
-{
-    QObject *obj2;
-    QDictCmpData d_new, *d =3D opaque;
-    int64_t val1, val2;
-
-    if (!d->result) {
-        return;
-    }
-
-    obj2 =3D qdict_get(d->expect, key);
-    if (!obj2) {
-        d->result =3D false;
-        return;
-    }
-
-    if (qobject_type(obj1) !=3D qobject_type(obj2)) {
-        d->result =3D false;
-        return;
-    }
-
-    switch (qobject_type(obj1)) {
-    case QTYPE_QBOOL:
-        d->result =3D (qbool_get_bool(qobject_to(QBool, obj1)) =3D=3D
-                     qbool_get_bool(qobject_to(QBool, obj2)));
-        return;
-    case QTYPE_QNUM:
-        g_assert(qnum_get_try_int(qobject_to(QNum, obj1), &val1));
-        g_assert(qnum_get_try_int(qobject_to(QNum, obj2), &val2));
-        d->result =3D val1 =3D=3D val2;
-        return;
-    case QTYPE_QSTRING:
-        d->result =3D g_strcmp0(qstring_get_str(qobject_to(QString, obj1))=
,
-                              qstring_get_str(qobject_to(QString, obj2))) =
=3D=3D 0;
-        return;
-    case QTYPE_QDICT:
-        d_new.expect =3D qobject_to(QDict, obj2);
-        d_new.result =3D true;
-        qdict_iter(qobject_to(QDict, obj1), qdict_cmp_do_simple, &d_new);
-        d->result =3D d_new.result;
-        return;
-    default:
-        abort();
-    }
-}
-
-static bool qdict_cmp_simple(QDict *a, QDict *b)
-{
-    QDictCmpData d;
-
-    d.expect =3D b;
-    d.result =3D true;
-    qdict_iter(a, qdict_cmp_do_simple, &d);
-    return d.result;
-}
-
 void test_qapi_event_emit(test_QAPIEvent event, QDict *d)
 {
     QDict *t;
@@ -115,7 +51,7 @@ void test_qapi_event_emit(test_QAPIEvent event, QDict *d=
)
=20
     qdict_del(d, "timestamp");
=20
-    g_assert(qdict_cmp_simple(d, test_event_data->expect));
+    g_assert(qobject_is_equal(QOBJECT(d), QOBJECT(test_event_data->expect)=
));
=20
 }
=20
--=20
2.21.1


