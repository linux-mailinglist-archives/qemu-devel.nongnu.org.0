Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2DD4198BF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:18:23 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtKg-0008LF-JD
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <129bb71d5119e61d335f1e3107e472e4beea223a@lizzy.crudebyte.com>)
 id 1mUtDW-0001vs-0h
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:10:58 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:47137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <129bb71d5119e61d335f1e3107e472e4beea223a@lizzy.crudebyte.com>)
 id 1mUtDT-0001MS-VS
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 12:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=t9QhMOqIUhpRDAYJ03MNREHt52RPVjDLx5pifFi97hI=; b=VDyuZ
 G3jtwZksUB2ZOo8Hu59NhJYJGxmaVIx1kMRK+6TgUK1P4im6CV82uFZz5kzuSLfC+7v+7G2yXxq/f
 RdWJJV1TkpHEsz5GrU004sw5XSnPIQ6FLE/zwMtgHVyYjlyvER6eRB1tUBV/FoCnEHWbZsnyNI+1O
 YbqLWWa64vkMPc9v+Wl6JtBiCfYNQtc8T61dOg1rD41AlJ92EZ2X2Dd60tCuwppwWSL96pPQ93geX
 KBpyW5ub7pCrtZjcU95lUMlK3j9D0cKsaMkjTZ2GcrUBKMISZ7Ef1dPDpJI4/eCA/nBTM3DtYZRmi
 pIYqjKwWIF5DqXPn4dKvQAUjdQIzg==;
Message-Id: <129bb71d5119e61d335f1e3107e472e4beea223a.1632758315.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1632758315.git.qemu_oss@crudebyte.com>
References: <cover.1632758315.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 27 Sep 2021 17:45:00 +0200
Subject: [PATCH 1/2] 9pfs: deduplicate iounit code
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>,
    Philippe Mathieu-Daudé <philmd@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=129bb71d5119e61d335f1e3107e472e4beea223a@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove redundant code that translates host fileystem's block
size into 9p client (guest side) block size.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 708b030474..c65584173a 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -1262,18 +1262,26 @@ static int coroutine_fn stat_to_v9stat(V9fsPDU *pdu, V9fsPath *path,
 #define P9_STATS_ALL           0x00003fffULL /* Mask for All fields above */
 
 
-static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
+/**
+ * Convert host filesystem's block size into an appropriate block size for
+ * 9p client (guest OS side). The value returned suggests an "optimum" block
+ * size for 9p I/O, i.e. to maximize performance.
+ *
+ * @pdu: 9p client request
+ * @blksize: host filesystem's block size
+ */
+static int32_t blksize_to_iounit(const V9fsPDU *pdu, int32_t blksize)
 {
     int32_t iounit = 0;
     V9fsState *s = pdu->s;
 
     /*
-     * iounit should be multiples of st_blksize (host filesystem block size)
+     * iounit should be multiples of blksize (host filesystem block size)
      * as well as less than (client msize - P9_IOHDRSZ)
      */
-    if (stbuf->st_blksize) {
-        iounit = stbuf->st_blksize;
-        iounit *= (s->msize - P9_IOHDRSZ) / stbuf->st_blksize;
+    if (blksize) {
+        iounit = blksize;
+        iounit *= (s->msize - P9_IOHDRSZ) / blksize;
     }
     if (!iounit) {
         iounit = s->msize - P9_IOHDRSZ;
@@ -1281,6 +1289,11 @@ static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
     return iounit;
 }
 
+static int32_t stat_to_iounit(const V9fsPDU *pdu, const struct stat *stbuf)
+{
+    return blksize_to_iounit(pdu, stbuf->st_blksize);
+}
+
 static int stat_to_v9stat_dotl(V9fsPDU *pdu, const struct stat *stbuf,
                                 V9fsStatDotl *v9lstat)
 {
@@ -1899,23 +1912,8 @@ out_nofid:
 static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
 {
     struct statfs stbuf;
-    int32_t iounit = 0;
-    V9fsState *s = pdu->s;
-
-    /*
-     * iounit should be multiples of f_bsize (host filesystem block size
-     * and as well as less than (client msize - P9_IOHDRSZ))
-     */
-    if (!v9fs_co_statfs(pdu, path, &stbuf)) {
-        if (stbuf.f_bsize) {
-            iounit = stbuf.f_bsize;
-            iounit *= (s->msize - P9_IOHDRSZ) / stbuf.f_bsize;
-        }
-    }
-    if (!iounit) {
-        iounit = s->msize - P9_IOHDRSZ;
-    }
-    return iounit;
+    int err = v9fs_co_statfs(pdu, path, &stbuf);
+    return blksize_to_iounit(pdu, (err >= 0) ? stbuf.f_bsize : 0);
 }
 
 static void coroutine_fn v9fs_open(void *opaque)
-- 
2.20.1


