Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F4B25AAD4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 14:05:55 +0200 (CEST)
Received: from localhost ([::1]:53368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDRWU-0006Rr-Bj
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 08:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDROY-0001xQ-5O
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 07:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kDROU-0007au-UX
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 07:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599047858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gCCxDILBpZz8C6xf9cIF0XBzokgE20n+vRQp0zWnzsU=;
 b=N5YH2yQvWoo4mNdHlljfTav4HtgB3WBxA1spR6C7iODtM9CFlZsME36GIG+Cd9fsGGuf/L
 /NcSwIYIeXApI2oS1rmPR1m6mgx/u9XwHJQ+PTTtP/fPQw/r9SiO8xnXLUVB5YAgwKpYGW
 qkv1gN8Ov3i77O7VncW7gX259bt/2l4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-p-5RSk3bODqHb1y-Vu921g-1; Wed, 02 Sep 2020 07:57:36 -0400
X-MC-Unique: p-5RSk3bODqHb1y-Vu921g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF5F7802B4B
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 11:57:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76D2D7C609;
 Wed,  2 Sep 2020 11:57:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F0E91113C418; Wed,  2 Sep 2020 13:57:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] libqtest: Rename qmp_assert_error_class() to
 qmp_expect_error_and_unref()
Date: Wed,  2 Sep 2020 13:57:33 +0200
Message-Id: <20200902115733.1229537-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 01:13:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qmp_assert_error_class() does more than just assert: it also unrefs
the @rsp argument.  Rename to qmp_assert_error_class() to reduce
confusion.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  4 ++--
 tests/qtest/drive_del-test.c  |  2 +-
 tests/qtest/libqtest.c        |  2 +-
 tests/qtest/qmp-cmd-test.c    | 16 ++++++++--------
 tests/qtest/qmp-test.c        | 32 ++++++++++++++++----------------
 tests/test-qga.c              |  2 +-
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index f5cf93c386..a6ee1654f2 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -704,13 +704,13 @@ void qtest_qmp_device_del(QTestState *qts, const char *id);
 bool qmp_rsp_is_err(QDict *rsp);
 
 /**
- * qmp_assert_error_class:
+ * qmp_expect_error_and_unref:
  * @rsp: QMP response to check for error
  * @class: an error class
  *
  * Assert the response has the given error class and discard @rsp.
  */
-void qmp_assert_error_class(QDict *rsp, const char *class);
+void qmp_expect_error_and_unref(QDict *rsp, const char *class);
 
 /**
  * qtest_probe_child:
diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index 2ab11ad225..2d765865ce 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -103,7 +103,7 @@ static void test_after_failed_device_add(void)
                               "   'drive': 'drive0'"
                               "}}", driver);
     g_assert(response);
-    qmp_assert_error_class(response, "GenericError");
+    qmp_expect_error_and_unref(response, "GenericError");
 
     /* Delete the drive */
     drive_del(qts);
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 26f1223642..58f58e1ece 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1359,7 +1359,7 @@ bool qmp_rsp_is_err(QDict *rsp)
     return !!error;
 }
 
-void qmp_assert_error_class(QDict *rsp, const char *class)
+void qmp_expect_error_and_unref(QDict *rsp, const char *class)
 {
     QDict *error = qdict_get_qdict(rsp, "error");
 
diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
index f34e68858a..3109a9fe96 100644
--- a/tests/qtest/qmp-cmd-test.c
+++ b/tests/qtest/qmp-cmd-test.c
@@ -210,19 +210,19 @@ static void test_object_add_failure_modes(void)
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1' } }");
     g_assert_nonnull(resp);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* attempt to create an object without qom-type */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'id': 'ram1' } }");
     g_assert_nonnull(resp);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* attempt to delete an object that does not exist */
     resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
                      " {'id': 'ram1' } }");
     g_assert_nonnull(resp);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* attempt to create 2 objects with duplicate id */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
@@ -236,7 +236,7 @@ static void test_object_add_failure_modes(void)
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
                      " 'props': {'size': 1048576 } } }");
     g_assert_nonnull(resp);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* delete ram1 object */
     resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
@@ -251,7 +251,7 @@ static void test_object_add_failure_modes(void)
                      " 'props': {'size': '1048576' } } }");
     g_assert_nonnull(resp);
     /* now do it right */
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
@@ -272,7 +272,7 @@ static void test_object_add_failure_modes(void)
                      " {'qom-type': 'memory-backend-ram',"
                      " 'props': {'size': 1048576 } } }");
     g_assert_nonnull(resp);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* now do it right */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
@@ -294,7 +294,7 @@ static void test_object_add_failure_modes(void)
                      " {'qom-type': 'memory-backend-ram', 'id': 'ram1',"
                      " 'props': {'sized': 1048576 } } }");
     g_assert_nonnull(resp);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* now do it right */
     resp = qtest_qmp(qts, "{'execute': 'object-add', 'arguments':"
@@ -321,7 +321,7 @@ static void test_object_add_failure_modes(void)
     resp = qtest_qmp(qts, "{'execute': 'object-del', 'arguments':"
                      " {'id': 'ram1' } }");
     g_assert_nonnull(resp);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     qtest_quit(qts);
 }
