Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA464D5021
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:22:36 +0100 (CET)
Received: from localhost ([::1]:45260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMUl-0006BU-Kd
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:22:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRt-00039W-OU
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRs-0003fu-4o
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZA7caXOLNV1XjV9gly+DT8Ke/nk7v5qP8vfDFA26is=;
 b=bsFLb9I9CSgTisQTP6Vi8H9gV8UxCx6cj6kqxMmUpcNyn4yHQfLyH2898rY/U2WixubEeT
 Vsmp7ajOnCX/xWJMK2HpRA9Bbf6Hp+wKP6PdFns63oYs7P0k6n7yVsgW1Lb3IL4RArQgvj
 S8BCPush9GBuBI2mACQuM3fg8Y8V7NU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-9vBoC46OP9qkq3TaewsOrw-1; Thu, 10 Mar 2022 12:19:32 -0500
X-MC-Unique: 9vBoC46OP9qkq3TaewsOrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B8451DF
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:31 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DCB6106D5B8;
 Thu, 10 Mar 2022 17:19:29 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/18] tests: merge code for UNIX and TCP migration
 pre-copy tests
Date: Thu, 10 Mar 2022 17:18:11 +0000
Message-Id: <20220310171821.3724080-9-berrange@redhat.com>
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

The test cases differ only in the URI they provide to the migration
commands, and the ability to set the dirty_ring mode. This code is
trivially merged into a common helper.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 98 ++++++++++++++++++------------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 36e5408702..b62869b3af 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -778,19 +778,32 @@ static void test_baddest(void)
     test_migrate_end(from, to, false);
 }
 
-static void test_precopy_unix_common(bool dirty_ring)
+typedef struct {
+    /* Optional: fine tune start parameters */
+    MigrateStart start;
+
+    /* Required: the URI for the dst QEMU to listen on */
+    const char *listen_uri;
+
+    /*
+     * Optional: the URI for the src QEMU to connect to
+     * If NULL, then it will query the dst QEMU for its actual
+     * listening address and use that as the connect address.
+     * This allows for dynamically picking a free TCP port.
+     */
+    const char *connect_uri;
+} MigrateCommon;
+
+static void test_precopy_common(MigrateCommon *args)
 {
-    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
-    MigrateStart args = {
-        .use_dirty_ring = dirty_ring,
-    };
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, &args)) {
+    if (test_migrate_start(&from, &to, args->listen_uri, &args->start)) {
         return;
     }
 
-    /* We want to pick a speed slow enough that the test completes
+    /*
+     * We want to pick a speed slow enough that the test completes
      * quickly, but that it doesn't complete precopy even on a slow
      * machine, so also set the downtime.
      */
@@ -802,7 +815,14 @@ static void test_precopy_unix_common(bool dirty_ring)
     /* Wait for the first serial output from the source */
     wait_for_serial("src_serial");
 
-    migrate_qmp(from, uri, "{}");
+    if (!args->connect_uri) {
+        g_autofree char *local_connect_uri =
+            migrate_get_socket_address(to, "socket-address");
+        migrate_qmp(from, local_connect_uri, "{}");
+    } else {
+        migrate_qmp(from, args->connect_uri, "{}");
+    }
+
 
     wait_for_migration_pass(from);
 
@@ -822,14 +842,27 @@ static void test_precopy_unix_common(bool dirty_ring)
 
 static void test_precopy_unix(void)
 {
-    /* Using default dirty logging */
-    test_precopy_unix_common(false);
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
+        .listen_uri = uri,
+        .connect_uri = uri,
+    };
+
+    test_precopy_common(&args);
 }
 
 static void test_precopy_unix_dirty_ring(void)
 {
-    /* Using dirty ring tracking */
-    test_precopy_unix_common(true);
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    MigrateCommon args = {
+        .start = {
+            .use_dirty_ring = true,
+        },
+        .listen_uri = uri,
+        .connect_uri = uri,
+    };
+
+    test_precopy_common(&args);
 }
 
 #if 0
@@ -924,44 +957,11 @@ static void test_xbzrle_unix(void)
 
 static void test_precopy_tcp(void)
 {
-    MigrateStart args = {};
-    g_autofree char *uri = NULL;
-    QTestState *from, *to;
-
-    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", &args)) {
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
+    MigrateCommon args = {
+        .listen_uri = "tcp:127.0.0.1:0",
+    };
 
-    test_migrate_end(from, to, true);
+    test_precopy_common(&args);
 }
 
 static void test_migrate_fd_proto(void)
-- 
2.34.1


