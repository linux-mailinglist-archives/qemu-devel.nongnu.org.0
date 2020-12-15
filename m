Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68A2DAEDC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:25:53 +0100 (CET)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBGy-0001Rh-Pv
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4b-0001ZS-H7
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:05 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4W-0007BE-Bi
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id w5so16252407wrm.11
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BVdQYpeeDaGlQTLZrRZJpRjKa+WjOxoqQv5yiE7c3/w=;
 b=ksPWwL9pnQXC9+bvueitMHjEQEg7N6KjEyyrWImFIyXhHLqGIzyZE/Zqa+N2PQFbjc
 mfpYglf28+fe7khE2XD84E+wmi+fLjR2DgCXMia+gv5EIBMnr3sEfVY5G4pXYSEYAefg
 IXJG6TK4nUG86fRJBRVKWFWCnsA/PfwGmUZFS3A9k4f2UjV5JlJbqhkGXJ/0ERB05q/d
 dDA6rUhaunhycakjalUpE8+kNMYmstjyZp3Hk79zloPfb55VZHrqN5pHPDvaUORv2d3+
 RO98sS3ntT6cZcov0/SyImFzZkcAuEiRKpLmgyDXWIDb4INLealWXE2K+akOMSWVCNhV
 KOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVdQYpeeDaGlQTLZrRZJpRjKa+WjOxoqQv5yiE7c3/w=;
 b=pq2IBkFV1WRKaMO4WV0PI7RDuGcGqDaltEB98yc1Bu0wQFL4RF+03xOORxnQrSkKW+
 VZUqVAMflE9S9WVQTleG9vQxeqDVcszQEk0WQQw6/qqZO7jOaEbme8eZTQtctKv/davy
 TizpHAJMjzTRIXCUW0la2cRN9EyYNVShW7Kz1PYUzGV4akCCUmHw6HVoPo2IuJ0oXaZ3
 mMEZTzJeBx7JdaitYZMJV9oQF5jZI5Gl8B7QFJnWRpcbfskvezpTePWvc9HqxM1mhw7l
 NEdTRFJZd5XG2hBms1kpuZhAVnF64JUMwT7iHWdKEiamWjM5PZ9hkozbh/UedY/JLZ/k
 wmmw==
X-Gm-Message-State: AOAM530UAWSZMyLbsmRuDQK/3gDPscT7MAgu/ENZsel5elvtUfvQVAWC
 gv6ULsfH9r7uSqukJIyk7CKBJ/mViUCvIw==
X-Google-Smtp-Source: ABdhPJwTVRAI2jyrJwnHKCM1/f1Ej5RXN2jYvKaQsFqeVP1OE+2BniczjPpWQs1WJ3j+OrMAqpAdyg==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr2925197wrs.82.1608041577257;
 Tue, 15 Dec 2020 06:12:57 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/20] arm: xlnx-versal: Connect usb to virt-versal
Date: Tue, 15 Dec 2020 14:12:32 +0000
Message-Id: <20201215141237.17868-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Connect VersalUsb2 subsystem to xlnx-versal SOC, its placed
in iou of lpd domain and configure it as dual port host controller.
Add the respective guest dts nodes for "xlnx-versal-virt" machine.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 1607023357-5096-5-git-send-email-sai.pavan.boddu@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-versal.h |  9 ++++++
 hw/arm/xlnx-versal-virt.c    | 55 ++++++++++++++++++++++++++++++++++++
 hw/arm/xlnx-versal.c         | 26 +++++++++++++++++
 3 files changed, 90 insertions(+)

diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 8ce8e63b56c..2b76885afd6 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -21,6 +21,7 @@
 #include "hw/net/cadence_gem.h"
 #include "hw/rtc/xlnx-zynqmp-rtc.h"
 #include "qom/object.h"
+#include "hw/usb/xlnx-usb-subsystem.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -59,6 +60,7 @@ struct Versal {
             PL011State uart[XLNX_VERSAL_NR_UARTS];
             CadenceGEMState gem[XLNX_VERSAL_NR_GEMS];
             XlnxZDMA adma[XLNX_VERSAL_NR_ADMAS];
+            VersalUsb2 usb;
         } iou;
     } lpd;
 
@@ -88,6 +90,7 @@ struct Versal {
 
 #define VERSAL_UART0_IRQ_0         18
 #define VERSAL_UART1_IRQ_0         19
+#define VERSAL_USB0_IRQ_0          22
 #define VERSAL_GEM0_IRQ_0          56
 #define VERSAL_GEM0_WAKE_IRQ_0     57
 #define VERSAL_GEM1_IRQ_0          58
@@ -125,6 +128,12 @@ struct Versal {
 #define MM_OCM                      0xfffc0000U
 #define MM_OCM_SIZE                 0x40000
 
+#define MM_USB2_CTRL_REGS           0xFF9D0000
+#define MM_USB2_CTRL_REGS_SIZE      0x10000
+
+#define MM_USB_0                    0xFE200000
+#define MM_USB_0_SIZE               0x10000
+
 #define MM_TOP_DDR                  0x0
 #define MM_TOP_DDR_SIZE             0x80000000U
 #define MM_TOP_DDR_2                0x800000000ULL
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index ee1282241e3..8482cd61960 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -39,6 +39,8 @@ struct VersalVirt {
         uint32_t ethernet_phy[2];
         uint32_t clk_125Mhz;
         uint32_t clk_25Mhz;
+        uint32_t usb;
+        uint32_t dwc;
     } phandle;
     struct arm_boot_info binfo;
 
@@ -66,6 +68,8 @@ static void fdt_create(VersalVirt *s)
     s->phandle.clk_25Mhz = qemu_fdt_alloc_phandle(s->fdt);
     s->phandle.clk_125Mhz = qemu_fdt_alloc_phandle(s->fdt);
 
+    s->phandle.usb = qemu_fdt_alloc_phandle(s->fdt);
+    s->phandle.dwc = qemu_fdt_alloc_phandle(s->fdt);
     /* Create /chosen node for load_dtb.  */
     qemu_fdt_add_subnode(s->fdt, "/chosen");
 
@@ -148,6 +152,56 @@ static void fdt_add_timer_nodes(VersalVirt *s)
                      compat, sizeof(compat));
 }
 
