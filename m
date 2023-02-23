Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE986A0ACD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 14:41:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVBq0-0002yx-T9; Thu, 23 Feb 2023 08:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBpy-0002r0-33
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVBpv-0008Fi-NI
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 08:40:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677159639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zT3T/ODBUSanLMWZqrUFbi/IK7AJIYpdVzok7b7euw=;
 b=OUTD7/oor6J4UnvRSMZ1YECgT5we8irMOVW3PeZQ0ruKxOJqzYHPufk7EF7Q4iwvwnWO20
 b7UyyIiOg2I+c9+h562Suvh8vl1DNOBJBZ+AiAYG/hSYEogyPUfC+KzultWXupESDg823b
 bbPHlokVsvSlZK8DMMJvE+xMjhqULh0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-ag33Z17iMveOha9BHAUj7w-1; Thu, 23 Feb 2023 08:40:35 -0500
X-MC-Unique: ag33Z17iMveOha9BHAUj7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 657DC87B2A2;
 Thu, 23 Feb 2023 13:40:35 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA7D5410B1ED;
 Thu, 23 Feb 2023 13:40:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Het Gala <het.gala@nutanix.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 3/3] qapi: allow unions to contain further unions
Date: Thu, 23 Feb 2023 13:40:27 +0000
Message-Id: <20230223134027.2294640-4-berrange@redhat.com>
In-Reply-To: <20230223134027.2294640-1-berrange@redhat.com>
References: <20230223134027.2294640-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This extends the QAPI schema validation to permit unions inside unions,
provided the checks for clashing fields pass.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 scripts/qapi/schema.py                        |  6 +-
 tests/qapi-schema/meson.build                 |  2 +
 tests/qapi-schema/qapi-schema-test.json       | 32 ++++++++++
 tests/qapi-schema/qapi-schema-test.out        | 29 ++++++++++
 .../union-invalid-union-subfield.err          |  2 +
 .../union-invalid-union-subfield.json         | 30 ++++++++++
 .../union-invalid-union-subfield.out          |  0
 .../union-invalid-union-subtype.err           |  2 +
 .../union-invalid-union-subtype.json          | 29 ++++++++++
 .../union-invalid-union-subtype.out           |  0
 tests/unit/test-qobject-input-visitor.c       | 47 +++++++++++++++
 tests/unit/test-qobject-output-visitor.c      | 58 +++++++++++++++++++
 12 files changed, 234 insertions(+), 3 deletions(-)
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subfield.out
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.err
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.json
 create mode 100644 tests/qapi-schema/union-invalid-union-subtype.out

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 6c481ab0c0..5c4457f789 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -465,9 +465,10 @@ def check(self, schema):
     # on behalf of info, which is not necessarily self.info
     def check_clash(self, info, seen):
         assert self._checked
-        assert not self.variants       # not implemented
         for m in self.members:
             m.check_clash(info, seen)
+        if self.variants:
+            self.variants.check_clash(info, seen)
 
     def connect_doc(self, doc=None):
         super().connect_doc(doc)
@@ -652,8 +653,7 @@ def check(self, schema, seen):
                         self.info,
                         "branch '%s' is not a value of %s"
                         % (v.name, self.tag_member.type.describe()))
