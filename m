Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045366252D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:13:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqz5-0000d5-3E; Mon, 09 Jan 2023 07:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqym-0000U3-E9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:19 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyd-00072S-Um
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:10:14 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so8821929wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnHz5pT3+i4xDM6inKPhqyLsvi12m2D1eIZxQ/5bEAw=;
 b=KDXgpqfdxgT7RO04VyC5q0FG8xImDYad0HLtYR2qUL5xrpwKr/2mBRC4AQGhYdtERw
 z02F2+eDe+WYJLCuYyVJcfmr65N3do14SYSURoUX6FeLxWiQcBBIA0/Huv/i3I2qq9M7
 28FJFf/AeE7o94Q7BYvt3vRcR2wjwK/P5PcCPc4pBRZZDH2f51KfhdlyMyRMtRGyoT9r
 UYHCb6HTYQAngIh+q6WT6hcvV5UHLdaBcMNTtHwx2y7XJdcwld/kub3TuCaPk+xzkaK2
 VkxzFj8syhCZh9GubhthRgd7MP6IKlRVIbZTcx6T7xcTGWGb3BpCJgoD61WF596VBkSv
 7V5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnHz5pT3+i4xDM6inKPhqyLsvi12m2D1eIZxQ/5bEAw=;
 b=JpPWA4b+fdbf/rrihDfZkgTvhw7loJDsfZNcJku8r37TB59wtvDA6Mhzvma+sl7rFs
 MWmV/DbrtW+qQJhHGppT9OXH2GjSIe5LFzix5T5EVE2OC3+2/9bHA5dcr6bwuFswWD42
 Cg43eJoPyhOppKOu6HZQB3EdV9itQj7dxI6ismLJtkSywsUFtM+OKziliV29LMt8/w2H
 /qnbXXQ3Ei/yFOs2IHOZfMRVJxKeO0IbBLtpfk1+Qm8rVkqlCAWvKRqM0bE5bqxCxiue
 sE4xD8Zi0lGEH58gN8lAR8A3o1J0OmxWZq9qd2M3sToVcSHKGnQwuQ0Zsl/Uuhy4R+6J
 YmoA==
X-Gm-Message-State: AFqh2kqZxDQ3tn5pwKL9SEkHi9i4UsTvq4Utc7gRrVuA4UKokLpQoPQe
 j4rpuV+OMq62pCBMsuTe9EndM3geIWNajV1K
X-Google-Smtp-Source: AMrXdXsHXHX0Mat6CK0WBd+D2DKSoIDYbCZkoP3rR4khJv64+hPcUpCau69aK7f+/T94aTl+ldScwQ==
X-Received: by 2002:a7b:c3c1:0:b0:3c7:1359:783b with SMTP id
 t1-20020a7bc3c1000000b003c71359783bmr46022830wmj.1.1673266206264; 
 Mon, 09 Jan 2023 04:10:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003c6f8d30e40sm17551744wms.31.2023.01.09.04.10.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:10:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 19/21] hw/ppc: Open-code pflash_cfi01_register()
Date: Mon,  9 Jan 2023 13:08:31 +0100
Message-Id: <20230109120833.3330-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
 hw/ppc/sam460ex.c     | 19 ++++++++++++++-----
 hw/ppc/virtex_ml507.c | 15 ++++++++++++---
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index cf7213f7c9..d2bf11d774 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -99,14 +99,23 @@ static int sam460ex_load_uboot(void)
      *
      * TODO Figure out what we really need here, and clean this up.
      */
-
+    DeviceState *dev;
     DriveInfo *dinfo;
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32),
-                          "sam460ex.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1));
+    dev = qdev_new(TYPE_PFLASH_CFI01);
+    qdev_prop_set_string(dev, "name", "sam460ex.flash");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / (64 * KiB));
+    qdev_prop_set_uint64(dev, "sector-length", 64 * KiB);
+    qdev_prop_set_uint8(dev, "width", 1);
+    qdev_prop_set_bit(dev, "big-endian", true);
+    qdev_prop_set_uint16(dev, "id0", 0x0089);
+    qdev_prop_set_uint16(dev, "id1", 0x0018);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0,
+                    FLASH_BASE | ((hwaddr)FLASH_BASE_H << 32));
 
     if (!dinfo) {
         /*error_report("No flash image given with the 'pflash' parameter,"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index f2f81bd425..2532806922 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -233,9 +233,18 @@ static void virtex_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, ram_base, machine->ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash_cfi01_register(PFLASH_BASEADDR, "virtex.flash", FLASH_SIZE,
-                          dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
-                          64 * KiB, 1, 0x89, 0x18, 0x0000, 0x0, 1);
+    dev = qdev_new(TYPE_PFLASH_CFI01);
+    qdev_prop_set_string(dev, "name", "virtex.flash");
+    qdev_prop_set_drive(dev, "drive",
+                        dinfo ? blk_by_legacy_dinfo(dinfo) : NULL);
+    qdev_prop_set_uint32(dev, "num-blocks", FLASH_SIZE / (64 * KiB));
+    qdev_prop_set_uint64(dev, "sector-length", 64 * KiB);
+    qdev_prop_set_uint8(dev, "width", 1);
+    qdev_prop_set_bit(dev, "big-endian", true);
+    qdev_prop_set_uint16(dev, "id0", 0x0089);
+    qdev_prop_set_uint16(dev, "id1", 0x0018);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, PFLASH_BASEADDR);
 
     cpu_irq = qdev_get_gpio_in(DEVICE(cpu), PPC40x_INPUT_INT);
     dev = qdev_new("xlnx.xps-intc");
-- 
2.38.1


