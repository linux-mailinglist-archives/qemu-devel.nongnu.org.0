Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD2303282
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 04:13:29 +0100 (CET)
Received: from localhost ([::1]:60918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4EnI-0008Q0-7h
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 22:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l4EmH-0007ur-KO; Mon, 25 Jan 2021 22:12:25 -0500
Received: from m12-17.163.com ([220.181.12.17]:56708)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l4EmA-0001TP-Fh; Mon, 25 Jan 2021 22:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ARGFx
 3eyFgOKdRTd52qxfbeghKpqzDB6AglisdeUAPo=; b=mWsL+DG2k88SzLNPawj9h
 h+9P8L/wgBhz2AkVRNF2rbhPanvBrl0X53Z3At+fIeE6x3dRT7m1Dyu3VF8fs6fx
 PA1CCprVTt4+29c0yZlkPsKlO5oEbUEzR1AC+F+1xh58EXymimMjB99pibDhxJof
 hky+wOe6hl8GV08OtjdDls=
Received: from localhost.localdomain (unknown [116.228.45.98])
 by smtp13 (Coremail) with SMTP id EcCowADnnkaAiA9gprz_hg--.47925S2;
 Tue, 26 Jan 2021 11:12:00 +0800 (CST)
From: 08005325@163.com
To: kwolf@redhat.com,
	mreitz@redhat.com,
	jsnow@redhat.com
Subject: [PATCH v2] Fix crash with IOthread when block commit after snapshot
Date: Tue, 26 Jan 2021 11:11:44 +0800
Message-Id: <20210126031144.13121-1-08005325@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125120727.7799-1-08005325@163.com>
References: <20210125120727.7799-1-08005325@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EcCowADnnkaAiA9gprz_hg--.47925S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw43Cw13Jw1DCw13CFWxWFg_yoWrKw18pr
 yUWFnakw40kFn7ZFs2y3WIgry5Kw40vF4DCwnrtr18ur9xA3WxKFyrArWYgFWjq3yfJr4q
 qF12ga48tFn5A3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9jjgUUUUU=
X-Originating-IP: [116.228.45.98]
X-CM-SenderInfo: qqyqikqtsvqiywtou0bp/1tbiGQAmrFyPbtCX5gAAsP
Received-SPF: pass client-ip=220.181.12.17; envelope-from=08005325@163.com;
 helo=m12-17.163.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Michael Qiu <qiudayu@huayun.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Qiu <qiudayu@huayun.com>

v2: modify the coredump backtrace within commit log with the newest
    qemu with master branch

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

(gdb) bt
Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f7c7d91f700 (LWP 99907)]
0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
1437    ../block/mirror.c: No such file or directory.

(gdb) bt
#0  0x00005576d0f65aab in bdrv_mirror_top_pwritev at ../block/mirror.c:1437
#1  0x00005576d0f7f3ab in bdrv_driver_pwritev at ../block/io.c:1174
#2  0x00005576d0f8139d in bdrv_aligned_pwritev at ../block/io.c:1988
#3  0x00005576d0f81b65 in bdrv_co_pwritev_part at ../block/io.c:2156
#4  0x00005576d0f8e6b7 in blk_do_pwritev_part at ../block/block-backend.c:1260
#5  0x00005576d0f8e84d in blk_aio_write_entry at ../block/block-backend.c:1476
#6  0x00005576d1060ddb in coroutine_trampoline at ../util/coroutine-ucontext.c:173
#7  0x00007f7c8d3be0d0 in __start_context at /lib/../lib64/libc.so.6
#8  0x00007f7b52beb1e0 in  ()
#9  0x0000000000000000 in  ()

Switch to qemu main thread:
#0  0x00007f903be704ed in __lll_lock_wait at
/lib/../lib64/libpthread.so.0
#1  0x00007f903be6bde6 in _L_lock_941 at /lib/../lib64/libpthread.so.0
#2  0x00007f903be6bcdf in pthread_mutex_lock at
/lib/../lib64/libpthread.so.0
#3  0x0000564b21456889 in qemu_mutex_lock_impl at
../util/qemu-thread-posix.c:79
#4  0x0000564b213af8a5 in block_job_add_bdrv at ../blockjob.c:224
#5  0x0000564b213b00ad in block_job_create at ../blockjob.c:440
#6  0x0000564b21357c0a in mirror_start_job at ../block/mirror.c:1622
#7  0x0000564b2135a9af in commit_active_start at ../block/mirror.c:1867
#8  0x0000564b2133d132 in qmp_block_commit at ../blockdev.c:2768
#9  0x0000564b2141fef3 in qmp_marshal_block_commit at
qapi/qapi-commands-block-core.c:346
#10 0x0000564b214503c9 in do_qmp_dispatch_bh at
../qapi/qmp-dispatch.c:110
#11 0x0000564b21451996 in aio_bh_poll at ../util/async.c:164
#12 0x0000564b2146018e in aio_dispatch at ../util/aio-posix.c:381
#13 0x0000564b2145187e in aio_ctx_dispatch at ../util/async.c:306
#14 0x00007f9040239049 in g_main_context_dispatch at
/lib/../lib64/libglib-2.0.so.0
#15 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:232
#16 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:255
#17 0x0000564b21447368 in main_loop_wait at ../util/main-loop.c:531
#18 0x0000564b212304e1 in qemu_main_loop at ../softmmu/runstate.c:721
#19 0x0000564b20f7975e in main at ../softmmu/main.c:50

in IO thread when do bdrv_mirror_top_pwritev, the job is NULL, and stop field
is false, this means the s object has not been initialized, and this object
is initialized by block_job_create(), but the initialize process stuck in
acquire the lock.

The rootcause is that qemu do release/acquire when hold the lock,
at the same time, IO thread get the lock after release stage, and the crash
occured.

Actually, in this situation, job->job.aio_context will not equal to
qemu_get_aio_context(), and will be the same as bs->aio_context,
thus, no need to release the lock, becasue bdrv_root_attach_child()
will not change the context.

This patch fix this issue.

Signed-off-by: Michael Qiu <qiudayu@huayun.com>
---
 blockjob.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/blockjob.c b/blockjob.c
index c6e20e2f..e1d41db9 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -214,12 +214,14 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     BdrvChild *c;
 
     bdrv_ref(bs);
-    if (job->job.aio_context != qemu_get_aio_context()) {
+    if (bdrv_get_aio_context(bs) != job->job.aio_context &&
+        job->job.aio_context != qemu_get_aio_context()) {
         aio_context_release(job->job.aio_context);
     }
     c = bdrv_root_attach_child(bs, name, &child_job, job->job.aio_context,
                                perm, shared_perm, job, errp);
-    if (job->job.aio_context != qemu_get_aio_context()) {
+    if (bdrv_get_aio_context(bs) != job->job.aio_context &&
+        job->job.aio_context != qemu_get_aio_context()) {
         aio_context_acquire(job->job.aio_context);
     }
     if (c == NULL) {
-- 
2.22.0



