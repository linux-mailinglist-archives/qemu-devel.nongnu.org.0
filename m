Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356534D1C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 18:22:21 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYCCa-00050N-AI
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 12:22:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYC6B-00012f-PS
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 12:15:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYC6A-0005fV-JX
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 12:15:43 -0400
Received: from relay.sw.ru ([185.231.240.75]:41696)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYC6A-0005C2-AV; Tue, 04 Jun 2019 12:15:42 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYC5k-0005Pq-L1; Tue, 04 Jun 2019 19:15:16 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue,  4 Jun 2019 19:15:12 +0300
Message-Id: <20190604161514.262241-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190604161514.262241-1-vsementsov@virtuozzo.com>
References: <20190604161514.262241-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 10/12] block/qcow2: refactor qcow2_co_preadv
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use buffer based io in encrypted case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index f2cb131048..8a033ae08c 100644
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


