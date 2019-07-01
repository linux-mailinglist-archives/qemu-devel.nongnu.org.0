Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE8A33366
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 17:23:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXonc-0007Vh-1M
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 11:23:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoW6-0001aR-3H
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:04:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoW4-0001XY-5z
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:04:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hXoVw-0001HR-PW; Mon, 03 Jun 2019 11:04:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB556307E04A;
	Mon,  3 Jun 2019 15:04:33 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD4AB61B6A;
	Mon,  3 Jun 2019 15:04:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 17:02:28 +0200
Message-Id: <20190603150233.6614-24-kwolf@redhat.com>
In-Reply-To: <20190603150233.6614-1-kwolf@redhat.com>
References: <20190603150233.6614-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 03 Jun 2019 15:04:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 23/28] iotests: Attach new devices to node in
 non-default iothread
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This tests that devices refuse to be attached to a node that has already
been moved to a different iothread if they can't be or aren't configured
to work in the same iothread.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/051        | 24 ++++++++++++++++++++++++
 tests/qemu-iotests/051.out    |  3 +++
 tests/qemu-iotests/051.pc.out | 27 +++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index a3deb1fcad..200660f977 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -191,6 +191,30 @@ case "$QEMU_DEFAULT_MACHINE" in
         ;;
 esac
=20
+echo
+echo =3D=3D=3D Attach to node in non-default iothread =3D=3D=3D
+echo
+
+case "$QEMU_DEFAULT_MACHINE" in
+    pc)
+        iothread=3D"-drive file=3D$TEST_IMG,if=3Dnone,node-name=3Ddisk -=
object iothread,id=3Dthread0 -device virtio-scsi,iothread=3Dthread0,id=3D=
virtio-scsi0 -device scsi-hd,bus=3Dvirtio-scsi0.0,drive=3Ddisk,share-rw=3D=
on"
+
+        # Can't add a device in the main thread while virtio-scsi0 uses =
the node
+        run_qemu $iothread -device ide-hd,drive=3Ddisk,share-rw=3Don
+        run_qemu $iothread -device virtio-blk-pci,drive=3Ddisk,share-rw=3D=
on
+        run_qemu $iothread -device lsi53c895a,id=3Dlsi0 -device scsi-hd,=
bus=3Dlsi0.0,drive=3Ddisk,share-rw=3Don
+        run_qemu $iothread -device virtio-scsi,id=3Dvirtio-scsi1 -device=
 scsi-hd,bus=3Dvirtio-scsi1.0,drive=3Ddisk,share-rw=3Don
+
+        # virtio-blk enables the iothread only when the driver initialis=
es the
+        # device, so a second virtio-blk device can't be added even with=
 the
+        # same iothread. virtio-scsi allows this.
+        run_qemu $iothread -device virtio-blk-pci,drive=3Ddisk,iohtread=3D=
iothread0,share-rw=3Don
+        run_qemu $iothread -device virtio-scsi,id=3Dvirtio-scsi1,iothrea=
d=3Dthread0 -device scsi-hd,bus=3Dvirtio-scsi1.0,drive=3Ddisk,share-rw=3D=
on
+        ;;
+     *)
+        ;;
+esac
+
 echo
 echo =3D=3D=3D Read-only =3D=3D=3D
 echo
diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
index 9f1cf22608..8993835b94 100644
--- a/tests/qemu-iotests/051.out
+++ b/tests/qemu-iotests/051.out
@@ -137,6 +137,9 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) QEMU_PROG: -drive if=3Dvirtio: Device needs media, but drive is e=
mpty
=20
=20
+=3D=3D=3D Attach to node in non-default iothread =3D=3D=3D
+
+
 =3D=3D=3D Read-only =3D=3D=3D
=20
 Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dvirtio,readonly=3Don
diff --git a/tests/qemu-iotests/051.pc.out b/tests/qemu-iotests/051.pc.ou=
t
index c4743cc31c..2d811c166c 100644
--- a/tests/qemu-iotests/051.pc.out
+++ b/tests/qemu-iotests/051.pc.out
@@ -173,6 +173,33 @@ QEMU X.Y.Z monitor - type 'help' for more informatio=
n
 (qemu) QEMU_PROG: -device scsi-hd,drive=3Ddisk: Device needs media, but =
