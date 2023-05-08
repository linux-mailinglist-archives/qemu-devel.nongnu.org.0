Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7AF6FB3C1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 17:28:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw2lY-0004SK-Pb; Mon, 08 May 2023 11:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw2lW-0004Rt-JN
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw2lV-0004Xt-1j
 for qemu-devel@nongnu.org; Mon, 08 May 2023 11:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683559624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mw2gc87GQUfje3cPwRddhZZV2DpPyXBDcUoDgrja9Mg=;
 b=AgJhJeG30t3dwDwPzQmHAYqwSrsuG7e3n8SCEX0vWZmwqBBhAa5/JRiLesjRR4evu39aNn
 eLf4m7GswmbE8Fb3d3TTEIoLqgZPhJP5PQGOpFBhdoLz/0a5wWzONECJ4kPmUyP83V/LEm
 uchcPF5iycJsFAreoeOmA/W7Af1uxQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-ISs7XmjXO1Ktnh0rXXdHCw-1; Mon, 08 May 2023 11:27:03 -0400
X-MC-Unique: ISs7XmjXO1Ktnh0rXXdHCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A988384AF35;
 Mon,  8 May 2023 15:27:01 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2105040C6F41;
 Mon,  8 May 2023 15:26:59 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PATCH 01/13] qtest/migration-test.c: Add tests with compress enabled
Date: Mon,  8 May 2023 17:26:45 +0200
Message-Id: <20230508152657.66701-2-quintela@redhat.com>
In-Reply-To: <20230508152657.66701-1-quintela@redhat.com>
References: <20230508152657.66701-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Lukas Straub <lukasstraub2@web.de>

There has never been tests for migration with compress enabled.

Add suitable tests, testing with compress-wait-thread = false
too.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Acked-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/migration-test.c | 109 +++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index be73ec3c06..ea0d3fad2a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -406,6 +406,41 @@ static void migrate_set_parameter_str(QTestState *who, const char *parameter,
     migrate_check_parameter_str(who, parameter, value);
 }
 
+static long long migrate_get_parameter_bool(QTestState *who,
+                                           const char *parameter)
+{
+    QDict *rsp;
+    int result;
+
+    rsp = wait_command(who, "{ 'execute': 'query-migrate-parameters' }");
+    result = qdict_get_bool(rsp, parameter);
+    qobject_unref(rsp);
+    return !!result;
+}
+
+static void migrate_check_parameter_bool(QTestState *who, const char *parameter,
+                                        int value)
+{
+    int result;
+
+    result = migrate_get_parameter_bool(who, parameter);
+    g_assert_cmpint(result, ==, value);
+}
+
+static void migrate_set_parameter_bool(QTestState *who, const char *parameter,
+                                      int value)
+{
+    QDict *rsp;
+
+    rsp = qtest_qmp(who,
+                    "{ 'execute': 'migrate-set-parameters',"
+                    "'arguments': { %s: %i } }",
+                    parameter, value);
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+    migrate_check_parameter_bool(who, parameter, value);
+}
+
 static void migrate_ensure_non_converge(QTestState *who)
 {
     /* Can't converge with 1ms downtime + 3 mbs bandwidth limit */
@@ -1524,6 +1559,70 @@ static void test_precopy_unix_xbzrle(void)
     test_precopy_common(&args);
 }
 
+static void *
+test_migrate_compress_start(QTestState *from,
+                            QTestState *to)
+{
+    migrate_set_parameter_int(from, "compress-level", 1);
+    migrate_set_parameter_int(from, "compress-threads", 4);
+    migrate_set_parameter_bool(from, "compress-wait-thread", true);
+    migrate_set_parameter_int(to, "decompress-threads", 4);
+
+    migrate_set_capability(from, "compress", true);
+    migrate_set_capability(to, "compress", true);
+
+    return NULL;
+}
+
+static void test_precopy_unix_compress(void)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
+        .connect_uri = uri,
+        .listen_uri = uri,
+        .start_hook = test_migrate_compress_start,
+        /*
+         * Test that no invalid thread state is left over from
+         * the previous iteration.
+         */
+        .iterations = 2,
+    };
+
+    test_precopy_common(&args);
+}
+
+static void *
+test_migrate_compress_nowait_start(QTestState *from,
+                                   QTestState *to)
+{
+    migrate_set_parameter_int(from, "compress-level", 9);
+    migrate_set_parameter_int(from, "compress-threads", 1);
+    migrate_set_parameter_bool(from, "compress-wait-thread", false);
+    migrate_set_parameter_int(to, "decompress-threads", 1);
+
+    migrate_set_capability(from, "compress", true);
+    migrate_set_capability(to, "compress", true);
+
+    return NULL;
+}
+
+static void test_precopy_unix_compress_nowait(void)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
+        .connect_uri = uri,
+        .listen_uri = uri,
+        .start_hook = test_migrate_compress_nowait_start,
+        /*
+         * Test that no invalid thread state is left over from
+         * the previous iteration.
+         */
+        .iterations = 2,
+    };
+
+    test_precopy_common(&args);
+}
+
 static void test_precopy_tcp_plain(void)
 {
     MigrateCommon args = {
@@ -2537,6 +2636,16 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
+    /*
+     * Compression fails from time to time.
+     * Put test here but don't enable it until everything is fixed.
+     */
+    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
+        qtest_add_func("/migration/precopy/unix/compress/wait",
+                       test_precopy_unix_compress);
+        qtest_add_func("/migration/precopy/unix/compress/nowait",
+                       test_precopy_unix_compress_nowait);
+    }
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
-- 
2.40.0


