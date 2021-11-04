Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3CD4451A1
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 11:41:41 +0100 (CET)
Received: from localhost ([::1]:36424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miaBg-0006HA-9K
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 06:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mia9f-0004G4-SG
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:39:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mia9e-0006v2-0P
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636022373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wicCU2oy+FN3RifIdeaIhHv+GV5abyLPoa/GqoS4WOI=;
 b=YB6BxPI7QL73AXKaAHlRFMUqbDmGlqwT49k8p5OGViveAsi08LMjyLb9OHS20TdbpuCHrM
 ogehV9zTwvKGU+ZOl/4ewALpNUL7j+EW1b5DI7Z67clAQJdQIgKKaeBo6IbrzlbkCRzKiu
 pBIITHcmdFgzF1BDAaKfzhCUKINRq30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-kWERbitVM5qJ-8IwiIILRA-1; Thu, 04 Nov 2021 06:39:30 -0400
X-MC-Unique: kWERbitVM5qJ-8IwiIILRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A2F1871805;
 Thu,  4 Nov 2021 10:39:29 +0000 (UTC)
Received: from localhost (unknown [10.39.192.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1B819C79;
 Thu,  4 Nov 2021 10:39:21 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/7] block: Manipulate children list in .attach/.detach
Date: Thu,  4 Nov 2021 11:38:44 +0100
Message-Id: <20211104103849.46855-3-hreitz@redhat.com>
In-Reply-To: <20211104103849.46855-1-hreitz@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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

The children list is specific to BDS parents.  We should not modify it
in the general children modification code, but let BDS parents deal with
it in their .attach() and .detach() methods.

This also has the advantage that a BdrvChild is removed from the
children list before its .bs pointer can become NULL.  BDS parents
generally assume that their children's .bs pointer is never NULL, so
this is actually a bug fix.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 580cb77a70..243ae206b5 100644
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
 
@@ -2913,7 +2917,6 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
         return ret;
     }
 
-    QLIST_INSERT_HEAD(&parent_bs->children, *child, next);
     /*
      * child is removed in bdrv_attach_child_common_abort(), so don't care to
      * abort this change separately.
@@ -4851,7 +4854,6 @@ static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
     BdrvRemoveFilterOrCowChild *s = opaque;
     BlockDriverState *parent_bs = s->child->opaque;
 
-    QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
     if (s->is_backing) {
         parent_bs->backing = s->child;
     } else {
@@ -4906,7 +4908,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
 
-    QLIST_SAFE_REMOVE(child, next);
     if (s->is_backing) {
         bs->backing = NULL;
     } else {
-- 
2.33.1


