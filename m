Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE392572240
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 20:14:15 +0200 (CEST)
Received: from localhost ([::1]:57122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBKOl-0007WN-2L
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 14:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHd-0003Lo-LA
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBKHU-0006b7-Li
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 14:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657649204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1Utg6ktaknw0CCOWBGjYxrRK+HJQOlWCMDst4dm5s4=;
 b=RhiuzMcTGnIDdejKePKZOK+2UeZrhN1Y4+LIo/3u090L+X8vDC6mGWZPOmuN8rOkIXwJJp
 hWQS0ZkSFzdaz5GoHC9ZsvkcvhiD9GY+9GU0x0FfJZi1wN/y6VDboFsEjN9Yp3S3EVlZMN
 s88eNI9/KL1FwZNpoqtVwqcCyj3m3Ac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-1z0gYxiDPeiABqaDxMhYyQ-1; Tue, 12 Jul 2022 14:06:42 -0400
X-MC-Unique: 1z0gYxiDPeiABqaDxMhYyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71DDF801755;
 Tue, 12 Jul 2022 18:06:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F9521121314;
 Tue, 12 Jul 2022 18:06:41 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PULL 13/35] block: Make blk_{pread,pwrite}() return 0 on success
Date: Tue, 12 Jul 2022 20:05:55 +0200
Message-Id: <20220712180617.1362407-14-hreitz@redhat.com>
In-Reply-To: <20220712180617.1362407-1-hreitz@redhat.com>
References: <20220712180617.1362407-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Faria <afaria@redhat.com>

They currently return the value of their 'bytes' parameter on success.

Make them return 0 instead, for consistency with other I/O functions and
in preparation to implement them using generated_co_wrapper. This also
makes it clear that short reads/writes are not possible.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Message-Id: <20220705161527.1054072-2-afaria@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c                          |  8 +++++---
 block/block-backend.c            |  7 ++-----
 block/qcow.c                     |  6 +++---
 hw/block/m25p80.c                |  2 +-
 hw/misc/mac_via.c                |  4 ++--
 hw/misc/sifive_u_otp.c           |  2 +-
 hw/nvram/eeprom_at24c.c          |  8 ++++----
 hw/nvram/spapr_nvram.c           | 14 +++++++-------
 hw/ppc/pnv_pnor.c                |  2 +-
 qemu-img.c                       | 25 +++++++++----------------
 qemu-io-cmds.c                   | 18 ++++++++++++------
 tests/unit/test-block-iothread.c |  4 ++--
 12 files changed, 49 insertions(+), 51 deletions(-)

diff --git a/block.c b/block.c
index 2c00dddd80..0fd830e2e2 100644
--- a/block.c
+++ b/block.c
@@ -1045,14 +1045,16 @@ static int find_image_format(BlockBackend *file, const char *filename,
         return ret;
     }
 
-    drv = bdrv_probe_all(buf, ret, filename);
+    drv = bdrv_probe_all(buf, sizeof(buf), filename);
     if (!drv) {
         error_setg(errp, "Could not determine image format: No compatible "
                    "driver found");
-        ret = -ENOENT;
+        *pdrv = NULL;
+        return -ENOENT;
     }
+
     *pdrv = drv;
-    return ret;
+    return 0;
 }
 
 /**
diff --git a/block/block-backend.c b/block/block-backend.c
index f425b00793..4c5e130615 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1573,19 +1573,16 @@ int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes)
     ret = blk_do_preadv(blk, offset, bytes, &qiov, 0);
     blk_dec_in_flight(blk);
 
-    return ret < 0 ? ret : bytes;
+    return ret;
 }
 
 int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
                BdrvRequestFlags flags)
 {
-    int ret;
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_OR_GS_CODE();
 
-    ret = blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
-
-    return ret < 0 ? ret : bytes;
+    return blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
 }
 
 int64_t blk_getlength(BlockBackend *blk)
diff --git a/block/qcow.c b/block/qcow.c
index c646d6b16d..25a43353c1 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -891,14 +891,14 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
 
     /* write all the data */
     ret = blk_pwrite(qcow_blk, 0, &header, sizeof(header), 0);
