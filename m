Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D031BBF7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 16:12:33 +0100 (CET)
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBfY8-0007w3-HG
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 10:12:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNN-0005fR-4O
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBfNL-0000nU-4z
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613401282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gB2c914N453Rav2bP3tPhX9RRzLXU/YZJW0xtRFFYbI=;
 b=cE9FDdK5ZcwC+gOYealvovzlJ2gsy0+UIiWEO2ZS+PeV3z92vQBevwVGRHPX9i3vZgqWbT
 o2bjTi+b2rrfrMkqoMWRlwfDyp09kcH5Ah6ayqA/KkWV7l5XVEEW/rKiIEfhzehnvcZLvX
 YSANOL/oyPDBX+1jh0wFR4wCLPeYMvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-8E9Cek4wMKyzhyaqRnlLwg-1; Mon, 15 Feb 2021 10:01:08 -0500
X-MC-Unique: 8E9Cek4wMKyzhyaqRnlLwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEB16801975;
 Mon, 15 Feb 2021 15:01:07 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C747C5C241;
 Mon, 15 Feb 2021 15:01:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/11] blockjob: Fix crash with IOthread when block commit
 after snapshot
Date: Mon, 15 Feb 2021 16:00:52 +0100
Message-Id: <20210215150100.436555-4-kwolf@redhat.com>
In-Reply-To: <20210215150100.436555-1-kwolf@redhat.com>
References: <20210215150100.436555-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Qiu <qiudayu@huayun.com>

Currently, if guest has workloads, IO thread will acquire aio_context
lock before do io_submit, it leads to segmentfault when do block commit
after snapshot. Just like below:

Program received signal SIGSEGV, Segmentation fault.

[Switching to Thread 0x7f7c7d91f700 (LWP 99907)]
0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
1437    ../block/mirror.c: No such file or directory.
(gdb) p s->job
$17 = (MirrorBlockJob *) 0x0
(gdb) p s->stop
$18 = false

Call trace of IO thread:
0  0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
1  0x00005576d0f7f3ab in bdrv_driver_pwritev at ../block/io.c:1174
2  0x00005576d0f8139d in bdrv_aligned_pwritev at ../block/io.c:1988
3  0x00005576d0f81b65 in bdrv_co_pwritev_part at ../block/io.c:2156
4  0x00005576d0f8e6b7 in blk_do_pwritev_part at ../block/block-backend.c:1260
5  0x00005576d0f8e84d in blk_aio_write_entry at ../block/block-backend.c:1476
...

Switch to qemu main thread:
0  0x00007f903be704ed in __lll_lock_wait at
/lib/../lib64/libpthread.so.0
1  0x00007f903be6bde6 in _L_lock_941 at /lib/../lib64/libpthread.so.0
2  0x00007f903be6bcdf in pthread_mutex_lock at
/lib/../lib64/libpthread.so.0
3  0x0000564b21456889 in qemu_mutex_lock_impl at
../util/qemu-thread-posix.c:79
4  0x0000564b213af8a5 in block_job_add_bdrv at ../blockjob.c:224
5  0x0000564b213b00ad in block_job_create at ../blockjob.c:440
6  0x0000564b21357c0a in mirror_start_job at ../block/mirror.c:1622
7  0x0000564b2135a9af in commit_active_start at ../block/mirror.c:1867
8  0x0000564b2133d132 in qmp_block_commit at ../blockdev.c:2768
9  0x0000564b2141fef3 in qmp_marshal_block_commit at
qapi/qapi-commands-block-core.c:346
10 0x0000564b214503c9 in do_qmp_dispatch_bh at
../qapi/qmp-dispatch.c:110
11 0x0000564b21451996 in aio_bh_poll at ../util/async.c:164
12 0x0000564b2146018e in aio_dispatch at ../util/aio-posix.c:381
13 0x0000564b2145187e in aio_ctx_dispatch at ../util/async.c:306
14 0x00007f9040239049 in g_main_context_dispatch at
/lib/../lib64/libglib-2.0.so.0
15 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:232
16 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:255
17 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:531
18 0x0000564b212304e1 in qemu_main_loop at ../softmmu/runstate.c:721
19 0x0000564b20f7975e in main at ../softmmu/main.c:50

In IO thread when do bdrv_mirror_top_pwritev, the job is NULL, and stop field
is false, this means the MirrorBDSOpaque "s" object has not been initialized
yet, and this object is initialized by block_job_create(), but the initialize
process is stuck in acquiring the lock.

In this situation, IO thread come to bdrv_mirror_top_pwritev(),which means that
mirror-top node is already inserted into block graph, but its bs->opaque->job
is not initialized.

The root cause is that qemu main thread do release/acquire when hold the lock,
at the same time, IO thread get the lock after release stage, and the crash
occured.

Actually, in this situation, job->job.aio_context will not equal to
qemu_get_aio_context(), and will be the same as bs->aio_context,
thus, no need to release the lock, becasue bdrv_root_attach_child()
will not change the context.

This patch fix this issue.

Fixes: 132ada80 "block: Adjust AioContexts when attaching nodes"

Signed-off-by: Michael Qiu <qiudayu@huayun.com>
Message-Id: <20210203024059.52683-1-08005325@163.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 blockjob.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index db3a21699c..f2feff051d 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -212,15 +212,19 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
                        uint64_t perm, uint64_t shared_perm, Error **errp)
 {
     BdrvChild *c;
+    bool need_context_ops;
 
     bdrv_ref(bs);
-    if (job->job.aio_context != qemu_get_aio_context()) {
+
+    need_context_ops = bdrv_get_aio_context(bs) != job->job.aio_context;
+
+    if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
         aio_context_release(job->job.aio_context);
     }
     c = bdrv_root_attach_child(bs, name, &child_job, 0,
                                job->job.aio_context, perm, shared_perm, job,
                                errp);
-    if (job->job.aio_context != qemu_get_aio_context()) {
+    if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
         aio_context_acquire(job->job.aio_context);
     }
     if (c == NULL) {
-- 
2.29.2


