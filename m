Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5900D104372
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 19:28:13 +0100 (CET)
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXUi3-0004me-UN
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 13:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iXUfx-0003E1-15
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:26:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iXUfu-00083M-UW
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:26:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54282
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iXUfu-000835-QO
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 13:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574274358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wbHKGl4VKJS7oylcaMTkmc7AQJ+X3Y4TJPOCz/mFYH4=;
 b=LPLWEng0tuZ33unfSi920ShQtFvNpZt0H2svXYd4UYawiwfsdn+5pN7lepLtlKiA4Z1OTd
 c23kpzCMASckYHL4BvJBhiVlzNkoZ6VpDzjstdx8sCfrWqhLK83TXt7Fna6N8n4wYMQo3i
 chbyb43aBEknpydB20wMdjJOpnu3nGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-u9MBhDCINey3natO_uvxFA-1; Wed, 20 Nov 2019 13:25:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AA9D800A02;
 Wed, 20 Nov 2019 18:25:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7B063483A;
 Wed, 20 Nov 2019 18:25:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 60FD511366D1; Wed, 20 Nov 2019 19:25:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] qapi: Proper intermediate representation for modules
Date: Wed, 20 Nov 2019 19:25:49 +0100
Message-Id: <20191120182551.23795-5-armbru@redhat.com>
In-Reply-To: <20191120182551.23795-1-armbru@redhat.com>
References: <20191120182551.23795-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: u9MBhDCINey3natO_uvxFA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: mdroth@linux.vnet.ibm.com, kwolf@pond.sub.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modules are represented only by their names so far.  Introduce class
QAPISchemaModule.  So far, it merely wraps the name.  The next patch
will put it to more interesting use.

Once again, arrays spice up the patch a bit.  For any other type,
@info points to the definition, which lets us map from @info to
module.  For arrays, there is no definition, and @info points to the
first use instead.  We have to use the element type's module instead,
which is only available after .check().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/schema.py | 63 ++++++++++++++++++++++++++++--------------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index cfb574c85d..0f2e0dcfce 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -50,9 +50,6 @@ class QAPISchemaEntity(object):
=20
     def check(self, schema):
         assert not self._checked
-        if self.info:
-            self._module =3D os.path.relpath(self.info.fname,
-                                           os.path.dirname(schema.fname))
         seen =3D {}
         for f in self.features:
             f.check_clash(self.info, seen)
@@ -68,6 +65,13 @@ class QAPISchemaEntity(object):
         if self.doc:
             self.doc.check()
=20
+    def _set_module(self, schema, info):
+        assert self._checked
+        self._module =3D schema.module_by_fname(info and info.fname)
+
+    def set_module(self, schema):
+        self._set_module(schema, self.info)
+
     @property
     def ifcond(self):
         assert self._checked
@@ -75,7 +79,7 @@ class QAPISchemaEntity(object):
=20
     @property
     def module(self):
-        assert self._checked
+        assert self._module or not self.info
         return self._module
=20
     def is_implicit(self):
@@ -135,15 +139,19 @@ class QAPISchemaVisitor(object):
         pass
=20
=20
+class QAPISchemaModule(object):
+    def __init__(self, name):
+        self.name =3D name
+
+
 class QAPISchemaInclude(QAPISchemaEntity):
-
-    def __init__(self, fname, info):
+    def __init__(self, sub_module, info):
         QAPISchemaEntity.__init__(self, None, info, None)
-        self.fname =3D fname
+        self._sub_module =3D sub_module
=20
     def visit(self, visitor):
         QAPISchemaEntity.visit(self, visitor)
-        visitor.visit_include(self.fname, self.info)
+        visitor.visit_include(self._sub_module.name, self.info)
=20
=20
 class QAPISchemaType(QAPISchemaEntity):
@@ -276,16 +284,14 @@ class QAPISchemaArrayType(QAPISchemaType):
             self.info and self.info.defn_meta)
         assert not isinstance(self.element_type, QAPISchemaArrayType)
=20
+    def set_module(self, schema):
+        self._set_module(schema, self.element_type.info)
+
     @property
     def ifcond(self):
         assert self._checked
         return self.element_type.ifcond
=20
-    @property
-    def module(self):
-        assert self._checked
-        return self.element_type.module
-
     def is_implicit(self):
         return True
=20
@@ -783,6 +789,10 @@ class QAPISchema(object):
         self.docs =3D parser.docs
         self._entity_list =3D []
         self._entity_dict =3D {}
+        self._module_dict =3D {}
+        self._schema_dir =3D os.path.dirname(fname)
+        self._make_module(None) # built-ins
+        self._make_module(fname)
         self._predefining =3D True
         self._def_predefineds()
         self._predefining =3D False
@@ -826,14 +836,26 @@ class QAPISchema(object):
                 info, "%s uses unknown type '%s'" % (what, name))
         return typ
=20
+    def _module_name(self, fname):
+        if fname is None:
+            return None
+        return os.path.relpath(fname, self._schema_dir)
+
+    def _make_module(self, fname):
+        name =3D self._module_name(fname)
+        if not name in self._module_dict:
+            self._module_dict[name] =3D QAPISchemaModule(name)
+        return self._module_dict[name]
+
+    def module_by_fname(self, fname):
+        name =3D self._module_name(fname)
+        assert name in self._module_dict
+        return self._module_dict[name]
+
     def _def_include(self, expr, info, doc):
         include =3D expr['include']
         assert doc is None
-        main_info =3D info
-        while main_info.parent:
-            main_info =3D main_info.parent
-        fname =3D os.path.relpath(include, os.path.dirname(main_info.fname=
))
-        self._def_entity(QAPISchemaInclude(fname, info))
+        self._def_entity(QAPISchemaInclude(self._make_module(include), inf=
o))
=20
     def _def_builtin_type(self, name, json_type, c_type):
         self._def_entity(QAPISchemaBuiltinType(name, json_type, c_type))
@@ -1065,15 +1087,16 @@ class QAPISchema(object):
             ent.check(self)
             ent.connect_doc()
             ent.check_doc()
+        for ent in self._entity_list:
+            ent.set_module(self)
=20
     def visit(self, visitor):
         visitor.visit_begin(self)
         module =3D None
-        visitor.visit_module(module)
         for entity in self._entity_list:
             if visitor.visit_needed(entity):
                 if entity.module !=3D module:
                     module =3D entity.module
-                    visitor.visit_module(module)
+                    visitor.visit_module(module.name)
                 entity.visit(visitor)
         visitor.visit_end()
--=20
2.21.0


