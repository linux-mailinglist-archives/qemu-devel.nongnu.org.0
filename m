Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB6651C86
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 09:44:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7YDL-0003JW-Rz; Tue, 20 Dec 2022 03:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p7YDA-0003IU-04
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:42:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p7YD8-0000du-8E
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 03:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671525772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IQTYlT7DKteIN7LPObgobrwFgEFxgjatjVEatFARAE0=;
 b=LvgHJCueFHfsfsFheDdQslHhJGafD9Furx+tQF9bfrhv+/G0wZNL6edACJEM9HdW3OxTKL
 OL5Z9XOiiveJdoYuU6z0h58MvBqaeHQksRi9boPleFB1QmmTFlHlWf3dhLwPYytpco+Z9e
 itP1J5pnu8tgHTrG+UzR/g2ki54eQJw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-l6acZj49OqqQwbBFeq3E4w-1; Tue, 20 Dec 2022 03:42:49 -0500
X-MC-Unique: l6acZj49OqqQwbBFeq3E4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C129B1C08970;
 Tue, 20 Dec 2022 08:42:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B8E839D6D;
 Tue, 20 Dec 2022 08:42:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C719C18000B3; Tue, 20 Dec 2022 09:42:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2] pflash: Only read non-zero parts of backend image
Date: Tue, 20 Dec 2022 09:42:46 +0100
Message-Id: <20221220084246.1984871-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Xiang Zheng <zhengxiang9@huawei.com>

Currently we fill the VIRT_FLASH memory space with two 64MB NOR images
when using persistent UEFI variables on virt board. Actually we only use
a very small(non-zero) part of the memory while the rest significant
large(zero) part of memory is wasted.

So this patch checks the block status and only writes the non-zero part
into memory. This requires pflash devices to use sparse files for
backends.

Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>

[ kraxel: rebased to latest master ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/block/block.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/hw/block/block.c b/hw/block/block.c
index f9c4fe67673b..142ebe4267e4 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -14,6 +14,40 @@
 #include "qapi/error.h"
 #include "qapi/qapi-types-block.h"
 
+/*
+ * Read the non-zeroes parts of @blk into @buf
+ * Reading all of the @blk is expensive if the zeroes parts of @blk
+ * is large enough. Therefore check the block status and only write
+ * the non-zeroes block into @buf.
+ *
+ * Return 0 on success, non-zero on error.
+ */
+static int blk_pread_nonzeroes(BlockBackend *blk, hwaddr size, void *buf)
+{
+    int ret;
+    int64_t bytes, offset = 0;
+    BlockDriverState *bs = blk_bs(blk);
+
+    for (;;) {
+        bytes = MIN(size - offset, BDRV_REQUEST_MAX_SECTORS);
+        if (bytes <= 0) {
+            return 0;
+        }
+        ret = bdrv_block_status(bs, offset, bytes, &bytes, NULL, NULL);
+        if (ret < 0) {
+            return ret;
+        }
+        if (!(ret & BDRV_BLOCK_ZERO)) {
+            ret = bdrv_pread(bs->file, offset, bytes,
+                             (uint8_t *) buf + offset, 0);
+            if (ret < 0) {
+                return ret;
+            }
+        }
+        offset += bytes;
+    }
+}
+
 /*
  * Read the entire contents of @blk into @buf.
  * @blk's contents must be @size bytes, and @size must be at most
@@ -53,7 +87,7 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
      * block device and read only on demand.
      */
     assert(size <= BDRV_REQUEST_MAX_BYTES);
-    ret = blk_pread(blk, 0, size, buf, 0);
+    ret = blk_pread_nonzeroes(blk, size, buf);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "can't read block backend");
         return false;
-- 
2.38.1


