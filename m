Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33013040DF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:51:04 +0100 (CET)
Received: from localhost ([::1]:52606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PgN-0007uQ-Vv
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDo-0000Wl-De
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDe-0006EO-8F
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsVBjH5LUHGbcpMipBGatX9YmfC6/dvdEHBPtqIXHSc=;
 b=B0gNIbHXrKi+xSEeRE8fJtH7gAWBqrdArNAiA8D4nD5H1uiP9g7RhbdF3ESQonYZ0/dhjb
 IUZULYEcGDeR/Mpnx7AbOOW5ve0c8+Yz80n5jHHOH+lxjcIfHkqFM8CUe38Zkn3iTFeQFk
 qle+5Dl5QsdVY2ZihptTxptqeiF50UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-KNw-pDqTNv2ScwZre6td1g-1; Tue, 26 Jan 2021 09:21:19 -0500
X-MC-Unique: KNw-pDqTNv2ScwZre6td1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B30F107ACE3;
 Tue, 26 Jan 2021 14:21:18 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C0CD19D6C;
 Tue, 26 Jan 2021 14:21:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 26/53] qapi: backup: add perf.use-copy-range parameter
Date: Tue, 26 Jan 2021 15:19:49 +0100
Message-Id: <20210126142016.806073-27-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Experiments show, that copy_range is not always making things faster.
So, to make experimentation simpler, let's add a parameter. Some more
perf parameters will be added soon, so here is a new struct.

For now, add new backup qmp parameter with x- prefix for the following
reasons:

 - We are going to add more performance parameters, some will be
   related to the whole block-copy process, some only to background
   copying in backup (ignored for copy-before-write operations).
 - On the other hand, we are going to use block-copy interface in other
   block jobs, which will need performance options as well.. And it
   should be the same structure or at least somehow related.

So, there are too much unclean things about how the interface and now
we need the new options mostly for testing. Let's keep them
experimental for a while.

In do_backup_common() new x-perf parameter handled in a way to
make further options addition simpler.

We add use-copy-range with default=true, and we'll change the default
in further patch, after moving backup to use block-copy.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-2-vsementsov@virtuozzo.com>
[mreitz: s/5\.2/6.0/]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json       | 17 ++++++++++++++++-
 block/backup-top.h         |  1 +
 include/block/block-copy.h |  2 +-
 include/block/block_int.h  |  3 +++
 block/backup-top.c         |  4 +++-
 block/backup.c             |  6 +++++-
 block/block-copy.c         |  4 ++--
 block/replication.c        |  2 ++
 blockdev.c                 |  8 ++++++++
 9 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1d9dcd7d30..83f661d7f6 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1371,6 +1371,19 @@
 { 'struct': 'BlockdevSnapshot',
   'data': { 'node': 'str', 'overlay': 'str' } }
 
+##
+# @BackupPerf:
+#
+# Optional parameters for backup. These parameters don't affect
+# functionality, but may significantly affect performance.
+#
+# @use-copy-range: Use copy offloading. Default true.
+#
+# Since: 6.0
+##
+{ 'struct': 'BackupPerf',
+  'data': { '*use-copy-range': 'bool' }}
+
 ##
 # @BackupCommon:
 #
@@ -1426,6 +1439,8 @@
 #                    above node specified by @drive. If this option is not given,
 #                    a node name is autogenerated. (Since: 4.2)
 #
+# @x-perf: Performance options. (Since 6.0)
+#
 # Note: @on-source-error and @on-target-error only affect background
 #       I/O.  If an error occurs during a guest write request, the device's
 #       rerror/werror actions will be used.
@@ -1440,7 +1455,7 @@
             '*on-source-error': 'BlockdevOnError',
             '*on-target-error': 'BlockdevOnError',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
-            '*filter-node-name': 'str' } }
+            '*filter-node-name': 'str', '*x-perf': 'BackupPerf'  } }
 
 ##
 # @DriveBackup:
diff --git a/block/backup-top.h b/block/backup-top.h
index e5cabfa197..b28b0031c4 100644
--- a/block/backup-top.h
+++ b/block/backup-top.h
@@ -33,6 +33,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
                                          BlockDriverState *target,
                                          const char *filter_node_name,
                                          uint64_t cluster_size,
+                                         BackupPerf *perf,
                                          BdrvRequestFlags write_flags,
                                          BlockCopyState **bcs,
                                          Error **errp);
diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index aac85e1488..6397505f30 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -22,7 +22,7 @@ typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
 typedef struct BlockCopyState BlockCopyState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size,
