Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DDF346B94
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:02:03 +0100 (CET)
Received: from localhost ([::1]:60886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOp6A-0005O5-GD
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:02:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1U-00071m-5p
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1O-0002ln-HT
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ua5t9NARTvfXg6KfDvdnBWANQ9V3QhqddfP3KeodY0k=;
 b=Rtmw4V0KFMnZvKI69Z856oN/tL9r0bKvpIuHma7/0bsY75EDzU20dQlNIyQpGD7OqHwygL
 c603PCGvWG5bmIUXWisZUic1N3+2Lk/fu62TibAi0+A39fYzRwvOIxTSwwe3UW+wxI1hfb
 FyrKyvU+h8mMgj75TLobr/Zbzk7zhdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-HZWEyZHTPxqpN6HYiLn8Iw-1; Tue, 23 Mar 2021 17:57:03 -0400
X-MC-Unique: HZWEyZHTPxqpN6HYiLn8Iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F77F1007476;
 Tue, 23 Mar 2021 21:57:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C075F60245;
 Tue, 23 Mar 2021 21:57:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A707D11326A0; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/29] qapi: Enforce event naming rules
Date: Tue, 23 Mar 2021 22:56:42 +0100
Message-Id: <20210323215658.3840228-14-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Event names should be ALL_CAPS with words separated by underscore.
Enforce this.  The only offenders are in tests/.  Fix them.  Existing
test event-case covers the new error.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-14-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/unit/test-qmp-event.c               |  6 +++---
 scripts/qapi/expr.py                      |  4 +++-
 tests/qapi-schema/doc-good.json           |  4 ++--
 tests/qapi-schema/doc-good.out            |  4 ++--
 tests/qapi-schema/doc-good.txt            |  2 +-
 tests/qapi-schema/doc-invalid-return.json |  4 ++--
 tests/qapi-schema/event-case.err          |  2 ++
 tests/qapi-schema/event-case.json         |  2 --
 tests/qapi-schema/event-case.out          | 14 --------------
 tests/qapi-schema/qapi-schema-test.json   |  6 +++---
 tests/qapi-schema/qapi-schema-test.out    |  8 ++++----
 11 files changed, 22 insertions(+), 34 deletions(-)

