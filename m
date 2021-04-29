Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF8A36EB8C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:47:38 +0200 (CEST)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc70z-00036s-6r
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6vQ-0005Yx-4J
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6vG-0002oO-A0
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619703700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cYdEUa7bN1Q2AUqT2AahXJL6Mic+ZIwuuATd7CBS68=;
 b=g0jbgriotfNf2C3gJq4uWZ/Tr6E0vl6ea1xUfNSFnz2aF0S2h8D1p2QFNPEy6Sz0kwfRcc
 snBGO3MqoayRqQtQcYPf2g3Ax6DlxCFlnOt3JQQlmpAaKiD0FGcoeUHv4Fqq2J4SNf18/1
 1C2GebT3MMzUIvZrUXJOHWhFiHUtepk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-81j64WxBMHSw9B8TQ35veQ-1; Thu, 29 Apr 2021 09:41:38 -0400
X-MC-Unique: 81j64WxBMHSw9B8TQ35veQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4B76CC62C
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 13:41:37 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C81D763BA7;
 Thu, 29 Apr 2021 13:41:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/9] qapi: normalize 'if' condition to IfPredicate tree
Date: Thu, 29 Apr 2021 17:40:29 +0400
Message-Id: <20210429134032.1125111-7-marcandre.lureau@redhat.com>
In-Reply-To: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Modify check_if() to build an IfPredicate tree (the schema
documentation is updated in a following patch).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/unit/test-qmp-cmds.c                    |  1 +
 scripts/qapi/expr.py                          | 62 ++++++++++++++-----
 scripts/qapi/schema.py                        | 13 +---
 tests/qapi-schema/bad-if.err                  |  3 +-
 tests/qapi-schema/doc-good.out                | 12 ++--
 tests/qapi-schema/enum-if-invalid.err         |  3 +-
 tests/qapi-schema/features-if-invalid.err     |  2 +-
 tests/qapi-schema/qapi-schema-test.json       | 20 +++---
 tests/qapi-schema/qapi-schema-test.out        | 59 ++++++++++--------
 .../qapi-schema/struct-member-if-invalid.err  |  2 +-
 10 files changed, 106 insertions(+), 71 deletions(-)

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
index 496f7e0333..0a97a6f020 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -42,7 +42,14 @@
     cast,
 )
 
-from .common import c_name
+from .common import (
+    IfAll,
+    IfAny,
+    IfNot,
+    IfOption,
+    IfPredicate,
+    c_name,
+)
 from .error import QAPISemError
 from .parser import QAPIDoc
 from .source import QAPISourceInfo
