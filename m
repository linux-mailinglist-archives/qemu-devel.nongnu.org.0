Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DF53F87DE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 14:45:57 +0200 (CEST)
Received: from localhost ([::1]:42486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJElX-0002jG-PE
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 08:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYw-0004D6-Oa
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJEYj-0008D0-An
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 08:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629981160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ha0NRGszXRvuXu1cqMClRbRl26czxc5YfaiZYrO3UXM=;
 b=AitU7up1DcuBU13a/IzQV3ENCP1HF6R5kSwwC5CNF79WjCCFUw3A4eiCc2KizuLDLmXlVg
 /+BuqOpQVqlAwKqOMy9BIl1a8zXHXwXIAVy0a5ID3oFIWlcpmSEMo8wAQwgjC//F2oOBhE
 fdcZcCNsRLdJksXkPizZrSNXXhwZFek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-VEGGKAqUNOeDw6WjaKs5iw-1; Thu, 26 Aug 2021 08:32:33 -0400
X-MC-Unique: VEGGKAqUNOeDw6WjaKs5iw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54AD11966321;
 Thu, 26 Aug 2021 12:32:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B87027CA8;
 Thu, 26 Aug 2021 12:32:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A00E611380B0; Thu, 26 Aug 2021 14:32:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/11] qapi: wrap Sequence[str] in an object
Date: Thu, 26 Aug 2021 14:32:17 +0200
Message-Id: <20210826123225.157891-4-armbru@redhat.com>
In-Reply-To: <20210826123225.157891-1-armbru@redhat.com>
References: <20210826123225.157891-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Mechanical change, except for a new assertion in
QAPISchemaEntity.ifcond().

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210804083105.97531-3-marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Rebased with obvious conflicts, commit message adjusted]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/sphinx/qapidoc.py         | 10 +++---
 scripts/qapi/commands.py       |  4 +--
 scripts/qapi/events.py         |  5 +--
 scripts/qapi/gen.py            | 14 ++++----
 scripts/qapi/introspect.py     | 30 ++++++++---------
 scripts/qapi/schema.py         | 60 +++++++++++++++++++++-------------
 scripts/qapi/types.py          | 33 ++++++++++---------
 scripts/qapi/visit.py          | 23 ++++++-------
 tests/qapi-schema/test-qapi.py |  4 +--
 9 files changed, 100 insertions(+), 83 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index 87c67ab23f..0eac3308b2 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -116,7 +116,7 @@ def _nodes_for_ifcond(self, ifcond, with_if=True):
         the conditions are in literal-text and the commas are not.
         If with_if is False, we don't return the "(If: " and ")".
         """
-        condlist = intersperse([nodes.literal('', c) for c in ifcond],
+        condlist = intersperse([nodes.literal('', c) for c in ifcond.ifcond],
                                nodes.Text(', '))
         if not with_if:
             return condlist
@@ -139,7 +139,7 @@ def _nodes_for_one_member(self, member):
             term.append(nodes.literal('', member.type.doc_type()))
         if member.optional:
             term.append(nodes.Text(' (optional)'))
-        if member.ifcond:
+        if member.ifcond.ifcond:
             term.extend(self._nodes_for_ifcond(member.ifcond))
         return term
 
@@ -154,7 +154,7 @@ def _nodes_for_variant_when(self, variants, variant):
                 nodes.literal('', variants.tag_member.name),
                 nodes.Text(' is '),
                 nodes.literal('', '"%s"' % variant.name)]
-        if variant.ifcond:
+        if variant.ifcond.ifcond:
             term.extend(self._nodes_for_ifcond(variant.ifcond))
         return term
 
@@ -209,7 +209,7 @@ def _nodes_for_enum_values(self, doc):
         dlnode = nodes.definition_list()
         for section in doc.args.values():
             termtext = [nodes.literal('', section.member.name)]
-            if section.member.ifcond:
+            if section.member.ifcond.ifcond:
                 termtext.extend(self._nodes_for_ifcond(section.member.ifcond))
             # TODO drop fallbacks when undocumented members are outlawed
             if section.text:
@@ -277,7 +277,7 @@ def _nodes_for_sections(self, doc):
     def _nodes_for_if_section(self, ifcond):
         """Return list of doctree nodes for the "If" section"""
         nodelist = []
-        if ifcond:
+        if ifcond.ifcond:
             snode = self._make_section('If')
             snode += nodes.paragraph(
                 '', '', *self._nodes_for_ifcond(ifcond, with_if=False)
diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 0e13d51054..3654825968 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -17,7 +17,6 @@
     Dict,
     List,
     Optional,
-    Sequence,
     Set,
 )
 
@@ -31,6 +30,7 @@
 from .schema import (
     QAPISchema,
     QAPISchemaFeature,
+    QAPISchemaIfCond,
     QAPISchemaObjectType,
     QAPISchemaType,
 )
@@ -301,7 +301,7 @@ def visit_end(self) -> None:
     def visit_command(self,
                       name: str,
                       info: Optional[QAPISourceInfo],
-                      ifcond: Sequence[str],
+                      ifcond: QAPISchemaIfCond,
                       features: List[QAPISchemaFeature],
                       arg_type: Optional[QAPISchemaObjectType],
                       ret_type: Optional[QAPISchemaType],
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index fee8c671e7..82475e84ec 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -12,7 +12,7 @@
 See the COPYING file in the top-level directory.
 """
 
