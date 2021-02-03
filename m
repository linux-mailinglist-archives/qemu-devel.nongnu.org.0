Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA80F30D1B8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:43:21 +0100 (CET)
Received: from localhost ([::1]:59492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l788W-0001Y8-Vf
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l786Z-0000cq-CN; Tue, 02 Feb 2021 21:41:19 -0500
Received: from m12-13.163.com ([220.181.12.13]:45411)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l786W-0000wr-Uh; Tue, 02 Feb 2021 21:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jnkbU
 IKb9UCimuILAUia0uEmz6ZPZ/06L4JQm9bf9lQ=; b=Vx9yjysF9+oE4pOOtuVYL
 uijpYub8NeaGarMxx53sEgU4JTs12wQLLHMDLula0DzR3qNer7XLrB6KPtQkbHTT
 g5nK30YpYASNUo/uGVt6wV0yf2+RhTlO6IdESmUroVevWSPfqhXoz88GBAFkq9ni
 IBd8ELRA9pzCOZCh5ej8ag=
Received: from localhost.localdomain (unknown [116.228.45.98])
 by smtp9 (Coremail) with SMTP id DcCowAD3NZI_DRpgW5x2dg--.84S2;
 Wed, 03 Feb 2021 10:41:07 +0800 (CST)
From: 08005325@163.com
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] blockjob: Fix crash with IOthread when block commit after
 snapshot
Date: Wed,  3 Feb 2021 10:40:59 +0800
Message-Id: <20210203024059.52683-1-08005325@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAD3NZI_DRpgW5x2dg--.84S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGrWfGr1DXrykur1DWw4xCrg_yoW7Jry8pr
 yUWFnakr40kFn3Zan2q3W0gry5Kw40vF4DCwsrtr1rZF9xA3Z7KFyrAFWY9FWjv3yfJrs0
 vF12ga48tFs8A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jmmhrUUUUU=
X-Originating-IP: [116.228.45.98]
X-CM-SenderInfo: qqyqikqtsvqiywtou0bp/1tbiNQMurFrPayWpGAAAse
Received-SPF: pass client-ip=220.181.12.13; envelope-from=08005325@163.com;
 helo=m12-13.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com,
 Michael Qiu <qiudayu@huayun.com>, mreitz@redhat.com, liangpeng10@huawei.com,
 quweijie@huayun.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Qiu <qiudayu@huayun.com>

v5: reformat the commit log with backtrace of main thread
    Add a boolean variable to make main thread could re-acquire
    aio_context on success path.

v4: rebase to latest code

v3: reformat the commit log, remove duplicate content

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
---
 blockjob.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index db3a21699c..d9dca36f65 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -212,15 +212,21 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
                        uint64_t perm, uint64_t shared_perm, Error **errp)
 {
     BdrvChild *c;
+    bool need_context_ops;
 
     bdrv_ref(bs);
-    if (job->job.aio_context != qemu_get_aio_context()) {
+
+    need_context_ops = bdrv_get_aio_context(bs) != job->job.aio_context;
+
+    if (need_context_ops &&
+        job->job.aio_context != qemu_get_aio_context()) {
         aio_context_release(job->job.aio_context);
     }
     c = bdrv_root_attach_child(bs, name, &child_job, 0,
                                job->job.aio_context, perm, shared_perm, job,
                                errp);
-    if (job->job.aio_context != qemu_get_aio_context()) {
+    if (need_context_ops &&
+        job->job.aio_context != qemu_get_aio_context()) {
         aio_context_acquire(job->job.aio_context);
     }
     if (c == NULL) {
-- 
2.22.0



