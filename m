Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AEA123CC7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 02:59:19 +0100 (CET)
Received: from localhost ([::1]:48330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihOcQ-0007se-2Q
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 20:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ihOYq-0004IB-Kd
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 20:55:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ihOYk-0004Nr-R8
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 20:55:34 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37551
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ihOYk-0004MJ-G8
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 20:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576634129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lo7GWUpYAcwYLrIEiFnQDNl5FmvOUFedWC0glNYqyuo=;
 b=NKUm43ryP7A6KwQgkpod/98mcqNG/XFi5Bh/3qyAxJ/Xz6iuxwj/EQyveQFGR4N4Tm8yHJ
 CYmO5HoLEvKpoYrNGeWsoYJEGZIbWkLSugJ5/D0FHAzQMf1In/8/Bk9hDdc1Dv6Ft+jEnN
 jdEu2LdXhMlGGIVZxtKgrQpBTaXBYyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-C_9dmOrONz-SxqKOx3gnSA-1; Tue, 17 Dec 2019 20:55:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DDD8593A2
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 01:55:25 +0000 (UTC)
Received: from secure.mitica (ovpn-116-32.ams2.redhat.com [10.36.116.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5FAA6886F;
 Wed, 18 Dec 2019 01:55:23 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/10] migration-test: Create cmd_soure and cmd_target
Date: Wed, 18 Dec 2019 02:55:11 +0100
Message-Id: <20191218015520.2881-2-quintela@redhat.com>
In-Reply-To: <20191218015520.2881-1-quintela@redhat.com>
References: <20191218015520.2881-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: C_9dmOrONz-SxqKOx3gnSA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are repeating almost everything for each machine while creating the
command line for migration.  And once for source and another for
destination.  We start putting there opts_src and opts_dst.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/migration-test.c | 44 ++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index a5343fdc66..fbddcf2317 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -557,6 +557,7 @@ static int test_migrate_start(QTestState **from, QTestS=
tate **to,
                                const char *opts_dst)
 {
     gchar *cmd_src, *cmd_dst;
+    gchar *cmd_source, *cmd_target;
     char *bootpath =3D NULL;
     char *extra_opts =3D NULL;
     char *shmem_path =3D NULL;
@@ -584,16 +585,16 @@ static int test_migrate_start(QTestState **from, QTes=
tState **to,
         cmd_src =3D g_strdup_printf("-machine accel=3D%s -m 150M"
                                   " -name source,debug-threads=3Don"
                                   " -serial file:%s/src_serial"
-                                  " -drive file=3D%s,format=3Draw %s %s",
+                                  " -drive file=3D%s,format=3Draw %s",
                                   accel, tmpfs, bootpath,
-                                  extra_opts ? extra_opts : "", opts_src);
+                                  extra_opts ? extra_opts : "");
         cmd_dst =3D g_strdup_printf("-machine accel=3D%s -m 150M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial"
                                   " -drive file=3D%s,format=3Draw"
-                                  " -incoming %s %s %s",
+                                  " -incoming %s %s",
                                   accel, tmpfs, bootpath, uri,
-                                  extra_opts ? extra_opts : "", opts_dst);
+                                  extra_opts ? extra_opts : "");
         start_address =3D X86_TEST_MEM_START;
         end_address =3D X86_TEST_MEM_END;
     } else if (g_str_equal(arch, "s390x")) {
@@ -601,15 +602,15 @@ static int test_migrate_start(QTestState **from, QTes=
tState **to,
         extra_opts =3D use_shmem ? get_shmem_opts("128M", shmem_path) : NU=
LL;
         cmd_src =3D g_strdup_printf("-machine accel=3D%s -m 128M"
                                   " -name source,debug-threads=3Don"
-                                  " -serial file:%s/src_serial -bios %s %s=
 %s",
+                                  " -serial file:%s/src_serial -bios %s %s=
",
                                   accel, tmpfs, bootpath,
-                                  extra_opts ? extra_opts : "", opts_src);
+                                  extra_opts ? extra_opts : "");
         cmd_dst =3D g_strdup_printf("-machine accel=3D%s -m 128M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial -bios %s"
-                                  " -incoming %s %s %s",
+                                  " -incoming %s %s",
                                   accel, tmpfs, bootpath, uri,
-                                  extra_opts ? extra_opts : "", opts_dst);
+                                  extra_opts ? extra_opts : "");
         start_address =3D S390_TEST_MEM_START;
         end_address =3D S390_TEST_MEM_END;
     } else if (strcmp(arch, "ppc64") =3D=3D 0) {
@@ -620,15 +621,14 @@ static int test_migrate_start(QTestState **from, QTes=
tState **to,
                                   " -prom-env 'use-nvramrc?=3Dtrue' -prom-=
env "
                                   "'nvramrc=3Dhex .\" _\" begin %x %x "
                                   "do i c@ 1 + i c! 1000 +loop .\" B\" 0 "
-                                  "until' %s %s",  accel, tmpfs, end_addre=
ss,
-                                  start_address, extra_opts ? extra_opts :=
 "",
-                                  opts_src);
+                                  "until' %s",  accel, tmpfs, end_address,
+                                  start_address, extra_opts ? extra_opts :=
 "");
         cmd_dst =3D g_strdup_printf("-machine accel=3D%s,vsmt=3D8 -m 256M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial"
-                                  " -incoming %s %s %s",
+                                  " -incoming %s %s",
                                   accel, tmpfs, uri,
-                                  extra_opts ? extra_opts : "", opts_dst);
+                                  extra_opts ? extra_opts : "");
=20
         start_address =3D PPC_TEST_MEM_START;
         end_address =3D PPC_TEST_MEM_END;
