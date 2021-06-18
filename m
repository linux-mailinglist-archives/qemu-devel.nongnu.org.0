Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961A53AC8DF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:32:23 +0200 (CEST)
Received: from localhost ([::1]:50490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luBnS-0004iD-Er
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBiF-0006C9-O2
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1luBi7-0000qW-Oj
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:26:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624012011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5OSsJwSlKIOkLsHT5bVqk5l4MYBP0BPsfHaIIYhkCEE=;
 b=RRu4IsIDJ+o73CvEBBJW8T9vA4JzbxQcX9WMeWRYVNLnWKC1FFOxecnEIE2GS7838ytg0a
 NCnMekaYRR6KPGBx0G1ZDHDzVQUAdtLmifvtSgsR6cZlnvitbN2H/4CZEHPgS/7opuYiAA
 WmutkY1YXXDzfua7UyVmoMJ5vOUrClc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-BqxhvwXPMeK9DJhtjg1v7g-1; Fri, 18 Jun 2021 06:26:49 -0400
X-MC-Unique: BqxhvwXPMeK9DJhtjg1v7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D07E80ED8B
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 10:26:49 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12C6E5C22A;
 Fri, 18 Jun 2021 10:26:40 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/11] qapi: replace if condition list with dict {'all':
 [...]}
Date: Fri, 18 Jun 2021 14:25:03 +0400
Message-Id: <20210618102507.3761128-8-marcandre.lureau@redhat.com>
In-Reply-To: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
References: <20210618102507.3761128-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Replace the simple list sugar form with a recursive structure that will
accept other operators in the following commits (all, any or not).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 scripts/qapi/common.py                        | 23 +++++--
 scripts/qapi/expr.py                          | 52 ++++++++++------
 scripts/qapi/schema.py                        |  2 +-
 tests/qapi-schema/bad-if-empty-list.json      |  2 +-
 tests/qapi-schema/bad-if-list.json            |  2 +-
 tests/qapi-schema/bad-if.err                  |  3 +-
 tests/qapi-schema/doc-good.json               |  3 +-
 tests/qapi-schema/doc-good.out                | 13 ++--
 tests/qapi-schema/doc-good.txt                |  6 ++
 tests/qapi-schema/enum-if-invalid.err         |  3 +-
 tests/qapi-schema/features-if-invalid.err     |  2 +-
 tests/qapi-schema/qapi-schema-test.json       | 25 ++++----
 tests/qapi-schema/qapi-schema-test.out        | 62 +++++++++----------
 .../qapi-schema/struct-member-if-invalid.err  |  2 +-
 .../qapi-schema/union-branch-if-invalid.json  |  2 +-
 15 files changed, 119 insertions(+), 83 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 5181a0f167..51463510c9 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -13,7 +13,8 @@
 
 import re
 from typing import (
-    List,
+    Any,
+    Dict,
     Match,
     Optional,
     Union,
@@ -199,16 +200,28 @@ def guardend(name: str) -> str:
                  name=c_fname(name).upper())
 
 
-def cgen_ifcond(ifcond: Union[str, List[str]]) -> str:
+def docgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
     if not ifcond:
         return ''
-    return '(' + ') && ('.join(ifcond) + ')'
+    if isinstance(ifcond, str):
+        return ifcond
 
+    oper, operands = next(iter(ifcond.items()))
+    oper = {'all': ' and '}[oper]
+    operands = [docgen_ifcond(o) for o in operands]
+    return '(' + oper.join(operands) + ')'
 
-def docgen_ifcond(ifcond: Union[str, List[str]]) -> str:
+
+def cgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
     if not ifcond:
         return ''
-    return ' and '.join(ifcond)
+    if isinstance(ifcond, str):
+        return ifcond
+
+    oper, operands = next(iter(ifcond.items()))
+    oper = {'all': '&&'}[oper]
+    operands = [cgen_ifcond(o) for o in operands]
+    return '(' + (') ' + oper + ' (').join(operands) + ')'
 
 
 def gen_if(cond: str) -> str:
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 496f7e0333..3ee66c5f62 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -259,14 +259,12 @@ def check_flags(expr: _JSONObject, info: QAPISourceInfo) -> None:
 
 def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
     """
-    Normalize and validate the ``if`` member of an object.
+    Validate the ``if`` member of an object.
 
-    The ``if`` member may be either a ``str`` or a ``List[str]``.
-    A ``str`` value will be normalized to ``List[str]``.
+    The ``if`` member may be either a ``str`` or a dict.
 
     :forms:
-      :sugared: ``Union[str, List[str]]``
-      :canonical: ``List[str]``
+      :canonical: ``Union[str, dict]``
 
     :param expr: The expression containing the ``if`` member to validate.
     :param info: QAPI schema source file information.
@@ -275,31 +273,45 @@ def check_if(expr: _JSONObject, info: QAPISourceInfo, source: str) -> None:
     :raise QAPISemError:
         When the "if" member fails validation, or when there are no
         non-empty conditions.
-    :return: None, ``expr`` is normalized in-place as needed.
+    :return: None
     """
     ifcond = expr.get('if')
     if ifcond is None:
         return
 
