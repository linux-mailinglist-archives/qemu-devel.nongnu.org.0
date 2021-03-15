Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F56E33C9F8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:37:22 +0100 (CET)
Received: from localhost ([::1]:52088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwm1-0002n3-5b
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkS-00014Q-Kn
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLwkQ-0005wD-LH
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615851342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0y0PuPcvgkCR9I/VXZHNwqPHl99TfzU9BvLX8r0uLQ=;
 b=hxi+U+T96jBzsus7asxG7P+3JTDP9dUXa5ZeAhoUZcWz1Sgrh1MEaka0qRkw/JPfDBQtVq
 US0yxwuw4Zj2MeF1tS8LgRre5JIj7a+HNBUbYOCwM9W2h1ZTppJZnaoQWvhNKM1LobI5WM
 UWOLj2RQCax1R9/wRxX/91jN/iebVi8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323--azqchvtMZy0LXdalpj3Rw-1; Mon, 15 Mar 2021 19:35:40 -0400
X-MC-Unique: -azqchvtMZy0LXdalpj3Rw-1
Received: by mail-wr1-f69.google.com with SMTP id e13so15742198wrg.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s0y0PuPcvgkCR9I/VXZHNwqPHl99TfzU9BvLX8r0uLQ=;
 b=OxKPU/n05t6LK/4VB1LO13u/WaxVmA8XY9VUo8fOqi27LXRvIdlLBHQ43PrKtk3SLC
 ryVNO5sdWdn/ypuxI5qClvVzIN+6IIcPVcVaFf38prXlixTX8xtbmQkG4THmMckVWDKS
 sTD4dE2U43jbrCsbmNO2D1BaHQr721XtDOOHcbUN2SCTmwEwrPrhARCTalBJ5Oxb7fxb
 8/WXwaOTiGMkpO89PxMXLPPEsqEL7TlXiwkkL15mevB8k17FcLtSz+wjK2XhMG2816Ra
 D/9GpPjMQZw6gt6fau2Fuho5UpQ1CCAtvGWMhxdyNTXDttG3lJ49tIu04qPTvt40JwgI
 fcXQ==
X-Gm-Message-State: AOAM532WdkQgL4izLMezczYUZ26BCvQ7Wmha8NnvZhHhtoYAo3oHK+pg
 d9/cZoLsEw3ZnYKJ/oXPLcGZANdO+jxsq82WJkF7WNq0x5MAW/xLYkLRMZV/AAEzbju04fNkOXf
 39ZPED5Ij5OgM85UeANSxmFbK7McxseWQBVmhJJKxwB3cAqcacVcdpuGlkOWD23Rb
X-Received: by 2002:adf:b345:: with SMTP id k5mr1961887wrd.14.1615851339238;
 Mon, 15 Mar 2021 16:35:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaT/Ly01nOi225Ge5wlgjRRxHvIoY1P9qh9fVjK+XflWDEg7LArHSiM3z/Qj9DDpgUiN0DIg==
X-Received: by 2002:adf:b345:: with SMTP id k5mr1961863wrd.14.1615851338948;
 Mon, 15 Mar 2021 16:35:38 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id w6sm21249903wrl.49.2021.03.15.16.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:35:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] hw/block/pflash_cfi01: Extract
 pflash_cfi01_fill_cfi_table()
Date: Tue, 16 Mar 2021 00:35:18 +0100
Message-Id: <20210315233527.2988483-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315233527.2988483-1-philmd@redhat.com>
References: <20210315233527.2988483-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill the CFI table in out of DeviceRealize() in a new function:
pflash_cfi01_fill_cfi_table().

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210310170528.1184868-3-philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 140 +++++++++++++++++++++-------------------
 1 file changed, 73 insertions(+), 67 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 248889c3d02..779a62f3b06 100644
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


