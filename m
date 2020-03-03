Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED9117773A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 14:35:42 +0100 (CET)
Received: from localhost ([::1]:47312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j97i0-0003tg-V4
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 08:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55647)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j97gy-0002ij-89
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 08:34:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j97gw-0006X3-Jr
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 08:34:35 -0500
Received: from relay.sw.ru ([185.231.240.75]:49930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j97gw-0006Vh-BX; Tue, 03 Mar 2020 08:34:34 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j97go-00057F-0f; Tue, 03 Mar 2020 16:34:26 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/5] block/qcow2-threads: fix qcow2_decompress
Date: Tue,  3 Mar 2020 16:34:21 +0300
Message-Id: <20200303133425.24471-2-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200303133425.24471-1-dplotnikov@virtuozzo.com>
References: <20200303133425.24471-1-dplotnikov@virtuozzo.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 qemu-block@nongnu.org, armbru@redhat.com, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

On success path we return what inflate() returns instead of 0. And it
most probably works for Z_STREAM_END as it is positive, but is
definitely broken for Z_BUF_ERROR.

While being here, switch to errno return code, to be closer to
qcow2_compress API (and usual expectations).

Revert condition in if to be more positive. Drop dead initialization of
ret.

Cc: qemu-stable@nongnu.org # v4.0
Fixes: 341926ab83e2b
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-threads.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
index 77bb578cdf..a68126f291 100644
--- a/block/qcow2-threads.c
+++ b/block/qcow2-threads.c
@@ -128,12 +128,12 @@ static ssize_t qcow2_compress(void *dest, size_t dest_size,
  * @src - source buffer, @src_size bytes
  *
  * Returns: 0 on success
- *          -1 on fail
+ *          -EIO on fail
  */
 static ssize_t qcow2_decompress(void *dest, size_t dest_size,
                                 const void *src, size_t src_size)
 {
-    int ret = 0;
+    int ret;
     z_stream strm;
 
     memset(&strm, 0, sizeof(strm));
@@ -144,17 +144,19 @@ static ssize_t qcow2_decompress(void *dest, size_t dest_size,
 
     ret = inflateInit2(&strm, -12);
     if (ret != Z_OK) {
-        return -1;
+        return -EIO;
     }
 
     ret = inflate(&strm, Z_FINISH);
-    if ((ret != Z_STREAM_END && ret != Z_BUF_ERROR) || strm.avail_out != 0) {
+    if ((ret == Z_STREAM_END || ret == Z_BUF_ERROR) && strm.avail_out == 0) {
         /*
          * We approve Z_BUF_ERROR because we need @dest buffer to be filled, but
          * @src buffer may be processed partly (because in qcow2 we know size of
          * compressed data with precision of one sector)
          */
-        ret = -1;
+        ret = 0;
+    } else {
+        ret = -EIO;
     }
 
     inflateEnd(&strm);
-- 
2.17.0


