Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F039F623
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:13:50 +0200 (CEST)
Received: from localhost ([::1]:38526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqac8-0003eB-PM
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lqaX3-00089r-8R
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lqaWy-0001fd-9U
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623154107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhCEU/qcGQ8bLCl3B9mDbCk1T4XTL0DIIo6oBXKeqvE=;
 b=KRPw37jka57u6u1cQAQXgznX5EiDl8Dy5iQpLiKcs2UqQQdurrke6gEIEdT3FGZIAzISDu
 Ro14k2WhY82UTLmp6twQssPcBEI7BeSnZfKpcReWjOQDhqgXBNa1wSBYvsPEZ6xDhmWAkS
 2RzUSlXINTpWr28y8p/ZMZmAWC7GcrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-xc9Z35CVPbqw7o2ynGF6jw-1; Tue, 08 Jun 2021 08:08:26 -0400
X-MC-Unique: xc9Z35CVPbqw7o2ynGF6jw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C5EC1020C2E
 for <qemu-devel@nongnu.org>; Tue,  8 Jun 2021 12:08:25 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B27F21001281;
 Tue,  8 Jun 2021 12:08:19 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v5 7/9] qapi: normalize 'if' condition to IfPredicate tree
Date: Tue,  8 Jun 2021 16:07:21 +0400
Message-Id: <20210608120723.2268181-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eric Blake <eblake@redhat.com>, jsnow@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Modify check_if() to normalize the condition tree.

Add _make_if() to build a QAPISchemaIfCond tree.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
---
 tests/unit/test-qmp-cmds.c                    |  1 +
 scripts/qapi/expr.py                          | 51 +++++++++------
 scripts/qapi/schema.py                        | 62 +++++++++++++------
 tests/qapi-schema/bad-if-empty-list.json      |  2 +-
 tests/qapi-schema/bad-if-list.json            |  2 +-
 tests/qapi-schema/bad-if.err                  |  3 +-
 tests/qapi-schema/doc-good.out                | 12 ++--
 tests/qapi-schema/enum-if-invalid.err         |  3 +-
 tests/qapi-schema/features-if-invalid.err     |  2 +-
 tests/qapi-schema/qapi-schema-test.json       | 32 ++++++----
 tests/qapi-schema/qapi-schema-test.out        | 59 ++++++++++--------
 .../qapi-schema/struct-member-if-invalid.err  |  2 +-
 .../qapi-schema/union-branch-if-invalid.json  |  2 +-
 13 files changed, 143 insertions(+), 90 deletions(-)

diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 1b0b7d99df..83efa39720 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -51,6 +51,7 @@ FeatureStruct1 *qmp_test_features0(bool has_fs0, FeatureStruct0 *fs0,
                                    bool has_cfs1, CondFeatureStruct1 *cfs1,
                                    bool has_cfs2, CondFeatureStruct2 *cfs2,
                                    bool has_cfs3, CondFeatureStruct3 *cfs3,
+                                   bool has_cfs4, CondFeatureStruct4 *cfs4,
                                    Error **errp)
 {
     return g_new0(FeatureStruct1, 1);
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 496f7e0333..60ffe9ef03 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -261,12 +261,12 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
     """
     Normalize and validate the ``if`` member of an object.
 
-    The ``if`` member may be either a ``str`` or a ``List[str]``.
-    A ``str`` value will be normalized to ``List[str]``.
+    The ``if`` field may be either a ``str`` or a dict.
+    A ``str`` element will be normalized to ``{'all': List[str]}``.
 
     :forms:
-      :sugared: ``Union[str, List[str]]``
-      :canonical: ``List[str]``
+      :sugared: ``Union[str, dict]``
+      :canonical: ``Union[str, dict]``
 
     :param expr: The expression containing the ``if`` member to validate.
     :param info: QAPI schema source file information.
@@ -281,25 +281,38 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
     if ifcond is None:
         return
 
-    if isinstance(ifcond, list):
-        if not ifcond:
-            raise QAPISemError(
-                info, "'if' condition [] of %s is useless" % source)
-    else:
-        # Normalize to a list
-        ifcond = expr['if'] = [ifcond]
-
-    for elt in ifcond:
-        if not isinstance(elt, str):
+    def normalize(cond: Union[str, object]) -> Union[str, object]:
+        if isinstance(cond, str):
+            if not cond.strip():
+                raise QAPISemError(
+                    info,
+                    "'if' condition '%s' of %s makes no sense"
+                    % (cond, source))
+            return cond
+        if not isinstance(cond, dict):
             raise QAPISemError(
                 info,
-                "'if' condition of %s must be a string or a list of strings"
-                % source)
-        if not elt.strip():
+                "'if' condition of %s must be a string or a dict" % source)
+        if len(cond) != 1:
             raise QAPISemError(
                 info,
-                "'if' condition '%s' of %s makes no sense"
-                % (elt, source))
+                "'if' condition dict of %s must have one key: "
+                "'all', 'any' or 'not'" % source)
+        check_keys(cond, info, "'if' condition", [],
+                   ["all", "any", "not"])
+        oper, operands = next(iter(cond.items()))
+        if not operands:
+            raise QAPISemError(
+                info, "'if' condition [] of %s is useless" % source)
+        if oper == "not":
+            return {oper: normalize(operands)}
+        if oper in ("all", "any") and not isinstance(operands, list):
+            raise QAPISemError(
+                info, "'%s' condition of %s must be a list" % (oper, source))
+        operands = [normalize(o) for o in operands]
+        return {oper: operands}
+
+    expr['if'] = normalize(ifcond)
 
 
 def normalize_members(members: object) -> None:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index f52caaeecc..9864e49c54 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -22,6 +22,8 @@
 from .common import (
     POINTER_SUFFIX,
     IfAll,
+    IfAny,
+    IfNot,
     IfOption,
     c_name,
 )
@@ -31,15 +33,14 @@
 
 
 class QAPISchemaIfCond:
-    def __init__(self, ifcond=None):
-        self.ifcond = ifcond or []
-        self.pred = IfAll([IfOption(opt) for opt in self.ifcond])
+    def __init__(self, pred=None):
+        self.pred = pred
 
     def docgen(self):
-        return self.pred.docgen()
+        return self and self.pred.docgen()
 
     def cgen(self):
-        return self.pred.cgen()
+        return self and self.pred.cgen()
 
     # Returns true if the condition is not void
     def __bool__(self):
@@ -991,16 +992,41 @@ def _def_predefineds(self):
         self._def_entity(QAPISchemaEnumType('QType', None, None, None, None,
                                             qtype_values, 'QTYPE'))
 
+    def _make_if(self, cond):
+        if isinstance(cond, QAPISchemaIfCond):
+            return cond
+        if cond is None:
+            return QAPISchemaIfCond()
+
+        def make_pred(node):
+            if isinstance(node, str):
+                return IfOption(node)
+            oper, operands = next(iter(node.items()))
+            op2cls = {
+                'all': IfAll,
+                'any': IfAny,
+                'not': IfNot,
+            }
+
+            if isinstance(operands, list):
+                operands = [make_pred(o) for o in operands]
+            else:
+                operands = make_pred(operands)
+
+            return op2cls[oper](operands)
+
+        return QAPISchemaIfCond(make_pred(cond))
+
     def _make_features(self, features, info):
         if features is None:
             return []
         return [QAPISchemaFeature(f['name'], info,
-                                  QAPISchemaIfCond(f.get('if')))
+                                  self._make_if(f.get('if')))
                 for f in features]
 
     def _make_enum_members(self, values, info):
         return [QAPISchemaEnumMember(v['name'], info,
-                                     QAPISchemaIfCond(v.get('if')))
+                                     self._make_if(v.get('if')))
                 for v in values]
 
     def _make_implicit_enum_type(self, name, info, ifcond, values):
@@ -1046,7 +1072,7 @@ def _def_enum_type(self, expr, info, doc):
         name = expr['enum']
         data = expr['data']
         prefix = expr.get('prefix')
-        ifcond = QAPISchemaIfCond(expr.get('if'))
+        ifcond = self._make_if(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaEnumType(
             name, info, doc, ifcond, features,
@@ -1065,7 +1091,7 @@ def _make_member(self, name, typ, ifcond, features, info):
 
     def _make_members(self, data, info):
         return [self._make_member(key, value['type'],
-                                  QAPISchemaIfCond(value.get('if')),
+                                  self._make_if(value.get('if')),
                                   value.get('features'), info)
                 for (key, value) in data.items()]
 
@@ -1073,7 +1099,7 @@ def _def_struct_type(self, expr, info, doc):
         name = expr['struct']
         base = expr.get('base')
         data = expr['data']
-        ifcond = QAPISchemaIfCond(expr.get('if'))
+        ifcond = self._make_if(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaObjectType(
             name, info, doc, ifcond, features, base,
@@ -1096,7 +1122,7 @@ def _def_union_type(self, expr, info, doc):
         name = expr['union']
         data = expr['data']
         base = expr.get('base')
-        ifcond = QAPISchemaIfCond(expr.get('if'))
+        ifcond = self._make_if(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         tag_name = expr.get('discriminator')
         tag_member = None
@@ -1107,7 +1133,7 @@ def _def_union_type(self, expr, info, doc):
         if tag_name:
             variants = [
                 self._make_variant(key, value['type'],
-                                   QAPISchemaIfCond(value.get('if')),
+                                   self._make_if(value.get('if')),
                                    info)
                 for (key, value) in data.items()
             ]
@@ -1115,11 +1141,11 @@ def _def_union_type(self, expr, info, doc):
         else:
             variants = [
                 self._make_simple_variant(key, value['type'],
-                                          QAPISchemaIfCond(value.get('if')),
+                                          self._make_if(value.get('if')),
                                           info)
                 for (key, value) in data.items()
             ]
-            enum = [{'name': v.name, 'if': v.ifcond.ifcond} for v in variants]
+            enum = [{'name': v.name, 'if': v.ifcond} for v in variants]
             typ = self._make_implicit_enum_type(name, info, ifcond, enum)
             tag_member = QAPISchemaObjectTypeMember('type', info, typ, False)
             members = [tag_member]
@@ -1132,11 +1158,11 @@ def _def_union_type(self, expr, info, doc):
     def _def_alternate_type(self, expr, info, doc):
         name = expr['alternate']
         data = expr['data']
-        ifcond = QAPISchemaIfCond(expr.get('if'))
+        ifcond = self._make_if(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         variants = [
             self._make_variant(key, value['type'],
-                               QAPISchemaIfCond(value.get('if')),
+                               self._make_if(value.get('if')),
                                info)
             for (key, value) in data.items()
         ]
@@ -1156,7 +1182,7 @@ def _def_command(self, expr, info, doc):
         allow_oob = expr.get('allow-oob', False)
         allow_preconfig = expr.get('allow-preconfig', False)
         coroutine = expr.get('coroutine', False)
-        ifcond = QAPISchemaIfCond(expr.get('if'))
+        ifcond = self._make_if(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
             data = self._make_implicit_object_type(
@@ -1175,7 +1201,7 @@ def _def_event(self, expr, info, doc):
         name = expr['event']
         data = expr.get('data')
         boxed = expr.get('boxed', False)
-        ifcond = QAPISchemaIfCond(expr.get('if'))
+        ifcond = self._make_if(expr.get('if'))
         features = self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
             data = self._make_implicit_object_type(
diff --git a/tests/qapi-schema/bad-if-empty-list.json b/tests/qapi-schema/bad-if-empty-list.json
index 94f2eb8670..b62b5671df 100644
--- a/tests/qapi-schema/bad-if-empty-list.json
+++ b/tests/qapi-schema/bad-if-empty-list.json
@@ -1,3 +1,3 @@
 # check empty 'if' list
 { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
-  'if': [] }
+  'if': { 'all': [] } }
diff --git a/tests/qapi-schema/bad-if-list.json b/tests/qapi-schema/bad-if-list.json
index ea3d95bb6b..1fefef16a7 100644
--- a/tests/qapi-schema/bad-if-list.json
+++ b/tests/qapi-schema/bad-if-list.json
@@ -1,3 +1,3 @@
 # check invalid 'if' content
 { 'struct': 'TestIfStruct', 'data': { 'foo': 'int' },
-  'if': ['foo', ' '] }
+  'if': { 'all': ['foo', ' '] } }
diff --git a/tests/qapi-schema/bad-if.err b/tests/qapi-schema/bad-if.err
index f83dee65da..454fbae387 100644
--- a/tests/qapi-schema/bad-if.err
+++ b/tests/qapi-schema/bad-if.err
@@ -1,2 +1,3 @@
 bad-if.json: In struct 'TestIfStruct':
-bad-if.json:2: 'if' condition of struct must be a string or a list of strings
+bad-if.json:2: 'if' condition has unknown key 'value'
+Valid keys are 'all', 'any', 'not'.
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index db1d23c6bf..4d951f97ee 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -12,15 +12,15 @@ enum QType
 module doc-good.json
 enum Enum
     member one
-        if IfAll([IfOption('defined(IFONE)')])
+        if IfOption('defined(IFONE)')
     member two
-    if IfAll([IfOption('defined(IFCOND)')])
+    if IfOption('defined(IFCOND)')
     feature enum-feat
 object Base
     member base1: Enum optional=False
 object Variant1
     member var1: str optional=False
-        if IfAll([IfOption('defined(IFSTR)')])
+        if IfOption('defined(IFSTR)')
         feature member-feat
     feature variant1-feat
 object Variant2
@@ -29,7 +29,7 @@ object Object
     tag base1
     case one: Variant1
     case two: Variant2
-        if IfAll([IfOption('IFTWO')])
+        if IfOption('IFTWO')
     feature union-feat1
 object q_obj_Variant1-wrapper
     member data: Variant1 optional=False
@@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
 enum SugaredUnionKind
     member one
     member two
-        if IfAll([IfOption('IFTWO')])
+        if IfOption('IFTWO')
 object SugaredUnion
     member type: SugaredUnionKind optional=False
     tag type
     case one: q_obj_Variant1-wrapper
     case two: q_obj_Variant2-wrapper
-        if IfAll([IfOption('IFTWO')])
+        if IfOption('IFTWO')
     feature union-feat2
 alternate Alternate
     tag type
diff --git a/tests/qapi-schema/enum-if-invalid.err b/tests/qapi-schema/enum-if-invalid.err
index 0556dc967b..3bb84075a9 100644
--- a/tests/qapi-schema/enum-if-invalid.err
+++ b/tests/qapi-schema/enum-if-invalid.err
@@ -1,2 +1,3 @@
 enum-if-invalid.json: In enum 'TestIfEnum':
-enum-if-invalid.json:2: 'if' condition of 'data' member 'bar' must be a string or a list of strings
+enum-if-invalid.json:2: 'if' condition has unknown key 'val'
+Valid keys are 'all', 'any', 'not'.
diff --git a/tests/qapi-schema/features-if-invalid.err b/tests/qapi-schema/features-if-invalid.err
index f63b89535e..8b64318df6 100644
--- a/tests/qapi-schema/features-if-invalid.err
+++ b/tests/qapi-schema/features-if-invalid.err
@@ -1,2 +1,2 @@
 features-if-invalid.json: In struct 'Stru':
-features-if-invalid.json:2: 'if' condition of 'features' member 'f' must be a string or a list of strings
+features-if-invalid.json:2: 'if' condition of 'features' member 'f' must be a string or a dict
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 84b9d41f15..a0f09b277e 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -231,8 +231,8 @@
 
 { 'union': 'TestIfUnion', 'data':
   { 'foo': 'TestStruct',
-    'bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
-  'if': 'defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)' }
+    'union-bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
+  'if': { 'all': ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'] } }
 
 { 'command': 'test-if-union-cmd',
   'data': { 'union-cmd-arg': 'TestIfUnion' },
@@ -241,25 +241,24 @@
 { 'alternate': 'TestIfAlternate', 'data':
   { 'foo': 'int',
     'bar': { 'type': 'TestStruct', 'if': 'defined(TEST_IF_ALT_BAR)'} },
-  'if': 'defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)' }
+  'if': { 'all': ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'] } }
 
-{ 'command': 'test-if-alternate-cmd',
-  'data': { 'alt-cmd-arg': 'TestIfAlternate' },
-  'if': 'defined(TEST_IF_ALT)' }
+{ 'command': 'test-if-alternate-cmd', 'data': { 'alt-cmd-arg': 'TestIfAlternate' },
+  'if': { 'all': ['defined(TEST_IF_ALT)', {'not': 'defined(TEST_IF_NOT_ALT)'}] } }
 
 { 'command': 'test-if-cmd',
   'data': {
     'foo': 'TestIfStruct',
     'bar': { 'type': 'TestIfEnum', 'if': 'defined(TEST_IF_CMD_BAR)' } },
   'returns': 'UserDefThree',
-  'if': ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'] }
+  'if': { 'all': ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'] } }
 
 { 'command': 'test-cmd-return-def-three', 'returns': 'UserDefThree' }
 
 { 'event': 'TEST_IF_EVENT', 'data':
   { 'foo': 'TestIfStruct',
     'bar': { 'type': ['TestIfEnum'], 'if': 'defined(TEST_IF_EVT_BAR)' } },
-  'if': 'defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)' }
+  'if': { 'all': ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'] } }
 
 # test 'features'
 
@@ -288,8 +287,13 @@
                 { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'} ] }
 { 'struct': 'CondFeatureStruct3',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
-                                              'defined(TEST_IF_COND_2)'] } ] }
+  'features': [ { 'name': 'feature1',
+                  'if': { 'all': [ 'defined(TEST_IF_COND_1)',
+                                   'defined(TEST_IF_COND_2)'] } } ] }
+{ 'struct': 'CondFeatureStruct4',
+  'data': { 'foo': 'int' },
+  'features': [ { 'name': 'feature1', 'if': {'any': ['defined(TEST_IF_COND_1)',
+                                                     'defined(TEST_IF_COND_2)'] } } ] }
 
 { 'enum': 'FeatureEnum1',
   'data': [ 'eins', 'zwei', 'drei' ],
@@ -313,7 +317,8 @@
             '*fs4': 'FeatureStruct4',
             '*cfs1': 'CondFeatureStruct1',
             '*cfs2': 'CondFeatureStruct2',
-            '*cfs3': 'CondFeatureStruct3' },
+            '*cfs3': 'CondFeatureStruct3',
+            '*cfs4': 'CondFeatureStruct4' },
   'returns': 'FeatureStruct1',
   'features': [] }
 
@@ -328,8 +333,9 @@
   'features': [ { 'name': 'feature1', 'if': 'defined(TEST_IF_FEATURE_1)'},
                 { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'} ] }
 { 'command': 'test-command-cond-features3',
-  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
-                                              'defined(TEST_IF_COND_2)'] } ] }
+  'features': [ { 'name': 'feature1',
+                  'if': { 'all': [ 'defined(TEST_IF_COND_1)',
+                                   'defined(TEST_IF_COND_2)'] } } ] }
 
 { 'event': 'TEST_EVENT_FEATURES0',
   'data': 'FeatureStruct1' }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index e4e0fb173a..dd2f83fbae 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -298,49 +298,49 @@ command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
 object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
-        if IfAll([IfOption('defined(TEST_IF_STRUCT_BAR)')])
-    if IfAll([IfOption('defined(TEST_IF_STRUCT)')])
+        if IfOption('defined(TEST_IF_STRUCT_BAR)')
+    if IfOption('defined(TEST_IF_STRUCT)')
 enum TestIfEnum
     member foo
     member bar
-        if IfAll([IfOption('defined(TEST_IF_ENUM_BAR)')])
-    if IfAll([IfOption('defined(TEST_IF_ENUM)')])
+        if IfOption('defined(TEST_IF_ENUM_BAR)')
+    if IfOption('defined(TEST_IF_ENUM)')
 object q_obj_TestStruct-wrapper
     member data: TestStruct optional=False
 enum TestIfUnionKind
     member foo
-    member bar
-        if IfAll([IfOption('defined(TEST_IF_UNION_BAR)')])
-    if IfAll([IfOption('defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)')])
+    member union-bar
+        if IfOption('defined(TEST_IF_UNION_BAR)')
+    if IfAll([IfOption('defined(TEST_IF_UNION)'), IfOption('defined(TEST_IF_STRUCT)')])
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
-    case bar: q_obj_str-wrapper
-        if IfAll([IfOption('defined(TEST_IF_UNION_BAR)')])
-    if IfAll([IfOption('defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)')])
+    case union-bar: q_obj_str-wrapper
+        if IfOption('defined(TEST_IF_UNION_BAR)')
+    if IfAll([IfOption('defined(TEST_IF_UNION)'), IfOption('defined(TEST_IF_STRUCT)')])
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if IfAll([IfOption('defined(TEST_IF_UNION)')])
+    if IfOption('defined(TEST_IF_UNION)')
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if IfAll([IfOption('defined(TEST_IF_UNION)')])
+    if IfOption('defined(TEST_IF_UNION)')
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
-        if IfAll([IfOption('defined(TEST_IF_ALT_BAR)')])
-    if IfAll([IfOption('defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)')])
+        if IfOption('defined(TEST_IF_ALT_BAR)')
+    if IfAll([IfOption('defined(TEST_IF_ALT)'), IfOption('defined(TEST_IF_STRUCT)')])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if IfAll([IfOption('defined(TEST_IF_ALT)')])
+    if IfAll([IfOption('defined(TEST_IF_ALT)'), IfNot(IfOption('defined(TEST_IF_NOT_ALT)'))])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if IfAll([IfOption('defined(TEST_IF_ALT)')])
+    if IfAll([IfOption('defined(TEST_IF_ALT)'), IfNot(IfOption('defined(TEST_IF_NOT_ALT)'))])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-        if IfAll([IfOption('defined(TEST_IF_CMD_BAR)')])
+        if IfOption('defined(TEST_IF_CMD_BAR)')
     if IfAll([IfOption('defined(TEST_IF_CMD)'), IfOption('defined(TEST_IF_STRUCT)')])
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
@@ -348,15 +348,15 @@ command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
-    if IfAll([IfOption('defined(TEST_IF_ENUM)')])
+    if IfOption('defined(TEST_IF_ENUM)')
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
-        if IfAll([IfOption('defined(TEST_IF_EVT_BAR)')])
-    if IfAll([IfOption('defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)')])
+        if IfOption('defined(TEST_IF_EVT_BAR)')
+    if IfAll([IfOption('defined(TEST_IF_EVT)'), IfOption('defined(TEST_IF_STRUCT)')])
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if IfAll([IfOption('defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)')])
+    if IfAll([IfOption('defined(TEST_IF_EVT)'), IfOption('defined(TEST_IF_STRUCT)')])
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -379,17 +379,21 @@ object FeatureStruct4
 object CondFeatureStruct1
     member foo: int optional=False
     feature feature1
-        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
+        if IfOption('defined(TEST_IF_FEATURE_1)')
 object CondFeatureStruct2
     member foo: int optional=False
     feature feature1
-        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
+        if IfOption('defined(TEST_IF_FEATURE_1)')
     feature feature2
-        if IfAll([IfOption('defined(TEST_IF_FEATURE_2)')])
+        if IfOption('defined(TEST_IF_FEATURE_2)')
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
         if IfAll([IfOption('defined(TEST_IF_COND_1)'), IfOption('defined(TEST_IF_COND_2)')])
+object CondFeatureStruct4
+    member foo: int optional=False
+    feature feature1
+        if IfAny([IfOption('defined(TEST_IF_COND_1)'), IfOption('defined(TEST_IF_COND_2)')])
 enum FeatureEnum1
     member eins
     member zwei
@@ -417,6 +421,7 @@ object q_obj_test-features0-arg
     member cfs1: CondFeatureStruct1 optional=True
     member cfs2: CondFeatureStruct2 optional=True
     member cfs3: CondFeatureStruct3 optional=True
+    member cfs4: CondFeatureStruct4 optional=True
 command test-features0 q_obj_test-features0-arg -> FeatureStruct1
     gen=True success_response=True boxed=False oob=False preconfig=False
 command test-command-features1 None -> None
@@ -429,13 +434,13 @@ command test-command-features3 None -> None
 command test-command-cond-features1 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
+        if IfOption('defined(TEST_IF_FEATURE_1)')
 command test-command-cond-features2 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
+        if IfOption('defined(TEST_IF_FEATURE_1)')
     feature feature2
-        if IfAll([IfOption('defined(TEST_IF_FEATURE_2)')])
+        if IfOption('defined(TEST_IF_FEATURE_2)')
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
diff --git a/tests/qapi-schema/struct-member-if-invalid.err b/tests/qapi-schema/struct-member-if-invalid.err
index 42e7fdae3c..eea4c62aaf 100644
--- a/tests/qapi-schema/struct-member-if-invalid.err
+++ b/tests/qapi-schema/struct-member-if-invalid.err
@@ -1,2 +1,2 @@
 struct-member-if-invalid.json: In struct 'Stru':
-struct-member-if-invalid.json:2: 'if' condition of 'data' member 'member' must be a string or a list of strings
+struct-member-if-invalid.json:2: 'if' condition of 'data' member 'member' must be a string or a dict
diff --git a/tests/qapi-schema/union-branch-if-invalid.json b/tests/qapi-schema/union-branch-if-invalid.json
index 46d4239af6..c41633856f 100644
--- a/tests/qapi-schema/union-branch-if-invalid.json
+++ b/tests/qapi-schema/union-branch-if-invalid.json
@@ -3,4 +3,4 @@
 { 'struct': 'Stru', 'data': { 'member': 'str' } }
 { 'union': 'Uni',
   'base': { 'tag': 'Branches' }, 'discriminator': 'tag',
-  'data': { 'branch1': { 'type': 'Stru', 'if': [''] } } }
+  'data': { 'branch1': { 'type': 'Stru', 'if': { 'all': [''] } } } }
-- 
2.29.0


