Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F126319253
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:34:56 +0100 (CET)
Received: from localhost ([::1]:51106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAGnn-0005fd-2U
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlW-0003ui-6R
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lAGlP-0002bQ-45
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613068346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhYvEMH/SAJ4MJUzbOU4SzXxmFGGzBYpl/nN8QMqUm8=;
 b=cRqxU1VaG1wYUmgQrY2+oaQHMX0bshE3SwBIKGJ567lnIJhgbDGrqzjEJ0gUBRTRHykaTQ
 2XS19V8orPiVVk+ZQ/1E+82PG9lUlz2aPVOxsChKWJxTWZy8Oq3XGtq7NlJ331xEJ6ZvOG
 TGGVEvvoivZ0aijQIIrnRSN/ZgRHvMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-WznuQlasMUm49-rkNmz_6g-1; Thu, 11 Feb 2021 13:32:21 -0500
X-MC-Unique: WznuQlasMUm49-rkNmz_6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 694C27BA3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 18:31:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-82.ams2.redhat.com [10.36.113.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C7935C8AA;
 Thu, 11 Feb 2021 18:31:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] qapi: Add support for aliases
Date: Thu, 11 Feb 2021 19:31:17 +0100
Message-Id: <20210211183118.422036-6-kwolf@redhat.com>
In-Reply-To: <20210211183118.422036-1-kwolf@redhat.com>
References: <20210211183118.422036-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce alias definitions for object types (structs and unions). This
allows using the same QAPI type and visitor for many syntax variations
that exist in the external representation, like between QMP and the
command line. It also provides a new tool for evolving the schema while
maintaining backwards compatibility during a deprecation period.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/devel/qapi-code-gen.txt           | 105 ++++++++++++++++++++++++-
 docs/sphinx/qapidoc.py                 |   2 +-
 scripts/qapi/expr.py                   |  36 ++++++++-
 scripts/qapi/schema.py                 |  30 +++++--
 scripts/qapi/types.py                  |   4 +-
 scripts/qapi/visit.py                  |  34 +++++++-
 tests/qapi-schema/test-qapi.py         |   7 +-
 tests/qapi-schema/double-type.err      |   2 +-
 tests/qapi-schema/unknown-expr-key.err |   2 +-
 9 files changed, 203 insertions(+), 19 deletions(-)

diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
index 6906a06ad2..247c4b8ef4 100644
--- a/docs/devel/qapi-code-gen.txt
+++ b/docs/devel/qapi-code-gen.txt
@@ -231,7 +231,8 @@ Syntax:
                'data': MEMBERS,
                '*base': STRING,
                '*if': COND,
-               '*features': FEATURES }
+               '*features': FEATURES,
+               '*aliases': ALIASES }
     MEMBERS = { MEMBER, ... }
     MEMBER = STRING : TYPE-REF
            | STRING : { 'type': TYPE-REF,
@@ -279,6 +280,9 @@ the schema" below for more on this.
 The optional 'features' member specifies features.  See "Features"
 below for more on this.
 
+The optional 'aliases' member specifies aliases.  See "Aliases" below
+for more on this.
+
 
 === Union types ===
 
@@ -286,13 +290,15 @@ Syntax:
     UNION = { 'union': STRING,
               'data': BRANCHES,
               '*if': COND,
-              '*features': FEATURES }
+              '*features': FEATURES,
+              '*aliases': ALIASES }
           | { 'union': STRING,
               'data': BRANCHES,
               'base': ( MEMBERS | STRING ),
               'discriminator': STRING,
               '*if': COND,
-              '*features': FEATURES }
+              '*features': FEATURES,
+              '*aliases': ALIASES }
     BRANCHES = { BRANCH, ... }
     BRANCH = STRING : TYPE-REF
            | STRING : { 'type': TYPE-REF, '*if': COND }
@@ -402,6 +408,9 @@ the schema" below for more on this.
 The optional 'features' member specifies features.  See "Features"
 below for more on this.
 
