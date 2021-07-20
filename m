Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301953CFD4A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:19:20 +0200 (CEST)
Received: from localhost ([::1]:38348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rWh-0000dh-73
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPL-0003ml-GS
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rPG-0001C5-UK
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onWHOnpKiv1wZHf0EsIzrMrdyOB2CRrfvHX6s0N4tQc=;
 b=gBZFm+xzaiyeMbxlKzDKywDL4tQLcxuXHGeByLbvj85sXg77hupHy3esIUtDbpg0guK0Wb
 2Oq0dOC5J6so9sOX4I1HGTOu/yVyt63Uph1wZgVYKWhQCOjiMF2TDK9qLTR6OEuulFOJGe
 Y14r4f4ovvBj/akdblxyiFOlpP9k6hE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-we0m1wtCOP6A5_S3xCzyFw-1; Tue, 20 Jul 2021 11:11:34 -0400
X-MC-Unique: we0m1wtCOP6A5_S3xCzyFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D4655C73C;
 Tue, 20 Jul 2021 15:11:08 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4426384639;
 Tue, 20 Jul 2021 15:11:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/11] replication: Remove s->active_disk
Date: Tue, 20 Jul 2021 17:10:47 +0200
Message-Id: <20210720151053.226144-6-kwolf@redhat.com>
In-Reply-To: <20210720151053.226144-1-kwolf@redhat.com>
References: <20210720151053.226144-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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

From: Lukas Straub <lukasstraub2@web.de>

s->active_disk is bs->file. Remove it and use local variables instead.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <2534f867ea9be5b666dfce19744b7d4e2b96c976.1626619393.git.lukasstraub2@web.de>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/replication.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/block/replication.c b/block/replication.c
index 774e15df16..9ad2dfdc69 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -35,7 +35,6 @@ typedef enum {
 typedef struct BDRVReplicationState {
     ReplicationMode mode;
     ReplicationStage stage;
-    BdrvChild *active_disk;
     BlockJob *commit_job;
     BdrvChild *hidden_disk;
     BdrvChild *secondary_disk;
@@ -307,8 +306,10 @@ out:
     return ret;
 }
 
-static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
+static void secondary_do_checkpoint(BlockDriverState *bs, Error **errp)
 {
+    BDRVReplicationState *s = bs->opaque;
+    BdrvChild *active_disk = bs->file;
     Error *local_err = NULL;
     int ret;
 
@@ -323,13 +324,13 @@ static void secondary_do_checkpoint(BDRVReplicationState *s, Error **errp)
         return;
     }
 
-    if (!s->active_disk->bs->drv) {
+    if (!active_disk->bs->drv) {
         error_setg(errp, "Active disk %s is ejected",
-                   s->active_disk->bs->node_name);
+                   active_disk->bs->node_name);
         return;
     }
 
-    ret = bdrv_make_empty(s->active_disk, errp);
+    ret = bdrv_make_empty(active_disk, errp);
     if (ret < 0) {
         return;
     }
@@ -458,6 +459,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     BlockDriverState *bs = rs->opaque;
     BDRVReplicationState *s;
     BlockDriverState *top_bs;
+    BdrvChild *active_disk;
     int64_t active_length, hidden_length, disk_length;
     AioContext *aio_context;
     Error *local_err = NULL;
@@ -495,15 +497,14 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     case REPLICATION_MODE_PRIMARY:
         break;
     case REPLICATION_MODE_SECONDARY:
-        s->active_disk = bs->file;
-        if (!s->active_disk || !s->active_disk->bs ||
-                                    !s->active_disk->bs->backing) {
+        active_disk = bs->file;
+        if (!active_disk || !active_disk->bs || !active_disk->bs->backing) {
             error_setg(errp, "Active disk doesn't have backing file");
             aio_context_release(aio_context);
             return;
         }
 
-        s->hidden_disk = s->active_disk->bs->backing;
+        s->hidden_disk = active_disk->bs->backing;
         if (!s->hidden_disk->bs || !s->hidden_disk->bs->backing) {
             error_setg(errp, "Hidden disk doesn't have backing file");
             aio_context_release(aio_context);
@@ -518,7 +519,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         }
 
         /* verify the length */
-        active_length = bdrv_getlength(s->active_disk->bs);
+        active_length = bdrv_getlength(active_disk->bs);
         hidden_length = bdrv_getlength(s->hidden_disk->bs);
         disk_length = bdrv_getlength(s->secondary_disk->bs);
         if (active_length < 0 || hidden_length < 0 || disk_length < 0 ||
@@ -530,9 +531,9 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
         }
 
         /* Must be true, or the bdrv_getlength() calls would have failed */
-        assert(s->active_disk->bs->drv && s->hidden_disk->bs->drv);
+        assert(active_disk->bs->drv && s->hidden_disk->bs->drv);
 
-        if (!s->active_disk->bs->drv->bdrv_make_empty ||
+        if (!active_disk->bs->drv->bdrv_make_empty ||
             !s->hidden_disk->bs->drv->bdrv_make_empty) {
             error_setg(errp,
                        "Active disk or hidden disk doesn't support make_empty");
@@ -586,7 +587,7 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
     s->stage = BLOCK_REPLICATION_RUNNING;
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
-        secondary_do_checkpoint(s, errp);
+        secondary_do_checkpoint(bs, errp);
     }
 
     s->error = 0;
@@ -615,7 +616,7 @@ static void replication_do_checkpoint(ReplicationState *rs, Error **errp)
     }
 
     if (s->mode == REPLICATION_MODE_SECONDARY) {
-        secondary_do_checkpoint(s, errp);
+        secondary_do_checkpoint(bs, errp);
     }
     aio_context_release(aio_context);
 }
@@ -652,7 +653,6 @@ static void replication_done(void *opaque, int ret)
     if (ret == 0) {
         s->stage = BLOCK_REPLICATION_DONE;
 
-        s->active_disk = NULL;
         s->secondary_disk = NULL;
         s->hidden_disk = NULL;
         s->error = 0;
@@ -705,7 +705,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
         }
 
         if (!failover) {
-            secondary_do_checkpoint(s, errp);
+            secondary_do_checkpoint(bs, errp);
             s->stage = BLOCK_REPLICATION_DONE;
             aio_context_release(aio_context);
             return;
@@ -713,7 +713,7 @@ static void replication_stop(ReplicationState *rs, bool failover, Error **errp)
 
         s->stage = BLOCK_REPLICATION_FAILOVER;
         s->commit_job = commit_active_start(
-                            NULL, s->active_disk->bs, s->secondary_disk->bs,
+                            NULL, bs->file->bs, s->secondary_disk->bs,
                             JOB_INTERNAL, 0, BLOCKDEV_ON_ERROR_REPORT,
                             NULL, replication_done, bs, true, errp);
         break;
-- 
2.31.1


