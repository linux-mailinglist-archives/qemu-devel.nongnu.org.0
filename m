Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77E94CD9F9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 18:19:20 +0100 (CET)
Received: from localhost ([::1]:49092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQBaJ-0001wj-Me
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 12:19:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6R-00064r-N3
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB6Q-0007bG-83
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYLtI6vdheTN/nOHTEQBJofIbsAa4YoJ1MptXr34iT4=;
 b=Yk+USc0ER55MGNMZ3EbaLEMjqYSEMilCGCEJW9W26vQCCohBX8w+37Ee8E2u8BS5WjVa+Z
 JVqy3lA4kXMQtMhMEVM5Z5nQ7D7r8+RZduI3Zl+Mtfnz7pgOWAs3JsNXF8mLudV+Yz+Xwe
 vNh2aQ47LlQ0Er//3B3s8SwZFtGR7qI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-gFhvv0PZM_ODWj9hZVvwpQ-1; Fri, 04 Mar 2022 11:48:22 -0500
X-MC-Unique: gFhvv0PZM_ODWj9hZVvwpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68328FC82;
 Fri,  4 Mar 2022 16:48:21 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69C958547F;
 Fri,  4 Mar 2022 16:48:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 41/50] block_int-common.h: assertions in the callers of
 BdrvChildClass function pointers
Date: Fri,  4 Mar 2022 17:47:02 +0100
Message-Id: <20220304164711.474713-42-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Message-Id: <20220303151616.325444-29-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index e5ba40d028..718e4cae8b 100644
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
2.35.1


