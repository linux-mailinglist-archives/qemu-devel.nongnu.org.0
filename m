Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F724CDB3D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:47:18 +0100 (CET)
Received: from localhost ([::1]:56154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQC1N-000438-Ij
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:47:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6P-000649-MB
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6N-0007am-SU
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7UDOCwUW3A+Bw+nN0icSYNiEXV+1TLePPusa+9/dk4=;
 b=XT8m5ldd87cUvRZfSEzCmKNFSjx+LwPpwXoLOupD3UEPBk8e1hIikkxU8ZzGlOExuRZ0YU
 sCHIzfj0P+zZaSp9jul075D5zIsHBr8Mi5qt1YahB/+m/G1vwv7zmW9zeNDYFCIYi0TWGj
 ckIL64DuFNA6rswgxz4tvWVyTJXZwYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-TP_53EUdMUWaXAi6xaYsJA-1; Fri, 04 Mar 2022 11:48:19 -0500
X-MC-Unique: TP_53EUdMUWaXAi6xaYsJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0EC48070F0;
 Fri,  4 Mar 2022 16:48:18 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA59085476;
 Fri,  4 Mar 2022 16:48:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 39/50] block_int-common.h: assertions in the callers of
 BlockDriver function pointers
Date: Fri,  4 Mar 2022 17:47:00 +0100
Message-Id: <20220304164711.474713-40-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220303151616.325444-27-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c        | 17 +++++++++++++++++
 block/create.c |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/block.c b/block.c
index b91f9b2d11..e5ba40d028 100644
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
@@ -6723,6 +6736,8 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
     int ret;
     uint64_t cumulative_perms, cumulative_shared_perms;
 
+    GLOBAL_STATE_CODE();
+
     if (!bs->drv) {
         return -ENOMEDIUM;
     }
@@ -7237,6 +7252,7 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     BdrvAioNotifier *baf, *baf_tmp;
 
     assert(!bs->walking_aio_notifiers);
+    GLOBAL_STATE_CODE();
     bs->walking_aio_notifiers = true;
     QLIST_FOREACH_SAFE(baf, &bs->aio_notifiers, list, baf_tmp) {
         if (baf->deleted) {
@@ -7264,6 +7280,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
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
2.35.1


