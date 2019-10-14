Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A01D6A4D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 21:46:06 +0200 (CEST)
Received: from localhost ([::1]:56510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iK6I8-0006bK-Nr
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 15:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iK62d-00067t-Ax
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:30:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iK62c-0002tr-3V
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 15:30:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46050)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iK62X-0002pg-FP; Mon, 14 Oct 2019 15:29:58 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A9ECB3082E42;
 Mon, 14 Oct 2019 19:29:56 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-152.bos.redhat.com [10.18.17.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E83E160BE2;
 Mon, 14 Oct 2019 19:29:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 11/19] iotests: add test-case to 165 to test reopening qcow2
 bitmaps to RW
Date: Mon, 14 Oct 2019 15:29:01 -0400
Message-Id: <20191014192909.16044-12-jsnow@redhat.com>
In-Reply-To: <20191014192909.16044-1-jsnow@redhat.com>
References: <20191014192909.16044-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 14 Oct 2019 19:29:56 +0000 (UTC)
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Reopening bitmaps to RW was broken prior to previous commit. Check that
it works now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190927122355.7344-4-vsementsov@virtuozzo.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/165     | 57 ++++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/165.out |  4 +--
 2 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index 5650dc7c87..951ea011a2 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -43,10 +43,10 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
         os.remove(disk)
=20
     def mkVm(self):
-        return iotests.VM().add_drive(disk)
+        return iotests.VM().add_drive(disk, opts=3D'node-name=3Dnode0')
=20
     def mkVmRo(self):
-        return iotests.VM().add_drive(disk, opts=3D'readonly=3Don')
+        return iotests.VM().add_drive(disk, opts=3D'readonly=3Don,node-n=
ame=3Dnode0')
=20
     def getSha256(self):
         result =3D self.vm.qmp('x-debug-block-dirty-bitmap-sha256',
@@ -102,6 +102,59 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase)=
:
=20
         self.vm.shutdown()
=20
+    def test_reopen_rw(self):
+        self.vm =3D self.mkVm()
+        self.vm.launch()
+        self.qmpAddBitmap()
+
+        # Calculate hashes
+
+        self.writeRegions(regions1)
+        sha256_1 =3D self.getSha256()
+
+        self.writeRegions(regions2)
+        sha256_2 =3D self.getSha256()
+        assert sha256_1 !=3D sha256_2 # Otherwise, it's not very interes=
ting.
+
+        result =3D self.vm.qmp('block-dirty-bitmap-clear', node=3D'drive=
0',
+                             name=3D'bitmap0')
+        self.assert_qmp(result, 'return', {})
+
+        # Start with regions1
+
+        self.writeRegions(regions1)
+        assert sha256_1 =3D=3D self.getSha256()
+
+        self.vm.shutdown()
+
+        self.vm =3D self.mkVmRo()
+        self.vm.launch()
+
+        assert sha256_1 =3D=3D self.getSha256()
+
+        # Check that we are in RO mode and can't modify bitmap.
+        self.writeRegions(regions2)
+        assert sha256_1 =3D=3D self.getSha256()
+
+        # Reopen to RW
+        result =3D self.vm.qmp('x-blockdev-reopen', **{
+            'node-name': 'node0',
+            'driver': iotests.imgfmt,
+            'file': {
+                'driver': 'file',
+                'filename': disk
+            },
+            'read-only': False
+        })
+        self.assert_qmp(result, 'return', {})
+
+        # Check that bitmap is reopened to RW and we can write to it.
+        self.writeRegions(regions2)
+        assert sha256_2 =3D=3D self.getSha256()
+
+        self.vm.shutdown()
+
+
 if __name__ =3D=3D '__main__':
     iotests.main(supported_fmts=3D['qcow2'],
                  supported_protocols=3D['file'])
diff --git a/tests/qemu-iotests/165.out b/tests/qemu-iotests/165.out
index ae1213e6f8..fbc63e62f8 100644
--- a/tests/qemu-iotests/165.out
+++ b/tests/qemu-iotests/165.out
@@ -1,5 +1,5 @@
-.
+..
 ----------------------------------------------------------------------
-Ran 1 tests
+Ran 2 tests
=20
 OK
--=20
2.21.0