-    if isinstance(ifcond, list):
-        if not ifcond:
-            raise QAPISemError(
-                info, "'if' condition [] of %s is useless" % source)
-    else:
-        # Normalize to a list
-        ifcond = expr['if'] = [ifcond]
+    def _check_if(cond: Union[str, object]) -> None:
+        if isinstance(cond, str):
+            if not cond.strip():
+                raise QAPISemError(
+                    info,
+                    "'if' condition '%s' of %s makes no sense"
+                    % (cond, source))
+            return
 
-    for elt in ifcond:
-        if not isinstance(elt, str):
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
+                "'all'" % source)
+        check_keys(cond, info, "'if' condition", [],
+                   ["all"])
+
+        oper, operands = next(iter(cond.items()))
+        if not operands:
+            raise QAPISemError(
+                info, "'if' condition [] of %s is useless" % source)
+
+        if oper in ("all") and not isinstance(operands, list):
+            raise QAPISemError(
+                info, "'%s' condition of %s must be a list" % (oper, source))
+        for operand in operands:
+            _check_if(operand)
+
+    _check_if(ifcond)
 
 
 def normalize_members(members: object) -> None:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 30d6a01ad1..d2fbdbe583 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -32,7 +32,7 @@
 
 class QAPISchemaIfCond:
     def __init__(self, ifcond=None):
-        self.ifcond = ifcond or []
+        self.ifcond = ifcond or {}
 
     def cgen(self):
         return cgen_ifcond(self.ifcond)
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
index f83dee65da..8278c49368 100644
--- a/tests/qapi-schema/bad-if.err
+++ b/tests/qapi-schema/bad-if.err
@@ -1,2 +1,3 @@
 bad-if.json: In struct 'TestIfStruct':
-bad-if.json:2: 'if' condition of struct must be a string or a list of strings
+bad-if.json:2: 'if' condition has unknown key 'value'
+Valid keys are 'all'.
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 423ea23e07..25b1053e8a 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -70,7 +70,8 @@
 # @base1:
 # the first member
 ##
-{ 'struct': 'Base', 'data': { 'base1': 'Enum' } }
+{ 'struct': 'Base', 'data': { 'base1': 'Enum' },
+  'if': { 'all': ['IFALL1', 'IFALL2'] } }
 
 ##
 # @Variant1:
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 8f54ceff2e..689d084f3a 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -12,15 +12,16 @@ enum QType
 module doc-good.json
 enum Enum
     member one
-        if ['defined(IFONE)']
+        if defined(IFONE)
     member two
-    if ['defined(IFCOND)']
+    if defined(IFCOND)
     feature enum-feat
 object Base
     member base1: Enum optional=False
+    if OrderedDict([('all', ['IFALL1', 'IFALL2'])])
 object Variant1
     member var1: str optional=False
-        if ['defined(IFSTR)']
+        if defined(IFSTR)
         feature member-feat
     feature variant1-feat
 object Variant2
@@ -29,7 +30,7 @@ object Object
     tag base1
     case one: Variant1
     case two: Variant2
-        if ['IFTWO']
+        if IFTWO
     feature union-feat1
 object q_obj_Variant1-wrapper
     member data: Variant1 optional=False
@@ -38,13 +39,13 @@ object q_obj_Variant2-wrapper
 enum SugaredUnionKind
     member one
     member two
-        if ['IFTWO']
+        if IFTWO
 object SugaredUnion
     member type: SugaredUnionKind optional=False
     tag type
     case one: q_obj_Variant1-wrapper
     case two: q_obj_Variant2-wrapper
-        if ['IFTWO']
+        if IFTWO
     feature union-feat2
 alternate Alternate
     tag type
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 726727af74..4490108cb7 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -76,6 +76,12 @@ Members
    the first member
 
 
+If
+~~
+
+"(IFALL1 and IFALL2)"
+
+
 "Variant1" (Object)
 -------------------
 
diff --git a/tests/qapi-schema/enum-if-invalid.err b/tests/qapi-schema/enum-if-invalid.err
index 0556dc967b..df305cd79f 100644
--- a/tests/qapi-schema/enum-if-invalid.err
+++ b/tests/qapi-schema/enum-if-invalid.err
@@ -1,2 +1,3 @@
 enum-if-invalid.json: In enum 'TestIfEnum':
