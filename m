Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A22B008C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 08:52:29 +0100 (CET)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd7PA-0000J9-L2
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 02:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitaly.wool@konsulko.com>)
 id 1kd7Nb-0007xQ-L0
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:50:51 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitaly.wool@konsulko.com>)
 id 1kd7NZ-0008QJ-TV
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 02:50:51 -0500
Received: by mail-wm1-x343.google.com with SMTP id 10so4382384wml.2
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 23:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PsuOW9sVFo//2Vern0+Yco31gVROdhe7bT8B2J7Qm8M=;
 b=dOX7LkWmsXXzWRVroKXv6bnYPZcJha24HW1RIrq7inisC8Wn5bq44i3tYOwG3nKp/C
 XmMGJaDzrTsR/2F9t4T9DJERHriOMSfqIHCB7/W4Cf8Q2TVHYWxC7waTcRtQ0TEu6O4n
 j4dlUdWSh4GianbOTOn2zL8Rbzd18RRurhhtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PsuOW9sVFo//2Vern0+Yco31gVROdhe7bT8B2J7Qm8M=;
 b=HKHo7RKUXlbdh/iZRUCqvOB2MXqUf2nTj7MlrHhF43+is2v2XscGm3QBZD+2rRbkqc
 AEICnJfK8Xmrs6/PfJgsVYeEBxqvmCtfersW0ooy9nP7stgLuP6liFFPR10OOZwdQgDt
 /jAyZ3cg2qV8xpn8UCd0iScYrqCFaJhcgvw4QL9PBcZ3wv5SsNhJ4wUtZHXJsBJDF9C/
 k5WnulC2TdTzWsBspHgYjLbEwBrT7EWRvhK3Ru9/6HGK2TMy/6K4sv/aQclupp1sBxYW
 EmuchMeIvt3s7P501dEhDC7Vlabyh8FKOf08BgapO5zAyHCxGFGnjN8hGmsDC6AlGREp
 A7oA==
X-Gm-Message-State: AOAM531ef0H7l/mB47Mg99dUeQ+AkUvBpSyxOhczJnxkcbHu49f3ScMa
 eEsY1VH18y+4xO6GgJNUQHZ6OPJq8PWbIxTM
X-Google-Smtp-Source: ABdhPJwNNEC8+6HmBxq3GDe7+U+vj8fhUy/V6Lsq2g7RJsBXdEu9zKY4iYqKqeBgQe+gstiLdvPWEA==
X-Received: by 2002:a05:600c:219a:: with SMTP id
 e26mr8680218wme.168.1605167447414; 
 Wed, 11 Nov 2020 23:50:47 -0800 (PST)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id f7sm6073644wrx.64.2020.11.11.23.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 23:50:46 -0800 (PST)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/riscv: microchip_pfsoc: add QSPI NOR flash
Date: Thu, 12 Nov 2020 09:49:51 +0200
Message-Id: <20201112074950.33283-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=vitaly.wool@konsulko.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add QSPI NOR flash definition for Microchip PolarFire SoC.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 hw/riscv/microchip_pfsoc.c         | 21 +++++++++++++++++++++
 include/hw/riscv/microchip_pfsoc.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 37ac46a1af..e952b49e8c 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -113,6 +113,8 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_MMUART2] =         { 0x20102000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART3] =         { 0x20104000,     0x1000 },
     [MICROCHIP_PFSOC_MMUART4] =         { 0x20106000,     0x1000 },
+    [MICROCHIP_PFSOC_SPI0] =            { 0x20108000,     0x1000 },
+    [MICROCHIP_PFSOC_SPI1] =            { 0x20109000,     0x1000 },
     [MICROCHIP_PFSOC_I2C1] =            { 0x2010b000,     0x1000 },
     [MICROCHIP_PFSOC_GEM0] =            { 0x20110000,     0x2000 },
     [MICROCHIP_PFSOC_GEM1] =            { 0x20112000,     0x2000 },
@@ -121,6 +123,7 @@ static const struct MemmapEntry {
     [MICROCHIP_PFSOC_GPIO2] =           { 0x20122000,     0x1000 },
     [MICROCHIP_PFSOC_ENVM_CFG] =        { 0x20200000,     0x1000 },
     [MICROCHIP_PFSOC_ENVM_DATA] =       { 0x20220000,    0x20000 },
+    [MICROCHIP_PFSOC_QSPI_XIP] =        { 0x21000000,  0x1000000 },
     [MICROCHIP_PFSOC_IOSCB] =           { 0x30000000, 0x10000000 },
     [MICROCHIP_PFSOC_DRAM_LO] =         { 0x80000000, 0x40000000 },
     [MICROCHIP_PFSOC_DRAM_LO_ALIAS] =   { 0xc0000000, 0x40000000 },
@@ -185,6 +188,7 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *e51_dtim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
     MemoryRegion *envm_data = g_new(MemoryRegion, 1);
+    MemoryRegion *qspi_xip_mem = g_new(MemoryRegion, 1);
     char *plic_hart_config;
     size_t plic_hart_config_len;
     NICInfo *nd;
@@ -344,6 +348,14 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in(DEVICE(s->plic), MICROCHIP_PFSOC_MMUART4_IRQ),
         serial_hd(4));
 
+    /* SPI */
+    create_unimplemented_device("microchip.pfsoc.spi0",
+        memmap[MICROCHIP_PFSOC_SPI0].base,
+        memmap[MICROCHIP_PFSOC_SPI0].size);
+    create_unimplemented_device("microchip.pfsoc.spi1",
+        memmap[MICROCHIP_PFSOC_SPI1].base,
+        memmap[MICROCHIP_PFSOC_SPI1].size);
+
     /* I2C1 */
     create_unimplemented_device("microchip.pfsoc.i2c1",
         memmap[MICROCHIP_PFSOC_I2C1].base,
@@ -401,6 +413,15 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->ioscb), errp);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ioscb), 0,
                     memmap[MICROCHIP_PFSOC_IOSCB].base);
+
+    /* QSPI Flash */
+    memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
+                           "microchip.pfsoc.qspi_xip",
+                           memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
+                           &error_fatal);
+    memory_region_add_subregion(system_memory,
+                                memmap[MICROCHIP_PFSOC_QSPI_XIP].base,
+                                qspi_xip_mem);
 }
 
 static void microchip_pfsoc_soc_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index 51d44637db..d0c666aae0 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -97,6 +97,8 @@ enum {
     MICROCHIP_PFSOC_MMUART2,
     MICROCHIP_PFSOC_MMUART3,
     MICROCHIP_PFSOC_MMUART4,
+    MICROCHIP_PFSOC_SPI0,
+    MICROCHIP_PFSOC_SPI1,
     MICROCHIP_PFSOC_I2C1,
     MICROCHIP_PFSOC_GEM0,
     MICROCHIP_PFSOC_GEM1,
@@ -105,6 +107,7 @@ enum {
     MICROCHIP_PFSOC_GPIO2,
     MICROCHIP_PFSOC_ENVM_CFG,
     MICROCHIP_PFSOC_ENVM_DATA,
+    MICROCHIP_PFSOC_QSPI_XIP,
     MICROCHIP_PFSOC_IOSCB,
     MICROCHIP_PFSOC_DRAM_LO,
     MICROCHIP_PFSOC_DRAM_LO_ALIAS,
-- 
2.20.1


