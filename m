Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CB72E7882
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 13:25:53 +0100 (CET)
Received: from localhost ([::1]:35102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuaY3-0008FY-UF
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 07:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kuaWw-0007kX-5P; Wed, 30 Dec 2020 07:24:42 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kuaWt-0005Tm-3W; Wed, 30 Dec 2020 07:24:41 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D5VnL0wFJzj0Gn;
 Wed, 30 Dec 2020 20:23:34 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 30 Dec 2020 20:24:16 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <eblake@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: [PATCH] block/nbd: Fix crash when cancelling drive mirror
Date: Wed, 30 Dec 2020 20:15:55 +0800
Message-ID: <20201230121555.849720-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=liangpeng10@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: xiexiangyou@huawei.com, liangpeng10@huawei.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During drive mirror, if the target VM exits abnormally (e.g. killed),
the nbd client (source VM) will receive EOF, finalize the previous
connection (set s->ioc to NULL), and start the reconnect process.  After
that, if the source VM tries to cancel the drive mirror, it could
receive signal SIGSEGV like this:

  #0  0x0000559015b1e196 in qio_channel_detach_aio_context (ioc=0x0) at ../io/channel.c:452
  #1  0x0000559015a9ffc0 in nbd_client_detach_aio_context (bs=0x559016fdce50) at ../block/nbd.c:237
  #2  0x0000559015a7ed9e in bdrv_detach_aio_context (bs=0x559016fdce50) at ../block.c:6420
  #3  0x0000559015a7f095 in bdrv_set_aio_context_ignore (bs=0x559016fdce50, new_context=0x5590162d5d20, ignore=0x7ffe4cf8ec10) at ../block.c:6499
  #4  0x0000559015a7efbd in bdrv_set_aio_context_ignore (bs=0x559016fe1100, new_context=0x5590162d5d20, ignore=0x7ffe4cf8ec10) at ../block.c:6488
  #5  0x0000559015a7f445 in bdrv_child_try_set_aio_context (bs=0x559016fe1100, ctx=0x5590162d5d20, ignore_child=0x0, errp=0x0) at ../block.c:6603
  #6  0x0000559015a7f49c in bdrv_try_set_aio_context (bs=0x559016fe1100, ctx=0x5590162d5d20, errp=0x0) at ../block.c:6612
  #7  0x0000559015a76c0d in bdrv_replace_child (child=0x559016ea8a90, new_bs=0x0) at ../block.c:2664
  #8  0x0000559015a77094 in bdrv_detach_child (child=0x559016ea8a90) at ../block.c:2783
  #9  0x0000559015a770d6 in bdrv_root_unref_child (child=0x559016ea8a90) at ../block.c:2795
  #10 0x0000559015a82784 in block_job_remove_all_bdrv (job=0x5590169cd7e0) at ../blockjob.c:191
  #11 0x0000559015aafc56 in mirror_exit_common (job=0x5590169cd7e0) at ../block/mirror.c:745
  #12 0x0000559015aafd66 in mirror_abort (job=0x5590169cd7e0) at ../block/mirror.c:773
  #13 0x0000559015a5c8c3 in job_abort (job=0x5590169cd7e0) at ../job.c:670
  #14 0x0000559015a5c967 in job_finalize_single (job=0x5590169cd7e0) at ../job.c:691
  #15 0x0000559015a5cbf0 in job_completed_txn_abort (job=0x5590169cd7e0) at ../job.c:769
  #16 0x0000559015a5cf4b in job_completed (job=0x5590169cd7e0) at ../job.c:863
  #17 0x0000559015a5cfac in job_exit (opaque=0x5590169cd7e0) at ../job.c:885
  #18 0x0000559015bc0bd8 in aio_bh_call (bh=0x7f7b2c007840) at ../util/async.c:136
  #19 0x0000559015bc0ce2 in aio_bh_poll (ctx=0x5590162d5d20) at ../util/async.c:164
  #20 0x0000559015bcf644 in aio_dispatch (ctx=0x5590162d5d20) at ../util/aio-posix.c:381
  #21 0x0000559015bc111f in aio_ctx_dispatch (source=0x5590162d5d20, callback=0x0, user_data=0x0) at ../util/async.c:306
  #22 0x00007f7b3a2b6b34 in g_main_context_dispatch () at /usr/lib64/libglib-2.0.so.0
  #23 0x0000559015be32a4 in glib_pollfds_poll () at ../util/main-loop.c:221
  #24 0x0000559015be331e in os_host_main_loop_wait (timeout=31000000) at ../util/main-loop.c:244
  #25 0x0000559015be3426 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:520
  #26 0x0000559015914a43 in qemu_main_loop () at ../softmmu/runstate.c:720
  #27 0x000055901556fe17 in main (argc=94, argv=0x7ffe4cf8f1e8, envp=0x7ffe4cf8f4e0) at ../softmmu/main.c:50

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 block/nbd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 42536702b6f9..b22a9ecbbcd0 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -232,9 +232,11 @@ static void nbd_client_detach_aio_context(BlockDriverState *bs)
 {
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
-    /* Timer is deleted in nbd_client_co_drain_begin() */
-    assert(!s->reconnect_delay_timer);
-    qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
+    if (s->state == NBD_CLIENT_CONNECTED) {
+        /* Timer is deleted in nbd_client_co_drain_begin() */
+        assert(!s->reconnect_delay_timer);
+        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
+    }
 }
 
 static void nbd_client_attach_aio_context_bh(void *opaque)
-- 
2.29.2


