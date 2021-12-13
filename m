Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A150472A8F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:46:24 +0100 (CET)
Received: from localhost ([::1]:54658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiqb-0002N4-S3
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mwili-0002wN-Ei
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:41:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mwilf-0007mX-QJ
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639392075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7F3Bbxh+io7h96uJ2icq61kxjI8KmHIokVFozYrTHk=;
 b=S8WdxKuyI4nBL1s36ANK7+r9TWRd+7jE21vnouNXZIZ1ZEOoNz9YwToFZkBQ/9MXdRimhB
 DCoX3ztqeFuf1tqpn8ZefxWOdbHxAvKcOQz6mz7UgCK70u1UxCM0MMHXqM9AJ4q1d+N9OV
 U2xStIuYaHvKe7suc3nN9tSqJPAsqJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-D2Ys16cvNkqqtxFnBa8kDQ-1; Mon, 13 Dec 2021 05:41:13 -0500
X-MC-Unique: D2Ys16cvNkqqtxFnBa8kDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D427B102CB73;
 Mon, 13 Dec 2021 10:41:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38B816B8EA;
 Mon, 13 Dec 2021 10:41:12 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 4/6] block.c: add subtree_drains where needed
Date: Mon, 13 Dec 2021 05:40:12 -0500
Message-Id: <20211213104014.69858-5-eesposit@redhat.com>
In-Reply-To: <20211213104014.69858-1-eesposit@redhat.com>
References: <20211213104014.69858-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Protect bdrv_replace_child_noperm, as it modifies the
graph by adding/removing elements to .children and .parents
list of a bs.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/block.c b/block.c
index 3c3c90704c..1aa9e51a98 100644
--- a/block.c
+++ b/block.c
@@ -2369,7 +2369,11 @@ static void bdrv_replace_child_abort(void *opaque)
      * So whether new_bs was NULL or not, we cannot pass s->childp here; and in
      * any case, there is no reason to pass it anyway.
      */
+    bdrv_subtree_drained_begin_unlocked(s->child->bs);
+    bdrv_subtree_drained_begin_unlocked(s->old_bs);
     bdrv_replace_child_noperm(&s->child, s->old_bs, true);
+    bdrv_subtree_drained_end_unlocked(s->old_bs);
+    bdrv_subtree_drained_end_unlocked(s->child->bs);
     /*
      * The child was pre-existing, so s->old_bs must be non-NULL, and
      * s->child thus must not have been freed
@@ -2427,13 +2431,20 @@ static void bdrv_replace_child_tran(BdrvChild **childp,
 
     if (new_bs) {
         bdrv_ref(new_bs);
+        bdrv_subtree_drained_begin_unlocked(new_bs);
     }
     /*
      * Pass free_empty_child=false, we will free the child (if
      * necessary) in bdrv_replace_child_commit() (if our
      * @free_empty_child parameter was true).
      */
+    bdrv_subtree_drained_begin_unlocked(s->old_bs);
     bdrv_replace_child_noperm(childp, new_bs, false);
+    bdrv_subtree_drained_end_unlocked(s->old_bs);
+
+    if (new_bs) {
+        bdrv_subtree_drained_end_unlocked(new_bs);
+    }
     /* old_bs reference is transparently moved from *childp to @s */
 }
 
@@ -2951,7 +2962,9 @@ static void bdrv_attach_child_common_abort(void *opaque)
      * need to keep it as an empty shell (after this function, it will
      * not be attached to any parent, and it will not have a .bs).
      */
+    bdrv_subtree_drained_begin_unlocked(bs);
     bdrv_replace_child_noperm(s->child, NULL, false);
+    bdrv_subtree_drained_end_unlocked(bs);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -3051,7 +3064,10 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
+
+    bdrv_subtree_drained_begin_unlocked(child_bs);
     bdrv_replace_child_noperm(&new_child, child_bs, true);
+    bdrv_subtree_drained_end_unlocked(child_bs);
     /* child_bs was non-NULL, so new_child must not have been freed */
     assert(new_child != NULL);
 
@@ -3114,8 +3130,16 @@ static void bdrv_detach_child(BdrvChild **childp)
     BlockDriverState *old_bs = (*childp)->bs;
 
     assert(qemu_in_main_thread());
+    if (old_bs) {
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
-- 
2.31.1


