Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67014DDBA
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 16:25:22 +0100 (CET)
Received: from localhost ([::1]:34154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixBh3-00024x-Kv
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 10:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixBeT-0007F5-NC
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:22:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ixBeS-0007Sa-MR
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 10:22:41 -0500
Received: from relay.sw.ru ([185.231.240.75]:47746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixBeQ-0007Ia-8f; Thu, 30 Jan 2020 10:22:38 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ixBeK-0008C5-V8; Thu, 30 Jan 2020 18:22:33 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/3] block: fail on open when file size is unaligned to
 request_alignment
Date: Thu, 30 Jan 2020 18:22:18 +0300
Message-Id: <20200130152218.7600-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130152218.7600-1-vsementsov@virtuozzo.com>
References: <20200130152218.7600-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prior to the commit the following command lead to crash:

  ./qemu-io --image-opts -c 'write 0 512' \
  driver=blkdebug,align=4096,image.driver=null-co,image.size=512

It failes on assertion in bdrv_aligned_pwritev:
  "end_sector <= bs->total_sectors || child->perm & BLK_PERM_RESIZE"

The problem is obvious: 512 is aligned to 4096 and becomes larger than
file size. And the core bad thing is that file size is unaligned to
request_alignment.

Let's catch such case on bdrv_open_driver and fail.

Note, that file size and request_alignment may become out of sync
later, so this commit is not full fix of the problem, but it's better
than nothing.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/block.c b/block.c
index ecd09dbbfd..4cfc6c33a2 100644
--- a/block.c
+++ b/block.c
@@ -1324,6 +1324,13 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
     assert(bdrv_min_mem_align(bs) != 0);
     assert(is_power_of_2(bs->bl.request_alignment));
 
+    if (bs->bl.request_alignment > 512 &&
+        !QEMU_IS_ALIGNED(bs->total_sectors, bs->bl.request_alignment / 512))
+    {
+        error_setg(errp, "File size is unaligned to request alignment");
+        return -EINVAL;
+    }
+
     for (i = 0; i < bs->quiesce_counter; i++) {
         if (drv->bdrv_co_drain_begin) {
             drv->bdrv_co_drain_begin(bs);
-- 
2.21.0