-                if (not isinstance(v.type, QAPISchemaObjectType)
-                        or v.type.variants):
+                if not isinstance(v.type, QAPISchemaObjectType):
                     raise QAPISemError(
                         self.info,
                         "%s cannot use %s"
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index d85b14f28c..1591eb322b 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -194,6 +194,8 @@ schemas = [
   'union-invalid-data.json',
   'union-invalid-discriminator.json',
   'union-invalid-if-discriminator.json',
+  'union-invalid-union-subfield.json',
+  'union-invalid-union-subtype.json',
   'union-no-base.json',
   'union-optional-discriminator.json',
   'union-string-discriminator.json',
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index ba7302f42b..40f1a3d88d 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -114,6 +114,38 @@
 { 'struct': 'UserDefC',
   'data': { 'string1': 'str', 'string2': 'str' } }
 
+# this tests that unions can contain other unions in their branches
+{ 'enum': 'TestUnionEnum',
+  'data': [ 'value-a', 'value-b' ] }
+
+{ 'enum': 'TestUnionEnumA',
+  'data': [ 'value-a1', 'value-a2' ] }
+
+{ 'struct': 'TestUnionTypeA1',
+  'data': { 'integer': 'int',
+            'name': 'str'} }
+
+{ 'struct': 'TestUnionTypeA2',
+  'data': { 'integer': 'int',
+            'size': 'int' } }
+
+{ 'union': 'TestUnionTypeA',
+  'base': { 'type-a': 'TestUnionEnumA' },
+  'discriminator': 'type-a',
+  'data': { 'value-a1': 'TestUnionTypeA1',
+            'value-a2': 'TestUnionTypeA2' } }
+
+{ 'struct': 'TestUnionTypeB',
+  'data': { 'integer': 'int',
+            'onoff': 'bool' } }
+
+{ 'union': 'TestUnionInUnion',
+  'base': { 'type': 'TestUnionEnum' },
+  'discriminator': 'type',
+  'data': { 'value-a': 'TestUnionTypeA',
+            'value-b': 'TestUnionTypeB' } }
+
+
 # for testing use of 'number' within alternates
 { 'alternate': 'AltEnumBool', 'data': { 'e': 'EnumOne', 'b': 'bool' } }
 { 'alternate': 'AltEnumNum', 'data': { 'e': 'EnumOne', 'n': 'number' } }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 043d75c655..9fe1038944 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -105,6 +105,35 @@ alternate UserDefAlternate
 object UserDefC
     member string1: str optional=False
     member string2: str optional=False
+enum TestUnionEnum
+    member value-a
+    member value-b
+enum TestUnionEnumA
+    member value-a1
+    member value-a2
+object TestUnionTypeA1
+    member integer: int optional=False
+    member name: str optional=False
+object TestUnionTypeA2
+    member integer: int optional=False
+    member size: int optional=False
+object q_obj_TestUnionTypeA-base
+    member type-a: TestUnionEnumA optional=False
+object TestUnionTypeA
+    base q_obj_TestUnionTypeA-base
+    tag type-a
+    case value-a1: TestUnionTypeA1
+    case value-a2: TestUnionTypeA2
+object TestUnionTypeB
+    member integer: int optional=False
+    member onoff: bool optional=False
+object q_obj_TestUnionInUnion-base
+    member type: TestUnionEnum optional=False
+object TestUnionInUnion
+    base q_obj_TestUnionInUnion-base
+    tag type
+    case value-a: TestUnionTypeA
+    case value-b: TestUnionTypeB
 alternate AltEnumBool
     tag type
     case e: EnumOne
diff --git a/tests/qapi-schema/union-invalid-union-subfield.err b/tests/qapi-schema/union-invalid-union-subfield.err
new file mode 100644
index 0000000000..43574dea79
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-union-subfield.err
@@ -0,0 +1,2 @@
+union-invalid-union-subfield.json: In union 'TestUnion':
+union-invalid-union-subfield.json:25: member 'teeth' of type 'TestTypeFish' collides with base member 'teeth' of type 'TestUnion-base'
diff --git a/tests/qapi-schema/union-invalid-union-subfield.json b/tests/qapi-schema/union-invalid-union-subfield.json
new file mode 100644
index 0000000000..e1639d3a96
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-union-subfield.json
@@ -0,0 +1,30 @@
+# Clash between common member and union variant's variant member
+# Base's member 'teeth' clashes with TestTypeFish's
+
+{ 'enum': 'TestEnum',
+  'data': [ 'animals', 'plants' ] }
+
+{ 'enum': 'TestAnimals',
+  'data': [ 'fish', 'birds'] }
+
+{ 'struct': 'TestTypeFish',
+  'data': { 'scales': 'int', 'teeth': 'int' } }
+
+{ 'struct': 'TestTypeBirds',
+  'data': { 'feathers': 'int' } }
+
+{ 'union': 'TestTypeAnimals',
+  'base': { 'atype': 'TestAnimals' },
+  'discriminator': 'atype',
+  'data': { 'fish': 'TestTypeFish',
+            'birds': 'TestTypeBirds' } }
+
+{ 'struct': 'TestTypePlants',
+  'data': { 'integer': 'int' } }
+
+{ 'union': 'TestUnion',
+  'base': { 'type': 'TestEnum',
+            'teeth': 'int' },
+  'discriminator': 'type',
+  'data': { 'animals': 'TestTypeAnimals',
+            'plants': 'TestTypePlants' } }
diff --git a/tests/qapi-schema/union-invalid-union-subfield.out b/tests/qapi-schema/union-invalid-union-subfield.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/union-invalid-union-subtype.err b/tests/qapi-schema/union-invalid-union-subtype.err
new file mode 100644
index 0000000000..e45f330cec
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-union-subtype.err
@@ -0,0 +1,2 @@
+union-invalid-union-subtype.json: In union 'TestUnion':
+union-invalid-union-subtype.json:25: base member 'type' of type 'TestTypeA-base' collides with base member 'type' of type 'TestUnion-base'
diff --git a/tests/qapi-schema/union-invalid-union-subtype.json b/tests/qapi-schema/union-invalid-union-subtype.json
new file mode 100644
index 0000000000..ce1de51d8d
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-union-subtype.json
@@ -0,0 +1,29 @@
+# Clash between common member and union variant's common member
+# Base's member 'type' clashes with TestTypeA's
+
+{ 'enum': 'TestEnum',
+  'data': [ 'value-a', 'value-b' ] }
+
+{ 'enum': 'TestEnumA',
+  'data': [ 'value-a1', 'value-a2' ] }
+
+{ 'struct': 'TestTypeA1',
+  'data': { 'integer': 'int' } }
+
+{ 'struct': 'TestTypeA2',
+  'data': { 'integer': 'int' } }
+
+{ 'union': 'TestTypeA',
+  'base': { 'type': 'TestEnumA' },
+  'discriminator': 'type',
+  'data': { 'value-a1': 'TestTypeA1',
+            'value-a2': 'TestTypeA2' } }
+
+{ 'struct': 'TestTypeB',
+  'data': { 'integer': 'int' } }
+
+{ 'union': 'TestUnion',
+  'base': { 'type': 'TestEnum' },
+  'discriminator': 'type',
+  'data': { 'value-a': 'TestTypeA',
+            'value-b': 'TestTypeB' } }
diff --git a/tests/qapi-schema/union-invalid-union-subtype.out b/tests/qapi-schema/union-invalid-union-subtype.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index 77fbf985be..9b3e2dbe14 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -706,6 +706,51 @@ static void test_visitor_in_union_flat(TestInputVisitorData *data,
     g_assert(&base->enum1 == &tmp->enum1);
 }
 
+static void test_visitor_in_union_in_union(TestInputVisitorData *data,
+                                           const void *unused)
+{
+    Visitor *v;
+    g_autoptr(TestUnionInUnion) tmp = NULL;
+
+    v = visitor_input_test_init(data,
+                                "{ 'type': 'value-a', "
+                                "  'type-a': 'value-a1', "
+                                "  'integer': 2, "
+                                "  'name': 'fish' }");
+
+    visit_type_TestUnionInUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->type, ==, TEST_UNION_ENUM_VALUE_A);
+    g_assert_cmpint(tmp->u.value_a.type_a, ==, TEST_UNION_ENUMA_VALUE_A1);
+    g_assert_cmpint(tmp->u.value_a.u.value_a1.integer, ==, 2);
+    g_assert_cmpint(strcmp(tmp->u.value_a.u.value_a1.name, "fish"), ==, 0);
+
+    qapi_free_TestUnionInUnion(tmp);
+
+    v = visitor_input_test_init(data,
+                                "{ 'type': 'value-a', "
+                                "  'type-a': 'value-a2', "
+                                "  'integer': 1729, "
+                                "  'size': 87539319 }");
+
+    visit_type_TestUnionInUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->type, ==, TEST_UNION_ENUM_VALUE_A);
+    g_assert_cmpint(tmp->u.value_a.type_a, ==, TEST_UNION_ENUMA_VALUE_A2);
+    g_assert_cmpint(tmp->u.value_a.u.value_a2.integer, ==, 1729);
+    g_assert_cmpint(tmp->u.value_a.u.value_a2.size, ==, 87539319);
+
+    qapi_free_TestUnionInUnion(tmp);
+
+    v = visitor_input_test_init(data,
+                                "{ 'type': 'value-b', "
+                                "  'integer': 1729, "
+                                "  'onoff': true }");
+
+    visit_type_TestUnionInUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->type, ==, TEST_UNION_ENUM_VALUE_B);
+    g_assert_cmpint(tmp->u.value_b.integer, ==, 1729);
+    g_assert_cmpint(tmp->u.value_b.onoff, ==, true);
+}
+
 static void test_visitor_in_alternate(TestInputVisitorData *data,
                                       const void *unused)
 {
@@ -1216,6 +1261,8 @@ int main(int argc, char **argv)
                            NULL, test_visitor_in_null);
     input_visitor_test_add("/visitor/input/union-flat",
                            NULL, test_visitor_in_union_flat);
