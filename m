Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE77B4D508B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:30:38 +0100 (CET)
Received: from localhost ([::1]:44136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMcX-0007h7-Qv
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:30:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMS0-0003Ba-2I
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSMRv-0003gG-DJ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646932778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RC3zJQmlDvqT0CKuixJsJ2wasnTCA1ZMcgYTkMpAFSw=;
 b=LZkpHtB+tE9VS0aeKe46Y6fqsCASwC1dPVVuQk5iBrTQVVxIYFgRbWJrbkM01dYCmZiHWB
 +uPnsJGYaC3CSchHwgko4L5mDFtkJBWDLdLOwGRWIpGY149E3mRfeB7dz96OW4sD82Fasy
 jcUYD5hXqoPhtSrLusGDjg4mJ7As0n4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-sI5QwitPNJyoZT6ntt_xYw-1; Thu, 10 Mar 2022 12:19:30 -0500
X-MC-Unique: sI5QwitPNJyoZT6ntt_xYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26AE0801DDB
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 17:19:29 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C5E3101E692;
 Thu, 10 Mar 2022 17:19:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/18] tests: switch MigrateStart struct to be stack
 allocated
Date: Thu, 10 Mar 2022 17:18:10 +0000
Message-Id: <20220310171821.3724080-8-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

There's no compelling reason why the MigrateStart struct needs to be
heap allocated. Using stack allocation and static initializers is
simpler.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 134 +++++++++++++++--------------------
 1 file changed, 56 insertions(+), 78 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 0870656d82..36e5408702 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -474,28 +474,12 @@ typedef struct {
     bool only_target;
     /* Use dirty ring if true; dirty logging otherwise */
     bool use_dirty_ring;
-    char *opts_source;
-    char *opts_target;
+    const char *opts_source;
+    const char *opts_target;
 } MigrateStart;
 
-static MigrateStart *migrate_start_new(void)
-{
-    MigrateStart *args = g_new0(MigrateStart, 1);
-
-    args->opts_source = g_strdup("");
-    args->opts_target = g_strdup("");
-    return args;
-}
-
-static void migrate_start_destroy(MigrateStart *args)
-{
-    g_free(args->opts_source);
-    g_free(args->opts_target);
-    g_free(args);
-}
-
 static int test_migrate_start(QTestState **from, QTestState **to,
-                              const char *uri, MigrateStart **pargs)
+                              const char *uri, MigrateStart *args)
 {
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
@@ -507,15 +491,12 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     g_autofree char *shmem_path = NULL;
     const char *arch = qtest_get_arch();
     const char *machine_opts = NULL;
-    MigrateStart *args = *pargs;
     const char *memory_size;
-    int ret = 0;
 
     if (args->use_shmem) {
         if (!g_file_test("/dev/shm", G_FILE_TEST_IS_DIR)) {
             g_test_skip("/dev/shm is not supported");
-            ret = -1;
-            goto out;
+            return -1;
         }
     }
 
@@ -591,7 +572,8 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                  machine_opts ? " -machine " : "",
                                  machine_opts ? machine_opts : "",
                                  memory_size, tmpfs,
-                                 arch_source, shmem_opts, args->opts_source,
+                                 arch_source, shmem_opts,
+                                 args->opts_source ? args->opts_source : "",
                                  ignore_stderr);
     if (!args->only_target) {
         *from = qtest_init(cmd_source);
@@ -609,7 +591,8 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                  machine_opts ? machine_opts : "",
                                  memory_size, tmpfs, uri,
                                  arch_target, shmem_opts,
-                                 args->opts_target, ignore_stderr);
+                                 args->opts_target ? args->opts_target : "",
+                                 ignore_stderr);
     *to = qtest_init(cmd_target);
 
     /*
@@ -620,11 +603,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         unlink(shmem_path);
     }
 
-out:
-    migrate_start_destroy(args);
-    /* This tells the caller that this structure is gone */
-    *pargs = NULL;
-    return ret;
+    return 0;
 }
 
 static void test_migrate_end(QTestState *from, QTestState *to, bool test_dest)
