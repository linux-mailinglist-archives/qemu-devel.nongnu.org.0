Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDD753F2D2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:54:17 +0200 (CEST)
Received: from localhost ([::1]:46856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMY4-0004ff-Aq
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwX-0001lh-GW
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:33 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwV-0003z1-Pa
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:29 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so13875629pjs.1
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BmIOwnkZ5lW3dduijorKX8Gb5xNA0hnDy9a1ppxt3Pg=;
 b=LvuPYnNOro0/vJe3PBR9n1RkCig2Pr8f433WnbXcz/au2mGn8lrBFSvBtMonvvVsjU
 QbcFCgv/vhvTAcpPkp5Lm5A3vCMe1r9CAdcPVIosKEFD5y7DaI0jmBrQ0svlvgm9bGnx
 nYNh5jFTnwrkA3dIC/ovvf7yyCyVpGkXQRVCOtxoFvZrPYzz5Jt+TccnUyltcMiiOo4W
 7NpVikuqhYLnm7tE+FwbpN/XLGz0nsmrBznoTCLwsLlmrZ3qwNoP7wgnzNkrogNn0GUn
 k94mRNhXrs4fW+jmWirm6l3C6D5KonJrxKlkgACVkuq6eok2cd8EbOYFO8foOU3+Pm2/
 gwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BmIOwnkZ5lW3dduijorKX8Gb5xNA0hnDy9a1ppxt3Pg=;
 b=4Znyc1t70B5MuPqT+MhfeQXFNS0Z4HxQolSt3mDm6N30nDKRDHOovOI10L2nedTAhR
 oLzNgPWjGRmtxBI77LxEQrY0sgr8qgfjtAF3fJ8H8LlVluUZ2UfVuID+NQDqp0WdWBij
 T9m6Ok1oBy8VZZakxaHCypXE34DbjGTp+Tk7JZJfmx5POyfj5RIYlFXZiahc4HdABVtT
 V3pL24PS/GD3kzCWo2/Y6uDqQljWYbFYrpYIC76r4bbeUPRr1ooIOqzwuW6TjJI3zJVf
 5Cc5mTWPUhqlCbBFJjFrMzMoxKhGiLBceDPGKLfah8K0Wt9wgritXOHxqhr4zknzB7uG
 32zg==
X-Gm-Message-State: AOAM530kka6UPSAS30DarEMmvqfec7tEUx8zepshLeV8am7VQKuP3gnQ
 cbGL/22YkVl3FiL2Z5I5BGHNcZJ3U3WJfA==
X-Google-Smtp-Source: ABdhPJyQ0UMaIANX3jHNYVEm3sWZU+ocN/8sxWE1s1pe5YvRzHIqhCXVkESYY6tBdv/SYY2cJGoJ4w==
X-Received: by 2002:a17:902:ec82:b0:167:70f6:905e with SMTP id
 x2-20020a170902ec8200b0016770f6905emr11021932plg.114.1654557326963; 
 Mon, 06 Jun 2022 16:15:26 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 37/43] hw/loongarch: Add some devices support for 3A5000.
Date: Mon,  6 Jun 2022 16:14:44 -0700
Message-Id: <20220606231450.448443-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

1.Add uart,virtio-net,vga and usb for 3A5000.
2.Add irq set and map for the pci host. Non pci device
use irq 0-16, pci device use 16-64.
3.Add some unimplented device to emulate guest unused
memory space.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-38-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/pci-host/ls7a.h |  7 ++++
 hw/loongarch/loongson3.c   | 77 ++++++++++++++++++++++++++++++++++++++
 hw/loongarch/Kconfig       |  7 ++++
 3 files changed, 91 insertions(+)

diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 089d3e5438..5c653527f0 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -17,6 +17,11 @@
 
 #define LS7A_PCI_MEM_BASE        0x40000000UL
 #define LS7A_PCI_MEM_SIZE        0x40000000UL
+#define LS7A_PCI_IO_OFFSET      0x4000
+#define LS_PCIECFG_BASE         0x20000000
+#define LS_PCIECFG_SIZE         0x08000000
+#define LS7A_PCI_IO_BASE        0x18004000UL
+#define LS7A_PCI_IO_SIZE        0xC000
 
 #define LS7A_PCH_REG_BASE       0x10000000UL
 #define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
@@ -30,4 +35,6 @@
 #define PCH_PIC_IRQ_OFFSET      64
 #define LS7A_DEVICE_IRQS        16
 #define LS7A_PCI_IRQS           48
+#define LS7A_UART_IRQ           (PCH_PIC_IRQ_OFFSET + 2)
+#define LS7A_UART_BASE          0x1fe001e0
 #endif
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 7a5c61e2df..7bc17113dc 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -9,6 +9,7 @@
 #include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/char/serial.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
