Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB626422B8E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 16:55:43 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXlr4-0005b4-TR
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 10:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXo-00044K-FO
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mXlXm-0005OF-EM
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 10:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633444545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XegxrQvMqE5LLG+rOEGYDsoO0LTAKgfA2zllJ1BTf3M=;
 b=bb5gCxhFOA2Z4it56oSXfOP7HIbV+yB7HAbsbBG0GwXgHcdu55XC53Nwbwy2DrqPypDY3/
 ITddq5LbByFAdoXA8LkSYEUhtgtX2vqX1+ptCw6VtVge0OiwYDk3kseZlSSTgTMmiGkqZh
 hbJZceDGN6GG7hLUI4a0K05IPLY4Zac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-AnTwjP4uM-Wvrim2fo0PEQ-1; Tue, 05 Oct 2021 10:35:43 -0400
X-MC-Unique: AnTwjP4uM-Wvrim2fo0PEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50261802935;
 Tue,  5 Oct 2021 14:35:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 205811042AAA;
 Tue,  5 Oct 2021 14:35:41 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 20/25] block_int-common.h: assertion in the callers of
 BlockDriver function pointers
Date: Tue,  5 Oct 2021 10:32:10 -0400
Message-Id: <20211005143215.29500-21-eesposit@redhat.com>
In-Reply-To: <20211005143215.29500-1-eesposit@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
---
 block.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/block.c b/block.c
index 7d1eb847a4..a921066d4d 100644
--- a/block.c
+++ b/block.c
@@ -1069,6 +1069,7 @@ int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
 static void bdrv_join_options(BlockDriverState *bs, QDict *options,
                               QDict *old_options)
 {
+    g_assert(qemu_in_main_thread());
     if (bs->drv && bs->drv->bdrv_join_options) {
         bs->drv->bdrv_join_options(options, old_options);
     } else {
@@ -1561,6 +1562,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
 {
     Error *local_err = NULL;
     int i, ret;
+    g_assert(qemu_in_main_thread());
 
     bdrv_assign_node_name(bs, node_name, &local_err);
     if (local_err) {
@@ -1932,6 +1934,8 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     BlockDriver *drv = NULL;
     Error *local_err = NULL;
 
+    g_assert(qemu_in_main_thread());
+
     /*
      * Caution: while qdict_get_try_str() is fine, getting non-string
      * types would require more care.  When @options come from
@@ -2125,6 +2129,7 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
                             uint64_t *nperm, uint64_t *nshared)
 {
     assert(bs->drv && bs->drv->bdrv_child_perm);
+    g_assert(qemu_in_main_thread());
     bs->drv->bdrv_child_perm(bs, c, role, reopen_queue,
                              parent_perm, parent_shared,
                              nperm, nshared);
@@ -2208,6 +2213,7 @@ static void bdrv_drv_set_perm_commit(void *opaque)
 {
     BlockDriverState *bs = opaque;
     uint64_t cumulative_perms, cumulative_shared_perms;
+    g_assert(qemu_in_main_thread());
 
     if (bs->drv->bdrv_set_perm) {
         bdrv_get_cumulative_perm(bs, &cumulative_perms,
@@ -2219,6 +2225,7 @@ static void bdrv_drv_set_perm_commit(void *opaque)
 static void bdrv_drv_set_perm_abort(void *opaque)
 {
     BlockDriverState *bs = opaque;
+    g_assert(qemu_in_main_thread());
 
     if (bs->drv->bdrv_abort_perm_update) {
         bs->drv->bdrv_abort_perm_update(bs);
@@ -2234,6 +2241,7 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
                              uint64_t shared_perm, Transaction *tran,
                              Error **errp)
 {
+    g_assert(qemu_in_main_thread());
     if (!bs->drv) {
         return 0;
     }
@@ -4198,6 +4206,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
     assert(bs_queue != NULL);
+    g_assert(qemu_in_main_thread());
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         ctx = bdrv_get_aio_context(bs_entry->state.bs);
@@ -4461,6 +4470,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
 
     assert(reopen_state != NULL);
     assert(reopen_state->bs->drv != NULL);
+    g_assert(qemu_in_main_thread());
     drv = reopen_state->bs->drv;
 
     /* This function and each driver's bdrv_reopen_prepare() remove
@@ -4671,6 +4681,7 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs = reopen_state->bs;
     drv = bs->drv;
     assert(drv != NULL);
+    g_assert(qemu_in_main_thread());
 
     /* If there are any driver level actions to take */
     if (drv->bdrv_reopen_commit) {
@@ -4712,6 +4723,7 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
     assert(reopen_state != NULL);
     drv = reopen_state->bs->drv;
     assert(drv != NULL);
+    g_assert(qemu_in_main_thread());
 
     if (drv->bdrv_reopen_abort) {
         drv->bdrv_reopen_abort(reopen_state);
@@ -4725,6 +4737,7 @@ static void bdrv_close(BlockDriverState *bs)
     BdrvChild *child, *next;
 
     assert(!bs->refcnt);
+    g_assert(qemu_in_main_thread());
 
     bdrv_drained_begin(bs); /* complete I/O */
     bdrv_flush(bs);
@@ -6409,6 +6422,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
 {
     BdrvChild *child, *parent;
     int ret;
+    g_assert(qemu_in_main_thread());
 
     if (!bs->drv) {
         return -ENOMEDIUM;
@@ -6911,6 +6925,7 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     BdrvAioNotifier *baf, *baf_tmp;
 
     assert(!bs->walking_aio_notifiers);
+    g_assert(qemu_in_main_thread());
     bs->walking_aio_notifiers = true;
     QLIST_FOREACH_SAFE(baf, &bs->aio_notifiers, list, baf_tmp) {
         if (baf->deleted) {
@@ -6938,6 +6953,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
                                     AioContext *new_context)
 {
     BdrvAioNotifier *ban, *ban_tmp;
+    g_assert(qemu_in_main_thread());
 
     if (bs->quiesce_counter) {
         aio_disable_external(new_context);
-- 
2.27.0


