Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F2B43CB97
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:08:25 +0200 (CEST)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjbM-0002JA-Hd
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b565bccb00afe8b73d529bbc3a38682996dac5c7@lizzy.crudebyte.com>)
 id 1mfizr-0006nz-5v
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:29:42 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:33045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <b565bccb00afe8b73d529bbc3a38682996dac5c7@lizzy.crudebyte.com>)
 id 1mfizp-0008GJ-E8
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=JPtML+yKgUmqWHtx9VLt/Ry2pW8G66YfrpM0A9IB40I=; b=IF0nf
 9jlLFsf+RpFYjWl2opQzY0LEKaWXoKeizGCqdxTv76E6uIi3yghQQCoWEL810Z1caw77gCxhCqM1Q
 DPoA3+bOKtpkLEGDYVsLLijrga6hhp1RQazsmhGVqRuzl3MxYGiVUaKhJVqnpXuKFDDy782SAbx+V
 CjEO5cQQ9tXTLPSb1sND4F/hdr7qaFEyPKw0laSI0nk7nGVQvCjN0SP4eU4TDVoTloT90CPA6w8h4
 pRshIvuR26GzEKfef/UWK26vuHj2UpohvZofTaMpUQnO5/Q+UxUUjSb16haVprR7FNVaH2SUXbxUM
 eSjAmL4nB8sa2AYqDg+K/dMyyQcMA==;
Message-Id: <b565bccb00afe8b73d529bbc3a38682996dac5c7.1635340713.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1635340713.git.qemu_oss@crudebyte.com>
References: <cover.1635340713.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 27 Oct 2021 15:18:33 +0200
Subject: [PULL 2/8] 9pfs: deduplicate iounit code
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=b565bccb00afe8b73d529bbc3a38682996dac5c7@lizzy.crudebyte.com;
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
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <129bb71d5119e61d335f1e3107e472e4beea223a.1632758315.git.qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 708b030474..5c57344667 100644
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
@@ -1899,23 +1912,9 @@ out_nofid:
 static int32_t coroutine_fn get_iounit(V9fsPDU *pdu, V9fsPath *path)
 {
     struct statfs stbuf;
-    int32_t iounit = 0;
-    V9fsState *s = pdu->s;
+    int err = v9fs_co_statfs(pdu, path, &stbuf);
 
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
+    return blksize_to_iounit(pdu, (err >= 0) ? stbuf.f_bsize : 0);
 }
 
 static void coroutine_fn v9fs_open(void *opaque)
-- 
2.20.1


