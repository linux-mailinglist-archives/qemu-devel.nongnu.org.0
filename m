Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1293B34D27
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 18:23:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54926 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYCE3-0006Vo-2s
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 12:23:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYC6F-00016V-Td
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 12:15:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1hYC6B-0005gm-7n
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 12:15:45 -0400
Received: from relay.sw.ru ([185.231.240.75]:41646)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1hYC6A-0005Bu-N5; Tue, 04 Jun 2019 12:15:42 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
	by relay.sw.ru with esmtp (Exim 4.91)
	(envelope-from <vsementsov@virtuozzo.com>)
	id 1hYC5j-0005Pq-Ej; Tue, 04 Jun 2019 19:15:15 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue,  4 Jun 2019 19:15:04 +0300
Message-Id: <20190604161514.262241-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190604161514.262241-1-vsementsov@virtuozzo.com>
References: <20190604161514.262241-1-vsementsov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v2 02/12] util/iov: improve qemu_iovec_is_zero
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
	mreitz@redhat.com, stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll need to check a part of qiov soon, so implement it now.

Optimization with align down to 4 * sizeof(long) is dropped due to:
1. It is strange: it aligns length of the buffer, but where is a
   guarantee that buffer pointer is aligned itself?
2. buffer_is_zero() is a better place for optimizations and it has
   them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/qemu/iov.h |  2 +-
 block/io.c         |  2 +-
 util/iov.c         | 31 +++++++++++++++++++------------
 3 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/include/qemu/iov.h b/include/qemu/iov.h
index f3787a0cf7..29957c8a72 100644
--- a/include/qemu/iov.h
+++ b/include/qemu/iov.h
@@ -212,7 +212,7 @@ void qemu_iovec_concat(QEMUIOVector *dst,
 size_t qemu_iovec_concat_iov(QEMUIOVector *dst,
                              struct iovec *src_iov, unsigned int src_cnt,
                              size_t soffset, size_t sbytes);
-bool qemu_iovec_is_zero(QEMUIOVector *qiov);
+bool qemu_iovec_is_zero(QEMUIOVector *qiov, size_t qiov_offeset, size_t bytes);
 void qemu_iovec_destroy(QEMUIOVector *qiov);
 void qemu_iovec_reset(QEMUIOVector *qiov);
 size_t qemu_iovec_to_buf(QEMUIOVector *qiov, size_t offset,
diff --git a/block/io.c b/block/io.c
index 3134a60a48..d02fded3b1 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1651,7 +1651,7 @@ static int coroutine_fn bdrv_aligned_pwritev(BdrvChild *child,
 
     if (!ret && bs->detect_zeroes != BLOCKDEV_DETECT_ZEROES_OPTIONS_OFF &&
         !(flags & BDRV_REQ_ZERO_WRITE) && drv->bdrv_co_pwrite_zeroes &&
-        qemu_iovec_is_zero(qiov)) {
+        qemu_iovec_is_zero(qiov, 0, qiov->size)) {
         flags |= BDRV_REQ_ZERO_WRITE;
         if (bs->detect_zeroes == BLOCKDEV_DETECT_ZEROES_OPTIONS_UNMAP) {
             flags |= BDRV_REQ_MAY_UNMAP;
diff --git a/util/iov.c b/util/iov.c
index 39b6e31494..d988a533ce 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -451,23 +451,30 @@ void qemu_iovec_init_extended(
 }
 
 /*
- * Check if the contents of the iovecs are all zero
+ * Check if the contents of subrange of qiov data is all zeroes.
  */
-bool qemu_iovec_is_zero(QEMUIOVector *qiov)
+bool qemu_iovec_is_zero(QEMUIOVector *qiov, size_t offset, size_t bytes)
 {
-    int i;
-    for (i = 0; i < qiov->niov; i++) {
-        size_t offs = QEMU_ALIGN_DOWN(qiov->iov[i].iov_len, 4 * sizeof(long));
-        uint8_t *ptr = qiov->iov[i].iov_base;
-        if (offs && !buffer_is_zero(qiov->iov[i].iov_base, offs)) {
+    struct iovec *iov;
+    size_t current_offset;
+
+    assert(offset + bytes <= qiov->size);
+
+    iov = iov_skip_offset(qiov->iov, offset, &current_offset);
+
+    while (bytes) {
+        uint8_t *base = (uint8_t *)iov->iov_base + current_offset;
+        size_t len = MIN(iov->iov_len - current_offset, bytes);
+
+        if (!buffer_is_zero(base, len)) {
             return false;
         }
-        for (; offs < qiov->iov[i].iov_len; offs++) {
-            if (ptr[offs]) {
-                return false;
-            }
-        }
+
+        current_offset = 0;
+        bytes -= len;
+        iov++;
     }
+
     return true;
 }
 
-- 
2.18.0


