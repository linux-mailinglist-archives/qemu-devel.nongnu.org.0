Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4583B86C5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:06:43 +0200 (CEST)
Received: from localhost ([::1]:44264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycjZ-0007DA-Sh
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfV-0002rO-Pw
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfR-00070c-Qz
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gzkz4iQ1z7SgIx+HREwKK8edPLbz9y/BM8Rp8M8y6Tg=;
 b=hLlkYxzhybQnfPHS12ZtVjtGulM3/VOTqtzBa3QYZTWXtoCu92N6RD9Ew4AECNyMPqWv/h
 la7NF+0tEfYF0uNIXYlxzVYSLNG9BDyc/hbxpD05PXXonkg/OdDtbrnM6Ir8KCIr8AdlLn
 9JfGxZKBbayIokXShXyNyPksRQhlGkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-oSqTpHrMO9aqnBWm3CyIaA-1; Wed, 30 Jun 2021 12:02:21 -0400
X-MC-Unique: oSqTpHrMO9aqnBWm3CyIaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B4AF801596;
 Wed, 30 Jun 2021 16:02:20 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3977A189C7;
 Wed, 30 Jun 2021 16:02:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/24] block: introduce bdrv_set_file_or_backing_noperm()
Date: Wed, 30 Jun 2021 18:01:49 +0200
Message-Id: <20210630160206.276439-8-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

To be used for reopen in future commit.

Notes:
 - It seems OK to update inherits_from if new bs is recursively inherits
 from parent bs. Let's just not check for backing_chain_contains, to
 support file child of non-filters.

 - Simply check child->frozen instead of
   bdrv_is_backing_chain_frozen(), as we really interested only in this
   one child.

 - Role determination of new child is a bit more complex: it remains
   the same for backing child, it's obvious for filter driver. But for
   non-filter file child let's for now restrict to only replacing
   existing child (and keeping its role).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610120537.196183-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 83 +++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 63 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index 7eceef0afa..14711ce7ab 100644
--- a/block.c
+++ b/block.c
@@ -84,6 +84,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
+static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
+                                              BdrvChild *child,
+                                              Transaction *tran);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -3117,56 +3120,96 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
 }
 
 /*
- * Sets the bs->backing link of a BDS. A new reference is created; callers
- * which don't need their own reference any more must call bdrv_unref().
+ * Sets the bs->backing or bs->file link of a BDS. A new reference is created;
+ * callers which don't need their own reference any more must call bdrv_unref().
  *
  * Function doesn't update permissions, caller is responsible for this.
  */
-static int bdrv_set_backing_noperm(BlockDriverState *bs,
-                                   BlockDriverState *backing_hd,
-                                   Transaction *tran, Error **errp)
+static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
+                                           BlockDriverState *child_bs,
+                                           bool is_backing,
+                                           Transaction *tran, Error **errp)
 {
     int ret = 0;
-    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
-        bdrv_inherits_from_recursive(backing_hd, bs);
+    bool update_inherits_from =
+        bdrv_inherits_from_recursive(child_bs, parent_bs);
+    BdrvChild *child = is_backing ? parent_bs->backing : parent_bs->file;
+    BdrvChildRole role;
 
-    if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
+    if (!parent_bs->drv) {
+        /*
+         * Node without drv is an object without a class :/. TODO: finally fix
+         * qcow2 driver to never clear bs->drv and implement format corruption
+         * handling in other way.
+         */
+        error_setg(errp, "Node corrupted");
+        return -EINVAL;
+    }
+
+    if (child && child->frozen) {
+        error_setg(errp, "Cannot change frozen '%s' link from '%s' to '%s'",
+                   child->name, parent_bs->node_name, child->bs->node_name);
         return -EPERM;
     }
 
-    if (bs->backing) {
-        /* Cannot be frozen, we checked that above */
-        bdrv_unset_inherits_from(bs, bs->backing, tran);
-        bdrv_remove_filter_or_cow_child(bs, tran);
+    if (parent_bs->drv->is_filter) {
+        role = BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
+    } else if (is_backing) {
+        role = BDRV_CHILD_COW;
+    } else {
+        /*
+         * We only can use same role as it is in existing child. We don't have
+         * infrastructure to determine role of file child in generic way
+         */
+        if (!child) {
+            error_setg(errp, "Cannot set file child to format node without "
+                       "file child");
+            return -EINVAL;
+        }
+        role = child->role;
     }
 
-    if (!backing_hd) {
+    if (child) {
+        bdrv_unset_inherits_from(parent_bs, child, tran);
+        bdrv_remove_file_or_backing_child(parent_bs, child, tran);
+    }
+
+    if (!child_bs) {
         goto out;
     }
 
-    ret = bdrv_attach_child_noperm(bs, backing_hd, "backing",
-                                   &child_of_bds, bdrv_backing_role(bs),
-                                   &bs->backing, tran, errp);
+    ret = bdrv_attach_child_noperm(parent_bs, child_bs,
+                                   is_backing ? "backing" : "file",
+                                   &child_of_bds, role,
+                                   is_backing ? &parent_bs->backing :
+                                                &parent_bs->file,
+                                   tran, errp);
     if (ret < 0) {
         return ret;
     }
 
 
     /*
-     * If backing_hd was already part of bs's backing chain, and
-     * inherits_from pointed recursively to bs then let's update it to
+     * If inherits_from pointed recursively to bs then let's update it to
      * point directly to bs (else it will become NULL).
      */
     if (update_inherits_from) {
-        bdrv_set_inherits_from(backing_hd, bs, tran);
+        bdrv_set_inherits_from(child_bs, parent_bs, tran);
     }
 
 out:
-    bdrv_refresh_limits(bs, tran, NULL);
+    bdrv_refresh_limits(parent_bs, tran, NULL);
 
     return 0;
 }
 
+static int bdrv_set_backing_noperm(BlockDriverState *bs,
+                                   BlockDriverState *backing_hd,
+                                   Transaction *tran, Error **errp)
+{
+    return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, tran, errp);
+}
+
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                         Error **errp)
 {
-- 
2.31.1


