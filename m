Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C3259122
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 16:46:46 +0200 (CEST)
Received: from localhost ([::1]:37412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD7Yb-0004fX-7B
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 10:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7Mt-00072h-Kx
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:34:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30412
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kD7Mp-000739-JF
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 10:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598970874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZMCvRr/gr8uIS8CUb7UrY9RH9CHCEaAuADxPZ35rAg=;
 b=dLqKsv4VR7RQNhoieJ+2chbPYg7EPnePV41LpxXXRtOpvLTAu+IH9Les+/PV6JYTPu0n9w
 lZx6bY0gGnKdgNx0VVCHCokIXcgQaALYHrwKJv1psVRhVZtRmBuw9cs4J+tNbvyNBWOTaS
 utgdyopjeZgEFQdX+4+KmSVq2XImZJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-IOe6QSMFOESfF5d_XyASGg-1; Tue, 01 Sep 2020 10:34:32 -0400
X-MC-Unique: IOe6QSMFOESfF5d_XyASGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8649A1015C98;
 Tue,  1 Sep 2020 14:34:31 +0000 (UTC)
Received: from localhost (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29E5A5C1A3;
 Tue,  1 Sep 2020 14:34:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 02/43] block: Add chain helper functions
Date: Tue,  1 Sep 2020 16:33:43 +0200
Message-Id: <20200901143424.884735-3-mreitz@redhat.com>
In-Reply-To: <20200901143424.884735-1-mreitz@redhat.com>
References: <20200901143424.884735-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 05:11:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some helper functions for skipping filters in a chain of block
nodes.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h |  3 ++
 block.c                   | 62 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index f280a95b26..8205ccaa62 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1394,6 +1394,9 @@ BdrvChild *bdrv_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_or_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_primary_child(BlockDriverState *bs);
+BlockDriverState *bdrv_skip_implicit_filters(BlockDriverState *bs);
+BlockDriverState *bdrv_skip_filters(BlockDriverState *bs);
+BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs);
 
 static inline BlockDriverState *child_bs(BdrvChild *child)
 {
diff --git a/block.c b/block.c
index 9f866e8676..b162142609 100644
--- a/block.c
+++ b/block.c
@@ -7034,3 +7034,65 @@ BdrvChild *bdrv_primary_child(BlockDriverState *bs)
 
     return found;
 }
+
+static BlockDriverState *bdrv_do_skip_filters(BlockDriverState *bs,
+                                              bool stop_on_explicit_filter)
+{
+    BdrvChild *c;
+
+    if (!bs) {
+        return NULL;
+    }
+
+    while (!(stop_on_explicit_filter && !bs->implicit)) {
+        c = bdrv_filter_child(bs);
+        if (!c) {
+            /*
+             * A filter that is embedded in a working block graph must
+             * have a child.  Assert this here so this function does
+             * not return a filter node that is not expected by the
+             * caller.
+             */
+            assert(!bs->drv || !bs->drv->is_filter);
+            break;
+        }
+        bs = c->bs;
+    }
+    /*
+     * Note that this treats nodes with bs->drv == NULL as not being
+     * filters (bs->drv == NULL should be replaced by something else
+     * anyway).
+     * The advantage of this behavior is that this function will thus
+     * always return a non-NULL value (given a non-NULL @bs).
+     */
+
+    return bs;
+}
+
+/*
+ * Return the first BDS that has not been added implicitly or that
+ * does not have a filtered child down the chain starting from @bs
+ * (including @bs itself).
+ */
+BlockDriverState *bdrv_skip_implicit_filters(BlockDriverState *bs)
+{
+    return bdrv_do_skip_filters(bs, true);
+}
+
+/*
+ * Return the first BDS that does not have a filtered child down the
+ * chain starting from @bs (including @bs itself).
+ */
+BlockDriverState *bdrv_skip_filters(BlockDriverState *bs)
+{
+    return bdrv_do_skip_filters(bs, false);
+}
+
+/*
+ * For a backing chain, return the first non-filter backing image of
+ * the first non-filter image.
+ */
+BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs)
+{
+    return bdrv_skip_filters(bdrv_cow_bs(bdrv_skip_filters(bs)));
+}
-- 
2.26.2


