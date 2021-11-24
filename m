Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB0845B575
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:34:45 +0100 (CET)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmnk-0008Ol-3h
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3Q-0005Xo-2t
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3N-0005D9-QG
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/xQl/Evp8+R8ZMpyLikYg4/dlLSH+yubcrxqQj4rEA=;
 b=etcbYSvGI5khK1CHBzI2izTTl781SyS5FTzqib7BSXcYWQlnVFC9W3IH0+QTcj9N4t9yXL
 Rh1/cXsiogcEnzflMDfrJx0NIe9POo34a0Lma/YfSztCIzAUl8RlpfOEexfeIIivN1x4py
 x7EumFj4e2Zg+fCZNlEMvhMm88Vf5jA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-24-kmkSLDJEMSiKGiTdxLDUhw-1; Wed, 24 Nov 2021 01:46:47 -0500
X-MC-Unique: kmkSLDJEMSiKGiTdxLDUhw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39744102CB30;
 Wed, 24 Nov 2021 06:46:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E77A160843;
 Wed, 24 Nov 2021 06:46:44 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 22/31] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
Date: Wed, 24 Nov 2021 01:44:09 -0500
Message-Id: <20211124064418.3120601-23-eesposit@redhat.com>
In-Reply-To: <20211124064418.3120601-1-eesposit@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block.c        | 18 ++++++++++++++++++
 block/create.c | 10 ++++++++++
 2 files changed, 28 insertions(+)

diff --git a/block.c b/block.c
index b77ab0a104..180884b8c0 100644
--- a/block.c
+++ b/block.c
@@ -526,6 +526,7 @@ static void coroutine_fn bdrv_create_co_entry(void *opaque)
 
     CreateCo *cco = opaque;
     assert(cco->drv);
+    assert(qemu_in_main_thread());
 
     ret = cco->drv->bdrv_co_create_opts(cco->drv,
                                         cco->filename, cco->opts, &local_err);
@@ -1090,6 +1091,7 @@ int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
 static void bdrv_join_options(BlockDriverState *bs, QDict *options,
                               QDict *old_options)
 {
+    assert(qemu_in_main_thread());
     if (bs->drv && bs->drv->bdrv_join_options) {
         bs->drv->bdrv_join_options(options, old_options);
     } else {
@@ -1598,6 +1600,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
 {
     Error *local_err = NULL;
     int i, ret;
+    assert(qemu_in_main_thread());
 
     bdrv_assign_node_name(bs, node_name, &local_err);
     if (local_err) {
@@ -1989,6 +1992,8 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     BlockDriver *drv = NULL;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     /*
      * Caution: while qdict_get_try_str() is fine, getting non-string
      * types would require more care.  When @options come from
@@ -2182,6 +2187,7 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
                             uint64_t *nperm, uint64_t *nshared)
 {
     assert(bs->drv && bs->drv->bdrv_child_perm);
+    assert(qemu_in_main_thread());
     bs->drv->bdrv_child_perm(bs, c, role, reopen_queue,
                              parent_perm, parent_shared,
                              nperm, nshared);
@@ -2267,6 +2273,7 @@ static void bdrv_drv_set_perm_commit(void *opaque)
 {
     BlockDriverState *bs = opaque;
     uint64_t cumulative_perms, cumulative_shared_perms;
+    assert(qemu_in_main_thread());
 
     if (bs->drv->bdrv_set_perm) {
         bdrv_get_cumulative_perm(bs, &cumulative_perms,
@@ -2278,6 +2285,7 @@ static void bdrv_drv_set_perm_commit(void *opaque)
 static void bdrv_drv_set_perm_abort(void *opaque)
 {
     BlockDriverState *bs = opaque;
+    assert(qemu_in_main_thread());
 
     if (bs->drv->bdrv_abort_perm_update) {
         bs->drv->bdrv_abort_perm_update(bs);
@@ -2293,6 +2301,7 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
                              uint64_t shared_perm, Transaction *tran,
                              Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (!bs->drv) {
         return 0;
     }
@@ -4357,6 +4366,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
     assert(bs_queue != NULL);
+    assert(qemu_in_main_thread());
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         ctx = bdrv_get_aio_context(bs_entry->state.bs);
@@ -4622,6 +4632,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
 
     assert(reopen_state != NULL);
     assert(reopen_state->bs->drv != NULL);
+    assert(qemu_in_main_thread());
     drv = reopen_state->bs->drv;
 
     /* This function and each driver's bdrv_reopen_prepare() remove
@@ -4832,6 +4843,7 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs = reopen_state->bs;
     drv = bs->drv;
     assert(drv != NULL);
+    assert(qemu_in_main_thread());
 
     /* If there are any driver level actions to take */
     if (drv->bdrv_reopen_commit) {
@@ -4873,6 +4885,7 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
     assert(reopen_state != NULL);
     drv = reopen_state->bs->drv;
     assert(drv != NULL);
+    assert(qemu_in_main_thread());
 
     if (drv->bdrv_reopen_abort) {
         drv->bdrv_reopen_abort(reopen_state);
@@ -4886,6 +4899,7 @@ static void bdrv_close(BlockDriverState *bs)
     BdrvChild *child, *next;
 
     assert(!bs->refcnt);
+    assert(qemu_in_main_thread());
 
     bdrv_drained_begin(bs); /* complete I/O */
     bdrv_flush(bs);
@@ -6671,6 +6685,8 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
     int ret;
     uint64_t cumulative_perms, cumulative_shared_perms;
 
+    assert(qemu_in_main_thread());
+
     if (!bs->drv) {
         return -ENOMEDIUM;
     }
@@ -7180,6 +7196,7 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     BdrvAioNotifier *baf, *baf_tmp;
 
     assert(!bs->walking_aio_notifiers);
+    assert(qemu_in_main_thread());
     bs->walking_aio_notifiers = true;
     QLIST_FOREACH_SAFE(baf, &bs->aio_notifiers, list, baf_tmp) {
         if (baf->deleted) {
@@ -7207,6 +7224,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
                                     AioContext *new_context)
 {
     BdrvAioNotifier *ban, *ban_tmp;
+    assert(qemu_in_main_thread());
 
     if (bs->quiesce_counter) {
         aio_disable_external(new_context);
diff --git a/block/create.c b/block/create.c
index 89812669df..0167118579 100644
--- a/block/create.c
+++ b/block/create.c
@@ -42,6 +42,16 @@ static int coroutine_fn blockdev_create_run(Job *job, Error **errp)
     BlockdevCreateJob *s = container_of(job, BlockdevCreateJob, common);
     int ret;
 
+    /*
+     * Currently there is nothing preventing this
+     * function from being called in an iothread context.
+     * However, since it will crash anyways because of the
+     * aiocontext lock not taken, we might as well make it
+     * crash with a more meaningful error, by checking that
+     * we are in the main loop
+     */
+    assert(qemu_in_main_thread());
+
     job_progress_set_remaining(&s->common, 1);
     ret = s->drv->bdrv_co_create(s->opts, errp);
     job_progress_update(&s->common, 1);
-- 
2.27.0


