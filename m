Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC434D9854
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 19:11:38 +0200 (CEST)
Received: from localhost ([::1]:46003 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKmpl-0007zO-T1
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 13:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iKmnb-0005y0-V3
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 13:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iKmna-0003UN-1W
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 13:09:23 -0400
Received: from relay.sw.ru ([185.231.240.75]:52720)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iKmnS-0003Pc-Ar; Wed, 16 Oct 2019 13:09:15 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iKmnL-0002PI-Hz; Wed, 16 Oct 2019 20:09:08 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/6] block/block-copy: limit copy_range_size to 16 MiB
Date: Wed, 16 Oct 2019 20:09:01 +0300
Message-Id: <20191016170905.8325-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016170905.8325-1-vsementsov@virtuozzo.com>
References: <20191016170905.8325-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Large copy range may imply memory allocation and large io effort, so
using 2G copy range request may be bad idea. Let's limit it to 16 MiB.
It also helps the following patch to refactor copy-with-offload
fallback to copy-with-bounce-buffer.

Note, that total memory usage of backup is still not limited, it will
be fixed in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 22b0bd7d07..e37dfbfd03 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -18,6 +18,9 @@
 #include "qapi/error.h"
 #include "block/block-copy.h"
 #include "sysemu/block-backend.h"
+#include "qemu/units.h"
+
+#define BLOCK_COPY_MAX_COPY_RANGE (16 * MiB)
 
 static void coroutine_fn block_copy_wait_inflight_reqs(BlockCopyState *s,
                                                        int64_t start,
@@ -70,9 +73,12 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
 {
     BlockCopyState *s;
     BdrvDirtyBitmap *copy_bitmap;
+
+    /* Ignore BLOCK_COPY_MAX_COPY_RANGE if requested cluster_size is larger */
     uint32_t max_transfer =
-            MIN_NON_ZERO(INT_MAX, MIN_NON_ZERO(source->bs->bl.max_transfer,
-                                               target->bs->bl.max_transfer));
+            MIN_NON_ZERO(MAX(cluster_size, BLOCK_COPY_MAX_COPY_RANGE),
+                         MIN_NON_ZERO(source->bs->bl.max_transfer,
+                                      target->bs->bl.max_transfer));
 
     copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
                                            errp);
-- 
2.21.0