@@ -668,7 +647,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, &args)) {
+    if (test_migrate_start(&from, &to, uri, args)) {
         return -1;
     }
 
@@ -712,10 +691,10 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
 
 static void test_postcopy(void)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {};
     QTestState *from, *to;
 
-    if (migrate_postcopy_prepare(&from, &to, args)) {
+    if (migrate_postcopy_prepare(&from, &to, &args)) {
         return;
     }
     migrate_postcopy_start(from, to);
@@ -724,13 +703,13 @@ static void test_postcopy(void)
 
 static void test_postcopy_recovery(void)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {
+        .hide_stderr = true,
+    };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
-    args->hide_stderr = true;
-
-    if (migrate_postcopy_prepare(&from, &to, args)) {
+    if (migrate_postcopy_prepare(&from, &to, &args)) {
         return;
     }
 
@@ -786,11 +765,11 @@ static void test_postcopy_recovery(void)
 
 static void test_baddest(void)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {
+        .hide_stderr = true
+    };
     QTestState *from, *to;
 
-    args->hide_stderr = true;
-
     if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", &args)) {
         return;
     }
@@ -802,11 +781,11 @@ static void test_baddest(void)
 static void test_precopy_unix_common(bool dirty_ring)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {
+        .use_dirty_ring = dirty_ring,
+    };
     QTestState *from, *to;
 
-    args->use_dirty_ring = dirty_ring;
-
     if (test_migrate_start(&from, &to, uri, &args)) {
         return;
     }
@@ -892,7 +871,7 @@ static void test_ignore_shared(void)
 
 static void test_xbzrle(const char *uri)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {};
     QTestState *from, *to;
 
     if (test_migrate_start(&from, &to, uri, &args)) {
@@ -945,7 +924,7 @@ static void test_xbzrle_unix(void)
 
 static void test_precopy_tcp(void)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {};
     g_autofree char *uri = NULL;
     QTestState *from, *to;
 
@@ -987,7 +966,7 @@ static void test_precopy_tcp(void)
 
 static void test_migrate_fd_proto(void)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {};
     QTestState *from, *to;
     int ret;
     int pair[2];
@@ -1074,7 +1053,7 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, &args)) {
+    if (test_migrate_start(&from, &to, uri, args)) {
         return;
     }
 
@@ -1103,51 +1082,49 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
 
 static void test_validate_uuid(void)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {
+        .opts_source = "-uuid 11111111-1111-1111-1111-111111111111",
+        .opts_target = "-uuid 11111111-1111-1111-1111-111111111111",
+    };
 
-    g_free(args->opts_source);
-    g_free(args->opts_target);
-    args->opts_source = g_strdup("-uuid 11111111-1111-1111-1111-111111111111");
-    args->opts_target = g_strdup("-uuid 11111111-1111-1111-1111-111111111111");
-    do_test_validate_uuid(args, false);
+    do_test_validate_uuid(&args, false);
 }
 
 static void test_validate_uuid_error(void)
 {
-    MigrateStart *args = migrate_start_new();
-
-    g_free(args->opts_source);
-    g_free(args->opts_target);
-    args->opts_source = g_strdup("-uuid 11111111-1111-1111-1111-111111111111");
-    args->opts_target = g_strdup("-uuid 22222222-2222-2222-2222-222222222222");
-    args->hide_stderr = true;
-    do_test_validate_uuid(args, true);
+    MigrateStart args = {
+        .opts_source = "-uuid 11111111-1111-1111-1111-111111111111",
+        .opts_target = "-uuid 22222222-2222-2222-2222-222222222222",
+        .hide_stderr = true,
+    };
+
+    do_test_validate_uuid(&args, true);
 }
 
 static void test_validate_uuid_src_not_set(void)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {
+        .opts_target = "-uuid 22222222-2222-2222-2222-222222222222",
+        .hide_stderr = true,
+    };
 
-    g_free(args->opts_target);
-    args->opts_target = g_strdup("-uuid 22222222-2222-2222-2222-222222222222");
-    args->hide_stderr = true;
-    do_test_validate_uuid(args, false);
+    do_test_validate_uuid(&args, false);
 }
 
 static void test_validate_uuid_dst_not_set(void)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {
+        .opts_source = "-uuid 11111111-1111-1111-1111-111111111111",
+        .hide_stderr = true,
+    };
 
-    g_free(args->opts_source);
-    args->opts_source = g_strdup("-uuid 11111111-1111-1111-1111-111111111111");
-    args->hide_stderr = true;
-    do_test_validate_uuid(args, false);
+    do_test_validate_uuid(&args, false);
 }
 
 static void test_migrate_auto_converge(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {};
     QTestState *from, *to;
     int64_t remaining, percentage;
 
@@ -1230,7 +1207,7 @@ static void test_migrate_auto_converge(void)
 
 static void test_multifd_tcp(const char *method)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {};
     QTestState *from, *to;
     QDict *rsp;
     g_autofree char *uri = NULL;
@@ -1314,13 +1291,13 @@ static void test_multifd_tcp_zstd(void)
  */
 static void test_multifd_tcp_cancel(void)
 {
-    MigrateStart *args = migrate_start_new();
+    MigrateStart args = {
+        .hide_stderr = true,
+    };
     QTestState *from, *to, *to2;
     QDict *rsp;
     g_autofree char *uri = NULL;
 
-    args->hide_stderr = true;
-
     if (test_migrate_start(&from, &to, "defer", &args)) {
         return;
     }
@@ -1357,8 +1334,9 @@ static void test_multifd_tcp_cancel(void)
 
     migrate_cancel(from);
 
-    args = migrate_start_new();
-    args->only_target = true;
+    args = (MigrateStart){
+        .only_target = true,
+    };
 
     if (test_migrate_start(&from, &to2, "defer", &args)) {
         return;
-- 
2.34.1


