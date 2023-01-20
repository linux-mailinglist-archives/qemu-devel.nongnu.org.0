Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FB675467
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:28:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqTu-0002aM-F2; Fri, 20 Jan 2023 07:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTo-0002R0-EM
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTl-0000Gy-MH
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j3CH6oLgoMZSvXdwH2OLunxeLunxPN5YJK8EBPDGf8E=;
 b=bQrAp9I2s9wpwiwKdiRqnpEifORabKR8QKkBZmh/ESQsW2uyiUFD5tX85V2hOQWTZVPSeB
 n1G7hgRp3m7CmdIYscm6dQFVu/rYbBv/RAz7CyYGStbicwe6f2CO/WI5e8n+RU3AA8nmff
 frbUNn37S9L+9mSC1BYuFeR5R98o91I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-7xhM8ixoN4O3WBUW4sEdjA-1; Fri, 20 Jan 2023 07:26:41 -0500
X-MC-Unique: 7xhM8ixoN4O3WBUW4sEdjA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2EB042801E50;
 Fri, 20 Jan 2023 12:26:41 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6369240C6EC4;
 Fri, 20 Jan 2023 12:26:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 03/38] pflash: Only read non-zero parts of backend image
Date: Fri, 20 Jan 2023 13:25:58 +0100
Message-Id: <20230120122633.84983-4-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Message-Id: <20221220084246.1984871-1-kraxel@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/block.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/hw/block/block.c b/hw/block/block.c
index f9c4fe6767..142ebe4267 100644
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


