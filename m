Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195C31BCC65
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 21:29:43 +0200 (CEST)
Received: from localhost ([::1]:46866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTVvJ-0004XE-Vy
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 15:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTVt5-00029S-D1
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 15:27:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTVt1-0000lB-Sc
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 15:27:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44105
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jTVt1-0000kr-B4
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 15:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588102038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQdSyaKxnruoq3UFar3ULq7gr228cqpk9R8DxhQsa74=;
 b=i+Fky0oM+5hoix35tWy17tx16kj26H+6j5oo//90XcVi7rfU+P7TCcl8J672k7T+iOIweN
 /Fig8RvIJfwymPy+qMyrELQOsbqmlS3K6GhVWv2todMyeiRuyAv+/xR/ovvkTtz3juQCK4
 rn1P6diXoixSb1f8MMle7JwYk952D+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-kUNCGzlkNmu8MGCUNUHG3w-1; Tue, 28 Apr 2020 15:27:13 -0400
X-MC-Unique: kUNCGzlkNmu8MGCUNUHG3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D8E819057A0;
 Tue, 28 Apr 2020 19:27:12 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 913AD1002388;
 Tue, 28 Apr 2020 19:27:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] qcow2: Allow resize of images with internal snapshots
Date: Tue, 28 Apr 2020 14:26:47 -0500
Message-Id: <20200428192648.749066-3-eblake@redhat.com>
In-Reply-To: <20200428192648.749066-1-eblake@redhat.com>
References: <20200428192648.749066-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 02:16:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, stefanha@redhat.com,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We originally refused to allow resize of images with internal
snapshots because the v2 image format did not require the tracking of
snapshot size, making it impossible to safely revert to a snapshot
with a different size than the current view of the image.  But the
snapshot size tracking was rectified in v3, and our recent fixes to
qemu-img amend (see 0a85af35) guarantee that we always have a valid
snapshot size.  Thus, we no longer need to artificially limit image
resizes, but it does become one more thing that would prevent a
downgrade back to v2.  And now that we support different-sized
snapshots, it's also easy to fix reverting to a snapshot to apply the
new size.

Upgrade iotest 61 to cover this (we previously had NO coverage of
refusal to resize while snapshots exist).  Note that the amend process
can fail but still have effects: in particular, since we break things
into upgrade, resize, downgrade, a failure during resize does not roll
back changes made during upgrade, nor does failure in downgrade roll
back a resize.  But this situation is pre-existing even without this
patch; and without journaling, the best we could do is minimize the
chance of partial failure by collecting all changes prior to doing any
writes - which adds a lot of complexity but could still fail with EIO.
On the other hand, we are careful that even if we have partial
modification but then fail, the image is left viable (that is, we are
careful to sequence things so that after each successful cluster
write, there may be transient leaked clusters but no corrupt
metadata).  And complicating the code to make it more transaction-like
is not worth the effort: a user can always request multiple 'qemu-img
amend' changing one thing each, if they need finer-grained control
over detecting the first failure than what they get by letting qemu
decide how to sequence multiple changes.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-snapshot.c     | 20 ++++++++++++++++----
 block/qcow2.c              | 25 ++++++++++++++++++++++---
 tests/qemu-iotests/061     | 35 +++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/061.out | 28 ++++++++++++++++++++++++++++
 4 files changed, 101 insertions(+), 7 deletions(-)

diff --git a/block/qcow2-snapshot.c b/block/qcow2-snapshot.c
index 82c32d4c9b08..2756b37d2427 100644
--- a/block/qcow2-snapshot.c
+++ b/block/qcow2-snapshot.c
@@ -23,6 +23,7 @@
  */

 #include "qemu/osdep.h"
+#include "sysemu/block-backend.h"
 #include "qapi/error.h"
 #include "qcow2.h"
 #include "qemu/bswap.h"
