Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 450768229E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Aug 2019 18:41:27 +0200 (CEST)
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hug34-0003Vl-Gm
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 12:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37527)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hufzg-0005wl-Hj
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 12:37:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hufzf-0005wi-GK
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 12:37:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hufzd-0005vT-3h; Mon, 05 Aug 2019 12:37:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5C8A7301302E;
 Mon,  5 Aug 2019 16:37:52 +0000 (UTC)
Received: from localhost (unknown [10.40.205.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4AF25DC18;
 Mon,  5 Aug 2019 16:37:51 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  5 Aug 2019 18:37:37 +0200
Message-Id: <20190805163740.23616-5-mreitz@redhat.com>
In-Reply-To: <20190805163740.23616-1-mreitz@redhat.com>
References: <20190805163740.23616-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 05 Aug 2019 16:37:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/7] iotests: Test incremental backup after
 truncation
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-id: 20190805152840.32190-1-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/124     | 38 ++++++++++++++++++++++++++++++++++----
 tests/qemu-iotests/124.out |  4 ++--
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/124 b/tests/qemu-iotests/124
index 80b356f7bb..3440f54781 100755
--- a/tests/qemu-iotests/124
+++ b/tests/qemu-iotests/124
@@ -212,25 +212,28 @@ class TestIncrementalBackupBase(iotests.QMPTestCase=
):
         return bitmap
=20
=20
-    def prepare_backup(self, bitmap=3DNone, parent=3DNone):
+    def prepare_backup(self, bitmap=3DNone, parent=3DNone, **kwargs):
         if bitmap is None:
             bitmap =3D self.bitmaps[-1]
         if parent is None:
             parent, _ =3D bitmap.last_target()
=20
         target, _ =3D bitmap.new_target()
-        self.img_create(target, bitmap.drive['fmt'], parent=3Dparent)
+        self.img_create(target, bitmap.drive['fmt'], parent=3Dparent,
+                        **kwargs)
         return target
=20
=20
     def create_incremental(self, bitmap=3DNone, parent=3DNone,
-                           parentFormat=3DNone, validate=3DTrue):
+                           parentFormat=3DNone, validate=3DTrue,
+                           target=3DNone):
         if bitmap is None:
             bitmap =3D self.bitmaps[-1]
         if parent is None:
             parent, _ =3D bitmap.last_target()
=20
-        target =3D self.prepare_backup(bitmap, parent)
+        if target is None:
+            target =3D self.prepare_backup(bitmap, parent)
         res =3D self.do_qmp_backup(job_id=3Dbitmap.drive['id'],
                                  device=3Dbitmap.drive['id'],
                                  sync=3D'incremental', bitmap=3Dbitmap.n=
ame,
@@ -572,6 +575,33 @@ class TestIncrementalBackup(TestIncrementalBackupBas=
e):
                           'bitmap0', self.drives[0],
                           granularity=3D64000)
=20
+    def test_growing_before_backup(self):
+        '''
+        Test: Add a bitmap, truncate the image, write past the old
+              end, do a backup.
+
+        Incremental backup should not ignore dirty bits past the old
+        image end.
+        '''
+        self.assert_no_active_block_jobs()
+
+        self.create_anchor_backup()
+
+        self.add_bitmap('bitmap0', self.drives[0])
+
+        res =3D self.vm.qmp('block_resize', device=3Dself.drives[0]['id'=
],
+                          size=3D(65 * 1048576))
+        self.assert_qmp(res, 'return', {})
+
+        # Dirty the image past the old end
+        self.vm.hmp_qemu_io(self.drives[0]['id'], 'write 64M 64k')
+
+        target =3D self.prepare_backup(size=3D'65M')
+        self.create_incremental(target=3Dtarget)
+
+        self.vm.shutdown()
+        self.check_backups()
+
=20
 class TestIncrementalBackupBlkdebug(TestIncrementalBackupBase):
     '''Incremental backup tests that utilize a BlkDebug filter on drive0=
.'''
diff --git a/tests/qemu-iotests/124.out b/tests/qemu-iotests/124.out
index 281b69efea..fa16b5ccef 100644
--- a/tests/qemu-iotests/124.out
+++ b/tests/qemu-iotests/124.out
@@ -1,5 +1,5 @@
-............
+.............
 ----------------------------------------------------------------------
-Ran 12 tests
+Ran 13 tests
=20
 OK
--=20
2.21.0


