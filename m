Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC639383A8B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:53:10 +0200 (CEST)
Received: from localhost ([::1]:50258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligUP-000484-Vi
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig9E-0005VE-JZ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lig96-0006Cj-VA
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3p6oZLtfKXssKE4KQTFfOTWuUvhe0w/zeYWcIkEIe/M=;
 b=Hh+XfrxLcCdkk8EQY18OCO/iy0Jm/tcGY96ONLZPyKzHqlRqkjSHfMGjmLm6/OwPXJnhZB
 27Ye5ekVIy3fed5F5U3o5Kh9M5BgPpaUUzl0KwLhI2mKhRUhI+qAAkZLF/U/DgvPxUa+i7
 2BfELbdS9CJq+aGJhveKMa786CX4V/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-xmiNqUNxPVaGOa7cNbvmLQ-1; Mon, 17 May 2021 12:31:06 -0400
X-MC-Unique: xmiNqUNxPVaGOa7cNbvmLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEEB59F933
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:31:03 +0000 (UTC)
Received: from localhost (unknown [10.36.110.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22B2210027C4;
 Mon, 17 May 2021 16:31:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/9] qapi: start building an 'if' predicate tree
Date: Mon, 17 May 2021 20:30:34 +0400
Message-Id: <20210517163040.2308926-4-marcandre.lureau@redhat.com>
In-Reply-To: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 jsnow@redhat.com, Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following patches are going to express schema 'if' conditions in a
target language agnostic way. For that, let's start building a predicate
tree of the configuration options.

This intermediary steps still uses C-preprocessor expressions as
the predicates:

"if: [STR, ..]" is translated to a "IfCond -> IfAll ->
[IfOption, ..]" tree, which will generate "#if STR && .." C code.

Once the boolean operation tree nodes are introduced, the 'if'
expressions will be converted to replace the C syntax (no more
!defined(), &&, ...) and based only on option identifiers.

For now, the condition tree will be less expressive than a full C macro
expression as it will only support these operations: 'all', 'any' and
'not', the only ones needed so far.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>
---
 docs/sphinx/qapidoc.py                 |  6 +--
 scripts/qapi/common.py                 | 51 ++++++++++++++++++++++
 scripts/qapi/schema.py                 | 17 ++++++--
 tests/qapi-schema/doc-good.out         | 12 +++---
 tests/qapi-schema/qapi-schema-test.out | 58 +++++++++++++-------------
 tests/qapi-schema/test-qapi.py         |  2 +-
 6 files changed, 102 insertions(+), 44 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index b737949007..0f87fb16ce 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -112,12 +112,10 @@ def _make_section(self, title):
     def _nodes_for_ifcond(self, ifcond, with_if=True):
         """Return list of Text, literal nodes for the ifcond
 
-        Return a list which gives text like ' (If: cond1, cond2, cond3)', where
-        the conditions are in literal-text and the commas are not.
+        Return a list which gives text like ' (If: condition)'.
         If with_if is False, we don't return the "(If: " and ")".
         """
-        condlist = intersperse([nodes.literal('', c) for c in ifcond.ifcond],
-                               nodes.Text(', '))
+        condlist = [nodes.literal('', ifcond.docgen())]
         if not with_if:
             return condlist
 
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 9ab1c9ca55..86dc2b228b 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -208,3 +208,54 @@ def gen_endif(cond: str) -> str:
     return mcgen('''
 #endif /* %(cond)s */
 ''', cond=cond)
+
+
+class IfPredicate:
+    """An 'if' condition predicate"""
+
+    def cgen(self) -> str:
+        raise NotImplementedError()
+
+    def docgen(self) -> str:
+        raise NotImplementedError()
+
+
+class IfOption(IfPredicate):
+    def __init__(self, option: str):
+        self.option = option
+
+    def cgen(self) -> str:
+        return self.option
+
+    def docgen(self) -> str:
+        return self.option
+
+    def __repr__(self) -> str:
+        return f"{type(self).__name__}({self.option!r})"
+
+    def __eq__(self, other: object) -> bool:
+        if not isinstance(other, IfOption):
+            return NotImplemented
+        return self.option == other.option
+
+
+class IfAll(IfPredicate):
+    def __init__(self, pred_list: Sequence[IfPredicate]):
+        self.pred_list = pred_list
+
+    def cgen(self) -> str:
+        return " && ".join([p.cgen() for p in self.pred_list])
+
+    def docgen(self) -> str:
+        return " and ".join([p.docgen() for p in self.pred_list])
+
+    def __bool__(self) -> bool:
+        return bool(self.pred_list)
+
+    def __repr__(self) -> str:
+        return f"{type(self).__name__}({self.pred_list!r})"
+
+    def __eq__(self, other: object) -> bool:
+        if not isinstance(other, IfAll):
+            return NotImplemented
+        return self.pred_list == other.pred_list
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 0a187ba3f0..0c9675f3a2 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -19,7 +19,12 @@
 import re
 from typing import Optional
 
-from .common import POINTER_SUFFIX, c_name
+from .common import (
+    POINTER_SUFFIX,
+    IfAll,
+    IfOption,
+    c_name,
+)
 from .error import QAPISemError, QAPISourceError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
@@ -28,18 +33,22 @@
 class QAPISchemaIfCond:
     def __init__(self, ifcond=None):
         self.ifcond = ifcond or []
+        self.pred = IfAll([IfOption(opt) for opt in self.ifcond])
+
+    def docgen(self):
+        return self.pred.docgen()
 
     def cgen(self):
-        return ' && '.join([i for i in self.ifcond])
+        return self.pred.cgen()
 
     # Returns true if the condition is not void
     def __bool__(self):
-        return bool(self.ifcond)
+        return bool(self.pred)
 
     def __eq__(self, other):
         if not isinstance(other, QAPISchemaIfCond):
             return NotImplemented
-        return self.ifcond == other.ifcond
+        return self.pred == other.pred
 
 
 class QAPISchemaEntity:
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 8f54ceff2e..db1d23c6bf 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -12,15 +12,15 @@ enum QType
 module doc-good.json
 enum Enum
     member one
-        if ['defined(IFONE)']
+        if IfAll([IfOption('defined(IFONE)')])
     member two
-    if ['defined(IFCOND)']
+    if IfAll([IfOption('defined(IFCOND)')])
     feature enum-feat
 object Base
     member base1: Enum optional=False
 object Variant1
     member var1: str optional=False
-        if ['defined(IFSTR)']
+        if IfAll([IfOption('defined(IFSTR)')])
         feature member-feat
     feature variant1-feat
 object Variant2
@@ -29,7 +29,7 @@ object Object
     tag base1
     case one: Variant1
     case two: Variant2
-        if ['IFTWO']
+        if IfAll([IfOption('IFTWO')])
     feature union-feat1
 object q_obj_Variant1-wrapper
     member data: Variant1 optional=False
@@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
 enum SugaredUnionKind
     member one
     member two
-        if ['IFTWO']
+        if IfAll([IfOption('IFTWO')])
 object SugaredUnion
     member type: SugaredUnionKind optional=False
     tag type
     case one: q_obj_Variant1-wrapper
     case two: q_obj_Variant2-wrapper
-        if ['IFTWO']
+        if IfAll([IfOption('IFTWO')])
     feature union-feat2
 alternate Alternate
     tag type
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index e0b8a5f0b6..e4e0fb173a 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
 object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
-        if ['defined(TEST_IF_STRUCT_BAR)']
-    if ['defined(TEST_IF_STRUCT)']
+        if IfAll([IfOption('defined(TEST_IF_STRUCT_BAR)')])
+    if IfAll([IfOption('defined(TEST_IF_STRUCT)')])
 enum TestIfEnum
     member foo
     member bar
-        if ['defined(TEST_IF_ENUM_BAR)']
-    if ['defined(TEST_IF_ENUM)']
+        if IfAll([IfOption('defined(TEST_IF_ENUM_BAR)')])
+    if IfAll([IfOption('defined(TEST_IF_ENUM)')])
 object q_obj_TestStruct-wrapper
     member data: TestStruct optional=False
 enum TestIfUnionKind
     member foo
     member bar
-        if ['defined(TEST_IF_UNION_BAR)']
-    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
+        if IfAll([IfOption('defined(TEST_IF_UNION_BAR)')])
+    if IfAll([IfOption('defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)')])
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
     case bar: q_obj_str-wrapper
-        if ['defined(TEST_IF_UNION_BAR)']
-    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
+        if IfAll([IfOption('defined(TEST_IF_UNION_BAR)')])
+    if IfAll([IfOption('defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)')])
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if ['defined(TEST_IF_UNION)']
+    if IfAll([IfOption('defined(TEST_IF_UNION)')])
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_UNION)']
+    if IfAll([IfOption('defined(TEST_IF_UNION)')])
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
-        if ['defined(TEST_IF_ALT_BAR)']
-    if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
+        if IfAll([IfOption('defined(TEST_IF_ALT_BAR)')])
+    if IfAll([IfOption('defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)')])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if ['defined(TEST_IF_ALT)']
+    if IfAll([IfOption('defined(TEST_IF_ALT)')])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_ALT)']
+    if IfAll([IfOption('defined(TEST_IF_ALT)')])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-        if ['defined(TEST_IF_CMD_BAR)']
-    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
+        if IfAll([IfOption('defined(TEST_IF_CMD_BAR)')])
+    if IfAll([IfOption('defined(TEST_IF_CMD)'), IfOption('defined(TEST_IF_STRUCT)')])
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
+    if IfAll([IfOption('defined(TEST_IF_CMD)'), IfOption('defined(TEST_IF_STRUCT)')])
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
-    if ['defined(TEST_IF_ENUM)']
+    if IfAll([IfOption('defined(TEST_IF_ENUM)')])
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
-        if ['defined(TEST_IF_EVT_BAR)']
-    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
+        if IfAll([IfOption('defined(TEST_IF_EVT_BAR)')])
+    if IfAll([IfOption('defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)')])
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
+    if IfAll([IfOption('defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)')])
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -379,17 +379,17 @@ object FeatureStruct4
 object CondFeatureStruct1
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
 object CondFeatureStruct2
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
     feature feature2
