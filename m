Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E741E408D34
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:23:17 +0200 (CEST)
Received: from localhost ([::1]:51570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlvZ-0002bz-2J
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFd-0000Ul-ER
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFZ-0000nn-6h
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DGVBPxlJ6W6fvASUA0bPYFglyidwC/oGDvEWPmWw8W0=;
 b=Sq4jSWxPpncU+5BOuWcEXLXmkARl4FbbBFwoda34j5OS7Q3VOErkUymK2ELC7NvssalWuR
 EpPQ286/SI0DKqJBRiXxLBawDg1vlMJh/6bR/btKHn/3dbzUUeJjQ/r3HajmNmIB48NU9S
 NdGAFamDblGwUQU0HsHnSBQzUdETrMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-n3euxnI2PjSCx94TdXFzoA-1; Mon, 13 Sep 2021 08:39:45 -0400
X-MC-Unique: n3euxnI2PjSCx94TdXFzoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B15780196C
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:39:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFDBE16A31;
 Mon, 13 Sep 2021 12:39:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 53B0811380D5; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/22] qapi: Drop simple unions
Date: Mon, 13 Sep 2021 14:39:31 +0200
Message-Id: <20210913123932.3306639-22-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: jsnow@redhat.com, eblake@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

The previous commits eliminated simple union from the tree.  Now drop
them from the QAPI schema language entirely, and update mentions of
"flat union" to just "union".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst                  | 125 ++++--------------
 scripts/qapi/expr.py                          |  21 +--
 scripts/qapi/schema.py                        | 101 +++-----------
 .../qapi-schema/flat-union-array-branch.json  |   2 +-
 tests/qapi-schema/flat-union-empty.json       |   2 +-
 tests/qapi-schema/flat-union-int-branch.json  |   2 +-
 tests/qapi-schema/flat-union-no-base.err      |   2 +-
 tests/qapi-schema/flat-union-no-base.json     |   2 +-
 tests/qapi-schema/qapi-schema-test.json       |   2 +-
 tests/qapi-schema/reserved-member-u.json      |   2 +-
 tests/qapi-schema/union-base-empty.json       |   2 +-
 .../union-base-no-discriminator.err           |   2 +-
 .../union-base-no-discriminator.json          |   2 +-
 13 files changed, 62 insertions(+), 205 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index b154eae82e..b2569de486 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -319,13 +319,9 @@ Union types
 Syntax::
 
     UNION = { 'union': STRING,
-              'data': BRANCHES,
-              '*if': COND,
-              '*features': FEATURES }
-          | { 'union': STRING,
-              'data': BRANCHES,
               'base': ( MEMBERS | STRING ),
               'discriminator': STRING,
+              'data': BRANCHES,
               '*if': COND,
               '*features': FEATURES }
     BRANCHES = { BRANCH, ... }
@@ -334,63 +330,30 @@ Syntax::
 
 Member 'union' names the union type.
 
-There are two flavors of union types: simple (no discriminator or
-base), and flat (both discriminator and base).
-
-Each BRANCH of the 'data' object defines a branch of the union.  A
-union must have at least one branch.
-
-The BRANCH's STRING name is the branch name.
-
-The BRANCH's value defines the branch's properties, in particular its
-type.  The form TYPE-REF_ is shorthand for :code:`{ 'type': TYPE-REF }`.
-
-A simple union type defines a mapping from automatic discriminator
-values to data types like in this example::
-
- { 'struct': 'BlockdevOptionsFile', 'data': { 'filename': 'str' } }
- { 'struct': 'BlockdevOptionsQcow2',
-   'data': { 'backing': 'str', '*lazy-refcounts': 'bool' } }
-
- { 'union': 'BlockdevOptionsSimple',
-   'data': { 'file': 'BlockdevOptionsFile',
-             'qcow2': 'BlockdevOptionsQcow2' } }
-
-In the Client JSON Protocol, a simple union is represented by an
-object that contains the 'type' member as a discriminator, and a
-'data' member that is of the specified data type corresponding to the
-discriminator value, as in these examples::
-
- { "type": "file", "data": { "filename": "/some/place/my-image" } }
- { "type": "qcow2", "data": { "backing": "/some/place/my-image",
-                              "lazy-refcounts": true } }
-
-The generated C code uses a struct containing a union.  Additionally,
-an implicit C enum 'NameKind' is created, corresponding to the union
-'Name', for accessing the various branches of the union.  The value
-for each branch can be of any type.
-
-Flat unions permit arbitrary common members that occur in all variants
-of the union, not just a discriminator.  Their discriminators need not
-be named 'type'.  They also avoid nesting on the wire.
-
 The 'base' member defines the common members.  If it is a MEMBERS_
 object, it defines common members just like a struct type's 'data'
 member defines struct type members.  If it is a STRING, it names a
 struct type whose members are the common members.
 
