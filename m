Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DBF304038
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:26:45 +0100 (CET)
Received: from localhost ([::1]:46274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PIq-000685-Ni
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDX-0008T4-OW
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDP-00067G-5K
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7DY26Uwzm/RG90y+FllHzvY8BWsKMqUOb0JEOqyIMu8=;
 b=RGpUD7i+qlCHvxYDne79CBslw/QkCvkq5zt+YFNuZwsgNVhRqS8JHmVVhXZViMHJpOrV6h
 PGjYLQxwsCVDbJI5BAs5uPOwlHhsx0EKSIqWbyJV9ALx4kUFvY1exY+AjZKmsHhrLxWSwV
 YJQOHYVLQDM+r+X7rQBBcj8tDGhnAG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-K8lqBSUQOYW45McMe7XKCg-1; Tue, 26 Jan 2021 09:21:03 -0500
X-MC-Unique: K8lqBSUQOYW45McMe7XKCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C406E59;
 Tue, 26 Jan 2021 14:20:50 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 395B110023AB;
 Tue, 26 Jan 2021 14:20:50 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/53] block: apply COR-filter to block-stream jobs
Date: Tue, 26 Jan 2021 15:19:37 +0100
Message-Id: <20210126142016.806073-15-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

This patch completes the series with the COR-filter applied to
block-stream operations.

Adding the filter makes it possible in future implement discarding
copied regions in backing files during the block-stream job, to reduce
the disk overuse (we need control on permissions).

Also, the filter now is smart enough to do copy-on-read with specified
base, so we have benefit on guest reads even when doing block-stream of
the part of the backing chain.

Several iotests are slightly modified due to filter insertion.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201216061703.70908-14-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/stream.c             | 105 ++++++++++++++++++++++---------------
 tests/qemu-iotests/030     |   8 +--
 tests/qemu-iotests/141.out |   2 +-
 tests/qemu-iotests/245     |  20 ++++---
 4 files changed, 80 insertions(+), 55 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 626dfa2b22..1fa742b0db 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -17,8 +17,10 @@
 #include "block/blockjob_int.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qmp/qdict.h"
 #include "qemu/ratelimit.h"
 #include "sysemu/block-backend.h"
+#include "block/copy-on-read.h"
 
 enum {
     /*
@@ -33,11 +35,11 @@ typedef struct StreamBlockJob {
     BlockJob common;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *above_base;   /* Node directly above the base */
+    BlockDriverState *cor_filter_bs;
     BlockDriverState *target_bs;
     BlockdevOnError on_error;
     char *backing_file_str;
     bool bs_read_only;
-    bool chain_frozen;
 } StreamBlockJob;
 
 static int coroutine_fn stream_populate(BlockBackend *blk,
@@ -45,17 +47,7 @@ static int coroutine_fn stream_populate(BlockBackend *blk,
 {
     assert(bytes < SIZE_MAX);
 
-    return blk_co_preadv(blk, offset, bytes, NULL,
-                         BDRV_REQ_COPY_ON_READ | BDRV_REQ_PREFETCH);
-}
-
-static void stream_abort(Job *job)
-{
-    StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-
-    if (s->chain_frozen) {
-        bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
-    }
+    return blk_co_preadv(blk, offset, bytes, NULL, BDRV_REQ_PREFETCH);
 }
 
 static int stream_prepare(Job *job)
@@ -67,8 +59,9 @@ static int stream_prepare(Job *job)
     Error *local_err = NULL;
     int ret = 0;
 
-    bdrv_unfreeze_backing_chain(s->target_bs, s->above_base);
-    s->chain_frozen = false;
+    /* We should drop filter at this point, as filter hold the backing chain */
+    bdrv_cor_filter_drop(s->cor_filter_bs);
+    s->cor_filter_bs = NULL;
 
     if (bdrv_cow_child(unfiltered_bs)) {
         const char *base_id = NULL, *base_fmt = NULL;
@@ -94,6 +87,11 @@ static void stream_clean(Job *job)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
 
+    if (s->cor_filter_bs) {
+        bdrv_cor_filter_drop(s->cor_filter_bs);
+        s->cor_filter_bs = NULL;
+    }
+
     /* Reopen the image back in read-only mode if necessary */
     if (s->bs_read_only) {
         /* Give up write permissions before making it read-only */
@@ -109,7 +107,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockBackend *blk = s->common.blk;
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
-    bool enable_cor = !bdrv_cow_child(s->base_overlay);
     int64_t len;
     int64_t offset = 0;
     uint64_t delay_ns = 0;
@@ -127,15 +124,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
     }
     job_progress_set_remaining(&s->common.job, len);
 
-    /* Turn on copy-on-read for the whole block device so that guest read
-     * requests help us make progress.  Only do this when copying the entire
-     * backing chain since the copy-on-read operation does not take base into
-     * account.
-     */
-    if (enable_cor) {
-        bdrv_enable_copy_on_read(s->target_bs);
-    }
-
     for ( ; offset < len; offset += n) {
         bool copy;
         int ret;
@@ -194,10 +182,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         }
     }
 
-    if (enable_cor) {
-        bdrv_disable_copy_on_read(s->target_bs);
-    }
-
     /* Do not remove the backing file if an error was there but ignored. */
     return error;
 }
@@ -209,7 +193,6 @@ static const BlockJobDriver stream_job_driver = {
         .free          = block_job_free,
         .run           = stream_run,
         .prepare       = stream_prepare,
-        .abort         = stream_abort,
         .clean         = stream_clean,
         .user_resume   = block_job_user_resume,
     },
@@ -228,7 +211,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     bool bs_read_only;
     int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
     BlockDriverState *base_overlay;
+    BlockDriverState *cor_filter_bs = NULL;
     BlockDriverState *above_base;
+    QDict *opts;
 
     assert(!(base && bottom));
     assert(!(backing_file_str && bottom));
@@ -266,30 +251,62 @@ void stream_start(const char *job_id, BlockDriverState *bs,
         }
     }
 
