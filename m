Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990344D8644
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 14:56:27 +0100 (CET)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlBS-00010v-MM
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 09:56:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbQ-0001Jx-Lm
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nTkbM-0006Xq-NV
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647263947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sLxRe1acb4tSj42JtUO72Yu6ER2WDV9szzB0jGbhh9M=;
 b=HGY8DDOEe9W1Llt+6X8zAlYosOW7AO02uIxThU8Rr67BnSDh1kvhakTMrtjR//r1gbnfp7
 QHy/g/zGDXxjeqSU4ITwacC04aKkigiTHV/GGB01MbKSHIBtMMBlnQ/B5xSgEPcWVLrbUY
 kXGCnQNhruOTYwMFAPIG87zUfTaaMfU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-b9Nnso04OJCOPkGnE2i0Ow-1; Mon, 14 Mar 2022 09:19:04 -0400
X-MC-Unique: b9Nnso04OJCOPkGnE2i0Ow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78E03811E84;
 Mon, 14 Mar 2022 13:19:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 375DC1686D;
 Mon, 14 Mar 2022 13:19:04 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 01/10] drains: create bh only when polling
Date: Mon, 14 Mar 2022 09:18:45 -0400
Message-Id: <20220314131854.2202651-2-eesposit@redhat.com>
In-Reply-To: <20220314131854.2202651-1-eesposit@redhat.com>
References: <20220314131854.2202651-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need to prevent coroutines from calling BDRV_POLL_WHILE, because
it can create deadlocks. This is done by firstly creating a bottom half
and then yielding. The bh is then scheduled in the main loop, performs
the drain and polling, and then resumes the coroutine.

The problem is that currently we create coroutine and bh regardless
on whether we eventually poll or not. There is no need to do so,
if no poll takes place.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/io.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/block/io.c b/block/io.c
index efc011ce65..4a3e8d037d 100644
--- a/block/io.c
+++ b/block/io.c
@@ -447,7 +447,7 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
 {
     BdrvChild *child, *next;
 
-    if (qemu_in_coroutine()) {
+    if (poll && qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(bs, true, recursive, parent, ignore_bds_parents,
                                poll, NULL);
         return;
@@ -513,12 +513,6 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
     int old_quiesce_counter;
 
     assert(drained_end_counter != NULL);
-
-    if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(bs, false, recursive, parent, ignore_bds_parents,
-                               false, drained_end_counter);
-        return;
-    }
     assert(bs->quiesce_counter > 0);
 
     /* Re-enable things in child-to-parent order */
@@ -541,11 +535,24 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
     }
 }
 
+static void bdrv_do_drained_end_co(BlockDriverState *bs, bool recursive,
+                                   BdrvChild *parent, bool ignore_bds_parents,
+                                   int *drained_end_counter)
+{
+    if (qemu_in_coroutine()) {
+        bdrv_co_yield_to_drain(bs, false, recursive, parent, ignore_bds_parents,
+                               false, drained_end_counter);
+        return;
+    }
+
+    bdrv_do_drained_end(bs, recursive, parent, ignore_bds_parents, drained_end_counter);
+}
+
 void bdrv_drained_end(BlockDriverState *bs)
 {
     int drained_end_counter = 0;
     IO_OR_GS_CODE();
-    bdrv_do_drained_end(bs, false, NULL, false, &drained_end_counter);
+    bdrv_do_drained_end_co(bs, false, NULL, false, &drained_end_counter);
     BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
 }
 
@@ -559,7 +566,7 @@ void bdrv_subtree_drained_end(BlockDriverState *bs)
 {
     int drained_end_counter = 0;
     IO_OR_GS_CODE();
-    bdrv_do_drained_end(bs, true, NULL, false, &drained_end_counter);
+    bdrv_do_drained_end_co(bs, true, NULL, false, &drained_end_counter);
     BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
 }
 
@@ -580,7 +587,7 @@ void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
     IO_OR_GS_CODE();
 
     for (i = 0; i < old_parent->recursive_quiesce_counter; i++) {
-        bdrv_do_drained_end(child->bs, true, child, false,
+        bdrv_do_drained_end_co(child->bs, true, child, false,
                             &drained_end_counter);
     }
 
@@ -703,7 +710,7 @@ void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
     g_assert(!bs->refcnt);
 
     while (bs->quiesce_counter) {
-        bdrv_do_drained_end(bs, false, NULL, true, &drained_end_counter);
+        bdrv_do_drained_end_co(bs, false, NULL, true, &drained_end_counter);
     }
     BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
 }
@@ -727,7 +734,7 @@ void bdrv_drain_all_end(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_end(bs, false, NULL, true, &drained_end_counter);
+        bdrv_do_drained_end_co(bs, false, NULL, true, &drained_end_counter);
         aio_context_release(aio_context);
     }
 
-- 
2.31.1


