Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2C1C5B7F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 17:35:35 +0200 (CEST)
Received: from localhost ([::1]:56436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVzba-0000gl-JR
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 11:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVzVq-0003NT-PT
 for qemu-devel@nongnu.org; Tue, 05 May 2020 11:29:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24631
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVzVl-0007QW-Co
 for qemu-devel@nongnu.org; Tue, 05 May 2020 11:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588692571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfvPDqW/knyQKGlAtdClqdP25r0g9LJ1Uccxe20cSpc=;
 b=Vek+7cTWY7h7sRQwth658cTnXohDFcE5q5sR5Ts7fpH6Qo9JTBDhgYqhxhTnDCBSraOCSs
 DPL3PuDT5LokbFmb+tt5HfwvOTiQrlADxgWAhCjjVbLeC62TIdOzLdVIrjPk63+AtddVBm
 qhc4tzxckTCzznWK9FjPL58/8GJUHCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-dIYTK3DgOUWKnH0q8iznQA-1; Tue, 05 May 2020 11:29:30 -0400
X-MC-Unique: dIYTK3DgOUWKnH0q8iznQA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FF05107ACF3
 for <qemu-devel@nongnu.org>; Tue,  5 May 2020 15:29:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ACED5D785;
 Tue,  5 May 2020 15:29:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4855211358C4; Tue,  5 May 2020 17:29:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/18] tests/check-qom-proplist: Improve iterator coverage
Date: Tue,  5 May 2020 17:29:16 +0200
Message-Id: <20200505152926.18877-9-armbru@redhat.com>
In-Reply-To: <20200505152926.18877-1-armbru@redhat.com>
References: <20200505152926.18877-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 03:48:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tests' "qemu-dummy" device has only class properties.  Turn one of
them into an instance property.  test_dummy_class_iterator() expects
one fewer property than test_dummy_iterator().  Rewrite
test_dummy_prop_iterator() to take expected properties as argument.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/check-qom-proplist.c | 51 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index a8b2958e6e..140d56439a 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -130,17 +130,18 @@ static void dummy_init(Object *obj)
     object_property_add_bool(obj, "bv",
                              dummy_get_bv,
                              dummy_set_bv,
-                             &err);
+                             NULL);
+    /* duplicate: */
+    object_property_add_str(obj, "sv",
+                            dummy_get_sv,
+                            dummy_set_sv,
+                            &err);
     error_free_or_abort(&err);
 }
=20
=20
 static void dummy_class_init(ObjectClass *cls, void *data)
 {
-    object_class_property_add_bool(cls, "bv",
-                                   dummy_get_bv,
-                                   dummy_set_bv,
-                                   NULL);
     object_class_property_add_str(cls, "sv",
                                   dummy_get_sv,
                                   dummy_set_sv,
@@ -520,34 +521,33 @@ static void test_dummy_getenum(void)
 }
=20
=20
-static void test_dummy_prop_iterator(ObjectPropertyIterator *iter)
+static void test_dummy_prop_iterator(ObjectPropertyIterator *iter,
+                                     const char *expected[], int n)
 {
-    bool seenbv =3D false, seensv =3D false, seenav =3D false, seentype =
=3D false;
     ObjectProperty *prop;
+    int i;
=20
     while ((prop =3D object_property_iter_next(iter))) {
-        if (!seenbv && g_str_equal(prop->name, "bv")) {
-            seenbv =3D true;
-        } else if (!seensv && g_str_equal(prop->name, "sv")) {
-            seensv =3D true;
-        } else if (!seenav && g_str_equal(prop->name, "av")) {
-            seenav =3D true;
-        } else if (!seentype && g_str_equal(prop->name, "type")) {
-            /* This prop comes from the base Object class */
-            seentype =3D true;
-        } else {
-            g_printerr("Found prop '%s'\n", prop->name);
-            g_assert_not_reached();
+        for (i =3D 0; i < n; i++) {
+            if (!g_strcmp0(prop->name, expected[i])) {
+                break;
+            }
         }
+        g_assert(i < n);
+        expected[i] =3D NULL;
+    }
+
+    for (i =3D 0; i < n; i++) {
+        g_assert(!expected[i]);
     }
-    g_assert(seenbv);
-    g_assert(seenav);
-    g_assert(seensv);
-    g_assert(seentype);
 }
=20
 static void test_dummy_iterator(void)
 {
+    const char *expected[] =3D {
+        "type",                 /* inherited from TYPE_OBJECT */
+        "sv", "av",             /* class properties */
+        "bv"};                  /* instance property */
     Object *parent =3D object_get_objects_root();
     DummyObject *dobj =3D DUMMY_OBJECT(
         object_new_with_props(TYPE_DUMMY,
@@ -561,17 +561,18 @@ static void test_dummy_iterator(void)
     ObjectPropertyIterator iter;
=20
     object_property_iter_init(&iter, OBJECT(dobj));
-    test_dummy_prop_iterator(&iter);
+    test_dummy_prop_iterator(&iter, expected, ARRAY_SIZE(expected));
     object_unparent(OBJECT(dobj));
 }
=20
 static void test_dummy_class_iterator(void)
 {
+    const char *expected[] =3D { "type", "av", "sv" };
     ObjectPropertyIterator iter;
     ObjectClass *klass =3D object_class_by_name(TYPE_DUMMY);
=20
     object_class_property_iter_init(&iter, klass);
-    test_dummy_prop_iterator(&iter);
+    test_dummy_prop_iterator(&iter, expected, ARRAY_SIZE(expected));
 }
=20
 static void test_dummy_delchild(void)
--=20
2.21.1


