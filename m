Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846E8340ABB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 17:57:00 +0100 (CET)
Received: from localhost ([::1]:38824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMvxC-0007tZ-KU
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 12:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvfR-00029Q-PK
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMvf8-00034J-Ev
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616085489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eX0tkuOMDfHOJxfS//GFBOZ21zXmNPPSLS6KXb2UEY8=;
 b=NJq/4MLqf31zv1YodVHztxvO5l1m3JzynokNCCkMpVgyq3DxhqX7AdPoG1jnciyasATrRY
 eA+RTI5ss3mi+7red6rI2mbegHT8MhoPCSOVqEwFmCo/ZVNHw196PLN43IyrJsbjBsWt64
 MwXqrFsm5xmEHQDDKC2uLkCr6X8N9/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-10QpBKt-MEe882mrjjevhw-1; Thu, 18 Mar 2021 12:38:06 -0400
X-MC-Unique: 10QpBKt-MEe882mrjjevhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD8389122A;
 Thu, 18 Mar 2021 16:38:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DFD35D6A8;
 Thu, 18 Mar 2021 16:38:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4343D11385A7; Thu, 18 Mar 2021 17:37:57 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 05/11] qapi: Implement deprecated-output=hide for QMP event
 data
Date: Thu, 18 Mar 2021 17:37:51 +0100
Message-Id: <20210318163757.1345341-6-armbru@redhat.com>
In-Reply-To: <20210318163757.1345341-1-armbru@redhat.com>
References: <20210318163757.1345341-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This policy suppresses deprecated bits in output, and thus permits
"testing the future".  Implement it for QMP event data: suppress
deprecated members.

No QMP event data is deprecated right now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210318155519.1224118-6-armbru@redhat.com>
---
 tests/unit/test-qmp-event.c             | 21 +++++++++++++++++++++
 scripts/qapi/events.py                  |  9 ++++++---
 tests/qapi-schema/qapi-schema-test.json |  3 +++
 tests/qapi-schema/qapi-schema-test.out  |  2 ++
 4 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-qmp-event.c b/tests/unit/test-qmp-event.c
index ab059fb5c2..047f44ff9a 100644
--- a/tests/unit/test-qmp-event.c
+++ b/tests/unit/test-qmp-event.c
@@ -159,6 +159,26 @@ static void test_event_deprecated(TestEventData *data, const void *unused)
     qobject_unref(data->expect);
 }
 
+static void test_event_deprecated_data(TestEventData *data, const void *unused)
+{
+    memset(&compat_policy, 0, sizeof(compat_policy));
+
+    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES0',"
+                                           " 'data': { 'foo': 42 } }");
+    qapi_event_send_test_event_features0(42);
+    g_assert(data->emitted);
+
+    qobject_unref(data->expect);
+
+    compat_policy.has_deprecated_output = true;
+    compat_policy.deprecated_output = COMPAT_POLICY_OUTPUT_HIDE;
+    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES0' }");
+    qapi_event_send_test_event_features0(42);
+    g_assert(data->emitted);
+
+    qobject_unref(data->expect);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -168,6 +188,7 @@ int main(int argc, char **argv)
     event_test_add("/event/event_c", test_event_c);
     event_test_add("/event/event_d", test_event_d);
     event_test_add("/event/deprecated", test_event_deprecated);
+    event_test_add("/event/deprecated_data", test_event_deprecated_data);
     g_test_run();
 
     return 0;
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index f6e1e76f64..fee8c671e7 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -126,7 +126,7 @@ def gen_event_send(name: str,
     if have_args:
         assert arg_type is not None
         ret += mcgen('''
-    v = qobject_output_visitor_new(&obj);
+    v = qobject_output_visitor_new_qmp(&obj);
 ''')
         if not arg_type.is_implicit():
             ret += mcgen('''
@@ -145,7 +145,11 @@ def gen_event_send(name: str,
         ret += mcgen('''
 
     visit_complete(v, &obj);
-    qdict_put_obj(qmp, "data", obj);
+    if (qdict_size(qobject_to(QDict, obj))) {
+        qdict_put_obj(qmp, "data", obj);
+    } else {
+        qobject_unref(obj);
+    }
 ''')
 
     ret += mcgen('''
@@ -188,7 +192,6 @@ def _begin_user_module(self, name: str) -> None:
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
-#include "qapi/qobject-output-visitor.h"
 #include "qapi/qmp-event.h"
 
 ''',
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 48a0adabae..12ec588b52 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -324,5 +324,8 @@
   'features': [ { 'name': 'feature1', 'if': [ 'defined(TEST_IF_COND_1)',
                                               'defined(TEST_IF_COND_2)'] } ] }
 
+{ 'event': 'TEST-EVENT-FEATURES0',
+  'data': 'FeatureStruct1' }
+
 { 'event': 'TEST-EVENT-FEATURES1',
   'features': [ 'deprecated' ] }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 776d737891..f5741df97f 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -440,6 +440,8 @@ command test-command-cond-features3 None -> None
     gen=True success_response=True boxed=False oob=False preconfig=False
     feature feature1
         if ['defined(TEST_IF_COND_1)', 'defined(TEST_IF_COND_2)']
+event TEST-EVENT-FEATURES0 FeatureStruct1
+    boxed=False
 event TEST-EVENT-FEATURES1 None
     boxed=False
     feature deprecated
-- 
2.26.3


