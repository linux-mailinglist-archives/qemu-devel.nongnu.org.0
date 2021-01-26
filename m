Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00528304111
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:56:55 +0100 (CET)
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pm2-0007xn-1T
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PE1-0000pi-Gg
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDy-0006QL-FK
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ElLztQpbxTEfhhSwap7t23PQrIJu9dz8qhHOo37ClU=;
 b=fJcRmQl/7fulF9aDKVhmaCd8AM0VSt/zPXKJx8cgv55tnyu4TQ2yvctE6Aw1/R9G+rZvXF
 GtK0na4sX4or9zPZ2DF+97mXDQ3UCIaHghyfmU8HsMnKrDCBQ5QFyWt9s3qy4QjN/IH2xO
 YsuwC5EZUWdXnU3SgIbeK9yrgK59lJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-yUn4w3LqNg6PYi-OuFg7yg-1; Tue, 26 Jan 2021 09:21:39 -0500
X-MC-Unique: yUn4w3LqNg6PYi-OuFg7yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50E69107ACE6;
 Tue, 26 Jan 2021 14:21:38 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5EBD5D739;
 Tue, 26 Jan 2021 14:21:37 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 35/53] qapi: backup: add max-chunk and max-workers to x-perf
 struct
Date: Tue, 26 Jan 2021 15:19:58 +0100
Message-Id: <20210126142016.806073-36-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add new parameters to configure future backup features. The patch
doesn't introduce aio backup requests (so we actually have only one
worker) neither requests larger than one cluster. Still, formally we
satisfy these maximums anyway, so add the parameters now, to facilitate
further patch which will really change backup job behavior.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-11-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 13 ++++++++++++-
 block/backup.c       | 28 +++++++++++++++++++++++-----
 block/replication.c  |  2 +-
 blockdev.c           |  8 +++++++-
 4 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 83f661d7f6..abcd41ed63 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1379,10 +1379,21 @@
 #
 # @use-copy-range: Use copy offloading. Default true.
 #
+# @max-workers: Maximum number of parallel requests for the sustained background
+#               copying process. Doesn't influence copy-before-write operations.
+#               Default 64.
+#
+# @max-chunk: Maximum request length for the sustained background copying
+#             process. Doesn't influence copy-before-write operations.
+#             0 means unlimited. If max-chunk is non-zero then it should not be
+#             less than job cluster size which is calculated as maximum of
+#             target image cluster size and 64k. Default 0.
+#
 # Since: 6.0
 ##
 { 'struct': 'BackupPerf',
-  'data': { '*use-copy-range': 'bool' }}
+  'data': { '*use-copy-range': 'bool',
+            '*max-workers': 'int', '*max-chunk': 'int64' } }
 
 ##
 # @BackupCommon:
diff --git a/block/backup.c b/block/backup.c
index 09ff5a92ef..5522c0f3fe 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -388,6 +388,29 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         return NULL;
     }
 
+    cluster_size = backup_calculate_cluster_size(target, errp);
+    if (cluster_size < 0) {
+        goto error;
+    }
+
+    if (perf->max_workers < 1) {
+        error_setg(errp, "max-workers must be greater than zero");
+        return NULL;
+    }
+
+    if (perf->max_chunk < 0) {
+        error_setg(errp, "max-chunk must be zero (which means no limit) or "
+                   "positive");
+        return NULL;
+    }
+
+    if (perf->max_chunk && perf->max_chunk < cluster_size) {
+        error_setg(errp, "Required max-chunk (%" PRIi64 ") is less than backup "
+                   "cluster size (%" PRIi64 ")", perf->max_chunk, cluster_size);
+        return NULL;
+    }
+
+
     if (sync_bitmap) {
         /* If we need to write to this bitmap, check that we can: */
         if (bitmap_mode != BITMAP_SYNC_MODE_NEVER &&
@@ -420,11 +443,6 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cluster_size = backup_calculate_cluster_size(target, errp);
-    if (cluster_size < 0) {
-        goto error;
-    }
-
     /*
      * If source is in backing chain of target assume that target is going to be
      * used for "image fleecing", i.e. it should represent a kind of snapshot of
diff --git a/block/replication.c b/block/replication.c
index 22ffc811ee..97be7ef4de 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -454,7 +454,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err = NULL;
-    BackupPerf perf = { .use_copy_range = true };
+    BackupPerf perf = { .use_copy_range = true, .max_workers = 1 };
 
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
diff --git a/blockdev.c b/blockdev.c
index fc88dc03e1..25aaacf253 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2829,7 +2829,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
 {
     BlockJob *job = NULL;
     BdrvDirtyBitmap *bmap = NULL;
-    BackupPerf perf = { .use_copy_range = true };
+    BackupPerf perf = { .use_copy_range = true, .max_workers = 64 };
     int job_flags = JOB_DEFAULT;
 
     if (!backup->has_speed) {
@@ -2858,6 +2858,12 @@ static BlockJob *do_backup_common(BackupCommon *backup,
         if (backup->x_perf->has_use_copy_range) {
             perf.use_copy_range = backup->x_perf->use_copy_range;
         }
+        if (backup->x_perf->has_max_workers) {
+            perf.max_workers = backup->x_perf->max_workers;
+        }
+        if (backup->x_perf->has_max_chunk) {
+            perf.max_chunk = backup->x_perf->max_chunk;
+        }
     }
 
     if ((backup->sync == MIRROR_SYNC_MODE_BITMAP) ||
-- 
2.29.2


