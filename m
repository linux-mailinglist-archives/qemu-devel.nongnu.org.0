Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39BF15497B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 17:44:08 +0100 (CET)
Received: from localhost ([::1]:42238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izkG8-0002Fd-0D
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 11:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1izkF7-0001Vj-L3
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 11:43:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1izkF6-0002Vr-DW
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 11:43:05 -0500
Received: from relay.sw.ru ([185.231.240.75]:49378)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1izkF3-0002JN-Gi; Thu, 06 Feb 2020 11:43:01 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1izkEr-00007c-HR; Thu, 06 Feb 2020 19:42:49 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block: fix crash on zero-length unaligned write and read
Date: Thu,  6 Feb 2020 19:42:45 +0300
Message-Id: <20200206164245.17781-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 7a3f542fbd "block/io: refactor padding" occasionally dropped
aligning for zero-length request: bdrv_init_padding() blindly return
false if bytes == 0, like there is nothing to align.

This leads the following command to crash:

./qemu-io --image-opts -c 'write 1 0' \
  driver=blkdebug,align=512,image.driver=null-co,image.size=512

>> qemu-io: block/io.c:1955: bdrv_aligned_pwritev: Assertion
    `(offset & (align - 1)) == 0' failed.
>> Aborted (core dumped)

Prior to 7a3f542fbd we does aligning of such zero requests. Instead of
recovering this behavior let's just do nothing on such requests as it
is useless.

Note that driver may have special meaning of zero-length reqeusts, like
qcow2_co_pwritev_compressed_part, so we can't skip any zero-length
operation. But for unaligned ones, we can't pass it to driver anyway.

This commit also fixes crash in iotest 80 running with -nocache:

./check -nocache -qcow2 80

which crashes on same assertion due to trying to read empty extra data
in qcow2_do_read_snapshots().

Cc: qemu-stable@nongnu.org # v4.2
Fixes: 7a3f542fbd
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index 1eb2b2bddc..7e4cb74cf4 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1565,10 +1565,12 @@ static bool bdrv_init_padding(BlockDriverState *bs,
         pad->tail = align - pad->tail;
     }
 
-    if ((!pad->head && !pad->tail) || !bytes) {
+    if (!pad->head && !pad->tail) {
         return false;
     }
 
+    assert(bytes); /* Nothing good in aligning zero-length requests */
+
     sum = pad->head + bytes + pad->tail;
     pad->buf_len = (sum > align && pad->head && pad->tail) ? 2 * align : align;
     pad->buf = qemu_blockalign(bs, pad->buf_len);
@@ -1706,6 +1708,18 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *child,
         return ret;
     }
 
+    if (bytes == 0 && !QEMU_IS_ALIGNED(offset, bs->bl.request_alignment)) {
+        /*
+         * Aligning zero request is nonsense. Even if driver has special meaning
+         * of zero-length (like qcow2_co_pwritev_compressed_part), we can't pass
+         * it to driver due to request_alignment.
+         *
+         * Still, no reason to return an error if someone do unaligned
+         * zero-length read occasionally.
+         */
+        return 0;
+    }
+
     bdrv_inc_in_flight(bs);
 
     /* Don't do copy-on-read if we read data before write operation */
@@ -2116,6 +2130,18 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return -ENOTSUP;
     }
 
+    if (bytes == 0 && !QEMU_IS_ALIGNED(offset, bs->bl.request_alignment)) {
+        /*
+         * Aligning zero request is nonsense. Even if driver has special meaning
+         * of zero-length (like qcow2_co_pwritev_compressed_part), we can't pass
+         * it to driver due to request_alignment.
+         *
+         * Still, no reason to return an error if someone do unaligned
+         * zero-length write occasionally.
+         */
+        return 0;
+    }
+
     bdrv_inc_in_flight(bs);
     /*
      * Align write if necessary by performing a read-modify-write cycle.
-- 
2.21.0