-    if (ret != sizeof(header)) {
+    if (ret < 0) {
         goto exit;
     }
 
     if (qcow_opts->has_backing_file) {
         ret = blk_pwrite(qcow_blk, sizeof(header),
                          qcow_opts->backing_file, backing_filename_len, 0);
-        if (ret != backing_filename_len) {
+        if (ret < 0) {
             goto exit;
         }
     }
@@ -908,7 +908,7 @@ static int coroutine_fn qcow_co_create(BlockdevCreateOptions *opts,
          i++) {
         ret = blk_pwrite(qcow_blk, header_size + BDRV_SECTOR_SIZE * i,
                          tmp, BDRV_SECTOR_SIZE, 0);
-        if (ret != BDRV_SECTOR_SIZE) {
+        if (ret < 0) {
             g_free(tmp);
             goto exit;
         }
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 3045dda53b..755134313d 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1532,7 +1532,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
         trace_m25p80_binding(s);
         s->storage = blk_blockalign(s->blk, s->size);
 
-        if (blk_pread(s->blk, 0, s->storage, s->size) != s->size) {
+        if (blk_pread(s->blk, 0, s->storage, s->size) < 0) {
             error_setg(errp, "failed to read the initial flash content");
             return;
         }
diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 525e38ce93..c32325dcaf 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -1029,8 +1029,8 @@ static void mos6522_q800_via1_realize(DeviceState *dev, Error **errp)
             return;
         }
 
-        len = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM));
-        if (len != sizeof(v1s->PRAM)) {
+        ret = blk_pread(v1s->blk, 0, v1s->PRAM, sizeof(v1s->PRAM));
+        if (ret < 0) {
             error_setg(errp, "can't read PRAM contents");
             return;
         }
diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 6d5f84e6c2..535acde08b 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -240,7 +240,7 @@ static void sifive_u_otp_realize(DeviceState *dev, Error **errp)
                 return;
             }
 
-            if (blk_pread(s->blk, 0, s->fuse, filesize) != filesize) {
+            if (blk_pread(s->blk, 0, s->fuse, filesize) < 0) {
                 error_setg(errp, "failed to read the initial flash content");
                 return;
             }
diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index d695f6ae89..8fd9f97eee 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -64,8 +64,8 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
     case I2C_START_RECV:
         DPRINTK("clear\n");
         if (ee->blk && ee->changed) {
-            int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
-            if (len != ee->rsize) {
+            int ret = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
+            if (ret < 0) {
                 ERR(TYPE_AT24C_EE
                         " : failed to write backing file\n");
             }
@@ -165,9 +165,9 @@ void at24c_eeprom_reset(DeviceState *state)
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->blk) {
-        int len = blk_pread(ee->blk, 0, ee->mem, ee->rsize);
+        int ret = blk_pread(ee->blk, 0, ee->mem, ee->rsize);
 
-        if (len != ee->rsize) {
+        if (ret < 0) {
             ERR(TYPE_AT24C_EE
                     " : Failed initial sync with backing file\n");
         }
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index 18b43be7f6..59d2e7b705 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -103,7 +103,7 @@ static void rtas_nvram_store(PowerPCCPU *cpu, SpaprMachineState *spapr,
 {
     SpaprNvram *nvram = spapr->nvram;
     hwaddr offset, buffer, len;
-    int alen;
+    int ret;
     void *membuf;
 
     if ((nargs != 3) || (nret != 2)) {
@@ -128,9 +128,9 @@ static void rtas_nvram_store(PowerPCCPU *cpu, SpaprMachineState *spapr,
 
     membuf = cpu_physical_memory_map(buffer, &len, false);
 
-    alen = len;
+    ret = 0;
     if (nvram->blk) {
-        alen = blk_pwrite(nvram->blk, offset, membuf, len, 0);
+        ret = blk_pwrite(nvram->blk, offset, membuf, len, 0);
     }
 
     assert(nvram->buf);
@@ -138,8 +138,8 @@ static void rtas_nvram_store(PowerPCCPU *cpu, SpaprMachineState *spapr,
 
     cpu_physical_memory_unmap(membuf, len, 0, len);
 
-    rtas_st(rets, 0, (alen < len) ? RTAS_OUT_HW_ERROR : RTAS_OUT_SUCCESS);
-    rtas_st(rets, 1, (alen < 0) ? 0 : alen);
+    rtas_st(rets, 0, (ret < 0) ? RTAS_OUT_HW_ERROR : RTAS_OUT_SUCCESS);
+    rtas_st(rets, 1, (ret < 0) ? 0 : len);
 }
 
 static void spapr_nvram_realize(SpaprVioDevice *dev, Error **errp)
@@ -179,9 +179,9 @@ static void spapr_nvram_realize(SpaprVioDevice *dev, Error **errp)
     }
 
     if (nvram->blk) {
-        int alen = blk_pread(nvram->blk, 0, nvram->buf, nvram->size);
+        ret = blk_pread(nvram->blk, 0, nvram->buf, nvram->size);
 
-        if (alen != nvram->size) {
+        if (ret < 0) {
             error_setg(errp, "can't read spapr-nvram contents");
             return;
         }
diff --git a/hw/ppc/pnv_pnor.c b/hw/ppc/pnv_pnor.c
index 83ecccca28..1fb748afef 100644
--- a/hw/ppc/pnv_pnor.c
+++ b/hw/ppc/pnv_pnor.c
@@ -99,7 +99,7 @@ static void pnv_pnor_realize(DeviceState *dev, Error **errp)
 
         s->storage = blk_blockalign(s->blk, s->size);
 
-        if (blk_pread(s->blk, 0, s->storage, s->size) != s->size) {
+        if (blk_pread(s->blk, 0, s->storage, s->size) < 0) {
             error_setg(errp, "failed to read the initial flash content");
             return;
         }
diff --git a/qemu-img.c b/qemu-img.c
index 4cf4d2423d..2dc07e5ac3 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -5120,30 +5120,23 @@ static int img_dd(int argc, char **argv)
     in.buf = g_new(uint8_t, in.bsz);
 
     for (out_pos = 0; in_pos < size; block_count++) {
-        int in_ret, out_ret;
+        int bytes = (in_pos + in.bsz > size) ? size - in_pos : in.bsz;
 
-        if (in_pos + in.bsz > size) {
-            in_ret = blk_pread(blk1, in_pos, in.buf, size - in_pos);
-        } else {
-            in_ret = blk_pread(blk1, in_pos, in.buf, in.bsz);
-        }
-        if (in_ret < 0) {
+        ret = blk_pread(blk1, in_pos, in.buf, bytes);
+        if (ret < 0) {
             error_report("error while reading from input image file: %s",
-                         strerror(-in_ret));
-            ret = -1;
+                         strerror(-ret));
             goto out;
         }
-        in_pos += in_ret;
+        in_pos += bytes;
 
-        out_ret = blk_pwrite(blk2, out_pos, in.buf, in_ret, 0);
-
-        if (out_ret < 0) {
+        ret = blk_pwrite(blk2, out_pos, in.buf, bytes, 0);
+        if (ret < 0) {
             error_report("error while writing to output image file: %s",
-                         strerror(-out_ret));
-            ret = -1;
+                         strerror(-ret));
             goto out;
         }
-        out_pos += out_ret;
+        out_pos += bytes;
     }
 
 out:
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 2f0d8ac25a..443f22c732 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -541,28 +541,34 @@ fail:
 static int do_pread(BlockBackend *blk, char *buf, int64_t offset,
                     int64_t bytes, int64_t *total)
 {
+    int ret;
+
     if (bytes > INT_MAX) {
         return -ERANGE;
     }
 
-    *total = blk_pread(blk, offset, (uint8_t *)buf, bytes);
-    if (*total < 0) {
-        return *total;
+    ret = blk_pread(blk, offset, (uint8_t *)buf, bytes);
+    if (ret < 0) {
+        return ret;
     }
+    *total = bytes;
     return 1;
 }
 
 static int do_pwrite(BlockBackend *blk, char *buf, int64_t offset,
                      int64_t bytes, int flags, int64_t *total)
 {
+    int ret;
+
     if (bytes > INT_MAX) {
         return -ERANGE;
     }
 
-    *total = blk_pwrite(blk, offset, (uint8_t *)buf, bytes, flags);
-    if (*total < 0) {
-        return *total;
+    ret = blk_pwrite(blk, offset, (uint8_t *)buf, bytes, flags);
+    if (ret < 0) {
+        return ret;
     }
+    *total = bytes;
     return 1;
 }
 
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index a5c163af7e..3c1a3f64a2 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -117,7 +117,7 @@ static void test_sync_op_blk_pread(BlockBackend *blk)
 
     /* Success */
     ret = blk_pread(blk, 0, buf, sizeof(buf));
-    g_assert_cmpint(ret, ==, 512);
+    g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
     ret = blk_pread(blk, -2, buf, sizeof(buf));
@@ -131,7 +131,7 @@ static void test_sync_op_blk_pwrite(BlockBackend *blk)
 
     /* Success */
     ret = blk_pwrite(blk, 0, buf, sizeof(buf), 0);
-    g_assert_cmpint(ret, ==, 512);
+    g_assert_cmpint(ret, ==, 0);
 
     /* Early error: Negative offset */
     ret = blk_pwrite(blk, -2, buf, sizeof(buf), 0);
-- 
2.35.3


