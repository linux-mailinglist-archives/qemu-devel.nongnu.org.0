Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9CCE02C2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 13:22:16 +0200 (CEST)
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMsEx-0000MG-0b
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 07:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMsB3-0004AU-Sx
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iMsB2-0007h7-Rg
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 07:18:13 -0400
Received: from relay.sw.ru ([185.231.240.75]:51920)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMsB0-0007dn-2x; Tue, 22 Oct 2019 07:18:10 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iMsAw-0003JX-TA; Tue, 22 Oct 2019 14:18:06 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 5/6] block/block-copy: add memory limit
Date: Tue, 22 Oct 2019 14:18:04 +0300
Message-Id: <20191022111805.3432-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191022111805.3432-1-vsementsov@virtuozzo.com>
References: <20191022111805.3432-1-vsementsov@virtuozzo.com>
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

Currently total allocation for parallel requests to block-copy instance
is unlimited. Let's limit it to 128 MiB.

For now block-copy is used only in backup, so actually we limit total
allocation for backup job.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h | 3 +++
 block/block-copy.c         | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index e2e135ff1b..edcdf0072d 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -16,6 +16,7 @@
 #define BLOCK_COPY_H
 
 #include "block/block.h"
+#include "qemu/co-shared-resource.h"
 
 typedef struct BlockCopyInFlightReq {
     int64_t start_byte;
@@ -69,6 +70,8 @@ typedef struct BlockCopyState {
      */
     ProgressResetCallbackFunc progress_reset_callback;
     void *progress_opaque;
+
+    SharedResource *mem;
 } BlockCopyState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
diff --git a/block/block-copy.c b/block/block-copy.c
index 845b2423dc..7f0ebb58f8 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -21,6 +21,7 @@
 #include "qemu/units.h"
 
 #define BLOCK_COPY_MAX_COPY_RANGE (16 * MiB)
+#define BLOCK_COPY_MAX_MEM (128 * MiB)
 
 static void coroutine_fn block_copy_wait_inflight_reqs(BlockCopyState *s,
                                                        int64_t start,
@@ -64,6 +65,7 @@ void block_copy_state_free(BlockCopyState *s)
     }
 
     bdrv_release_dirty_bitmap(s->copy_bitmap);
+    shres_destroy(s->mem);
     g_free(s);
 }
 
@@ -95,6 +97,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
         .write_flags = write_flags,
+        .mem = shres_create(BLOCK_COPY_MAX_MEM),
     };
 
     s->copy_range_size = QEMU_ALIGN_DOWN(max_transfer, cluster_size),
@@ -313,7 +316,9 @@ int coroutine_fn block_copy(BlockCopyState *s,
 
         bdrv_reset_dirty_bitmap(s->copy_bitmap, start, chunk_end - start);
 
+        co_get_from_shres(s->mem, chunk_end - start);
         ret = block_copy_do_copy(s, start, chunk_end, error_is_read);
+        co_put_to_shres(s->mem, chunk_end - start);
         if (ret < 0) {
             bdrv_set_dirty_bitmap(s->copy_bitmap, start, chunk_end - start);
             break;
-- 
2.21.0


