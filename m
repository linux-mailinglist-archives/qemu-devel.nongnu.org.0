Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32BBC907
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 15:39:32 +0200 (CEST)
Received: from localhost ([::1]:45770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCl2R-00080C-4N
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 09:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iCkrt-00006L-PT
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iCkrr-0001Q0-P5
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47576)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iCkrr-0001Pg-Hc
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 09:28:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C0B7C7FDF4;
 Tue, 24 Sep 2019 13:28:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D565C60BFB;
 Tue, 24 Sep 2019 13:28:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5F1191138660; Tue, 24 Sep 2019 15:28:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/25] qapi: Rename .owner to .defined_in
Date: Tue, 24 Sep 2019 15:28:07 +0200
Message-Id: <20190924132830.15835-3-armbru@redhat.com>
In-Reply-To: <20190924132830.15835-1-armbru@redhat.com>
References: <20190924132830.15835-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 24 Sep 2019 13:28:34 +0000 (UTC)
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPISchemaMember.owner is the name of the defining entity.  That's a
confusing name when an object type inherits members from a base type.
Rename it to .defined_in.  Rename .set_owner() and ._pretty_owner() to
match.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 61 +++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 155b87b825..bfb3e8a493 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -1319,7 +1319,7 @@ class QAPISchemaEnumType(QAPISchemaType):
         QAPISchemaType.__init__(self, name, info, doc, ifcond)
         for m in members:
             assert isinstance(m, QAPISchemaEnumMember)
-            m.set_owner(name)
+            m.set_defined_in(name)
         assert prefix is None or isinstance(prefix, str)
         self.members =3D members
         self.prefix =3D prefix
@@ -1405,13 +1405,13 @@ class QAPISchemaObjectType(QAPISchemaType):
         assert base is None or isinstance(base, str)
         for m in local_members:
             assert isinstance(m, QAPISchemaObjectTypeMember)
-            m.set_owner(name)
+            m.set_defined_in(name)
         if variants is not None:
             assert isinstance(variants, QAPISchemaObjectTypeVariants)
-            variants.set_owner(name)
+            variants.set_defined_in(name)
         for f in features:
             assert isinstance(f, QAPISchemaFeature)
-            f.set_owner(name)
+            f.set_defined_in(name)
         self._base_name =3D base
         self.base =3D None
         self.local_members =3D local_members
@@ -1521,15 +1521,16 @@ class QAPISchemaMember(object):
         assert isinstance(name, str)
         self.name =3D name
         self.ifcond =3D ifcond or []
-        self.owner =3D None
+        self.defined_in =3D None
=20
-    def set_owner(self, name):
-        assert not self.owner
-        self.owner =3D name
+    def set_defined_in(self, name):
+        assert not self.defined_in
+        self.defined_in =3D name
=20
     def check_clash(self, info, seen):
         cname =3D c_name(self.name)
-        if cname.lower() !=3D cname and self.owner not in name_case_whit=
elist:
+        if (cname.lower() !=3D cname
+                and self.defined_in not in name_case_whitelist):
             raise QAPISemError(info,
                                "%s should not use uppercase" % self.desc=
ribe())
         if cname in seen:
@@ -1537,27 +1538,27 @@ class QAPISchemaMember(object):
                                (self.describe(), seen[cname].describe())=
)
         seen[cname] =3D self
=20
-    def _pretty_owner(self):
-        owner =3D self.owner
-        if owner.startswith('q_obj_'):
+    def _pretty_defined_in(self):
+        defined_in =3D self.defined_in
+        if defined_in.startswith('q_obj_'):
             # See QAPISchema._make_implicit_object_type() - reverse the
             # mapping there to create a nice human-readable description
-            owner =3D owner[6:]
-            if owner.endswith('-arg'):
-                return '(parameter of %s)' % owner[:-4]
-            elif owner.endswith('-base'):
-                return '(base of %s)' % owner[:-5]
+            defined_in =3D defined_in[6:]
+            if defined_in.endswith('-arg'):
+                return '(parameter of %s)' % defined_in[:-4]
+            elif defined_in.endswith('-base'):
+                return '(base of %s)' % defined_in[:-5]
             else:
-                assert owner.endswith('-wrapper')
+                assert defined_in.endswith('-wrapper')
                 # Unreachable and not implemented
                 assert False
-        if owner.endswith('Kind'):
+        if defined_in.endswith('Kind'):
             # See QAPISchema._make_implicit_enum_type()
-            return '(branch of %s)' % owner[:-4]
-        return '(%s of %s)' % (self.role, owner)
+            return '(branch of %s)' % defined_in[:-4]
+        return '(%s of %s)' % (self.role, defined_in)
=20
     def describe(self):
-        return "'%s' %s" % (self.name, self._pretty_owner())
+        return "'%s' %s" % (self.name, self._pretty_defined_in())
=20
=20
 class QAPISchemaEnumMember(QAPISchemaMember):
@@ -1578,7 +1579,7 @@ class QAPISchemaObjectTypeMember(QAPISchemaMember):
         self.optional =3D optional
=20
     def check(self, schema):
-        assert self.owner
+        assert self.defined_in
         self.type =3D schema.lookup_type(self._type_name)
         assert self.type
=20
@@ -1598,9 +1599,9 @@ class QAPISchemaObjectTypeVariants(object):
         self.tag_member =3D tag_member
         self.variants =3D variants
=20
-    def set_owner(self, name):
+    def set_defined_in(self, name):
         for v in self.variants:
-            v.set_owner(name)
+            v.set_defined_in(name)
=20
     def check(self, schema, seen):
         if not self.tag_member:    # flat union
@@ -1616,7 +1617,7 @@ class QAPISchemaObjectTypeVariants(object):
                 if m.name not in cases:
                     v =3D QAPISchemaObjectTypeVariant(m.name, 'q_empty',
                                                     m.ifcond)
-                    v.set_owner(self.tag_member.owner)
+                    v.set_defined_in(self.tag_member.defined_in)
                     self.variants.append(v)
         assert self.variants
         for v in self.variants:
@@ -1648,8 +1649,8 @@ class QAPISchemaAlternateType(QAPISchemaType):
         QAPISchemaType.__init__(self, name, info, doc, ifcond)
         assert isinstance(variants, QAPISchemaObjectTypeVariants)
         assert variants.tag_member
-        variants.set_owner(name)
-        variants.tag_member.set_owner(self.name)
+        variants.set_defined_in(name)
+        variants.tag_member.set_defined_in(self.name)
         self.variants =3D variants
=20
     def check(self, schema):
@@ -1829,7 +1830,7 @@ class QAPISchema(object):
                 for v in values]
=20
     def _make_implicit_enum_type(self, name, info, ifcond, values):
-        # See also QAPISchemaObjectTypeMember._pretty_owner()
+        # See also QAPISchemaObjectTypeMember._pretty_defined_in()
         name =3D name + 'Kind'   # Use namespace reserved by add_name()
         self._def_entity(QAPISchemaEnumType(
             name, info, None, ifcond, self._make_enum_members(values), N=
one))
@@ -1845,7 +1846,7 @@ class QAPISchema(object):
                                    role, members):
         if not members:
             return None
-        # See also QAPISchemaObjectTypeMember._pretty_owner()
+        # See also QAPISchemaObjectTypeMember._pretty_defined_in()
         name =3D 'q_obj_%s-%s' % (name, role)
         typ =3D self.lookup_entity(name, QAPISchemaObjectType)
         if typ:
--=20
2.21.0


