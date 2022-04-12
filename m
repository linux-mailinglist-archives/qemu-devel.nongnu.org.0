Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7504FD336
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 11:12:00 +0200 (CEST)
Received: from localhost ([::1]:44326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neCZ5-0005Tr-5j
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 05:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suruifeng1@huawei.com>)
 id 1neA49-0006rV-61
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 02:31:54 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <suruifeng1@huawei.com>)
 id 1neA45-0007E2-0Q
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 02:31:51 -0400
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KcwmK0Kj9zFpmL;
 Tue, 12 Apr 2022 14:29:05 +0800 (CST)
Received: from dggpeml500015.china.huawei.com (7.185.36.226) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 12 Apr 2022 14:31:28 +0800
Received: from huawei.com (10.175.104.170) by dggpeml500015.china.huawei.com
 (7.185.36.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 12 Apr
 2022 14:31:28 +0800
To: <qemu-devel@nongnu.org>
CC: <pbonzini@redhat.com>, <peter.maydell@linaro.org>
Subject: [PATCH] block: fix core for unlock not permitted
Date: Tue, 12 Apr 2022 15:13:23 +0800
Message-ID: <20220412071323.580078-1-suruifeng1@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.170]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500015.china.huawei.com (7.185.36.226)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=suruifeng1@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 12 Apr 2022 05:09:31 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  suruifeng <suruifeng1@huawei.com>
From:  suruifeng via <qemu-devel@nongnu.org>

qemu coredump:
  0x00007f9e7205c81b in raise () from /usr/lib64/libc.so.6
  0x00007f9e7205db41 in abort () from /usr/lib64/libc.so.6
  0x00007f9e71ddbe94 in error_exit (err=<optimized out>, msg=msg@entry=0x7f9e71ec1b50 <__func__.20287> "qemu_mutex_unlock_impl")
    at /usr/src/debug/qemu-4.1.0-170.x86_64/util/qemu-thread-posix.c:36
  0x00007f9e71ddc61f in qemu_mutex_unlock_impl (mutex=mutex@entry=0x5559850b0b90, file=file@entry=0x7f9e71ec0978 "/home/abuild/rpmbuild/BUILD/qemu-4.1.0/util/async.c",
    line=line@entry=524) at /usr/src/debug/qemu-4.1.0-170.x86_64/util/qemu-thread-posix.c:108
  0x00007f9e71dd5bb5 in aio_context_release (ctx=ctx@entry=0x5559850b0b30) at /usr/src/debug/qemu-4.1.0-170.x86_64/util/async.c:524
  0x00007f9e70dfed28 in bdrv_flush (bs=bs@entry=0x5559851f0a20) at /usr/src/debug/qemu-4.1.0-170.x86_64/block/io.c:2778
  0x00007f9e70e37f63 in bdrv_close (bs=bs@entry=0x5559851f0a20) at /usr/src/debug/qemu-4.1.0-170.x86_64/block.c:4025
  0x00007f9e70e38193 in bdrv_delete (bs=0x5559851f0a20) at /usr/src/debug/qemu-4.1.0-170.x86_64/block.c:4271
  0x00007f9e70e38225 in bdrv_unref (bs=<optimized out>) at /usr/src/debug/qemu-4.1.0-170.x86_64/block.c:5612
  0x00007f9e70df9a92 in bdrv_next (it=it@entry=0x7ffc5e3547a0) at /usr/src/debug/qemu-4.1.0-170.x86_64/block/block-backend.c:576
  0x00007f9e70dfee76 in bdrv_flush_all () at /usr/src/debug/qemu-4.1.0-170.x86_64/block/io.c:2074
  0x00007f9e71e3a08f in do_vm_stop (state=state@entry=RUN_STATE_SHUTDOWN, send_stop=send_stop@entry=false) at /usr/src/debug/qemu-4.1.0-170.x86_64/cpus.c:1140
  0x00007f9e71e3a14c in vm_shutdown () at /usr/src/debug/qemu-4.1.0-170.x86_64/cpus.c:1151

During mirror job run, the VM is shutdown. During the shutdown, the mirror job I/O error triggers mirror_exit_commom.
In bdrv_flush_all(), bdrv_next() increase the ref to mirror_top_bs first,
and then bdrv_flush(bs) call BDRV_POLL_WHILE and executes mirror_exit_common() decreases ref to mirror_top_bs,
and finally bdrv_next() decreases the ref to mirror_top_bs, resulting in release mirror_top_bs.

Let's fix this by adding aio_context_acquire() and aio_context_release() to bdrv_next().

Signed-off-by: suruifeng <suruifeng1@huawei.com>
---
 block/block-backend.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block/block-backend.c b/block/block-backend.c
index e0e1aff4b1..5ae745c0ab 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -593,6 +593,7 @@ BlockBackend *blk_next(BlockBackend *blk)
 BlockDriverState *bdrv_next(BdrvNextIterator *it)
 {
     BlockDriverState *bs, *old_bs;
+    AioContext *ctx = NULL;
 
     /* Must be called from the main loop */
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
@@ -613,11 +614,17 @@ BlockDriverState *bdrv_next(BdrvNextIterator *it)
         if (it->blk) {
             blk_ref(it->blk);
         }
+	ctx = blk_get_aio_context(old_blk);
+	aio_context_acquire(ctx);
         blk_unref(old_blk);
+	aio_context_release(ctx);
 
         if (bs) {
             bdrv_ref(bs);
+	    ctx = bdrv_get_aio_context(old_bs);
+	    aio_context_acquire(ctx);
             bdrv_unref(old_bs);
+	    aio_context_release(ctx);
             return bs;
         }
         it->phase = BDRV_NEXT_MONITOR_OWNED;
@@ -636,7 +643,10 @@ BlockDriverState *bdrv_next(BdrvNextIterator *it)
     if (bs) {
         bdrv_ref(bs);
     }
+    ctx = bdrv_get_aio_context(old_bs);
+    aio_context_acquire(ctx);
     bdrv_unref(old_bs);
+    aio_context_release(ctx);
 
     return bs;
 }
-- 
2.27.0


