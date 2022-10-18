Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D328F6025B0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:29:25 +0200 (CEST)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okh2R-0003kk-HU
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg6D-0005ga-2i
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okg64-0001FO-JA
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666074535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=83H5PbBpPO6dJo2CBCxZpDKCoJmW/xziS1eO6xHEZWQ=;
 b=dyh3N4j/nOKmGMdpo5/9gyJX2kvc/qb3y8hz7Ra7zOhjF4jxxjpk/lksYzThy9B7uVKz3t
 06ZJUKYMtZHlYTko2D7SnI8id8pzNPwqo1oeg5KdbNx9pYaD8dLJTxwrF1GHxCUvW8uzi/
 MlhUZddceEKYAgK1N/6MSAzdJrqsfHg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-_oh3snNlMOGW3LYVuXdTNA-1; Tue, 18 Oct 2022 02:28:52 -0400
X-MC-Unique: _oh3snNlMOGW3LYVuXdTNA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C09AE858F17;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8143C492B0A;
 Tue, 18 Oct 2022 06:28:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 34B4821E6808; Tue, 18 Oct 2022 08:28:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 05/28] qapi tests: Elide redundant has_FOO in generated C
Date: Tue, 18 Oct 2022 08:28:26 +0200
Message-Id: <20221018062849.3420573-6-armbru@redhat.com>
In-Reply-To: <20221018062849.3420573-1-armbru@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The has_FOO for pointer-valued FOO are redundant, except for arrays.
They are also a nuisance to work with.  Recent commit "qapi: Start to
elide redundant has_FOO in generated C" provided the means to elide
them step by step.  This is the step for
tests/qapi-schema/qapi-schema-test.json.

Said commit explains the transformation in more detail.  The invariant
violations mentioned there do not occur here.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/qmp-cmd-test.c               |  2 +-
 tests/unit/test-qmp-cmds.c               | 26 +++++++++++-------------
 tests/unit/test-qmp-event.c              |  4 ++--
 tests/unit/test-qobject-input-visitor.c  |  2 +-
 tests/unit/test-qobject-output-visitor.c |  2 --
 tests/unit/test-visitor-serialization.c  |  3 +--
 scripts/qapi/schema.py                   |  4 +---
 7 files changed, 18 insertions(+), 25 deletions(-)

diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index 897e4e937b..98caf6fef6 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -174,7 +174,7 @@ static bool object_type_has_mandatory_members(SchemaInfo *type)
     g_assert(type->meta_type == SCHEMA_META_TYPE_OBJECT);
 
     for (tail = type->u.object.members; tail; tail = tail->next) {
-        if (!tail->value->has_q_default) {
+        if (!tail->value->q_default) {
             return true;
         }
     }
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 6085c09995..2373cd64cb 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -43,15 +43,15 @@ void qmp_user_def_cmd1(UserDefOne * ud1, Error **errp)
 {
 }
 
-FeatureStruct1 *qmp_test_features0(bool has_fs0, FeatureStruct0 *fs0,
-                                   bool has_fs1, FeatureStruct1 *fs1,
-                                   bool has_fs2, FeatureStruct2 *fs2,
-                                   bool has_fs3, FeatureStruct3 *fs3,
-                                   bool has_fs4, FeatureStruct4 *fs4,
-                                   bool has_cfs1, CondFeatureStruct1 *cfs1,
-                                   bool has_cfs2, CondFeatureStruct2 *cfs2,
-                                   bool has_cfs3, CondFeatureStruct3 *cfs3,
-                                   bool has_cfs4, CondFeatureStruct4 *cfs4,
+FeatureStruct1 *qmp_test_features0(FeatureStruct0 *fs0,
+                                   FeatureStruct1 *fs1,
+                                   FeatureStruct2 *fs2,
+                                   FeatureStruct3 *fs3,
+                                   FeatureStruct4 *fs4,
+                                   CondFeatureStruct1 *cfs1,
+                                   CondFeatureStruct2 *cfs2,
+                                   CondFeatureStruct3 *cfs3,
+                                   CondFeatureStruct4 *cfs4,
                                    Error **errp)
 {
     return g_new0(FeatureStruct1, 1);
@@ -77,8 +77,7 @@ void qmp_test_command_cond_features3(Error **errp)
 {
 }
 
-UserDefTwo *qmp_user_def_cmd2(UserDefOne *ud1a,
-                              bool has_udb1, UserDefOne *ud1b,
+UserDefTwo *qmp_user_def_cmd2(UserDefOne *ud1a, UserDefOne *ud1b,
                               Error **errp)
 {
     UserDefTwo *ret;
@@ -87,8 +86,8 @@ UserDefTwo *qmp_user_def_cmd2(UserDefOne *ud1a,
 
     ud1c->string = strdup(ud1a->string);
     ud1c->integer = ud1a->integer;
-    ud1d->string = strdup(has_udb1 ? ud1b->string : "blah0");
-    ud1d->integer = has_udb1 ? ud1b->integer : 0;
+    ud1d->string = strdup(ud1b ? ud1b->string : "blah0");
+    ud1d->integer = ud1b ? ud1b->integer : 0;
 
     ret = g_new0(UserDefTwo, 1);
     ret->string0 = strdup("blah1");
@@ -98,7 +97,6 @@ UserDefTwo *qmp_user_def_cmd2(UserDefOne *ud1a,
     ret->dict1->dict2->userdef = ud1c;
     ret->dict1->dict2->string = strdup("blah3");
     ret->dict1->dict3 = g_new0(UserDefTwoDictDict, 1);
-    ret->dict1->has_dict3 = true;
     ret->dict1->dict3->userdef = ud1d;
     ret->dict1->dict3->string = strdup("blah4");
 
diff --git a/tests/unit/test-qmp-event.c b/tests/unit/test-qmp-event.c
index 7d961d716a..3626d2372f 100644
--- a/tests/unit/test-qmp-event.c
+++ b/tests/unit/test-qmp-event.c
@@ -109,7 +109,7 @@ static void test_event_c(TestEventData *data,
     data->expect = qdict_from_jsonf_nofail(
         "{ 'event': 'EVENT_C', 'data': {"
         " 'a': 1, 'b': { 'integer': 2, 'string': 'test1' }, 'c': 'test2' } }");
-    qapi_event_send_event_c(true, 1, true, &b, "test2");
+    qapi_event_send_event_c(true, 1, &b, "test2");
     g_assert(data->emitted);
     qobject_unref(data->expect);
 }
@@ -135,7 +135,7 @@ static void test_event_d(TestEventData *data,
         "  'struct1': { 'integer': 2, 'string': 'test1', 'enum1': 'value1' },"
         "  'string': 'test2', 'enum2': 'value2' },"
         " 'b': 'test3', 'enum3': 'value3' } }");
-    qapi_event_send_event_d(&a, "test3", false, NULL, true, ENUM_ONE_VALUE3);
+    qapi_event_send_event_d(&a, "test3", NULL, true, ENUM_ONE_VALUE3);
     g_assert(data->emitted);
     qobject_unref(data->expect);
 }
diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index 5f614afdbf..77fbf985be 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -431,7 +431,7 @@ static void test_visitor_in_struct_nested(TestInputVisitorData *data,
     g_assert_cmpint(udp->dict1->dict2->userdef->integer, ==, 42);
     g_assert_cmpstr(udp->dict1->dict2->userdef->string, ==, "string");
     g_assert_cmpstr(udp->dict1->dict2->string, ==, "string2");
-    g_assert(udp->dict1->has_dict3 == false);
+    g_assert(!udp->dict1->dict3);
 }
 
 static void test_visitor_in_list(TestInputVisitorData *data,
diff --git a/tests/unit/test-qobject-output-visitor.c b/tests/unit/test-qobject-output-visitor.c
index 66b27fad66..7f054289fe 100644
--- a/tests/unit/test-qobject-output-visitor.c
+++ b/tests/unit/test-qobject-output-visitor.c
@@ -182,7 +182,6 @@ static void test_visitor_out_struct_nested(TestOutputVisitorData *data,
     ud2->dict1->dict2->string = g_strdup(strings[2]);
 
     ud2->dict1->dict3 = g_malloc0(sizeof(*ud2->dict1->dict3));
-    ud2->dict1->has_dict3 = true;
     ud2->dict1->dict3->userdef = g_new0(UserDefOne, 1);
     ud2->dict1->dict3->userdef->string = g_strdup(string);
     ud2->dict1->dict3->userdef->integer = value;
@@ -284,7 +283,6 @@ static void test_visitor_out_list_qapi_free(TestOutputVisitorData *data,
         value->dict1->dict2->userdef->string = g_strdup(string);
         value->dict1->dict2->userdef->integer = 42;
         value->dict1->dict2->string = g_strdup(string);
-        value->dict1->has_dict3 = false;
 
         QAPI_LIST_PREPEND(head, value);
     }
diff --git a/tests/unit/test-visitor-serialization.c b/tests/unit/test-visitor-serialization.c
index 667e8fed82..c2056c3eaa 100644
--- a/tests/unit/test-visitor-serialization.c
+++ b/tests/unit/test-visitor-serialization.c
@@ -223,7 +223,6 @@ static UserDefTwo *nested_struct_create(void)
     udnp->dict1->dict2->userdef->string = strdup("test_string");
     udnp->dict1->dict2->string = strdup("test_string2");
     udnp->dict1->dict3 = g_malloc0(sizeof(*udnp->dict1->dict3));
-    udnp->dict1->has_dict3 = true;
     udnp->dict1->dict3->userdef = g_new0(UserDefOne, 1);
     udnp->dict1->dict3->userdef->integer = 43;
     udnp->dict1->dict3->userdef->string = strdup("test_string");
@@ -243,7 +242,7 @@ static void nested_struct_compare(UserDefTwo *udnp1, UserDefTwo *udnp2)
                     udnp2->dict1->dict2->userdef->string);
     g_assert_cmpstr(udnp1->dict1->dict2->string, ==,
                     udnp2->dict1->dict2->string);
-    g_assert(udnp1->dict1->has_dict3 == udnp2->dict1->has_dict3);
+    g_assert(!udnp1->dict1->dict3 == !udnp2->dict1->dict3);
     g_assert_cmpint(udnp1->dict1->dict3->userdef->integer, ==,
                     udnp2->dict1->dict3->userdef->integer);
     g_assert_cmpstr(udnp1->dict1->dict3->userdef->string, ==,
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 58b00982ea..ae09c38103 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -767,7 +767,6 @@ def need_has(self):
             'qapi/char.json',
             'qapi/crypto.json',
             'qapi/dump.json',
-            'qapi/introspect.json',
             'qapi/job.json',
             'qapi/machine.json',
             'qapi/machine-target.json',
@@ -785,8 +784,7 @@ def need_has(self):
             'qapi/transaction.json',
             'qapi/ui.json',
             'qapi/virtio.json',
-            'qga/qapi-schema.json',
-            'tests/qapi-schema/qapi-schema-test.json']
+            'qga/qapi-schema.json']
         if self.info and any(self.info.fname.endswith(mod)
                              for mod in opt_out):
             return self.optional
-- 
2.37.2


