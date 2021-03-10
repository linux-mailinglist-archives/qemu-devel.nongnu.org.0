Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148F334524
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:31:14 +0100 (CET)
Received: from localhost ([::1]:35898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2fx-0005p0-3E
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:31:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2HQ-0004hw-4B
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:05:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2HJ-0008UQ-Ux
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0XsNDgI0CDlEbZP3vlZQ/DMh7G89YHXSewtt1cAdSI=;
 b=VBcC9jfWCOqXxlAjw+DxPhZvpMVCAyYgb1AvyLwyFTrhexrRsTCPt23Nwrz06j4UweLrzI
 8lTM+rnVlyksmyY5biyJU40tkx+pC5qnt0/+nfCFttLWYJnzlh/2yzzO+DMUa7wsQaHg30
 uSpcdpNeW1jWgOBkgcWeiDxnb89HxOs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-xNWlWWbpNu6n0KCl2QhMwA-1; Wed, 10 Mar 2021 12:05:43 -0500
X-MC-Unique: xNWlWWbpNu6n0KCl2QhMwA-1
Received: by mail-ej1-f72.google.com with SMTP id gv58so7490721ejc.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s0XsNDgI0CDlEbZP3vlZQ/DMh7G89YHXSewtt1cAdSI=;
 b=Jy4KaBTk9TRBgFbFTi4qkJ5qqX3mWPeyIM9wEB3Owa83XjmoPUVDZVuelVyjGq5CxY
 aJvRRNYNVfW1IotqOEDtv7fjftxUJ/ad+bqcRgXIMzdAY/IZC6TBRIGQrpsbhv4SwbPZ
 2/6T60a+MPVA59rVCiMTP4nnWpJ60UqLbNlSZyiSy9IQOeXiDg9SkimQwL5vfC8B+LnK
 /CuygKhbwmmiuF8QK26UNgb4fk8Ckfuk6A7Dyld6Y72jTk4erCvfZliuiJRTbvzKagW+
 SPum+wKqswVjk3i7DulRGUbOWvtXxTmiBxgLpf/GxFgnUAGx8CY2pcrnlGy+Hrx3QDoE
 2o6w==
X-Gm-Message-State: AOAM533R581nJy/+M3GCXHmAkvT8POYDA9XBiH1KQN49oGYdnLtWz5lX
 mXyHSXDPoUS0VJB9i8D5EmN0iIma39E86PDprV6N8JzawYaADKC4vxEQegLmfnJSu19cjRPvFaW
 PrwSR4zaujCyLfkuOZrYp9Ygt4J6fgZ9yILxF54WjqhMOVY+uth9FdvCZwKJtK/2X
X-Received: by 2002:a17:906:4150:: with SMTP id
 l16mr4820220ejk.90.1615395941596; 
 Wed, 10 Mar 2021 09:05:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCdYgOOtn6sbnynnldYDbeZlnSg126+PI4KNMQHyBsLpnjgo6YNRnRqHGXmmrf6FgiaAwUiw==
X-Received: by 2002:a17:906:4150:: with SMTP id
 l16mr4820191ejk.90.1615395941342; 
 Wed, 10 Mar 2021 09:05:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id de17sm41418ejc.16.2021.03.10.09.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:05:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] hw/block/pflash_cfi01: Extract
 pflash_cfi01_fill_cfi_table()
Date: Wed, 10 Mar 2021 18:05:18 +0100
Message-Id: <20210310170528.1184868-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310170528.1184868-1-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill the CFI table in out of DeviceRealize() in a new function:
pflash_cfi01_fill_cfi_table().

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 140 +++++++++++++++++++++-------------------
 1 file changed, 73 insertions(+), 67 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index b6919bbe474..03472ea5b64 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -704,30 +704,11 @@ static const MemoryRegionOps pflash_cfi01_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
