Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7FA3FC829
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:24:21 +0200 (CEST)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3kS-00005x-Dq
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL325-0006MC-ET
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL320-0005JQ-2V
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630413502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3JUYRbr5dZuubNYJzOj/7pOZ8Gtrknv+bcLtyOWrn4=;
 b=WHS028Z69J6nDSA+UcewIm04Wo31RK766eqTeaO9hy9v7EtlW/2NXfm6suLKbWdpvs/gwO
 bFtI2+Gm+LPtgaL2En7krqM8TTtPDT0QRHcQCg5ECveU7BQSWaHpDW4ZDkZHTbbHQkGt6U
 8prMsSoVtgRoq/71O8ktBy4C0AtJeys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-h7k3-06UPRWhLG9hM7Aq0g-1; Tue, 31 Aug 2021 08:38:21 -0400
X-MC-Unique: h7k3-06UPRWhLG9hM7Aq0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E79C92504;
 Tue, 31 Aug 2021 12:38:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8476F27CA8;
 Tue, 31 Aug 2021 12:38:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79FEB11380CC; Tue, 31 Aug 2021 14:38:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/12] tests/qapi-schema: Hide OrderedDict in test output
Date: Tue, 31 Aug 2021 14:38:07 +0200
Message-Id: <20210831123809.1107782-11-armbru@redhat.com>
In-Reply-To: <20210831123809.1107782-1-armbru@redhat.com>
References: <20210831123809.1107782-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, michael.roth@amd.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 5d83b9a130 "qapi: replace if condition list with dict
{'all': [...]}", we represent if conditionals as trees consisting of
OrderedDict, list and str.  This results in less than legible test
output.  For instance:

    if OrderedDict([('not', OrderedDict([('any', [OrderedDict([('not', 'TEST_IF_EVT')]), OrderedDict([('not', 'TEST_IF_STRUCT')])])]))])

We intend to replace OrderedDict by dict when we get Python 3.7, which
will result in more legible output:

    if {'not': {'any': [{'not': 'TEST_IF_EVT'}, {'not': 'TEST_IF_STRUCT'}]}}

Can't wait: put in a hack to get that now, with a comment to revert it
when we replace OrderedDict.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/doc-good.out         |  6 +++---
 tests/qapi-schema/qapi-schema-test.out | 30 +++++++++++++-------------
 tests/qapi-schema/test-qapi.py         | 11 +++++++++-
 3 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index d72f3047e9..478fe6f82e 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -18,7 +18,7 @@ enum Enum
     feature enum-feat
 object Base
     member base1: Enum optional=False
-    if OrderedDict([('all', ['IFALL1', 'IFALL2'])])
+    if {'all': ['IFALL1', 'IFALL2']}
 object Variant1
     member var1: str optional=False
         if IFSTR
@@ -30,7 +30,7 @@ object Object
     tag base1
     case one: Variant1
     case two: Variant2
-        if OrderedDict([('any', ['IFONE', 'IFTWO'])])
+        if {'any': ['IFONE', 'IFTWO']}
     feature union-feat1
 object q_obj_Variant1-wrapper
     member data: Variant1 optional=False
@@ -51,7 +51,7 @@ alternate Alternate
     tag type
     case i: int
     case b: bool
-    if OrderedDict([('not', OrderedDict([('any', ['IFONE', 'IFTWO'])]))])
+    if {'not': {'any': ['IFONE', 'IFTWO']}}
     feature alt-feat
 object q_obj_cmd-arg
     member arg1: int optional=False
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 5d2e830ba2..d557fe2d89 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -311,40 +311,40 @@ enum TestIfUnionKind
     member foo
     member bar
         if TEST_IF_UNION_BAR
-    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 object TestIfUnion
     member type: TestIfUnionKind optional=False
     tag type
     case foo: q_obj_TestStruct-wrapper
     case bar: q_obj_str-wrapper
         if TEST_IF_UNION_BAR
-    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 object q_obj_test-if-union-cmd-arg
     member union-cmd-arg: TestIfUnion optional=False
