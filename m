Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E04A172192
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 15:50:26 +0100 (CET)
Received: from localhost ([::1]:32984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7KUb-0004mD-Dd
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 09:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j7KQE-0008E8-W5
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 09:45:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j7KQC-0000V9-Ky
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 09:45:54 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47268
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j7KQ9-0000Uk-II
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 09:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582814749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7m89kCXz9T4cCsGgy3I2NFEqbjdeG1Ia8bhcMnfgXN0=;
 b=I914fK5iKwXbIpaGJzJg9fw5kmYin5f5+W+T94vJpaXjWz7mNj7ZW8cQ1hZpFGSshPp5Wu
 rlFerBuxwdZUrJyfW5Td5vhPeeKF2kexonD7N0AvL1Sa0ecDfufPq89ECrfyNdnoc60Pa5
 OF1Gnbh31JXPMT8i3oCaoSWYgSnm890=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-ssRb_SufOeGG5SQCfOdWKg-1; Thu, 27 Feb 2020 09:45:34 -0500
X-MC-Unique: ssRb_SufOeGG5SQCfOdWKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5564C800D55;
 Thu, 27 Feb 2020 14:45:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C07985DA2C;
 Thu, 27 Feb 2020 14:45:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1E45B1138611; Thu, 27 Feb 2020 15:45:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] qapi: Use super() now we have Python 3
Date: Thu, 27 Feb 2020 15:45:30 +0100
Message-Id: <20200227144531.24309-4-armbru@redhat.com>
In-Reply-To: <20200227144531.24309-1-armbru@redhat.com>
References: <20200227144531.24309-1-armbru@redhat.com>
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
Cc: mdroth@linux.vnet.ibm.com, jsnow@redhat.com, ehabkost@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/commands.py   |  4 +--
 scripts/qapi/error.py      |  4 +--
 scripts/qapi/events.py     |  4 +--
 scripts/qapi/gen.py        | 10 ++++----
 scripts/qapi/introspect.py |  4 +--
 scripts/qapi/parser.py     |  2 +-
 scripts/qapi/schema.py     | 50 +++++++++++++++++++-------------------
 scripts/qapi/types.py      |  4 +--
 scripts/qapi/visit.py      |  4 +--
 9 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index afa55b055c..8bb6316061 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -237,8 +237,8 @@ void %(c_prefix)sqmp_init_marshal(QmpCommandList *cmds)
 class QAPISchemaGenCommandVisitor(QAPISchemaModularCVisitor):
=20
     def __init__(self, prefix):
