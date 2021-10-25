Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0D9439411
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:52:28 +0200 (CEST)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexad-000080-6Z
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4Y-0005v1-4W
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4V-0007HO-Er
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQkbxFqgNjfPpcxkdpaCw0LWM9ordDFCKkIkVNLNUGs=;
 b=e2sJtbcd7015hIWURN4P0wz++DFzMlvepYaB8WnrtoxAbZ2bd7TTsarZW33NdUGHVwBdVl
 DG3+aqDQ7CI8S+VRwi5y1wmfI30isB8HZ0R/BmnTaTmtAq2QKssbiTi3g4g/JpvA11vaQ3
 8X23ksmxsSGF9v3TScCn7Tcg4yn01A8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-hKiu80zSOLyJtFaC_mHtFQ-1; Mon, 25 Oct 2021 06:19:11 -0400
X-MC-Unique: hKiu80zSOLyJtFaC_mHtFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94BD3362F8;
 Mon, 25 Oct 2021 10:19:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 663355E275;
 Mon, 25 Oct 2021 10:19:09 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 22/25] block_int-common.h: assertions in the callers of
 BdrvChildClass function pointers
Date: Mon, 25 Oct 2021 06:17:32 -0400
Message-Id: <20211025101735.2060852-23-eesposit@redhat.com>
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
 block.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block.c b/block.c
index 40c4729b8d..da80e89ad4 100644
--- a/block.c
+++ b/block.c
@@ -1462,6 +1462,7 @@ const BdrvChildClass child_of_bds = {
 
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
 {
+    assert(qemu_in_main_thread());
     return c->klass->get_parent_aio_context(c);
 }
 
@@ -2085,6 +2086,7 @@ bool bdrv_is_writable(BlockDriverState *bs)
 
 static char *bdrv_child_user_desc(BdrvChild *c)
 {
+    assert(qemu_in_main_thread());
     return c->klass->get_parent_desc(c);
 }
 
@@ -2718,6 +2720,7 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     int drain_saldo;
 
     assert(!child->frozen);
+    assert(qemu_in_main_thread());
 
     if (old_bs && new_bs) {
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
@@ -2806,6 +2809,8 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
+    assert(qemu_in_main_thread());
+
     bdrv_replace_child_noperm(child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
@@ -3164,6 +3169,7 @@ void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 static void bdrv_parent_cb_change_media(BlockDriverState *bs, bool load)
 {
     BdrvChild *c;
+    assert(qemu_in_main_thread());
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (c->klass->change_media) {
             c->klass->change_media(c, load);
@@ -3655,6 +3661,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
     assert(!child_class || !flags);
     assert(!child_class == !parent);
+    assert(qemu_in_main_thread());
 
     if (reference) {
         bool options_non_empty = options ? qdict_size(options) : false;
@@ -4041,6 +4048,7 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
      * important to avoid graph changes between the recursive queuing here and
      * bdrv_reopen_multiple(). */
     assert(bs->quiesce_counter > 0);
+    assert(qemu_in_main_thread());
 
     if (bs_queue == NULL) {
         bs_queue = g_new0(BlockReopenQueue, 1);
@@ -7097,6 +7105,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
     BdrvChild *child, *parent;
 
     g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());
+    assert(qemu_in_main_thread());
 
     if (old_context == new_context) {
         return;
@@ -7173,6 +7182,7 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
         return true;
     }
     *ignore = g_slist_prepend(*ignore, c);
+    assert(qemu_in_main_thread());
 
     /*
      * A BdrvChildClass that doesn't handle AioContext changes cannot
-- 
2.27.0


