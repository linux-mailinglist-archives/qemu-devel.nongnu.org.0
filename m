Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E9438E52
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 06:29:04 +0200 (CEST)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1merbb-0004Ij-F4
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 00:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merXO-0006NB-QJ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1merXM-0006al-5s
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 00:24:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635135879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ujcP5WRFtzs3sZBBhx5NaWSDE0NKlhl4MYokQBXhGLg=;
 b=KRgVr/ZFZjAQGxe9b8jfy0zBq+yChmFBBktx/sv1Kn6RRTOpsDNiD1y4hkklMOvhUOM9MY
 82vNP0rTdVL3BbfrVVb2w85bUephvqeyRmzo+OI4954b2DDaoV5/6PJBkBkvBOyRzVlRLh
 i7jIkVNM3XsFDz6p430fOvssWb/II1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-eEKFS2IiNke6qDfVh4op3Q-1; Mon, 25 Oct 2021 00:24:20 -0400
X-MC-Unique: eEKFS2IiNke6qDfVh4op3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0C61806689;
 Mon, 25 Oct 2021 04:24:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABC0C5BAFF;
 Mon, 25 Oct 2021 04:24:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 042B611380B8; Mon, 25 Oct 2021 06:24:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] qapi: Add feature flags to enum members
Date: Mon, 25 Oct 2021 06:24:02 +0200
Message-Id: <20211025042405.3762351-3-armbru@redhat.com>
In-Reply-To: <20211025042405.3762351-1-armbru@redhat.com>
References: <20211025042405.3762351-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is quite similar to commit 84ab008687 "qapi: Add feature flags to
struct members", only for enums instead of structs.

Special feature flag 'deprecated' is silently ignored there.  This is
okay only because it will be implemented shortly.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 docs/devel/qapi-code-gen.rst                  | 16 +++++++++-----
 qapi/compat.json                              |  2 ++
 qapi/introspect.json                          |  5 ++++-
 scripts/qapi/expr.py                          |  3 ++-
 scripts/qapi/introspect.py                    |  5 +++--
 scripts/qapi/schema.py                        | 22 +++++++++++++++++--
 tests/qapi-schema/doc-good.json               |  5 ++++-
 tests/qapi-schema/doc-good.out                |  3 +++
 tests/qapi-schema/doc-good.txt                |  3 +++
 .../qapi-schema/enum-dict-member-unknown.err  |  2 +-
 tests/qapi-schema/qapi-schema-test.json       |  3 ++-
 tests/qapi-schema/qapi-schema-test.out        |  1 +
 tests/qapi-schema/test-qapi.py                |  1 +
 13 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index d267889d2c..4071c9074a 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -200,7 +200,9 @@ Syntax::
              '*if': COND,
              '*features': FEATURES }
     ENUM-VALUE = STRING
-               | { 'name': STRING, '*if': COND }
+               | { 'name': STRING,
+                   '*if': COND,
+                   '*features': FEATURES }
 
 Member 'enum' names the enum type.
 
@@ -706,8 +708,10 @@ QEMU shows a certain behaviour.
 Special features
 ~~~~~~~~~~~~~~~~
 
-Feature "deprecated" marks a command, event, or struct member as
-deprecated.  It is not supported elsewhere so far.
+Feature "deprecated" marks a command, event, enum value, or struct
+member as deprecated.  It is not supported elsewhere so far.
+Interfaces so marked may be withdrawn in future releases in accordance
+with QEMU's deprecation policy.
 
 
 Naming rules and reserved names
@@ -1157,7 +1161,8 @@ and "variants".
 
 "members" is a JSON array describing the object's common members, if
 any.  Each element is a JSON object with members "name" (the member's
-name), "type" (the name of its type), and optionally "default".  The
+name), "type" (the name of its type), "features" (a JSON array of
+feature strings), and "default".  The latter two are optional.  The
 member is optional if "default" is present.  Currently, "default" can
 only have value null.  Other values are reserved for future
 extensions.  The "members" array is in no particular order; clients
@@ -1234,7 +1239,8 @@ The SchemaInfo for an enumeration type has meta-type "enum" and
 variant member "members".
 
 "members" is a JSON array describing the enumeration values.  Each
-element is a JSON object with member "name" (the member's name).  The
+element is a JSON object with member "name" (the member's name), and
+optionally "features" (a JSON array of feature strings).  The
 "members" array is in no particular order; clients must search the
 entire array when learning whether a particular value is supported.
 
diff --git a/qapi/compat.json b/qapi/compat.json
index ae3afc22df..1d2b76f00c 100644
--- a/qapi/compat.json
+++ b/qapi/compat.json
@@ -42,6 +42,8 @@
 # with feature 'deprecated'.  We may want to extend it to cover
 # semantic aspects, CLI, and experimental features.
 #
+# Limitation: not implemented for deprecated enumeration values.
+#
 # @deprecated-input: how to handle deprecated input (default 'accept')
 # @deprecated-output: how to handle deprecated output (default 'accept')
 #
diff --git a/qapi/introspect.json b/qapi/introspect.json
index 9683e884f8..183148b2e9 100644
--- a/qapi/introspect.json
+++ b/qapi/introspect.json
@@ -167,10 +167,13 @@
 #
 # @name: the member's name, as defined in the QAPI schema.
 #
+# @features: names of features associated with the member, in no
+#            particular order.
+#
 # Since: 6.2
 ##
 { 'struct': 'SchemaInfoEnumMember',
-  'data': { 'name': 'str' } }
+  'data': { 'name': 'str', '*features': [ 'str' ] } }
 
 ##
 # @SchemaInfoArray:
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 819ea6ad97..3cb389e875 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -472,7 +472,7 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
                   for m in members]
     for member in members:
         source = "'data' member"
