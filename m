Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F444B28E5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 16:16:19 +0100 (CET)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXek-0004SP-SR
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 10:16:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXI7-0003wi-9D
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXI5-0001tY-H1
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:52:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J32PLzbT17tHIWAv/rCYqSm+Opefr2gc7XTsYwcj6bU=;
 b=O3yMZVsHjKbMZkArz8RQ7iIphPl/EHXhfkd9JzX8Q3J+FaicpAKXBBrzZBmQPn72m0gDik
 kNFgYIqZtNwbMsZAjqAsxs7CPFsKFc4c7eYqnF4kyRyEwc3n0wDLMMu1CaP7vL8zFLMaf0
 /NbuFkk8uxQsJ0XSg39St4OFx3X18gA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-ydWXL9TwO5aqK1bXIjdVUg-1; Fri, 11 Feb 2022 09:52:49 -0500
X-MC-Unique: ydWXL9TwO5aqK1bXIjdVUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A9981091DA0;
 Fri, 11 Feb 2022 14:52:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1C6D8379C;
 Fri, 11 Feb 2022 14:52:46 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 26/31] block_int-common.h: assertions in the callers of
 BlockDriver function pointers
Date: Fri, 11 Feb 2022 09:51:48 -0500
Message-Id: <20220211145153.2861415-27-eesposit@redhat.com>
In-Reply-To: <20220211145153.2861415-1-eesposit@redhat.com>
References: <20220211145153.2861415-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c        | 18 ++++++++++++++++++
 block/create.c |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/block.c b/block.c
index 7cacb5a1a7..d1f5cd2b39 100644
--- a/block.c
+++ b/block.c
@@ -529,6 +529,7 @@ static void coroutine_fn bdrv_create_co_entry(void *opaque)
 
     CreateCo *cco = opaque;
     assert(cco->drv);
+    GLOBAL_STATE_CODE();
 
     ret = cco->drv->bdrv_co_create_opts(cco->drv,
                                         cco->filename, cco->opts, &local_err);
@@ -1096,6 +1097,7 @@ int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
 static void bdrv_join_options(BlockDriverState *bs, QDict *options,
                               QDict *old_options)
 {
+    GLOBAL_STATE_CODE();
     if (bs->drv && bs->drv->bdrv_join_options) {
         bs->drv->bdrv_join_options(options, old_options);
     } else {
@@ -1605,6 +1607,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
 {
     Error *local_err = NULL;
     int i, ret;
+    GLOBAL_STATE_CODE();
 
     bdrv_assign_node_name(bs, node_name, &local_err);
     if (local_err) {
@@ -1996,6 +1999,8 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     BlockDriver *drv = NULL;
     Error *local_err = NULL;
 
+    GLOBAL_STATE_CODE();
+
     /*
      * Caution: while qdict_get_try_str() is fine, getting non-string
      * types would require more care.  When @options come from
@@ -2192,6 +2197,7 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
                             uint64_t *nperm, uint64_t *nshared)
 {
     assert(bs->drv && bs->drv->bdrv_child_perm);
+    GLOBAL_STATE_CODE();
     bs->drv->bdrv_child_perm(bs, c, role, reopen_queue,
                              parent_perm, parent_shared,
                              nperm, nshared);
@@ -2280,6 +2286,7 @@ static void bdrv_drv_set_perm_commit(void *opaque)
 {
     BlockDriverState *bs = opaque;
     uint64_t cumulative_perms, cumulative_shared_perms;
+    GLOBAL_STATE_CODE();
 
     if (bs->drv->bdrv_set_perm) {
         bdrv_get_cumulative_perm(bs, &cumulative_perms,
@@ -2291,6 +2298,7 @@ static void bdrv_drv_set_perm_commit(void *opaque)
 static void bdrv_drv_set_perm_abort(void *opaque)
 {
     BlockDriverState *bs = opaque;
+    GLOBAL_STATE_CODE();
 
     if (bs->drv->bdrv_abort_perm_update) {
         bs->drv->bdrv_abort_perm_update(bs);
@@ -2306,6 +2314,7 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
                              uint64_t shared_perm, Transaction *tran,
                              Error **errp)
 {
+    GLOBAL_STATE_CODE();
     if (!bs->drv) {
         return 0;
     }
@@ -4372,6 +4381,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
     assert(bs_queue != NULL);
+    GLOBAL_STATE_CODE();
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         ctx = bdrv_get_aio_context(bs_entry->state.bs);
@@ -4637,6 +4647,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
 
     assert(reopen_state != NULL);
     assert(reopen_state->bs->drv != NULL);
+    GLOBAL_STATE_CODE();
     drv = reopen_state->bs->drv;
 
     /* This function and each driver's bdrv_reopen_prepare() remove
@@ -4847,6 +4858,7 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs = reopen_state->bs;
     drv = bs->drv;
     assert(drv != NULL);
+    GLOBAL_STATE_CODE();
 
     /* If there are any driver level actions to take */
     if (drv->bdrv_reopen_commit) {
@@ -4888,6 +4900,7 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
     assert(reopen_state != NULL);
     drv = reopen_state->bs->drv;
     assert(drv != NULL);
+    GLOBAL_STATE_CODE();
 
     if (drv->bdrv_reopen_abort) {
         drv->bdrv_reopen_abort(reopen_state);
@@ -4901,6 +4914,7 @@ static void bdrv_close(BlockDriverState *bs)
     BdrvChild *child, *next;
 
     assert(!bs->refcnt);
+    GLOBAL_STATE_CODE();
 
     bdrv_drained_begin(bs); /* complete I/O */
     bdrv_flush(bs);
@@ -6722,6 +6736,8 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
     int ret;
     uint64_t cumulative_perms, cumulative_shared_perms;
 
+    GLOBAL_STATE_CODE();
+
     if (!bs->drv) {
         return -ENOMEDIUM;
     }
@@ -7236,6 +7252,7 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     BdrvAioNotifier *baf, *baf_tmp;
 
     assert(!bs->walking_aio_notifiers);
+    GLOBAL_STATE_CODE();
     bs->walking_aio_notifiers = true;
     QLIST_FOREACH_SAFE(baf, &bs->aio_notifiers, list, baf_tmp) {
         if (baf->deleted) {
@@ -7263,6 +7280,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
                                     AioContext *new_context)
 {
     BdrvAioNotifier *ban, *ban_tmp;
+    GLOBAL_STATE_CODE();
 
     if (bs->quiesce_counter) {
         aio_disable_external(new_context);
diff --git a/block/create.c b/block/create.c
index 89812669df..4df43f11f4 100644
--- a/block/create.c
+++ b/block/create.c
@@ -42,6 +42,8 @@ static int coroutine_fn blockdev_create_run(Job *job, Error **errp)
     BlockdevCreateJob *s = container_of(job, BlockdevCreateJob, common);
     int ret;
 
+    GLOBAL_STATE_CODE();
+
     job_progress_set_remaining(&s->common, 1);
     ret = s->drv->bdrv_co_create(s->opts, errp);
     job_progress_update(&s->common, 1);
-- 
2.31.1


