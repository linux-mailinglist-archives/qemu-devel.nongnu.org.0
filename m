Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67DAF41D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 12:20:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLPsU-0002tF-NM
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 06:20:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hLPpz-0001PR-UM
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 06:18:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hLPgU-0005KA-UV
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 06:08:23 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:60616)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hLPgU-0005J2-Dg; Tue, 30 Apr 2019 06:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:Cc:To:From;
	bh=p/Caes+/jnKIif73dQN9bmBtOkUAHK1lCGA6hIeyb8A=; 
	b=J0WpLSlSF5pA/qSqfmkjoVEl0LMzqfQnqU0nJ3O0oidqrK6fZqB5hIQfVsMpy4IqwMOwl7RbTQbHpVy+euTVirfeBf2NJADEZCIeUd0qEHUlSbGkrshM5e8i1baygfsPyQyPhjGj7Me61aN6bc/E0enycP8pUVAus1nUk/BGB0N1fDeuTv4ImeTge6e8w5I88YPymBiKethbiHMFoZg1DfSW6EOBFEt15R6HujT9LjpILbxikVMpD+A1UJaY4L+5e4IlA1v3Uv8llfzXpt4dC7ICBTO5EJzed0fNh3/L7wbc+/MMGBhmRoQ2HZQlo0kU7E/pDvXh7aZscnBQYzFdYA==;
Received: from 87-92-6-174.bb.dnainternet.fi ([87.92.6.174] helo=perseus.local)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hLPgR-0004wn-Kn; Tue, 30 Apr 2019 12:08:19 +0200
Received: from berto by perseus.local with local (Exim 4.89)
	(envelope-from <berto@igalia.com>)
	id 1hLPgD-00040a-1Y; Tue, 30 Apr 2019 13:08:05 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Apr 2019 13:08:02 +0300
Message-Id: <20190430100802.15368-1-berto@igalia.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: [Qemu-devel] [PATCH] qcow2: Fix error handling in the compression
 code
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
Cc: Kevin Wolf <kwolf@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes a few things in the way error codes are handled in
the qcow2 compression code:

a) qcow2_co_pwritev_compressed() expects qcow2_co_compress() to only
   return -1 or -2 on failure, but this is not correct. Since the
   change from qcow2_compress() to qcow2_co_compress() in commit
   ceb029cd6feccf9f7607 the new code can also return -EINVAL (although
   there does not seem to exist any code path that would cause that
   error in the current implementation).

b) -1 and -2 are ad-hoc error codes defined in qcow2_compress().
   This patch replaces them with standard constants from errno.h.

c) Both qcow2_compress() and qcow2_co_do_compress() return a negative
   value on failure, but qcow2_co_pwritev_compressed() stores the
   value in an unsigned data type.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 3ace3b2209..502a81720a 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3923,8 +3923,8 @@ fail:
  * @src - source buffer, @src_size bytes
  *
  * Returns: compressed size on success
- *          -1 destination buffer is not enough to store compressed data
- *          -2 on any other error
+ *          -ENOMEM destination buffer is not enough to store compressed data
+ *          -EIO    on any other error
  */
 static ssize_t qcow2_compress(void *dest, size_t dest_size,
                               const void *src, size_t src_size)
@@ -3937,7 +3937,7 @@ static ssize_t qcow2_compress(void *dest, size_t dest_size,
     ret = deflateInit2(&strm, Z_DEFAULT_COMPRESSION, Z_DEFLATED,
                        -12, 9, Z_DEFAULT_STRATEGY);
     if (ret != Z_OK) {
-        return -2;
+        return -EIO;
     }
 
     /* strm.next_in is not const in old zlib versions, such as those used on
@@ -3951,7 +3951,7 @@ static ssize_t qcow2_compress(void *dest, size_t dest_size,
     if (ret == Z_STREAM_END) {
         ret = dest_size - strm.avail_out;
     } else {
-        ret = (ret == Z_OK ? -1 : -2);
+        ret = (ret == Z_OK ? -ENOMEM : -EIO);
     }
 
     deflateEnd(&strm);
@@ -4090,7 +4090,7 @@ qcow2_co_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
     BDRVQcow2State *s = bs->opaque;
     QEMUIOVector hd_qiov;
     int ret;
-    size_t out_len;
+    ssize_t out_len;
     uint8_t *buf, *out_buf;
     uint64_t cluster_offset;
 
@@ -4129,16 +4129,16 @@ qcow2_co_pwritev_compressed(BlockDriverState *bs, uint64_t offset,
 
     out_len = qcow2_co_compress(bs, out_buf, s->cluster_size - 1,
                                 buf, s->cluster_size);
-    if (out_len == -2) {
-        ret = -EINVAL;
-        goto fail;
-    } else if (out_len == -1) {
+    if (out_len == -ENOMEM) {
         /* could not compress: write normal cluster */
         ret = qcow2_co_pwritev(bs, offset, bytes, qiov, 0);
         if (ret < 0) {
             goto fail;
         }
         goto success;
+    } else if (out_len < 0) {
+        ret = -EINVAL;
+        goto fail;
     }
 
     qemu_co_mutex_lock(&s->lock);
-- 
2.11.0


