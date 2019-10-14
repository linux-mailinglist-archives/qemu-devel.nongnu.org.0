Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F87D5D43
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 10:18:21 +0200 (CEST)
Received: from localhost ([::1]:45564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJvYa-0007AF-AF
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 04:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iJvX9-0006aK-3b
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 04:16:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iJvX7-0001ii-8y
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 04:16:50 -0400
Received: from 6.130.60.178.static.reverse-mundo-r.com ([178.60.130.6]:41212
 helo=fanzine.igalia.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iJvX5-0001fd-KX; Mon, 14 Oct 2019 04:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=R6RtrLZxxY2s1eviN2GmfYidifpvl3pH/rBLZpH6kg4=; 
 b=KygllYyT0DkUCYHcuHJ2pbakIgrHb0f688aGd/wZC38i7ijbNGjSzb0adfEgZoWHd5Iv1sBkWgO+sRTWubUeh4nvJulgZSr6xG85v9XWQzjavBeid589KJkAcrHb2qUbCMwEX91J3gFcgcuRz6FULxMuv4mbxdKITr2DcDg9JmvPqDsS4UhxA6abCdq9oRdotRqQGe/B8MhFMJa8JIhHMfcHlCt2tor8fLFcPCVaAb7wqte2FHNQvjBgCLHtYg3nzKbdqlT0LkJUixcQGg2o1JHsZKS3VNgipDlANiREY57F8XZxTaGTQixQp4l4XS14IYdRq+/MN3f3vuxXyAxeJA==;
Received: from 87-100-137-117.bb.dnainternet.fi ([87.100.137.117]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iJvX0-0003Tk-6d; Mon, 14 Oct 2019 10:16:42 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iJvW7-0007ji-1v; Mon, 14 Oct 2019 11:15:47 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] block: Reject misaligned write requests with
 BDRV_REQ_NO_FALLBACK
Date: Mon, 14 Oct 2019 11:15:45 +0300
Message-Id: <20191014081545.29694-1-berto@igalia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The BDRV_REQ_NO_FALLBACK flag means that an operation should only be
performed if it can be offloaded or otherwise performed efficiently.

However a misaligned write request requires a RMW so we should return
an error and let the caller decide how to proceed.

This hits an assertion since commit c8bb23cbdb if the required
alignment is larger than the cluster size:

qemu-img create -f qcow2 -o cluster_size=2k img.qcow2 4G
qemu-io -c "open -o driver=qcow2,file.align=4k blkdebug::img.qcow2" \
        -c 'write 0 512'
qemu-io: block/io.c:1127: bdrv_driver_pwritev: Assertion `!(flags & BDRV_REQ_NO_FALLBACK)' failed.
Aborted

The reason is that when writing to an unallocated cluster we try to
skip the copy-on-write part and zeroize it using BDRV_REQ_NO_FALLBACK
instead, resulting in a write request that is too small (2KB cluster
size vs 4KB required alignment).

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
v2:
- Use QEMU_IS_ALIGNED and (offset | bytes) [Nir]
- Fix typo in comment in iotest
- Expand commit message

v1:
- Initial version

 block/io.c                 |  6 +++++
 tests/qemu-iotests/268     | 55 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/268.out |  7 +++++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 69 insertions(+)
 create mode 100755 tests/qemu-iotests/268
 create mode 100644 tests/qemu-iotests/268.out

diff --git a/block/io.c b/block/io.c
index 4f9ee97c2b..18d842382a 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2071,6 +2071,12 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return ret;
     }
 
+    /* If the request is misaligned then we can't make it efficient */
+    if (!QEMU_IS_ALIGNED(offset | bytes, align) &&
+        (flags & BDRV_REQ_NO_FALLBACK)) {
+        return -ENOTSUP;
+    }
+
     bdrv_inc_in_flight(bs);
     /*
      * Align write if necessary by performing a read-modify-write cycle.
diff --git a/tests/qemu-iotests/268 b/tests/qemu-iotests/268
new file mode 100755
index 0000000000..78c3f4db3a
--- /dev/null
+++ b/tests/qemu-iotests/268
@@ -0,0 +1,55 @@
+#!/usr/bin/env bash
+#
+# Test write request with required alignment larger than the cluster size
+#
+# Copyright (C) 2019 Igalia, S.L.
+# Author: Alberto Garcia <berto@igalia.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+# creator
+owner=berto@igalia.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1	# failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+
+_supported_fmt qcow2
+_supported_proto file
+
+echo
+echo "== Required alignment larger than cluster size =="
+
+CLUSTER_SIZE=2k _make_test_img 1M
+# Since commit c8bb23cbdb writing to an unallocated cluster fills the
+# empty COW areas with bdrv_write_zeroes(flags=BDRV_REQ_NO_FALLBACK)
+$QEMU_IO -c "open -o driver=$IMGFMT,file.align=4k blkdebug::$TEST_IMG" \
+         -c "write 0 512" | _filter_qemu_io
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/268.out b/tests/qemu-iotests/268.out
new file mode 100644
index 0000000000..2ed6c68529
--- /dev/null
+++ b/tests/qemu-iotests/268.out
@@ -0,0 +1,7 @@
+QA output created by 268
+
+== Required alignment larger than cluster size ==
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
+wrote 512/512 bytes at offset 0
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 5805a79d9e..4c861f7eed 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -278,3 +278,4 @@
 265 rw auto quick
 266 rw quick
 267 rw auto quick snapshot
+268 rw auto quick
-- 
2.20.1


