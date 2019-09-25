Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2E7BE4AE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 20:35:48 +0200 (CEST)
Received: from localhost ([::1]:55884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDC8h-0003vH-8l
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 14:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36822)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iDC5i-0001PM-3j
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iDC5h-0007c7-1z
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 14:32:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47840)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iDC5e-0007Y5-K4; Wed, 25 Sep 2019 14:32:38 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E6F102026F;
 Wed, 25 Sep 2019 18:32:37 +0000 (UTC)
Received: from localhost (unknown [10.40.205.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8238F194B2;
 Wed, 25 Sep 2019 18:32:37 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/3] iotests: Disable 125 on broken XFS versions
Date: Wed, 25 Sep 2019 20:32:30 +0200
Message-Id: <20190925183231.11196-3-mreitz@redhat.com>
In-Reply-To: <20190925183231.11196-1-mreitz@redhat.com>
References: <20190925183231.11196-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 25 Sep 2019 18:32:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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

And by that I mean all XFS versions, as far as I can tell.  All details
are in the comment below.

We never noticed this problem because we only read the first number from
qemu-img info's "disk size" output -- and that is effectively useless,
because qemu-img prints a human-readable value (which generally includes
a decimal point).  That will be fixed in the next patch.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/125 | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/tests/qemu-iotests/125 b/tests/qemu-iotests/125
index df328a63a6..0ef51f1e21 100755
--- a/tests/qemu-iotests/125
+++ b/tests/qemu-iotests/125
@@ -49,6 +49,46 @@ if [ -z "$TEST_IMG_FILE" ]; then
     TEST_IMG_FILE=3D$TEST_IMG
 fi
=20
+# Test whether we are running on a broken XFS version.  There is this
+# bug:
+
+# $ rm -f foo
+# $ touch foo
+# $ block_size=3D4096 # Your FS's block size
+# $ fallocate -o $((block_size / 2)) -l $block_size foo
+# $ LANG=3DC xfs_bmap foo | grep hole
+#         1: [8..15]: hole
+#
+# The problem is that the XFS driver rounds down the offset and
+# rounds up the length to the block size, but independently.  As
+# such, it only allocates the first block in the example above,
+# even though it should allocate the first two blocks (because our
+# request is to fallocate something that touches both the first
+# two blocks).
+#
+# This means that when you then write to the beginning of the
+# second block, the disk usage of the first two blocks grows.
+#
+# That is precisely what fallocate() promises, though: That when you
+# write to an area that you have fallocated, no new blocks will have
+# to be allocated.
+
+touch "$TEST_IMG_FILE"
+# Assuming there is no FS with a block size greater than 64k
+fallocate -o 65535 -l 2 "$TEST_IMG_FILE"
+len0=3D$(get_image_size_on_host)
+
+# Write to something that in theory we have just fallocated
+# (Thus, the on-disk size should not increase)
+poke_file "$TEST_IMG_FILE" 65536 42
+len1=3D$(get_image_size_on_host)
+
+if [ $len1 -gt $len0 ]; then
+    _notrun "the test filesystem's fallocate() is broken"
+fi
+
+rm -f "$TEST_IMG_FILE"
+
 # Generally, we create some image with or without existing preallocation=
 and
 # then resize it. Then we write some data into the image and verify that=
 its
 # size does not change if we have used preallocation.
--=20
2.21.0


