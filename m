Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58D28802F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 18:34:34 +0200 (CEST)
Received: from localhost ([::1]:32936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw7qc-0002IH-69
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 12:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57856)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hw7YZ-0004U7-05
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 12:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hw7YX-0004oG-U3
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 12:15:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hw7YV-0004mK-Eo; Fri, 09 Aug 2019 12:15:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BFE2981F31;
 Fri,  9 Aug 2019 16:15:50 +0000 (UTC)
Received: from localhost (unknown [10.40.205.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6DE95D9C3;
 Fri,  9 Aug 2019 16:15:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri,  9 Aug 2019 18:14:06 +0200
Message-Id: <20190809161407.11920-42-mreitz@redhat.com>
In-Reply-To: <20190809161407.11920-1-mreitz@redhat.com>
References: <20190809161407.11920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 09 Aug 2019 16:15:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 41/42] iotests: Add test for commit in sub
 directory
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a test for committing an overlay in a sub directory to one of the
images in its backing chain, using both relative and absolute filenames.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/020     | 36 ++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/020.out | 10 ++++++++++
 2 files changed, 46 insertions(+)

diff --git a/tests/qemu-iotests/020 b/tests/qemu-iotests/020
index 6b0ebb37d2..94633c3a32 100755
--- a/tests/qemu-iotests/020
+++ b/tests/qemu-iotests/020
@@ -31,6 +31,11 @@ _cleanup()
 	_cleanup_test_img
     rm -f "$TEST_IMG.base"
     rm -f "$TEST_IMG.orig"
+
+    rm -f "$TEST_DIR/subdir/t.$IMGFMT.base"
+    rm -f "$TEST_DIR/subdir/t.$IMGFMT.mid"
+    rm -f "$TEST_DIR/subdir/t.$IMGFMT"
+    rmdir "$TEST_DIR/subdir" &> /dev/null
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
=20
@@ -133,6 +138,37 @@ $QEMU_IO -c 'writev 0 64k' "$TEST_IMG" | _filter_qem=
u_io
 $QEMU_IMG commit "$TEST_IMG"
 _cleanup
=20
+
+echo
+echo 'Testing commit in sub-directory with relative filenames'
+echo
+
+pushd "$TEST_DIR" > /dev/null
+
+mkdir subdir
+
+TEST_IMG=3D"subdir/t.$IMGFMT.base" _make_test_img 1M
+TEST_IMG=3D"subdir/t.$IMGFMT.mid" _make_test_img -b "t.$IMGFMT.base"
+TEST_IMG=3D"subdir/t.$IMGFMT" _make_test_img -b "t.$IMGFMT.mid"
+
+# Should work
+$QEMU_IMG commit -b "t.$IMGFMT.mid" "subdir/t.$IMGFMT"
+
+# Might theoretically work, but does not in practice (we have to
+# decide between this and the above; and since we always represent
+# backing file names as relative to the overlay, we go for the above)
+$QEMU_IMG commit -b "subdir/t.$IMGFMT.mid" "subdir/t.$IMGFMT" 2>&1 | \
+    _filter_imgfmt
+
+# This should work as well
+$QEMU_IMG commit -b "$TEST_DIR/subdir/t.$IMGFMT.mid" "subdir/t.$IMGFMT"
+
+popd > /dev/null
+
+# Now let's try with just absolute filenames
+$QEMU_IMG commit -b "$TEST_DIR/subdir/t.$IMGFMT.mid" \
+    "$TEST_DIR/subdir/t.$IMGFMT"
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/020.out b/tests/qemu-iotests/020.out
index 4b722b2dd0..228c37dded 100644
--- a/tests/qemu-iotests/020.out
+++ b/tests/qemu-iotests/020.out
@@ -1094,4 +1094,14 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D=
1048576 backing_file=3Djson:{'driv
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-img: Block job failed: No space left on device
+
+Testing commit in sub-directory with relative filenames
+
+Formatting 'subdir/t.IMGFMT.base', fmt=3DIMGFMT size=3D1048576
+Formatting 'subdir/t.IMGFMT.mid', fmt=3DIMGFMT size=3D1048576 backing_fi=
le=3Dt.IMGFMT.base
+Formatting 'subdir/t.IMGFMT', fmt=3DIMGFMT size=3D1048576 backing_file=3D=
t.IMGFMT.mid
+Image committed.
+qemu-img: Did not find 'subdir/t.IMGFMT.mid' in the backing chain of 'su=
bdir/t.IMGFMT'
+Image committed.
+Image committed.
 *** done
--=20
2.21.0