+The optional 'aliases' member specifies aliases.  See "Aliases" below
+for more on this.
+
 
 === Alternate types ===
 
@@ -837,6 +846,96 @@ shows a conditional entity only when the condition is satisfied in
 this particular build.
 
 
+=== Aliases ===
+
+Object types, including structs and unions, can contain alias
+definitions.
+
+Aliases define alternative member names that may be used in the
+external representation to provide a value for a member in the same
+object or in a nested object.
+
+Syntax:
+    ALIASES = [ ALIAS, ... ]
+    ALIAS = { '*name': STRING,
+              'source': [ STRING, ... ] }
+
+If 'name' is present, then the single member referred to by 'source'
+is made accessible with the name given in 'name' in the type where the
+alias definition is specified.
+
+If 'name' is not present, then all members in the object referred to
+by 'source' are made accessible in the type where the alias definition
+is specified with the same name as they have in 'source'.
+
+'source' is a non-empty list of member names representing the path to
+an object member. The first name is resolved in the same object.  Each
+subsequent member is resolved in the object named by the preceding
+member.
+
+Example: Alternative name for a member in the same object (the member
+"path" may be given through its alias "filename" in the external
+representation):
+
+{ 'struct': 'File',
+  'data': { 'path': 'str' },
+  'aliases': [ { 'name': 'filename', 'source': ['path'] } ] }
+
+Example: Alias for a member in a nested object:
+
+{ 'struct': 'A',
+  'data': { 'zahl': 'int' } }
+{ 'struct': 'B',
+  'data': { 'drei': 'A' } }
+{ 'struct': 'C',
+  'data': { 'zwei': 'B' } }
+{ 'struct': 'D',
+  'data': { 'eins': 'C' },
+  'aliases': [ { 'name': 'number',
+                 'source': ['eins', 'zwei', 'drei', 'zahl' ] },
+               { 'name': 'the_B',
+                 'source': ['eins','zwei'] } ] }
+
+With this definition, each of the following inputs mean the same:
+
+* { 'eins': { 'zwei': { 'drei': { 'zahl': 42 } } } }
+
+* { 'the_B': { 'drei': { 'zahl': 42 } } }
+
+* { 'number': 42 }
+
+Example: Flattening a union with a wildcard alias that maps all
+members of 'data' to the top level:
+
+{ 'union': 'SocketAddress',
+  'data': {
+    'inet': 'InetSocketAddress',
+    'unix': 'UnixSocketAddress' },
+  'aliases': [ { 'source': ['data'] } ] }
+
+Aliases are transitive: 'source' may refer to another alias name.  In
+this case, the alias is effectively an altenative name for the source
+of the other alias.
+
+Example: Giving "the_answer" on the top level provides a value for
+"zahl" in the nested object:
+
+{ 'struct': 'A',
+  'data': { 'zahl': 'int' },
+  'aliases': [ { 'name': 'number', 'source': ['zahl'] } ] }
+{ 'struct': 'B',
+  'data': { 'nested': 'A' },
+  'aliases': [ { 'name': 'the_answer',
+                 'source': ['nested', 'number'] } ] }
+
+In order to accommodate unions where variants differ in structure, it
+is allowed to use a path that doesn't necessarily match an existing
+member in every variant or even at all; in this case, the alias
+remains unused.  Note that the QAPI generator does not check whether
+there is at least one branch for which an alias could match.  If a
+source member is misspelt, the alias just won't work.
+
+
 === Documentation comments ===
 
 A multi-line comment that starts and ends with a '##' line is a
diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index e03abcbb95..6c94c01148 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -310,7 +310,7 @@ class QAPISchemaGenRSTVisitor(QAPISchemaVisitor):
                       + self._nodes_for_if_section(ifcond))
 
     def visit_object_type(self, name, info, ifcond, features,
-                          base, members, variants):
+                          base, members, variants, aliases):
         doc = self._cur_doc
         if base and base.is_implicit():
             base = None
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 2fcaaa2497..743e23ec85 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -198,6 +198,34 @@ def check_features(features, info):
         check_if(f, info, source)
 
 
