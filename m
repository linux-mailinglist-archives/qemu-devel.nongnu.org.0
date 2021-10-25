Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFB24393FB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:48:28 +0200 (CEST)
Received: from localhost ([::1]:37446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexWl-0001vu-BD
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4V-0005ri-4e
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4S-0007El-Pz
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnYBfqR7v86LtZB0/18tTyBVG6GKOAhk5OqMY8z6AAg=;
 b=eWdh+Q5O/BBgNSRIMIKnCtB1OWmqgUdao7JU4+4NEeBu7XD+Z5ck+1zwcaJ/9BwxNEVMsJ
 6YSkRPiEl0JVRNF7v+BQ75BheV7L45jgpuk8frGx4RjSFc7VjVWcghg8P6QRBZjNNGMqcu
 RTjwvMFGki+fZ6S6Me5WKbwnTR4rMWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-rUyZMGfAOoWKn8htdcQoaQ-1; Mon, 25 Oct 2021 06:19:09 -0400
X-MC-Unique: rUyZMGfAOoWKn8htdcQoaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 041BC10A8E00;
 Mon, 25 Oct 2021 10:19:08 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6ED5E26F;
 Mon, 25 Oct 2021 10:19:02 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 20/25] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
Date: Mon, 25 Oct 2021 06:17:30 -0400
Message-Id: <20211025101735.2060852-21-eesposit@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 block.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/block.c b/block.c
index 94bff5c757..40c4729b8d 100644
--- a/block.c
+++ b/block.c
@@ -1074,6 +1074,7 @@ int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
 static void bdrv_join_options(BlockDriverState *bs, QDict *options,
                               QDict *old_options)
 {
+    assert(qemu_in_main_thread());
     if (bs->drv && bs->drv->bdrv_join_options) {
         bs->drv->bdrv_join_options(options, old_options);
     } else {
@@ -1566,6 +1567,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
 {
     Error *local_err = NULL;
     int i, ret;
+    assert(qemu_in_main_thread());
 
     bdrv_assign_node_name(bs, node_name, &local_err);
     if (local_err) {
@@ -1955,6 +1957,8 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     BlockDriver *drv = NULL;
     Error *local_err = NULL;
 
+    assert(qemu_in_main_thread());
+
     /*
      * Caution: while qdict_get_try_str() is fine, getting non-string
      * types would require more care.  When @options come from
@@ -2148,6 +2152,7 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
                             uint64_t *nperm, uint64_t *nshared)
 {
     assert(bs->drv && bs->drv->bdrv_child_perm);
+    assert(qemu_in_main_thread());
     bs->drv->bdrv_child_perm(bs, c, role, reopen_queue,
                              parent_perm, parent_shared,
                              nperm, nshared);
@@ -2231,6 +2236,7 @@ static void bdrv_drv_set_perm_commit(void *opaque)
 {
     BlockDriverState *bs = opaque;
     uint64_t cumulative_perms, cumulative_shared_perms;
+    assert(qemu_in_main_thread());
 
     if (bs->drv->bdrv_set_perm) {
         bdrv_get_cumulative_perm(bs, &cumulative_perms,
@@ -2242,6 +2248,7 @@ static void bdrv_drv_set_perm_commit(void *opaque)
 static void bdrv_drv_set_perm_abort(void *opaque)
 {
     BlockDriverState *bs = opaque;
+    assert(qemu_in_main_thread());
 
     if (bs->drv->bdrv_abort_perm_update) {
         bs->drv->bdrv_abort_perm_update(bs);
@@ -2257,6 +2264,7 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
                              uint64_t shared_perm, Transaction *tran,
                              Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (!bs->drv) {
         return 0;
     }
@@ -4221,6 +4229,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
     assert(bs_queue != NULL);
+    assert(qemu_in_main_thread());
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         ctx = bdrv_get_aio_context(bs_entry->state.bs);
@@ -4484,6 +4493,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
 
     assert(reopen_state != NULL);
     assert(reopen_state->bs->drv != NULL);
+    assert(qemu_in_main_thread());
     drv = reopen_state->bs->drv;
 
     /* This function and each driver's bdrv_reopen_prepare() remove
@@ -4694,6 +4704,7 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs = reopen_state->bs;
     drv = bs->drv;
     assert(drv != NULL);
+    assert(qemu_in_main_thread());
 
     /* If there are any driver level actions to take */
     if (drv->bdrv_reopen_commit) {
@@ -4735,6 +4746,7 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
     assert(reopen_state != NULL);
     drv = reopen_state->bs->drv;
     assert(drv != NULL);
+    assert(qemu_in_main_thread());
 
     if (drv->bdrv_reopen_abort) {
         drv->bdrv_reopen_abort(reopen_state);
@@ -4748,6 +4760,7 @@ static void bdrv_close(BlockDriverState *bs)
     BdrvChild *child, *next;
 
     assert(!bs->refcnt);
+    assert(qemu_in_main_thread());
 
     bdrv_drained_begin(bs); /* complete I/O */
     bdrv_flush(bs);
@@ -6499,6 +6512,8 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
     int ret;
     uint64_t cumulative_perms, cumulative_shared_perms;
 
+    assert(qemu_in_main_thread());
+
     if (!bs->drv) {
         return -ENOMEDIUM;
     }
@@ -7007,6 +7022,7 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     BdrvAioNotifier *baf, *baf_tmp;
 
     assert(!bs->walking_aio_notifiers);
+    assert(qemu_in_main_thread());
     bs->walking_aio_notifiers = true;
     QLIST_FOREACH_SAFE(baf, &bs->aio_notifiers, list, baf_tmp) {
         if (baf->deleted) {
@@ -7034,6 +7050,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
                                     AioContext *new_context)
 {
     BdrvAioNotifier *ban, *ban_tmp;
+    assert(qemu_in_main_thread());
 
     if (bs->quiesce_counter) {
         aio_disable_external(new_context);
-- 
2.27.0


