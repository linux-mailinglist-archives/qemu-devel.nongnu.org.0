Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E346606E93
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 05:59:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oljBx-0000Qp-Eq
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:59:29 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olj7M-0005MI-G7
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 23:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1olj7F-0005LX-I3
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:54:37 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1olj74-0002rI-To
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 23:54:37 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxStjsF1JjF04BAA--.4097S3;
 Fri, 21 Oct 2022 11:54:20 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Bxj+DrF1JjtGsCAA--.9655S4; 
 Fri, 21 Oct 2022 11:54:20 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 f4bug@amsat.org, philmd@linaro.org
Subject: [PATCH v1 2/3] hw/loongarch: Improve fdt for LoongArch virt machine
Date: Fri, 21 Oct 2022 11:54:18 +0800
Message-Id: <20221021035419.2632878-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221021035419.2632878-1-yangxiaojuan@loongson.cn>
References: <20221021035419.2632878-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxj+DrF1JjtGsCAA--.9655S4
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXr4UAr1rZw4xGF4fWw4rKrg_yoW5Ar18pF
 ZrCFn5ur48XF17WryS9a43uw43Ars7Cay2qr4furW0yFyUW34UXw4xC39xtFyUXrsYqFn0
 vFZ5t34fW3WI9rJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new items into LoongArch FDT, including rtc and uart info.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/virt.c        | 31 +++++++++++++++++++++++++++++++
 include/hw/pci-host/ls7a.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index fe33e7e3e4..eed9d591e7 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -42,6 +42,35 @@
 #include "hw/display/ramfb.h"
 #include "hw/mem/pc-dimm.h"
 
+static void fdt_add_rtc_node(LoongArchMachineState *lams)
+{
+    char *nodename;
+    hwaddr base = VIRT_RTC_REG_BASE;
+    hwaddr size = VIRT_RTC_LEN;
+    MachineState *ms = MACHINE(lams);
+
+    nodename = g_strdup_printf("/rtc@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "loongson,ls7a-rtc");
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 0x0, base, size);
+    g_free(nodename);
+}
+
+static void fdt_add_uart_node(LoongArchMachineState *lams)
+{
+    char *nodename;
+    hwaddr base = VIRT_UART_BASE;
+    hwaddr size = VIRT_UART_SIZE;
+    MachineState *ms = MACHINE(lams);
+
+    nodename = g_strdup_printf("/serial@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "ns16550a");
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "reg", 0x0, base, 0x0, size);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "clock-frequency", 100000000);
+    g_free(nodename);
+}
+
 static void create_fdt(LoongArchMachineState *lams)
 {
     MachineState *ms = MACHINE(lams);
@@ -422,6 +451,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
                    qdev_get_gpio_in(pch_pic,
                                     VIRT_UART_IRQ - PCH_PIC_IRQ_OFFSET),
                    115200, serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    fdt_add_uart_node(lams);
 
     /* Network init */
     for (i = 0; i < nb_nics; i++) {
@@ -442,6 +472,7 @@ static void loongarch_devices_init(DeviceState *pch_pic, LoongArchMachineState *
     sysbus_create_simple("ls7a_rtc", VIRT_RTC_REG_BASE,
                          qdev_get_gpio_in(pch_pic,
                          VIRT_RTC_IRQ - PCH_PIC_IRQ_OFFSET));
+    fdt_add_rtc_node(lams);
 
     pm_mem = g_new(MemoryRegion, 1);
     memory_region_init_io(pm_mem, NULL, &loongarch_virt_pm_ops,
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index 9bd875ca8b..df7fa55a30 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -37,6 +37,7 @@
 #define VIRT_PCI_IRQS            48
 #define VIRT_UART_IRQ            (PCH_PIC_IRQ_OFFSET + 2)
 #define VIRT_UART_BASE           0x1fe001e0
+#define VIRT_UART_SIZE           0X100
 #define VIRT_RTC_IRQ             (PCH_PIC_IRQ_OFFSET + 3)
 #define VIRT_MISC_REG_BASE       (VIRT_PCH_REG_BASE + 0x00080000)
 #define VIRT_RTC_REG_BASE        (VIRT_MISC_REG_BASE + 0x00050100)
-- 
2.31.1