-    if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
-        return;
-    }
-
     /* Make sure that the image is opened in read-write mode */
     bs_read_only = bdrv_is_read_only(bs);
     if (bs_read_only) {
-        if (bdrv_reopen_set_read_only(bs, false, errp) != 0) {
-            bs_read_only = false;
-            goto fail;
+        int ret;
+        /* Hold the chain during reopen */
+        if (bdrv_freeze_backing_chain(bs, above_base, errp) < 0) {
+            return;
+        }
+
+        ret = bdrv_reopen_set_read_only(bs, false, errp);
+
+        /* failure, or cor-filter will hold the chain */
+        bdrv_unfreeze_backing_chain(bs, above_base);
+
+        if (ret < 0) {
+            return;
         }
     }
 
-    /* Prevent concurrent jobs trying to modify the graph structure here, we
-     * already have our own plans. Also don't allow resize as the image size is
-     * queried only at the job start and then cached. */
-    s = block_job_create(job_id, &stream_job_driver, NULL, bs,
-                         basic_flags | BLK_PERM_GRAPH_MOD,
+    opts = qdict_new();
+
+    qdict_put_str(opts, "driver", "copy-on-read");
+    qdict_put_str(opts, "file", bdrv_get_node_name(bs));
+    /* Pass the base_overlay node name as 'bottom' to COR driver */
+    qdict_put_str(opts, "bottom", base_overlay->node_name);
+    if (filter_node_name) {
+        qdict_put_str(opts, "node-name", filter_node_name);
+    }
+
+    cor_filter_bs = bdrv_insert_node(bs, opts, BDRV_O_RDWR, errp);
+    if (!cor_filter_bs) {
+        goto fail;
+    }
+
+    if (!filter_node_name) {
+        cor_filter_bs->implicit = true;
+    }
+
+    s = block_job_create(job_id, &stream_job_driver, NULL, cor_filter_bs,
+                         BLK_PERM_CONSISTENT_READ,
                          basic_flags | BLK_PERM_WRITE,
                          speed, creation_flags, NULL, NULL, errp);
     if (!s) {
         goto fail;
     }
 
+    /*
+     * Prevent concurrent jobs trying to modify the graph structure here, we
+     * already have our own plans. Also don't allow resize as the image size is
+     * queried only at the job start and then cached.
+     */
+    if (block_job_add_bdrv(&s->common, "active node", bs, 0,
+                           basic_flags | BLK_PERM_WRITE, &error_abort)) {
+        goto fail;
+    }
+
     /* Block all intermediate nodes between bs and base, because they will
      * disappear from the chain after this operation. The streaming job reads
      * every block only once, assuming that it doesn't change, so forbid writes
@@ -310,9 +327,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     s->base_overlay = base_overlay;
     s->above_base = above_base;
     s->backing_file_str = g_strdup(backing_file_str);
+    s->cor_filter_bs = cor_filter_bs;
     s->target_bs = bs;
     s->bs_read_only = bs_read_only;
-    s->chain_frozen = true;
 
     s->on_error = on_error;
     trace_stream_start(bs, base, s);
@@ -320,8 +337,10 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     return;
 
 fail:
+    if (cor_filter_bs) {
+        bdrv_cor_filter_drop(cor_filter_bs);
+    }
     if (bs_read_only) {
         bdrv_reopen_set_read_only(bs, true, NULL);
     }
-    bdrv_unfreeze_backing_chain(bs, above_base);
 }
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index f8a692432c..832fe4a1e2 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -279,12 +279,14 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Set a speed limit to make sure that this job blocks the rest
-        result = self.vm.qmp('block-stream', device='node4', job_id='stream-node4', base=self.imgs[1], speed=1024*1024)
+        result = self.vm.qmp('block-stream', device='node4',
+                             job_id='stream-node4', base=self.imgs[1],
+                             filter_node_name='stream-filter', speed=1024*1024)
         self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('block-stream', device='node5', job_id='stream-node5', base=self.imgs[2])
         self.assert_qmp(result, 'error/desc',
-            "Node 'node4' is busy: block device is in use by block job: stream")
+            "Node 'stream-filter' is busy: block device is in use by block job: stream")
 
         result = self.vm.qmp('block-stream', device='node3', job_id='stream-node3', base=self.imgs[2])
         self.assert_qmp(result, 'error/desc',
@@ -297,7 +299,7 @@ class TestParallelOps(iotests.QMPTestCase):
         # block-commit should also fail if it touches nodes used by the stream job
         result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[4], job_id='commit-node4')
         self.assert_qmp(result, 'error/desc',
-            "Node 'node4' is busy: block device is in use by block job: stream")
+            "Node 'stream-filter' is busy: block device is in use by block job: stream")
 
         result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[1], top=self.imgs[3], job_id='commit-node1')
         self.assert_qmp(result, 'error/desc',
diff --git a/tests/qemu-iotests/141.out b/tests/qemu-iotests/141.out
index 6d8652e22b..c4c15fb275 100644
--- a/tests/qemu-iotests/141.out
+++ b/tests/qemu-iotests/141.out
@@ -165,7 +165,7 @@ wrote 1048576/1048576 bytes at offset 0
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
 {'execute': 'blockdev-del',
           'arguments': {'node-name': 'drv0'}}
-{"error": {"class": "GenericError", "desc": "Node drv0 is in use"}}
+{"error": {"class": "GenericError", "desc": "Node 'drv0' is busy: block device is in use by block job: stream"}}
 {'execute': 'block-job-cancel',
           'arguments': {'device': 'job0'}}
 {"return": {}}
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 86f00f290f..cfdeb902be 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -893,20 +893,24 @@ class TestBlockdevReopen(iotests.QMPTestCase):
 
         # hd1 <- hd0
         result = self.vm.qmp('block-stream', conv_keys = True, job_id = 'stream0',
-                             device = 'hd1', auto_finalize = False)
+                             device = 'hd1', filter_node_name='cor',
+                             auto_finalize = False)
         self.assert_qmp(result, 'return', {})
 
-        # We can't reopen with the original options because that would
-        # make hd1 read-only and block-stream requires it to be read-write
-        # (Which error message appears depends on whether the stream job is
-        # already done with copying at this point.)
+        # We can't reopen with the original options because there is a filter
+        # inserted by stream job above hd1.
         self.reopen(opts, {},
-            ["Can't set node 'hd1' to r/o with copy-on-read enabled",
-             "Cannot make block node read-only, there is a writer on it"])
+                    "Cannot change the option 'backing.backing.file.node-name'")
+
+        # We can't reopen hd1 to read-only, as block-stream requires it to be
+        # read-write
+        self.reopen(opts['backing'], {'read-only': True},
+                    "Cannot make block node read-only, there is a writer on it")
 
         # We can't remove hd2 while the stream job is ongoing
         opts['backing']['backing'] = None
-        self.reopen(opts, {'backing.read-only': False}, "Cannot change 'backing' link from 'hd1' to 'hd2'")
+        self.reopen(opts['backing'], {'read-only': False},
+                    "Cannot change 'backing' link from 'hd1' to 'hd2'")
 
         # We can detach hd1 from hd0 because it doesn't affect the stream job
         opts['backing'] = None
-- 
2.29.2


