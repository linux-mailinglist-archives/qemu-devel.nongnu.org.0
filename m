Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490023809CA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:42:43 +0200 (CEST)
Received: from localhost ([::1]:43378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhX9O-0000zj-Bp
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWk0-0001GM-Ra
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjq-0005Fz-Fv
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jP1KnCaOQAK1rlZjVBFS+c5ftmWXFlXtg8ELoUTXETg=;
 b=RV+GkDZkSkqo41sI0u6O6YKF7rWQKLat2spxSeBuw2UcFkE7UC+A5VvStplIh+kRDxpwaD
 e9W9/y+Nyt4wkcY9BQA7wlvlmyT+G2Kjdt6uNo5qn9Gdr5ae77kZ2CCX8o6jiXLB43KP+U
 sFLqnIDllZnKMS54thzmQ1yrdbzkPV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-pcm-_wp-NCqqVWv2MLVg6w-1; Fri, 14 May 2021 08:16:15 -0400
X-MC-Unique: pcm-_wp-NCqqVWv2MLVg6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E5C19F92E;
 Fri, 14 May 2021 12:16:14 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D37C60C5D;
 Fri, 14 May 2021 12:16:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 18/20] tests/qtest/migration-test: Use g_autofree to avoid
 leaks on error paths
Date: Fri, 14 May 2021 14:15:16 +0200
Message-Id: <20210514121518.832729-19-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
References: <20210514121518.832729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity notices that several places in the migration-test code fail
to free memory in error-exit paths.  This is pretty unimportant in
test case code, but we can avoid having to manually free the memory
entirely by using g_autofree.

The places where Coverity spotted a leak were relating to early exits
not freeing 'uri' in test_precopy_unix(), do_test_validate_uuid(),
migrate_postcopy_prepare() and test_migrate_auto_converge().  This
patch converts all the string-allocation in the test code to
g_autofree for consistency.

