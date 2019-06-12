Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00057431A7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:28:05 +0200 (CEST)
Received: from localhost ([::1]:35502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBiv-0005Bt-5K
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBRw-0007Iq-88
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBRu-0007WS-E0
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40826)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBRm-0007QJ-DF; Wed, 12 Jun 2019 18:10:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 07DBC7FDFF;
 Wed, 12 Jun 2019 22:10:20 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B8131001B0F;
 Wed, 12 Jun 2019 22:10:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:27 +0200
Message-Id: <20190612221004.2317-6-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 12 Jun 2019 22:10:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 05/42] block: Add chain helper functions
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some helper functions for skipping filters in a chain of block
nodes.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h |  3 +++
 block.c                   | 55 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 7ce71623f8..875a33f255 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1264,6 +1264,9 @@ BdrvChild *bdrv_filtered_child(BlockDriverState *bs=
);
 BdrvChild *bdrv_metadata_child(BlockDriverState *bs);
 BdrvChild *bdrv_storage_child(BlockDriverState *bs);
 BdrvChild *bdrv_primary_child(BlockDriverState *bs);
+BlockDriverState *bdrv_skip_implicit_filters(BlockDriverState *bs);
+BlockDriverState *bdrv_skip_rw_filters(BlockDriverState *bs);
+BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs);
=20
 static inline BlockDriverState *child_bs(BdrvChild *child)
 {
diff --git a/block.c b/block.c
index 724d8889a6..be18130944 100644
--- a/block.c
+++ b/block.c
@@ -6494,3 +6494,58 @@ BdrvChild *bdrv_primary_child(BlockDriverState *bs=
)
 {
     return bdrv_filtered_rw_child(bs) ?: bs->file;
 }
+
+static BlockDriverState *bdrv_skip_filters(BlockDriverState *bs,
+                                           bool stop_on_explicit_filter)
+{
+    BdrvChild *filtered;
+
+    if (!bs) {
+        return NULL;
+    }
+
+    while (!(stop_on_explicit_filter && !bs->implicit)) {
+        filtered =3D bdrv_filtered_rw_child(bs);
+        if (!filtered) {
+            break;
+        }
+        bs =3D filtered->bs;
+    }
+    /*
+     * Note that this treats nodes with bs->drv =3D=3D NULL as not being
+     * R/W filters (bs->drv =3D=3D NULL should be replaced by something
+     * else anyway).
+     * The advantage of this behavior is that this function will thus
+     * always return a non-NULL value (given a non-NULL @bs).
+     */
+
+    return bs;
+}
+
+/*
+ * Return the first BDS that has not been added implicitly or that
+ * does not have an RW-filtered child down the chain starting from @bs
+ * (including @bs itself).
+ */
+BlockDriverState *bdrv_skip_implicit_filters(BlockDriverState *bs)
+{
+    return bdrv_skip_filters(bs, true);
+}
+
+/*
+ * Return the first BDS that does not have an RW-filtered child down
+ * the chain starting from @bs (including @bs itself).
+ */
+BlockDriverState *bdrv_skip_rw_filters(BlockDriverState *bs)
+{
+    return bdrv_skip_filters(bs, false);
+}
+
+/*
+ * For a backing chain, return the first non-filter backing image of
+ * the first non-filter image.
+ */
+BlockDriverState *bdrv_backing_chain_next(BlockDriverState *bs)
+{
+    return bdrv_skip_rw_filters(bdrv_filtered_cow_bs(bdrv_skip_rw_filter=
s(bs)));
+}
--=20
2.21.0


