Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB06210F9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:39:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNs6-0007tP-2C; Tue, 08 Nov 2022 07:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrl-0007jq-3Z
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrf-0000qn-PQ
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9O1xxCMnNw2TxPiON7N7f9zP6IQiXiXvJZViYa6z/c=;
 b=f4D2RAH9R+ancuMIhD+TFUoJ8SIGpk0fgQwPzOorDznmffFOsF2W3EubbJBisuuxn3VEGa
 pvOQYUZP0kfeIK2pF+6Yf6QI6vPLHaVoTn27aHMNZCR1qBH5aLyNDNrvRQLFJVosrOBNMf
 NEwTzdQycMGx/UWFQvSthv8o5kVN7Dk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-202-30fk09uBOOSEUZ3h7z2aXw-1; Tue, 08 Nov 2022 07:38:00 -0500
X-MC-Unique: 30fk09uBOOSEUZ3h7z2aXw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B94833C0CD53;
 Tue,  8 Nov 2022 12:37:59 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F64F9E70;
 Tue,  8 Nov 2022 12:37:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 05/13] block: Inline bdrv_drain_invoke()
Date: Tue,  8 Nov 2022 13:37:30 +0100
Message-Id: <20221108123738.530873-6-kwolf@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

bdrv_drain_invoke() has now two entirely separate cases that share no
code any more and are selected depending on a bool parameter. Each case
has only one caller. Just inline the function.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/io.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/block/io.c b/block/io.c
index 41e6121c31..c520183fb7 100644
--- a/block/io.c
+++ b/block/io.c
@@ -241,21 +241,6 @@ typedef struct {
     bool ignore_bds_parents;
 } BdrvCoDrainData;
 
-/* Recursively call BlockDriver.bdrv_drain_begin/end callbacks */
-static void bdrv_drain_invoke(BlockDriverState *bs, bool begin)
-{
-    if (!bs->drv || (begin && !bs->drv->bdrv_drain_begin) ||
-            (!begin && !bs->drv->bdrv_drain_end)) {
-        return;
-    }
-
-    if (begin) {
-        bs->drv->bdrv_drain_begin(bs);
-    } else {
-        bs->drv->bdrv_drain_end(bs);
-    }
-}
-
 /* Returns true if BDRV_POLL_WHILE() should go into a blocking aio_poll() */
 bool bdrv_drain_poll(BlockDriverState *bs, bool recursive,
                      BdrvChild *ignore_parent, bool ignore_bds_parents)
@@ -389,7 +374,9 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
     }
 
     bdrv_parent_drained_begin(bs, parent, ignore_bds_parents);
-    bdrv_drain_invoke(bs, true);
+    if (bs->drv && bs->drv->bdrv_drain_begin) {
+        bs->drv->bdrv_drain_begin(bs);
+    }
 }
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
@@ -460,7 +447,9 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
     assert(bs->quiesce_counter > 0);
 
     /* Re-enable things in child-to-parent order */
-    bdrv_drain_invoke(bs, false);
+    if (bs->drv && bs->drv->bdrv_drain_end) {
+        bs->drv->bdrv_drain_end(bs);
+    }
     bdrv_parent_drained_end(bs, parent, ignore_bds_parents);
 
     old_quiesce_counter = qatomic_fetch_dec(&bs->quiesce_counter);
-- 
2.38.1