drive is empty
=20
=20
+=3D=3D=3D Attach to node in non-default iothread =3D=3D=3D
+
+Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dnone,node-name=3Ddisk -obje=
ct iothread,id=3Dthread0 -device virtio-scsi,iothread=3Dthread0,id=3Dvirt=
io-scsi0 -device scsi-hd,bus=3Dvirtio-scsi0.0,drive=3Ddisk,share-rw=3Don =
-device ide-hd,drive=3Ddisk,share-rw=3Don
+QEMU X.Y.Z monitor - type 'help' for more information
+(qemu) QEMU_PROG: -device ide-hd,drive=3Ddisk,share-rw=3Don: Cannot chan=
ge iothread of active block backend
+
+Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dnone,node-name=3Ddisk -obje=
ct iothread,id=3Dthread0 -device virtio-scsi,iothread=3Dthread0,id=3Dvirt=
io-scsi0 -device scsi-hd,bus=3Dvirtio-scsi0.0,drive=3Ddisk,share-rw=3Don =
-device virtio-blk-pci,drive=3Ddisk,share-rw=3Don
+QEMU X.Y.Z monitor - type 'help' for more information
+(qemu) QEMU_PROG: -device virtio-blk-pci,drive=3Ddisk,share-rw=3Don: Can=
not change iothread of active block backend
+
+Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dnone,node-name=3Ddisk -obje=
ct iothread,id=3Dthread0 -device virtio-scsi,iothread=3Dthread0,id=3Dvirt=
io-scsi0 -device scsi-hd,bus=3Dvirtio-scsi0.0,drive=3Ddisk,share-rw=3Don =
-device lsi53c895a,id=3Dlsi0 -device scsi-hd,bus=3Dlsi0.0,drive=3Ddisk,sh=
are-rw=3Don
+QEMU X.Y.Z monitor - type 'help' for more information
+(qemu) QEMU_PROG: -device scsi-hd,bus=3Dlsi0.0,drive=3Ddisk,share-rw=3Do=
n: HBA does not support iothreads
+
+Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dnone,node-name=3Ddisk -obje=
ct iothread,id=3Dthread0 -device virtio-scsi,iothread=3Dthread0,id=3Dvirt=
io-scsi0 -device scsi-hd,bus=3Dvirtio-scsi0.0,drive=3Ddisk,share-rw=3Don =
-device virtio-scsi,id=3Dvirtio-scsi1 -device scsi-hd,bus=3Dvirtio-scsi1.=
0,drive=3Ddisk,share-rw=3Don
+QEMU X.Y.Z monitor - type 'help' for more information
+(qemu) QEMU_PROG: -device scsi-hd,bus=3Dvirtio-scsi1.0,drive=3Ddisk,shar=
e-rw=3Don: Cannot change iothread of active block backend
+
+Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dnone,node-name=3Ddisk -obje=
ct iothread,id=3Dthread0 -device virtio-scsi,iothread=3Dthread0,id=3Dvirt=
io-scsi0 -device scsi-hd,bus=3Dvirtio-scsi0.0,drive=3Ddisk,share-rw=3Don =
-device virtio-blk-pci,drive=3Ddisk,iohtread=3Diothread0,share-rw=3Don
+QEMU X.Y.Z monitor - type 'help' for more information
+(qemu) QEMU_PROG: -device virtio-blk-pci,drive=3Ddisk,iohtread=3Diothrea=
d0,share-rw=3Don: Cannot change iothread of active block backend
+
+Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dnone,node-name=3Ddisk -obje=
ct iothread,id=3Dthread0 -device virtio-scsi,iothread=3Dthread0,id=3Dvirt=
io-scsi0 -device scsi-hd,bus=3Dvirtio-scsi0.0,drive=3Ddisk,share-rw=3Don =
-device virtio-scsi,id=3Dvirtio-scsi1,iothread=3Dthread0 -device scsi-hd,=
bus=3Dvirtio-scsi1.0,drive=3Ddisk,share-rw=3Don
+QEMU X.Y.Z monitor - type 'help' for more information
+(qemu) quit
+
+
 =3D=3D=3D Read-only =3D=3D=3D
=20
 Testing: -drive file=3DTEST_DIR/t.qcow2,if=3Dfloppy,readonly=3Don
--=20
2.20.1


