Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D454964DC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:14:31 +0100 (CET)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyQg-0007Jb-Nk
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:14:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxNH-0007tT-7y
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxND-0000PO-Kz
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtmnhNJ4KmbPcuIEmy316OsVoHQaNG0bVONwev0byiQ=;
 b=HYvIB0TqkcPxdxlWWZrOZXG4pWyGlNMbfGHzwM30evWRjcojr2I4Pi0KirxZCy+0hISbuF
 rFiJcCY52S4N9iZVI2s6NajzzD4bcCxvElHNqqVxHcNDy6XR7vYH00dy2dU57FgMniZ2yo
 X+PBOnL2Mj8+O5oGN1BGbMlvx7SO75o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-Z7Mb7HBCP02PiL_8noKNAg-1; Fri, 21 Jan 2022 12:06:44 -0500
X-MC-Unique: Z7Mb7HBCP02PiL_8noKNAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00FA0100C666;
 Fri, 21 Jan 2022 17:06:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FAA87EBE8;
 Fri, 21 Jan 2022 17:06:40 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 24/33] block_int-common.h: assertions in the callers of
 BlockDriver function pointers
Date: Fri, 21 Jan 2022 12:05:35 -0500
Message-Id: <20220121170544.2049944-25-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c        | 18 ++++++++++++++++++
 block/create.c |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/block.c b/block.c
index bad834c86e..448fb9d76f 100644
--- a/block.c
+++ b/block.c
@@ -526,6 +526,7 @@ static void coroutine_fn bdrv_create_co_entry(void *opaque)
 
     CreateCo *cco = opaque;
     assert(cco->drv);
+    assert(qemu_in_main_thread());
 
     ret = cco->drv->bdrv_co_create_opts(cco->drv,
                                         cco->filename, cco->opts, &local_err);
@@ -1089,6 +1090,7 @@ int refresh_total_sectors(BlockDriverState *bs, int64_t hint)
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
@@ -4354,6 +4363,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
     assert(bs_queue != NULL);
+    assert(qemu_in_main_thread());
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         ctx = bdrv_get_aio_context(bs_entry->state.bs);
@@ -4619,6 +4629,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
 
     assert(reopen_state != NULL);
     assert(reopen_state->bs->drv != NULL);
+    assert(qemu_in_main_thread());
     drv = reopen_state->bs->drv;
 
     /* This function and each driver's bdrv_reopen_prepare() remove
@@ -4829,6 +4840,7 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
     bs = reopen_state->bs;
     drv = bs->drv;
     assert(drv != NULL);
+    assert(qemu_in_main_thread());
 
     /* If there are any driver level actions to take */
     if (drv->bdrv_reopen_commit) {
@@ -4870,6 +4882,7 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state)
     assert(reopen_state != NULL);
     drv = reopen_state->bs->drv;
     assert(drv != NULL);
+    assert(qemu_in_main_thread());
 
     if (drv->bdrv_reopen_abort) {
         drv->bdrv_reopen_abort(reopen_state);
@@ -4883,6 +4896,7 @@ static void bdrv_close(BlockDriverState *bs)
     BdrvChild *child, *next;
 
     assert(!bs->refcnt);
+    assert(qemu_in_main_thread());
 
     bdrv_drained_begin(bs); /* complete I/O */
     bdrv_flush(bs);
@@ -6679,6 +6693,8 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
     int ret;
     uint64_t cumulative_perms, cumulative_shared_perms;
 
+    assert(qemu_in_main_thread());
+
     if (!bs->drv) {
         return -ENOMEDIUM;
     }
@@ -7187,6 +7203,7 @@ static void bdrv_detach_aio_context(BlockDriverState *bs)
     BdrvAioNotifier *baf, *baf_tmp;
 
     assert(!bs->walking_aio_notifiers);
+    assert(qemu_in_main_thread());
     bs->walking_aio_notifiers = true;
     QLIST_FOREACH_SAFE(baf, &bs->aio_notifiers, list, baf_tmp) {
         if (baf->deleted) {
@@ -7214,6 +7231,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
                                     AioContext *new_context)
 {
     BdrvAioNotifier *ban, *ban_tmp;
+    assert(qemu_in_main_thread());
 
     if (bs->quiesce_counter) {
         aio_disable_external(new_context);
diff --git a/block/create.c b/block/create.c
index 89812669df..8e9e807080 100644
--- a/block/create.c
+++ b/block/create.c
@@ -42,6 +42,8 @@ static int coroutine_fn blockdev_create_run(Job *job, Error **errp)
     BlockdevCreateJob *s = container_of(job, BlockdevCreateJob, common);
     int ret;
 
+    assert(qemu_in_main_thread());
+
     job_progress_set_remaining(&s->common, 1);
     ret = s->drv->bdrv_co_create(s->opts, errp);
     job_progress_update(&s->common, 1);
-- 
2.31.1