diff --git a/tests/qtest/qmp-test.c b/tests/qtest/qmp-test.c
index 5950c3ebbb..e1032c5a21 100644
--- a/tests/qtest/qmp-test.c
+++ b/tests/qtest/qmp-test.c
@@ -38,7 +38,7 @@ static void assert_recovered(QTestState *qts)
     QDict *resp;
 
     resp = qtest_qmp(qts, "{ 'execute': 'no-such-cmd' }");
-    qmp_assert_error_class(resp, "CommandNotFound");
+    qmp_expect_error_and_unref(resp, "CommandNotFound");
 }
 
 static void test_malformed(QTestState *qts)
@@ -48,58 +48,58 @@ static void test_malformed(QTestState *qts)
     /* syntax error */
     qtest_qmp_send_raw(qts, "{]\n");
     resp = qtest_qmp_receive(qts);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
     assert_recovered(qts);
 
     /* lexical error: impossible byte outside string */
     qtest_qmp_send_raw(qts, "{\xFF");
     resp = qtest_qmp_receive(qts);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
     assert_recovered(qts);
 
     /* lexical error: funny control character outside string */
     qtest_qmp_send_raw(qts, "{\x01");
     resp = qtest_qmp_receive(qts);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
     assert_recovered(qts);
 
     /* lexical error: impossible byte in string */
     qtest_qmp_send_raw(qts, "{'bad \xFF");
     resp = qtest_qmp_receive(qts);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
     assert_recovered(qts);
 
     /* lexical error: control character in string */
     qtest_qmp_send_raw(qts, "{'execute': 'nonexistent', 'id':'\n");
     resp = qtest_qmp_receive(qts);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
     assert_recovered(qts);
 
     /* lexical error: interpolation */
     qtest_qmp_send_raw(qts, "%%p");
     resp = qtest_qmp_receive(qts);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
     assert_recovered(qts);
 
     /* Not even a dictionary */
     resp = qtest_qmp(qts, "null");
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* No "execute" key */
     resp = qtest_qmp(qts, "{}");
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* "execute" isn't a string */
     resp = qtest_qmp(qts, "{ 'execute': true }");
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* "arguments" isn't a dictionary */
     resp = qtest_qmp(qts, "{ 'execute': 'no-such-cmd', 'arguments': [] }");
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     /* extra key */
     resp = qtest_qmp(qts, "{ 'execute': 'no-such-cmd', 'extra': true }");
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 }
 
 static void test_qmp_protocol(void)
@@ -121,7 +121,7 @@ static void test_qmp_protocol(void)
 
     /* Test valid command before handshake */
     resp = qtest_qmp(qts, "{ 'execute': 'query-version' }");
-    qmp_assert_error_class(resp, "CommandNotFound");
+    qmp_expect_error_and_unref(resp, "CommandNotFound");
 
     /* Test malformed commands before handshake */
     test_malformed(qts);
@@ -134,7 +134,7 @@ static void test_qmp_protocol(void)
 
     /* Test repeated handshake */
     resp = qtest_qmp(qts, "{ 'execute': 'qmp_capabilities' }");
-    qmp_assert_error_class(resp, "CommandNotFound");
+    qmp_expect_error_and_unref(resp, "CommandNotFound");
 
     /* Test valid command */
     resp = qtest_qmp(qts, "{ 'execute': 'query-version' }");
@@ -154,7 +154,7 @@ static void test_qmp_protocol(void)
     /* Test command failure with 'id' */
     resp = qtest_qmp(qts, "{ 'execute': 'human-monitor-command', 'id': 2 }");
     g_assert_cmpint(qdict_get_int(resp, "id"), ==, 2);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
 
     qtest_quit(qts);
 }
@@ -327,7 +327,7 @@ static void test_qmp_missing_any_arg(void)
     resp = qtest_qmp(qts, "{'execute': 'qom-set', 'arguments':"
                      " { 'path': '/machine', 'property': 'rtc-time' } }");
     g_assert_nonnull(resp);
-    qmp_assert_error_class(resp, "GenericError");
+    qmp_expect_error_and_unref(resp, "GenericError");
     qtest_quit(qts);
 }
 
diff --git a/tests/test-qga.c b/tests/test-qga.c
index 4ac4c22109..65d7992edc 100644
--- a/tests/test-qga.c
+++ b/tests/test-qga.c
@@ -246,7 +246,7 @@ static void test_qga_invalid_oob(gconstpointer fix)
     ret = qmp_fd(fixture->fd, "{'exec-oob': 'guest-ping'}");
     g_assert_nonnull(ret);
 
-    qmp_assert_error_class(ret, "GenericError");
+    qmp_expect_error_and_unref(ret, "GenericError");
 }
 
 static void test_qga_invalid_args(gconstpointer fix)
-- 
2.26.2