Fixes: Coverity CID 1432313, 1432315, 1432352, 1432364
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210506185819.9010-1-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/migration-test.c | 61 ++++++++++++------------------------
 1 file changed, 20 insertions(+), 41 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 4d989f191b..2b028df687 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -110,13 +110,12 @@ static void init_bootfile(const char *bootpath, void *content, size_t len)
  */
 static void wait_for_serial(const char *side)
 {
-    char *serialpath = g_strdup_printf("%s/%s", tmpfs, side);
+    g_autofree char *serialpath = g_strdup_printf("%s/%s", tmpfs, side);
     FILE *serialfile = fopen(serialpath, "r");
     const char *arch = qtest_get_arch();
     int started = (strcmp(side, "src_serial") == 0 &&
                    strcmp(arch, "ppc64") == 0) ? 0 : 1;
 
-    g_free(serialpath);
     do {
         int readvalue = fgetc(serialfile);
 
@@ -274,10 +273,9 @@ static void check_guests_ram(QTestState *who)
 
 static void cleanup(const char *filename)
 {
-    char *path = g_strdup_printf("%s/%s", tmpfs, filename);
+    g_autofree char *path = g_strdup_printf("%s/%s", tmpfs, filename);
 
     unlink(path);
-    g_free(path);
 }
 
 static char *SocketAddress_to_str(SocketAddress *addr)
@@ -374,11 +372,8 @@ static char *migrate_get_parameter_str(QTestState *who,
 static void migrate_check_parameter_str(QTestState *who, const char *parameter,
                                         const char *value)
 {
-    char *result;
-
-    result = migrate_get_parameter_str(who, parameter);
+    g_autofree char *result = migrate_get_parameter_str(who, parameter);
     g_assert_cmpstr(result, ==, value);
-    g_free(result);
 }
 
 static void migrate_set_parameter_str(QTestState *who, const char *parameter,
@@ -495,12 +490,14 @@ static void migrate_start_destroy(MigrateStart *args)
 static int test_migrate_start(QTestState **from, QTestState **to,
                               const char *uri, MigrateStart *args)
 {
-    gchar *arch_source, *arch_target;
-    gchar *cmd_source, *cmd_target;
+    g_autofree gchar *arch_source = NULL;
+    g_autofree gchar *arch_target = NULL;
+    g_autofree gchar *cmd_source = NULL;
+    g_autofree gchar *cmd_target = NULL;
     const gchar *ignore_stderr;
-    char *bootpath = NULL;
-    char *shmem_opts;
-    char *shmem_path;
+    g_autofree char *bootpath = NULL;
+    g_autofree char *shmem_opts = NULL;
+    g_autofree char *shmem_path = NULL;
     const char *arch = qtest_get_arch();
     const char *machine_opts = NULL;
     const char *memory_size;
@@ -559,8 +556,6 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         g_assert_not_reached();
     }
 
-    g_free(bootpath);
-
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
         ignore_stderr = "2>/dev/null";
     } else {
@@ -588,11 +583,9 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                  memory_size, tmpfs,
                                  arch_source, shmem_opts, args->opts_source,
                                  ignore_stderr);
-    g_free(arch_source);
     if (!args->only_target) {
         *from = qtest_init(cmd_source);
     }
-    g_free(cmd_source);
 
     cmd_target = g_strdup_printf("-accel kvm -accel tcg%s%s "
                                  "-name target,debug-threads=on "
@@ -605,18 +598,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
                                  memory_size, tmpfs, uri,
                                  arch_target, shmem_opts,
                                  args->opts_target, ignore_stderr);
-    g_free(arch_target);
     *to = qtest_init(cmd_target);
-    g_free(cmd_target);
 
-    g_free(shmem_opts);
     /*
      * Remove shmem file immediately to avoid memory leak in test failed case.
      * It's valid becase QEMU has already opened this file
      */
     if (args->use_shmem) {
         unlink(shmem_path);
-        g_free(shmem_path);
     }
 
 out:
@@ -662,7 +651,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
                                     QTestState **to_ptr,
                                     MigrateStart *args)
 {
-    char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
     if (test_migrate_start(&from, &to, uri, args)) {
@@ -684,7 +673,6 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     wait_for_serial("src_serial");
 
     migrate_qmp(from, uri, "{}");
-    g_free(uri);
 
     wait_for_migration_pass(from);
 
@@ -724,7 +712,7 @@ static void test_postcopy_recovery(void)
 {
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
-    char *uri;
+    g_autofree char *uri = NULL;
 
     args->hide_stderr = true;
 
@@ -775,7 +763,6 @@ static void test_postcopy_recovery(void)
                               (const char * []) { "failed", "active",
                                                   "completed", NULL });
     migrate_qmp(from, uri, "{'resume': true}");
-    g_free(uri);
 
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
@@ -800,7 +787,7 @@ static void test_baddest(void)
 
 static void test_precopy_unix(void)
 {
-    char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
 
@@ -836,14 +823,13 @@ static void test_precopy_unix(void)
     wait_for_migration_complete(from);
 
     test_migrate_end(from, to, true);
-    g_free(uri);
 }
 
 #if 0
 /* Currently upset on aarch64 TCG */
 static void test_ignore_shared(void)
 {
-    char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
     if (test_migrate_start(&from, &to, uri, false, true, NULL, NULL)) {
@@ -873,7 +859,6 @@ static void test_ignore_shared(void)
     g_assert_cmpint(read_ram_property_int(from, "transferred"), <, 1024 * 1024);
 
     test_migrate_end(from, to, true);
-    g_free(uri);
 }
 #endif
 
@@ -925,16 +910,15 @@ static void test_xbzrle(const char *uri)
 
 static void test_xbzrle_unix(void)
 {
-    char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
 
     test_xbzrle(uri);
-    g_free(uri);
 }
 
 static void test_precopy_tcp(void)
 {
     MigrateStart *args = migrate_start_new();
-    char *uri;
+    g_autofree char *uri = NULL;
     QTestState *from, *to;
 
     if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
@@ -971,7 +955,6 @@ static void test_precopy_tcp(void)
     wait_for_migration_complete(from);
 
     test_migrate_end(from, to, true);
-    g_free(uri);
 }
 
 static void test_migrate_fd_proto(void)
@@ -1060,7 +1043,7 @@ static void test_migrate_fd_proto(void)
 
 static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
 {
-    char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
     if (test_migrate_start(&from, &to, uri, args)) {
@@ -1088,7 +1071,6 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
     }
 
     test_migrate_end(from, to, false);
-    g_free(uri);
 }
 
 static void test_validate_uuid(void)
@@ -1136,7 +1118,7 @@ static void test_validate_uuid_dst_not_set(void)
 
 static void test_migrate_auto_converge(void)
 {
-    char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
     int64_t remaining, percentage;
@@ -1214,7 +1196,6 @@ static void test_migrate_auto_converge(void)
     wait_for_serial("dest_serial");
     wait_for_migration_complete(from);
 
-    g_free(uri);
 
     test_migrate_end(from, to, true);
 }
@@ -1224,7 +1205,7 @@ static void test_multifd_tcp(const char *method)
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
     QDict *rsp;
-    char *uri;
+    g_autofree char *uri = NULL;
 
     if (test_migrate_start(&from, &to, "defer", args)) {
         return;
@@ -1273,7 +1254,6 @@ static void test_multifd_tcp(const char *method)
     wait_for_serial("dest_serial");
     wait_for_migration_complete(from);
     test_migrate_end(from, to, true);
-    g_free(uri);
 }
 
 static void test_multifd_tcp_none(void)
@@ -1309,7 +1289,7 @@ static void test_multifd_tcp_cancel(void)
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to, *to2;
     QDict *rsp;
-    char *uri;
+    g_autofree char *uri = NULL;
 
     args->hide_stderr = true;
 
@@ -1387,7 +1367,6 @@ static void test_multifd_tcp_cancel(void)
     wait_for_serial("dest_serial");
     wait_for_migration_complete(from);
     test_migrate_end(from, to2, true);
-    g_free(uri);
 }
 
 int main(int argc, char **argv)
-- 
2.27.0