@@ -775,10 +776,21 @@ int qcow2_snapshot_goto(BlockDriverState *bs, const c=
har *snapshot_id)
     }

     if (sn->disk_size !=3D bs->total_sectors * BDRV_SECTOR_SIZE) {
-        error_report("qcow2: Loading snapshots with different disk "
-            "size is not implemented");
-        ret =3D -ENOTSUP;
-        goto fail;
+        BlockBackend *blk =3D blk_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PER=
M_ALL,
+                                            &local_err);
+        if (!blk) {
+            error_report_err(local_err);
+            ret =3D -ENOTSUP;
+            goto fail;
+        }
+
+        ret =3D blk_truncate(blk, sn->disk_size, true, PREALLOC_MODE_OFF, =
0,
+                           &local_err);
+        blk_unref(blk);
+        if (ret < 0) {
+            error_report_err(local_err);
+            goto fail;
+        }
     }

     /*
diff --git a/block/qcow2.c b/block/qcow2.c
index 0edc7f4643f8..3e8b3d022b80 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3989,9 +3989,12 @@ static int coroutine_fn qcow2_co_truncate(BlockDrive=
rState *bs, int64_t offset,

     qemu_co_mutex_lock(&s->lock);

-    /* cannot proceed if image has snapshots */
-    if (s->nb_snapshots) {
-        error_setg(errp, "Can't resize an image which has snapshots");
+    /*
+     * Even though we store snapshot size for all images, it was not
+     * required until v3, so it is not safe to proceed for v2.
+     */
+    if (s->nb_snapshots && s->qcow_version < 3) {
+        error_setg(errp, "Can't resize a v2 image which has snapshots");
         ret =3D -ENOTSUP;
         goto fail;
     }
@@ -5005,6 +5008,7 @@ static int qcow2_downgrade(BlockDriverState *bs, int =
target_version,
     BDRVQcow2State *s =3D bs->opaque;
     int current_version =3D s->qcow_version;
     int ret;
+    int i;

     /* This is qcow2_downgrade(), not qcow2_upgrade() */
     assert(target_version < current_version);
@@ -5022,6 +5026,21 @@ static int qcow2_downgrade(BlockDriverState *bs, int=
 target_version,
         return -ENOTSUP;
     }

+    /*
+     * If any internal snapshot has a different size than the current
+     * image size, or VM state size that exceeds 32 bits, downgrading
+     * is unsafe.  Even though we would still use v3-compliant output
+     * to preserve that data, other v2 programs might not realize
+     * those optional fields are important.
+     */
+    for (i =3D 0; i < s->nb_snapshots; i++) {
+        if (s->snapshots[i].vm_state_size > UINT32_MAX ||
+            s->snapshots[i].disk_size !=3D bs->total_sectors * BDRV_SECTOR=
_SIZE) {
+            error_setg(errp, "Internal snapshots prevent downgrade of imag=
e");
+            return -ENOTSUP;
+        }
+    }
+
     /* clear incompatible features */
     if (s->incompatible_features & QCOW2_INCOMPAT_DIRTY) {
         ret =3D qcow2_mark_clean(bs);
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index ce285d308408..10eb24316461 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -111,6 +111,41 @@ $PYTHON qcow2.py "$TEST_IMG" dump-header
 $QEMU_IO -c "read -P 0x2a 42M 64k" "$TEST_IMG" | _filter_qemu_io
 _check_test_img

+echo
+echo "=3D=3D=3D Testing resize with snapshots =3D=3D=3D"
+echo
+_make_test_img -o "compat=3D0.10" 32M
+$QEMU_IO -c "write -P 0x2a 24M 64k" "$TEST_IMG" | _filter_qemu_io
+$QEMU_IMG snapshot -c foo "$TEST_IMG"
+$QEMU_IMG resize "$TEST_IMG" 64M &&
+    echo "unexpected pass"
+$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap=
\)'
+
+$QEMU_IMG amend -o "compat=3D1.1,size=3D128M" "$TEST_IMG" ||
+    echo "unexpected fail"
+$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap=
\)'
+
+$QEMU_IMG snapshot -c bar "$TEST_IMG"
+$QEMU_IMG resize --shrink "$TEST_IMG" 64M ||
+    echo "unexpected fail"
+$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap=
\)'
+
+$QEMU_IMG amend -o "compat=3D0.10,size=3D32M" "$TEST_IMG" &&
+    echo "unexpected pass"
+$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap=
\)'
+
+$QEMU_IMG snapshot -a bar "$TEST_IMG" ||
+    echo "unexpected fail"
+$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap=
\)'
+
+$QEMU_IMG snapshot -d bar "$TEST_IMG"
+$QEMU_IMG amend -o "compat=3D0.10,size=3D32M" "$TEST_IMG" ||
+    echo "unexpected fail"
+$PYTHON qcow2.py "$TEST_IMG" dump-header | grep '^\(version\|size\|nb_snap=
\)'
+
+_check_test_img
+
+
 echo
 echo "=3D=3D=3D Testing dirty lazy_refcounts=3Doff =3D=3D=3D"
 echo
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index 413cc4e0f4ab..5a8d36d0058a 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -271,6 +271,34 @@ read 65536/65536 bytes at offset 44040192
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 No errors were found on the image.

+=3D=3D=3D Testing resize with snapshots =3D=3D=3D
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D33554432
+wrote 65536/65536 bytes at offset 25165824
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+qemu-img: Can't resize a v2 image which has snapshots
+version                   2
+size                      33554432
+nb_snapshots              1
+version                   3
+size                      134217728
+nb_snapshots              1
+Image resized.
+version                   3
+size                      67108864
+nb_snapshots              2
+qemu-img: Internal snapshots prevent downgrade of image
+version                   3
+size                      33554432
+nb_snapshots              2
+version                   3
+size                      134217728
+nb_snapshots              2
+version                   2
+size                      33554432
+nb_snapshots              1
+No errors were found on the image.
+
 =3D=3D=3D Testing dirty lazy_refcounts=3Doff =3D=3D=3D

 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
--=20
2.26.2


