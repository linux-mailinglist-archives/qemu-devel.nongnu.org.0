Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58896103D4B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 15:31:08 +0100 (CET)
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXR0c-0007Co-VY
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 09:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51044)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1iXQvZ-0004Qb-0O
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:25:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1iXQvT-0001fh-GN
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:25:52 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57163
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1iXQvT-0001ey-CW
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 09:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574259946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Hqg44GMyR73rndvyrVyxQApb8QW1CmtJy4zzIcP5OI=;
 b=HCGwZBEJ3MI8nlvqxfFer51AWzosKT7nEumNOCuOUf1zEFvblQaeUCVkTKCwV7IDqRjwdU
 0K9Vvpsr8FUmfMxuazo5fZO6iGQQu8ch4UQkaZ+HdqpSlr6e3+eU788nGHgZ1dUCRKHSBQ
 jG/U1CAqa/gVQmSFh3uq67+CdohNN74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-EyM0a4vxNZiudxF5U62Q-A-1; Wed, 20 Nov 2019 09:25:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67214911C8;
 Wed, 20 Nov 2019 14:25:43 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-116-216.ams2.redhat.com
 [10.36.116.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05C255E7D8;
 Wed, 20 Nov 2019 14:25:40 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pseries: fix migration-test and pxe-test
Date: Wed, 20 Nov 2019 15:25:39 +0100
Message-Id: <20191120142539.236279-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: EyM0a4vxNZiudxF5U62Q-A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 29cb4187497d ("spapr: Set VSMT to smp_threads by default")
has introduced a new default value for VSMT that is not supported
by old kernels (before 4.13 kernel) and this breaks "make check"
on these kernels.

To fix that, explicitly set in the involved tests the value that was
used as the default value before the change.

Cc: Greg Kurz <groug@kaod.org>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/migration-test.c | 4 ++--
 tests/pxe-test.c       | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index ac780dffdaad..ebd77a581aff 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -614,7 +614,7 @@ static int test_migrate_start(QTestState **from, QTestS=
tate **to,
         end_address =3D S390_TEST_MEM_END;
     } else if (strcmp(arch, "ppc64") =3D=3D 0) {
         extra_opts =3D use_shmem ? get_shmem_opts("256M", shmem_path) : NU=
LL;
-        cmd_src =3D g_strdup_printf("-machine accel=3D%s -m 256M -nodefaul=
ts"
+        cmd_src =3D g_strdup_printf("-machine accel=3D%s,vsmt=3D8 -m 256M =
-nodefaults"
                                   " -name source,debug-threads=3Don"
                                   " -serial file:%s/src_serial"
                                   " -prom-env 'use-nvramrc?=3Dtrue' -prom-=
env "
@@ -623,7 +623,7 @@ static int test_migrate_start(QTestState **from, QTestS=
tate **to,
                                   "until' %s %s",  accel, tmpfs, end_addre=
ss,
                                   start_address, extra_opts ? extra_opts :=
 "",
                                   opts_src);
-        cmd_dst =3D g_strdup_printf("-machine accel=3D%s -m 256M"
+        cmd_dst =3D g_strdup_printf("-machine accel=3D%s,vsmt=3D8 -m 256M"
                                   " -name target,debug-threads=3Don"
                                   " -serial file:%s/dest_serial"
                                   " -incoming %s %s %s",
diff --git a/tests/pxe-test.c b/tests/pxe-test.c
index 948b0fbdc727..aaae54f7550d 100644
--- a/tests/pxe-test.c
+++ b/tests/pxe-test.c
@@ -46,15 +46,15 @@ static testdef_t x86_tests_slow[] =3D {
=20
 static testdef_t ppc64_tests[] =3D {
     { "pseries", "spapr-vlan",
-      "-machine cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken" },
+      "-machine cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken,vsmt=
=3D8" },
     { "pseries", "virtio-net-pci",
-      "-machine cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken" },
+      "-machine cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken,vsmt=
=3D8" },
     { NULL },
 };
=20
 static testdef_t ppc64_tests_slow[] =3D {
     { "pseries", "e1000",
-      "-machine cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken" },
+      "-machine cap-cfpc=3Dbroken,cap-sbbc=3Dbroken,cap-ibs=3Dbroken,vsmt=
=3D8" },
     { NULL },
 };
=20
--=20
2.23.0


