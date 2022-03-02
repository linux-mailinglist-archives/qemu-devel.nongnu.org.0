Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B84CACE8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:04:53 +0100 (CET)
Received: from localhost ([::1]:45098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTLI-0006Ti-8J
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT8a-0000Ty-He
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT8Z-00013f-1H
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOSD65cbx7molMxuaFiyiTdouej8/JNOD7T7qrLJiA8=;
 b=Q9iE9FHUXyKVLFSzbMz+Fifd8tIMbaKY1//7Vrg1pfg43UzeOyR3MAcJ+U89bFQX0x1ZaV
 HTmyRGeYjOBN1dpZ7dhKyaWvkut+14fZH8cp3W6gRKdR4gz1v3Q4MiR2FD9YWuIkGjkOio
 l76yBiRtW6B+NTq3U+oQLywNuDV/kYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-omcqZVFDM221wz65nKpZ-A-1; Wed, 02 Mar 2022 12:51:41 -0500
X-MC-Unique: omcqZVFDM221wz65nKpZ-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C817824FA9
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:51:40 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD6378000B;
 Wed,  2 Mar 2022 17:51:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/18] tests: convert multifd migration tests to use common
 helper
Date: Wed,  2 Mar 2022 17:49:29 +0000
Message-Id: <20220302174932.2692378-16-berrange@redhat.com>
In-Reply-To: <20220302174932.2692378-1-berrange@redhat.com>
References: <20220302174932.2692378-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 tests/qtest/migration-test.c | 75 +++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 36 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 9896fcb134..7c69268aa8 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1716,26 +1716,12 @@ static void test_migrate_auto_converge(void)
     test_migrate_end(from, to, true);
 }
 
-static void test_multifd_tcp(const char *method)
+static void *
+test_migration_precopy_tcp_multifd_start_common(QTestState *from,
+                                                QTestState *to,
+                                                const char *method)
 {
-    MigrateStart *args = migrate_start_new();
-    QTestState *from, *to;
     QDict *rsp;
-    g_autofree char *uri = NULL;
-
-    if (test_migrate_start(&from, &to, "defer", args)) {
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
@@ -1751,41 +1737,58 @@ static void test_multifd_tcp(const char *method)
                            "  'arguments': { 'uri': 'tcp:127.0.0.1:0' }}");
     qobject_unref(rsp);
 
-    /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
-
-    uri = migrate_get_socket_address(to, "socket-address");
-
-    migrate_qmp(from, uri, "{}");
+    return NULL;
+}
 
-    wait_for_migration_pass(from);
+static void *
+test_migration_precopy_tcp_multifd_start(QTestState *from,
+                                         QTestState *to)
+{
+    return test_migration_precopy_tcp_multifd_start_common(from, to, "none");
+}
 
-    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
+static void *
+test_migration_precopy_tcp_multifd_zlib_start(QTestState *from,
+                                              QTestState *to)
+{
+    return test_migration_precopy_tcp_multifd_start_common(from, to, "zlib");
+}
 
-    if (!got_stop) {
-        qtest_qmp_eventwait(from, "STOP");
-    }
-    qtest_qmp_eventwait(to, "RESUME");
+#ifdef CONFIG_ZSTD
+static void *
+test_migration_precopy_tcp_multifd_zstd_start(QTestState *from,
+                                              QTestState *to)
+{
+    return test_migration_precopy_tcp_multifd_start_common(from, to, "zstd");
+}
+#endif /* CONFIG_ZSTD */
 
-    wait_for_serial("dest_serial");
-    wait_for_migration_complete(from);
-    test_migrate_end(from, to, true);
+static void test_multifd_tcp_common(TestMigrateStartHook start_hook)
+{
+    test_precopy_common("defer",
+                        NULL, /* connect_uri */
+                        start_hook,
+                        NULL, /* finish_hook */
+                        false, /* expect_fail */
+                        false, /* dst_quit */
+                        1, /* iterations */
+                        false /* dirty_ring */);
 }
 
 static void test_multifd_tcp_none(void)
 {
-    test_multifd_tcp("none");
+    test_multifd_tcp_common(test_migration_precopy_tcp_multifd_start);
 }
 
 static void test_multifd_tcp_zlib(void)
 {
-    test_multifd_tcp("zlib");
+    test_multifd_tcp_common(test_migration_precopy_tcp_multifd_zlib_start);
 }
 
 #ifdef CONFIG_ZSTD
 static void test_multifd_tcp_zstd(void)
 {
-    test_multifd_tcp("zstd");
+    test_multifd_tcp_common(test_migration_precopy_tcp_multifd_zstd_start);
 }
 #endif
 
-- 
2.34.1