+def check_aliases(aliases, info):
+    if aliases is None:
+        return
+    if not isinstance(aliases, list):
+        raise QAPISemError(info, "'aliases' must be an array")
+    for a in aliases:
+        if not isinstance(a, dict):
+            raise QAPISemError(info, "'aliases' members must be objects")
+        check_keys(a, info, "'aliases' member", ['source'], ['name'])
+
+        if 'name' in a:
+            source = "alias member 'name'"
+            check_name_is_str(a['name'], info, source)
+            check_name_str(a['name'], info, source)
+
+        if not isinstance(a['source'], list):
+            raise QAPISemError(info,
+                "alias member 'source' must be an array")
+        if not a['source']:
+            raise QAPISemError(info,
+                "alias member 'source' must not be empty")
+
+        source = "member of alias member 'source'"
+        for s in a['source']:
+            check_name_is_str(s, info, source)
+            check_name_str(s, info, source)
+
+
 def check_enum(expr, info):
     name = expr['enum']
     members = expr['data']
@@ -228,6 +256,7 @@ def check_struct(expr, info):
 
     check_type(members, info, "'data'", allow_dict=name)
     check_type(expr.get('base'), info, "'base'")
+    check_aliases(expr.get('aliases'), info)
 
 
 def check_union(expr, info):
@@ -245,6 +274,8 @@ def check_union(expr, info):
             raise QAPISemError(info, "'discriminator' requires 'base'")
         check_name_is_str(discriminator, info, "'discriminator'")
 
+    check_aliases(expr.get('aliases'), info)
+
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         check_name_str(key, info, source)
@@ -331,7 +362,7 @@ def check_exprs(exprs):
         elif meta == 'union':
             check_keys(expr, info, meta,
                        ['union', 'data'],
-                       ['base', 'discriminator', 'if', 'features'])
+                       ['base', 'discriminator', 'if', 'features', 'aliases'])
             normalize_members(expr.get('base'))
             normalize_members(expr['data'])
             check_union(expr, info)
@@ -342,7 +373,8 @@ def check_exprs(exprs):
             check_alternate(expr, info)
         elif meta == 'struct':
             check_keys(expr, info, meta,
-                       ['struct', 'data'], ['base', 'if', 'features'])
+                       ['struct', 'data'],
+                       ['base', 'if', 'features', 'aliases'])
             normalize_members(expr['data'])
             check_struct(expr, info)
         elif meta == 'command':
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 353e8020a2..14a2b0175b 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -118,7 +118,7 @@ class QAPISchemaVisitor:
         pass
 
     def visit_object_type(self, name, info, ifcond, features,
-                          base, members, variants):
+                          base, members, variants, aliases):
         pass
 
     def visit_object_type_flat(self, name, info, ifcond, features,
@@ -362,9 +362,19 @@ class QAPISchemaArrayType(QAPISchemaType):
         return "%s type ['%s']" % (self.meta, self._element_type_name)
 
 
+class QAPISchemaAlias:
+    def __init__(self, name, source):
+        assert name is None or isinstance(name, str)
+        assert source
+        for member in source:
+            assert isinstance(member, str)
+        self.name = name
+        self.source = source
+
+
 class QAPISchemaObjectType(QAPISchemaType):
     def __init__(self, name, info, doc, ifcond, features,
-                 base, local_members, variants):
+                 base, local_members, variants, aliases=None):
         # struct has local_members, optional base, and no variants
         # flat union has base, variants, and no local_members
         # simple union has local_members, variants, and no base
@@ -382,6 +392,7 @@ class QAPISchemaObjectType(QAPISchemaType):
         self.local_members = local_members
         self.variants = variants
         self.members = None
