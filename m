Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EB6513942
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:59:15 +0200 (CEST)
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6Xy-0006SS-Mf
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk5KT-0005rv-O6
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk5KO-0006Yr-HD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:41:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651156867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jA70j6j/G55hEEyx9lTwK+rR8tBv4ItZ+1q7UpvJsMA=;
 b=K5vzh1KHjPWp2MZkFm7vZtfFbTbHoNtMKt7DDU42Jir4nI7PMCGuiYcxXoiEX5CdUOsXTH
 tDwDDLMg/odm/jMLEUbsgHrS3EOorUp1apG8UxUoNLLr4iEhKZoko3A/zTu5D+7MKmBfq3
 Wx+LzIgagyjiBrmwcdx6mapMS43ZEAo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-wDoPnqesPH2_xx8ewgDMFA-1; Thu, 28 Apr 2022 10:41:06 -0400
X-MC-Unique: wDoPnqesPH2_xx8ewgDMFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 300A81C05AF6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 14:41:06 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4346B407DEC3;
 Thu, 28 Apr 2022 14:41:05 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 03/11] tests: convert multifd migration tests to use common
 helper
Date: Thu, 28 Apr 2022 15:40:44 +0100
Message-Id: <20220428144052.263382-4-dgilbert@redhat.com>
In-Reply-To: <20220428144052.263382-1-dgilbert@redhat.com>
References: <20220428144052.263382-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Most of the multifd migration test logic is common with the rest of the
precopy tests, so it can use the helper without difficulty. The only
exception of the multifd cancellation test which tries to run multiple
migrations in a row.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220426160048.812266-7-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 77 +++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 359eb2cbb7..fc399e887f 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1244,26 +1244,12 @@ static void test_migrate_auto_converge(void)
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
@@ -1279,41 +1265,58 @@ static void test_multifd_tcp(const char *method)
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
2.35.1