+static void pflash_cfi01_fill_cfi_table(PFlashCFI01 *pfl)
 {
-    ERRP_GUARD();
-    PFlashCFI01 *pfl = PFLASH_CFI01(dev);
-    uint64_t total_len;
-    int ret;
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
 
-    if (pfl->sector_len == 0) {
-        error_setg(errp, "attribute \"sector-length\" not specified or zero.");
-        return;
-    }
-    if (pfl->nb_blocs == 0) {
-        error_setg(errp, "attribute \"num-blocks\" not specified or zero.");
-        return;
-    }
-    if (pfl->name == NULL) {
-        error_setg(errp, "attribute \"name\" not specified.");
-        return;
-    }
-
-    total_len = pfl->sector_len * pfl->nb_blocs;
-
     /*
      * These are only used to expose the parameters of each device
      * in the cfi_table[].
@@ -742,53 +723,6 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     }
     device_len = sector_len_per_device * blocks_per_device;
 
-    memory_region_init_rom_device(
-        &pfl->mem, OBJECT(dev),
-        &pflash_cfi01_ops,
-        pfl,
-        pfl->name, total_len, errp);
-    if (*errp) {
-        return;
-    }
-
-    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
-
-    if (pfl->blk) {
-        uint64_t perm;
-        pfl->ro = !blk_supports_write_perm(pfl->blk);
-        perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
-        ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
-        if (ret < 0) {
-            return;
-        }
-    } else {
-        pfl->ro = 0;
-    }
-
-    if (pfl->blk) {
-        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
-                                         errp)) {
-            vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
-            return;
-        }
-    }
-
-    /*
-     * Default to devices being used at their maximum device width. This was
-     * assumed before the device_width support was added.
-     */
-    if (!pfl->max_device_width) {
-        pfl->max_device_width = pfl->device_width;
-    }
-
-    pfl->wcycle = 0;
-    /*
-     * The command 0x00 is not assigned by the CFI open standard,
-     * but QEMU historically uses it for the READ_ARRAY command (0xff).
-     */
-    pfl->cmd = 0x00;
-    pfl->status = 0x80; /* WSM ready */
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
     pfl->cfi_table[0x10] = 'Q';
@@ -876,6 +810,78 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     pfl->cfi_table[0x3f] = 0x01; /* Number of protection fields */
 }
 
+static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
+{
+    ERRP_GUARD();
+    PFlashCFI01 *pfl = PFLASH_CFI01(dev);
+    uint64_t total_len;
+    int ret;
+
+    if (pfl->sector_len == 0) {
+        error_setg(errp, "attribute \"sector-length\" not specified or zero.");
+        return;
+    }
+    if (pfl->nb_blocs == 0) {
+        error_setg(errp, "attribute \"num-blocks\" not specified or zero.");
+        return;
+    }
+    if (pfl->name == NULL) {
+        error_setg(errp, "attribute \"name\" not specified.");
+        return;
+    }
+
+    total_len = pfl->sector_len * pfl->nb_blocs;
+
+    memory_region_init_rom_device(
+        &pfl->mem, OBJECT(dev),
+        &pflash_cfi01_ops,
+        pfl,
+        pfl->name, total_len, errp);
+    if (*errp) {
+        return;
+    }
+
+    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+
+    if (pfl->blk) {
+        uint64_t perm;
+        pfl->ro = !blk_supports_write_perm(pfl->blk);
+        perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
+        ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
+        if (ret < 0) {
+            return;
+        }
+    } else {
+        pfl->ro = 0;
+    }
+
+    if (pfl->blk) {
+        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
+                                         errp)) {
+            vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
+            return;
+        }
+    }
+
+    /*
+     * Default to devices being used at their maximum device width. This was
+     * assumed before the device_width support was added.
+     */
+    if (!pfl->max_device_width) {
+        pfl->max_device_width = pfl->device_width;
+    }
+
+    pfl->wcycle = 0;
+    /*
+     * The command 0x00 is not assigned by the CFI open standard,
+     * but QEMU historically uses it for the READ_ARRAY command (0xff).
+     */
+    pfl->cmd = 0x00;
+    pfl->status = 0x80; /* WSM ready */
+    pflash_cfi01_fill_cfi_table(pfl);
+}
+
 static void pflash_cfi01_system_reset(DeviceState *dev)
 {
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
-- 
2.26.2


