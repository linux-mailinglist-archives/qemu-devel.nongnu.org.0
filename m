Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F536F947
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:27:30 +0200 (CEST)
Received: from localhost ([::1]:55056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRIv-00011n-3V
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkk-0003ui-2J
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkf-0002M4-SK
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B21dPMKC4WJRf4ovCexPhVRUFwi+qrjoEE/PoORfs3U=;
 b=DuIFAoFQ/8edi65b3WIfetkmm4mypqZWhYlllaBeoJKA1sjeoSjCblALhm3cgFDit6rfhf
 a1gTQhPtaxyMvWSkZFdrC8ksD1GWc3fEepdkysx8SB0f7pOK8NLZA9fhE7Hgy41zdo2FW+
 FKZx4xpiBxlUunEhA1KF8YdP4Sp1L9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-_tB60vHOMMWB9kMInVQWnA-1; Fri, 30 Apr 2021 06:52:02 -0400
X-MC-Unique: _tB60vHOMMWB9kMInVQWnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 022959196AE;
 Fri, 30 Apr 2021 10:52:02 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EF165F707;
 Fri, 30 Apr 2021 10:52:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/39] block: BdrvChildClass: add .get_parent_aio_context
 handler
Date: Fri, 30 Apr 2021 12:51:13 +0200
Message-Id: <20210430105147.125840-6-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Add new handler to get aio context and implement it in all child
classes. Add corresponding public interface to be used soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-6-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h     |  2 ++
 include/block/block_int.h |  2 ++
 block.c                   | 13 +++++++++++++
 block/block-backend.c     |  9 +++++++++
 blockjob.c                |  8 ++++++++
 5 files changed, 34 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index b3f6e509d4..54279baa95 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -702,6 +702,8 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     GSList **ignore, Error **errp);
 bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                               GSList **ignore, Error **errp);
+AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
+
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88e4111939..737ec632c4 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -789,6 +789,8 @@ struct BdrvChildClass {
     bool (*can_set_aio_ctx)(BdrvChild *child, AioContext *ctx,
                             GSList **ignore, Error **errp);
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
+
+    AioContext *(*get_parent_aio_context)(BdrvChild *child);
 };
 
 extern const BdrvChildClass child_of_bds;
diff --git a/block.c b/block.c
index 1e7e8907e4..2833912436 100644
--- a/block.c
+++ b/block.c
@@ -1394,6 +1394,13 @@ static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
     return 0;
 }
 
+static AioContext *bdrv_child_cb_get_parent_aio_context(BdrvChild *c)
+{
+    BlockDriverState *bs = c->opaque;
+
+    return bdrv_get_aio_context(bs);
+}
+
 const BdrvChildClass child_of_bds = {
     .parent_is_bds   = true,
     .get_parent_desc = bdrv_child_get_parent_desc,
@@ -1407,8 +1414,14 @@ const BdrvChildClass child_of_bds = {
     .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
     .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
     .update_filename = bdrv_child_cb_update_filename,
+    .get_parent_aio_context = bdrv_child_cb_get_parent_aio_context,
 };
 
+AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
+{
+    return c->klass->get_parent_aio_context(c);
+}
+
 static int bdrv_open_flags(BlockDriverState *bs, int flags)
 {
     int open_flags = flags;
diff --git a/block/block-backend.c b/block/block-backend.c
index 413af51f3b..3f656ef361 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -298,6 +298,13 @@ static void blk_root_detach(BdrvChild *child)
     }
 }
 
+static AioContext *blk_root_get_parent_aio_context(BdrvChild *c)
+{
+    BlockBackend *blk = c->opaque;
+
+    return blk_get_aio_context(blk);
+}
+
 static const BdrvChildClass child_root = {
     .inherit_options    = blk_root_inherit_options,
 
@@ -318,6 +325,8 @@ static const BdrvChildClass child_root = {
 
     .can_set_aio_ctx    = blk_root_can_set_aio_ctx,
     .set_aio_ctx        = blk_root_set_aio_ctx,
+
+    .get_parent_aio_context = blk_root_get_parent_aio_context,
 };
 
 /*
diff --git a/blockjob.c b/blockjob.c
index 207e8c7fd9..160bf38b19 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -163,6 +163,13 @@ static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
     job->job.aio_context = ctx;
 }
 
+static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
+{
+    BlockJob *job = c->opaque;
+
+    return job->job.aio_context;
+}
+
 static const BdrvChildClass child_job = {
     .get_parent_desc    = child_job_get_parent_desc,
     .drained_begin      = child_job_drained_begin,
@@ -171,6 +178,7 @@ static const BdrvChildClass child_job = {
     .can_set_aio_ctx    = child_job_can_set_aio_ctx,
     .set_aio_ctx        = child_job_set_aio_ctx,
     .stay_at_node       = true,
+    .get_parent_aio_context = child_job_get_parent_aio_context,
 };
 
 void block_job_remove_all_bdrv(BlockJob *job)
-- 
2.30.2


