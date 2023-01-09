Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2200662579
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:25:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqz3-0000YJ-Cf; Mon, 09 Jan 2023 07:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyY-0000Np-0m
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:02 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyW-0006pC-Af
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so4001455wma.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liSrsQbWrTyCFqiebgmf51mkmbO99zfOxESuyl/01rg=;
 b=NCXmd71e54vsqVAA3Jz795xx3dZy/ZYfYk50sSmWrl1HmFv+m9EL0Kvy3WKKMOV2h/
 LmJ05YuhK3wd8wwQd9szq18ekPMzaiAQRtX1aNOD3RNqaZ3WcFhF/O1DoqWisbbIC8Fe
 f5J0l66DxeLHMcs27J1E4ILFphGD4W58VICUn4NB9VM5oXRb2kXLuwAKJGhh4Lxy2rhy
 hJXgGXVEmh3p301yzsqoD3CcZeqm+06+Q5ILmvUG+rucSuA7HZ5mQZDFBFCyvbT/jLIQ
 skvir0aynQCPg65AzBoTn4TP7o2Ua3OMhvgB8ccA0ZWV+ZdjaitxIMvt5DzIaltctJyf
 rTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=liSrsQbWrTyCFqiebgmf51mkmbO99zfOxESuyl/01rg=;
 b=wffLfzIuQKYttLRYBHXFuypG/HFJr6xWqAW/r/aR5Al4utQP9W+vlADWe1b9d/PvLY
 UwG+AfQsmTk3B+wWY2tR44/2mwUtne+3ujYkAL5ih2fckkh9vyFgxSKDNBrDZnukeBiU
 FwqrnNbKCckdlO+tH8Nzjw6urin0NHQLeMOpo9HtG/iyMf+E8E+56LLxl0AM/a7NwAcP
 Peb23vLGxaQf0Id8zkD0dpRfmGugfJSOUwn2ZxvDvUgkqsThTk67D43FgJiVIDfk0aT2
 hoIO6ilIA6sOxOqpwkW2asbSn3a55zQqy6zJ8ASspYH6mq8CLdiPvVm/kgsr+RSlTvjk
 oEzw==
X-Gm-Message-State: AFqh2kp028KbamdoWr8K7bm+au0y4P2YXRmmlJCChdonmGzErWRU5tEu
 iOnVbTeGt2tpM4QWWD489LtmJAossJljrXE1
X-Google-Smtp-Source: AMrXdXuVdk4bTcZqAHD+luJ2HoeugMb5Cv/b2t4MTcHg07HQdm9IuGb/dzTKviiQ21CvunlnVdUMug==
X-Received: by 2002:a05:600c:687:b0:3cf:e7c8:494 with SMTP id
 a7-20020a05600c068700b003cfe7c80494mr46162728wmn.29.1673266195710; 
 Mon, 09 Jan 2023 04:09:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a1c544f000000b003b4fe03c881sm15491003wmi.48.2023.01.09.04.09.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 17/21] hw/microblaze: Open-code pflash_cfi01_register()
Date: Mon,  9 Jan 2023 13:08:29 +0100
Message-Id: <20230109120833.3330-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

pflash_cfi01_register() hides an implicit sysbus mapping of
MMIO region #0. This is not practical in a heterogeneous world
where multiple cores use different address spaces. In order to
remove pflash_cfi01_register() from the pflash API, open-code it
as a qdev creation call followed by an explicit sysbus mapping.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_ml605_mmu.c      | 18 ++++++++++++------
 hw/microblaze/petalogix_s3adsp1800_mmu.c | 16 ++++++++++++----
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 1888900156..84db4413c0 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -104,12 +104,18 @@ petalogix_ml605_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, MEMORY_BASEADDR, phys_ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    /* 5th parameter 2 means bank-width
-     * 10th paremeter 0 means little-endian */
-    pflash_cfi01_register(FLASH_BASEADDR, "petalogix_ml605.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          FLASH_SECTOR_SIZE, 2, 0x89, 0x18, 0x0000, 0x0, 0);
-
+    dev = qdev_new(TYPE_PFLASH_CFI01);
+    qdev_prop_set_string(dev, "name", "petalogix_ml605.flash");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint64(dev, "sector-length", FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 2); /* bank-width */
+    qdev_prop_set_bit(dev, "big-endian", false);
+    qdev_prop_set_uint16(dev, "id0", 0x0089);
+    qdev_prop_set_uint16(dev, "id1", 0x0018);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, FLASH_BASEADDR);
 
     dev = qdev_new("xlnx.xps-intc");
     qdev_prop_set_uint32(dev, "kind-of-intr", 1 << TIMER_IRQ);
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index d14eff2514..94d85d6ec2 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -85,10 +85,18 @@ petalogix_s3adsp1800_init(MachineState *machine)
     memory_region_add_subregion(sysmem, ddr_base, phys_ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(FLASH_BASEADDR,
-                          "petalogix_s3adsp1800.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          FLASH_SECTOR_SIZE, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    dev = qdev_new(TYPE_PFLASH_CFI01);
+    qdev_prop_set_string(dev, "name", "petalogix_s3adsp1800.flash");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint64(dev, "sector-length", FLASH_SECTOR_SIZE);
+    qdev_prop_set_uint8(dev, "width", 1); /* bank-width */
+    qdev_prop_set_bit(dev, "big-endian", true);
+    qdev_prop_set_uint16(dev, "id0", 0x0089);
+    qdev_prop_set_uint16(dev, "id1", 0x0018);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, FLASH_BASEADDR);
 
     dev = qdev_new("xlnx.xps-intc");
     qdev_prop_set_uint32(dev, "kind-of-intr",
-- 
2.38.1