@@ -16,14 +17,88 @@
 #include "sysemu/rtc.h"
 #include "hw/loongarch/virt.h"
 #include "exec/address-spaces.h"
+#include "hw/irq.h"
+#include "net/net.h"
 #include "hw/intc/loongarch_ipi.h"
 #include "hw/intc/loongarch_extioi.h"
 #include "hw/intc/loongarch_pch_pic.h"
 #include "hw/intc/loongarch_pch_msi.h"
 #include "hw/pci-host/ls7a.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/misc/unimp.h"
 
 #include "target/loongarch/cpu.h"
 
+static void loongarch_devices_init(DeviceState *pch_pic)
+{
+    DeviceState *gpex_dev;
+    SysBusDevice *d;
+    PCIBus *pci_bus;
+    MemoryRegion *ecam_alias, *ecam_reg, *pio_alias, *pio_reg;
+    MemoryRegion *mmio_alias, *mmio_reg;
+    int i;
+
+    gpex_dev = qdev_new(TYPE_GPEX_HOST);
+    d = SYS_BUS_DEVICE(gpex_dev);
+    sysbus_realize_and_unref(d, &error_fatal);
+    pci_bus = PCI_HOST_BRIDGE(gpex_dev)->bus;
+
+    /* Map only part size_ecam bytes of ECAM space */
+    ecam_alias = g_new0(MemoryRegion, 1);
+    ecam_reg = sysbus_mmio_get_region(d, 0);
+    memory_region_init_alias(ecam_alias, OBJECT(gpex_dev), "pcie-ecam",
+                             ecam_reg, 0, LS_PCIECFG_SIZE);
+    memory_region_add_subregion(get_system_memory(), LS_PCIECFG_BASE,
+                                ecam_alias);
+
+    /* Map PCI mem space */
+    mmio_alias = g_new0(MemoryRegion, 1);
+    mmio_reg = sysbus_mmio_get_region(d, 1);
+    memory_region_init_alias(mmio_alias, OBJECT(gpex_dev), "pcie-mmio",
+                             mmio_reg, LS7A_PCI_MEM_BASE, LS7A_PCI_MEM_SIZE);
+    memory_region_add_subregion(get_system_memory(), LS7A_PCI_MEM_BASE,
+                                mmio_alias);
+
+    /* Map PCI IO port space. */
+    pio_alias = g_new0(MemoryRegion, 1);
+    pio_reg = sysbus_mmio_get_region(d, 2);
+    memory_region_init_alias(pio_alias, OBJECT(gpex_dev), "pcie-io", pio_reg,
+                             LS7A_PCI_IO_OFFSET, LS7A_PCI_IO_SIZE);
+    memory_region_add_subregion(get_system_memory(), LS7A_PCI_IO_BASE,
+                                pio_alias);
+
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        sysbus_connect_irq(d, i,
+                           qdev_get_gpio_in(pch_pic, 16 + i));
+        gpex_set_irq_num(GPEX_HOST(gpex_dev), i, 16 + i);
+    }
+
+    serial_mm_init(get_system_memory(), LS7A_UART_BASE, 0,
+                   qdev_get_gpio_in(pch_pic,
+                                    LS7A_UART_IRQ - PCH_PIC_IRQ_OFFSET),
+                   115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+
+    /* Network init */
+    for (i = 0; i < nb_nics; i++) {
+        NICInfo *nd = &nd_table[i];
+
+        if (!nd->model) {
+            nd->model = g_strdup("virtio");
+        }
+
+        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
+    }
+
+    /* VGA setup */
+    pci_vga_init(pci_bus);
+
+    /*
+     * There are some invalid guest memory access.
+     * Create some unimplemented devices to emulate this.
+     */
+    create_unimplemented_device("pci-dma-cfg", 0x1001041c, 0x4);
+}
+
 static void loongarch_irq_init(LoongArchMachineState *lams)
 {
     MachineState *ms = MACHINE(lams);
@@ -118,6 +193,8 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
         qdev_connect_gpio_out(DEVICE(d), i,
                               qdev_get_gpio_in(extioi, i + PCH_MSI_IRQ_START));
     }
+
+    loongarch_devices_init(pch_pic);
 }
 
 static void loongarch_init(MachineState *machine)
diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index f779087416..8552ff4bee 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -2,6 +2,13 @@ config LOONGARCH_VIRT
     bool
     select PCI
     select PCI_EXPRESS_GENERIC_BRIDGE
+    imply VGA_PCI
+    imply VIRTIO_VGA
+    imply PCI_DEVICES
+    select ISA_BUS
+    select SERIAL
+    select SERIAL_ISA
+    select VIRTIO_PCI
     select LOONGARCH_IPI
     select LOONGARCH_PCH_PIC
     select LOONGARCH_PCH_MSI
-- 
2.34.1


