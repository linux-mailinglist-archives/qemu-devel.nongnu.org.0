Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F24507AA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:56:43 +0100 (CET)
Received: from localhost ([::1]:51240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdPW-0006Mt-4p
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:56:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNK-0003KC-45
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNG-0007mD-TE
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJIOMpkoMCyUOvXH6b7KDq036JHK6Rb+aczp6JsS9iA=;
 b=dX/1EkIKj4P0pa1IiG61QqgJTu3oZpRg3lYpUb3I4rykofTBek9FJagUXbtEdumfPB3JtP
 6WE0E3EwGe5msCRm9E8YLjYmEnzKj0o+neuaJxrxmZet4sGSIa4JKM3df2RgLui5MWaFUG
 6EYwBfKpJetsR/KB7EwS+smHor/cWS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-xTajZJKEOFSAFkSLrORVCg-1; Mon, 15 Nov 2021 09:54:18 -0500
X-MC-Unique: xTajZJKEOFSAFkSLrORVCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4068D19057A0;
 Mon, 15 Nov 2021 14:54:17 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43B9019D9F;
 Mon, 15 Nov 2021 14:54:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/13] block: Manipulate children list in .attach/.detach
Date: Mon, 15 Nov 2021 15:53:58 +0100
Message-Id: <20211115145409.176785-3-kwolf@redhat.com>
In-Reply-To: <20211115145409.176785-1-kwolf@redhat.com>
References: <20211115145409.176785-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

The children list is specific to BDS parents.  We should not modify it
in the general children modification code, but let BDS parents deal with
it in their .attach() and .detach() methods.

This also has the advantage that a BdrvChild is removed from the
children list before its .bs pointer can become NULL.  BDS parents
generally assume that their children's .bs pointer is never NULL, so
this is actually a bug fix.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211111120829.81329-3-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 580cb77a70..ca024ffced 100644
--- a/block.c
+++ b/block.c
@@ -1387,6 +1387,8 @@ static void bdrv_child_cb_attach(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
 
+    QLIST_INSERT_HEAD(&bs->children, child, next);
+
     if (child->role & BDRV_CHILD_COW) {
         bdrv_backing_attach(child);
     }
@@ -1403,6 +1405,8 @@ static void bdrv_child_cb_detach(BdrvChild *child)
     }
 
     bdrv_unapply_subtree_drain(child, bs);
+
+    QLIST_REMOVE(child, next);
 }
 
 static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
@@ -2747,7 +2751,7 @@ static void bdrv_child_free(void *opaque)
 static void bdrv_remove_empty_child(BdrvChild *child)
 {
     assert(!child->bs);
-    QLIST_SAFE_REMOVE(child, next);
+    assert(!child->next.le_prev); /* not in children list */
     bdrv_child_free(child);
 }
 
@@ -2913,12 +2917,6 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
         return ret;
     }
 
-    QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
-    /*
-     * child is removed in bdrv_attach_child_common_abort(), so don't care to
-     * abort this change separately.
-     */
-
     return 0;
 }
 
@@ -4851,7 +4849,6 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
     BdrvRemoveFilterOrCowChild *s = opaque;
     BlockDriverState *parent_bs = s->child->opaque;
 
-    QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
     if (s->is_backing) {
         parent_bs->backing = s->child;
     } else {
@@ -4906,7 +4903,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
 
-    QLIST_SAFE_REMOVE(child, next);
     if (s->is_backing) {
         bs->backing = NULL;
     } else {
-- 
2.31.1


