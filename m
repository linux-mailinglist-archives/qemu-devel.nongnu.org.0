Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9E5C029A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 11:45:56 +0200 (CEST)
Received: from localhost ([::1]:48976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDmp0-0005E7-Iz
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 05:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iDmm4-0002wf-Td
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:42:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iDmm3-0007ET-Hk
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:42:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35002)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iDmm0-00077Q-GH; Fri, 27 Sep 2019 05:42:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD163C0578F4;
 Fri, 27 Sep 2019 09:42:47 +0000 (UTC)
Received: from localhost (ovpn-204-76.brq.redhat.com [10.40.204.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 441AD196B2;
 Fri, 27 Sep 2019 09:42:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 01/18] iotests: Filter refcount_order in 036
Date: Fri, 27 Sep 2019 11:42:25 +0200
Message-Id: <20190927094242.11152-2-mreitz@redhat.com>
In-Reply-To: <20190927094242.11152-1-mreitz@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 27 Sep 2019 09:42:47 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test can run just fine with other values for refcount_bits, so we
should filter the value from qcow2.py's dump-header.

(036 currently ignores user-specified image options, but that will be
fixed in the next patch.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/036     | 9 ++++++---
 tests/qemu-iotests/036.out | 6 +++---
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
index f06ff67408..69d0f9f903 100755
--- a/tests/qemu-iotests/036
+++ b/tests/qemu-iotests/036
@@ -55,7 +55,8 @@ $PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatib=
le 63
=20
 # Without feature table
 $PYTHON qcow2.py "$TEST_IMG" del-header-ext 0x6803f857
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+$PYTHON qcow2.py "$TEST_IMG" dump-header \
+    | sed -e 's/^\(refcount_order\s*\).*/\1(filtered)/'
 _img_info
=20
 # With feature table containing bit 63
@@ -103,14 +104,16 @@ echo =3D=3D=3D Create image with unknown autoclear =
feature bit =3D=3D=3D
 echo
 _make_test_img 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit autoclear 63
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+$PYTHON qcow2.py "$TEST_IMG" dump-header \
+    | sed -e 's/^\(refcount_order\s*\).*/\1(filtered)/'
=20
 echo
 echo =3D=3D=3D Repair image =3D=3D=3D
 echo
 _check_test_img -r all
=20
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+$PYTHON qcow2.py "$TEST_IMG" dump-header \
+    | sed -e 's/^\(refcount_order\s*\).*/\1(filtered)/'
=20
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/036.out b/tests/qemu-iotests/036.out
index e489b44386..998c2a8a35 100644
--- a/tests/qemu-iotests/036.out
+++ b/tests/qemu-iotests/036.out
@@ -19,7 +19,7 @@ snapshot_offset           0x0
 incompatible_features     0x8000000000000000
 compatible_features       0x0
 autoclear_features        0x0
-refcount_order            4
+refcount_order            (filtered)
 header_length             104
=20
 qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Unsupported IMGFMT feature=
(s): Unknown incompatible feature: 8000000000000000
@@ -53,7 +53,7 @@ snapshot_offset           0x0
 incompatible_features     0x0
 compatible_features       0x0
 autoclear_features        0x8000000000000000
-refcount_order            4
+refcount_order            (filtered)
 header_length             104
=20
 Header extension:
@@ -81,7 +81,7 @@ snapshot_offset           0x0
 incompatible_features     0x0
 compatible_features       0x0
 autoclear_features        0x0
-refcount_order            4
+refcount_order            (filtered)
 header_length             104
=20
 Header extension:
--=20
2.21.0