+static void fdt_add_usb_xhci_nodes(VersalVirt *s)
+{
+    const char clocknames[] = "bus_clk\0ref_clk";
+    const char irq_name[] = "dwc_usb3";
+    const char compatVersalDWC3[] = "xlnx,versal-dwc3";
+    const char compatDWC3[] = "snps,dwc3";
+    char *name = g_strdup_printf("/usb@%" PRIx32, MM_USB2_CTRL_REGS);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop(s->fdt, name, "compatible",
+                         compatVersalDWC3, sizeof(compatVersalDWC3));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_USB2_CTRL_REGS,
+                                 2, MM_USB2_CTRL_REGS_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "clock-names",
+                         clocknames, sizeof(clocknames));
+    qemu_fdt_setprop_cells(s->fdt, name, "clocks",
+                               s->phandle.clk_25Mhz, s->phandle.clk_125Mhz);
+    qemu_fdt_setprop(s->fdt, name, "ranges", NULL, 0);
+    qemu_fdt_setprop_cell(s->fdt, name, "#address-cells", 2);
+    qemu_fdt_setprop_cell(s->fdt, name, "#size-cells", 2);
+    qemu_fdt_setprop_cell(s->fdt, name, "phandle", s->phandle.usb);
+    g_free(name);
+
+    name = g_strdup_printf("/usb@%" PRIx32 "/dwc3@%" PRIx32,
+                           MM_USB2_CTRL_REGS, MM_USB_0);
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop(s->fdt, name, "compatible",
+                     compatDWC3, sizeof(compatDWC3));
+    qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                 2, MM_USB_0, 2, MM_USB_0_SIZE);
+    qemu_fdt_setprop(s->fdt, name, "interrupt-names",
+                     irq_name, sizeof(irq_name));
+    qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, VERSAL_USB0_IRQ_0,
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop_cell(s->fdt, name,
+                          "snps,quirk-frame-length-adjustment", 0x20);
+    qemu_fdt_setprop_cells(s->fdt, name, "#stream-id-cells", 1);
+    qemu_fdt_setprop_string(s->fdt, name, "dr_mode", "host");
+    qemu_fdt_setprop_string(s->fdt, name, "phy-names", "usb3-phy");
+    qemu_fdt_setprop(s->fdt, name, "snps,dis_u2_susphy_quirk", NULL, 0);
+    qemu_fdt_setprop(s->fdt, name, "snps,dis_u3_susphy_quirk", NULL, 0);
+    qemu_fdt_setprop(s->fdt, name, "snps,refclk_fladj", NULL, 0);
+    qemu_fdt_setprop(s->fdt, name, "snps,mask_phy_reset", NULL, 0);
+    qemu_fdt_setprop_cell(s->fdt, name, "phandle", s->phandle.dwc);
+    qemu_fdt_setprop_string(s->fdt, name, "maximum-speed", "high-speed");
+    g_free(name);
+}
+
 static void fdt_add_uart_nodes(VersalVirt *s)
 {
     uint64_t addrs[] = { MM_UART1, MM_UART0 };
@@ -515,6 +569,7 @@ static void versal_virt_init(MachineState *machine)
     fdt_add_gic_nodes(s);
     fdt_add_timer_nodes(s);
     fdt_add_zdma_nodes(s);
+    fdt_add_usb_xhci_nodes(s);
     fdt_add_sd_nodes(s);
     fdt_add_rtc_node(s);
     fdt_add_cpu_nodes(s, psci_conduit);
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 12ba6c4ebae..b0777166e89 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -145,6 +145,31 @@ static void versal_create_uarts(Versal *s, qemu_irq *pic)
     }
 }
 
+static void versal_create_usbs(Versal *s, qemu_irq *pic)
+{
+    DeviceState *dev;
+    MemoryRegion *mr;
+
+    object_initialize_child(OBJECT(s), "usb2", &s->lpd.iou.usb,
+                            TYPE_XILINX_VERSAL_USB2);
+    dev = DEVICE(&s->lpd.iou.usb);
+
+    object_property_set_link(OBJECT(dev), "dma", OBJECT(&s->mr_ps),
+                             &error_abort);
+    qdev_prop_set_uint32(dev, "intrs", 1);
+    qdev_prop_set_uint32(dev, "slots", 2);
+
+    sysbus_realize(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_add_subregion(&s->mr_ps, MM_USB_0, mr);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[VERSAL_USB0_IRQ_0]);
+
+    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+    memory_region_add_subregion(&s->mr_ps, MM_USB2_CTRL_REGS, mr);
+}
+
 static void versal_create_gems(Versal *s, qemu_irq *pic)
 {
     int i;
@@ -333,6 +358,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_apu_cpus(s);
     versal_create_apu_gic(s, pic);
     versal_create_uarts(s, pic);
+    versal_create_usbs(s, pic);
     versal_create_gems(s, pic);
     versal_create_admas(s, pic);
     versal_create_sds(s, pic);
-- 
2.20.1


