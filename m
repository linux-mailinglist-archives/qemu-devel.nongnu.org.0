Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36835492BCB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:01:51 +0100 (CET)
Received: from localhost ([::1]:44358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9rri-0001js-9T
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:01:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUq-0006FB-PF
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1n9rUo-00060q-NZ
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 11:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642523881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9oH9KFDshDkkrZj6LuueG0DMST4LEuRstXa0K9NWyU=;
 b=a4HSOukWM5eSBp5iOigN/wNfeNdBmaKs9ybtC6WOeP0Ni5iHo63IOjY8OJOhyK/ykKLwec
 GwgC1Tk+z8kfZpjvA9XYMGsA0sRFVPBVRVu2iAi1AFJB3he62l6pws7VhpBoY1fcPZwT+e
 zQ9bg10D4I6nrhXjYHVAvx9bcLbIDFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-rc7TMCNfMlyHGNhO-Go2Vg-1; Tue, 18 Jan 2022 11:37:56 -0500
X-MC-Unique: rc7TMCNfMlyHGNhO-Go2Vg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92A4F1856EFB;
 Tue, 18 Jan 2022 16:28:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8C7334D3A;
 Tue, 18 Jan 2022 16:28:27 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 10/12] block.c: add subtree_drains where needed
Date: Tue, 18 Jan 2022 11:27:36 -0500
Message-Id: <20220118162738.1366281-11-eesposit@redhat.com>
In-Reply-To: <20220118162738.1366281-1-eesposit@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Protect bdrv_replace_child_noperm, as it modifies the
graph by adding/removing elements to .children and .parents
list of a bs. Use the newly introduced
bdrv_subtree_drained_{begin/end}_unlocked drains to achieve
that and be free from the aiocontext lock.

One important criteria to keep in mind is that if the caller of
bdrv_replace_child_noperm creates a transaction, we need to make sure that the
whole transaction is under the same drain block. This is imperative, as having
multiple drains also in the .abort() class of functions causes discrepancies
in the drained counters (as nodes are put back into the original positions),
making it really hard to retourn all to zero and leaving the code very buggy.
See https://patchew.org/QEMU/20211213104014.69858-1-eesposit@redhat.com/
for more explanations.

Unfortunately we still need to have bdrv_subtree_drained_begin/end
in bdrv_detach_child() releasing and then holding the AioContext
lock, since it later invokes bdrv_try_set_aio_context() that is
not safe yet. Once all is cleaned up, we can also remove the
acquire/release locks in job_unref, artificially added because of this.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index fcc44a49a0..6196c95aae 100644
--- a/block.c
+++ b/block.c
@@ -3114,8 +3114,22 @@ static void bdrv_detach_child(BdrvChild **childp)
     BlockDriverState *old_bs = (*childp)->bs;
 
     assert(qemu_in_main_thread());
+    if (old_bs) {
+        /*
+         * TODO: this is called by job_unref with lock held, because
+         * afterwards it calls bdrv_try_set_aio_context.
+         * Once all of this is fixed, take care of removing
+         * the aiocontext lock and make this function _unlocked.
+         */
+        bdrv_subtree_drained_begin(old_bs);
+    }
+
     bdrv_replace_child_noperm(childp, NULL, true);
 
+    if (old_bs) {
+        bdrv_subtree_drained_end(old_bs);
+    }
+
     if (old_bs) {
         /*
          * Update permissions for old node. We're just taking a parent away, so
@@ -3154,6 +3168,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
     Transaction *tran = tran_new();
 
     assert(qemu_in_main_thread());
+    bdrv_subtree_drained_begin_unlocked(child_bs);
 
     ret = bdrv_attach_child_common(child_bs, child_name, child_class,
                                    child_role, perm, shared_perm, opaque,
@@ -3168,6 +3183,7 @@ out:
     tran_finalize(tran, ret);
     /* child is unset on failure by bdrv_attach_child_common_abort() */
     assert((ret < 0) == !child);
+    bdrv_subtree_drained_end_unlocked(child_bs);
 
     bdrv_unref(child_bs);
     return child;
@@ -3197,6 +3213,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
 
     assert(qemu_in_main_thread());
 
+    bdrv_subtree_drained_begin_unlocked(parent_bs);
+    bdrv_subtree_drained_begin_unlocked(child_bs);
+
     ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
                                    child_role, &child, tran, errp);
     if (ret < 0) {
@@ -3211,6 +3230,9 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
 out:
     tran_finalize(tran, ret);
     /* child is unset on failure by bdrv_attach_child_common_abort() */
+    bdrv_subtree_drained_end_unlocked(child_bs);
+    bdrv_subtree_drained_end_unlocked(parent_bs);
+
     assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
@@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
 
     assert(qemu_in_main_thread());
 
+    bdrv_subtree_drained_begin_unlocked(bs);
+    if (backing_hd) {
+        bdrv_subtree_drained_begin_unlocked(backing_hd);
+    }
+
     ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
     if (ret < 0) {
         goto out;
@@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
     ret = bdrv_refresh_perms(bs, errp);
 out:
     tran_finalize(tran, ret);
+    if (backing_hd) {
+        bdrv_subtree_drained_end_unlocked(backing_hd);
+    }
+    bdrv_subtree_drained_end_unlocked(bs);
 
     return ret;
 }
@@ -5266,7 +5297,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
     assert(bdrv_get_aio_context(from) == bdrv_get_aio_context(to));
-    bdrv_drained_begin(from);
+    bdrv_subtree_drained_begin_unlocked(from);
+    bdrv_subtree_drained_begin_unlocked(to);
 
     /*
      * Do the replacement without permission update.
@@ -5298,7 +5330,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
 out:
     tran_finalize(tran, ret);
 
-    bdrv_drained_end(from);
+    bdrv_subtree_drained_end_unlocked(to);
+    bdrv_subtree_drained_end_unlocked(from);
     bdrv_unref(from);
 
     return ret;
@@ -5345,6 +5378,9 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 
     assert(!bs_new->backing);
 
+    bdrv_subtree_drained_begin_unlocked(bs_new);
+    bdrv_subtree_drained_begin_unlocked(bs_top);
+
     ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
                                    &child_of_bds, bdrv_backing_role(bs_new),
                                    &bs_new->backing, tran, errp);
@@ -5360,6 +5396,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
     ret = bdrv_refresh_perms(bs_new, errp);
 out:
     tran_finalize(tran, ret);
+    bdrv_subtree_drained_end_unlocked(bs_top);
+    bdrv_subtree_drained_end_unlocked(bs_new);
 
     bdrv_refresh_limits(bs_top, NULL, NULL);
 
@@ -5379,8 +5417,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     assert(qemu_in_main_thread());
 
     bdrv_ref(old_bs);
-    bdrv_drained_begin(old_bs);
-    bdrv_drained_begin(new_bs);
+    bdrv_subtree_drained_begin_unlocked(old_bs);
+    bdrv_subtree_drained_begin_unlocked(new_bs);
 
     bdrv_replace_child_tran(&child, new_bs, tran, true);
     /* @new_bs must have been non-NULL, so @child must not have been freed */
@@ -5394,8 +5432,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 
     tran_finalize(tran, ret);
 
-    bdrv_drained_end(old_bs);
-    bdrv_drained_end(new_bs);
+    bdrv_subtree_drained_end_unlocked(new_bs);
+    bdrv_subtree_drained_end_unlocked(old_bs);
     bdrv_unref(old_bs);
 
     return ret;
-- 
2.31.1


