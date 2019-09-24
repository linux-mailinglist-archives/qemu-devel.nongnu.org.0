Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD2ABC838
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 14:52:12 +0200 (CEST)
Received: from localhost ([::1]:45304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCkId-0007If-7s
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 08:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCk0l-0001Is-ST
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCk0i-0006vH-G2
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48540)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCk0i-0006uA-4D
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 08:33:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C2D7308FFB1
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 12:33:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA6AD60852;
 Tue, 24 Sep 2019 12:33:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 967E11138528; Tue, 24 Sep 2019 14:33:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/37] qapi: Adjust frontend errors to say enum value,
 not member
Date: Tue, 24 Sep 2019 14:33:10 +0200
Message-Id: <20190924123334.30645-14-armbru@redhat.com>
In-Reply-To: <20190924123334.30645-1-armbru@redhat.com>
References: <20190924123334.30645-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 24 Sep 2019 12:33:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For consistency with docs/devel/qapi-code-gen.txt.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190913201349.24332-12-armbru@redhat.com>
---
 scripts/qapi/common.py                  | 11 ++++++++---
 scripts/qapi/events.py                  |  2 +-
 tests/qapi-schema/enum-clash-member.err |  2 +-
 tests/qapi-schema/enum-member-case.err  |  2 +-
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 3393a049cc..a538d2f37c 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -1340,7 +1340,7 @@ class QAPISchemaEnumType(QAPISchemaType):
     def __init__(self, name, info, doc, ifcond, members, prefix):
         QAPISchemaType.__init__(self, name, info, doc, ifcond)
         for m in members:
-            assert isinstance(m, QAPISchemaMember)
+            assert isinstance(m, QAPISchemaEnumMember)
             m.set_owner(name)
         assert prefix is None or isinstance(prefix, str)
         self.members =3D members
@@ -1551,6 +1551,10 @@ class QAPISchemaMember(object):
         return "'%s' %s" % (self.name, self._pretty_owner())
=20
=20
+class QAPISchemaEnumMember(QAPISchemaMember):
+    role =3D 'value'
+
+
 class QAPISchemaFeature(QAPISchemaMember):
     role =3D 'feature'
=20
@@ -1807,7 +1811,8 @@ class QAPISchema(object):
         return [QAPISchemaFeature(f['name'], f.get('if')) for f in featu=
res]
=20
     def _make_enum_members(self, values):
-        return [QAPISchemaMember(v['name'], v.get('if')) for v in values=
]
+        return [QAPISchemaEnumMember(v['name'], v.get('if'))
+                for v in values]
=20
     def _make_implicit_enum_type(self, name, info, ifcond, values):
         # See also QAPISchemaObjectTypeMember._pretty_owner()
@@ -2223,7 +2228,7 @@ const QEnumLookup %(c_name)s_lookup =3D {
=20
 def gen_enum(name, members, prefix=3DNone):
     # append automatically generated _MAX value
-    enum_members =3D members + [QAPISchemaMember('_MAX')]
+    enum_members =3D members + [QAPISchemaEnumMember('_MAX')]
=20
     ret =3D mcgen('''
=20
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index e0abfef7b0..7062553cf3 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -194,7 +194,7 @@ void %(event_emit)s(%(event_enum)s event, QDict *qdic=
t);
                                           self._event_emit_name))
         # Note: we generate the enum member regardless of @ifcond, to
         # keep the enumeration usable in target-independent code.
-        self._event_enum_members.append(QAPISchemaMember(name))
+        self._event_enum_members.append(QAPISchemaEnumMember(name))
=20
=20
 def gen_events(schema, output_dir, prefix):
diff --git a/tests/qapi-schema/enum-clash-member.err b/tests/qapi-schema/=
enum-clash-member.err
index 5403c78507..8238d2e807 100644
--- a/tests/qapi-schema/enum-clash-member.err
+++ b/tests/qapi-schema/enum-clash-member.err
@@ -1 +1 @@
-tests/qapi-schema/enum-clash-member.json:2: 'one_two' (member of MyEnum)=
 collides with 'one-two' (member of MyEnum)
+tests/qapi-schema/enum-clash-member.json:2: 'one_two' (value of MyEnum) =
collides with 'one-two' (value of MyEnum)
diff --git a/tests/qapi-schema/enum-member-case.err b/tests/qapi-schema/e=
num-member-case.err
index 3c67a3a067..5d689e92d5 100644
--- a/tests/qapi-schema/enum-member-case.err
+++ b/tests/qapi-schema/enum-member-case.err
@@ -1 +1 @@
-tests/qapi-schema/enum-member-case.json:4: 'Value' (member of NoWayThisW=
illGetWhitelisted) should not use uppercase
+tests/qapi-schema/enum-member-case.json:4: 'Value' (value of NoWayThisWi=
llGetWhitelisted) should not use uppercase
--=20
2.21.0


