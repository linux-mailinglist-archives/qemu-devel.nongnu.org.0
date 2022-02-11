Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E94B2915
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 16:29:06 +0100 (CET)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIXr7-0005Gn-4y
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 10:29:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXIH-0004L7-6n
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:53:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIXIE-0001uU-SS
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 09:53:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644591181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjT03uF9HdwuJNYzxJU2PoDeANvFbXr8mP+nQZBnFls=;
 b=TuXrBvH/oF9CHiV2zD+NW4YJ9ZMK0eLkoWQs8fHxcMcTSetBPJiua11JIkuz3O5NkTYuUA
 jGtHdI9/oL19HzRXKi+M0eI7TnJBNfDsZgrf6KYHH78qoI3nWzwD9HbIuFJpZlNxE1YL5s
 jZ6u+vUP8f5NshtTMONQvQp2Hl3ARaw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-b43GpOx8PFa2ncqaCbpvYw-1; Fri, 11 Feb 2022 09:52:58 -0500
X-MC-Unique: b43GpOx8PFa2ncqaCbpvYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F338B85EE66;
 Fri, 11 Feb 2022 14:52:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C71477DE43;
 Fri, 11 Feb 2022 14:52:55 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 28/31] block_int-common.h: assertions in the callers of
 BdrvChildClass function pointers
Date: Fri, 11 Feb 2022 09:51:50 -0500
Message-Id: <20220211145153.2861415-29-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
 block.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index d1f5cd2b39..4297431812 100644
--- a/block.c
+++ b/block.c
@@ -1497,7 +1497,7 @@ const BdrvChildClass child_of_bds = {
 
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
 {
-    IO_CODE();
+    GLOBAL_STATE_CODE();
     return c->klass->get_parent_aio_context(c);
 }
 
@@ -2128,6 +2128,7 @@ bool bdrv_is_writable(BlockDriverState *bs)
 
 static char *bdrv_child_user_desc(BdrvChild *c)
 {
+    GLOBAL_STATE_CODE();
     return c->klass->get_parent_desc(c);
 }
 
@@ -2844,6 +2845,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
 
     assert(!child->frozen);
     assert(old_bs != new_bs);
+    GLOBAL_STATE_CODE();
 
     if (old_bs && new_bs) {
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
@@ -2940,6 +2942,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
+    GLOBAL_STATE_CODE();
     /*
      * Pass free_empty_child=false, because we still need the child
      * for the AioContext operations on the parent below; those
@@ -3308,6 +3311,7 @@ void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 static void bdrv_parent_cb_change_media(BlockDriverState *bs, bool load)
 {
     BdrvChild *c;
+    GLOBAL_STATE_CODE();
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (c->klass->change_media) {
             c->klass->change_media(c, load);
@@ -3807,6 +3811,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
     assert(!child_class || !flags);
     assert(!child_class == !parent);
+    GLOBAL_STATE_CODE();
 
     if (reference) {
         bool options_non_empty = options ? qdict_size(options) : false;
@@ -4193,6 +4198,7 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
      * important to avoid graph changes between the recursive queuing here and
      * bdrv_reopen_multiple(). */
     assert(bs->quiesce_counter > 0);
+    GLOBAL_STATE_CODE();
 
     if (bs_queue == NULL) {
         bs_queue = g_new0(BlockReopenQueue, 1);
@@ -7327,6 +7333,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
     BdrvChild *child, *parent;
 
     g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());
+    GLOBAL_STATE_CODE();
 
     if (old_context == new_context) {
         return;
@@ -7399,6 +7406,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
 static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                             GSList **ignore, Error **errp)
 {
+    GLOBAL_STATE_CODE();
     if (g_slist_find(*ignore, c)) {
         return true;
     }
-- 
2.31.1


