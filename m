Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BB9CFD16
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 17:04:08 +0200 (CEST)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHr1z-0008Bp-CT
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 11:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iHqtn-00010W-SS
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:55:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iHqtm-0004AL-Lp
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 10:55:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47266)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>)
 id 1iHqtf-00040o-0u; Tue, 08 Oct 2019 10:55:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 32AA3550CF;
 Tue,  8 Oct 2019 14:55:30 +0000 (UTC)
Received: from localhost (ovpn-116-36.ams2.redhat.com [10.36.116.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B87FA5C21F;
 Tue,  8 Oct 2019 14:55:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] iotests/262: Switch source/dest VM launch order
Date: Tue,  8 Oct 2019 15:55:05 +0100
Message-Id: <20191008145505.3641-5-stefanha@redhat.com>
In-Reply-To: <20191008145505.3641-1-stefanha@redhat.com>
References: <20191008145505.3641-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 08 Oct 2019 14:55:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Launching the destination VM before the source VM gives us a regression
test for HEAD^:

The guest device causes a read from the disk image through
guess_disk_lchs().  This will not work if the first sector (containing
the partition table) is yet unallocated, we use COR, and the node is
inactive.

By launching the source VM before the destination, however, the COR
filter on the source will allocate that area in the image shared between
both VMs, thus the problem will not become apparent.

Switching the launch order causes the sector to still be unallocated
when guess_disk_lchs() runs on the inactive node in the destination VM,
and thus we get our test case.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20191001174827.11081-3-mreitz@redhat.com
Message-Id: <20191001174827.11081-3-mreitz@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/qemu-iotests/262     | 12 ++++++------
 tests/qemu-iotests/262.out |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/262 b/tests/qemu-iotests/262
index 398f63587e..0963daa806 100755
--- a/tests/qemu-iotests/262
+++ b/tests/qemu-iotests/262
@@ -54,12 +54,6 @@ with iotests.FilePath('img') as img_path, \
=20
     os.mkfifo(fifo)
=20
-    iotests.log('Launching source VM...')
-    add_opts(vm_a)
-    vm_a.launch()
-
-    vm_a.enable_migration_events('A')
-
     iotests.log('Launching destination VM...')
     add_opts(vm_b)
     vm_b.add_incoming("exec: cat '%s'" % (fifo))
@@ -67,6 +61,12 @@ with iotests.FilePath('img') as img_path, \
=20
     vm_b.enable_migration_events('B')
=20
+    iotests.log('Launching source VM...')
+    add_opts(vm_a)
+    vm_a.launch()
+
+    vm_a.enable_migration_events('A')
+
     iotests.log('Starting migration to B...')
     iotests.log(vm_a.qmp('migrate', uri=3D'exec:cat >%s' % (fifo)))
     with iotests.Timeout(3, 'Migration does not complete'):
diff --git a/tests/qemu-iotests/262.out b/tests/qemu-iotests/262.out
index 5a58e5e9f8..8e04c496c4 100644
--- a/tests/qemu-iotests/262.out
+++ b/tests/qemu-iotests/262.out
@@ -1,9 +1,9 @@
-Launching source VM...
-Enabling migration QMP events on A...
-{"return": {}}
 Launching destination VM...
 Enabling migration QMP events on B...
 {"return": {}}
+Launching source VM...
+Enabling migration QMP events on A...
+{"return": {}}
 Starting migration to B...
 {"return": {}}
 {"data": {"status": "setup"}, "event": "MIGRATION", "timestamp": {"micro=
seconds": "USECS", "seconds": "SECS"}}
--=20
2.21.0


