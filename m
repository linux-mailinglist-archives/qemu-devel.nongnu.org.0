Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F1E20D59B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 21:38:15 +0200 (CEST)
Received: from localhost ([::1]:35710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpzba-0005LQ-RK
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 15:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jpzYD-0001e2-Hs
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 15:34:45 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26401
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jpzYB-0003H9-L1
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 15:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593459282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9f2Fpt9PxJMUDu+6ZYAGg6oiRLXdK/cdsmaUrCm2kc=;
 b=U8YBoOYIIctzQCO2w9nt3EitJXidjtrEK1J/CNmRfqelTzYOp44+OnWArTt227B+c+WMSg
 UXd0SBwzmMgOJptQuf8K7zSpySwuxNnaCXRN7fJmrjPJhkVQJHHDxmJCUiml1EWND3LZu6
 cyXDjKGYFissOTGcxt0Uw7ZZsE+z59s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-JlLCwVJzMjyX7ZZ9iraMIw-1; Mon, 29 Jun 2020 15:34:40 -0400
X-MC-Unique: JlLCwVJzMjyX7ZZ9iraMIw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21C5318FF662;
 Mon, 29 Jun 2020 19:34:39 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9BD5C220;
 Mon, 29 Jun 2020 19:34:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Subject: [PATCH v5 3/3] tests/qmp-cmd-test: Add qmp/object-add-failure-modes
Date: Mon, 29 Jun 2020 21:34:24 +0200
Message-Id: <20200629193424.30280-4-eric.auger@redhat.com>
In-Reply-To: <20200629193424.30280-1-eric.auger@redhat.com>
References: <20200629193424.30280-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 15:30:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge the existing object-add test cases into a single test
functions and cover more failure cases.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- use 1M instead of 4G
---
 tests/qtest/qmp-cmd-test.c | 114 +++++++++++++++++++++++++++++++------
 1 file changed, 97 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index fc65fa3726..c68f99f659 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -200,33 +200,116 @@ static void add_query_tests(QmpSchema *schema)
     }
 }
 
-static void test_object_add_without_props(void)
+static void test_object_add_failure_modes(void)
 {
     QTestState *qts;
     QDict *resp;
 
+    /* attempt to create an object without props */
     qts = qtest_init(common_args);
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
-                    " {'qom-type': 'memory-backend-ram', 'id': 'ram1' } }");
+                     " {'qom-type': 'memory-backend-ram', 'id': 'ram1' } }");
     g_assert_nonnull(resp);
     qmp_assert_error_class(resp, "GenericError");
-    qtest_quit(qts);
-}
 
-static void test_object_add_with_duplicate_id(void)
-{
-    QTestState *qts;
-    QDict *resp;
-
-    qts = qtest_init(common_args);
+    /* attempt to create an object without qom-type */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
-                    " {'qom-type': 'memory-backend-ram', 'id': 'ram1', 'props': {'size': 1048576 } } }");
+                     " {'id': 'ram1' } }");
+    g_assert_nonnull(resp);
+    qmp_assert_error_class(resp, "GenericError");
+
+    /* attempt to delete an object that does not exist */
+    resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
+                     " {'id': 'ram1' } }");
+    g_assert_nonnull(resp);
+    qmp_assert_error_class(resp, "GenericError");
+
+    /* attempt to create 2 objects with duplicate id */
+    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
+                     " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
+                     " 'props': {'size': 1048576 } } }");
     g_assert_nonnull(resp);
     g_assert(qdict_haskey(resp, "return"));
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
-                    " {'qom-type': 'memory-backend-ram', 'id': 'ram1', 'props': {'size': 1048576 } } }");
+                     " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
+                     " 'props': {'size': 1048576 } } }");
     g_assert_nonnull(resp);
     qmp_assert_error_class(resp, "GenericError");
+
+    /* delete ram1 object */
+    resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
+                     " {'id': 'ram1' } }");
+    g_assert_nonnull(resp);
+    g_assert(qdict_haskey(resp, "return"));
+
+    /* attempt to create an object with a property of a wrong type */
+    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
+                     " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
+                     " 'props': {'size': '1048576' } } }");
+    g_assert_nonnull(resp);
+    /* now do it right */
+    qmp_assert_error_class(resp, "GenericError");
+    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
+                     " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
+                     " 'props': {'size': 1048576 } } }");
+    g_assert_nonnull(resp);
+    g_assert(qdict_haskey(resp, "return"));
+
+    /* delete ram1 object */
+    resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
+                     " {'id': 'ram1' } }");
+    g_assert_nonnull(resp);
+    g_assert(qdict_haskey(resp, "return"));
+
+    /* attempt to create an object without the id */
+    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
+                     " {'qom-type': 'memory-backend-ram',"
+                     " 'props': {'size': 1048576 } } }");
+    g_assert_nonnull(resp);
+    qmp_assert_error_class(resp, "GenericError");
+    /* now do it right */
+    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
+                     " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
+                     " 'props': {'size': 1048576 } } }");
+    g_assert_nonnull(resp);
+    g_assert(qdict_haskey(resp, "return"));
+
+    /* delete ram1 object */
+    resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
+                     " {'id': 'ram1' } }");
+    g_assert_nonnull(resp);
+    g_assert(qdict_haskey(resp, "return"));
+
+    /* attempt to set a non existing property */
+    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
+                     " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
+                     " 'props': {'sized': 1048576 } } }");
+    g_assert_nonnull(resp);
+    qmp_assert_error_class(resp, "GenericError");
+    /* now do it right */
+    resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
+                     " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
+                     " 'props': {'size': 1048576 } } }");
+    g_assert_nonnull(resp);
+    g_assert(qdict_haskey(resp, "return"));
+
+    /* delete ram1 object without id */
+    resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
+                     " {'ida': 'ram1' } }");
+    g_assert_nonnull(resp);
+
+    /* delete ram1 object */
+    resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
+                     " {'id': 'ram1' } }");
+    g_assert_nonnull(resp);
+    g_assert(qdict_haskey(resp, "return"));
+
+    /* delete ram1 object that does not exist anymore*/
+    resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
+                     " {'id': 'ram1' } }");
+    g_assert_nonnull(resp);
+    qmp_assert_error_class(resp, "GenericError");
+
     qtest_quit(qts);
 }
 
@@ -240,11 +323,8 @@ int main(int argc, char *argv[])
     qmp_schema_init(&schema);
     add_query_tests(&schema);
 
-    qtest_add_func("qmp/object-add-without-props",
-                   test_object_add_without_props);
-    qtest_add_func("qmp/object-add-duplicate-id",
-                   test_object_add_with_duplicate_id);
-    /* TODO: add coverage of generic object-add failure modes */
+    qtest_add_func("qmp/object-add-failure-modes",
+                   test_object_add_failure_modes);
 
     ret = g_test_run();
 
-- 
2.20.1


