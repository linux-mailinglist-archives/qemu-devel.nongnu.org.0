Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC67363E19
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 11:00:25 +0200 (CEST)
Received: from localhost ([::1]:43794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYPlY-0006bb-Se
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 05:00:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhh-0001Qp-O3
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYPhf-0001H5-IA
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 04:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618822581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mHxLtTUKf/xVLg6DTW6BHHXfxci386yjrRvLXJnhv9s=;
 b=TZ1cEzS0Bzd/Xanfzkl0EVRSmHBx68DQp3o+18l7/yb9Vx2ixcD+c2g1gZaOAFaqDR9m9e
 FA3ivIewA0QkvxUrZSqFH/fUGXOJ0x4sFbU2FO/bq/J6Nms/MHpAPPrIxFStqXfewImhq3
 KfTRuSbR16cipp6ONDi7YXT1HF2s/xA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-hH51lMPaOV-yvXD3Jv87eQ-1; Mon, 19 Apr 2021 04:56:17 -0400
X-MC-Unique: hH51lMPaOV-yvXD3Jv87eQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEFF16D24A;
 Mon, 19 Apr 2021 08:56:16 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-195.ams2.redhat.com
 [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB9475D741;
 Mon, 19 Apr 2021 08:56:13 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 7/8] block/replication: do not acquire AioContext
Date: Mon, 19 Apr 2021 10:55:40 +0200
Message-Id: <20210419085541.22310-8-eesposit@redhat.com>
In-Reply-To: <20210419085541.22310-1-eesposit@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replication functions are mostly called when the BDS is quiescent and
does not have any pending I/O.  They do not need to synchronize on
anything since BDS and BB are now thread-safe.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/replication.c | 54 ++++++++++-----------------------------------
 1 file changed, 12 insertions(+), 42 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 97be7ef4de..25ee37b21b 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -45,6 +45,8 @@ typedef struct BDRVReplicationState {
     Error *blocker;
     bool orig_hidden_read_only;
     bool orig_secondary_read_only;
+
+    /* This field is accessed asynchronously.  */
     int error;
 } BDRVReplicationState;
 
@@ -210,7 +212,7 @@ static int replication_return_value(BDRVReplicationState *s, int ret)
     }
 
     if (ret < 0) {
-        s->error = ret;
+        qatomic_set(&s->error, ret);
         ret = 0;
     }
 
@@ -307,6 +309,7 @@ out:
     return ret;
 }
 
+/* Called with no I/O pending.  */
 static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
 {
     Error *local_err = NULL;
@@ -420,7 +423,7 @@ static void backup_job_completed(void *opaque, int ret)
 
     if (s->stage != BLOCK_REPLICATION_FAILOVER) {
         /* The backup job is cancelled unexpectedly */
-        s->error = -EIO;
+        qatomic_set(&s->error, -EIO);
     }
 
     backup_job_cleanup(bs);
@@ -445,6 +448,7 @@ static bool check_top_bs(BlockDriverState *top_bs, BlockDriverState *bs)
     return false;
 }
 
+/* Called with no I/O pending.  */
 static void replication_start(ReplicationState *rs, ReplicationMode mode,
                               Error **errp)
 {
@@ -452,12 +456,9 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     BDRVReplicationState *s;
     BlockDriverState *top_bs;
     int64_t active_length, hidden_length, disk_length;
-    AioContext *aio_context;
     Error *local_err = NULL;
     BackupPerf perf = { .use_copy_range = true, .max_workers = 1 };
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
     s = bs->opaque;
 
     if (s->stage == BLOCK_REPLICATION_DONE ||
@@ -467,20 +468,17 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
          * Ignore the request because the secondary side of replication
          * doesn't have to do anything anymore.
          */
-        aio_context_release(aio_context);
         return;
     }
 
     if (s->stage != BLOCK_REPLICATION_NONE) {
         error_setg(errp, "Block replication is running or done");
-        aio_context_release(aio_context);
         return;
     }
 
     if (s->mode != mode) {
         error_setg(errp, "The parameter mode's value is invalid, needs %d,"
                    " but got %d", s->mode, mode);
-        aio_context_release(aio_context);
         return;
     }
 
@@ -492,21 +490,18 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         if (!s->active_disk || !s->active_disk->bs ||
                                     !s->active_disk->bs->backing) {
             error_setg(errp, "Active disk doesn't have backing file");
-            aio_context_release(aio_context);
             return;
         }
 
         s->hidden_disk = s->active_disk->bs->backing;
         if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
             error_setg(errp, "Hidden disk doesn't have backing file");
-            aio_context_release(aio_context);
             return;
         }
 
         s->secondary_disk = s->hidden_disk->bs->backing;
         if (!s->secondary_disk->bs || !bdrv_has_blk(s->secondary_disk->bs)) {
             error_setg(errp, "The secondary disk doesn't have block backend");
-            aio_context_release(aio_context);
             return;
         }
 