-        QAPISchemaModularCVisitor.__init__(
-            self, prefix, 'qapi-commands',
+        super().__init__(
+            prefix, 'qapi-commands',
             ' * Schema-defined QAPI/QMP commands', None, __doc__)
         self._regy =3D QAPIGenCCode(None)
         self._visited_ret_types =3D {}
diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index b9f3751bea..ae60d9e2fe 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -35,9 +35,9 @@ class QAPIParseError(QAPIError):
                 col =3D (col + 7) % 8 + 1
             else:
                 col +=3D 1
-        QAPIError.__init__(self, parser.info, col, msg)
+        super().__init__(parser.info, col, msg)
=20
=20
 class QAPISemError(QAPIError):
     def __init__(self, info, msg):
-        QAPIError.__init__(self, info, None, msg)
+        super().__init__(info, None, msg)
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 2bde3e6128..a98b9f5099 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -138,8 +138,8 @@ def gen_event_send(name, arg_type, boxed, event_enum_na=
me, event_emit):
 class QAPISchemaGenEventVisitor(QAPISchemaModularCVisitor):
=20
     def __init__(self, prefix):
-        QAPISchemaModularCVisitor.__init__(
-            self, prefix, 'qapi-events',
+        super().__init__(
+            prefix, 'qapi-events',
             ' * Schema-defined QAPI/QMP events', None, __doc__)
         self._event_enum_name =3D c_name(prefix + 'QAPIEvent', protect=3DF=
alse)
         self._event_enum_members =3D []
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 317cd72601..e17354392b 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -82,7 +82,7 @@ def _wrap_ifcond(ifcond, before, after):
 class QAPIGenCCode(QAPIGen):
=20
     def __init__(self, fname):
-        QAPIGen.__init__(self, fname)
+        super().__init__(fname)
         self._start_if =3D None
=20
     def start_if(self, ifcond):
@@ -102,13 +102,13 @@ class QAPIGenCCode(QAPIGen):
=20
     def get_content(self):
         assert self._start_if is None
-        return QAPIGen.get_content(self)
+        return super().get_content()
=20
=20
 class QAPIGenC(QAPIGenCCode):
=20
     def __init__(self, fname, blurb, pydoc):
-        QAPIGenCCode.__init__(self, fname)
+        super().__init__(fname)
         self._blurb =3D blurb
         self._copyright =3D '\n * '.join(re.findall(r'^Copyright .*', pydo=
c,
                                                   re.MULTILINE))
@@ -141,7 +141,7 @@ char qapi_dummy_%(name)s;
 class QAPIGenH(QAPIGenC):
=20
     def _top(self):
-        return QAPIGenC._top(self) + guardstart(self.fname)
+        return super()._top() + guardstart(self.fname)
=20
     def _bottom(self):
         return guardend(self.fname)
@@ -176,7 +176,7 @@ def ifcontext(ifcond, *args):
 class QAPIGenDoc(QAPIGen):
=20
     def _top(self):
-        return (QAPIGen._top(self)
+        return (super()._top()
                 + '@c AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n')
=20
=20
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index b3a463dd8b..0cc655fd9f 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -76,8 +76,8 @@ def to_c_string(string):
 class QAPISchemaGenIntrospectVisitor(QAPISchemaMonolithicCVisitor):
=20
     def __init__(self, prefix, unmask):
-        QAPISchemaMonolithicCVisitor.__init__(
-            self, prefix, 'qapi-introspect',
+        super().__init__(
+            prefix, 'qapi-introspect',
             ' * QAPI/QMP schema introspection', __doc__)
         self._unmask =3D unmask
         self._schema =3D None
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index cf14e5426c..340f7c4633 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -320,7 +320,7 @@ class QAPIDoc:
=20
     class ArgSection(Section):
         def __init__(self, name):
-            QAPIDoc.Section.__init__(self, name)
+            super().__init__(name)
             self.member =3D None
=20
         def connect(self, member):
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index c8bcfe2c49..e132442c04 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -152,11 +152,11 @@ class QAPISchemaModule:
=20
 class QAPISchemaInclude(QAPISchemaEntity):
     def __init__(self, sub_module, info):
-        QAPISchemaEntity.__init__(self, None, info, None)
+        super().__init__(None, info, None)
         self._sub_module =3D sub_module
=20
     def visit(self, visitor):
-        QAPISchemaEntity.visit(self, visitor)
+        super().visit(visitor)
         visitor.visit_include(self._sub_module.name, self.info)
=20
=20
@@ -202,7 +202,7 @@ class QAPISchemaBuiltinType(QAPISchemaType):
     meta =3D 'built-in'
=20
     def __init__(self, name, json_type, c_type):
-        QAPISchemaType.__init__(self, name, None, None)
+        super().__init__(name, None, None)
         assert not c_type or isinstance(c_type, str)
         assert json_type in ('string', 'number', 'int', 'boolean', 'null',
                              'value')
@@ -227,7 +227,7 @@ class QAPISchemaBuiltinType(QAPISchemaType):
         return self.json_type()
=20
     def visit(self, visitor):
-        QAPISchemaType.visit(self, visitor)
+        super().visit(visitor)
         visitor.visit_builtin_type(self.name, self.info, self.json_type())
=20
=20
@@ -235,7 +235,7 @@ class QAPISchemaEnumType(QAPISchemaType):
     meta =3D 'enum'
=20
     def __init__(self, name, info, doc, ifcond, members, prefix):
-        QAPISchemaType.__init__(self, name, info, doc, ifcond)
+        super().__init__(name, info, doc, ifcond)
         for m in members:
             assert isinstance(m, QAPISchemaEnumMember)
             m.set_defined_in(name)
@@ -244,7 +244,7 @@ class QAPISchemaEnumType(QAPISchemaType):
         self.prefix =3D prefix
=20
     def check(self, schema):
-        QAPISchemaType.check(self, schema)
+        super().check(schema)
         seen =3D {}
         for m in self.members:
             m.check_clash(self.info, seen)
@@ -269,7 +269,7 @@ class QAPISchemaEnumType(QAPISchemaType):
         return 'string'
=20
     def visit(self, visitor):
-        QAPISchemaType.visit(self, visitor)
+        super().visit(visitor)
         visitor.visit_enum_type(self.name, self.info, self.ifcond,
                                 self.members, self.prefix)
=20
@@ -278,13 +278,13 @@ class QAPISchemaArrayType(QAPISchemaType):
     meta =3D 'array'
=20
     def __init__(self, name, info, element_type):
-        QAPISchemaType.__init__(self, name, info, None, None)
+        super().__init__(name, info, None, None)
         assert isinstance(element_type, str)
         self._element_type_name =3D element_type
         self.element_type =3D None
=20
     def check(self, schema):
-        QAPISchemaType.check(self, schema)
+        super().check(schema)
         self.element_type =3D schema.resolve_type(
             self._element_type_name, self.info,
             self.info and self.info.defn_meta)
@@ -314,7 +314,7 @@ class QAPISchemaArrayType(QAPISchemaType):
         return 'array of ' + elt_doc_type
=20
     def visit(self, visitor):
-        QAPISchemaType.visit(self, visitor)
+        super().visit(visitor)
         visitor.visit_array_type(self.name, self.info, self.ifcond,
                                  self.element_type)
=20
@@ -329,7 +329,7 @@ class QAPISchemaObjectType(QAPISchemaType):
         # struct has local_members, optional base, and no variants
         # flat union has base, variants, and no local_members
         # simple union has local_members, variants, and no base
-        QAPISchemaType.__init__(self, name, info, doc, ifcond, features)
+        super().__init__(name, info, doc, ifcond, features)
         self.meta =3D 'union' if variants else 'struct'
         assert base is None or isinstance(base, str)
         for m in local_members:
@@ -356,7 +356,7 @@ class QAPISchemaObjectType(QAPISchemaType):
             raise QAPISemError(self.info,
                                "object %s contains itself" % self.name)
=20
-        QAPISchemaType.check(self, schema)
+        super().check(schema)
         assert self._checked and self.members is None
=20
         seen =3D OrderedDict()
@@ -419,7 +419,7 @@ class QAPISchemaObjectType(QAPISchemaType):
=20
     def c_name(self):
         assert self.name !=3D 'q_empty'
-        return QAPISchemaType.c_name(self)
+        return super().c_name()
=20
     def c_type(self):
         assert not self.is_implicit()
@@ -432,7 +432,7 @@ class QAPISchemaObjectType(QAPISchemaType):
         return 'object'
=20
     def visit(self, visitor):
-        QAPISchemaType.visit(self, visitor)
+        super().visit(visitor)
         visitor.visit_object_type(self.name, self.info, self.ifcond,
                                   self.base, self.local_members, self.vari=
ants,
                                   self.features)
@@ -506,7 +506,7 @@ class QAPISchemaFeature(QAPISchemaMember):
=20
 class QAPISchemaObjectTypeMember(QAPISchemaMember):
     def __init__(self, name, info, typ, optional, ifcond=3DNone):
-        QAPISchemaMember.__init__(self, name, info, ifcond)
+        super().__init__(name, info, ifcond)
         assert isinstance(typ, str)
         assert isinstance(optional, bool)
         self._type_name =3D typ
@@ -614,7 +614,7 @@ class QAPISchemaObjectTypeVariant(QAPISchemaObjectTypeM=
ember):
     role =3D 'branch'
=20
     def __init__(self, name, info, typ, ifcond=3DNone):
-        QAPISchemaObjectTypeMember.__init__(self, name, info, typ,
+        super().__init__(name, info, typ,
                                             False, ifcond)
=20
=20
@@ -622,7 +622,7 @@ class QAPISchemaAlternateType(QAPISchemaType):
     meta =3D 'alternate'
=20
     def __init__(self, name, info, doc, ifcond, variants):
-        QAPISchemaType.__init__(self, name, info, doc, ifcond)
+        super().__init__(name, info, doc, ifcond)
         assert isinstance(variants, QAPISchemaObjectTypeVariants)
         assert variants.tag_member
         variants.set_defined_in(name)
@@ -630,7 +630,7 @@ class QAPISchemaAlternateType(QAPISchemaType):
         self.variants =3D variants
=20
     def check(self, schema):
-        QAPISchemaType.check(self, schema)
+        super().check(schema)
         self.variants.tag_member.check(schema)
         # Not calling self.variants.check_clash(), because there's nothing
         # to clash with
@@ -680,7 +680,7 @@ class QAPISchemaAlternateType(QAPISchemaType):
         return 'value'
=20
     def visit(self, visitor):
-        QAPISchemaType.visit(self, visitor)
+        super().visit(visitor)
         visitor.visit_alternate_type(self.name, self.info, self.ifcond,
                                      self.variants)
=20
@@ -691,7 +691,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
     def __init__(self, name, info, doc, ifcond, arg_type, ret_type,
                  gen, success_response, boxed, allow_oob, allow_preconfig,
                  features):
-        QAPISchemaEntity.__init__(self, name, info, doc, ifcond, features)
+        super().__init__(name, info, doc, ifcond, features)
         assert not arg_type or isinstance(arg_type, str)
         assert not ret_type or isinstance(ret_type, str)
         self._arg_type_name =3D arg_type
@@ -705,7 +705,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
         self.allow_preconfig =3D allow_preconfig
=20
     def check(self, schema):
-        QAPISchemaEntity.check(self, schema)
+        super().check(schema)
         if self._arg_type_name:
             self.arg_type =3D schema.resolve_type(
                 self._arg_type_name, self.info, "command's 'data'")
@@ -740,7 +740,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
                 self.arg_type.connect_doc(doc)
=20
     def visit(self, visitor):
-        QAPISchemaEntity.visit(self, visitor)
+        super().visit(visitor)
         visitor.visit_command(self.name, self.info, self.ifcond,
                               self.arg_type, self.ret_type,
                               self.gen, self.success_response,
@@ -753,14 +753,14 @@ class QAPISchemaEvent(QAPISchemaEntity):
     meta =3D 'event'
=20
     def __init__(self, name, info, doc, ifcond, arg_type, boxed):
-        QAPISchemaEntity.__init__(self, name, info, doc, ifcond)
+        super().__init__(name, info, doc, ifcond)
         assert not arg_type or isinstance(arg_type, str)
         self._arg_type_name =3D arg_type
         self.arg_type =3D None
         self.boxed =3D boxed
=20
     def check(self, schema):
-        QAPISchemaEntity.check(self, schema)
+        super().check(schema)
         if self._arg_type_name:
             self.arg_type =3D schema.resolve_type(
                 self._arg_type_name, self.info, "event's 'data'")
@@ -782,7 +782,7 @@ class QAPISchemaEvent(QAPISchemaEntity):
                 self.arg_type.connect_doc(doc)
=20
     def visit(self, visitor):
-        QAPISchemaEntity.visit(self, visitor)
+        super().visit(visitor)
         visitor.visit_event(self.name, self.info, self.ifcond,
                             self.arg_type, self.boxed)
=20
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 99dcaf7074..3c83b6e4be 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -241,8 +241,8 @@ void qapi_free_%(c_name)s(%(c_name)s *obj)
 class QAPISchemaGenTypeVisitor(QAPISchemaModularCVisitor):
=20
     def __init__(self, prefix):
-        QAPISchemaModularCVisitor.__init__(
-            self, prefix, 'qapi-types', ' * Schema-defined QAPI types',
+        super().__init__(
+            prefix, 'qapi-types', ' * Schema-defined QAPI types',
             ' * Built-in QAPI types', __doc__)
=20
     def _begin_system_module(self, name):
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 4efce62b0c..421e5bd8cd 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -283,8 +283,8 @@ out:
 class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisitor):
=20
     def __init__(self, prefix):
-        QAPISchemaModularCVisitor.__init__(
-            self, prefix, 'qapi-visit', ' * Schema-defined QAPI visitors',
+        super().__init__(
+            prefix, 'qapi-visit', ' * Schema-defined QAPI visitors',
             ' * Built-in QAPI visitors', __doc__)
=20
     def _begin_system_module(self, name):
--=20
2.21.1