+        self.aliases = aliases or []
 
     def check(self, schema):
         # This calls another type T's .check() exactly when the C
@@ -474,7 +485,7 @@ class QAPISchemaObjectType(QAPISchemaType):
         super().visit(visitor)
         visitor.visit_object_type(
             self.name, self.info, self.ifcond, self.features,
-            self.base, self.local_members, self.variants)
+            self.base, self.local_members, self.variants, self.aliases)
         visitor.visit_object_type_flat(
             self.name, self.info, self.ifcond, self.features,
             self.members, self.variants)
@@ -964,6 +975,12 @@ class QAPISchema:
         return [QAPISchemaFeature(f['name'], info, f.get('if'))
                 for f in features]
 
+    def _make_aliases(self, aliases):
+        if aliases is None:
+            return []
+        return [QAPISchemaAlias(a.get('name'), a['source'])
+                for a in aliases]
+
     def _make_enum_members(self, values, info):
         return [QAPISchemaEnumMember(v['name'], info, v.get('if'))
                 for v in values]
@@ -1038,11 +1055,12 @@ class QAPISchema:
         base = expr.get('base')
         data = expr['data']
         ifcond = expr.get('if')
+        aliases = self._make_aliases(expr.get('aliases'))
         features = self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaObjectType(
             name, info, doc, ifcond, features, base,
             self._make_members(data, info),
-            None))
+            None, aliases))
 
     def _make_variant(self, case, typ, ifcond, info):
         return QAPISchemaVariant(case, info, typ, ifcond)
@@ -1061,6 +1079,7 @@ class QAPISchema:
         data = expr['data']
         base = expr.get('base')
         ifcond = expr.get('if')
+        aliases = self._make_aliases(expr.get('aliases'))
         features = self._make_features(expr.get('features'), info)
         tag_name = expr.get('discriminator')
         tag_member = None
@@ -1085,7 +1104,8 @@ class QAPISchema:
             QAPISchemaObjectType(name, info, doc, ifcond, features,
                                  base, members,
                                  QAPISchemaVariants(
-                                     tag_name, info, tag_member, variants)))
+                                     tag_name, info, tag_member, variants),
+                                 aliases))
 
     def _def_alternate_type(self, expr, info, doc):
         name = expr['alternate']
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 2bdd626847..c8306479f5 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -25,6 +25,7 @@ from .common import (
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import (
     QAPISchema,
+    QAPISchemaAlias,
     QAPISchemaEnumMember,
     QAPISchemaFeature,
     QAPISchemaObjectType,
@@ -332,7 +333,8 @@ class QAPISchemaGenTypeVisitor(QAPISchemaModularCVisitor):
                           features: List[QAPISchemaFeature],
                           base: Optional[QAPISchemaObjectType],
                           members: List[QAPISchemaObjectTypeMember],
-                          variants: Optional[QAPISchemaVariants]) -> None:
+                          variants: Optional[QAPISchemaVariants],
+                          aliases: List[QAPISchemaAlias]) -> None:
         # Nothing to do for the special empty builtin
         if name == 'q_empty':
             return
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index 22e62df901..e370485f6e 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -26,6 +26,7 @@ from .common import (
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import (
     QAPISchema,
+    QAPISchemaAlias,
     QAPISchemaEnumMember,
     QAPISchemaEnumType,
     QAPISchemaFeature,
@@ -60,7 +61,8 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp);
 def gen_visit_object_members(name: str,
                              base: Optional[QAPISchemaObjectType],
                              members: List[QAPISchemaObjectTypeMember],
-                             variants: Optional[QAPISchemaVariants]) -> str:
+                             variants: Optional[QAPISchemaVariants],
+                             aliases: List[QAPISchemaAlias]) -> str:
     ret = mcgen('''
 
 bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
@@ -68,6 +70,24 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
 ''',
                 c_name=c_name(name))
 
