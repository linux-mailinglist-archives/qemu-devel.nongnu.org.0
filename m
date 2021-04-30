Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E0236F919
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:17:21 +0200 (CEST)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcR96-0004sZ-C9
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:17:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkl-0003xg-Qw
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkg-0002Mb-OY
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oAiwuZAVHMJK66utKZDLqsGI/fNf64LHvLZUVCGYvLM=;
 b=NTYIq/xlCwRX0om3OKrC83vZ0gnpI+rYccGUGEFKXQi+ZyklKR0/FD/OcDkRIJmBN8caem
 IFrzU0Dr0nFaoUJ+YCGYwZ/deiIlhDDcdzgbhgy7nB1jcc7bAzzzse1CW9HmnpVN06rE/A
 rOI2NRvl9jJnOXmzATA7XuV4zRtR1uk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-Dg0Dtf4nMmu-DFbPe0HoLA-1; Fri, 30 Apr 2021 06:52:04 -0400
X-MC-Unique: Dg0Dtf4nMmu-DFbPe0HoLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C17A501F8;
 Fri, 30 Apr 2021 10:52:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 487955F707;
 Fri, 30 Apr 2021 10:52:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/39] block: drop ctx argument from bdrv_root_attach_child
Date: Fri, 30 Apr 2021 12:51:14 +0200
Message-Id: <20210430105147.125840-7-kwolf@redhat.com>
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

Passing parent aio context is redundant, as child_class and parent
opaque pointer are enough to retrieve it. Drop the argument and use new
bdrv_child_get_parent_aio_context() interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-7-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int.h | 1 -
 block.c                   | 8 +++++---
 block/block-backend.c     | 4 ++--
 blockjob.c                | 3 +--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 737ec632c4..dd2de6bd1d 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1308,7 +1308,6 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
                                   const BdrvChildClass *child_class,
                                   BdrvChildRole child_role,
-                                  AioContext *ctx,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp);
 void bdrv_root_unref_child(BdrvChild *child);
diff --git a/block.c b/block.c
index 2833912436..54436c951e 100644
--- a/block.c
+++ b/block.c
@@ -2700,13 +2700,13 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   const char *child_name,
                                   const BdrvChildClass *child_class,
                                   BdrvChildRole child_role,
-                                  AioContext *ctx,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp)
 {
     BdrvChild *child;
     Error *local_err = NULL;
     int ret;
+    AioContext *ctx;
 
     ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
@@ -2726,6 +2726,8 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         .opaque         = opaque,
     };
 
+    ctx = bdrv_child_get_parent_aio_context(child);
+
     /* If the AioContexts don't match, first try to move the subtree of
      * child_bs into the AioContext of the new parent. If this doesn't work,
      * try moving the parent into the AioContext of child_bs instead. */
@@ -2786,8 +2788,8 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                     perm, shared_perm, &perm, &shared_perm);
 
     child = bdrv_root_attach_child(child_bs, child_name, child_class,
-                                   child_role, bdrv_get_aio_context(parent_bs),
-                                   perm, shared_perm, parent_bs, errp);
+                                   child_role, perm, shared_perm, parent_bs,
+                                   errp);
     if (child == NULL) {
         return NULL;
     }
diff --git a/block/block-backend.c b/block/block-backend.c
index 3f656ef361..e4892fd6a5 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -435,7 +435,7 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
 
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                       blk->ctx, perm, BLK_PERM_ALL, blk, errp);
+                                       perm, BLK_PERM_ALL, blk, errp);
     if (!blk->root) {
         blk_unref(blk);
         return NULL;
@@ -849,7 +849,7 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
     bdrv_ref(bs);
     blk->root = bdrv_root_attach_child(bs, "root", &child_root,
                                        BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                       blk->ctx, blk->perm, blk->shared_perm,
+                                       blk->perm, blk->shared_perm,
                                        blk, errp);
     if (blk->root == NULL) {
         return -EPERM;
diff --git a/blockjob.c b/blockjob.c
index 160bf38b19..2fe1d788ba 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -229,8 +229,7 @@ int block_job_add_bdrv(BlockJob *job, const char *name, BlockDriverState *bs,
     if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
         aio_context_release(job->job.aio_context);
     }
-    c = bdrv_root_attach_child(bs, name, &child_job, 0,
-                               job->job.aio_context, perm, shared_perm, job,
+    c = bdrv_root_attach_child(bs, name, &child_job, 0, perm, shared_perm, job,
                                errp);
     if (need_context_ops && job->job.aio_context != qemu_get_aio_context()) {
         aio_context_acquire(job->job.aio_context);
-- 
2.30.2


