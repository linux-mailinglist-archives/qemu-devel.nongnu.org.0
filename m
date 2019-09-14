Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7491B2C06
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Sep 2019 17:48:38 +0200 (CEST)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9AHs-000159-ME
	for lists+qemu-devel@lfdr.de; Sat, 14 Sep 2019 11:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i9A5B-0004zf-VS
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 11:35:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i9A59-0004yM-Vx
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 11:35:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60736)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i9A57-0004sq-R9
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 11:35:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 036A4883D7;
 Sat, 14 Sep 2019 15:35:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1B8E17B58;
 Sat, 14 Sep 2019 15:35:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C603B1133019; Sat, 14 Sep 2019 17:35:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Sep 2019 17:35:06 +0200
Message-Id: <20190914153506.2151-20-armbru@redhat.com>
In-Reply-To: <20190914153506.2151-1-armbru@redhat.com>
References: <20190914153506.2151-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Sat, 14 Sep 2019 15:35:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 19/19] qapi: Assert .visit() and .check_clash()
 run only after .check()
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

Easy since the previous commit provides .checked.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index c199a2b58c..b00caacca3 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -1190,7 +1190,7 @@ class QAPISchemaEntity(object):
         return not self.info
=20
     def visit(self, visitor):
-        pass
+        assert self._checked
=20
=20
 class QAPISchemaVisitor(object):
@@ -1245,6 +1245,7 @@ class QAPISchemaInclude(QAPISchemaEntity):
         self.fname =3D fname
=20
     def visit(self, visitor):
+        QAPISchemaEntity.visit(self, visitor)
         visitor.visit_include(self.fname, self.info)
=20
=20
@@ -1309,6 +1310,7 @@ class QAPISchemaBuiltinType(QAPISchemaType):
         return self.json_type()
=20
     def visit(self, visitor):
+        QAPISchemaType.visit(self, visitor)
         visitor.visit_builtin_type(self.name, self.info, self.json_type(=
))
=20
=20
@@ -1344,6 +1346,7 @@ class QAPISchemaEnumType(QAPISchemaType):
         return 'string'
=20
     def visit(self, visitor):
+        QAPISchemaType.visit(self, visitor)
         visitor.visit_enum_type(self.name, self.info, self.ifcond,
                                 self.members, self.prefix)
=20
@@ -1386,6 +1389,7 @@ class QAPISchemaArrayType(QAPISchemaType):
         return 'array of ' + elt_doc_type
=20
     def visit(self, visitor):
+        QAPISchemaType.visit(self, visitor)
         visitor.visit_array_type(self.name, self.info, self.ifcond,
                                  self.element_type)
=20
@@ -1461,6 +1465,7 @@ class QAPISchemaObjectType(QAPISchemaType):
     # and update seen to track the members seen so far. Report any error=
s
     # on behalf of info, which is not necessarily self.info
     def check_clash(self, info, seen):
+        assert self._checked
         assert not self.variants       # not implemented
         for m in self.members:
             m.check_clash(info, seen)
@@ -1498,6 +1503,7 @@ class QAPISchemaObjectType(QAPISchemaType):
         return 'object'
=20
     def visit(self, visitor):
+        QAPISchemaType.visit(self, visitor)
         visitor.visit_object_type(self.name, self.info, self.ifcond,
                                   self.base, self.local_members, self.va=
riants,
                                   self.features)
@@ -1665,6 +1671,7 @@ class QAPISchemaAlternateType(QAPISchemaType):
         return 'value'
=20
     def visit(self, visitor):
+        QAPISchemaType.visit(self, visitor)
         visitor.visit_alternate_type(self.name, self.info, self.ifcond,
                                      self.variants)
=20
@@ -1698,6 +1705,7 @@ class QAPISchemaCommand(QAPISchemaEntity):
             assert isinstance(self.ret_type, QAPISchemaType)
=20
     def visit(self, visitor):
+        QAPISchemaEntity.visit(self, visitor)
         visitor.visit_command(self.name, self.info, self.ifcond,
                               self.arg_type, self.ret_type,
                               self.gen, self.success_response,
@@ -1723,6 +1731,7 @@ class QAPISchemaEvent(QAPISchemaEntity):
             raise QAPISemError(self.info, "Use of 'boxed' requires 'data=
'")
=20
     def visit(self, visitor):
+        QAPISchemaEntity.visit(self, visitor)
         visitor.visit_event(self.name, self.info, self.ifcond,
                             self.arg_type, self.boxed)
=20
--=20
2.21.0


