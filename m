Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7AF333213
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:52:33 +0100 (CET)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJm9Q-00062A-GZ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm7p-0003q4-S4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:50:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm7m-0000st-9Y
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615333849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGPgh1dIDJdjD0VFPE49/XWio89qIKTLCGFsAjUNGeg=;
 b=SPsHKtdYExtNR9KAEYdE0Mm0G+vOu390iOgIEtsdewfIdK/54zGCaaDl0NVHIoFp5z/n45
 4dbUhKICZ74PBs+3ACmmA7U0lM6eCbVMFe22Iphr4CrzHKQ7ySZWijtJZ7YhFnFvc5xxAg
 ouDGqCxJ/rX6ybGubg4WFQNn/7tvaDw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-fdByi0dxOvayqVdQKsy0mA-1; Tue, 09 Mar 2021 18:50:43 -0500
X-MC-Unique: fdByi0dxOvayqVdQKsy0mA-1
Received: by mail-ej1-f72.google.com with SMTP id 3so6421248ejx.17
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 15:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KGPgh1dIDJdjD0VFPE49/XWio89qIKTLCGFsAjUNGeg=;
 b=UaCt6nuvYwhwuHCb/vYZWJTKvJn59N2NHmB7RAJ0FKgmgqKo4cQNtCqJbb9pntsFxZ
 8x0itLbDSoQcjd3qB5KI8gmg5+mo4S5T8FSwwUcbSg2eDJoXU3z7yXw6tEUfHdfymyCm
 w3pqrTZZnwiL76BBwEieYJnBYONcv/1OX8Ma/FvDFWP+oaHHbXYhwJEGgM6BcVSgiwpe
 Mk7aMTXshC5S/jKMjIoJBSqgJTkmHZgJvFJYPRCbIGFJilUWSSZM2n+CgfhMjq6dPXke
 E+6MJgzkMA5pGcAdTA+96R3Vtcglo0Ze4HplPcvoyKJEGEO7OVJhDmFs38IgevOx8LjO
 Tppg==
X-Gm-Message-State: AOAM530ac16WDowufllXxRG7L5h34/UM+mXdLtK9ft3q9VFJEp+B6Jsy
 cxMUBUhMXcrJ261IM/7WE7Drj4s5XBx7gBeAZ5b+m0oehD1LlnbCSREZ+jzYIog93LiFjMfQ/06
 wd+zWuiMP2PSMDPpM5Qgt0N2c1VW7io9hUVX58snj5KmrjQUA3EaKyNKqF13rAACd
X-Received: by 2002:a17:906:c08f:: with SMTP id
 f15mr590181ejz.318.1615333841610; 
 Tue, 09 Mar 2021 15:50:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfJ2PDUKA7kWCb844iEaOZBN+L2h+mFRyUUB3jpN2debum4xtGQyUoTboG1ptTFv2hMhTKQQ==
X-Received: by 2002:a17:906:c08f:: with SMTP id
 f15mr590162ejz.318.1615333841409; 
 Tue, 09 Mar 2021 15:50:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r19sm9954620edp.52.2021.03.09.15.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 15:50:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] hw/block/pflash_cfi01: Extract
 pflash_cfi01_fill_cfi_table()
Date: Wed, 10 Mar 2021 00:50:21 +0100
Message-Id: <20210309235028.912078-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309235028.912078-1-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fill the CFI table in out of DeviceRealize() in a new function:
pflash_cfi01_fill_cfi_table().

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


