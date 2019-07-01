Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314A433337
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 17:13:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXoeF-0007YI-9j
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 11:13:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoVQ-00012H-41
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:04:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hXoVK-0000Az-7P
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:04:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39498)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hXoV8-0008Hr-AP; Mon, 03 Jun 2019 11:03:54 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EF8E30C1AD7;
	Mon,  3 Jun 2019 15:03:41 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-129.ams2.redhat.com
	[10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 988216726F;
	Mon,  3 Jun 2019 15:03:36 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 17:02:16 +0200
Message-Id: <20190603150233.6614-12-kwolf@redhat.com>
In-Reply-To: <20190603150233.6614-1-kwolf@redhat.com>
References: <20190603150233.6614-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 03 Jun 2019 15:03:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 11/28] nbd-server: Call
 blk_set_allow_aio_context_change()
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

The NBD server uses an AioContext notifier, so it can tolerate that its
BlockBackend is switched to a different AioContext. Before we start
actually calling bdrv_try_set_aio_context(), which checks for
consistency, outside of test cases, we need to make sure that the NBD
server actually allows this.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c               |  1 +
 tests/qemu-iotests/240     | 21 +++++++++++++++++++++
 tests/qemu-iotests/240.out | 13 +++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/nbd/server.c b/nbd/server.c
index e21bd501dc..d1375350bc 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1491,6 +1491,7 @@ NBDExport *nbd_export_new(BlockDriverState *bs, uin=
t64_t dev_offset,
         goto fail;
     }
     blk_set_enable_write_cache(blk, !writethrough);
+    blk_set_allow_aio_context_change(blk, true);
=20
     exp->refcount =3D 1;
     QTAILQ_INIT(&exp->clients);
diff --git a/tests/qemu-iotests/240 b/tests/qemu-iotests/240
index b4cf95096d..5be6b9c0f7 100755
--- a/tests/qemu-iotests/240
+++ b/tests/qemu-iotests/240
@@ -27,6 +27,12 @@ echo "QA output created by $seq"
=20
 status=3D1	# failure is the default!
=20
+_cleanup()
+{
+    rm -f "$TEST_DIR/nbd"
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
 # get standard environment, filters and checks
 . ./common.rc
 . ./common.filter
@@ -122,6 +128,21 @@ run_qemu <<EOF
 { "execute": "quit"}
 EOF
=20
+echo
+echo =3D=3D=3D Attach a SCSI disks using the same block device as a NBD =
server =3D=3D=3D
+echo
+
+run_qemu <<EOF
+{ "execute": "qmp_capabilities" }
+{ "execute": "blockdev-add", "arguments": {"driver": "null-co", "node-na=
me": "hd0", "read-only": true}}
+{ "execute": "nbd-server-start", "arguments": {"addr":{"type":"unix","da=
ta":{"path":"$TEST_DIR/nbd"}}}}
+{ "execute": "nbd-server-add", "arguments": {"device":"hd0"}}
+{ "execute": "object-add", "arguments": {"qom-type": "iothread", "id": "=
iothread0"}}
+{ "execute": "device_add", "arguments": {"id": "scsi0", "driver": "${vir=
tio_scsi}", "iothread": "iothread0"}}
+{ "execute": "device_add", "arguments": {"id": "scsi-hd0", "driver": "sc=
si-hd", "drive": "hd0", "bus": "scsi0.0"}}
+{ "execute": "quit"}
+EOF
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/240.out b/tests/qemu-iotests/240.out
index d76392966c..84e0a43ce5 100644
--- a/tests/qemu-iotests/240.out
+++ b/tests/qemu-iotests/240.out
@@ -51,4 +51,17 @@ QMP_VERSION
 {"return": {}}
 {"return": {}}
 {"return": {}}
+
+=3D=3D=3D Attach a SCSI disks using the same block device as a NBD serve=
r =3D=3D=3D
+
+Testing:
+QMP_VERSION
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"return": {}}
 *** done
--=20
2.20.1