-    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 command test-if-union-cmd q_obj_test-if-union-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['TEST_IF_UNION', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_UNION', 'TEST_IF_STRUCT']}
 alternate TestIfAlternate
     tag type
     case foo: int
     case bar: TestStruct
         if TEST_IF_ALT_BAR
-    if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT']}
 object q_obj_test-if-alternate-cmd-arg
     member alt-cmd-arg: TestIfAlternate optional=False
-    if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT']}
 command test-if-alternate-cmd q_obj_test-if-alternate-cmd-arg -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['TEST_IF_ALT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_ALT', 'TEST_IF_STRUCT']}
 object q_obj_test-if-cmd-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnum optional=False
         if TEST_IF_CMD_BAR
-    if OrderedDict([('all', ['TEST_IF_CMD', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT']}
 command test-if-cmd q_obj_test-if-cmd-arg -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
-    if OrderedDict([('all', ['TEST_IF_CMD', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_CMD', 'TEST_IF_STRUCT']}
 command test-cmd-return-def-three None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
@@ -353,13 +353,13 @@ object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
         if TEST_IF_EVT_BAR
-    if OrderedDict([('all', ['TEST_IF_EVT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
 event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
-    if OrderedDict([('all', ['TEST_IF_EVT', 'TEST_IF_STRUCT'])])
+    if {'all': ['TEST_IF_EVT', 'TEST_IF_STRUCT']}
 event TEST_IF_EVENT2 None
     boxed=False
-    if OrderedDict([('not', OrderedDict([('any', [OrderedDict([('not', 'TEST_IF_EVT')]), OrderedDict([('not', 'TEST_IF_STRUCT')])])]))])
+    if {'not': {'any': [{'not': 'TEST_IF_EVT'}, {'not': 'TEST_IF_STRUCT'}]}}
 object FeatureStruct0
     member foo: int optional=False
 object FeatureStruct1
@@ -392,11 +392,11 @@ object CondFeatureStruct2
 object CondFeatureStruct3
     member foo: int optional=False
     feature feature1
-        if OrderedDict([('all', ['TEST_IF_COND_1', 'TEST_IF_COND_2'])])
+        if {'all': ['TEST_IF_COND_1', 'TEST_IF_COND_2']}
 object CondFeatureStruct4
     member foo: int optional=False
     feature feature1
-        if OrderedDict([('any', ['TEST_IF_COND_1', 'TEST_IF_COND_2'])])
+        if {'any': ['TEST_IF_COND_1', 'TEST_IF_COND_2']}
 enum FeatureEnum1
     member eins
     member zwei
@@ -447,7 +447,7 @@ command test-command-cond-features2 None -> None
 command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
-        if OrderedDict([('all', ['TEST_IF_COND_1', 'TEST_IF_COND_2'])])
+        if {'all': ['TEST_IF_COND_1', 'TEST_IF_COND_2']}
 event TEST_EVENT_FEATURES0 FeatureStruct1
     boxed=False
 event TEST_EVENT_FEATURES1 None
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.py
index c92be2d086..73cffae2b6 100755
--- a/tests/qapi-schema/test-qapi.py
+++ b/tests/qapi-schema/test-qapi.py
@@ -94,8 +94,17 @@ def _print_variants(variants):
 
     @staticmethod
     def _print_if(ifcond, indent=4):
+        # TODO Drop this hack after replacing OrderedDict by plain
+        # dict (requires Python 3.7)
+        def _massage(subcond):
+            if isinstance(subcond, str):
+                return subcond
+            if isinstance(subcond, list):
+                return [_massage(val) for val in subcond]
+            return {key: _massage(val) for key, val in subcond.items()}
+
         if ifcond.is_present():
-            print('%sif %s' % (' ' * indent, ifcond.ifcond))
+            print('%sif %s' % (' ' * indent, _massage(ifcond.ifcond)))
 
     @classmethod
     def _print_features(cls, features, indent=4):
-- 
2.31.1