-enum-if-invalid.json:2: 'if' condition of 'data' member 'bar' must be a string or a list of strings
+enum-if-invalid.json:2: 'if' condition has unknown key 'val'
+Valid keys are 'all'.
diff --git a/tests/qapi-schema/features-if-invalid.err b/tests/qapi-schema/features-if-invalid.err
index f63b89535e..8b64318df6 100644
--- a/tests/qapi-schema/features-if-invalid.err
+++ b/tests/qapi-schema/features-if-invalid.err
@@ -1,2 +1,2 @@
 features-if-invalid.json: In struct 'Stru':
-features-if-invalid.json:2: 'if' condition of 'features' member 'f' must be a string or a list of strings
+features-if-invalid.json:2: 'if' condition of 'features' member 'f' must be a string or a dict
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 84b9d41f15..f2e0fff51f 100644
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
+  'if': { 'all': ['defined(TEST_IF_ALT)'] } }
 
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
 
@@ -288,8 +287,9 @@
                 { 'name': 'feature2', 'if': 'defined(TEST_IF_FEATURE_2)'} ] }
 { 'struct': 'CondFeatureStruct3',
   'data': { 'foo': 'int' },
-  'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
-                                              'defined(TEST_IF_COND_2)'] } ] }
+  'features': [ { 'name': 'feature1',
+                  'if': { 'all': [ 'defined(TEST_IF_COND_1)',
+                                   'defined(TEST_IF_COND_2)'] } } ] }
 
 { 'enum': 'FeatureEnum1',
   'data': [ 'eins', 'zwei', 'drei' ],
@@ -328,8 +328,9 @@
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
index e0b8a5f0b6..6a1b3aa341 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
 object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
-        if ['defined(TEST_IF_STRUCT_BAR)']
-    if ['defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_STRUCT_BAR)
+    if defined(TEST_IF_STRUCT)
 enum TestIfEnum
     member foo
     member bar
-        if ['defined(TEST_IF_ENUM_BAR)']
-    if ['defined(TEST_IF_ENUM)']
+        if defined(TEST_IF_ENUM_BAR)
+    if defined(TEST_IF_ENUM)
 object q_obj_TestStruct-wrapper
     member data: TestStruct optional=False
 enum TestIfUnionKind
     member foo
-    member bar
-        if ['defined(TEST_IF_UNION_BAR)']
-    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
+    member union-bar
+        if defined(TEST_IF_UNION_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])])
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
-    case bar: q_obj_str-wrapper
-        if ['defined(TEST_IF_UNION_BAR)']
-    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
+    case union-bar: q_obj_str-wrapper
+        if defined(TEST_IF_UNION_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_UNION)', 'defined(TEST_IF_STRUCT)'])])
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if ['defined(TEST_IF_UNION)']
+    if defined(TEST_IF_UNION)
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_UNION)']
+    if defined(TEST_IF_UNION)
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
-        if ['defined(TEST_IF_ALT_BAR)']
-    if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_ALT_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_ALT)', 'defined(TEST_IF_STRUCT)'])])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if ['defined(TEST_IF_ALT)']
+    if OrderedDict([('all', ['defined(TEST_IF_ALT)'])])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_ALT)']
+    if OrderedDict([('all', ['defined(TEST_IF_ALT)'])])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-        if ['defined(TEST_IF_CMD_BAR)']
-    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_CMD_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])])
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
+    if OrderedDict([('all', ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])])
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
-    if ['defined(TEST_IF_ENUM)']
+    if defined(TEST_IF_ENUM)
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
-        if ['defined(TEST_IF_EVT_BAR)']
-    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
+        if defined(TEST_IF_EVT_BAR)
+    if OrderedDict([('all', ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])])
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
+    if OrderedDict([('all', ['defined(TEST_IF_EVT)', 'defined(TEST_IF_STRUCT)'])])
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -379,17 +379,17 @@ object FeatureStruct4
 object CondFeatureStruct1
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if defined(TEST_IF_FEATURE_1)
 object CondFeatureStruct2
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if defined(TEST_IF_FEATURE_1)
     feature feature2
-        if ['defined(TEST_IF_FEATURE_2)']
+        if defined(TEST_IF_FEATURE_2)
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+        if OrderedDict([('all', ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])])
 enum FeatureEnum1
     member eins
     member zwei
@@ -429,17 +429,17 @@ command test-command-features3 None -> None
 command test-command-cond-features1 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if defined(TEST_IF_FEATURE_1)
 command test-command-cond-features2 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if defined(TEST_IF_FEATURE_1)
     feature feature2
-        if ['defined(TEST_IF_FEATURE_2)']
+        if defined(TEST_IF_FEATURE_2)
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+        if OrderedDict([('all', ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])])
 event TEST_EVENT_FEATURES0 FeatureStruct1
     boxed=False
 event TEST_EVENT_FEATURES1 None
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


