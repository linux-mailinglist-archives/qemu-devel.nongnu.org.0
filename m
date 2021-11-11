Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F244D66F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 13:14:30 +0100 (CET)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8yL-00014X-AK
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 07:14:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8t1-000082-8H
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8sz-00036v-6J
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636632534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uyzUp2gROLRX2Mtjs6Y0dXbVxkZC5iqmMyE5EANOx5Y=;
 b=MjwPi/KAqg6pUBDTQX16TWIQUXFkzEcZ4812YArJbnjloOPL511Mm/L0YnO462BJpHd8k9
 PZNc+bNxRI0jbC6fOx9+c4JunDyLP5TT8ZIXL4fwhfSCtqStN535yDQS4uImfA/YItTA2I
 8kCPbJZR63K/j/qXK71PtrzMsAKxwTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-a3knXNu1OlmSnw3J3timvA-1; Thu, 11 Nov 2021 07:08:50 -0500
X-MC-Unique: a3knXNu1OlmSnw3J3timvA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731F4101796A;
 Thu, 11 Nov 2021 12:08:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE6EA5C1A3;
 Thu, 11 Nov 2021 12:08:48 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 05/10] block: Pass BdrvChild ** to replace_child_noperm
Date: Thu, 11 Nov 2021 13:08:24 +0100
Message-Id: <20211111120829.81329-6-hreitz@redhat.com>
In-Reply-To: <20211111120829.81329-1-hreitz@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_replace_child_noperm() modifies BdrvChild.bs, and can potentially
set it to NULL.  That is dangerous, because BDS parents generally assume
that their children's .bs pointer is never NULL.  We therefore want to
let bdrv_replace_child_noperm() set the corresponding BdrvChild pointer
to NULL, too.

This patch lays the foundation for it by passing a BdrvChild ** pointer
to bdrv_replace_child_noperm() so that it can later use it to NULL the
BdrvChild pointer immediately after setting BdrvChild.bs to NULL.

(We will still need to undertake some intermediate steps, though.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index c7d5aa5254..d668156eca 100644
--- a/block.c
+++ b/block.c
@@ -87,7 +87,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
-static void bdrv_replace_child_noperm(BdrvChild *child,
+static void bdrv_replace_child_noperm(BdrvChild **child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
@@ -2270,7 +2270,7 @@ static void bdrv_replace_child_abort(void *opaque)
     BlockDriverState *new_bs = s->child->bs;
 
     /* old_bs reference is transparently moved from @s to @s->child */
-    bdrv_replace_child_noperm(s->child, s->old_bs);
+    bdrv_replace_child_noperm(&s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2300,7 +2300,7 @@ static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(child, new_bs);
+    bdrv_replace_child_noperm(&child, new_bs);
     /* old_bs reference is transparently moved from @child to @s */
 }
 
@@ -2672,9 +2672,10 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-static void bdrv_replace_child_noperm(BdrvChild *child,
+static void bdrv_replace_child_noperm(BdrvChild **childp,
                                       BlockDriverState *new_bs)
 {
+    BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
     int new_bs_quiesce_counter;
     int drain_saldo;
@@ -2767,7 +2768,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
-    bdrv_replace_child_noperm(child, NULL);
+    bdrv_replace_child_noperm(s->child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2867,7 +2868,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(new_child, child_bs);
+    bdrv_replace_child_noperm(&new_child, child_bs);
 
     *child = new_child;
 
@@ -2922,12 +2923,12 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     return 0;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
+static void bdrv_detach_child(BdrvChild **childp)
 {
-    BlockDriverState *old_bs = child->bs;
+    BlockDriverState *old_bs = (*childp)->bs;
 
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
+    bdrv_replace_child_noperm(childp, NULL);
+    bdrv_child_free(*childp);
 
     if (old_bs) {
         /*
@@ -3033,7 +3034,7 @@ void bdrv_root_unref_child(BdrvChild *child)
     BlockDriverState *child_bs;
 
     child_bs = child->bs;
-    bdrv_detach_child(child);
+    bdrv_detach_child(&child);
     bdrv_unref(child_bs);
 }
 
-- 
2.33.1