diff --git a/tests/unit/test-qmp-event.c b/tests/unit/test-qmp-event.c
index 047f44ff9a..d58c3b78f2 100644
--- a/tests/unit/test-qmp-event.c
+++ b/tests/unit/test-qmp-event.c
@@ -143,7 +143,7 @@ static void test_event_d(TestEventData *data,
 
 static void test_event_deprecated(TestEventData *data, const void *unused)
 {
-    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES1' }");
+    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST_EVENT_FEATURES1' }");
 
     memset(&compat_policy, 0, sizeof(compat_policy));
 
@@ -163,7 +163,7 @@ static void test_event_deprecated_data(TestEventData *data, const void *unused)
 {
     memset(&compat_policy, 0, sizeof(compat_policy));
 
-    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES0',"
+    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST_EVENT_FEATURES0',"
                                            " 'data': { 'foo': 42 } }");
     qapi_event_send_test_event_features0(42);
     g_assert(data->emitted);
@@ -172,7 +172,7 @@ static void test_event_deprecated_data(TestEventData *data, const void *unused)
 
     compat_policy.has_deprecated_output = true;
     compat_policy.deprecated_output = COMPAT_POLICY_OUTPUT_HIDE;
-    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES0' }");
+    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST_EVENT_FEATURES0' }");
     qapi_event_send_test_event_features0(42);
     g_assert(data->emitted);
 
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index b5fb0be48b..c065505b27 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -45,7 +45,9 @@ def check_name_str(name, info, source):
 
 def check_name_upper(name, info, source):
     stem = check_name_str(name, info, source)
-    # TODO reject '[a-z-]' in @stem
+    if re.search(r'[a-z-]', stem):
+        raise QAPISemError(
+            info, "name of %s must not use lowercase or '-'" % source)
 
 
 def check_name_lower(name, info, source,
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index e9af0857db..423ea23e07 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -179,10 +179,10 @@
   'features': [ 'cmd-feat1', 'cmd-feat2' ] }
 
 ##
-# @EVT-BOXED:
+# @EVT_BOXED:
 # Features:
 # @feat3: a feature
 ##
-{ 'event': 'EVT-BOXED',  'boxed': true,
+{ 'event': 'EVT_BOXED',  'boxed': true,
   'features': [ 'feat3' ],
   'data': 'Object' }
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 715b0bbc1a..8f54ceff2e 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -63,7 +63,7 @@ command cmd-boxed Object -> None
     gen=True success_response=True boxed=True oob=False preconfig=False
     feature cmd-feat1
     feature cmd-feat2
-event EVT-BOXED Object
+event EVT_BOXED Object
     boxed=True
     feature feat3
 doc freeform
@@ -211,7 +211,7 @@ another feature
 -> in
 
 <- out
-doc symbol=EVT-BOXED
+doc symbol=EVT_BOXED
     body=
 
     feature=feat3
diff --git a/tests/qapi-schema/doc-good.txt b/tests/qapi-schema/doc-good.txt
index 6ca03d49d0..726727af74 100644
--- a/tests/qapi-schema/doc-good.txt
+++ b/tests/qapi-schema/doc-good.txt
@@ -272,7 +272,7 @@ Example
    <- out
 
 
-"EVT-BOXED" (Event)
+"EVT_BOXED" (Event)
 -------------------
 
 
diff --git a/tests/qapi-schema/doc-invalid-return.json b/tests/qapi-schema/doc-invalid-return.json
index 1ba45de414..95e7583930 100644
--- a/tests/qapi-schema/doc-invalid-return.json
+++ b/tests/qapi-schema/doc-invalid-return.json
@@ -1,7 +1,7 @@
 # Events can't have 'Returns' section
 
 ##
-# @foo:
+# @FOO:
 # Returns: blah
 ##
-{ 'event': 'foo' }
+{ 'event': 'FOO' }
diff --git a/tests/qapi-schema/event-case.err b/tests/qapi-schema/event-case.err
index e69de29bb2..d3007cfa63 100644
--- a/tests/qapi-schema/event-case.err
+++ b/tests/qapi-schema/event-case.err
@@ -0,0 +1,2 @@
+event-case.json: In event 'oops':
+event-case.json:1: name of event must not use lowercase or '-'
diff --git a/tests/qapi-schema/event-case.json b/tests/qapi-schema/event-case.json
index 3a92d8b610..4d8a5d8a71 100644
--- a/tests/qapi-schema/event-case.json
+++ b/tests/qapi-schema/event-case.json
@@ -1,3 +1 @@
-# TODO: might be nice to enforce naming conventions; but until then this works
-# even though events should usually be ALL_CAPS
 { 'event': 'oops' }
diff --git a/tests/qapi-schema/event-case.out b/tests/qapi-schema/event-case.out
index 9ae44052ac..e69de29bb2 100644
--- a/tests/qapi-schema/event-case.out
+++ b/tests/qapi-schema/event-case.out
@@ -1,14 +0,0 @@
-module ./builtin
-object q_empty
-enum QType
-    prefix QTYPE
-    member none
-    member qnull
-    member qnum
-    member qstring
-    member qdict
-    member qlist
-    member qbool
-module event-case.json
-event oops None
-    boxed=False
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 12ec588b52..a355321258 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -249,7 +249,7 @@
 
 { 'command': 'TestCmdReturnDefThree', 'returns': 'UserDefThree' }
 
-{ 'event': 'TestIfEvent', 'data':
+{ 'event': 'TEST_IF_EVENT', 'data':
   { 'foo': 'TestIfStruct',
     'bar': { 'type': ['TestIfEnum'], 'if': 'defined(TEST_IF_EVT_BAR)' } },
   'if': 'defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)' }
@@ -324,8 +324,8 @@
   'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
                                               'defined(TEST_IF_COND_2)'] } ] }
 
-{ 'event': 'TEST-EVENT-FEATURES0',
+{ 'event': 'TEST_EVENT_FEATURES0',
   'data': 'FeatureStruct1' }
 
-{ 'event': 'TEST-EVENT-FEATURES1',
+{ 'event': 'TEST_EVENT_FEATURES1',
   'features': [ 'deprecated' ] }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index f5741df97f..882d0e7c56 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -349,12 +349,12 @@ command TestCmdReturnDefThree None -> UserDefThree
     gen=True success_response=True boxed=False oob=False preconfig=False
 array TestIfEnumList TestIfEnum
     if ['defined(TEST_IF_ENUM)']
-object q_obj_TestIfEvent-arg
+object q_obj_TEST_IF_EVENT-arg
     member foo: TestIfStruct optional=False
     member bar: TestIfEnumList optional=False
         if ['defined(TEST_IF_EVT_BAR)']
     if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
-event TestIfEvent q_obj_TestIfEvent-arg
+event TEST_IF_EVENT q_obj_TEST_IF_EVENT-arg
     boxed=False
     if ['defined(TEST_IF_EVT) && defined(TEST_IF_STRUCT)']
 object FeatureStruct0
@@ -440,9 +440,9 @@ command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
         if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
-event TEST-EVENT-FEATURES0 FeatureStruct1
+event TEST_EVENT_FEATURES0 FeatureStruct1
     boxed=False
-event TEST-EVENT-FEATURES1 None
+event TEST_EVENT_FEATURES1 None
     boxed=False
     feature deprecated
 module include/sub-module.json
-- 
2.26.3


