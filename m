Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9594A21AF25
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 08:08:16 +0200 (CEST)
Received: from localhost ([::1]:48602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtmCl-0002Mx-4s
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 02:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jtmC3-0001wt-26
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 02:07:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23362
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jtmC0-0004yp-69
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 02:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594361246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6Ug6571A2wGeckp76nBxVhyGsxMMQ06/3UwSVf0f2xU=;
 b=DisEpdHZqdtba7dgnDkolTbgFczzMPhofLXsJaW4Ndb66ah4esqM/mw6RR6oHJ2t5EZGmN
 i4h4fU9S1h5dWfOfZ0jHKNOMiM9UCLofBrfwXaISsGMqUTzzB0zfm29YEzHnvYbod37gwS
 CZoWoLUrrahZpNkrXyrS+QBwx/IiBIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-7T7dWYfJOE63oiY3fyMvsQ-1; Fri, 10 Jul 2020 02:07:24 -0400
X-MC-Unique: 7T7dWYfJOE63oiY3fyMvsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB47800D5C
 for <qemu-devel@nongnu.org>; Fri, 10 Jul 2020 06:07:23 +0000 (UTC)
Received: from thuth.com (ovpn-112-68.ams2.redhat.com [10.36.112.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C59F60E1C;
 Fri, 10 Jul 2020 06:07:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests: improve performance of device-introspect-test
Date: Fri, 10 Jul 2020 08:07:19 +0200
Message-Id: <20200710060719.22386-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 00:36:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Total execution time with "-m slow" and x86_64 QEMU, drops from 3
minutes 15 seconds, down to 54 seconds.

Individual tests drop from 17-20 seconds, down to 3-4 seconds.

The cost of this change is that any QOM bugs resulting in the test
failure will not be directly associated with the device that caused
the failure. The test case is not frequently identifying such bugs
though, and the cause is likely easily visible in the patch series
that causes the failure. So overall the shorter running time is
considered the more important factor.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[thuth: Add the tree check to test_device_intro_none() and
 test_device_intro_abstract(), too, just to be sure...]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Add the tree check to test_device_intro_none() and
     test_device_intro_abstract(), too

 When I run the following command, the test time drops from more
 than 20 minutes to 50 seconds now (wow!):
 
 QTEST_QEMU_BINARY=ppc64-softmmu/qemu-system-ppc64 \
  time tests/qtest/device-introspect-test -m slow > /dev/null

 tests/qtest/device-introspect-test.c | 60 ++++++++++++++++++----------
 1 file changed, 38 insertions(+), 22 deletions(-)

diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
index 9abb5ec889..d68b7856a7 100644
--- a/tests/qtest/device-introspect-test.c
+++ b/tests/qtest/device-introspect-test.c
@@ -105,14 +105,9 @@ static void test_one_device(QTestState *qts, const char *type)
 {
     QDict *resp;
     char *help;
-    char *qom_tree_start, *qom_tree_end;
-    char *qtree_start, *qtree_end;
 
     g_test_message("Testing device '%s'", type);
 
-    qom_tree_start = qtest_hmp(qts, "info qom-tree");
-    qtree_start = qtest_hmp(qts, "info qtree");
-
     resp = qtest_qmp(qts, "{'execute': 'device-list-properties',"
                           " 'arguments': {'typename': %s}}",
                type);
@@ -120,21 +115,6 @@ static void test_one_device(QTestState *qts, const char *type)
 
     help = qtest_hmp(qts, "device_add \"%s,help\"", type);
     g_free(help);
-
-    /*
-     * Some devices leave dangling pointers in QOM behind.
-     * "info qom-tree" or "info qtree" have a good chance at crashing then.
-     * Also make sure that the tree did not change.
-     */
-    qom_tree_end = qtest_hmp(qts, "info qom-tree");
-    g_assert_cmpstr(qom_tree_start, ==, qom_tree_end);
-    g_free(qom_tree_start);
-    g_free(qom_tree_end);
-
-    qtree_end = qtest_hmp(qts, "info qtree");
-    g_assert_cmpstr(qtree_start, ==, qtree_end);
-    g_free(qtree_start);
-    g_free(qtree_end);
 }
 
 static void test_device_intro_list(void)
@@ -213,16 +193,38 @@ static void test_qom_list_fields(void)
 static void test_device_intro_none(void)
 {
     QTestState *qts = qtest_init(common_args);
+    g_autofree char *qom_tree_start = qtest_hmp(qts, "info qom-tree");
+    g_autofree char *qom_tree_end = NULL;
+    g_autofree char *qtree_start = qtest_hmp(qts, "info qtree");
+    g_autofree char *qtree_end = NULL;
 
     test_one_device(qts, "nonexistent");
+
+    /* Make sure that really nothing changed in the trees */
+    qom_tree_end = qtest_hmp(qts, "info qom-tree");
+    g_assert_cmpstr(qom_tree_start, ==, qom_tree_end);
+    qtree_end = qtest_hmp(qts, "info qtree");
+    g_assert_cmpstr(qtree_start, ==, qtree_end);
+
     qtest_quit(qts);
 }
 
 static void test_device_intro_abstract(void)
 {
     QTestState *qts = qtest_init(common_args);
+    g_autofree char *qom_tree_start = qtest_hmp(qts, "info qom-tree");
+    g_autofree char *qom_tree_end = NULL;
+    g_autofree char *qtree_start = qtest_hmp(qts, "info qtree");
+    g_autofree char *qtree_end = NULL;
 
     test_one_device(qts, "device");
+
+    /* Make sure that really nothing changed in the trees */
+    qom_tree_end = qtest_hmp(qts, "info qom-tree");
+    g_assert_cmpstr(qom_tree_start, ==, qom_tree_end);
+    qtree_end = qtest_hmp(qts, "info qtree");
+    g_assert_cmpstr(qtree_start, ==, qtree_end);
+
     qtest_quit(qts);
 }
 
@@ -231,9 +233,12 @@ static void test_device_intro_concrete(const void *args)
     QList *types;
     QListEntry *entry;
     const char *type;
-    QTestState *qts;
+    QTestState *qts = qtest_init(args);
+    g_autofree char *qom_tree_start = qtest_hmp(qts, "info qom-tree");
+    g_autofree char *qom_tree_end = NULL;
+    g_autofree char *qtree_start = qtest_hmp(qts, "info qtree");
+    g_autofree char *qtree_end = NULL;
 
-    qts = qtest_init(args);
     types = device_type_list(qts, false);
 
     QLIST_FOREACH_ENTRY(types, entry) {
@@ -243,6 +248,17 @@ static void test_device_intro_concrete(const void *args)
         test_one_device(qts, type);
     }
 
+    /*
+     * Some devices leave dangling pointers in QOM behind.
+     * "info qom-tree" or "info qtree" have a good chance at crashing then.
+     * Also make sure that the tree did not change.
+     */
+    qom_tree_end = qtest_hmp(qts, "info qom-tree");
+    g_assert_cmpstr(qom_tree_start, ==, qom_tree_end);
+
+    qtree_end = qtest_hmp(qts, "info qtree");
+    g_assert_cmpstr(qtree_start, ==, qtree_end);
+
     qobject_unref(types);
     qtest_quit(qts);
     g_free((void *)args);
-- 
2.18.1