-from typing import List, Optional, Sequence
+from typing import List, Optional
 
 from .common import c_enum_const, c_name, mcgen
 from .gen import QAPISchemaModularCVisitor, build_params, ifcontext
@@ -20,6 +20,7 @@
     QAPISchema,
     QAPISchemaEnumMember,
     QAPISchemaFeature,
+    QAPISchemaIfCond,
     QAPISchemaObjectType,
 )
 from .source import QAPISourceInfo
@@ -227,7 +228,7 @@ def visit_end(self) -> None:
     def visit_event(self,
                     name: str,
                     info: Optional[QAPISourceInfo],
-                    ifcond: Sequence[str],
+                    ifcond: QAPISchemaIfCond,
                     features: List[QAPISchemaFeature],
                     arg_type: Optional[QAPISchemaObjectType],
                     boxed: bool) -> None:
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 1fa503bdbd..1c5b190276 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -18,7 +18,6 @@
     Dict,
     Iterator,
     Optional,
-    Sequence,
     Tuple,
 )
 
@@ -32,6 +31,7 @@
     mcgen,
 )
 from .schema import (
+    QAPISchemaIfCond,
     QAPISchemaModule,
     QAPISchemaObjectType,
     QAPISchemaVisitor,
@@ -85,7 +85,7 @@ def write(self, output_dir: str) -> None:
                 fp.write(text)
 
 
-def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> str:
+def _wrap_ifcond(ifcond: QAPISchemaIfCond, before: str, after: str) -> str:
     if before == after:
         return after   # suppress empty #if ... #endif
 
@@ -95,9 +95,9 @@ def _wrap_ifcond(ifcond: Sequence[str], before: str, after: str) -> str:
     if added[0] == '\n':
         out += '\n'
         added = added[1:]
-    out += gen_if(ifcond)
+    out += gen_if(ifcond.ifcond)
     out += added
-    out += gen_endif(ifcond)
+    out += gen_endif(ifcond.ifcond)
     return out
 
 
@@ -127,9 +127,9 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
 class QAPIGenCCode(QAPIGen):
     def __init__(self, fname: str):
         super().__init__(fname)
-        self._start_if: Optional[Tuple[Sequence[str], str, str]] = None
+        self._start_if: Optional[Tuple[QAPISchemaIfCond, str, str]] = None
 
-    def start_if(self, ifcond: Sequence[str]) -> None:
+    def start_if(self, ifcond: QAPISchemaIfCond) -> None:
         assert self._start_if is None
         self._start_if = (ifcond, self._body, self._preamble)
 
@@ -187,7 +187,7 @@ def _bottom(self) -> str:
 
 
 @contextmanager
-def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -> Iterator[None]:
+def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Iterator[None]:
     """
     A with-statement context manager that wraps with `start_if()` / `end_if()`.
 
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 9a348ca2e5..db1ebbf53a 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -15,11 +15,9 @@
     Any,
     Dict,
     Generic,
-    Iterable,
     List,
     Optional,
     Sequence,
-    Tuple,
     TypeVar,
     Union,
 )
@@ -38,6 +36,7 @@
     QAPISchemaEntity,
     QAPISchemaEnumMember,
     QAPISchemaFeature,
+    QAPISchemaIfCond,
     QAPISchemaObjectType,
     QAPISchemaObjectTypeMember,
     QAPISchemaType,
@@ -91,11 +90,11 @@ class Annotated(Generic[_ValueT]):
     """
     # TODO: Remove after Python 3.7 adds @dataclass:
     # pylint: disable=too-few-public-methods
-    def __init__(self, value: _ValueT, ifcond: Iterable[str],
+    def __init__(self, value: _ValueT, ifcond: QAPISchemaIfCond,
                  comment: Optional[str] = None):
         self.value = value
         self.comment: Optional[str] = comment
-        self.ifcond: Tuple[str, ...] = tuple(ifcond)
+        self.ifcond = ifcond
 
 
 def _tree_to_qlit(obj: JSONValue,
@@ -124,11 +123,11 @@ def indent(level: int) -> str:
         ret = ''
         if obj.comment:
             ret += indent(level) + f"/* {obj.comment} */\n"
-        if obj.ifcond:
-            ret += gen_if(obj.ifcond)
+        if obj.ifcond.ifcond:
+            ret += gen_if(obj.ifcond.ifcond)
         ret += _tree_to_qlit(obj.value, level)
-        if obj.ifcond:
-            ret += '\n' + gen_endif(obj.ifcond)
+        if obj.ifcond.ifcond:
+            ret += '\n' + gen_endif(obj.ifcond.ifcond)
         return ret
 
     ret = ''
@@ -254,7 +253,7 @@ def _gen_features(features: Sequence[QAPISchemaFeature]
         return [Annotated(f.name, f.ifcond) for f in features]
 
     def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
-                  ifcond: Sequence[str] = (),
+                  ifcond: QAPISchemaIfCond = QAPISchemaIfCond(),
                   features: Sequence[QAPISchemaFeature] = ()) -> None:
         """
         Build and append a SchemaInfo object to self._trees.
@@ -305,7 +304,7 @@ def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
         self._gen_tree(name, 'builtin', {'json-type': json_type})
 
     def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
-                        ifcond: Sequence[str],
+                        ifcond: QAPISchemaIfCond,
                         features: List[QAPISchemaFeature],
                         members: List[QAPISchemaEnumMember],
                         prefix: Optional[str]) -> None:
@@ -316,14 +315,14 @@ def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
         )
 
     def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
-                         ifcond: Sequence[str],
+                         ifcond: QAPISchemaIfCond,
                          element_type: QAPISchemaType) -> None:
         element = self._use_type(element_type)
         self._gen_tree('[' + element + ']', 'array', {'element-type': element},
                        ifcond)
 
     def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
-                               ifcond: Sequence[str],
+                               ifcond: QAPISchemaIfCond,
                                features: List[QAPISchemaFeature],
                                members: List[QAPISchemaObjectTypeMember],
                                variants: Optional[QAPISchemaVariants]) -> None:
@@ -336,7 +335,7 @@ def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
         self._gen_tree(name, 'object', obj, ifcond, features)
 
     def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
-                             ifcond: Sequence[str],
+                             ifcond: QAPISchemaIfCond,
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
         self._gen_tree(
@@ -348,7 +347,7 @@ def visit_alternate_type(self, name: str, info: Optional[QAPISourceInfo],
         )
 
     def visit_command(self, name: str, info: Optional[QAPISourceInfo],
-                      ifcond: Sequence[str],
+                      ifcond: QAPISchemaIfCond,
                       features: List[QAPISchemaFeature],
                       arg_type: Optional[QAPISchemaObjectType],
                       ret_type: Optional[QAPISchemaType], gen: bool,
@@ -367,7 +366,8 @@ def visit_command(self, name: str, info: Optional[QAPISourceInfo],
         self._gen_tree(name, 'command', obj, ifcond, features)
 
     def visit_event(self, name: str, info: Optional[QAPISourceInfo],
-                    ifcond: Sequence[str], features: List[QAPISchemaFeature],
+                    ifcond: QAPISchemaIfCond,
+                    features: List[QAPISchemaFeature],
                     arg_type: Optional[QAPISchemaObjectType],
                     boxed: bool) -> None:
         assert self._schema is not None
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index a4ce3972a4..e3beb24500 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -25,6 +25,11 @@
 from .parser import QAPISchemaParser
 
 
+class QAPISchemaIfCond:
+    def __init__(self, ifcond=None):
+        self.ifcond = ifcond or []
+
+
 class QAPISchemaEntity:
     meta: Optional[str] = None
 
@@ -42,7 +47,7 @@ def __init__(self, name: str, info, doc, ifcond=None, features=None):
         # such place).
         self.info = info
         self.doc = doc
-        self._ifcond = ifcond or []
+        self._ifcond = ifcond or QAPISchemaIfCond()
         self.features = features or []
         self._checked = False
 
@@ -593,7 +598,7 @@ def check(self, schema, seen):
                     self.info,
                     "discriminator member '%s' of %s must not be optional"
                     % (self._tag_name, base))
-            if self.tag_member.ifcond:
+            if self.tag_member.ifcond.ifcond:
                 raise QAPISemError(
                     self.info,
                     "discriminator member '%s' of %s must not be conditional"
@@ -601,7 +606,7 @@ def check(self, schema, seen):
         else:                   # simple union
             assert isinstance(self.tag_member.type, QAPISchemaEnumType)
             assert not self.tag_member.optional
-            assert self.tag_member.ifcond == []
+            assert self.tag_member.ifcond.ifcond == []
         if self._tag_name:    # flat union
             # branches that are not explicitly covered get an empty type
             cases = {v.name for v in self.variants}
@@ -646,7 +651,7 @@ def __init__(self, name, info, ifcond=None):
         assert isinstance(name, str)
         self.name = name
         self.info = info
-        self.ifcond = ifcond or []
+        self.ifcond = ifcond or QAPISchemaIfCond()
         self.defined_in = None
 
     def set_defined_in(self, name):
@@ -968,11 +973,13 @@ def _def_predefineds(self):
     def _make_features(self, features, info):
         if features is None:
             return []
-        return [QAPISchemaFeature(f['name'], info, f.get('if'))
+        return [QAPISchemaFeature(f['name'], info,
+                                  QAPISchemaIfCond(f.get('if')))
                 for f in features]
 
     def _make_enum_members(self, values, info):
-        return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
+        return [QAPISchemaEnumMember(v['name'], info,
+                                     QAPISchemaIfCond(v.get('if')))
                 for v in values]
 
     def _make_implicit_enum_type(self, name, info, ifcond, values):
@@ -1018,7 +1025,7 @@ def _def_enum_type(self, expr, info, doc):
         name = expr['enum']
         data = expr['data']
         prefix = expr.get('prefix')
-        ifcond = expr.get('if')
+        ifcond = QAPISchemaIfCond(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaEnumType(
             name, info, doc, ifcond, features,
@@ -1036,7 +1043,8 @@ def _make_member(self, name, typ, ifcond, features, info):
                                           self._make_features(features, info))
 
     def _make_members(self, data, info):
-        return [self._make_member(key, value['type'], value.get('if'),
+        return [self._make_member(key, value['type'],
+                                  QAPISchemaIfCond(value.get('if')),
                                   value.get('features'), info)
                 for (key, value) in data.items()]
 
@@ -1044,7 +1052,7 @@ def _def_struct_type(self, expr, info, doc):
         name = expr['struct']
         base = expr.get('base')
         data = expr['data']
-        ifcond = expr.get('if')
+        ifcond = QAPISchemaIfCond(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaObjectType(
             name, info, doc, ifcond, features, base,
@@ -1067,7 +1075,7 @@ def _def_union_type(self, expr, info, doc):
         name = expr['union']
         data = expr['data']
         base = expr.get('base')
-        ifcond = expr.get('if')
+        ifcond = QAPISchemaIfCond(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         tag_name = expr.get('discriminator')
         tag_member = None
@@ -1076,15 +1084,19 @@ def _def_union_type(self, expr, info, doc):
                 name, info, ifcond,
                 'base', self._make_members(base, info))
         if tag_name:
-            variants = [self._make_variant(key, value['type'],
-                                           value.get('if'), info)
-                        for (key, value) in data.items()]
+            variants = [
+                self._make_variant(key, value['type'],
+                                   QAPISchemaIfCond(value.get('if')),
+                                   info)
+                for (key, value) in data.items()]
             members = []
         else:
-            variants = [self._make_simple_variant(key, value['type'],
-                                                  value.get('if'), info)
-                        for (key, value) in data.items()]
-            enum = [{'name': v.name, 'if': v.ifcond} for v in variants]
+            variants = [
+                self._make_simple_variant(key, value['type'],
+                                          QAPISchemaIfCond(value.get('if')),
+                                          info)
+                for (key, value) in data.items()]
+            enum = [{'name': v.name, 'if': v.ifcond.ifcond} for v in variants]
             typ = self._make_implicit_enum_type(name, info, ifcond, enum)
             tag_member = QAPISchemaObjectTypeMember('type', info, typ, False)
             members = [tag_member]
@@ -1097,11 +1109,13 @@ def _def_union_type(self, expr, info, doc):
     def _def_alternate_type(self, expr, info, doc):
         name = expr['alternate']
         data = expr['data']
-        ifcond = expr.get('if')
+        ifcond = QAPISchemaIfCond(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
-        variants = [self._make_variant(key, value['type'], value.get('if'),
-                                       info)
-                    for (key, value) in data.items()]
+        variants = [
+            self._make_variant(key, value['type'],
+                               QAPISchemaIfCond(value.get('if')),
+                               info)
+            for (key, value) in data.items()]
         tag_member = QAPISchemaObjectTypeMember('type', info, 'QType', False)
         self._def_entity(
             QAPISchemaAlternateType(name, info, doc, ifcond, features,
@@ -1118,7 +1132,7 @@ def _def_command(self, expr, info, doc):
         allow_oob = expr.get('allow-oob', False)
         allow_preconfig = expr.get('allow-preconfig', False)
         coroutine = expr.get('coroutine', False)
-        ifcond = expr.get('if')
+        ifcond = QAPISchemaIfCond(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
             data = self._make_implicit_object_type(
@@ -1137,7 +1151,7 @@ def _def_event(self, expr, info, doc):
         name = expr['event']
         data = expr.get('data')
         boxed = expr.get('boxed', False)
-        ifcond = expr.get('if')
+        ifcond = QAPISchemaIfCond(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
             data = self._make_implicit_object_type(
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 20d572a23a..3673cf0f49 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -13,7 +13,7 @@
 # See the COPYING file in the top-level directory.
 """
 
-from typing import List, Optional, Sequence
+from typing import List, Optional
 
 from .common import (
     c_enum_const,
@@ -27,6 +27,7 @@
     QAPISchema,
     QAPISchemaEnumMember,
     QAPISchemaFeature,
+    QAPISchemaIfCond,
     QAPISchemaObjectType,
     QAPISchemaObjectTypeMember,
     QAPISchemaType,
@@ -50,13 +51,13 @@ def gen_enum_lookup(name: str,
 ''',
                 c_name=c_name(name))
     for memb in members:
-        ret += gen_if(memb.ifcond)
+        ret += gen_if(memb.ifcond.ifcond)
         index = c_enum_const(name, memb.name, prefix)
         ret += mcgen('''
         [%(index)s] = "%(name)s",
 ''',
                      index=index, name=memb.name)
-        ret += gen_endif(memb.ifcond)
+        ret += gen_endif(memb.ifcond.ifcond)
 
     ret += mcgen('''
     },
@@ -80,12 +81,12 @@ def gen_enum(name: str,
                 c_name=c_name(name))
 
     for memb in enum_members:
-        ret += gen_if(memb.ifcond)
+        ret += gen_if(memb.ifcond.ifcond)
         ret += mcgen('''
     %(c_enum)s,
 ''',
                      c_enum=c_enum_const(name, memb.name, prefix))
-        ret += gen_endif(memb.ifcond)
+        ret += gen_endif(memb.ifcond.ifcond)
 
     ret += mcgen('''
 } %(c_name)s;
@@ -125,7 +126,7 @@ def gen_array(name: str, element_type: QAPISchemaType) -> str:
 def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     ret = ''
     for memb in members:
-        ret += gen_if(memb.ifcond)
+        ret += gen_if(memb.ifcond.ifcond)
         if memb.optional:
             ret += mcgen('''
     bool has_%(c_name)s;
@@ -135,11 +136,11 @@ def gen_struct_members(members: List[QAPISchemaObjectTypeMember]) -> str:
     %(c_type)s %(c_name)s;
 ''',
                      c_type=memb.type.c_type(), c_name=c_name(memb.name))
-        ret += gen_endif(memb.ifcond)
+        ret += gen_endif(memb.ifcond.ifcond)
     return ret
 
 
-def gen_object(name: str, ifcond: Sequence[str],
+def gen_object(name: str, ifcond: QAPISchemaIfCond,
                base: Optional[QAPISchemaObjectType],
                members: List[QAPISchemaObjectTypeMember],
                variants: Optional[QAPISchemaVariants]) -> str:
@@ -158,7 +159,7 @@ def gen_object(name: str, ifcond: Sequence[str],
     ret += mcgen('''
 
 ''')
-    ret += gen_if(ifcond)
+    ret += gen_if(ifcond.ifcond)
     ret += mcgen('''
 struct %(c_name)s {
 ''',
@@ -192,7 +193,7 @@ def gen_object(name: str, ifcond: Sequence[str],
     ret += mcgen('''
 };
 ''')
-    ret += gen_endif(ifcond)
+    ret += gen_endif(ifcond.ifcond)
 
     return ret
 
@@ -219,13 +220,13 @@ def gen_variants(variants: QAPISchemaVariants) -> str:
     for var in variants.variants:
         if var.type.name == 'q_empty':
             continue
-        ret += gen_if(var.ifcond)
+        ret += gen_if(var.ifcond.ifcond)
         ret += mcgen('''
         %(c_type)s %(c_name)s;
 ''',
                      c_type=var.type.c_unboxed_type(),
                      c_name=c_name(var.name))
-        ret += gen_endif(var.ifcond)
+        ret += gen_endif(var.ifcond.ifcond)
 
     ret += mcgen('''
     } u;
@@ -307,7 +308,7 @@ def _gen_type_cleanup(self, name: str) -> None:
     def visit_enum_type(self,
                         name: str,
                         info: Optional[QAPISourceInfo],
-                        ifcond: Sequence[str],
+                        ifcond: QAPISchemaIfCond,
                         features: List[QAPISchemaFeature],
                         members: List[QAPISchemaEnumMember],
                         prefix: Optional[str]) -> None:
@@ -318,7 +319,7 @@ def visit_enum_type(self,
     def visit_array_type(self,
                          name: str,
                          info: Optional[QAPISourceInfo],
-                         ifcond: Sequence[str],
+                         ifcond: QAPISchemaIfCond,
                          element_type: QAPISchemaType) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.preamble_add(gen_fwd_object_or_array(name))
@@ -328,7 +329,7 @@ def visit_array_type(self,
     def visit_object_type(self,
                           name: str,
                           info: Optional[QAPISourceInfo],
-                          ifcond: Sequence[str],
+                          ifcond: QAPISchemaIfCond,
                           features: List[QAPISchemaFeature],
                           base: Optional[QAPISchemaObjectType],
                           members: List[QAPISchemaObjectTypeMember],
@@ -351,7 +352,7 @@ def visit_object_type(self,
     def visit_alternate_type(self,
                              name: str,
                              info: Optional[QAPISourceInfo],
-                             ifcond: Sequence[str],
+                             ifcond: QAPISchemaIfCond,
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
         with ifcontext(ifcond, self._genh):
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 9e96f3c566..67721b2470 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -13,7 +13,7 @@
 See the COPYING file in the top-level directory.
 """
 
-from typing import List, Optional, Sequence
+from typing import List, Optional
 
 from .common import (
     c_enum_const,
@@ -29,6 +29,7 @@
     QAPISchemaEnumMember,
     QAPISchemaEnumType,
     QAPISchemaFeature,
+    QAPISchemaIfCond,
     QAPISchemaObjectType,
     QAPISchemaObjectTypeMember,
     QAPISchemaType,
@@ -78,7 +79,7 @@ def gen_visit_object_members(name: str,
 
     for memb in members:
         deprecated = 'deprecated' in [f.name for f in memb.features]
-        ret += gen_if(memb.ifcond)
+        ret += gen_if(memb.ifcond.ifcond)
         if memb.optional:
             ret += mcgen('''
     if (visit_optional(v, "%(name)s", &obj->has_%(c_name)s)) {
@@ -111,7 +112,7 @@ def gen_visit_object_members(name: str,
             ret += mcgen('''
     }
 ''')
-        ret += gen_endif(memb.ifcond)
+        ret += gen_endif(memb.ifcond.ifcond)
 
     if variants:
         tag_member = variants.tag_member
@@ -125,7 +126,7 @@ def gen_visit_object_members(name: str,
         for var in variants.variants:
             case_str = c_enum_const(tag_member.type.name, var.name,
                                     tag_member.type.prefix)
-            ret += gen_if(var.ifcond)
+            ret += gen_if(var.ifcond.ifcond)
             if var.type.name == 'q_empty':
                 # valid variant and nothing to do
                 ret += mcgen('''
@@ -141,7 +142,7 @@ def gen_visit_object_members(name: str,
                              case=case_str,
                              c_type=var.type.c_name(), c_name=c_name(var.name))
 
-            ret += gen_endif(var.ifcond)
+            ret += gen_endif(var.ifcond.ifcond)
         ret += mcgen('''
     default:
         abort();
@@ -227,7 +228,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
                 c_name=c_name(name))
 
     for var in variants.variants:
-        ret += gen_if(var.ifcond)
+        ret += gen_if(var.ifcond.ifcond)
         ret += mcgen('''
     case %(case)s:
 ''',
@@ -253,7 +254,7 @@ def gen_visit_alternate(name: str, variants: QAPISchemaVariants) -> str:
         ret += mcgen('''
         break;
 ''')
-        ret += gen_endif(var.ifcond)
+        ret += gen_endif(var.ifcond.ifcond)
 
     ret += mcgen('''
     case QTYPE_NONE:
@@ -352,7 +353,7 @@ def _begin_user_module(self, name: str) -> None:
     def visit_enum_type(self,
                         name: str,
                         info: Optional[QAPISourceInfo],
-                        ifcond: Sequence[str],
+                        ifcond: QAPISchemaIfCond,
                         features: List[QAPISchemaFeature],
                         members: List[QAPISchemaEnumMember],
                         prefix: Optional[str]) -> None:
@@ -363,7 +364,7 @@ def visit_enum_type(self,
     def visit_array_type(self,
                          name: str,
                          info: Optional[QAPISourceInfo],
-                         ifcond: Sequence[str],
+                         ifcond: QAPISchemaIfCond,
                          element_type: QAPISchemaType) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_visit_decl(name))
@@ -372,7 +373,7 @@ def visit_array_type(self,
     def visit_object_type(self,
                           name: str,
                           info: Optional[QAPISourceInfo],
-                          ifcond: Sequence[str],
+                          ifcond: QAPISchemaIfCond,
                           features: List[QAPISchemaFeature],
                           base: Optional[QAPISchemaObjectType],
                           members: List[QAPISchemaObjectTypeMember],
@@ -394,7 +395,7 @@ def visit_object_type(self,
     def visit_alternate_type(self,
                              name: str,
                              info: Optional[QAPISourceInfo],
-                             ifcond: Sequence[str],
+                             ifcond: QAPISchemaIfCond,
                              features: List[QAPISchemaFeature],
                              variants: QAPISchemaVariants) -> None:
         with ifcontext(ifcond, self._genh, self._genc):
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index f1c4deb9a5..7907b4ac3a 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -94,8 +94,8 @@ def _print_variants(variants):
 
     @staticmethod
     def _print_if(ifcond, indent=4):
-        if ifcond:
-            print('%sif %s' % (' ' * indent, ifcond))
+        if ifcond.ifcond:
+            print('%sif %s' % (' ' * indent, ifcond.ifcond))
 
     @classmethod
     def _print_features(cls, features, indent=4):
-- 
2.31.1