-        if ['defined(TEST_IF_FEATURE_2)']
+        if IfAll([IfOption('defined(TEST_IF_FEATURE_2)')])
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+        if IfAll([IfOption('defined(TEST_IF_COND_1)'), IfOption('defined(TEST_IF_COND_2)')])
 enum FeatureEnum1
     member eins
     member zwei
@@ -429,17 +429,17 @@ command test-command-features3 None -> None
 command test-command-cond-features1 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
 command test-command-cond-features2 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if IfAll([IfOption('defined(TEST_IF_FEATURE_1)')])
     feature feature2
-        if ['defined(TEST_IF_FEATURE_2)']
+        if IfAll([IfOption('defined(TEST_IF_FEATURE_2)')])
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+        if IfAll([IfOption('defined(TEST_IF_COND_1)'), IfOption('defined(TEST_IF_COND_2)')])
 event TEST_EVENT_FEATURES0 FeatureStruct1
     boxed=False
 event TEST_EVENT_FEATURES1 None
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index fee37b2bc8..9a652822bd 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -95,7 +95,7 @@ def _print_variants(variants):
     @staticmethod
     def _print_if(ifcond, indent=4):
         if ifcond:
-            print('%sif %s' % (' ' * indent, ifcond.ifcond))
+            print('%sif %s' % (' ' * indent, ifcond.pred))
 
     @classmethod
     def _print_features(cls, features, indent=4):
-- 
2.29.0


