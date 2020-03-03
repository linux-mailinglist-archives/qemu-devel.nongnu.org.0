Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E07177C1E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:42:31 +0100 (CET)
Received: from localhost ([::1]:50048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Aco-0001Jq-0M
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9AVp-0004HF-Mz
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9AVo-0002zT-El
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:17 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25726
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9AVo-0002zG-B6
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583253316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=txscctFiVA2U4b7jVQ1yKyvWF3aho58FNzAJU1Evot4=;
 b=ShALh36OqSM5X8iVsf1aJysgM/P0YS+clK2IK7y63c1gHfFWdIWsD044uUcTrEbj5OpIr+
 35OGfA2vUeSY7CBW7DsdUgMD6zMIwqUZJmKbGQj/ZhIUnqI/c8cwa7imhd+bCZGxo92riy
 mP2Ml5kGzohR3FCXDN5YPUjNLPvNvJ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-NBOcvYgcNuqaZVzHUJtVWg-1; Tue, 03 Mar 2020 11:35:14 -0500
X-MC-Unique: NBOcvYgcNuqaZVzHUJtVWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CB2D8017DF;
 Tue,  3 Mar 2020 16:35:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 972D291D63;
 Tue,  3 Mar 2020 16:35:11 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C905A113525C; Tue,  3 Mar 2020 17:35:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/30] tests/test-qmp-event: Simplify test data setup
Date: Tue,  3 Mar 2020 17:34:43 +0100
Message-Id: <20200303163505.32041-9-armbru@redhat.com>
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com>
References: <20200303163505.32041-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Building expected data with qdict_put() & friends is tedious to write
and hard to read.  Parse them from string literals with
qdict_from_jsonf_nofail() instead.

While there, use initializers instead of assignments for initializing
aggregate event arguments.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/test-qmp-event.c | 93 ++++++++++++------------------------------
 1 file changed, 27 insertions(+), 66 deletions(-)

diff --git a/tests/test-qmp-event.c b/tests/test-qmp-event.c
index eee7e08ab6..430001e622 100644
--- a/tests/test-qmp-event.c
+++ b/tests/test-qmp-event.c
@@ -17,6 +17,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qjson.h"
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qstring.h"
 #include "qapi/qmp-event.h"
@@ -124,17 +125,13 @@ static void event_prepare(TestEventData *data,
     /* Global variable test_event_data was used to pass the expectation, s=
o
        test cases can't be executed at same time. */
     g_mutex_lock(&test_event_lock);
-
-    data->expect =3D qdict_new();
     test_event_data =3D data;
 }
=20
 static void event_teardown(TestEventData *data,
                            const void *unused)
 {
-    qobject_unref(data->expect);
     test_event_data =3D NULL;
-
     g_mutex_unlock(&test_event_lock);
 }
=20
@@ -152,90 +149,54 @@ static void event_test_add(const char *testpath,
 static void test_event_a(TestEventData *data,
                          const void *unused)
 {
-    QDict *d;
-    d =3D data->expect;
-    qdict_put_str(d, "event", "EVENT_A");
+    data->expect =3D qdict_from_jsonf_nofail("{ 'event': 'EVENT_A' }");
     qapi_event_send_event_a();
+    qobject_unref(data->expect);
 }
=20
 static void test_event_b(TestEventData *data,
                          const void *unused)
 {
-    QDict *d;
-    d =3D data->expect;
-    qdict_put_str(d, "event", "EVENT_B");
+    data->expect =3D qdict_from_jsonf_nofail("{ 'event': 'EVENT_B' }");
     qapi_event_send_event_b();
+    qobject_unref(data->expect);
 }
=20
 static void test_event_c(TestEventData *data,
                          const void *unused)
 {
-    QDict *d, *d_data, *d_b;
-
-    UserDefOne b;
-    b.integer =3D 2;
-    b.string =3D g_strdup("test1");
-    b.has_enum1 =3D false;
-
-    d_b =3D qdict_new();
-    qdict_put_int(d_b, "integer", 2);
-    qdict_put_str(d_b, "string", "test1");
-
-    d_data =3D qdict_new();
-    qdict_put_int(d_data, "a", 1);
-    qdict_put(d_data, "b", d_b);
-    qdict_put_str(d_data, "c", "test2");
-
-    d =3D data->expect;
-    qdict_put_str(d, "event", "EVENT_C");
-    qdict_put(d, "data", d_data);
+    UserDefOne b =3D { .integer =3D 2, .string =3D (char *)"test1" };
=20
+    data->expect =3D qdict_from_jsonf_nofail(
+        "{ 'event': 'EVENT_C', 'data': {"
+        " 'a': 1, 'b': { 'integer': 2, 'string': 'test1' }, 'c': 'test2' }=
 }");
     qapi_event_send_event_c(true, 1, true, &b, "test2");
-
-    g_free(b.string);
+    qobject_unref(data->expect);
 }
=20
 /* Complex type */
 static void test_event_d(TestEventData *data,
                          const void *unused)
 {
-    UserDefOne struct1;
-    EventStructOne a;
-    QDict *d, *d_data, *d_a, *d_struct1;
-
-    struct1.integer =3D 2;
-    struct1.string =3D g_strdup("test1");
-    struct1.has_enum1 =3D true;
-    struct1.enum1 =3D ENUM_ONE_VALUE1;
-
-    a.struct1 =3D &struct1;
-    a.string =3D g_strdup("test2");
-    a.has_enum2 =3D true;
-    a.enum2 =3D ENUM_ONE_VALUE2;
-
-    d_struct1 =3D qdict_new();
-    qdict_put_int(d_struct1, "integer", 2);
-    qdict_put_str(d_struct1, "string", "test1");
-    qdict_put_str(d_struct1, "enum1", "value1");
-
-    d_a =3D qdict_new();
-    qdict_put(d_a, "struct1", d_struct1);
-    qdict_put_str(d_a, "string", "test2");
-    qdict_put_str(d_a, "enum2", "value2");
-
-    d_data =3D qdict_new();
-    qdict_put(d_data, "a", d_a);
-    qdict_put_str(d_data, "b", "test3");
-    qdict_put_str(d_data, "enum3", "value3");
-
-    d =3D data->expect;
-    qdict_put_str(d, "event", "EVENT_D");
-    qdict_put(d, "data", d_data);
+    UserDefOne struct1 =3D {
+        .integer =3D 2, .string =3D (char *)"test1",
+        .has_enum1 =3D true, .enum1 =3D ENUM_ONE_VALUE1,
+    };
+    EventStructOne a =3D {
+        .struct1 =3D &struct1,
+        .string =3D (char *)"test2",
+        .has_enum2 =3D true,
+        .enum2 =3D ENUM_ONE_VALUE2,
+    };
=20
+    data->expect =3D qdict_from_jsonf_nofail(
+        "{ 'event': 'EVENT_D', 'data': {"
+        " 'a': {"
+        "  'struct1': { 'integer': 2, 'string': 'test1', 'enum1': 'value1'=
 },"
+        "  'string': 'test2', 'enum2': 'value2' },"
+        " 'b': 'test3', 'enum3': 'value3' } }");
     qapi_event_send_event_d(&a, "test3", false, NULL, true, ENUM_ONE_VALUE=
3);
-
-    g_free(struct1.string);
-    g_free(a.string);
+    qobject_unref(data->expect);
 }
=20
 int main(int argc, char **argv)
--=20
2.21.1


