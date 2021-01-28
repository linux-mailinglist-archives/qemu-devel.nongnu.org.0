Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37DC306A66
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 02:33:52 +0100 (CET)
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4wBz-0006GS-Hs
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 20:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l4w9W-0005hk-K9; Wed, 27 Jan 2021 20:31:20 -0500
Received: from m12-18.163.com ([220.181.12.18]:44906)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <08005325@163.com>)
 id 1l4w9O-0003Mu-OV; Wed, 27 Jan 2021 20:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=at2IN
 pQT/KRyzHK5L7f8Nl2JX3MBfbTeTML2cHqlwQI=; b=hQ/uCK2a34mt6IN2VjcIH
 dzcHEg6Vf6LEOtudIXOAcN+Q2m9zKU+JI+2EG4rMj3oH9cjdpahZ1vtQEgpo5HOU
 i5eKgMpUu0AfDLH79dKLSdrdC2RVrVfwpcowSfjOMNSmPmOs2u7t8kP0YV7WJ6Cb
 yQEGGBRqViWlo70u7yiG9E=
Received: from localhost.localdomain (unknown [116.228.45.98])
 by smtp14 (Coremail) with SMTP id EsCowAC3vwPPExJgzSZ7RQ--.40889S2;
 Thu, 28 Jan 2021 09:30:55 +0800 (CST)
From: 08005325@163.com
To: kwolf@redhat.com,
	mreitz@redhat.com,
	jsnow@redhat.com
Subject: [PATCH v4] blockjob: Fix crash with IOthread when block commit after
 snapshot
Date: Thu, 28 Jan 2021 09:30:53 +0800
Message-Id: <20210128013053.23266-1-08005325@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126032545.13349-1-08005325@163.com>
References: <20210126032545.13349-1-08005325@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowAC3vwPPExJgzSZ7RQ--.40889S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCr1DGw4DWFWrtry3Gw4rKrg_yoW5Gw1rpF
 y7Xanayw18AFySvayqy3W0gF1rKwnYvF4UGwn8tr4rCry3X3Z2gr1FyFyjvFyUXrZ7tF4j
 vayjga4xtFs0yrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jB388UUUUU=
X-Originating-IP: [116.228.45.98]
X-CM-SenderInfo: qqyqikqtsvqiywtou0bp/1tbiGQ8orFyPbumU1QAAsH
Received-SPF: pass client-ip=220.181.12.18; envelope-from=08005325@163.com;
 helo=m12-18.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Michael Qiu <qiudayu@huayun.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Qiu <qiudayu@huayun.com>

v4: rebase to latest code

v3: reformat the commit log, remove duplicate content

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

Switch to qemu main thread:
/lib/../lib64/libpthread.so.0
/lib/../lib64/libpthread.so.0
../util/qemu-thread-posix.c:79
qapi/qapi-commands-block-core.c:346
../qapi/qmp-dispatch.c:110
/lib/../lib64/libglib-2.0.so.0

In IO thread when do bdrv_mirror_top_pwritev, the job is NULL, and stop field
is false, this means the MirrorBDSOpaque "s" object has not been initialized yet,
and this object is initialized by block_job_create(), but the initialize
process is stuck in acquiring the lock.

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
index 98ac8af982..51a09f3b60 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -214,13 +214,15 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     BdrvChild *c;
 
     bdrv_ref(bs);
-    if (job->job.aio_context != qemu_get_aio_context()) {
+    if (bdrv_get_aio_context(bs) != job->job.aio_context &&
+        job->job.aio_context != qemu_get_aio_context()) {
         aio_context_release(job->job.aio_context);
     }
     c = bdrv_root_attach_child(bs, name, &child_job, 0,
                                job->job.aio_context, perm, shared_perm, job,
                                errp);
-    if (job->job.aio_context != qemu_get_aio_context()) {
+    if (bdrv_get_aio_context(bs) != job->job.aio_context &&
+        job->job.aio_context != qemu_get_aio_context()) {
         aio_context_acquire(job->job.aio_context);
     }
     if (c == NULL) {
-- 
2.22.0