-        check_keys(member, info, source, ['name'], ['if'])
+        check_keys(member, info, source, ['name'], ['if', 'features'])
         member_name = member['name']
         check_name_is_str(member_name, info, source)
         source = "%s '%s'" % (source, member_name)
@@ -483,6 +483,7 @@ def check_enum(expr: _JSONObject, info: QAPISourceInfo) -> None:
                          permit_upper=permissive,
                          permit_underscore=permissive)
         check_if(member, info, source)
+        check_features(member.get('features'), info)
 
 
 def check_struct(expr: _JSONObject, info: QAPISourceInfo) -> None:
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 6334546363..67c7d89aae 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -275,12 +275,13 @@ def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
             obj['features'] = self._gen_features(features)
         self._trees.append(Annotated(obj, ifcond, comment))
 
-    @staticmethod
-    def _gen_enum_member(member: QAPISchemaEnumMember
+    def _gen_enum_member(self, member: QAPISchemaEnumMember
                          ) -> Annotated[SchemaInfoEnumMember]:
         obj: SchemaInfoEnumMember = {
             'name': member.name,
         }
+        if member.features:
+            obj['features'] = self._gen_features(member.features)
         return Annotated(obj, member.ifcond)
 
     def _gen_object_member(self, member: QAPISchemaObjectTypeMember
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 004d7095ff..6d5f46509a 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -708,6 +708,19 @@ def describe(self, info):
 class QAPISchemaEnumMember(QAPISchemaMember):
     role = 'value'
 
+    def __init__(self, name, info, ifcond=None, features=None):
+        super().__init__(name, info, ifcond)
+        for f in features or []:
+            assert isinstance(f, QAPISchemaFeature)
+            f.set_defined_in(name)
+        self.features = features or []
+
+    def connect_doc(self, doc):
+        super().connect_doc(doc)
+        if doc:
+            for f in self.features:
+                doc.connect_feature(f)
+
 
 class QAPISchemaFeature(QAPISchemaMember):
     role = 'feature'
@@ -980,9 +993,14 @@ def _make_features(self, features, info):
                                   QAPISchemaIfCond(f.get('if')))
                 for f in features]
 
+    def _make_enum_member(self, name, ifcond, features, info):
+        return QAPISchemaEnumMember(name, info,
+                                    QAPISchemaIfCond(ifcond),
+                                    self._make_features(features, info))
+
     def _make_enum_members(self, values, info):
-        return [QAPISchemaEnumMember(v['name'], info,
-                                     QAPISchemaIfCond(v.get('if')))
+        return [self._make_enum_member(v['name'], v.get('if'),
+                                       v.get('features'), info)
                 for v in values]
 
     def _make_array_type(self, element_type, info):
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 86dc25d2bd..74745fb405 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -58,11 +58,14 @@
 #
 # Features:
 # @enum-feat: Also _one_ {and only}
+# @enum-member-feat: a member feature
 #
 # @two is undocumented
 ##
 { 'enum': 'Enum',
-  'data': [ { 'name': 'one', 'if': 'IFONE' }, 'two' ],
+  'data': [ { 'name': 'one', 'if': 'IFONE',
+              'features': [ 'enum-member-feat' ] },
+            'two' ],
   'features': [ 'enum-feat' ],
   'if': 'IFCOND' }
 
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 5a324e2627..9dd65b9d92 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -13,6 +13,7 @@ module doc-good.json
 enum Enum
     member one
         if IFONE
+        feature enum-member-feat
     member two
     if IFCOND
     feature enum-feat
@@ -108,6 +109,8 @@ The _one_ {and only}
 
     feature=enum-feat
 Also _one_ {and only}
+    feature=enum-member-feat
+a member feature
     section=None
 @two is undocumented
 doc symbol=Base
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 701402ee5e..b3b76bd43f 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -56,6 +56,9 @@ Features
 "enum-feat"
    Also _one_ {and only}
 
+"enum-member-feat"
+   a member feature
+
 "two" is undocumented
 
 
diff --git a/tests/qapi-schema/enum-dict-member-unknown.err b/tests/qapi-schema/enum-dict-member-unknown.err
index f8617ea179..235cde0c49 100644
--- a/tests/qapi-schema/enum-dict-member-unknown.err
+++ b/tests/qapi-schema/enum-dict-member-unknown.err
@@ -1,3 +1,3 @@
 enum-dict-member-unknown.json: In enum 'MyEnum':
 enum-dict-member-unknown.json:2: 'data' member has unknown key 'bad-key'
-Valid keys are 'if', 'name'.
+Valid keys are 'features', 'if', 'name'.
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 2ec50109cb..b677ab861d 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -301,7 +301,8 @@
                                  'TEST_IF_COND_2'] } } ] }
 
 { 'enum': 'FeatureEnum1',
-  'data': [ 'eins', 'zwei', 'drei' ],
+  'data': [ 'eins', 'zwei',
+            { 'name': 'drei', 'features': [ 'deprecated' ] } ],
   'features': [ 'feature1' ] }
 
 { 'union': 'FeatureUnion1',
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 9337adc9ea..16846dbeb8 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -341,6 +341,7 @@ enum FeatureEnum1
     member eins
     member zwei
     member drei
+        feature deprecated
     feature feature1
 object q_obj_FeatureUnion1-base
     member tag: FeatureEnum1 optional=False
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index c717a7a90b..2160cef082 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -37,6 +37,7 @@ def visit_enum_type(self, name, info, ifcond, features, members, prefix):
         for m in members:
             print('    member %s' % m.name)
             self._print_if(m.ifcond, indent=8)
+            self._print_features(m.features, indent=8)
         self._print_if(ifcond)
         self._print_features(features)
 
-- 
2.31.1