+    input_visitor_test_add("/visitor/input/union-in-union",
+                           NULL, test_visitor_in_union_in_union);
     input_visitor_test_add("/visitor/input/alternate",
                            NULL, test_visitor_in_alternate);
     input_visitor_test_add("/visitor/input/errors",
diff --git a/tests/unit/test-qobject-output-visitor.c b/tests/unit/test-qobject-output-visitor.c
index 7f054289fe..1535b3ad17 100644
--- a/tests/unit/test-qobject-output-visitor.c
+++ b/tests/unit/test-qobject-output-visitor.c
@@ -352,6 +352,62 @@ static void test_visitor_out_union_flat(TestOutputVisitorData *data,
     qapi_free_UserDefFlatUnion(tmp);
 }
 
+static void test_visitor_out_union_in_union(TestOutputVisitorData *data,
+                                            const void *unused)
+{
+    QDict *qdict;
+
+    TestUnionInUnion *tmp = g_new0(TestUnionInUnion, 1);
+    tmp->type = TEST_UNION_ENUM_VALUE_A;
+    tmp->u.value_a.type_a = TEST_UNION_ENUMA_VALUE_A1;
+    tmp->u.value_a.u.value_a1.integer = 42;
+    tmp->u.value_a.u.value_a1.name = g_strdup("fish");
+
+    visit_type_TestUnionInUnion(data->ov, NULL, &tmp, &error_abort);
+    qdict = qobject_to(QDict, visitor_get(data));
+    g_assert(qdict);
+    g_assert_cmpstr(qdict_get_str(qdict, "type"), ==, "value-a");
+    g_assert_cmpstr(qdict_get_str(qdict, "type-a"), ==, "value-a1");
+    g_assert_cmpint(qdict_get_int(qdict, "integer"), ==, 42);
+    g_assert_cmpstr(qdict_get_str(qdict, "name"), ==, "fish");
+
+    qapi_free_TestUnionInUnion(tmp);
+
+
+    visitor_reset(data);
+    tmp = g_new0(TestUnionInUnion, 1);
+    tmp->type = TEST_UNION_ENUM_VALUE_A;
+    tmp->u.value_a.type_a = TEST_UNION_ENUMA_VALUE_A2;
+    tmp->u.value_a.u.value_a2.integer = 1729;
+    tmp->u.value_a.u.value_a2.size = 87539319;
+
+    visit_type_TestUnionInUnion(data->ov, NULL, &tmp, &error_abort);
+    qdict = qobject_to(QDict, visitor_get(data));
+    g_assert(qdict);
+    g_assert_cmpstr(qdict_get_str(qdict, "type"), ==, "value-a");
+    g_assert_cmpstr(qdict_get_str(qdict, "type-a"), ==, "value-a2");
+    g_assert_cmpint(qdict_get_int(qdict, "integer"), ==, 1729);
+    g_assert_cmpint(qdict_get_int(qdict, "size"), ==, 87539319);
+
+    qapi_free_TestUnionInUnion(tmp);
+
+
+    visitor_reset(data);
+    tmp = g_new0(TestUnionInUnion, 1);
+    tmp->type = TEST_UNION_ENUM_VALUE_B;
+    tmp->u.value_b.integer = 1729;
+    tmp->u.value_b.onoff = true;
+
+    visit_type_TestUnionInUnion(data->ov, NULL, &tmp, &error_abort);
+    qdict = qobject_to(QDict, visitor_get(data));
+    g_assert(qdict);
+    g_assert_cmpstr(qdict_get_str(qdict, "type"), ==, "value-b");
+    g_assert_cmpint(qdict_get_int(qdict, "integer"), ==, 1729);
+    g_assert_cmpint(qdict_get_bool(qdict, "onoff"), ==, true);
+
+    qapi_free_TestUnionInUnion(tmp);
+}
+
 static void test_visitor_out_alternate(TestOutputVisitorData *data,
                                        const void *unused)
 {
@@ -586,6 +642,8 @@ int main(int argc, char **argv)
                             &out_visitor_data, test_visitor_out_list_qapi_free);
     output_visitor_test_add("/visitor/output/union-flat",
                             &out_visitor_data, test_visitor_out_union_flat);
+    output_visitor_test_add("/visitor/output/union-in-union",
+                            &out_visitor_data, test_visitor_out_union_in_union);
     output_visitor_test_add("/visitor/output/alternate",
                             &out_visitor_data, test_visitor_out_alternate);
     output_visitor_test_add("/visitor/output/null",
-- 
2.39.2


