Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE80111D950
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 23:25:21 +0100 (CET)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifWtc-00020c-K2
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 17:25:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54081)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ifWpC-0005Tn-Pn
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 17:20:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ifWpB-000791-Fp
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 17:20:46 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:35182
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ifWpB-00077W-As
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 17:20:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576189244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjD4XdVmR4AN75V79OM2mAxxxj6KG1BD1eNfdC9g+GY=;
 b=fqPyhIcDg9iPc/G9PvAn5q4I/zkGCOytoplZ0cV8koirpmTNcjAr8D6Ct54Z9jf+8dsjpW
 w0kF0Mnhv4zi4QGsvXNGWqmGfLgH+mjZvdmG8kZHT/HMei6LSoBgit3RsRCCAFomHtxKHs
 EF9pSmsgBJU8glisOjSMqjvEg+gCnzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-oHwBeiamMv22a2KSf3mBgw-1; Thu, 12 Dec 2019 17:20:43 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E263800D48
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 22:20:42 +0000 (UTC)
Received: from secure.mitica (ovpn-116-25.ams2.redhat.com [10.36.116.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7F4810013A1;
 Thu, 12 Dec 2019 22:20:40 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] migration-test: Move -machine to common commandline
Date: Thu, 12 Dec 2019 23:20:26 +0100
Message-Id: <20191212222033.1026-4-quintela@redhat.com>
In-Reply-To: <20191212222033.1026-1-quintela@redhat.com>
References: <20191212222033.1026-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: oHwBeiamMv22a2KSf3mBgw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/migration-test.c | 51 +++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index 372e66c755..39203f6d46 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -563,7 +563,8 @@ static int test_migrate_start(QTestState **from, QTestS=
tate **to,
     char *extra_opts =3D NULL;
     char *shmem_path =3D NULL;
     const char *arch =3D qtest_get_arch();
-    const char *accel =3D "kvm:tcg";
+    const char *machine_type;
+    const char *machine_args;
=20
     opts_src =3D opts_src ? opts_src : "";
     opts_dst =3D opts_dst ? opts_dst : "";
@@ -582,72 +583,78 @@ static int test_migrate_start(QTestState **from, QTes=
tState **to,
         /* the assembled x86 boot sector should be exactly one sector larg=
e */
         assert(sizeof(x86_bootsect) =3D=3D 512);
         init_bootfile(bootpath, x86_bootsect, sizeof(x86_bootsect));
+        machine_type =3D "";
+        machine_args =3D "";
         extra_opts =3D use_shmem ? get_shmem_opts("150M", shmem_path) : NU=
LL;
-        cmd_src =3D g_strdup_printf("-machine accel=3D%s -m 150M"
+        cmd_src =3D g_strdup_printf("-m 150M"
                                   " -name source,debug-threads=3Don"
                                   " -serial file:%s/src_serial"
                                   " -drive file=3D%s,format=3Draw %s",
-                                  accel, tmpfs, bootpath,
+                                  tmpfs, bootpath,
                                   extra_opts ? extra_opts : "");
-        cmd_dst =3D g_strdup_printf("-machine accel=3D%s -m 150M"
+        cmd_dst =3D g_strdup_printf("-m 150M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial"
                                   " -drive file=3D%s,format=3Draw"
                                   " -incoming %s %s",
-                                  accel, tmpfs, bootpath, uri,
+                                  tmpfs, bootpath, uri,
                                   extra_opts ? extra_opts : "");
         start_address =3D X86_TEST_MEM_START;
         end_address =3D X86_TEST_MEM_END;
     } else if (g_str_equal(arch, "s390x")) {
         init_bootfile(bootpath, s390x_elf, sizeof(s390x_elf));
+        machine_type =3D "";
+        machine_args =3D "";
         extra_opts =3D use_shmem ? get_shmem_opts("128M", shmem_path) : NU=
LL;
-        cmd_src =3D g_strdup_printf("-machine accel=3D%s -m 128M"
+        cmd_src =3D g_strdup_printf("-m 128M"
                                   " -name source,debug-threads=3Don"
                                   " -serial file:%s/src_serial -bios %s %s=
",
-                                  accel, tmpfs, bootpath,
+                                  tmpfs, bootpath,
                                   extra_opts ? extra_opts : "");
-        cmd_dst =3D g_strdup_printf("-machine accel=3D%s -m 128M"
+        cmd_dst =3D g_strdup_printf("-m 128M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial -bios %s"
                                   " -incoming %s %s",
-                                  accel, tmpfs, bootpath, uri,
+                                  tmpfs, bootpath, uri,
                                   extra_opts ? extra_opts : "");
         start_address =3D S390_TEST_MEM_START;
         end_address =3D S390_TEST_MEM_END;
     } else if (strcmp(arch, "ppc64") =3D=3D 0) {
+        machine_type =3D "";
+        machine_args =3D ",vsmt=3D8";
         extra_opts =3D use_shmem ? get_shmem_opts("256M", shmem_path) : NU=
LL;
-        cmd_src =3D g_strdup_printf("-machine accel=3D%s,vsmt=3D8 -m 256M =
-nodefaults"
+        cmd_src =3D g_strdup_printf("-m 256M -nodefaults"
                                   " -name source,debug-threads=3Don"
                                   " -serial file:%s/src_serial"
                                   " -prom-env 'use-nvramrc?=3Dtrue' -prom-=
env "
                                   "'nvramrc=3Dhex .\" _\" begin %x %x "
                                   "do i c@ 1 + i c! 1000 +loop .\" B\" 0 "
-                                  "until' %s",  accel, tmpfs, end_address,
+                                  "until' %s", tmpfs, end_address,
                                   start_address, extra_opts ? extra_opts :=
 "");
-        cmd_dst =3D g_strdup_printf("-machine accel=3D%s,vsmt=3D8 -m 256M"
+        cmd_dst =3D g_strdup_printf("-m 256M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial"
                                   " -incoming %s %s",
-                                  accel, tmpfs, uri,
+                                  tmpfs, uri,
                                   extra_opts ? extra_opts : "");
=20
         start_address =3D PPC_TEST_MEM_START;
         end_address =3D PPC_TEST_MEM_END;
     } else if (strcmp(arch, "aarch64") =3D=3D 0) {
         init_bootfile(bootpath, aarch64_kernel, sizeof(aarch64_kernel));
+        machine_type =3D "virt,";
+        machine_args =3D "gic-version=3Dmax";
         extra_opts =3D use_shmem ? get_shmem_opts("150M", shmem_path) : NU=
LL;
-        cmd_src =3D g_strdup_printf("-machine virt,accel=3D%s,gic-version=
=3Dmax "
-                                  "-name vmsource,debug-threads=3Don -cpu =
max "
+        cmd_src =3D g_strdup_printf("-name vmsource,debug-threads=3Don -cp=
u max "
                                   "-m 150M -serial file:%s/src_serial "
                                   "-kernel %s %s",
-                                  accel, tmpfs, bootpath,
+                                  tmpfs, bootpath,
                                   extra_opts ? extra_opts : "");
-        cmd_dst =3D g_strdup_printf("-machine virt,accel=3D%s,gic-version=
=3Dmax "
-                                  "-name vmdest,debug-threads=3Don -cpu ma=
x "
+        cmd_dst =3D g_strdup_printf("-name vmdest,debug-threads=3Don -cpu =
max "
                                   "-m 150M -serial file:%s/dest_serial "
                                   "-kernel %s "
                                   "-incoming %s %s",
-                                  accel, tmpfs, bootpath, uri,
+                                  tmpfs, bootpath, uri,
                                   extra_opts ? extra_opts : "");
=20
         start_address =3D ARM_TEST_MEM_START;
@@ -667,13 +674,15 @@ static int test_migrate_start(QTestState **from, QTes=
tState **to,
         ignore_stderr =3D "";
     }
=20
-    cmd_source =3D g_strdup_printf("%s %s %s",
+    cmd_source =3D g_strdup_printf("-machine %saccel=3Dkvm:tcg%s %s %s %s"=
,
+                                 machine_type, machine_args,
                                  cmd_src, opts_src, ignore_stderr);
     g_free(cmd_src);
     *from =3D qtest_init(cmd_source);
     g_free(cmd_source);
=20
-    cmd_target =3D g_strdup_printf("%s %s %s",
+    cmd_target =3D g_strdup_printf("-machine %saccel=3Dkvm:tcg%s %s %s %s"=
,
+                                 machine_type, machine_args,
                                  cmd_dst, opts_dst, ignore_stderr);
     g_free(cmd_dst);
     *to =3D qtest_init(cmd_target);
--=20
2.21.0


