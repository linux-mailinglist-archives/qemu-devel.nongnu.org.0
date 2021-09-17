Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12FA40FDC8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:20:51 +0200 (CEST)
Received: from localhost ([::1]:45884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGba-0007Fu-4G
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUp-0007WW-1c
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mRGUm-00061k-Ax
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631895227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GhrSEgBgeRIUeXnS7H1Ohm84xb4b1c035lhEGLJZtiA=;
 b=iXNlI5hHgMORXhG1pA4uQroBqhmXWiX+VAtdaQJCdpEbWGFFSps4dp2vS3Af/7b+ZcK4oa
 8DCaYbLZGrFzPQylvm3tcUjlAFuP9xRoUuXouGnBlrcCjteHeG8Dda2Pwq+PFQN+n5UGpp
 tgcr/gf6tdtoO/MkoGA5eTKvkoHfubw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-OQx4SDVzPZ6yccDp0PlmVQ-1; Fri, 17 Sep 2021 12:13:41 -0400
X-MC-Unique: OQx4SDVzPZ6yccDp0PlmVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FC85835DEF
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 16:13:40 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3915960C2B;
 Fri, 17 Sep 2021 16:13:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/8] qapi: Add support for aliases
Date: Fri, 17 Sep 2021 18:13:19 +0200
Message-Id: <20210917161320.201086-8-kwolf@redhat.com>
In-Reply-To: <20210917161320.201086-1-kwolf@redhat.com>
References: <20210917161320.201086-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
 docs/devel/qapi-code-gen.rst           | 109 ++++++++++++++++++++++-
 docs/sphinx/qapidoc.py                 |   2 +-
 scripts/qapi/expr.py                   |  54 +++++++++++-
 scripts/qapi/schema.py                 | 115 +++++++++++++++++++++++--
 scripts/qapi/types.py                  |   4 +-
 scripts/qapi/visit.py                  |  34 +++++++-
 tests/qapi-schema/test-qapi.py         |   7 +-
 tests/qapi-schema/unknown-expr-key.err |   2 +-
 8 files changed, 308 insertions(+), 19 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index ced7a5ffe1..722a8e62f7 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -262,7 +262,8 @@ Syntax::
                'data': MEMBERS,
                '*base': STRING,
                '*if': COND,
