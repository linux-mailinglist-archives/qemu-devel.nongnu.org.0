Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C424AB7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 10:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT0RK-0004oz-Sd
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 04:48:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hT0Oo-0003an-U4
	for qemu-devel@nongnu.org; Tue, 21 May 2019 04:45:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hT0Oo-0004Gv-1R
	for qemu-devel@nongnu.org; Tue, 21 May 2019 04:45:30 -0400
Received: from relay.sw.ru ([185.231.240.75]:60606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hT0Ol-0004AJ-Jz; Tue, 21 May 2019 04:45:27 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hT0Oh-0003ut-LA; Tue, 21 May 2019 11:45:23 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 21 May 2019 11:45:21 +0300
Message-Id: <20190521084522.15050-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190521084522.15050-1-vsementsov@virtuozzo.com>
References: <20190521084522.15050-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [RFC PATCH 2/3] block/qcow2: refactor qcow2_co_preadv
 to use buffer-based io
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
Cc: kwolf@redhat.com, fam@euphon.net, vsementsov@virtuozzo.com,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use buffer based io in encrypted case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index de524d870b..5b4e5e7537 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2047,19 +2047,15 @@ static coroutine_fn int qcow2_co_preadv(BlockDriverState *bs, uint64_t offset,
                 }
 
                 assert(cur_bytes <= QCOW_MAX_CRYPT_CLUSTERS * s->cluster_size);
-                qemu_iovec_reset(&hd_qiov);
-                qemu_iovec_add(&hd_qiov, cluster_data, cur_bytes);
-            }
 
-            BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
-            ret = bdrv_co_preadv(s->data_file,
-                                 cluster_offset + offset_in_cluster,
-                                 cur_bytes, &hd_qiov, 0);
-            if (ret < 0) {
-                goto fail;
-            }
-            if (bs->encrypted) {
-                assert(s->crypto);
+                BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
+                ret = bdrv_co_pread(s->data_file,
+                                    cluster_offset + offset_in_cluster,
+                                    cur_bytes, cluster_data, 0);
+                if (ret < 0) {
+                    goto fail;
+                }
+
                 assert((offset & (BDRV_SECTOR_SIZE - 1)) == 0);
                 assert((cur_bytes & (BDRV_SECTOR_SIZE - 1)) == 0);
                 if (qcow2_co_decrypt(bs, cluster_offset, offset,
@@ -2068,6 +2064,14 @@ static coroutine_fn int qcow2_co_preadv(BlockDriverState *bs, uint64_t offset,
                     goto fail;
                 }
                 qemu_iovec_from_buf(qiov, bytes_done, cluster_data, cur_bytes);
+            } else {
+                BLKDBG_EVENT(bs->file, BLKDBG_READ_AIO);
+                ret = bdrv_co_preadv(s->data_file,
+                                     cluster_offset + offset_in_cluster,
+                                     cur_bytes, &hd_qiov, 0);
+                if (ret < 0) {
+                    goto fail;
+                }
             }
             break;
 
-- 
2.18.0


