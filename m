Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1EBB111F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 16:29:17 +0200 (CEST)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Q60-0008Mz-TD
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 10:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i8PUu-0007FM-LQ
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i8PUs-0003E8-IZ
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:50:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50194)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i8PUs-0003DR-94
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 09:50:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 875CD10C0929;
 Thu, 12 Sep 2019 13:50:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33FA45D704;
 Thu, 12 Sep 2019 13:50:52 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, ivanren@tencent.com, peterx@redhat.com,
 richardw.yang@linux.intel.com, yury-kotov@yandex-team.ru,
 quintela@redhat.com
Date: Thu, 12 Sep 2019 14:50:02 +0100
Message-Id: <20190912135006.14820-9-dgilbert@redhat.com>
In-Reply-To: <20190912135006.14820-1-dgilbert@redhat.com>
References: <20190912135006.14820-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Thu, 12 Sep 2019 13:50:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 08/12] tests/migration: Add a test for
 validate-uuid capability
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yury Kotov <yury-kotov@yandex-team.ru>

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
Message-Id: <20190903162246.18524-4-yury-kotov@yandex-team.ru>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/migration-test.c | 140 ++++++++++++++++++++++++++++++++---------
 1 file changed, 110 insertions(+), 30 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index a9f81cc185..258aa064d4 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -512,7 +512,8 @@ static void migrate_postcopy_start(QTestState *from, =
QTestState *to)
=20
 static int test_migrate_start(QTestState **from, QTestState **to,
                                const char *uri, bool hide_stderr,
-                               bool use_shmem)
+                               bool use_shmem, const char *opts_src,
+                               const char *opts_dst)
 {
     gchar *cmd_src, *cmd_dst;
     char *bootpath =3D NULL;
@@ -521,6 +522,9 @@ static int test_migrate_start(QTestState **from, QTes=
tState **to,
     const char *arch =3D qtest_get_arch();
     const char *accel =3D "kvm:tcg";
=20
+    opts_src =3D opts_src ? opts_src : "";
+    opts_dst =3D opts_dst ? opts_dst : "";
+
     if (use_shmem) {
         if (!g_file_test("/dev/shm", G_FILE_TEST_IS_DIR)) {
             g_test_skip("/dev/shm is not supported");
@@ -539,16 +543,16 @@ static int test_migrate_start(QTestState **from, QT=
estState **to,
         cmd_src =3D g_strdup_printf("-machine accel=3D%s -m 150M"
                                   " -name source,debug-threads=3Don"
                                   " -serial file:%s/src_serial"
-                                  " -drive file=3D%s,format=3Draw %s",
+                                  " -drive file=3D%s,format=3Draw %s %s"=
,
                                   accel, tmpfs, bootpath,
-                                  extra_opts ? extra_opts : "");
+                                  extra_opts ? extra_opts : "", opts_src=
);
         cmd_dst =3D g_strdup_printf("-machine accel=3D%s -m 150M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial"
                                   " -drive file=3D%s,format=3Draw"
-                                  " -incoming %s %s",
+                                  " -incoming %s %s %s",
                                   accel, tmpfs, bootpath, uri,
-                                  extra_opts ? extra_opts : "");
+                                  extra_opts ? extra_opts : "", opts_dst=
);
         start_address =3D X86_TEST_MEM_START;
         end_address =3D X86_TEST_MEM_END;
     } else if (g_str_equal(arch, "s390x")) {
@@ -556,15 +560,15 @@ static int test_migrate_start(QTestState **from, QT=
estState **to,
         extra_opts =3D use_shmem ? get_shmem_opts("128M", shmem_path) : =
NULL;
         cmd_src =3D g_strdup_printf("-machine accel=3D%s -m 128M"
                                   " -name source,debug-threads=3Don"
-                                  " -serial file:%s/src_serial -bios %s =
%s",
+                                  " -serial file:%s/src_serial -bios %s =
%s %s",
                                   accel, tmpfs, bootpath,
-                                  extra_opts ? extra_opts : "");
+                                  extra_opts ? extra_opts : "", opts_src=
);
         cmd_dst =3D g_strdup_printf("-machine accel=3D%s -m 128M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial -bios %s=
"
-                                  " -incoming %s %s",
+                                  " -incoming %s %s %s",
                                   accel, tmpfs, bootpath, uri,
-                                  extra_opts ? extra_opts : "");
+                                  extra_opts ? extra_opts : "", opts_dst=
);
         start_address =3D S390_TEST_MEM_START;
         end_address =3D S390_TEST_MEM_END;
     } else if (strcmp(arch, "ppc64") =3D=3D 0) {
@@ -575,14 +579,15 @@ static int test_migrate_start(QTestState **from, QT=
estState **to,
                                   " -prom-env 'use-nvramrc?=3Dtrue' -pro=
m-env "
                                   "'nvramrc=3Dhex .\" _\" begin %x %x "
                                   "do i c@ 1 + i c! 1000 +loop .\" B\" 0=
 "
-                                  "until' %s",  accel, tmpfs, end_addres=
s,
-                                  start_address, extra_opts ? extra_opts=
 : "");
+                                  "until' %s %s",  accel, tmpfs, end_add=
ress,
+                                  start_address, extra_opts ? extra_opts=
 : "",
+                                  opts_src);
         cmd_dst =3D g_strdup_printf("-machine accel=3D%s -m 256M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial"
-                                  " -incoming %s %s",
+                                  " -incoming %s %s %s",
                                   accel, tmpfs, uri,
-                                  extra_opts ? extra_opts : "");
+                                  extra_opts ? extra_opts : "", opts_dst=
);
=20
         start_address =3D PPC_TEST_MEM_START;
         end_address =3D PPC_TEST_MEM_END;
