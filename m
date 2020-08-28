Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A86255F45
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 18:58:13 +0200 (CEST)
Received: from localhost ([::1]:51852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBhhc-0000UB-7x
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 12:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kBhfj-0006nv-J4; Fri, 28 Aug 2020 12:56:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:38324 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kBhfg-0001im-K2; Fri, 28 Aug 2020 12:56:15 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kBhfC-001XPR-Er; Fri, 28 Aug 2020 19:55:42 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 armbru@redhat.com, jsnow@redhat.com, eblake@redhat.com, den@openvz.org,
 vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com
Subject: [PATCH v8 7/7] block: apply COR-filter to block-stream jobs
Date: Fri, 28 Aug 2020 19:52:59 +0300
Message-Id: <1598633579-221780-8-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598633579-221780-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1598633579-221780-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 12:53:26
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

This patch completes the series with the COR-filter insertion for
block-stream operations. Adding the filter makes it possible for copied
regions to be discarded in backing files during the block-stream job,
what will reduce the disk overuse.
The COR-filter insertion incurs changes in the iotests case
245:test_block_stream_4 that reopens the backing chain during a
block-stream job. There are changes in the iotests #030 as well.
The iotests case 030:test_stream_parallel was deleted due to multiple
conflicts between the concurrent job operations over the same backing
chain. The base backing node for one job is the top node for another
job. It may change due to the filter node inserted into the backing
chain while both jobs are running. Another issue is that the parts of
the backing chain are being frozen by the running job and may not be
changed by the concurrent job when needed. The concept of the parallel
jobs with common nodes is considered vital no more.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/stream.c             | 78 +++++++++++++++++++++++++++-------------------
 tests/qemu-iotests/030     | 50 +++--------------------------
 tests/qemu-iotests/030.out |  4 +--
 tests/qemu-iotests/245     | 19 ++++++++---
 4 files changed, 67 insertions(+), 84 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index fee4117..ab8ba39 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -19,6 +19,7 @@
 #include "qapi/qmp/qerror.h"
 #include "qemu/ratelimit.h"
 #include "sysemu/block-backend.h"
+#include "block/copy-on-read.h"
 
 enum {
     /*
@@ -33,6 +34,8 @@ typedef struct StreamBlockJob {
     BlockJob common;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *base;   /* The base node */
+    BlockDriverState *cor_filter_bs;
+    BlockDriverState *target_bs;
     BlockdevOnError on_error;
     char *backing_file_str;
     bool bs_read_only;
@@ -53,22 +56,19 @@ static void stream_abort(Job *job)
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
 
     if (s->chain_frozen) {
-        BlockJob *bjob = &s->common;
-        bdrv_unfreeze_backing_chain(blk_bs(bjob->blk), s->base);
+        bdrv_unfreeze_backing_chain(s->cor_filter_bs, s->base);
     }
 }
 
 static int stream_prepare(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-    BlockJob *bjob = &s->common;
-    BlockDriverState *bs = blk_bs(bjob->blk);
-    BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
+    BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     BlockDriverState *base = s->base;
     Error *local_err = NULL;
     int ret = 0;
 
-    bdrv_unfreeze_backing_chain(bs, s->base);
+    bdrv_unfreeze_backing_chain(s->cor_filter_bs, s->base);
     s->chain_frozen = false;
 
     if (bdrv_cow_child(unfiltered_bs)) {
@@ -94,13 +94,14 @@ static void stream_clean(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockJob *bjob = &s->common;
-    BlockDriverState *bs = blk_bs(bjob->blk);
+
+    bdrv_cor_filter_drop(s->cor_filter_bs);
 
     /* Reopen the image back in read-only mode if necessary */
     if (s->bs_read_only) {
         /* Give up write permissions before making it read-only */
         blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
-        bdrv_reopen_set_read_only(bs, true, NULL);
+        bdrv_reopen_set_read_only(s->target_bs, true, NULL);
     }
 
     g_free(s->backing_file_str);
@@ -110,9 +111,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockBackend *blk = s->common.blk;
-    BlockDriverState *bs = blk_bs(blk);
-    BlockDriverState *unfiltered_bs = bdrv_skip_filters(bs);
-    bool enable_cor = !bdrv_cow_child(s->base_overlay);
+    BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     int64_t len;
     int64_t offset = 0;
     uint64_t delay_ns = 0;
@@ -124,21 +123,12 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         return 0;
     }
 
-    len = bdrv_getlength(bs);
+    len = bdrv_getlength(s->target_bs);
     if (len < 0) {
         return len;
     }
     job_progress_set_remaining(&s->common.job, len);
 
-    /* Turn on copy-on-read for the whole block device so that guest read
-     * requests help us make progress.  Only do this when copying the entire
-     * backing chain since the copy-on-read operation does not take base into
-     * account.
-     */
-    if (enable_cor) {
-        bdrv_enable_copy_on_read(bs);
-    }
-
     for ( ; offset < len; offset += n) {
         bool copy;
         int ret;
@@ -197,10 +187,6 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         }
     }
 
-    if (enable_cor) {
-        bdrv_disable_copy_on_read(bs);
-    }
-
     /* Do not remove the backing file if an error was there but ignored. */
     return error;
 }
@@ -230,6 +216,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     bool bs_read_only;
     int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
     BlockDriverState *base_overlay = bdrv_find_overlay(bs, base);
+    BlockDriverState *cor_filter_bs = NULL;
 
     if (!base_overlay) {
         error_setg(errp, "'%s' is not in the backing chain of '%s'",
@@ -250,17 +237,37 @@ void stream_start(const char *job_id, BlockDriverState *bs,
         }
     }
 
-    /* Prevent concurrent jobs trying to modify the graph structure here, we
-     * already have our own plans. Also don't allow resize as the image size is
-     * queried only at the job start and then cached. */
-    s = block_job_create(job_id, &stream_job_driver, NULL, bs,
-                         basic_flags | BLK_PERM_GRAPH_MOD,
-                         basic_flags | BLK_PERM_WRITE,
+    cor_filter_bs = bdrv_cor_filter_append(bs, backing_file_str,
+                                           filter_node_name, errp);
+    if (cor_filter_bs == NULL) {
+        goto fail;
+    }
+
+    if (bdrv_freeze_backing_chain(cor_filter_bs, bs, errp) < 0) {
+        bdrv_cor_filter_drop(cor_filter_bs);
+        cor_filter_bs = NULL;
+        goto fail;
+    }
+
+    s = block_job_create(job_id, &stream_job_driver, NULL, cor_filter_bs,
+                         BLK_PERM_CONSISTENT_READ,
+                         basic_flags | BLK_PERM_WRITE | BLK_PERM_GRAPH_MOD,
                          speed, creation_flags, NULL, NULL, errp);
     if (!s) {
         goto fail;
     }
 
+    /*
+     * Prevent concurrent jobs trying to modify the graph structure here, we
+     * already have our own plans. Also don't allow resize as the image size is
+     * queried only at the job start and then cached.
+     */
+    if (block_job_add_bdrv(&s->common, "active node", bs,
+                           basic_flags | BLK_PERM_GRAPH_MOD,
+                           basic_flags | BLK_PERM_WRITE, &error_abort)) {
+        goto fail;
+    }
+
     /* Block all intermediate nodes between bs and base, because they will
      * disappear from the chain after this operation. The streaming job reads
      * every block only once, assuming that it doesn't change, so forbid writes
@@ -279,6 +286,8 @@ void stream_start(const char *job_id, BlockDriverState *bs,
 
     s->base_overlay = base_overlay;
     s->base = base;
+    s->cor_filter_bs = cor_filter_bs;
+    s->target_bs = bs;
     s->backing_file_str = g_strdup(backing_file_str);
     s->bs_read_only = bs_read_only;
     s->chain_frozen = true;
@@ -292,5 +301,10 @@ fail:
     if (bs_read_only) {
         bdrv_reopen_set_read_only(bs, true, NULL);
     }
-    bdrv_unfreeze_backing_chain(bs, base);
+    if (cor_filter_bs) {
+        bdrv_unfreeze_backing_chain(cor_filter_bs, base);
+        bdrv_cor_filter_drop(cor_filter_bs);
+    } else {
+        bdrv_unfreeze_backing_chain(bs, base);
+    }
 }
diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index c565e76..d651779 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -221,60 +221,20 @@ class TestParallelOps(iotests.QMPTestCase):
         for img in self.imgs:
             os.remove(img)
 
-    # Test that it's possible to run several block-stream operations
-    # in parallel in the same snapshot chain
-    def test_stream_parallel(self):
-        self.assert_no_active_block_jobs()
-
-        # Check that the maps don't match before the streaming operations
-        for i in range(2, self.num_imgs, 2):
-            self.assertNotEqual(qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i]),
-                                qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', self.imgs[i-1]),
-                                'image file map matches backing file before streaming')
-
-        # Create all streaming jobs
-        pending_jobs = []
-        for i in range(2, self.num_imgs, 2):
-            node_name = 'node%d' % i
-            job_id = 'stream-%s' % node_name
-            pending_jobs.append(job_id)
-            result = self.vm.qmp('block-stream', device=node_name, job_id=job_id, base=self.imgs[i-2], speed=512*1024)
-            self.assert_qmp(result, 'return', {})
-
-        for job in pending_jobs:
-            result = self.vm.qmp('block-job-set-speed', device=job, speed=0)
-            self.assert_qmp(result, 'return', {})
-
-        # Wait for all jobs to be finished.
-        while len(pending_jobs) > 0:
-            for event in self.vm.get_qmp_events(wait=True):
-                if event['event'] == 'BLOCK_JOB_COMPLETED':
-                    job_id = self.dictpath(event, 'data/device')
-                    self.assertTrue(job_id in pending_jobs)
-                    self.assert_qmp_absent(event, 'data/error')
-                    pending_jobs.remove(job_id)
-
-        self.assert_no_active_block_jobs()
-        self.vm.shutdown()
-
-        # Check that all maps match now
-        for i in range(2, self.num_imgs, 2):
-            self.assertEqual(qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i]),
-                             qemu_io('-f', iotests.imgfmt, '-c', 'map', self.imgs[i-1]),
-                             'image file map does not match backing file after streaming')
-
     # Test that it's not possible to perform two block-stream
     # operations if there are nodes involved in both.
     def test_overlapping_1(self):
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
@@ -287,7 +247,7 @@ class TestParallelOps(iotests.QMPTestCase):
         # block-commit should also fail if it touches nodes used by the stream job
         result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[4], job_id='commit-node4')
         self.assert_qmp(result, 'error/desc',
-            "Node 'node4' is busy: block device is in use by block job: stream")
+            "Node 'stream-filter' is busy: block device is in use by block job: stream")
 
         result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[1], top=self.imgs[3], job_id='commit-node1')
         self.assert_qmp(result, 'error/desc',
diff --git a/tests/qemu-iotests/030.out b/tests/qemu-iotests/030.out
index 6d9bee1..5eb508d 100644
--- a/tests/qemu-iotests/030.out
+++ b/tests/qemu-iotests/030.out
@@ -1,5 +1,5 @@
-...........................
+..........................
 ----------------------------------------------------------------------
-Ran 27 tests
+Ran 26 tests
 
 OK
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index b9399ef..c756cfe 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -898,17 +898,26 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # make hd1 read-only and block-stream requires it to be read-write
         # (Which error message appears depends on whether the stream job is
         # already done with copying at this point.)
-        self.reopen(opts, {},
+        # As the COR-filter node is inserted into the backing chain with the
+        # 'block-stream' operation, we move the options to their proper nodes.
+        opts = hd_opts(1)
+        opts['backing'] = hd_opts(2)
+        opts['backing']['backing'] = None
+        self.reopen(opts, {'read-only': True},
             ["Can't set node 'hd1' to r/o with copy-on-read enabled",
              "Cannot make block node read-only, there is a writer on it"])
 
         # We can't remove hd2 while the stream job is ongoing
-        opts['backing']['backing'] = None
-        self.reopen(opts, {'backing.read-only': False}, "Cannot change 'backing' link from 'hd1' to 'hd2'")
+        opts['backing'] = None
+        self.reopen(opts, {'read-only': False},
+                    "Cannot change 'backing' link from 'hd1' to 'hd2'")
 
-        # We can detach hd1 from hd0 because it doesn't affect the stream job
+        # We can't detach hd1 from hd0 because there is the COR-filter implicit
+        # node in between.
+        opts = hd_opts(0)
         opts['backing'] = None
-        self.reopen(opts)
+        self.reopen(opts, {},
+                    "Cannot change backing link if 'hd0' has an implicit backing file")
 
         self.vm.run_job('stream0', auto_finalize = False, auto_dismiss = True)
 
-- 
1.8.3.1


