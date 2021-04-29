Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A6636EB84
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:46:43 +0200 (CEST)
Received: from localhost ([::1]:58868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc706-0001ik-Qe
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6uo-00058L-2z
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lc6uk-0002Tj-H8
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619703669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NIXK4EiT4FLgQJRcYl5hLwfRcRPBcJNMMBZTCVoTToQ=;
 b=Xbzt/H/hXKdFda+hFdsSucL0Qva5rIBQk0vki1TemHlZirGZYGHHoTIOEp+tUBrdC6z/DB
 W4tD/M8xORP40Uzhu7qvsqUbsqcoXwRqr6lryyv2XJEzw8mup5WDJW6PSh/lIu+f0lpO1M
 BnG0Iy4CeXYd4bYDW2cPnH9ptpwauq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-IFYTZ_OnOKqtPtq-UadTBQ-1; Thu, 29 Apr 2021 09:41:07 -0400
X-MC-Unique: IFYTZ_OnOKqtPtq-UadTBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 934108014C1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 13:41:06 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8057119EF1;
 Thu, 29 Apr 2021 13:41:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/9] qapi: start building an 'if' predicate tree
Date: Thu, 29 Apr 2021 17:40:26 +0400
Message-Id: <20210429134032.1125111-4-marcandre.lureau@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124;
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
---
 docs/sphinx/qapidoc.py                 |  6 +--
 scripts/qapi/common.py                 | 54 +++++++++++++++++++++++-
 scripts/qapi/schema.py                 | 42 ++++++++++++-------
 tests/qapi-schema/doc-good.out         | 12 +++---
 tests/qapi-schema/qapi-schema-test.out | 58 +++++++++++++-------------
 5 files changed, 116 insertions(+), 56 deletions(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index b737949007..a93f3f1c4d 100644
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
+        condlist = [nodes.literal('', ifcond.gen_doc())]
         if not with_if:
             return condlist
 
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index b7f475a160..59a7ee2f32 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -11,8 +11,9 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
+from abc import ABC, abstractmethod
 import re
-from typing import Optional
+from typing import Optional, Sequence
 
 
 #: Magic string that gets removed along with all space to its right.
@@ -192,3 +193,54 @@ def guardend(name: str) -> str:
 #endif /* %(name)s */
 ''',
                  name=c_fname(name).upper())
+
+
+class IfPredicate(ABC):
+    @abstractmethod
+    def cgen(self) -> str:
+        pass
+
+    @abstractmethod
+    def docgen(self) -> str:
+        pass
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
+        return repr(self.option)
+
+    def __eq__(self, other: object) -> bool:
+        if not isinstance(other, IfOption):
+            return False
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
+        return f"IfAll({self.pred_list})"
+
+    def __eq__(self, other: object) -> bool:
+        if not isinstance(other, IfAll):
+            return False
+        return self.pred_list == other.pred_list
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 8e6d0a5296..366a53ab64 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -19,7 +19,13 @@
 import re
 from typing import Optional
 
-from .common import POINTER_SUFFIX, c_name, mcgen
+from .common import (
+    POINTER_SUFFIX,
+    IfAll,
+    IfOption,
+    c_name,
+    mcgen,
+)
 from .error import QAPISemError, QAPISourceError
 from .expr import check_exprs
 from .parser import QAPISchemaParser
@@ -27,34 +33,38 @@
 
 class QAPISchemaIfCond:
     def __init__(self, ifcond=None):
-        self.ifcond = ifcond or []
+        pred_list = [IfOption(opt) for opt in ifcond or []]
+        self.pred = IfAll(pred_list)
+
+    def gen_doc(self):
+        if self.pred:
+            return self.pred.docgen()
+        return ""
 
     def gen_if(self):
-        ret = ''
-        for ifc in self.ifcond:
-            ret += mcgen('''
+        if self.pred:
+            return mcgen('''
 #if %(cond)s
-''', cond=ifc)
-        return ret
+''', cond=self.pred.cgen())
+        return ""
 
     def gen_endif(self):
-        ret = ''
-        for ifc in reversed(self.ifcond):
-            ret += mcgen('''
-#endif /* %(cond)s */
-''', cond=ifc)
-        return ret
+        if self.pred:
+            return mcgen('''
+#endif // %(cond)s
+''', cond=self.pred.cgen())
+        return ""
 
     def __bool__(self):
-        return bool(self.ifcond)
+        return bool(self.pred)
 
     def __repr__(self):
-        return repr(self.ifcond)
+        return repr(self.pred)
 
     def __eq__(self, other):
         if not isinstance(other, QAPISchemaIfCond):
             return NotImplemented
-        return self.ifcond == other.ifcond
+        return self.pred == other.pred
 
 
 class QAPISchemaEntity:
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 8f54ceff2e..6bf996f539 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -12,15 +12,15 @@ enum QType
 module doc-good.json
 enum Enum
     member one
-        if ['defined(IFONE)']
+        if IfAll(['defined(IFONE)'])
     member two
-    if ['defined(IFCOND)']
+    if IfAll(['defined(IFCOND)'])
     feature enum-feat
 object Base
     member base1: Enum optional=False
 object Variant1
     member var1: str optional=False
-        if ['defined(IFSTR)']
+        if IfAll(['defined(IFSTR)'])
         feature member-feat
     feature variant1-feat
 object Variant2
@@ -29,7 +29,7 @@ object Object
     tag base1
     case one: Variant1
     case two: Variant2
-        if ['IFTWO']
+        if IfAll(['IFTWO'])
     feature union-feat1
 object q_obj_Variant1-wrapper
     member data: Variant1 optional=False
@@ -38,13 +38,13 @@ object q_obj_Variant2-wrapper
 enum SugaredUnionKind
     member one
     member two
-        if ['IFTWO']
+        if IfAll(['IFTWO'])
 object SugaredUnion
     member type: SugaredUnionKind optional=False
     tag type
     case one: q_obj_Variant1-wrapper
     case two: q_obj_Variant2-wrapper
-        if ['IFTWO']
+        if IfAll(['IFTWO'])
     feature union-feat2
 alternate Alternate
     tag type
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index e0b8a5f0b6..c2d303aa18 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -298,65 +298,65 @@ command __org.qemu_x-command q_obj___org.qemu_x-command-arg -> __org.qemu_x-Unio
 object TestIfStruct
     member foo: int optional=False
     member bar: int optional=False
-        if ['defined(TEST_IF_STRUCT_BAR)']
-    if ['defined(TEST_IF_STRUCT)']
+        if IfAll(['defined(TEST_IF_STRUCT_BAR)'])
+    if IfAll(['defined(TEST_IF_STRUCT)'])
 enum TestIfEnum
     member foo
     member bar
-        if ['defined(TEST_IF_ENUM_BAR)']
-    if ['defined(TEST_IF_ENUM)']
+        if IfAll(['defined(TEST_IF_ENUM_BAR)'])
+    if IfAll(['defined(TEST_IF_ENUM)'])
 object q_obj_TestStruct-wrapper
     member data: TestStruct optional=False
 enum TestIfUnionKind
     member foo
     member bar
-        if ['defined(TEST_IF_UNION_BAR)']
-    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
+        if IfAll(['defined(TEST_IF_UNION_BAR)'])
+    if IfAll(['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)'])
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
     case bar: q_obj_str-wrapper
-        if ['defined(TEST_IF_UNION_BAR)']
-    if ['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)']
+        if IfAll(['defined(TEST_IF_UNION_BAR)'])
+    if IfAll(['defined(TEST_IF_UNION) && defined(TEST_IF_STRUCT)'])
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if ['defined(TEST_IF_UNION)']
+    if IfAll(['defined(TEST_IF_UNION)'])
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_UNION)']
+    if IfAll(['defined(TEST_IF_UNION)'])
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
-        if ['defined(TEST_IF_ALT_BAR)']
-    if ['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)']
+        if IfAll(['defined(TEST_IF_ALT_BAR)'])
+    if IfAll(['defined(TEST_IF_ALT) && defined(TEST_IF_STRUCT)'])
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if ['defined(TEST_IF_ALT)']
+    if IfAll(['defined(TEST_IF_ALT)'])
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_ALT)']
+    if IfAll(['defined(TEST_IF_ALT)'])
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
-        if ['defined(TEST_IF_CMD_BAR)']
-    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
+        if IfAll(['defined(TEST_IF_CMD_BAR)'])
+    if IfAll(['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if ['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)']
+    if IfAll(['defined(TEST_IF_CMD)', 'defined(TEST_IF_STRUCT)'])
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
-    if ['defined(TEST_IF_ENUM)']
+    if IfAll(['defined(TEST_IF_ENUM)'])
 object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
-        if ['defined(TEST_IF_EVT_BAR)']
-    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
+        if IfAll(['defined(TEST_IF_EVT_BAR)'])
+    if IfAll(['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'])
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
+    if IfAll(['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)'])
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -379,17 +379,17 @@ object FeatureStruct4
 object CondFeatureStruct1
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if IfAll(['defined(TEST_IF_FEATURE_1)'])
 object CondFeatureStruct2
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if IfAll(['defined(TEST_IF_FEATURE_1)'])
     feature feature2
-        if ['defined(TEST_IF_FEATURE_2)']
+        if IfAll(['defined(TEST_IF_FEATURE_2)'])
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
-        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+        if IfAll(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])
 enum FeatureEnum1
     member eins
     member zwei
@@ -429,17 +429,17 @@ command test-command-features3 None -> None
 command test-command-cond-features1 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if IfAll(['defined(TEST_IF_FEATURE_1)'])
 command test-command-cond-features2 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_FEATURE_1)']
+        if IfAll(['defined(TEST_IF_FEATURE_1)'])
     feature feature2
-        if ['defined(TEST_IF_FEATURE_2)']
+        if IfAll(['defined(TEST_IF_FEATURE_2)'])
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+        if IfAll(['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)'])
 event TEST_EVENT_FEATURES0 FeatureStruct1
     boxed=False
 event TEST_EVENT_FEATURES1 None
-- 
2.29.0


