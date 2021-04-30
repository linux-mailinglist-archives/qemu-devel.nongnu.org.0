Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9495F36F936
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:26:11 +0200 (CEST)
Received: from localhost ([::1]:50714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRHe-0007gW-LG
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQl4-0004Mu-T6
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQl3-0002b7-0H
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwbR8u2geGKnrD7jkQ34KoJdh+wl2xJWl600xi8CCjY=;
 b=BNKl46vygZosnu9SkGQT7E/3gUjXzz4TwcXW+okSLzT4HwCcA9kf9wtBbjR+ureTCC7Nv9
 N54J596O5MjEdq1EZBe5Sd7SDPoAFW7K5v8Mh3NZQtnKI5F8mDcLfFXIWnaR4JW7UY6yiC
 n2egq4SF86xZIXxPwnXQGdyTc+UEBlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-Z5lftDuFMAejP4lOvVkD1Q-1; Fri, 30 Apr 2021 06:52:26 -0400
X-MC-Unique: Z5lftDuFMAejP4lOvVkD1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FD6A8186E1;
 Fri, 30 Apr 2021 10:52:25 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A83467889;
 Fri, 30 Apr 2021 10:52:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/39] block: add bdrv_drv_set_perm transaction action
Date: Fri, 30 Apr 2021 12:51:22 +0200
Message-Id: <20210430105147.125840-15-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Refactor calling driver callbacks to a separate transaction action to
be used later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-15-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 70 ++++++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/block.c b/block.c
index cbcc4c15a0..ab7a4d13d8 100644
--- a/block.c
+++ b/block.c
@@ -2189,6 +2189,54 @@ static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
     }
 }
 
+static void bdrv_drv_set_perm_commit(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+    uint64_t cumulative_perms, cumulative_shared_perms;
+
+    if (bs->drv->bdrv_set_perm) {
+        bdrv_get_cumulative_perm(bs, &cumulative_perms,
+                                 &cumulative_shared_perms);
+        bs->drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
+    }
+}
+
+static void bdrv_drv_set_perm_abort(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    if (bs->drv->bdrv_abort_perm_update) {
+        bs->drv->bdrv_abort_perm_update(bs);
+    }
+}
+
+TransactionActionDrv bdrv_drv_set_perm_drv = {
+    .abort = bdrv_drv_set_perm_abort,
+    .commit = bdrv_drv_set_perm_commit,
+};
+
+static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
+                             uint64_t shared_perm, Transaction *tran,
+                             Error **errp)
+{
+    if (!bs->drv) {
+        return 0;
+    }
+
+    if (bs->drv->bdrv_check_perm) {
+        int ret = bs->drv->bdrv_check_perm(bs, perm, shared_perm, errp);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    if (tran) {
+        tran_add(tran, &bdrv_drv_set_perm_drv, bs);
+    }
+
+    return 0;
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
@@ -2249,12 +2297,10 @@ static int bdrv_node_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
         return 0;
     }
 
-    if (drv->bdrv_check_perm) {
-        ret = drv->bdrv_check_perm(bs, cumulative_perms,
-                                   cumulative_shared_perms, errp);
-        if (ret < 0) {
-            return ret;
-        }
+    ret = bdrv_drv_set_perm(bs, cumulative_perms, cumulative_shared_perms, NULL,
+                            errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
@@ -2322,9 +2368,7 @@ static void bdrv_node_abort_perm_update(BlockDriverState *bs)
         return;
     }
 
-    if (drv->bdrv_abort_perm_update) {
-        drv->bdrv_abort_perm_update(bs);
-    }
+    bdrv_drv_set_perm_abort(bs);
 
     QLIST_FOREACH(c, &bs->children, next) {
         bdrv_child_set_perm_abort(c);
@@ -2342,7 +2386,6 @@ static void bdrv_abort_perm_update(BlockDriverState *bs)
 
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
-    uint64_t cumulative_perms, cumulative_shared_perms;
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
 
@@ -2350,12 +2393,7 @@ static void bdrv_node_set_perm(BlockDriverState *bs)
         return;
     }
 
-    bdrv_get_cumulative_perm(bs, &cumulative_perms, &cumulative_shared_perms);
-
-    /* Update this node */
-    if (drv->bdrv_set_perm) {
-        drv->bdrv_set_perm(bs, cumulative_perms, cumulative_shared_perms);
-    }
+    bdrv_drv_set_perm_commit(bs);
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
     if (!drv->bdrv_child_perm) {
-- 
2.30.2