@@ -638,16 +638,16 @@ static int test_migrate_start(QTestState **from, QTes=
tState **to,
         cmd_src =3D g_strdup_printf("-machine virt,accel=3D%s,gic-version=
=3Dmax "
                                   "-name vmsource,debug-threads=3Don -cpu =
max "
                                   "-m 150M -serial file:%s/src_serial "
-                                  "-kernel %s %s %s",
+                                  "-kernel %s %s",
                                   accel, tmpfs, bootpath,
-                                  extra_opts ? extra_opts : "", opts_src);
+                                  extra_opts ? extra_opts : "");
         cmd_dst =3D g_strdup_printf("-machine virt,accel=3D%s,gic-version=
=3Dmax "
                                   "-name vmdest,debug-threads=3Don -cpu ma=
x "
                                   "-m 150M -serial file:%s/dest_serial "
                                   "-kernel %s "
-                                  "-incoming %s %s %s",
+                                  "-incoming %s %s",
                                   accel, tmpfs, bootpath, uri,
-                                  extra_opts ? extra_opts : "", opts_dst);
+                                  extra_opts ? extra_opts : "");
=20
         start_address =3D ARM_TEST_MEM_START;
         end_address =3D ARM_TEST_MEM_END;
@@ -671,11 +671,17 @@ static int test_migrate_start(QTestState **from, QTes=
tState **to,
         cmd_dst =3D tmp;
     }
=20
-    *from =3D qtest_init(cmd_src);
+    cmd_source =3D g_strdup_printf("%s %s",
+                                 cmd_src, opts_src);
     g_free(cmd_src);
+    *from =3D qtest_init(cmd_source);
+    g_free(cmd_source);
=20
-    *to =3D qtest_init(cmd_dst);
+    cmd_target =3D g_strdup_printf("%s %s",
+                                 cmd_dst, opts_dst);
     g_free(cmd_dst);
+    *to =3D qtest_init(cmd_target);
+    g_free(cmd_target);
=20
     /*
      * Remove shmem file immediately to avoid memory leak in test failed c=
ase.
--=20
2.23.0