+    if aliases:
+        ret += mcgen('''
+    visit_start_alias_scope(v);
+''')
+
+    for a in aliases:
+        if a.name:
+            name = '"%s"' % a.name
+        else:
+            name = "NULL"
+
+        source = ", ".join('"%s"' % x for x in a.source)
+
+        ret += mcgen('''
+    visit_define_alias(v, %(name)s, (const char * []) { %(source)s, NULL });
+''',
+                     name=name, source=source)
+
     if base:
         ret += mcgen('''
     if (!visit_type_%(c_type)s_members(v, (%(c_type)s *)obj, errp)) {
@@ -133,6 +153,11 @@ bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
     }
 ''')
 
+    if aliases:
+        ret += mcgen('''
+    visit_end_alias_scope(v);
+''')
+
     ret += mcgen('''
     return true;
 }
@@ -361,14 +386,15 @@ class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisitor):
                           features: List[QAPISchemaFeature],
                           base: Optional[QAPISchemaObjectType],
                           members: List[QAPISchemaObjectTypeMember],
-                          variants: Optional[QAPISchemaVariants]) -> None:
+                          variants: Optional[QAPISchemaVariants],
+                          aliases: List[QAPISchemaAlias]) -> None:
         # Nothing to do for the special empty builtin
         if name == 'q_empty':
             return
         with ifcontext(ifcond, self._genh, self._genc):
             self._genh.add(gen_visit_members_decl(name))
-            self._genc.add(gen_visit_object_members(name, base,
-                                                    members, variants))
+            self._genc.add(gen_visit_object_members(
+                name, base, members, variants, aliases))
             # TODO Worth changing the visitor signature, so we could
             # directly use rather than repeat type.is_implicit()?
             if not name.startswith('q_'):
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index e8db9d09d9..1679d1b5da 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -47,7 +47,7 @@ class QAPISchemaTestVisitor(QAPISchemaVisitor):
         self._print_if(ifcond)
 
     def visit_object_type(self, name, info, ifcond, features,
-                          base, members, variants):
+                          base, members, variants, aliases):
         print('object %s' % name)
         if base:
             print('    base %s' % base.name)
@@ -56,6 +56,11 @@ class QAPISchemaTestVisitor(QAPISchemaVisitor):
                   % (m.name, m.type.name, m.optional))
             self._print_if(m.ifcond, 8)
             self._print_features(m.features, indent=8)
+        for a in aliases:
+            if a.name:
+                print('    alias %s -> %s' % (a.name, '.'.join(a.source)))
+            else:
+                print('    alias * -> %s.*' % '.'.join(a.source))
         self._print_variants(variants)
         self._print_if(ifcond)
         self._print_features(features)
diff --git a/tests/qapi-schema/double-type.err b/tests/qapi-schema/double-type.err
index 71fc4dbb52..5d25d7623c 100644
--- a/tests/qapi-schema/double-type.err
+++ b/tests/qapi-schema/double-type.err
@@ -1,3 +1,3 @@
 double-type.json: In struct 'bar':
 double-type.json:2: struct has unknown key 'command'
-Valid keys are 'base', 'data', 'features', 'if', 'struct'.
+Valid keys are 'aliases', 'base', 'data', 'features', 'if', 'struct'.
diff --git a/tests/qapi-schema/unknown-expr-key.err b/tests/qapi-schema/unknown-expr-key.err
index c5f395bf79..7429d1ff03 100644
--- a/tests/qapi-schema/unknown-expr-key.err
+++ b/tests/qapi-schema/unknown-expr-key.err
@@ -1,3 +1,3 @@
 unknown-expr-key.json: In struct 'bar':
 unknown-expr-key.json:2: struct has unknown keys 'bogus', 'phony'
-Valid keys are 'base', 'data', 'features', 'if', 'struct'.
+Valid keys are 'aliases', 'base', 'data', 'features', 'if', 'struct'.
-- 
2.29.2


