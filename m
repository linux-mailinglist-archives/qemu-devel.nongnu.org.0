Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7888A6B0FDC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:09:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx82-0004Fm-TL; Wed, 08 Mar 2023 11:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx80-0004EZ-7N; Wed, 08 Mar 2023 11:59:00 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7y-000417-P8; Wed, 08 Mar 2023 11:58:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5E17C400F0;
 Wed,  8 Mar 2023 19:58:21 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 27CFC203;
 Wed,  8 Mar 2023 19:58:20 +0300 (MSK)
Received: (nullmailer pid 2098288 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Czenczek <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 18/47] qcow2: Fix theoretical corruption in store_bitmap()
 error path
Date: Wed,  8 Mar 2023 19:57:21 +0300
Message-Id: <20230308165815.2098148-18-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kevin Wolf <kwolf@redhat.com>

In order to write the bitmap table to the image file, it is converted to
big endian. If the write fails, it is passed to clear_bitmap_table() to
free all of the clusters it had allocated before. However, if we don't
convert it back to native endianness first, we'll free things at a wrong
offset.

In practical terms, the offsets will be so high that we won't actually
free any allocated clusters, but just run into an error, but in theory
this can cause image corruption.

Cc: qemu-stable@nongnu.org
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230112191454.169353-2-kwolf@redhat.com>
Reviewed-by: Hanna Czenczek <hreitz@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
(cherry picked from commit b03dd9613bcf8fe948581b2b3585510cb525c382)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/qcow2-bitmap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index bcad567c0c..3dff99ba06 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -115,7 +115,7 @@ static int update_header_sync(BlockDriverState *bs)
     return bdrv_flush(bs->file->bs);
 }
 
-static inline void bitmap_table_to_be(uint64_t *bitmap_table, size_t size)
+static inline void bitmap_table_bswap_be(uint64_t *bitmap_table, size_t size)
 {
     size_t i;
 
@@ -1401,9 +1401,10 @@ static int store_bitmap(BlockDriverState *bs, Qcow2Bitmap *bm, Error **errp)
         goto fail;
     }
 
-    bitmap_table_to_be(tb, tb_size);
+    bitmap_table_bswap_be(tb, tb_size);
     ret = bdrv_pwrite(bs->file, tb_offset, tb_size * sizeof(tb[0]), tb, 0);
     if (ret < 0) {
+        bitmap_table_bswap_be(tb, tb_size);
         error_setg_errno(errp, -ret, "Failed to write bitmap '%s' to file",
                          bm_name);
         goto fail;
-- 
2.30.2