@@ -518,7 +513,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             active_length != hidden_length || hidden_length != disk_length) {
             error_setg(errp, "Active disk, hidden disk, secondary disk's length"
                        " are not the same");
-            aio_context_release(aio_context);
             return;
         }
 
@@ -529,7 +523,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             !s->hidden_disk->bs->drv->bdrv_make_empty) {
             error_setg(errp,
                        "Active disk or hidden disk doesn't support make_empty");
-            aio_context_release(aio_context);
             return;
         }
 
@@ -537,7 +530,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         reopen_backing_file(bs, true, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
-            aio_context_release(aio_context);
             return;
         }
 
@@ -550,7 +542,6 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
             !check_top_bs(top_bs, bs)) {
             error_setg(errp, "No top_bs or it is invalid");
             reopen_backing_file(bs, false, NULL);
-            aio_context_release(aio_context);
             return;
         }
         bdrv_op_block_all(top_bs, s->blocker);
@@ -566,13 +557,11 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         if (local_err) {
             error_propagate(errp, local_err);
             backup_job_cleanup(bs);
-            aio_context_release(aio_context);
             return;
         }
         job_start(&s->backup_job->job);
         break;
     default:
-        aio_context_release(aio_context);
         abort();
     }
 
@@ -582,18 +571,15 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         secondary_do_checkpoint(s, errp);
     }
 
-    s->error = 0;
-    aio_context_release(aio_context);
+    qatomic_set(&s->error, 0);
 }
 
+/* Called with no I/O pending.  */
 static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
 {
     BlockDriverState *bs = rs->opaque;
     BDRVReplicationState *s;
-    AioContext *aio_context;
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
     s = bs->opaque;
 
     if (s->stage == BLOCK_REPLICATION_DONE ||
@@ -603,38 +589,30 @@ static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
          * Ignore the request because the secondary side of replication
          * doesn't have to do anything anymore.
          */
-        aio_context_release(aio_context);
         return;
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
         secondary_do_checkpoint(s, errp);
     }
-    aio_context_release(aio_context);
 }
 
 static void replication_get_error(ReplicationState *rs, Error **errp)
 {
     BlockDriverState *bs = rs->opaque;
     BDRVReplicationState *s;
-    AioContext *aio_context;
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
     s = bs->opaque;
 
     if (s->stage == BLOCK_REPLICATION_NONE) {
         error_setg(errp, "Block replication is not running");
-        aio_context_release(aio_context);
         return;
     }
 
-    if (s->error) {
+    if (qatomic_read(&s->error)) {
         error_setg(errp, "I/O error occurred");
-        aio_context_release(aio_context);
         return;
     }
-    aio_context_release(aio_context);
 }
 
 static void replication_done(void *opaque, int ret)
@@ -648,10 +626,10 @@ static void replication_done(void *opaque, int ret)
         s->active_disk = NULL;
         s->secondary_disk = NULL;
         s->hidden_disk = NULL;
-        s->error = 0;
+        qatomic_set(&s->error, 0);
     } else {
         s->stage = BLOCK_REPLICATION_FAILOVER_FAILED;
-        s->error = -EIO;
+        qatomic_set(&s->error, -EIO);
     }
 }
 
@@ -659,10 +637,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
 {
     BlockDriverState *bs = rs->opaque;
     BDRVReplicationState *s;
-    AioContext *aio_context;
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
     s = bs->opaque;
 
     if (s->stage == BLOCK_REPLICATION_DONE ||
@@ -672,20 +647,18 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
          * Ignore the request because the secondary side of replication
          * doesn't have to do anything anymore.
          */
-        aio_context_release(aio_context);
         return;
     }
 
     if (s->stage != BLOCK_REPLICATION_RUNNING) {
         error_setg(errp, "Block replication is not running");
-        aio_context_release(aio_context);
         return;
     }
 
     switch (s->mode) {
     case REPLICATION_MODE_PRIMARY:
         s->stage = BLOCK_REPLICATION_DONE;
-        s->error = 0;
+        qatomic_set(&s->error, 0);
         break;
     case REPLICATION_MODE_SECONDARY:
         /*
@@ -700,7 +673,6 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
         if (!failover) {
             secondary_do_checkpoint(s, errp);
             s->stage = BLOCK_REPLICATION_DONE;
-            aio_context_release(aio_context);
             return;
         }
 
@@ -711,10 +683,8 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
                             NULL, replication_done, bs, true, errp);
         break;
     default:
-        aio_context_release(aio_context);
         abort();
     }
-    aio_context_release(aio_context);
 }
 
 static const char *const replication_strong_runtime_opts[] = {
-- 
2.30.2


