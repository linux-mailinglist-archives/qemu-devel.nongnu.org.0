Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95304CACC6
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:01:23 +0100 (CET)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTHu-0000ah-Ff
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:01:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7e-0006k4-Pf
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:50:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPT7d-0008GP-4z
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646243444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGZAWtFatd+vPWYjMpBXLDrBH8xG7IV8NMmk/m+YAjY=;
 b=FLXLUzFigx1aK1+JDTZBSTfLOjs1xXlnW6Pkv3PAUWUUcTnEiSFAInQ8FiLYLJUmj+BICv
 2LUnGsTBHlHWBKIE4P40NA+aH6CjoD0mm19F6PZPEbRvSRRyAripKk2YA2F8ci58PzvsV9
 pJ41EqvEHVaj9J3qmhWn3isH/XE2P2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370--2DORGt3MTm0hVA62I0qmw-1; Wed, 02 Mar 2022 12:50:43 -0500
X-MC-Unique: -2DORGt3MTm0hVA62I0qmw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8586F1091DA0
 for <qemu-devel@nongnu.org>; Wed,  2 Mar 2022 17:50:42 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 411D780012;
 Wed,  2 Mar 2022 17:50:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/18] tests: merge code for UNIX and TCP migration pre-copy
 tests
Date: Wed,  2 Mar 2022 17:49:22 +0000
Message-Id: <20220302174932.2692378-9-berrange@redhat.com>
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

The test cases differ only in the URI they provide to the migration
commands, and the ability to set the dirty_ring mode. This code is
trivially merged into a common helper.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 roms/seabios                 |  2 +-
 tests/qtest/migration-test.c | 86 ++++++++++++++++--------------------
 2 files changed, 40 insertions(+), 48 deletions(-)

diff --git a/roms/seabios b/roms/seabios
index 6a62e0cb0d..2dd4b9b3f8 160000
--- a/roms/seabios
+++ b/roms/seabios
@@ -1 +1 @@
-Subproject commit 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9
+Subproject commit 2dd4b9b3f84019668719344b40dba79d681be41c
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7b42f6fd90..c1058dc944 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -796,19 +796,34 @@ static void test_baddest(void)
     test_migrate_end(from, to, false);
 }
 
-static void test_precopy_unix_common(bool dirty_ring)
+/*
+ * Common helper for running a precopy migration test
+ *
+ * @listen_uri: the URI for the dst QEMU to listen on
+ * @connect_uri: the URI for the src QEMU to connect to
+ * @dirty_ring: true to use dirty ring tracking
+ *
+ * If @connect_uri is NULL, then it will query the dst
+ * QEMU for its actual listening address and use that
+ * as the connect address. This allows for dynamically
+ * picking a free TCP port.
+ */
+static void test_precopy_common(const char *listen_uri,
+                                const char *connect_uri,
+                                bool dirty_ring)
 {
-    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateStart *args = migrate_start_new();
+    g_autofree char *local_connect_uri = NULL;
     QTestState *from, *to;
 
     args->use_dirty_ring = dirty_ring;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, listen_uri, args)) {
         return;
     }
 
-    /* We want to pick a speed slow enough that the test completes
+    /*
+     * We want to pick a speed slow enough that the test completes
      * quickly, but that it doesn't complete precopy even on a slow
      * machine, so also set the downtime.
      */
@@ -820,7 +835,12 @@ static void test_precopy_unix_common(bool dirty_ring)
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
 
-    migrate_qmp(from, uri, "{}");
+    if (!connect_uri) {
+        local_connect_uri = migrate_get_socket_address(to, "socket-address");
+        connect_uri = local_connect_uri;
+    }
+
+    migrate_qmp(from, connect_uri, "{}");
 
     wait_for_migration_pass(from);
 
@@ -838,16 +858,23 @@ static void test_precopy_unix_common(bool dirty_ring)
     test_migrate_end(from, to, true);
 }
 
+static void test_precopy_unix_common(bool dirty_ring)
+{
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+
+    test_precopy_common(uri,
+                        uri,
+                        dirty_ring);
+}
+
 static void test_precopy_unix(void)
 {
-    /* Using default dirty logging */
-    test_precopy_unix_common(false);
+    test_precopy_unix_common(false /* dirty_ring */);
 }
 
 static void test_precopy_unix_dirty_ring(void)
 {
-    /* Using dirty ring tracking */
-    test_precopy_unix_common(true);
+    test_precopy_unix_common(true /* dirty_ring */);
 }
 
 #if 0
@@ -942,44 +969,9 @@ static void test_xbzrle_unix(void)
 
 static void test_precopy_tcp(void)
 {
-    MigrateStart *args = migrate_start_new();
-    g_autofree char *uri = NULL;
-    QTestState *from, *to;
-
-    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
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
-
-    /* Wait for the first serial output from the source */
-    wait_for_serial("src_serial");
-
-    uri = migrate_get_socket_address(to, "socket-address");
-
-    migrate_qmp(from, uri, "{}");
-
-    wait_for_migration_pass(from);
-
-    migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
-
-    if (!got_stop) {
-        qtest_qmp_eventwait(from, "STOP");
-    }
-    qtest_qmp_eventwait(to, "RESUME");
-
-    wait_for_serial("dest_serial");
-    wait_for_migration_complete(from);
-
-    test_migrate_end(from, to, true);
+    test_precopy_common("tcp:127.0.0.1:0",
+                        NULL, /* connect_uri */
+                        false /* dirty_ring */);
 }
 
 static void test_migrate_fd_proto(void)
-- 
2.34.1


