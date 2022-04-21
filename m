Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE450A878
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 20:51:00 +0200 (CEST)
Received: from localhost ([::1]:55790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhbtL-0000il-Au
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 14:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjp-0001cN-6d
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhbjn-0005yp-EV
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 14:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650566466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlSZaUzoh9JQ9tUc4GoYHabSOHix6gUQiealBLtK/NE=;
 b=DHW/3tXBNUmVQaS5zv/nWog212WVY5fgP7KCeG8U1wBGMb+N92lUcl2ssvKu8aUcmUHL8x
 JFumluj5i50J+CBqcxbhuE0KwCGDVJEP2XF65K/nXQpkQZpxQ7sKhtR8PzYZnAP9GDd4YY
 5x7LrNKh0hfOraRXoKUg6pPMPoPiCHI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-bHi-kh4jOoeO0mWPG8NLCg-1; Thu, 21 Apr 2022 14:41:05 -0400
X-MC-Unique: bHi-kh4jOoeO0mWPG8NLCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68FF0803C9F
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 18:41:05 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1F2F404D2F0;
 Thu, 21 Apr 2022 18:41:04 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	peterx@redhat.com,
	berrange@redhat.com
Subject: [PULL 06/18] tests: merge code for UNIX and TCP migration pre-copy
 tests
Date: Thu, 21 Apr 2022 19:40:40 +0100
Message-Id: <20220421184052.306581-7-dgilbert@redhat.com>
In-Reply-To: <20220421184052.306581-1-dgilbert@redhat.com>
References: <20220421184052.306581-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The test cases differ only in the URI they provide to the migration
commands, and the ability to set the dirty_ring mode. This code is
trivially merged into a common helper.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220310171821.3724080-9-berrange@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.35.1


