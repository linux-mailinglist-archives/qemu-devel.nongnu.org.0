Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87169179439
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 17:01:37 +0100 (CET)
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9WSm-0002Qq-IO
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 11:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9WQw-00013g-6t
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:59:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9WQu-0007Vj-Td
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:59:42 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47761
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9WQu-0007V9-Pm
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 10:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583337580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNA0tqF9UZqFFGMbe2i230NuZZVfg+YOeujEsXn2voE=;
 b=E9CYG7oK5/0BavJHCT6BXVvbkyd7dGLOo3f2JIGtCekbkMGw5roo3XQ6fLDhz+yiYtqQo4
 xcF3sHIqsf0Jjwy7PdADF8Q1xT3w5Z0ET0QSjHhhAQJh9jut7NwSMzBuoR24mCtwao3uYl
 L2VOy0FY9mN50H42Yp+sR8OISK9z6yI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-tpIHyePCN1qgBiJ1pyhB0Q-1; Wed, 04 Mar 2020 10:59:38 -0500
X-MC-Unique: tpIHyePCN1qgBiJ1pyhB0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 366418018AA;
 Wed,  4 Mar 2020 15:59:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CA5A7389B;
 Wed,  4 Mar 2020 15:59:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8DC2711385ED; Wed,  4 Mar 2020 16:59:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] qapi: Inheriting from object is pointless with Python
 3, drop
Date: Wed,  4 Mar 2020 16:59:29 +0100
Message-Id: <20200304155932.20452-2-armbru@redhat.com>
In-Reply-To: <20200304155932.20452-1-armbru@redhat.com>
References: <20200304155932.20452-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: mdroth@linux.vnet.ibm.com, philmd@redhat.com, jsnow@redhat.com,
 ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 scripts/qapi/gen.py    |  2 +-
 scripts/qapi/parser.py |  6 +++---
 scripts/qapi/schema.py | 12 ++++++------
 scripts/qapi/source.py |  4 ++--
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 95afae0615..a53a705c73 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -22,7 +22,7 @@ from qapi.common import *
 from qapi.schema import QAPISchemaVisitor
=20
=20
-class QAPIGen(object):
+class QAPIGen:
=20
     def __init__(self, fname):
         self.fname =3D fname
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 342792e410..2e3a3c5d76 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -23,7 +23,7 @@ from qapi.error import QAPIParseError, QAPISemError
 from qapi.source import QAPISourceInfo
=20
=20
-class QAPISchemaParser(object):
+class QAPISchemaParser:
=20
     def __init__(self, fname, previously_included=3DNone, incl_info=3DNone=
):
         previously_included =3D previously_included or set()
@@ -293,7 +293,7 @@ class QAPISchemaParser(object):
         raise QAPIParseError(self, "documentation comment must end with '#=
#'")
=20
=20
-class QAPIDoc(object):
+class QAPIDoc:
     """
     A documentation comment block, either definition or free-form
=20
@@ -312,7 +312,7 @@ class QAPIDoc(object):
     Free-form documentation blocks consist only of a body section.
     """
=20
-    class Section(object):
+    class Section:
         def __init__(self, name=3DNone):
             # optional section name (argument/member or section name)
             self.name =3D name
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 5100110fa2..c8bcfe2c49 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -24,7 +24,7 @@ from qapi.expr import check_exprs
 from qapi.parser import QAPISchemaParser
=20
=20
-class QAPISchemaEntity(object):
+class QAPISchemaEntity:
     meta =3D None
=20
     def __init__(self, name, info, doc, ifcond=3DNone, features=3DNone):
@@ -89,7 +89,7 @@ class QAPISchemaEntity(object):
         return "%s '%s'" % (self.meta, self.name)
=20
=20
-class QAPISchemaVisitor(object):
+class QAPISchemaVisitor:
     def visit_begin(self, schema):
         pass
=20
@@ -135,7 +135,7 @@ class QAPISchemaVisitor(object):
         pass
=20
=20
-class QAPISchemaModule(object):
+class QAPISchemaModule:
     def __init__(self, name):
         self.name =3D name
         self._entity_list =3D []
@@ -441,7 +441,7 @@ class QAPISchemaObjectType(QAPISchemaType):
                                        self.features)
=20
=20
-class QAPISchemaMember(object):
+class QAPISchemaMember:
     """ Represents object members, enum members and features """
     role =3D 'member'
=20
@@ -519,7 +519,7 @@ class QAPISchemaObjectTypeMember(QAPISchemaMember):
                                         self.describe)
=20
=20
-class QAPISchemaObjectTypeVariants(object):
+class QAPISchemaObjectTypeVariants:
     def __init__(self, tag_name, info, tag_member, variants):
         # Flat unions pass tag_name but not tag_member.
         # Simple unions and alternates pass tag_member but not tag_name.
@@ -787,7 +787,7 @@ class QAPISchemaEvent(QAPISchemaEntity):
                             self.arg_type, self.boxed)
=20
=20
-class QAPISchema(object):
+class QAPISchema:
     def __init__(self, fname):
         self.fname =3D fname
         parser =3D QAPISchemaParser(fname)
diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index 8956885033..e97b9a8e15 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -13,7 +13,7 @@ import copy
 import sys
=20
=20
-class QAPISchemaPragma(object):
+class QAPISchemaPragma:
     def __init__(self):
         # Are documentation comments required?
         self.doc_required =3D False
@@ -23,7 +23,7 @@ class QAPISchemaPragma(object):
         self.name_case_whitelist =3D []
=20
=20
-class QAPISourceInfo(object):
+class QAPISourceInfo:
     def __init__(self, fname, line, parent):
         self.fname =3D fname
         self.line =3D line
--=20
2.21.1


