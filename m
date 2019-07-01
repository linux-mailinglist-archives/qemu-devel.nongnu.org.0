Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FCA4319E
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:22:57 +0200 (CEST)
Received: from localhost ([::1]:35454 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBdu-0007Bm-NM
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBS4-0007Tn-S1
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBS3-0007el-Hj
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:10:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43036)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBS0-0007aC-AL; Wed, 12 Jun 2019 18:10:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2FAD52F8BE8;
 Wed, 12 Jun 2019 22:10:35 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B19EE1710F;
 Wed, 12 Jun 2019 22:10:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:09:33 +0200
Message-Id: <20190612221004.2317-12-mreitz@redhat.com>
In-Reply-To: <20190612221004.2317-1-mreitz@redhat.com>
References: <20190612221004.2317-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 12 Jun 2019 22:10:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v5 11/42] block: Add
 bdrv_supports_compressed_writes()
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

Filters cannot compress data themselves but they have to implement
.bdrv_co_pwritev_compressed() still (or they cannot forward compressed
writes).  Therefore, checking whether
bs->drv->bdrv_co_pwritev_compressed is non-NULL is not sufficient to
know whether the node can actually handle compressed writes.  This
function looks down the filter chain to see whether there is a
non-filter that can actually convert the compressed writes into
compressed data (and thus normal writes).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  1 +
 block.c               | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 687c03b275..7835c5b370 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -487,6 +487,7 @@ void bdrv_next_cleanup(BdrvNextIterator *it);
=20
 BlockDriverState *bdrv_next_monitor_owned(BlockDriverState *bs);
 bool bdrv_is_encrypted(BlockDriverState *bs);
+bool bdrv_supports_compressed_writes(BlockDriverState *bs);
 void bdrv_iterate_format(void (*it)(void *opaque, const char *name),
                          void *opaque, bool read_only);
 const char *bdrv_get_node_name(const BlockDriverState *bs);
diff --git a/block.c b/block.c
index 567a0f82c8..97774b7b06 100644
--- a/block.c
+++ b/block.c
@@ -4584,6 +4584,28 @@ bool bdrv_is_encrypted(BlockDriverState *bs)
     return false;
 }
=20
+/**
+ * Return whether the given node supports compressed writes.
+ */
+bool bdrv_supports_compressed_writes(BlockDriverState *bs)
+{
+    BlockDriverState *filtered =3D bdrv_filtered_rw_bs(bs);
+
+    if (!bs->drv || !bs->drv->bdrv_co_pwritev_compressed) {
+        return false;
+    }
+
+    if (filtered) {
+        /*
+         * Filters can only forward compressed writes, so we have to
+         * check the child.
+         */
+        return bdrv_supports_compressed_writes(filtered);
+    }
+
+    return true;
+}
+
 const char *bdrv_get_format_name(BlockDriverState *bs)
 {
     return bs->drv ? bs->drv->format_name : NULL;
--=20
2.21.0


