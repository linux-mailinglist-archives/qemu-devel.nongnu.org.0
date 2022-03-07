Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82DF4CFDCB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:07:07 +0100 (CET)
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRC8o-0002NT-Of
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:07:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAj8-0005AB-C8
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nRAj6-0008Gz-SP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:36:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646649388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eZvbq26MVGxqS7SFMaUlhWFFTXN0Vjdq9fQ8knBlqc=;
 b=VZfbWpyiKgCPFCJvDYBpLXVASFkzCXgHpT/IFvKdmYBonG6BhMTG5fRkGMGCR1IG4MIro0
 pnM99rjq9/V8xRTq1/03l6cVokv5O2ezZ9i5/aGrKQf+rTyU/GDm1iRSVk7n/B8H7AGqR6
 wm81uj22tothuHbUMgpSSvDJYOc04/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-78-HSKUdYgfMV-0e_A5OK_pQQ-1; Mon, 07 Mar 2022 05:36:25 -0500
X-MC-Unique: HSKUdYgfMV-0e_A5OK_pQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 293811006AAC;
 Mon,  7 Mar 2022 10:36:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C11FF7A5C5;
 Mon,  7 Mar 2022 10:36:23 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/23] block/block-copy: block_copy_state_new(): add bitmap
 parameter
Date: Mon,  7 Mar 2022 11:35:36 +0100
Message-Id: <20220307103549.808809-11-hreitz@redhat.com>
In-Reply-To: <20220307103549.808809-1-hreitz@redhat.com>
References: <20220307103549.808809-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This will be used in the following commit to bring "incremental" mode
to copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220303194349.2304213-4-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 14 +++++++++++++-
 block/copy-before-write.c  |  2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 99370fa38b..b80ad02299 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,6 +25,7 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     const BdrvDirtyBitmap *bitmap,
                                      Error **errp);
 
 /* Function should be called prior any actual copy request */
diff --git a/block/block-copy.c b/block/block-copy.c
index abda7a80bd..8aa6ee6a5c 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -384,8 +384,10 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     const BdrvDirtyBitmap *bitmap,
                                      Error **errp)
 {
+    ERRP_GUARD();
     BlockCopyState *s;
     int64_t cluster_size;
     BdrvDirtyBitmap *copy_bitmap;
@@ -402,7 +404,17 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+    if (bitmap) {
+        if (!bdrv_merge_dirty_bitmap(copy_bitmap, bitmap, NULL, errp)) {
+            error_prepend(errp, "Failed to merge bitmap '%s' to internal "
+                          "copy-bitmap: ", bdrv_dirty_bitmap_name(bitmap));
+            bdrv_release_dirty_bitmap(copy_bitmap);
+            return NULL;
+        }
+    } else {
+        bdrv_set_dirty_bitmap(copy_bitmap, 0,
+                              bdrv_dirty_bitmap_size(copy_bitmap));
+    }
 
     /*
      * If source is in backing chain of target assume that target is going to be
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 8ea2548ed9..1af0c7e5c0 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.34.1