@@ -592,16 +597,16 @@ static int test_migrate_start(QTestState **from, QT=
estState **to,
         cmd_src =3D g_strdup_printf("-machine virt,accel=3D%s,gic-versio=
n=3Dmax "
                                   "-name vmsource,debug-threads=3Don -cp=
u max "
                                   "-m 150M -serial file:%s/src_serial "
-                                  "-kernel %s %s",
+                                  "-kernel %s %s %s",
                                   accel, tmpfs, bootpath,
-                                  extra_opts ? extra_opts : "");
+                                  extra_opts ? extra_opts : "", opts_src=
);
         cmd_dst =3D g_strdup_printf("-machine virt,accel=3D%s,gic-versio=
n=3Dmax "
                                   "-name vmdest,debug-threads=3Don -cpu =
max "
                                   "-m 150M -serial file:%s/dest_serial "
                                   "-kernel %s "
-                                  "-incoming %s %s",
+                                  "-incoming %s %s %s",
                                   accel, tmpfs, bootpath, uri,
-                                  extra_opts ? extra_opts : "");
+                                  extra_opts ? extra_opts : "", opts_dst=
);
=20
         start_address =3D ARM_TEST_MEM_START;
         end_address =3D ARM_TEST_MEM_END;
@@ -731,7 +736,7 @@ static int migrate_postcopy_prepare(QTestState **from=
_ptr,
     char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
=20
-    if (test_migrate_start(&from, &to, uri, hide_error, false)) {
+    if (test_migrate_start(&from, &to, uri, hide_error, false, NULL, NUL=
L)) {
         return -1;
     }
=20
@@ -841,20 +846,16 @@ static void test_postcopy_recovery(void)
     migrate_postcopy_complete(from, to);
 }
=20
-static void test_baddest(void)
+static void wait_for_migration_fail(QTestState *from, bool allow_active)
 {
-    QTestState *from, *to;
     QDict *rsp_return;
     char *status;
     bool failed;
=20
-    if (test_migrate_start(&from, &to, "tcp:0:0", true, false)) {
-        return;
-    }
-    migrate(from, "tcp:0:0", "{}");
     do {
         status =3D migrate_query_status(from);
-        g_assert(!strcmp(status, "setup") || !(strcmp(status, "failed"))=
);
+        g_assert(!strcmp(status, "setup") || !strcmp(status, "failed") |=
|
+                 (allow_active && !strcmp(status, "active")));
         failed =3D !strcmp(status, "failed");
         g_free(status);
     } while (!failed);
@@ -864,7 +865,17 @@ static void test_baddest(void)
     g_assert(qdict_haskey(rsp_return, "running"));
     g_assert(qdict_get_bool(rsp_return, "running"));
     qobject_unref(rsp_return);
+}
+
+static void test_baddest(void)
+{
+    QTestState *from, *to;
=20
+    if (test_migrate_start(&from, &to, "tcp:0:0", true, false, NULL, NUL=
L)) {
+        return;
+    }
+    migrate(from, "tcp:0:0", "{}");
+    wait_for_migration_fail(from, false);
     test_migrate_end(from, to, false);
 }
=20
@@ -873,7 +884,7 @@ static void test_precopy_unix(void)
     char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
=20
-    if (test_migrate_start(&from, &to, uri, false, false)) {
+    if (test_migrate_start(&from, &to, uri, false, false, NULL, NULL)) {
         return;
     }
=20
@@ -916,7 +927,7 @@ static void test_ignore_shared(void)
     char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
=20
-    if (test_migrate_start(&from, &to, uri, false, true)) {
+    if (test_migrate_start(&from, &to, uri, false, true, NULL, NULL)) {
         return;
     }
=20
@@ -951,7 +962,7 @@ static void test_xbzrle(const char *uri)
 {
     QTestState *from, *to;
=20
-    if (test_migrate_start(&from, &to, uri, false, false)) {
+    if (test_migrate_start(&from, &to, uri, false, false, NULL, NULL)) {
         return;
     }
=20
@@ -1003,7 +1014,8 @@ static void test_precopy_tcp(void)
     char *uri;
     QTestState *from, *to;
=20
-    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", false, false))=
 {
+    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", false, false,
+                           NULL, NULL)) {
         return;
     }
=20
@@ -1049,7 +1061,7 @@ static void test_migrate_fd_proto(void)
     QDict *rsp;
     const char *error_desc;
=20
-    if (test_migrate_start(&from, &to, "defer", false, false)) {
+    if (test_migrate_start(&from, &to, "defer", false, false, NULL, NULL=
)) {
         return;
     }
=20
@@ -1125,6 +1137,68 @@ static void test_migrate_fd_proto(void)
     test_migrate_end(from, to, true);
 }
=20
+static void do_test_validate_uuid(const char *uuid_arg_src,
+                                  const char *uuid_arg_dst,
+                                  bool should_fail, bool hide_stderr)
+{
+    char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
+    QTestState *from, *to;
+
+    if (test_migrate_start(&from, &to, uri, hide_stderr, false,
+                           uuid_arg_src, uuid_arg_dst)) {
+        return;
+    }
+
+    /*
+     * UUID validation is at the begin of migration. So, the main proces=
s of
+     * migration is not interesting for us here. Thus, set huge downtime=
 for
+     * very fast migration.
+     */
+    migrate_set_parameter_int(from, "downtime-limit", 1000000);
+    migrate_set_capability(from, "validate-uuid", true);
+
+    /* Wait for the first serial output from the source */
+    wait_for_serial("src_serial");
+
+    migrate(from, uri, "{}");
+
+    if (should_fail) {
+        qtest_set_expected_status(to, 1);
+        wait_for_migration_fail(from, true);
+    } else {
+        wait_for_migration_complete(from);
+    }
+
+    test_migrate_end(from, to, false);
+    g_free(uri);
+}
+
+static void test_validate_uuid(void)
+{
+    do_test_validate_uuid("-uuid 11111111-1111-1111-1111-111111111111",
+                          "-uuid 11111111-1111-1111-1111-111111111111",
+                          false, false);
+}
+
+static void test_validate_uuid_error(void)
+{
+    do_test_validate_uuid("-uuid 11111111-1111-1111-1111-111111111111",
+                          "-uuid 22222222-2222-2222-2222-222222222222",
+                          true, true);
+}
+
+static void test_validate_uuid_src_not_set(void)
+{
+    do_test_validate_uuid(NULL, "-uuid 11111111-1111-1111-1111-111111111=
111",
+                          false, true);
+}
+
+static void test_validate_uuid_dst_not_set(void)
+{
+    do_test_validate_uuid("-uuid 11111111-1111-1111-1111-111111111111", =
NULL,
+                          false, true);
+}
+
 int main(int argc, char **argv)
 {
     char template[] =3D "/tmp/migration-test-XXXXXX";
@@ -1180,6 +1254,12 @@ int main(int argc, char **argv)
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); *=
/
     qtest_add_func("/migration/xbzrle/unix", test_xbzrle_unix);
     qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
+    qtest_add_func("/migration/validate_uuid", test_validate_uuid);
+    qtest_add_func("/migration/validate_uuid_error", test_validate_uuid_=
error);
+    qtest_add_func("/migration/validate_uuid_src_not_set",
+                   test_validate_uuid_src_not_set);
+    qtest_add_func("/migration/validate_uuid_dst_not_set",
+                   test_validate_uuid_dst_not_set);
=20
     ret =3D g_test_run();
=20
--=20
2.21.0