+                                     int64_t cluster_size, bool use_copy_range,
                                      BdrvRequestFlags write_flags,
                                      Error **errp);
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index f4b844f310..d01fc23720 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1266,6 +1266,8 @@ void mirror_start(const char *job_id, BlockDriverState *bs,
  * @sync_mode: What parts of the disk image should be copied to the destination.
  * @sync_bitmap: The dirty bitmap if sync_mode is 'bitmap' or 'incremental'
  * @bitmap_mode: The bitmap synchronization policy to use.
+ * @perf: Performance options. All actual fields assumed to be present,
+ *        all ".has_*" fields are ignored.
  * @on_source_error: The action to take upon error reading from the source.
  * @on_target_error: The action to take upon error writing to the target.
  * @creation_flags: Flags that control the behavior of the Job lifetime.
@@ -1284,6 +1286,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                             BitmapSyncMode bitmap_mode,
                             bool compress,
                             const char *filter_node_name,
+                            BackupPerf *perf,
                             BlockdevOnError on_source_error,
                             BlockdevOnError on_target_error,
                             int creation_flags,
diff --git a/block/backup-top.c b/block/backup-top.c
index fe6883cc97..789acf6965 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -186,6 +186,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
                                          BlockDriverState *target,
                                          const char *filter_node_name,
                                          uint64_t cluster_size,
+                                         BackupPerf *perf,
                                          BdrvRequestFlags write_flags,
                                          BlockCopyState **bcs,
                                          Error **errp)
@@ -244,7 +245,8 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
 
     state->cluster_size = cluster_size;
     state->bcs = block_copy_state_new(top->backing, state->target,
-                                      cluster_size, write_flags, &local_err);
+                                      cluster_size, perf->use_copy_range,
+                                      write_flags, &local_err);
     if (local_err) {
         error_prepend(&local_err, "Cannot create block-copy-state: ");
         goto fail;
diff --git a/block/backup.c b/block/backup.c
index 9afa0bf3b4..4b07e9115d 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -46,6 +46,7 @@ typedef struct BackupBlockJob {
     uint64_t len;
     uint64_t bytes_read;
     int64_t cluster_size;
+    BackupPerf perf;
 
     BlockCopyState *bcs;
 } BackupBlockJob;
@@ -335,6 +336,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   BitmapSyncMode bitmap_mode,
                   bool compress,
                   const char *filter_node_name,
+                  BackupPerf *perf,
                   BlockdevOnError on_source_error,
                   BlockdevOnError on_target_error,
                   int creation_flags,
@@ -441,7 +443,8 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
                   (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
 
     backup_top = bdrv_backup_top_append(bs, target, filter_node_name,
-                                        cluster_size, write_flags, &bcs, errp);
+                                        cluster_size, perf,
+                                        write_flags, &bcs, errp);
     if (!backup_top) {
         goto error;
     }
@@ -464,6 +467,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
     job->bcs = bcs;
     job->cluster_size = cluster_size;
     job->len = len;
+    job->perf = *perf;
 
     block_copy_set_progress_callback(bcs, backup_progress_bytes_callback, job);
     block_copy_set_progress_meter(bcs, &job->common.job.progress);
diff --git a/block/block-copy.c b/block/block-copy.c
index cd9bc47c8f..63398a171c 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -218,7 +218,7 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size,
+                                     int64_t cluster_size, bool use_copy_range,
                                      BdrvRequestFlags write_flags, Error **errp)
 {
     BlockCopyState *s;
@@ -260,7 +260,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
          * We enable copy-range, but keep small copy_size, until first
          * successful copy_range (look at block_copy_do_copy).
          */
-        s->use_copy_range = true;
+        s->use_copy_range = use_copy_range;
         s->copy_size = MAX(s->cluster_size, BLOCK_COPY_MAX_BUFFER);
     }
 
diff --git a/block/replication.c b/block/replication.c
index 0c70215784..22ffc811ee 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -454,6 +454,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err = NULL;
+    BackupPerf perf = { .use_copy_range = true };
 
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
@@ -558,6 +559,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         s->backup_job = backup_job_create(
                                 NULL, s->secondary_disk->bs, s->hidden_disk->bs,
                                 0, MIRROR_SYNC_MODE_NONE, NULL, 0, false, NULL,
+                                &perf,
                                 BLOCKDEV_ON_ERROR_REPORT,
                                 BLOCKDEV_ON_ERROR_REPORT, JOB_INTERNAL,
                                 backup_job_completed, bs, NULL, &local_err);
diff --git a/blockdev.c b/blockdev.c
index 0540c621da..fc88dc03e1 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2829,6 +2829,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
 {
     BlockJob *job = NULL;
     BdrvDirtyBitmap *bmap = NULL;
+    BackupPerf perf = { .use_copy_range = true };
     int job_flags = JOB_DEFAULT;
 
     if (!backup->has_speed) {
@@ -2853,6 +2854,12 @@ static BlockJob *do_backup_common(BackupCommon *backup,
         backup->compress = false;
     }
 
+    if (backup->x_perf) {
+        if (backup->x_perf->has_use_copy_range) {
+            perf.use_copy_range = backup->x_perf->use_copy_range;
+        }
+    }
+
     if ((backup->sync == MIRROR_SYNC_MODE_BITMAP) ||
         (backup->sync == MIRROR_SYNC_MODE_INCREMENTAL)) {
         /* done before desugaring 'incremental' to print the right message */
@@ -2926,6 +2933,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
                             backup->sync, bmap, backup->bitmap_mode,
                             backup->compress,
                             backup->filter_node_name,
+                            &perf,
                             backup->on_source_error,
                             backup->on_target_error,
                             job_flags, NULL, NULL, txn, errp);
-- 
2.29.2


