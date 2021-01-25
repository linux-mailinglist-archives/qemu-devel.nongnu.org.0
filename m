Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020413024C8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 13:23:43 +0100 (CET)
Received: from localhost ([::1]:37578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l40uD-0002V4-NK
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 07:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l40rt-0001qA-R3; Mon, 25 Jan 2021 07:21:18 -0500
Received: from m12-11.163.com ([220.181.12.11]:58252)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l40rk-0006pq-08; Mon, 25 Jan 2021 07:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IzJta
 DBWMa1mh6350s4GLf654FExhE6JDGCznqKqZp4=; b=WHnjXvCDosOZoCmXzN0XT
 dwOvMHXrgmY3FchuSeL++BkDGN3HucRsgGcQOEb4O+H983XlEpFQAE0dE/yawgX6
 i6ugLF+Y/t5SKtLHnQhyWe3gPPEpexJlYZ5q/5oFrcyhFrPQqj9ZsgxD55UcD751
 10L4mu1vmmd1fPzLTm5if8=
Received: from localhost.localdomain (unknown [116.228.45.98])
 by smtp7 (Coremail) with SMTP id C8CowADnqrq+sw5gI0YjKg--.35022S2;
 Mon, 25 Jan 2021 20:04:14 +0800 (CST)
From: 08005325@163.com
To: kwolf@redhat.co,
	mreitz@redhat.com,
	jsnow@redhat.com
Subject: [PATCH] Fix crash with IOthread when block commit after snapshot
Date: Mon, 25 Jan 2021 20:03:31 +0800
Message-Id: <20210125120331.7740-1-08005325@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowADnqrq+sw5gI0YjKg--.35022S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyfWF1xAFW7WFyxuw4DArb_yoW5tF1kpr
 W8Xw4Skr48Kas7ZanFy3W2gw15Kw4v9F4DG3sxJw1rCry7J3WxKFWrAr1YgFy2vrs7Ja1q
 vFWjga4ftan8C3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jHUDJUUUUU=
X-Originating-IP: [116.228.45.98]
X-CM-SenderInfo: qqyqikqtsvqiywtou0bp/1tbiox4lrFUMV1MSJAAAsf
Received-SPF: pass client-ip=220.181.12.11; envelope-from=08005325@163.com;
 helo=m12-11.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Currently, if guest has workloads, IO thread will acquire aio_context
lock before do io_submit, it leads to segmentfault when do block commit
after snapshot. Just like below:
[Switching to thread 2 (Thread 0x7f046c312700 (LWP 108791))]
#0  0x00005573f57930db in bdrv_mirror_top_pwritev ... at block/mirror.c:1420
1420    in block/mirror.c
(gdb) p s->job
$17 = (MirrorBlockJob *) 0x0
(gdb) p s->stop
$18 = false
(gdb)
(gdb) bt
#0  0x00005573f57930db in bdrv_mirror_top_pwritev ... at block/mirror.c:1420
#1  0x00005573f5798ceb in bdrv_driver_pwritev ... at block/io.c:1183
#2  0x00005573f579ae7a in bdrv_aligned_pwritev ... at block/io.c:1980
#3  0x00005573f579b667 in bdrv_co_pwritev_part ... at block/io.c:2137
#4  0x00005573f57886c8 in blk_do_pwritev_part ... at block/block-backend.c:1231
#5  0x00005573f578879d in blk_aio_write_entry ... at block/block-backend.c:1439
#6  0x00005573f58317cb in coroutine_trampoline ... at util/coroutine-ucontext.c:115
#7  0x00007f047414a0d0 in __start_context () at /lib64/libc.so.6
#8  0x00007f046c310e60 in  ()
#9  0x0000000000000000 in  ()

Switch to qmp:
#0  0x00007f04744dd4ed in __lll_lock_wait () at /lib64/libpthread.so.0
#1  0x00007f04744d8de6 in _L_lock_941 () at /lib64/libpthread.so.0
#2  0x00007f04744d8cdf in pthread_mutex_lock () at /lib64/libpthread.so.0
#3  0x00005573f581de89 in qemu_mutex_lock_impl ... at util/qemu-thread-posix.c:78
#4  0x00005573f575789e in block_job_add_bdrv ... at blockjob.c:223
#5  0x00005573f5757ebd in block_job_create ... at blockjob.c:441
#6  0x00005573f5792430 in mirror_start_job ... at block/mirror.c:1604
#7  0x00005573f5794b6f in commit_active_start ... at block/mirror.c:1789

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


