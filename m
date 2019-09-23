Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DCDBB3A7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 14:26:47 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCNQT-0004rn-R1
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 08:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anton.nefedov@virtuozzo.com>) id 1iCNIF-0006tk-SP
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:18:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anton.nefedov@virtuozzo.com>) id 1iCNID-0001nE-Ab
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 08:18:15 -0400
Received: from relay.sw.ru ([185.231.240.75]:59158)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <anton.nefedov@virtuozzo.com>)
 id 1iCNI7-0001iF-6P; Mon, 23 Sep 2019 08:18:07 -0400
Received: from [172.16.25.154] (helo=xantnef-ws.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <anton.nefedov@virtuozzo.com>)
 id 1iCNI5-0007xx-OV; Mon, 23 Sep 2019 15:18:05 +0300
From: Anton Nefedov <anton.nefedov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v10 8/9] file-posix: account discard operations
Date: Mon, 23 Sep 2019 15:17:36 +0300
Message-Id: <20190923121737.83281-9-anton.nefedov@virtuozzo.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923121737.83281-1-anton.nefedov@virtuozzo.com>
References: <20190923121737.83281-1-anton.nefedov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 den@virtuozzo.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 Anton Nefedov <anton.nefedov@virtuozzo.com>, pbonzini@redhat.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will help to identify how many of the user-issued discard operations
(accounted on a device level) have actually suceeded down on the host file
(even though the numbers will not be exactly the same if non-raw format
driver is used (e.g. qcow2 sending metadata discards)).

Note that these numbers will not include discards triggered by
write-zeroes + MAY_UNMAP calls.

Signed-off-by: Anton Nefedov <anton.nefedov@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/file-posix.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index f12c06de2d..f3934c4e10 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -161,6 +161,11 @@ typedef struct BDRVRawState {
     bool needs_alignment;
     bool drop_cache;
     bool check_cache_dropped;
+    struct {
+        uint64_t discard_nb_ok;
+        uint64_t discard_nb_failed;
+        uint64_t discard_bytes_ok;
+    } stats;
 
     PRManager *pr_mgr;
 } BDRVRawState;
@@ -2660,11 +2665,22 @@ static void coroutine_fn raw_co_invalidate_cache(BlockDriverState *bs,
 #endif /* !__linux__ */
 }
 
+static void raw_account_discard(BDRVRawState *s, uint64_t nbytes, int ret)
+{
+    if (ret) {
+        s->stats.discard_nb_failed++;
+    } else {
+        s->stats.discard_nb_ok++;
+        s->stats.discard_bytes_ok += nbytes;
+    }
+}
+
 static coroutine_fn int
 raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
 {
     BDRVRawState *s = bs->opaque;
     RawPosixAIOData acb;
+    int ret;
 
     acb = (RawPosixAIOData) {
         .bs             = bs,
@@ -2678,7 +2694,9 @@ raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int bytes, bool blkdev)
         acb.aio_type |= QEMU_AIO_BLKDEV;
     }
 
-    return raw_thread_pool_submit(bs, handle_aiocb_discard, &acb);
+    ret = raw_thread_pool_submit(bs, handle_aiocb_discard, &acb);
+    raw_account_discard(s, bytes, ret);
+    return ret;
 }
 
 static coroutine_fn int
@@ -3301,10 +3319,12 @@ static int fd_open(BlockDriverState *bs)
 static coroutine_fn int
 hdev_co_pdiscard(BlockDriverState *bs, int64_t offset, int bytes)
 {
+    BDRVRawState *s = bs->opaque;
     int ret;
 
     ret = fd_open(bs);
     if (ret < 0) {
+        raw_account_discard(s, bytes, ret);
         return ret;
     }
     return raw_do_pdiscard(bs, offset, bytes, true);
-- 
2.17.1