-All flat union branches must be `Struct types`_.
+Member 'discriminator' must name a non-optional enum-typed member of
+the base struct.  That member's value selects a branch by its name.
+If no such branch exists, an empty branch is assumed.
 
-In the Client JSON Protocol, a flat union is represented by an object
-with the common members (from the base type) and the selected branch's
-members.  The two sets of member names must be disjoint.  Member
-'discriminator' must name a non-optional enum-typed member of the base
-struct.
+Each BRANCH of the 'data' object defines a branch of the union.  A
+union must have at least one branch.
 
-The following example enhances the above simple union example by
-adding an optional common member 'read-only', renaming the
-discriminator to something more applicable than the simple union's
-default of 'type', and reducing the number of ``{}`` required on the wire::
+The BRANCH's STRING name is the branch name.  It must be a value of
+the discriminator enum type.
+
+The BRANCH's value defines the branch's properties, in particular its
+type.  The type must a struct type.  The form TYPE-REF_ is shorthand
+for :code:`{ 'type': TYPE-REF }`.
+
+In the Client JSON Protocol, a union is represented by an object with
+the common members (from the base type) and the selected branch's
+members.  The two sets of member names must be disjoint.
+
+Example::
 
  { 'enum': 'BlockdevDriver', 'data': [ 'file', 'qcow2' ] }
  { 'union': 'BlockdevOptions',
@@ -406,30 +369,11 @@ Resulting in these JSON objects::
  { "driver": "qcow2", "read-only": false,
    "backing": "/some/place/my-image", "lazy-refcounts": true }
 
-Notice that in a flat union, the discriminator name is controlled by
-the user, but because it must map to a base member with enum type, the
-code generator ensures that branches match the existing values of the
-enum.  The order of branches need not match the order of the enum
-values.  The branches need not cover all possible enum values.
-Omitted enum values are still valid branches that add no additional
-members to the data type.  In the resulting generated C data types, a
-flat union is represented as a struct with the base members in QAPI
-schema order, and then a union of structures for each branch of the
-struct.
-
-A simple union can always be re-written as a flat union where the base
-class has a single member named 'type', and where each branch of the
-union has a struct with a single member named 'data'.  That is, ::
-
- { 'union': 'Simple', 'data': { 'one': 'str', 'two': 'int' } }
-
-is identical on the wire to::
-
- { 'enum': 'Enum', 'data': ['one', 'two'] }
- { 'struct': 'Branch1', 'data': { 'data': 'str' } }
- { 'struct': 'Branch2', 'data': { 'data': 'int' } }
- { 'union': 'Flat', 'base': { 'type': 'Enum' }, 'discriminator': 'type',
-   'data': { 'one': 'Branch1', 'two': 'Branch2' } }
+The order of branches need not match the order of the enum values.
+The branches need not cover all possible enum values.  In the
+resulting generated C data types, a union is represented as a struct
+with the base members in QAPI schema order, and then a union of
+structures for each branch of the struct.
 
 The optional 'if' member specifies a conditional.  See `Configuring
 the schema`_ below for more on this.
@@ -1246,7 +1190,7 @@ that provides the variant members for this type tag value).  The
 "variants" array is in no particular order, and is not guaranteed to
 list cases in the same order as the corresponding "tag" enum type.
 
