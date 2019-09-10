Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF06AAE3E4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 08:40:36 +0200 (CEST)
Received: from localhost ([::1]:34216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7ZpL-0006T3-OX
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 02:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38601)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i7ZmP-0004kL-37
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 02:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i7ZmM-0007iK-SK
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 02:37:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47140)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i7ZmM-0007hb-K6
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 02:37:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DCE8EEC536;
 Tue, 10 Sep 2019 06:37:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AFF95C22C;
 Tue, 10 Sep 2019 06:37:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 41E7011655FD; Tue, 10 Sep 2019 08:37:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 08:37:18 +0200
Message-Id: <20190910063724.28470-11-armbru@redhat.com>
In-Reply-To: <20190910063724.28470-1-armbru@redhat.com>
References: <20190910063724.28470-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 10 Sep 2019 06:37:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 10/16] qapi: Permit omitting all flat union
 branches
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Absent flat union branches default to the empty struct (since commit
800877bb16 "qapi: allow empty branches in flat unions").  But am
attempt to omit all of them is rejected with "Union 'FOO' has no
branches".  Harmless oddity, but it's easy to avoid, so do that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.txt            |  3 +--
 scripts/qapi/common.py                  | 16 ++++++++--------
 tests/qapi-schema/flat-union-empty.err  |  2 +-
 tests/qapi-schema/flat-union-empty.json |  2 +-
 tests/qapi-schema/qapi-schema-test.json |  5 +++++
 tests/qapi-schema/qapi-schema-test.out  |  9 +++++++++
 tests/qapi-schema/union-empty.err       |  2 +-
 tests/qapi-schema/union-empty.json      |  2 +-
 8 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 4ce67752a7..ec2d374483 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -436,8 +436,7 @@ Union types are used to let the user choose between s=
everal different
 variants for an object.  There are two flavors: simple (no
 discriminator or base), and flat (both discriminator and base).  A union
 type is defined using a data dictionary as explained in the following
-paragraphs.  The data dictionary for either type of union must not
-be empty.
+paragraphs.  Unions must have at least one branch.
=20
 A simple union type defines a mapping from automatic discriminator
 values to data types like in this example:
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 46a4b07a04..b797924539 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -849,7 +849,7 @@ def check_union(expr, info):
=20
     # With no discriminator it is a simple union.
     if discriminator is None:
-        enum_define =3D None
+        enum_values =3D members.keys()
         allow_metas =3D ['built-in', 'union', 'alternate', 'struct', 'en=
um']
         if base is not None:
             raise QAPISemError(info, "Simple union '%s' must not have a =
base" %
@@ -882,16 +882,17 @@ def check_union(expr, info):
                                'must not be conditional' %
                                (base, discriminator, name))
         enum_define =3D enum_types.get(discriminator_value['type'])
-        allow_metas =3D ['struct']
         # Do not allow string discriminator
         if not enum_define:
             raise QAPISemError(info,
                                "Discriminator '%s' must be of enumeratio=
n "
                                "type" % discriminator)
+        enum_values =3D enum_get_names(enum_define)
+        allow_metas =3D ['struct']
+
+    if (len(enum_values) =3D=3D 0):
+        raise QAPISemError(info, "Union '%s' has no branches" % name)
=20
-    # Check every branch; don't allow an empty union
-    if len(members) =3D=3D 0:
-        raise QAPISemError(info, "Union '%s' cannot have empty 'data'" %=
 name)
     for (key, value) in members.items():
         check_name(info, "Member of union '%s'" % name, key)
=20
@@ -904,8 +905,8 @@ def check_union(expr, info):
=20
         # If the discriminator names an enum type, then all members
         # of 'data' must also be members of the enum type.
-        if enum_define:
-            if key not in enum_get_names(enum_define):
+        if discriminator is not None:
+            if key not in enum_values:
                 raise QAPISemError(info,
                                    "Discriminator value '%s' is not foun=
d in "
                                    "enum '%s'"
@@ -1575,7 +1576,6 @@ class QAPISchemaObjectTypeVariants(object):
         assert bool(tag_member) !=3D bool(tag_name)
         assert (isinstance(tag_name, str) or
                 isinstance(tag_member, QAPISchemaObjectTypeMember))
-        assert len(variants) > 0
         for v in variants:
             assert isinstance(v, QAPISchemaObjectTypeVariant)
         self._tag_name =3D tag_name
diff --git a/tests/qapi-schema/flat-union-empty.err b/tests/qapi-schema/f=
lat-union-empty.err
index 15754f54eb..fedbc0d1cf 100644
--- a/tests/qapi-schema/flat-union-empty.err
+++ b/tests/qapi-schema/flat-union-empty.err
@@ -1 +1 @@
-tests/qapi-schema/flat-union-empty.json:4: Union 'Union' cannot have emp=
ty 'data'
+tests/qapi-schema/flat-union-empty.json:4: Union 'Union' has no branches
diff --git a/tests/qapi-schema/flat-union-empty.json b/tests/qapi-schema/=
flat-union-empty.json
index 77f1d9abfb..83e1cc7b96 100644
--- a/tests/qapi-schema/flat-union-empty.json
+++ b/tests/qapi-schema/flat-union-empty.json
@@ -1,4 +1,4 @@
-# flat unions cannot be empty
+# flat union discriminator cannot be empty
 { 'enum': 'Empty', 'data': [ ] }
 { 'struct': 'Base', 'data': { 'type': 'Empty' } }
 { 'union': 'Union', 'base': 'Base', 'discriminator': 'type', 'data': { }=
 }
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/=
qapi-schema-test.json
index 8b0d47c4ab..75c42eb0e3 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -25,6 +25,11 @@
 { 'struct': 'Empty1', 'data': { } }
 { 'struct': 'Empty2', 'base': 'Empty1', 'data': { } }
=20
+# Likewise for an empty flat union
+{ 'union': 'Union',
+  'base': { 'type': 'EnumOne' }, 'discriminator': 'type',
+  'data': { } }
+
 { 'command': 'user_def_cmd0', 'data': 'Empty2', 'returns': 'Empty2' }
=20
 # for testing override of default naming heuristic
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/q=
api-schema-test.out
index bea7976bbb..98031da96f 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -23,6 +23,15 @@ enum MyEnum
 object Empty1
 object Empty2
     base Empty1
+object q_obj_Union-base
+    member type: EnumOne optional=3DFalse
+object Union
+    base q_obj_Union-base
+    tag type
+    case value1: q_empty
+    case value2: q_empty
+    case value3: q_empty
+    case value4: q_empty
 command user_def_cmd0 Empty2 -> Empty2
    gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconfi=
g=3DFalse
 enum QEnumTwo
diff --git a/tests/qapi-schema/union-empty.err b/tests/qapi-schema/union-=
empty.err
index 12c20221bd..d4241a38a2 100644
--- a/tests/qapi-schema/union-empty.err
+++ b/tests/qapi-schema/union-empty.err
@@ -1 +1 @@
-tests/qapi-schema/union-empty.json:2: Union 'Union' cannot have empty 'd=
ata'
+tests/qapi-schema/union-empty.json:2: Union 'Union' has no branches
diff --git a/tests/qapi-schema/union-empty.json b/tests/qapi-schema/union=
-empty.json
index 1f0b13ca21..df3e5e639a 100644
--- a/tests/qapi-schema/union-empty.json
+++ b/tests/qapi-schema/union-empty.json
@@ -1,2 +1,2 @@
-# unions cannot be empty
+# simple unions cannot be empty
 { 'union': 'Union', 'data': { } }
--=20
2.21.0