-               '*features': FEATURES }
+               '*features': FEATURES,
+               '*aliases': ALIASES }
     MEMBERS = { MEMBER, ... }
     MEMBER = STRING : TYPE-REF
            | STRING : { 'type': TYPE-REF,
@@ -312,6 +313,9 @@ the schema`_ below for more on this.
 The optional 'features' member specifies features.  See Features_
 below for more on this.
 
+The optional 'aliases' member specifies aliases.  See Aliases_ below
+for more on this.
+
 
 Union types
 -----------
@@ -321,13 +325,15 @@ Syntax::
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
@@ -437,6 +443,9 @@ the schema`_ below for more on this.
 The optional 'features' member specifies features.  See Features_
 below for more on this.
 
+The optional 'aliases' member specifies aliases.  See Aliases_ below
+for more on this.
+
 
 Alternate types
 ---------------
@@ -894,6 +903,100 @@ shows a conditional entity only when the condition is satisfied in
 this particular build.
 
 
+Aliases
+-------
+
+Object types, including structs and unions, can contain alias
+definitions.
+
+Aliases define alternative member names that may be used in wire input
+to provide a value for a member in the same object or in a nested
+object.
+
+This allows using the same QAPI type and visitor even when the syntax
+has some variations between different external interfaces such as QMP
+and the command line.  Note that aliases are not visible in the schema
+introspection yet, which may make their use in QMP unpractical for now.
+
+Syntax::
+
+    ALIASES = [ ALIAS, ... ]
+    ALIAS = { '*name': STRING,
+              'source': [ STRING, ... ] }
+
+If ``name`` is present, then the single member referred to by ``source``
+is made accessible with the name given by ``name`` in the type where the
+alias definition is specified.
+
+If ``name`` is not present, then this is a wildcard alias and all
+members in the object referred to by ``source`` are made accessible in
+the type where the alias definition is specified with the same name as
+they have in ``source``.
+
+``source`` is a non-empty list of member names representing the path to
+an object member.  The first name is resolved in the same object.  Each
+subsequent member is resolved in the object named by the preceding
+member.  Optional objects may not be used in the path of a wildcard
+alias.
+
+Example: Alternative name for a member in the same object ::
+
+ { 'struct': 'File',
+   'data': { 'path': 'str' },
+   'aliases': [ { 'name': 'filename', 'source': ['path'] } ] }
+
+The member ``path`` may instead be given through its alias ``filename``
+in input.
+
+Example: Alias for a member in a nested object ::
+
+ { 'struct': 'A',
+   'data': { 'zahl': 'int' } }
+ { 'struct': 'B',
+   'data': { 'drei': 'A' } }
+ { 'struct': 'C',
+   'data': { 'zwei': 'B' } }
+ { 'struct': 'D',
+   'data': { 'eins': 'C' },
+   'aliases': [ { 'name': 'number',
+                  'source': ['eins', 'zwei', 'drei', 'zahl' ] },
+                { 'name': 'the_B',
+                  'source': ['eins','zwei'] } ] }
+
+With this definition, each of the following inputs for ``D`` mean the
+same::
+
+ { 'eins': { 'zwei': { 'drei': { 'zahl': 42 } } } }
+
+ { 'the_B': { 'drei': { 'zahl': 42 } } }
+
+ { 'number': 42 }
+
+Example: Flattening a simple union with a wildcard alias that maps all
+members of ``data`` to the top level ::
+
+ { 'union': 'SocketAddress',
+   'data': {
+     'inet': 'InetSocketAddress',
+     'unix': 'UnixSocketAddress' },
+   'aliases': [ { 'source': ['data'] } ] }
+
+Aliases are transitive: ``source`` may refer to another alias name.  In
+this case, the alias is effectively an alternative name for the source
+of the other alias.
+
+In order to accommodate unions where variants differ in structure, it
+is allowed to use a path that doesn't necessarily match an existing
+member in every variant; in this case, the alias remains unused.  The
+QAPI generator checks that there is at least one branch for which an
+alias could match.
+
+Wildcard aliases can lead to situations where the same name could either
+refer to a member of a nested object (through the wildcard alias) or to
+a local member.  In this case, the wildcard alias can't be used to
+specify a value for the member of the nested object.
+
+
 Documentation comments
 ----------------------
 
diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index d791b59492..18bf6cf4b8 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -315,7 +315,7 @@ def visit_enum_type(self, name, info, ifcond, features, members, prefix):
                       + self._nodes_for_if_section(ifcond))
 
     def visit_object_type(self, name, info, ifcond, features,
-                          base, members, variants):
+                          base, members, variants, aliases):
         doc = self._cur_doc
         if base and base.is_implicit():
             base = None
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 90bde501b0..a9dfa9252e 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -447,6 +447,51 @@ def check_features(features: Optional[object],
         check_if(feat, info, source)
 
 
+def check_aliases(aliases: Optional[object],
+                  info: QAPISourceInfo) -> None:
+    """
+    Normalize and validate the ``aliases`` member.
+
+    :param aliases: The aliases member value to validate.
+    :param info: QAPI schema source file information.
+
+    :raise QAPISemError: When ``aliases`` fails validation.
+    :return: None, ``aliases`` is normalized in-place as needed.
+    """
+
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
+
+            permissive = a['name'] in info.pragma.member_name_exceptions
+            check_name_lower(a['name'], info, source,
+                             permit_upper=permissive,
+                             permit_underscore=permissive)
+            desc = "alias '%s'" % a['name']
+        else:
+            desc = "wildcard alias"
+
+        if not isinstance(a['source'], list):
+            raise QAPISemError(
+                info, f"{desc} member 'source' must be an array")
+        if not a['source']:
+            raise QAPISemError(
+                info, f"{desc} member 'source' must not be empty")
+
+        source = f"element in {desc} member 'source'"
+        for s in a['source']:
+            check_name_is_str(s, info, source)
+
+
 def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
     """
     Normalize and validate this expression as an ``enum`` definition.
@@ -500,6 +545,7 @@ def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
     check_type(members, info, "'data'", allow_dict=name)
     check_type(expr.get('base'), info, "'base'")
+    check_aliases(expr.get('aliases'), info)
 
 
 def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
@@ -526,6 +572,8 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
             raise QAPISemError(info, "'discriminator' requires 'base'")
         check_name_is_str(discriminator, info, "'discriminator'")
 
+    check_aliases(expr.get('aliases'), info)
+
     if not isinstance(members, dict):
         raise QAPISemError(info, "'data' must be an object")
 
@@ -665,7 +713,8 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
         elif meta == 'union':
             check_keys(expr, info, meta,
                        ['union', 'data'],
-                       ['base', 'discriminator', 'if', 'features'])
+                       ['base', 'discriminator', 'if', 'features',
+                        'aliases'])
             normalize_members(expr.get('base'))
             normalize_members(expr['data'])
             check_union(expr, info)
@@ -676,7 +725,8 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
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
index 87f80f8de2..611ea14f72 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -145,7 +145,7 @@ def visit_array_type(self, name, info, ifcond, element_type):
         pass
 
     def visit_object_type(self, name, info, ifcond, features,
-                          base, members, variants):
+                          base, members, variants, aliases):
         pass
 
     def visit_object_type_flat(self, name, info, ifcond, features,
@@ -391,7 +391,7 @@ def describe(self):
 
 class QAPISchemaObjectType(QAPISchemaType):
     def __init__(self, name, info, doc, ifcond, features,
-                 base, local_members, variants):
+                 base, local_members, variants, aliases=None):
         # struct has local_members, optional base, and no variants
         # flat union has base, variants, and no local_members
         # simple union has local_members, variants, and no base
@@ -409,6 +409,9 @@ def __init__(self, name, info, doc, ifcond, features,
         self.local_members = local_members
         self.variants = variants
         self.members = None
+        self.aliases = aliases or []
+        for a in self.aliases:
+            a.set_defined_in(name)
 
     def check(self, schema):
         # This calls another type T's .check() exactly when the C
@@ -440,12 +443,18 @@ def check(self, schema):
         for m in self.local_members:
             m.check(schema)
             m.check_clash(self.info, seen)
+
+        # Make a copy before aliases are added to @seen
         members = list(seen.values())
 
         if self.variants:
             self.variants.check(schema, seen)
             self.variants.check_clash(self.info, seen)
 
+        for a in self.aliases:
+            a.check_clash(self.info, seen)
+            self.check_path(a, a.source, members)
+
         self.members = members  # mark completed
 
     # Check that the members of this type do not cause duplicate JSON members,
@@ -457,6 +466,68 @@ def check_clash(self, info, seen):
         for m in self.members:
             m.check_clash(info, seen)
 
+    def check_path(self, alias, path, members=None, local_aliases_seen=()):
+        assert isinstance(path, list)
+
+        if not path:
+            return
+
+        for a in self.aliases:
+            if a.name == path[0]:
+                if a in local_aliases_seen:
+                    raise QAPISemError(
+                        self.info,
+                        "%s resolving to '%s' makes '%s' an alias for itself"
+                        % (a.describe(self.info), a.source[0], a.source[0]))
+
+                self.check_path(alias, a.source + path[1:], members,
+                                (*local_aliases_seen, a))
+                return
+
+        if members is None:
+            assert self.members is not None
+            members = self.members
+        else:
+            assert isinstance(members, list)
+
+        for m in members:
+            if m.name == path[0]:
+                # Wildcard aliases can only accept object types in the whole
+                # path; for single-member aliases, the last element can be
+                # any type
+                nested_path = path[1:]
+                need_obj = (alias.name is None) or nested_path
+                if need_obj and not isinstance(m.type, QAPISchemaObjectType):
+                    raise QAPISemError(
+                        self.info,
+                        "%s has non-object '%s' in its source path"
+                        % (alias.describe(self.info), m.name))
+                if alias.name is None and m.optional:
+                    raise QAPISemError(
+                        self.info,
+                        "%s has optional object %s in its source path"
+                        % (alias.describe(self.info), m.describe(self.info)))
+                if nested_path:
+                    m.type.check_path(alias, nested_path)
+                return
+
+        # It is sufficient that the path is valid in at least one variant
+        if self.variants:
+            for v in self.variants.variants:
+                try:
+                    v.type.check_path(alias, path)
+                    return
+                except QAPISemError:
+                    pass
+            raise QAPISemError(
+                self.info,
+                "%s has a source path that does not exist in any variant of %s"
+                % (alias.describe(self.info), self.describe()))
+
+        raise QAPISemError(
+            self.info,
+            "%s has inexistent source" % alias.describe(self.info))
+
     def connect_doc(self, doc=None):
         super().connect_doc(doc)
         doc = doc or self.doc
@@ -501,7 +572,7 @@ def visit(self, visitor):
         super().visit(visitor)
         visitor.visit_object_type(
             self.name, self.info, self.ifcond, self.features,
-            self.base, self.local_members, self.variants)
+            self.base, self.local_members, self.variants, self.aliases)
         visitor.visit_object_type_flat(
             self.name, self.info, self.ifcond, self.features,
             self.members, self.variants)
@@ -666,7 +737,7 @@ def check_clash(self, info, seen):
 
 
 class QAPISchemaMember:
-    """ Represents object members, enum members and features """
+    """ Represents object members, enum members, features and aliases """
     role = 'member'
 
     def __init__(self, name, info, ifcond=None):
@@ -732,6 +803,29 @@ class QAPISchemaFeature(QAPISchemaMember):
     role = 'feature'
 
 
+class QAPISchemaAlias(QAPISchemaMember):
+    role = 'alias'
+
+    def __init__(self, name, info, source):
+        assert name is None or isinstance(name, str)
+        assert source
+        for member in source:
+            assert isinstance(member, str)
+
+        super().__init__(name or '*', info)
+        self.name = name
+        self.source = source
+
+    def check_clash(self, info, seen):
+        if self.name:
+            super().check_clash(info, seen)
+
+    def describe(self, info):
+        if not self.name:
+            return "wildcard alias"
+        return super().describe(info)
+
+
 class QAPISchemaObjectTypeMember(QAPISchemaMember):
     def __init__(self, name, info, typ, optional, ifcond=None, features=None):
         super().__init__(name, info, ifcond)
@@ -999,6 +1093,12 @@ def _make_features(self, features, info):
                                   QAPISchemaIfCond(f.get('if')))
                 for f in features]
 
+    def _make_aliases(self, aliases, info):
+        if aliases is None:
+            return []
+        return [QAPISchemaAlias(a.get('name'), info, a['source'])
+                for a in aliases]
+
     def _make_enum_members(self, values, info):
         return [QAPISchemaEnumMember(v['name'], info,
                                      QAPISchemaIfCond(v.get('if')))
@@ -1075,11 +1175,12 @@ def _def_struct_type(self, expr, info, doc):
         base = expr.get('base')
         data = expr['data']
         ifcond = QAPISchemaIfCond(expr.get('if'))
+        aliases = self._make_aliases(expr.get('aliases'), info)
         features = self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaObjectType(
             name, info, doc, ifcond, features, base,
             self._make_members(data, info),
-            None))
+            None, aliases))
 
     def _make_variant(self, case, typ, ifcond, info):
         return QAPISchemaVariant(case, info, typ, ifcond)
@@ -1098,6 +1199,7 @@ def _def_union_type(self, expr, info, doc):
         data = expr['data']
         base = expr.get('base')
         ifcond = QAPISchemaIfCond(expr.get('if'))
+        aliases = self._make_aliases(expr.get('aliases'), info)
         features = self._make_features(expr.get('features'), info)
         tag_name = expr.get('discriminator')
         tag_member = None
@@ -1126,7 +1228,8 @@ def _def_union_type(self, expr, info, doc):
             QAPISchemaObjectType(name, info, doc, ifcond, features,
                                  base, members,
                                  QAPISchemaVariants(
-                                     tag_name, info, tag_member, variants)))
+                                     tag_name, info, tag_member, variants),
+                                 aliases))
 
     def _def_alternate_type(self, expr, info, doc):
         name = expr['alternate']
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 831294fe42..e8bf097eb9 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -19,6 +19,7 @@
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import (
     QAPISchema,
+    QAPISchemaAlias,
     QAPISchemaEnumMember,
     QAPISchemaFeature,
     QAPISchemaIfCond,
@@ -327,7 +328,8 @@ def visit_object_type(self,
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
index 9d9196a143..679758fead 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -24,6 +24,7 @@
 from .gen import QAPISchemaModularCVisitor, ifcontext
 from .schema import (
     QAPISchema,
+    QAPISchemaAlias,
     QAPISchemaEnumMember,
     QAPISchemaEnumType,
     QAPISchemaFeature,
@@ -59,7 +60,8 @@ def gen_visit_members_decl(name: str) -> str:
 def gen_visit_object_members(name: str,
                              base: Optional[QAPISchemaObjectType],
                              members: List[QAPISchemaObjectTypeMember],
-                             variants: Optional[QAPISchemaVariants]) -> str:
+                             variants: Optional[QAPISchemaVariants],
+                             aliases: List[QAPISchemaAlias]) -> str:
     ret = mcgen('''
 
 bool visit_type_%(c_name)s_members(Visitor *v, %(c_name)s *obj, Error **errp)
@@ -67,6 +69,24 @@ def gen_visit_object_members(name: str,
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
+        source = ", ".join('"%s"' % element for element in a.source)
+
+        ret += mcgen('''
+    visit_define_alias(v, %(name)s, (const char * []) { %(source)s, NULL });
+''',
+                     name=name, source=source)
+
     if base:
         ret += mcgen('''
     if (!visit_type_%(c_type)s_members(v, (%(c_type)s *)obj, errp)) {
@@ -147,6 +167,11 @@ def gen_visit_object_members(name: str,
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
@@ -375,14 +400,15 @@ def visit_object_type(self,
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
index 73cffae2b6..c3d92fd51f 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -47,7 +47,7 @@ def visit_array_type(self, name, info, ifcond, element_type):
         self._print_if(ifcond)
 
     def visit_object_type(self, name, info, ifcond, features,
-                          base, members, variants):
+                          base, members, variants, aliases):
         print('object %s' % name)
         if base:
             print('    base %s' % base.name)
@@ -56,6 +56,11 @@ def visit_object_type(self, name, info, ifcond, features,
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
diff --git a/tests/qapi-schema/unknown-expr-key.err b/tests/qapi-schema/unknown-expr-key.err
index f2538e3ce7..354916968f 100644
--- a/tests/qapi-schema/unknown-expr-key.err
+++ b/tests/qapi-schema/unknown-expr-key.err
@@ -1,3 +1,3 @@
 unknown-expr-key.json: In struct 'Bar':
 unknown-expr-key.json:2: struct has unknown keys 'bogus', 'phony'
-Valid keys are 'base', 'data', 'features', 'if', 'struct'.
+Valid keys are 'aliases', 'base', 'data', 'features', 'if', 'struct'.
-- 
2.31.1


