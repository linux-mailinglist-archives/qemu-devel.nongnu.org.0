Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA9444D66C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 13:13:50 +0100 (CET)
Received: from localhost ([::1]:53472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8xh-00089M-UA
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 07:13:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8sr-0008SV-U6
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8sq-00035g-41
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636632527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o+PAHv2V7jz95XP5m5W8oPbjYDrXB+UXUyRgmX9RjKU=;
 b=hhtjRVZ9wBW2W+83zyw7P9zMi3irLAbmtdTNfWUWb47Kp1F7zhSsLe+Oc/3OC35ycsa0cu
 +Pv6o33XiTZlYSBVT46ZuTakiDUKyLmAfVI/lRrhPvP3lGjRkzvhhhWBSs/dRTwy8Pohlj
 FaHe9rqBvdRGhTrtFYluRHz96Izn2hg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-dHYKbJ0dMiOp1RTUJ41Lrg-1; Thu, 11 Nov 2021 07:08:44 -0500
X-MC-Unique: dHYKbJ0dMiOp1RTUJ41Lrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CBA21017965;
 Thu, 11 Nov 2021 12:08:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 16402197FC;
 Thu, 11 Nov 2021 12:08:38 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 02/10] block: Manipulate children list in .attach/.detach
Date: Thu, 11 Nov 2021 13:08:21 +0100
Message-Id: <20211111120829.81329-3-hreitz@redhat.com>
In-Reply-To: <20211111120829.81329-1-hreitz@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The children list is specific to BDS parents.  We should not modify it
in the general children modification code, but let BDS parents deal with
it in their .attach() and .detach() methods.

This also has the advantage that a BdrvChild is removed from the
children list before its .bs pointer can become NULL.  BDS parents
generally assume that their children's .bs pointer is never NULL, so
this is actually a bug fix.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
2.33.1


