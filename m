Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F7177C5A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:52:06 +0100 (CET)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Am5-0000f3-AS
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9AW7-0004ap-8Q
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9AW5-0003AE-Uz
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51499
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9AW5-00039y-HM
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583253333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYRBn1WKH6uNvCj8WQZtPRk+MzbUUTNl8UbjVjr+4JU=;
 b=f2QWX5923HdA1MDCfPSOEHRHed6xkdydSeZPwsfXtAsmUhXKDlSLiF4+gMtKiZ0IHC2R0E
 H/fCj440W2A7yC60VJ9xRgUNQmDxdmqcYxOJAFw5siWpTMLSxiDjfeSkJ2EjOu4RBSMSeM
 EDrdDhDSPhCUagI1Dw53fE9A0haToXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-XVW0CFbeOHSWusIbmgPFEg-1; Tue, 03 Mar 2020 11:35:14 -0500
X-MC-Unique: XVW0CFbeOHSWusIbmgPFEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FF3D800D5A;
 Tue,  3 Mar 2020 16:35:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45D461001920;
 Tue,  3 Mar 2020 16:35:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E04E61132A03; Tue,  3 Mar 2020 17:35:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/30] qapi/introspect: Factor out _make_tree()
Date: Tue,  3 Mar 2020 17:34:50 +0100
Message-Id: <20200303163505.32041-16-armbru@redhat.com>
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com>
References: <20200303163505.32041-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: libvir-list@redhat.com, berrange@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The value of @qmp_schema_qlit is generated from an expression tree.
Tree nodes are created in several places.  Factor out the common code
into _make_tree().  This isn't much of a win now.  It will pay off
when we add feature flags in the next few commits.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/introspect.py | 44 +++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index e4fc9d90f1..a3fa9865db 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -16,6 +16,18 @@ from qapi.schema import (QAPISchemaArrayType, QAPISchema=
BuiltinType,
                          QAPISchemaType)
=20
=20
+def _make_tree(obj, ifcond, features, extra=3DNone):
+    if extra is None:
+        extra =3D {}
+    if ifcond:
+        extra['if'] =3D ifcond
+    if features:
+        obj['features'] =3D [(f.name, {'if': f.ifcond}) for f in features]
+    if extra:
+        return (obj, extra)
+    return obj
+
+
 def _tree_to_qlit(obj, level=3D0, suppress_first_indent=3DFalse):
=20
     def indent(level):
@@ -146,47 +158,38 @@ const QLitObject %(c_name)s =3D %(c_string)s;
         return self._name(typ.name)
=20
     def _gen_tree(self, name, mtype, obj, ifcond, features):
-        extra =3D {}
+        extra =3D None
         if mtype not in ('command', 'event', 'builtin', 'array'):
             if not self._unmask:
                 # Output a comment to make it easy to map masked names
                 # back to the source when reading the generated output.
-                extra['comment'] =3D '"%s" =3D %s' % (self._name(name), na=
me)
+                extra =3D {'comment': '"%s" =3D %s' % (self._name(name), n=
ame)}
             name =3D self._name(name)
         obj['name'] =3D name
         obj['meta-type'] =3D mtype
-        if features:
-            obj['features'] =3D [(f.name, {'if': f.ifcond}) for f in featu=
res]
-        if ifcond:
-            extra['if'] =3D ifcond
-        if extra:
-            self._trees.append((obj, extra))
-        else:
-            self._trees.append(obj)
+        self._trees.append(_make_tree(obj, ifcond, features, extra))
=20
     def _gen_member(self, member):
-        ret =3D {'name': member.name, 'type': self._use_type(member.type)}
+        obj =3D {'name': member.name, 'type': self._use_type(member.type)}
         if member.optional:
-            ret['default'] =3D None
-        if member.ifcond:
-            ret =3D (ret, {'if': member.ifcond})
-        return ret
+            obj['default'] =3D None
+        return _make_tree(obj, member.ifcond, None)
=20
     def _gen_variants(self, tag_name, variants):
         return {'tag': tag_name,
                 'variants': [self._gen_variant(v) for v in variants]}
=20
     def _gen_variant(self, variant):
-        return ({'case': variant.name, 'type': self._use_type(variant.type=
)},
-                {'if': variant.ifcond})
+        obj =3D {'case': variant.name, 'type': self._use_type(variant.type=
)}
+        return _make_tree(obj, variant.ifcond, None)
=20
     def visit_builtin_type(self, name, info, json_type):
         self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None=
)
=20
     def visit_enum_type(self, name, info, ifcond, features, members, prefi=
x):
         self._gen_tree(name, 'enum',
-                       {'values':
-                        [(m.name, {'if': m.ifcond}) for m in members]},
+                       {'values': [_make_tree(m.name, m.ifcond, None)
+                                   for m in members]},
                        ifcond, features)
=20
     def visit_array_type(self, name, info, ifcond, element_type):
@@ -206,7 +209,8 @@ const QLitObject %(c_name)s =3D %(c_string)s;
     def visit_alternate_type(self, name, info, ifcond, features, variants)=
:
         self._gen_tree(name, 'alternate',
                        {'members': [
-                           ({'type': self._use_type(m.type)}, {'if': m.ifc=
ond})
+                           _make_tree({'type': self._use_type(m.type)},
+                                      m.ifcond, None)
                            for m in variants.variants]},
                        ifcond, features)
=20
--=20
2.21.1


