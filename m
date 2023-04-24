Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF176EC641
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 08:25:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqpcf-0008VG-DB; Mon, 24 Apr 2023 02:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pqpcc-0008U8-O0; Mon, 24 Apr 2023 02:24:23 -0400
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yong.li@intel.com>)
 id 1pqpcZ-00061J-G4; Mon, 24 Apr 2023 02:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682317459; x=1713853459;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/QaQlEvjhN6xxRF5RZDN6Faa8uJF9kcPU/CsMrArPJk=;
 b=csowAiihybsXfvSqvAK8mbA4yGGKv1G6BlCWwqyaLRMi+CXnQAiK29B8
 DepAot9tBPv3nQsjt/8GWp2fOLt7SZLNgjKgupsYh7x+AEvrqKq0dM3zh
 GJnX9ronseRT2ayAlGh3GWx+PB5+515GRiUOtFwOwQD/5o0/lpPTdqu6M
 0fFgUw29rUaTlwjo8BEV5DjT+HwRPJ1SnxZY+s70MyC1DdXaJ+6aBz8YC
 Vqw0Y6e3je1OGkGGG/14DLUIsdPJMqhlTZ2sGB/E87c31leVFKLjXodQX
 //NrtpuVf4NK7NPi7IdO6vDTwr9Y6ZQNt1RXaElH9xtgzh8HM9Z/O2glW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="335257506"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; d="scan'208";a="335257506"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2023 23:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="782287983"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; d="scan'208";a="782287983"
Received: from intel-optiplex-7090.sh.intel.com ([10.67.104.162])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Apr 2023 23:24:13 -0700
From: Yong Li <yong.li@intel.com>
To: qemu-devel@nongnu.org
Cc: Yong Li <yong.li@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org (open list:RISC-V TCG CPUs)
Subject: [PATCH] hw/riscv/virt: Add a second UART for secure world
Date: Mon, 24 Apr 2023 14:24:09 +0800
Message-Id: <20230424062409.3395609-1-yong.li@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yong.li@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The virt machine can have two UARTs and the second UART
can be used when host secure-mode support is enabled.

Signed-off-by: Yong Li <yong.li@intel.com>
---
 hw/riscv/virt.c         | 4 ++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b38b41e685..02475e1678 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -88,6 +88,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_APLIC_S] =      {  0xd000000, APLIC_SIZE(VIRT_CPUS_MAX) },
     [VIRT_UART0] =        { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =       { 0x10001000,        0x1000 },
+    [VIRT_UART1] =        { 0x10002000,         0x100 },
     [VIRT_FW_CFG] =       { 0x10100000,          0x18 },
     [VIRT_FLASH] =        { 0x20000000,     0x4000000 },
     [VIRT_IMSIC_M] =      { 0x24000000, VIRT_IMSIC_MAX_SIZE },
@@ -1508,6 +1509,9 @@ static void virt_machine_init(MachineState *machine)
     serial_mm_init(system_memory, memmap[VIRT_UART0].base,
         0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART0_IRQ), 399193,
         serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    serial_mm_init(system_memory, memmap[VIRT_UART1].base,
+        0, qdev_get_gpio_in(DEVICE(mmio_irqchip), UART1_IRQ), 399193,
+        serial_hd(1), DEVICE_LITTLE_ENDIAN);
 
     sysbus_create_simple("goldfish_rtc", memmap[VIRT_RTC].base,
         qdev_get_gpio_in(DEVICE(mmio_irqchip), RTC_IRQ));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..8d2f8f225d 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -74,6 +74,7 @@ enum {
     VIRT_APLIC_S,
     VIRT_UART0,
     VIRT_VIRTIO,
+    VIRT_UART1,
     VIRT_FW_CFG,
     VIRT_IMSIC_M,
     VIRT_IMSIC_S,
@@ -88,6 +89,7 @@ enum {
 enum {
     UART0_IRQ = 10,
     RTC_IRQ = 11,
+    UART1_IRQ = 12,
     VIRTIO_IRQ = 1, /* 1 to 8 */
     VIRTIO_COUNT = 8,
     PCIE_IRQ = 0x20, /* 32 to 35 */
-- 
2.25.1


