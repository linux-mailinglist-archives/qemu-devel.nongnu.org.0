Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F309C4D508C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:31:08 +0100 (CET)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMd2-0000ZO-2q
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:31:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMSD-0003TT-4F
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMS7-0003h4-MX
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+e6xwQKC+J6Moy57ht5XZZOIKZofbKtm2VvSVMETJj8=;
 b=imV90B0UrCRHLUkTTIHXEtJDsCBTB6yjDj7GJht7w+arqiajEKDpvAjwZ6kTgtsLlrGr0z
 neg8h7YyqAl4HrWJaJApD+DfmIeBH6LjiQpz8FkoGS4PO1Ua4EAo69Zci/ugPqww7vLaFJ
 AGUFKI3k3HoxSAKRrrTnCkFBo7Udde4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-DTYMRsOENWmgdReYXjrjTg-1; Thu, 10 Mar 2022 12:19:49 -0500
X-MC-Unique: DTYMRsOENWmgdReYXjrjTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C4A651E0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:48 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EC01106D5B8;
 Thu, 10 Mar 2022 17:19:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/18] tests: convert multifd migration tests to use common
 helper
Date: Thu, 10 Mar 2022 17:18:18 +0000
Message-Id: <20220310171821.3724080-16-berrange@redhat.com>
In-Reply-To: <20220310171821.3724080-1-berrange@redhat.com>
References: <20220310171821.3724080-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of the multifd migration test logic is common with the rest of the
precopy tests, so it can use the helper without difficulty. The only
exception of the multifd cancellation test which tries to run multiple
migrations in a row.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 77 +++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 043ae94089..c1b0b3aca4 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1739,26 +1739,12 @@ static void test_migrate_auto_converge(void)
     test_migrate_end(from, to, true);
 }
 
-static void test_multifd_tcp(const char *method)
+static void *
+test_migrate_precopy_tcp_multifd_start_common(QTestState *from,
+                                              QTestState *to,
+                                              const char *method)
 {
-    MigrateStart args = {};
-    QTestState *from, *to;
     QDict *rsp;
-    g_autofree char *uri = NULL;
-
-    if (test_migrate_start(&from, &to, "defer", &args)) {
-        return;
-    }
-
-    /*
-     * We want to pick a speed slow enough that the test completes
-     * quickly, but that it doesn't complete precopy even on a slow
-     * machine, so also set the downtime.
-     */
-    /* 1 ms should make it not converge*/
-    migrate_set_parameter_int(from, "downtime-limit", 1);
-    /* 1GB/s */
-    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
 
     migrate_set_parameter_int(from, "multifd-channels", 16);
     migrate_set_parameter_int(to, "multifd-channels", 16);
@@ -1774,41 +1760,58 @@ static void test_multifd_tcp(const char *method)
                            "  'arguments': { 'uri': 'tcp:127.0.0.1:0' }}");
     qobject_unref(rsp);
 
-    /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
-
-    uri = migrate_get_socket_address(to, "socket-address");
-
-    migrate_qmp(from, uri, "{}");
-
-    wait_for_migration_pass(from);
+    return NULL;
+}
 
-    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
+static void *
+test_migrate_precopy_tcp_multifd_start(QTestState *from,
+                                       QTestState *to)
+{
+    return test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+}
 
-    if (!got_stop) {
-        qtest_qmp_eventwait(from, "STOP");
-    }
-    qtest_qmp_eventwait(to, "RESUME");
+static void *
+test_migrate_precopy_tcp_multifd_zlib_start(QTestState *from,
+                                            QTestState *to)
+{
+    return test_migrate_precopy_tcp_multifd_start_common(from, to, "zlib");
+}
 
-    wait_for_serial("dest_serial");
-    wait_for_migration_complete(from);
-    test_migrate_end(from, to, true);
+#ifdef CONFIG_ZSTD
+static void *
+test_migrate_precopy_tcp_multifd_zstd_start(QTestState *from,
+                                            QTestState *to)
+{
+    return test_migrate_precopy_tcp_multifd_start_common(from, to, "zstd");
 }
+#endif /* CONFIG_ZSTD */
 
 static void test_multifd_tcp_none(void)
 {
-    test_multifd_tcp("none");
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_precopy_tcp_multifd_start,
+    };
+    test_precopy_common(&args);
 }
 
 static void test_multifd_tcp_zlib(void)
 {
-    test_multifd_tcp("zlib");
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_precopy_tcp_multifd_zlib_start,
+    };
+    test_precopy_common(&args);
 }
 
 #ifdef CONFIG_ZSTD
 static void test_multifd_tcp_zstd(void)
 {
-    test_multifd_tcp("zstd");
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_precopy_tcp_multifd_zstd_start,
+    };
+    test_precopy_common(&args);
 }
 #endif
 
-- 
2.34.1


