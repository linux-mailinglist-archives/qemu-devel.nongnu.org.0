Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8A45B525
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 08:16:29 +0100 (CET)
Received: from localhost ([::1]:53128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpmW4-0003uk-Lc
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 02:16:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3X-0005b3-0C
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mpm3U-0005Ex-Ge
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 01:46:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637736413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6G5vwUkOEs8X+g0L8Oz1+VKO8+thwcqi8z6GVHRDys=;
 b=Cp3jORwZ1V7M3uJwxxZKGGMKiwVlROr229dZnABAGP9wqtgKWVcUZQpmy4f5o08tbcyNiX
 73a9/diXjivQBZ9V9VnGB5vflyI2k59BUpm6uDqWTjtJIY00zEyfjfVZpqBh9ek9HibVdn
 6DxiVJBJT3qjnmeLW8tSsbBMnEEx4cA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-o2iHPJXrNjyKPGnVZCz56w-1; Wed, 24 Nov 2021 01:46:49 -0500
X-MC-Unique: o2iHPJXrNjyKPGnVZCz56w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE3ED102C886;
 Wed, 24 Nov 2021 06:46:48 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9536D60843;
 Wed, 24 Nov 2021 06:46:47 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 24/31] block_int-common.h: assertions in the callers of
 BdrvChildClass function pointers
Date: Wed, 24 Nov 2021 01:44:11 -0500
Message-Id: <20211124064418.3120601-25-eesposit@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
---
 block.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/block.c b/block.c
index 180884b8c0..a0309f827d 100644
--- a/block.c
+++ b/block.c
@@ -1491,6 +1491,7 @@ const BdrvChildClass child_of_bds = {
 
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c)
 {
+    assert(qemu_in_main_thread());
     return c->klass->get_parent_aio_context(c);
 }
 
@@ -2120,6 +2121,7 @@ bool bdrv_is_writable(BlockDriverState *bs)
 
 static char *bdrv_child_user_desc(BdrvChild *c)
 {
+    assert(qemu_in_main_thread());
     return c->klass->get_parent_desc(c);
 }
 
@@ -2832,6 +2834,7 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
 
     assert(!child->frozen);
     assert(old_bs != new_bs);
+    assert(qemu_in_main_thread());
 
     if (old_bs && new_bs) {
         assert(bdrv_get_aio_context(old_bs) == bdrv_get_aio_context(new_bs));
@@ -2928,6 +2931,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
+    assert(qemu_in_main_thread());
     /*
      * Pass free_empty_child=false, because we still need the child
      * for the AioContext operations on the parent below; those
@@ -3296,6 +3300,7 @@ void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
 static void bdrv_parent_cb_change_media(BlockDriverState *bs, bool load)
 {
     BdrvChild *c;
+    assert(qemu_in_main_thread());
     QLIST_FOREACH(c, &bs->parents, next_parent) {
         if (c->klass->change_media) {
             c->klass->change_media(c, load);
@@ -3792,6 +3797,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
     assert(!child_class || !flags);
     assert(!child_class == !parent);
+    assert(qemu_in_main_thread());
 
     if (reference) {
         bool options_non_empty = options ? qdict_size(options) : false;
@@ -4178,6 +4184,7 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
      * important to avoid graph changes between the recursive queuing here and
      * bdrv_reopen_multiple(). */
     assert(bs->quiesce_counter > 0);
+    assert(qemu_in_main_thread());
 
     if (bs_queue == NULL) {
         bs_queue = g_new0(BlockReopenQueue, 1);
@@ -7271,6 +7278,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
     BdrvChild *child, *parent;
 
     g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());
+    assert(qemu_in_main_thread());
 
     if (old_context == new_context) {
         return;
@@ -7343,6 +7351,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
 static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                             GSList **ignore, Error **errp)
 {
+    assert(qemu_in_main_thread());
     if (g_slist_find(*ignore, c)) {
         return true;
     }
-- 
2.27.0


