Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D270E472A7F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:44:00 +0100 (CET)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwioJ-0005k7-TH
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:43:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mwilk-0002xR-9P
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:41:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mwilg-0007mz-Oo
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639392076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3LseeJuvvZcvozmKRXLU8wjWGXFYabLAWMQveHBl/5U=;
 b=SZF20xG/0aM5zRUQ0Z/N3rw85WOXXWm8BKR7yQwndnc7wA2+YayGbVZTYJ5qoUE4O6gfVA
 KzC0qqw+v4USw+8DJNviomeAR9ALEEby6VUNzcBUAe/DtkcbZFxeiWUF7hIzeWVTN3vZfq
 Cc7woGPxDghpin8u0+5otGyBwhV+d9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-fDmOK21OM7qSUNaQpuJS6g-1; Mon, 13 Dec 2021 05:41:13 -0500
X-MC-Unique: fDmOK21OM7qSUNaQpuJS6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E1D8102CB78;
 Mon, 13 Dec 2021 10:41:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 772A24D73A;
 Mon, 13 Dec 2021 10:41:11 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 3/6] block/io.c: introduce
 bdrv_subtree_drained_{begin/end}_unlocked
Date: Mon, 13 Dec 2021 05:40:11 -0500
Message-Id: <20211213104014.69858-4-eesposit@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.713,
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same as the locked version, but use BDRV_POLL_UNLOCKED

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/io.c               | 35 ++++++++++++++++++++++++++---------
 include/block/block-io.h |  2 ++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/block/io.c b/block/io.c
index 3be08cad29..a031691860 100644
--- a/block/io.c
+++ b/block/io.c
@@ -334,7 +334,7 @@ static bool bdrv_drain_poll_top_level(BlockDriverState *bs, bool recursive,
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
                                   BdrvChild *parent, bool ignore_bds_parents,
-                                  bool poll);
+                                  bool poll, bool unlock);
 static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
                                 BdrvChild *parent, bool ignore_bds_parents,
                                 int *drained_end_counter);
@@ -352,7 +352,7 @@ static void bdrv_co_drain_bh_cb(void *opaque)
         if (data->begin) {
             assert(!data->drained_end_counter);
             bdrv_do_drained_begin(bs, data->recursive, data->parent,
-                                  data->ignore_bds_parents, data->poll);
+                                  data->ignore_bds_parents, data->poll, false);
         } else {
             assert(!data->poll);
             bdrv_do_drained_end(bs, data->recursive, data->parent,
@@ -441,7 +441,7 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
                                   BdrvChild *parent, bool ignore_bds_parents,
-                                  bool poll)
+                                  bool poll, bool unlock)
 {
     BdrvChild *child, *next;
 
@@ -458,7 +458,7 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
         bs->recursive_quiesce_counter++;
         QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
             bdrv_do_drained_begin(child->bs, true, child, ignore_bds_parents,
-                                  false);
+                                  false, false);
         }
     }
 
@@ -473,18 +473,28 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
      */
     if (poll) {
         assert(!ignore_bds_parents);
-        BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, recursive, parent));
+        if (unlock) {
+            BDRV_POLL_WHILE_UNLOCKED(bs,
+                                     bdrv_drain_poll_top_level(bs, recursive, parent));
+        } else {
+            BDRV_POLL_WHILE(bs, bdrv_drain_poll_top_level(bs, recursive, parent));
+        }
     }
 }
 
 void bdrv_drained_begin(BlockDriverState *bs)
 {
-    bdrv_do_drained_begin(bs, false, NULL, false, true);
+    bdrv_do_drained_begin(bs, false, NULL, false, true, false);
 }
 
 void bdrv_subtree_drained_begin(BlockDriverState *bs)
 {
-    bdrv_do_drained_begin(bs, true, NULL, false, true);
+    bdrv_do_drained_begin(bs, true, NULL, false, true, false);
+}
+
+void bdrv_subtree_drained_begin_unlocked(BlockDriverState *bs)
+{
+    bdrv_do_drained_begin(bs, true, NULL, false, true, true);
 }
 
 /**
@@ -556,12 +566,19 @@ void bdrv_subtree_drained_end(BlockDriverState *bs)
     BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
 }
 
+void bdrv_subtree_drained_end_unlocked(BlockDriverState *bs)
+{
+    int drained_end_counter = 0;
+    bdrv_do_drained_end(bs, true, NULL, false, &drained_end_counter);
+    BDRV_POLL_WHILE_UNLOCKED(bs, qatomic_read(&drained_end_counter) > 0);
+}
+
 void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent)
 {
     int i;
 
     for (i = 0; i < new_parent->recursive_quiesce_counter; i++) {
-        bdrv_do_drained_begin(child->bs, true, child, false, true);
+        bdrv_do_drained_begin(child->bs, true, child, false, true, false);
     }
 }
 
@@ -671,7 +688,7 @@ void bdrv_drain_all_begin(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_begin(bs, false, NULL, true, false);
+        bdrv_do_drained_begin(bs, false, NULL, true, false, false);
         aio_context_release(aio_context);
     }
 
diff --git a/include/block/block-io.h b/include/block/block-io.h
index e2789dd344..457e77bfce 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -249,6 +249,7 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
  * exclusive access to all child nodes as well.
  */
 void bdrv_subtree_drained_begin(BlockDriverState *bs);
+void bdrv_subtree_drained_begin_unlocked(BlockDriverState *bs);
 
 /**
  * bdrv_drained_end:
@@ -281,6 +282,7 @@ void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter);
  * End a quiescent section started by bdrv_subtree_drained_begin().
  */
 void bdrv_subtree_drained_end(BlockDriverState *bs);
+void bdrv_subtree_drained_end_unlocked(BlockDriverState *bs);
 
 bool bdrv_can_store_new_dirty_bitmap(BlockDriverState *bs, const char *name,
                                      uint32_t granularity, Error **errp);
-- 
2.31.1