@@ -261,6 +268,10 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
     """
     Normalize and validate the ``if`` member of an object.
 
+    The ``if`` field may be either a ``str``, a ``List[str]`` or a dict.
+    A ``str`` element or a ``List[str]`` will be normalized to
+    ``IfAll([str])``.
+
     The ``if`` member may be either a ``str`` or a ``List[str]``.
     A ``str`` value will be normalized to ``List[str]``.
 
@@ -281,25 +292,44 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
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
+    def normalize(cond: Union[str, List[str], object]) -> IfPredicate:
+        if isinstance(cond, str):
+            if not cond.strip():
+                raise QAPISemError(
+                    info,
+                    "'if' condition '%s' of %s makes no sense"
+                    % (cond, source))
+            return IfOption(cond)
+        if isinstance(cond, list):
+            cond = {"all": cond}
+        if not isinstance(cond, dict):
             raise QAPISemError(
                 info,
-                "'if' condition of %s must be a string or a list of strings"
-                % source)
-        if not elt.strip():
+                "'if' condition of %s must be a string, "
+                "a list of strings or a dict" % source)
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
+        if oper == "not":
+            return IfNot(normalize(operands))
+        if not operands:
+            raise QAPISemError(
+                info, "'if' condition [] of %s is useless" % source)
+        if not isinstance(operands, list):
+            raise QAPISemError(
+                info, "'%s' condition of %s must be a list" % (oper, source))
+        operands = [normalize(o) for o in operands]
+        return IfAll(operands) if oper == "all" else IfAny(operands)
+
+    ifcond = expr.get('if')
+    if ifcond is None:
+        return
+    expr['if'] = normalize(ifcond)
 
 
 def normalize_members(members: object) -> None:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 366a53ab64..61664a4c5e 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -19,22 +19,15 @@
 import re
 from typing import Optional
 
-from .common import (
-    POINTER_SUFFIX,
-    IfAll,
-    IfOption,
-    c_name,
-    mcgen,
-)
+from .common import POINTER_SUFFIX, c_name, mcgen
 from .error import QAPISemError, QAPISourceError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
 
 
 class QAPISchemaIfCond:
-    def __init__(self, ifcond=None):
-        pred_list = [IfOption(opt) for opt in ifcond or []]
-        self.pred = IfAll(pred_list)
+    def __init__(self, pred=None):
+        self.pred = pred
 
     def gen_doc(self):
         if self.pred:
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
index 6bf996f539..ca7e53f3b5 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -12,15 +12,15 @@ enum QType
 module doc-good.json
 enum Enum
     member one
-        if IfAll(['defined(IFONE)'])
+        if 'defined(IFONE)'
     member two
-    if IfAll(['defined(IFCOND)'])
+    if 'defined(IFCOND)'
     feature enum-feat
 object Base
     member base1: Enum optional=False
 object Variant1
     member var1: str optional=False
-        if IfAll(['defined(IFSTR)'])
+        if 'defined(IFSTR)'
         feature member-feat
     feature variant1-feat
 object Variant2
@@ -29,7 +29,7 @@ object Object
     tag base1
     case one: Variant1
     case two: Variant2
-        if IfAll(['IFTWO'])
+        if 'IFTWO'
     feature union-feat1
 object q_obj_Variant1-wrapper
     member data: Variant1 optional=False
@@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
 enum SugaredUnionKind
     member one
     member two
-        if IfAll(['IFTWO'])
+        if 'IFTWO'
 object SugaredUnion
     member type: SugaredUnionKind optional=False
     tag type
     case one: q_obj_Variant1-wrapper
     case two: q_obj_Variant2-wrapper
-        if IfAll(['IFTWO'])
+        if 'IFTWO'
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
index f63b89535e..724a810086 100644
--- a/tests/qapi-schema/features-if-invalid.err
+++ b/tests/qapi-schema/features-if-invalid.err
@@ -1,2 +1,2 @@
 features-if-invalid.json: In struct 'Stru':
-features-if-invalid.json:2: 'if' condition of 'features' member 'f' must be a string or a list of strings
+features-if-invalid.json:2: 'if' condition of 'features' member 'f' must be a string, a list of strings or a dict
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 84b9d41f15..2d5e480b44 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -231,8 +231,8 @@
 
 { 'union': 'TestIfUnion', 'data':
   { 'foo': 'TestStruct',
-    'bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
-  'if': 'defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)' }
+    'union-bar': { 'type': 'str', 'if': 'defined(TEST_IF_UNION_BAR)'} },
+  'if': ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'] }
 
 { 'command': 'test-if-union-cmd',
   'data': { 'union-cmd-arg': 'TestIfUnion' },
@@ -241,11 +241,10 @@
 { 'alternate': 'TestIfAlternate', 'data':
   { 'foo': 'int',
     'bar': { 'type': 'TestStruct', 'if': 'defined(TEST_IF_ALT_BAR)'} },
-  'if': 'defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)' }
+  'if': {'all': ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'] } }
 
-{ 'command': 'test-if-alternate-cmd',
-  'data': { 'alt-cmd-arg': 'TestIfAlternate' },
-  'if': 'defined(TEST_IF_ALT)' }
+{ 'command': 'test-if-alternate-cmd', 'data': { 'alt-cmd-arg': 'TestIfAlternate' },
+  'if': {'all': ['defined(TEST_IF_ALT)', {'not': 'defined(TEST_IF_NOT_ALT)'}] } }
 
 { 'command': 'test-if-cmd',
   'data': {
@@ -259,7 +258,7 @@
 { 'event': 'TEST_IF_EVENT', 'data':
   { 'foo': 'TestIfStruct',
     'bar': { 'type': ['TestIfEnum'], 'if': 'defined(TEST_IF_EVT_BAR)' } },
-  'if': 'defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)' }
+  'if': ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'] }
 
 # test 'features'
 
@@ -290,6 +289,10 @@
   'data': { 'foo': 'int' },
   'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
                                               'defined(TEST_IF_COND_2)'] } ] }
+{ 'struct': 'CondFeatureStruct4',
+  'data': { 'foo': 'int' },
+  'features': [ { 'name': 'feature1', 'if': {'any': ['defined(TEST_IF_COND_1)',
+                                                     'defined(TEST_IF_COND_2)'] } } ] }
 
 { 'enum': 'FeatureEnum1',
   'data': [ 'eins', 'zwei', 'drei' ],
@@ -313,7 +316,8 @@
             '*fs4': 'FeatureStruct4',
             '*cfs1': 'CondFeatureStruct1',
             '*cfs2': 'CondFeatureStruct2',
-            '*cfs3': 'CondFeatureStruct3' },
+            '*cfs3': 'CondFeatureStruct3',
+            '*cfs4': 'CondFeatureStruct4' },
   'returns': 'FeatureStruct1',
   'features': [] }
 
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index c2d303aa18..f859bf648d 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -298,49 +298,49 @@ command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
 object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
-        if IfAll(['defined(TEST_IF_STRUCT_BAR)'])
-    if IfAll(['defined(TEST_IF_STRUCT)'])
+        if 'defined(TEST_IF_STRUCT_BAR)'
+    if 'defined(TEST_IF_STRUCT)'
 enum TestIfEnum
     member foo
     member bar
-        if IfAll(['defined(TEST_IF_ENUM_BAR)'])
-    if IfAll(['defined(TEST_IF_ENUM)'])
+        if 'defined(TEST_IF_ENUM_BAR)'
+    if 'defined(TEST_IF_ENUM)'
 object q_obj_TestStruct-wrapper
     member data: TestStruct optional=False
 enum TestIfUnionKind
     member foo
-    member bar
-        if IfAll(['defined(TEST_IF_UNION_BAR)'])
-    if IfAll(['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)'])
+    member union-bar
+        if 'defined(TEST_IF_UNION_BAR)'
+    if IfAll(['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
-    case bar: q_obj_str-wrapper
-        if IfAll(['defined(TEST_IF_UNION_BAR)'])
-    if IfAll(['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)'])
+    case union-bar: q_obj_str-wrapper
+        if 'defined(TEST_IF_UNION_BAR)'
+    if IfAll(['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if IfAll(['defined(TEST_IF_UNION)'])
+    if 'defined(TEST_IF_UNION)'
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if IfAll(['defined(TEST_IF_UNION)'])
+    if 'defined(TEST_IF_UNION)'
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
-        if IfAll(['defined(TEST_IF_ALT_BAR)'])
-    if IfAll(['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)'])
+        if 'defined(TEST_IF_ALT_BAR)'
+    if IfAll(['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if IfAll(['defined(TEST_IF_ALT)'])
+    if IfAll(['defined(TEST_IF_ALT)', IfNot('defined(TEST_IF_NOT_ALT)')])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if IfAll(['defined(TEST_IF_ALT)'])
+    if IfAll(['defined(TEST_IF_ALT)', IfNot('defined(TEST_IF_NOT_ALT)')])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-        if IfAll(['defined(TEST_IF_CMD_BAR)'])
+        if 'defined(TEST_IF_CMD_BAR)'
     if IfAll(['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
@@ -348,15 +348,15 @@ command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
-    if IfAll(['defined(TEST_IF_ENUM)'])
+    if 'defined(TEST_IF_ENUM)'
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
-        if IfAll(['defined(TEST_IF_EVT_BAR)'])
-    if IfAll(['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'])
+        if 'defined(TEST_IF_EVT_BAR)'
+    if IfAll(['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if IfAll(['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'])
+    if IfAll(['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -379,17 +379,21 @@ object FeatureStruct4
 object CondFeatureStruct1
     member foo: int optional=False
     feature feature1
-        if IfAll(['defined(TEST_IF_FEATURE_1)'])
+        if 'defined(TEST_IF_FEATURE_1)'
 object CondFeatureStruct2
     member foo: int optional=False
     feature feature1
-        if IfAll(['defined(TEST_IF_FEATURE_1)'])
+        if 'defined(TEST_IF_FEATURE_1)'
     feature feature2
-        if IfAll(['defined(TEST_IF_FEATURE_2)'])
+        if 'defined(TEST_IF_FEATURE_2)'
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
         if IfAll(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])
+object CondFeatureStruct4
+    member foo: int optional=False
+    feature feature1
+        if IfAny(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])
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
-        if IfAll(['defined(TEST_IF_FEATURE_1)'])
+        if 'defined(TEST_IF_FEATURE_1)'
 command test-command-cond-features2 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if IfAll(['defined(TEST_IF_FEATURE_1)'])
+        if 'defined(TEST_IF_FEATURE_1)'
     feature feature2
-        if IfAll(['defined(TEST_IF_FEATURE_2)'])
+        if 'defined(TEST_IF_FEATURE_2)'
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
diff --git a/tests/qapi-schema/struct-member-if-invalid.err b/tests/qapi-schema/struct-member-if-invalid.err
index 42e7fdae3c..c18157c1f9 100644
--- a/tests/qapi-schema/struct-member-if-invalid.err
+++ b/tests/qapi-schema/struct-member-if-invalid.err
@@ -1,2 +1,2 @@
 struct-member-if-invalid.json: In struct 'Stru':
-struct-member-if-invalid.json:2: 'if' condition of 'data' member 'member' must be a string or a list of strings
+struct-member-if-invalid.json:2: 'if' condition of 'data' member 'member' must be a string, a list of strings or a dict
-- 
2.29.0


