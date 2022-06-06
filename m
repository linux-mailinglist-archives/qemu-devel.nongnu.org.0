Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD09B53E4AB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 15:17:01 +0200 (CEST)
Received: from localhost ([::1]:53070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyCbN-0001rm-03
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 09:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nyC5x-0000AY-A0
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:44:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40366 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nyC5u-0004Ul-WB
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:44:33 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+Z29p1ishIXAA--.3714S42; 
 Mon, 06 Jun 2022 20:44:16 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, maobibo@loongson.cn
Subject: [PATCH v7 40/43] hw/loongarch: Add LoongArch virt power manager
 support.
Date: Mon,  6 Jun 2022 20:43:30 +0800
Message-Id: <20220606124333.2060567-41-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
References: <20220606124333.2060567-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+Z29p1ishIXAA--.3714S42
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyUZF4UXFyxuFy3tr1kZrb_yoW5Jr4Dpr
 Wfury5Cr4rJFnrXrn3ta43XrsxJrs7WF1IqFWavws2krnxJr1UZr1kJa4jyFy2va95WF90
 9rykWFy5uF4jy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is a placeholder for missing ACPI, and will eventually be replaced.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/loongarch/loongson3.c | 49 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 3c8fcb828c..bd20ebbb78 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -31,6 +31,48 @@
 
 #include "target/loongarch/cpu.h"
 
+#define PM_BASE 0x10080000
+#define PM_SIZE 0x100
+#define PM_CTRL 0x10
+
+/*
+ * This is a placeholder for missing ACPI,
+ * and will eventually be replaced.
+ */
+static uint64_t loongarch_virt_pm_read(void *opaque, hwaddr addr, unsigned size)
+{
+    return 0;
+}
+
+static void loongarch_virt_pm_write(void *opaque, hwaddr addr,
+                               uint64_t val, unsigned size)
+{
+    if (addr != PM_CTRL) {
+        return;
+    }
+
+    switch (val) {
+    case 0x00:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        return;
+    case 0xff:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        return;
+    default:
+        return;
+    }
+}
+
+static const MemoryRegionOps loongarch_virt_pm_ops = {
+    .read  = loongarch_virt_pm_read,
+    .write = loongarch_virt_pm_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 1
+    }
+};
+
 static struct _loaderparams {
     uint64_t ram_size;
     const char *kernel_filename;
@@ -67,7 +109,7 @@ static void loongarch_devices_init(DeviceState *pch_pic)
     SysBusDevice *d;
     PCIBus *pci_bus;
     MemoryRegion *ecam_alias, *ecam_reg, *pio_alias, *pio_reg;
-    MemoryRegion *mmio_alias, *mmio_reg;
+    MemoryRegion *mmio_alias, *mmio_reg, *pm_mem;
     int i;
 
     gpex_dev = qdev_new(TYPE_GPEX_HOST);
@@ -132,6 +174,11 @@ static void loongarch_devices_init(DeviceState *pch_pic)
     sysbus_create_simple("ls7a_rtc", LS7A_RTC_REG_BASE,
                          qdev_get_gpio_in(pch_pic,
                          LS7A_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
+
+    pm_mem = g_new(MemoryRegion, 1);
+    memory_region_init_io(pm_mem, NULL, &loongarch_virt_pm_ops,
+                          NULL, "loongarch_virt_pm", PM_SIZE);
+    memory_region_add_subregion(get_system_memory(), PM_BASE, pm_mem);
 }
 
 static void loongarch_irq_init(LoongArchMachineState *lams)
-- 
2.31.1