-Example: the SchemaInfo for flat union BlockdevOptions from section
+Example: the SchemaInfo for union BlockdevOptions from section
 `Union types`_ ::
 
     { "name": "BlockdevOptions", "meta-type": "object",
@@ -1261,27 +1205,6 @@ Example: the SchemaInfo for flat union BlockdevOptions from section
 Note that base types are "flattened": its members are included in the
 "members" array.
 
-A simple union implicitly defines an enumeration type for its implicit
-discriminator (called "type" on the wire, see section `Union types`_).
-
-A simple union implicitly defines an object type for each of its
-variants.
-
-Example: the SchemaInfo for simple union BlockdevOptionsSimple from section
-`Union types`_ ::
-
-    { "name": "BlockdevOptionsSimple", "meta-type": "object",
-      "members": [
-          { "name": "type", "type": "BlockdevOptionsSimpleKind" } ],
-      "tag": "type",
-      "variants": [
-          { "case": "file", "type": "q_obj-BlockdevOptionsFile-wrapper" },
-          { "case": "qcow2", "type": "q_obj-BlockdevOptionsQcow2-wrapper" } ] }
-
-    Enumeration type "BlockdevOptionsSimpleKind" and the object types
-    "q_obj-BlockdevOptionsFile-wrapper", "q_obj-BlockdevOptionsQcow2-wrapper"
-    are implicitly defined.
-
 The SchemaInfo for an alternate type has meta-type "alternate", and
 variant member "members".  "members" is a JSON array.  Each element is
 a JSON object with member "type", which names a type.  Values of the
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 91959ee79a..819ea6ad97 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -513,27 +513,18 @@ def check_union(expr: _JSONObject, info: QAPISourceInfo) -> None:
     :return: None, ``expr`` is normalized in-place as needed.
     """
     name = cast(str, expr['union'])  # Checked in check_exprs
-    base = expr.get('base')
-    discriminator = expr.get('discriminator')
+    base = expr['base']
+    discriminator = expr['discriminator']
     members = expr['data']
 
-    if discriminator is None:   # simple union
-        if base is not None:
-            raise QAPISemError(info, "'base' requires 'discriminator'")
-    else:                       # flat union
-        check_type(base, info, "'base'", allow_dict=name)
-        if not base:
-            raise QAPISemError(info, "'discriminator' requires 'base'")
-        check_name_is_str(discriminator, info, "'discriminator'")
+    check_type(base, info, "'base'", allow_dict=name)
+    check_name_is_str(discriminator, info, "'discriminator'")
 
     if not isinstance(members, dict):
         raise QAPISemError(info, "'data' must be an object")
 
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
-        if discriminator is None:
-            check_name_lower(key, info, source)
-        # else: name is in discriminator enum, which gets checked
         check_keys(value, info, source, ['type'], ['if'])
         check_if(value, info, source)
         check_type(value['type'], info, source, allow_array=not base)
@@ -664,8 +655,8 @@ def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
             check_enum(expr, info)
         elif meta == 'union':
             check_keys(expr, info, meta,
-                       ['union', 'data'],
-                       ['base', 'discriminator', 'if', 'features'])
+                       ['union', 'base', 'discriminator', 'data'],
+                       ['if', 'features'])
             normalize_members(expr.get('base'))
             normalize_members(expr['data'])
             check_union(expr, info)
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 3d72c7dfc9..004d7095ff 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -321,8 +321,8 @@ def connect_doc(self, doc=None):
             m.connect_doc(doc)
 
     def is_implicit(self):
-        # See QAPISchema._make_implicit_enum_type() and ._def_predefineds()
-        return self.name.endswith('Kind') or self.name == 'QType'
+        # See QAPISchema._def_predefineds()
+        return self.name == 'QType'
 
     def c_type(self):
         return c_name(self.name)
@@ -393,8 +393,7 @@ class QAPISchemaObjectType(QAPISchemaType):
     def __init__(self, name, info, doc, ifcond, features,
                  base, local_members, variants):
         # struct has local_members, optional base, and no variants
-        # flat union has base, variants, and no local_members
-        # simple union has local_members, variants, and no base
+        # union has base, variants, and no local_members
         super().__init__(name, info, doc, ifcond, features)
         self.meta = 'union' if variants else 'struct'
         assert base is None or isinstance(base, str)
@@ -465,15 +464,6 @@ def connect_doc(self, doc=None):
         for m in self.local_members:
             m.connect_doc(doc)
 
-    @property
-    def ifcond(self):
-        assert self._checked
-        if isinstance(self._ifcond, QAPISchemaType):
-            # Simple union wrapper type inherits from wrapped type;
-            # see _make_implicit_object_type()
-            return self._ifcond.ifcond
-        return self._ifcond
-
     def is_implicit(self):
         # See QAPISchema._make_implicit_object_type(), as well as
         # _def_predefineds()
@@ -576,10 +566,9 @@ def visit(self, visitor):
 
 class QAPISchemaVariants:
     def __init__(self, tag_name, info, tag_member, variants):
-        # Flat unions pass tag_name but not tag_member.
-        # Simple unions and alternates pass tag_member but not tag_name.
-        # After check(), tag_member is always set, and tag_name remains
-        # a reliable witness of being used by a flat union.
+        # Unions pass tag_name but not tag_member.
+        # Alternates pass tag_member but not tag_name.
+        # After check(), tag_member is always set.
         assert bool(tag_member) != bool(tag_name)
         assert (isinstance(tag_name, str) or
                 isinstance(tag_member, QAPISchemaObjectTypeMember))
@@ -595,7 +584,7 @@ def set_defined_in(self, name):
             v.set_defined_in(name)
 
     def check(self, schema, seen):
-        if not self.tag_member:  # flat union
+        if self._tag_name:      # union
             self.tag_member = seen.get(c_name(self._tag_name))
             base = "'base'"
             # Pointing to the base type when not implicit would be
@@ -625,11 +614,11 @@ def check(self, schema, seen):
                     self.info,
                     "discriminator member '%s' of %s must not be conditional"
                     % (self._tag_name, base))
-        else:                   # simple union
+        else:                   # alternate
             assert isinstance(self.tag_member.type, QAPISchemaEnumType)
             assert not self.tag_member.optional
             assert not self.tag_member.ifcond.is_present()
-        if self._tag_name:    # flat union
+        if self._tag_name:      # union
             # branches that are not explicitly covered get an empty type
             cases = {v.name for v in self.variants}
             for m in self.tag_member.type.members:
@@ -707,18 +696,10 @@ def describe(self, info):
                 assert role == 'member'
                 role = 'parameter'
             elif defined_in.endswith('-base'):
-                # Implicit type created for a flat union's dict 'base'
+                # Implicit type created for a union's dict 'base'
                 role = 'base ' + role
             else:
-                # Implicit type created for a simple union's branch
-                assert defined_in.endswith('-wrapper')
-                # Unreachable and not implemented
                 assert False
-        elif defined_in.endswith('Kind'):
-            # See QAPISchema._make_implicit_enum_type()
-            # Implicit enum created for simple union's branches
-            assert role == 'value'
-            role = 'branch'
         elif defined_in != info.defn_name:
             return "%s '%s' of type '%s'" % (role, self.name, defined_in)
         return "%s '%s'" % (role, self.name)
@@ -1004,15 +985,6 @@ def _make_enum_members(self, values, info):
                                      QAPISchemaIfCond(v.get('if')))
                 for v in values]
 
-    def _make_implicit_enum_type(self, name, info, ifcond, values):
-        # See also QAPISchemaObjectTypeMember.describe()
-        name = name + 'Kind'    # reserved by check_defn_name_str()
-        self._def_entity(QAPISchemaEnumType(
-            name, info, None, ifcond, None,
-            self._make_enum_members(values, info),
-            None))
-        return name
-
     def _make_array_type(self, element_type, info):
         name = element_type + 'List'    # reserved by check_defn_name_str()
         if not self.lookup_type(name):
@@ -1026,17 +998,9 @@ def _make_implicit_object_type(self, name, info, ifcond, role, members):
         name = 'q_obj_%s-%s' % (name, role)
         typ = self.lookup_entity(name, QAPISchemaObjectType)
         if typ:
-            # The implicit object type has multiple users.  This is
-            # either a duplicate definition (which will be flagged
-            # later), or an implicit wrapper type used for multiple
-            # simple unions.  In the latter case, ifcond should be the
-            # disjunction of its user's ifconds.  Not implemented.
-            # Instead, we always pass the wrapped type's ifcond, which
-            # is trivially the same for all users.  It's also
-            # necessary for the wrapper to compile.  But it's not
-            # tight: the disjunction need not imply it.  We may end up
-            # compiling useless wrapper types.
-            # TODO kill simple unions or implement the disjunction
+            # The implicit object type has multiple users.  This can
+            # only be a duplicate definition, which will be flagged
+            # later.
             pass
         else:
             self._def_entity(QAPISchemaObjectType(
@@ -1084,49 +1048,28 @@ def _def_struct_type(self, expr, info, doc):
     def _make_variant(self, case, typ, ifcond, info):
         return QAPISchemaVariant(case, info, typ, ifcond)
 
-    def _make_simple_variant(self, case, typ, ifcond, info):
-        if isinstance(typ, list):
-            assert len(typ) == 1
-            typ = self._make_array_type(typ[0], info)
-        typ = self._make_implicit_object_type(
-            typ, info, self.lookup_type(typ),
-            'wrapper', [self._make_member('data', typ, None, None, info)])
-        return QAPISchemaVariant(case, info, typ, ifcond)
-
     def _def_union_type(self, expr, info, doc):
         name = expr['union']
+        base = expr['base']
+        tag_name = expr['discriminator']
         data = expr['data']
-        base = expr.get('base')
         ifcond = QAPISchemaIfCond(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
-        tag_name = expr.get('discriminator')
-        tag_member = None
         if isinstance(base, dict):
             base = self._make_implicit_object_type(
                 name, info, ifcond,
                 'base', self._make_members(base, info))
-        if tag_name:
-            variants = [
-                self._make_variant(key, value['type'],
-                                   QAPISchemaIfCond(value.get('if')),
-                                   info)
-                for (key, value) in data.items()]
-            members = []
-        else:
-            variants = [
-                self._make_simple_variant(key, value['type'],
-                                          QAPISchemaIfCond(value.get('if')),
-                                          info)
-                for (key, value) in data.items()]
-            enum = [{'name': v.name, 'if': v.ifcond.ifcond} for v in variants]
-            typ = self._make_implicit_enum_type(name, info, ifcond, enum)
-            tag_member = QAPISchemaObjectTypeMember('type', info, typ, False)
-            members = [tag_member]
+        variants = [
+            self._make_variant(key, value['type'],
+                               QAPISchemaIfCond(value.get('if')),
+                               info)
+            for (key, value) in data.items()]
+        members = []
         self._def_entity(
             QAPISchemaObjectType(name, info, doc, ifcond, features,
                                  base, members,
                                  QAPISchemaVariants(
-                                     tag_name, info, tag_member, variants)))
+                                     tag_name, info, None, variants)))
 
     def _def_alternate_type(self, expr, info, doc):
         name = expr['alternate']
diff --git a/tests/qapi-schema/flat-union-array-branch.json b/tests/qapi-schema/flat-union-array-branch.json
index 0b98820a8f..6dda7ec379 100644
--- a/tests/qapi-schema/flat-union-array-branch.json
+++ b/tests/qapi-schema/flat-union-array-branch.json
@@ -1,4 +1,4 @@
-# we require flat union branches to be a struct
+# we require union branches to be a struct
 { 'enum': 'TestEnum',
   'data': [ 'value1', 'value2' ] }
 { 'struct': 'Base',
diff --git a/tests/qapi-schema/flat-union-empty.json b/tests/qapi-schema/flat-union-empty.json
index 83e1cc7b96..584ed6098c 100644
--- a/tests/qapi-schema/flat-union-empty.json
+++ b/tests/qapi-schema/flat-union-empty.json
@@ -1,4 +1,4 @@
-# flat union discriminator cannot be empty
+# union discriminator enum cannot be empty
 { 'enum': 'Empty', 'data': [ ] }
 { 'struct': 'Base', 'data': { 'type': 'Empty' } }
 { 'union': 'Union', 'base': 'Base', 'discriminator': 'type', 'data': { } }
diff --git a/tests/qapi-schema/flat-union-int-branch.json b/tests/qapi-schema/flat-union-int-branch.json
index 9370c349e8..567043d9d2 100644
--- a/tests/qapi-schema/flat-union-int-branch.json
+++ b/tests/qapi-schema/flat-union-int-branch.json
@@ -1,4 +1,4 @@
-# we require flat union branches to be a struct
+# we require union branches to be a struct
 { 'enum': 'TestEnum',
   'data': [ 'value1', 'value2' ] }
 { 'struct': 'Base',
diff --git a/tests/qapi-schema/flat-union-no-base.err b/tests/qapi-schema/flat-union-no-base.err
index 5167565b00..c60482f96b 100644
--- a/tests/qapi-schema/flat-union-no-base.err
+++ b/tests/qapi-schema/flat-union-no-base.err
@@ -1,2 +1,2 @@
 flat-union-no-base.json: In union 'TestUnion':
-flat-union-no-base.json:8: 'discriminator' requires 'base'
+flat-union-no-base.json:8: union misses key 'base'
diff --git a/tests/qapi-schema/flat-union-no-base.json b/tests/qapi-schema/flat-union-no-base.json
index 327877b563..f6fe12da3b 100644
--- a/tests/qapi-schema/flat-union-no-base.json
+++ b/tests/qapi-schema/flat-union-no-base.json
@@ -1,4 +1,4 @@
-# flat unions require a base
+# unions require a base
 { 'struct': 'TestTypeA',
   'data': { 'string': 'str' } }
 { 'struct': 'TestTypeB',
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 0c19d4820e..b10490ccc6 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -30,7 +30,7 @@
 { 'struct': 'Empty1', 'data': { } }
 { 'struct': 'Empty2', 'base': 'Empty1', 'data': { } }
 
-# Likewise for an empty flat union
+# Likewise for an empty union
 { 'union': 'Union',
   'base': { 'type': 'EnumOne' }, 'discriminator': 'type',
   'data': { } }
diff --git a/tests/qapi-schema/reserved-member-u.json b/tests/qapi-schema/reserved-member-u.json
index 2bfb8f59b6..d982ab5e0c 100644
--- a/tests/qapi-schema/reserved-member-u.json
+++ b/tests/qapi-schema/reserved-member-u.json
@@ -2,6 +2,6 @@
 # We reject use of 'u' as a member name, to allow it for internal use in
 # putting union branch members in a separate namespace from QMP members.
 # This is true even for non-unions, because it is possible to convert a
-# struct to flat union while remaining backwards compatible in QMP.
+# struct to union while remaining backwards compatible in QMP.
 # TODO - we could munge the member name to 'q_u' to avoid the collision
 { 'struct': 'Oops', 'data': { '*u': 'str' } }
diff --git a/tests/qapi-schema/union-base-empty.json b/tests/qapi-schema/union-base-empty.json
index d1843d33b4..6f8ef000db 100644
--- a/tests/qapi-schema/union-base-empty.json
+++ b/tests/qapi-schema/union-base-empty.json
@@ -1,4 +1,4 @@
-# Flat union with empty base and therefore without discriminator
+# Union with empty base and therefore without discriminator
 
 { 'struct': 'Empty', 'data': { } }
 
diff --git a/tests/qapi-schema/union-base-no-discriminator.err b/tests/qapi-schema/union-base-no-discriminator.err
index 9cd5d11b0b..a730b7fd3c 100644
--- a/tests/qapi-schema/union-base-no-discriminator.err
+++ b/tests/qapi-schema/union-base-no-discriminator.err
@@ -1,2 +1,2 @@
 union-base-no-discriminator.json: In union 'TestUnion':
-union-base-no-discriminator.json:11: 'base' requires 'discriminator'
+union-base-no-discriminator.json:11: union misses key 'discriminator'
diff --git a/tests/qapi-schema/union-base-no-discriminator.json b/tests/qapi-schema/union-base-no-discriminator.json
index 1409cf5c9e..2e7cae9b22 100644
--- a/tests/qapi-schema/union-base-no-discriminator.json
+++ b/tests/qapi-schema/union-base-no-discriminator.json
@@ -1,4 +1,4 @@
-# we reject simple unions with a base (or flat unions without discriminator)
+# we reject unions without discriminator
 { 'struct': 'TestTypeA',
   'data': { 'string': 'str' } }
 
-- 
2.31.1


