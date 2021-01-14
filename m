Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30362F6383
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:55:37 +0100 (CET)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l042C-0005FS-Nc
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l03xU-0008JF-7C
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:44 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:41346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l03xQ-0003zU-Sv
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:43 -0500
Received: by mail-lj1-x234.google.com with SMTP id f11so6719052ljm.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jGYU+nA0TIHebPXystscyGzvQkB9/q2d05StWBrL4ng=;
 b=mn9w+SpGr4UyLG+K2iCpMgrvgeARmqirlrkbrZrS24DY2pCicitsyFIciR8B4X4lxx
 szOBMFPjZsxy41jG7vIeMQTSoU09+kBn9HYSDGr5D9HxSTqmE7fLAGfPKVKd7WGpy2cq
 KWOS3Tdc/vTZh6T9bAs2jDOnCQSUeegCFnuFxxFGowkjns+ZM1JcyE7nxJ/0mrXfWT7F
 h/z5z13LBdRnd+3O5vc4P5n/KvD/XqWbLYSblZ9MHrK4c7HcVgaiQmxitavNQlHCW+7F
 VBEhlajElk5iZZxm2kefUupeN2cAwr6n/uzc44pVGLO5IagU3UXDV0Nu6Fpb3j+JZpaV
 l9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jGYU+nA0TIHebPXystscyGzvQkB9/q2d05StWBrL4ng=;
 b=eDJ91j7MJTO7UnZJ1dnOUAEOz3kmfF4ARQ88WE5mzOBazmzjlhcLFLtdOTjnsTE2Vm
 1XsjHYDBKJgeoBcyH7JxjhlCgdVbbnMwVBPfDhxEnNQaCV0lKA/NvM0z3eVTfbre5z34
 BgiLG4LboHYyDY3hxjKzPNjOUw1/VIg/Ir7lptpNkdI0a649JnHc/6O2KkI9zUSEsvhu
 9DlKvGiI18VHCvlVTYbW90OPUMKDOhnF7TKKpdyLeWgUNZS56EzS1/xR1dRdgIC0VOBy
 Dp3evWfMWOhIeCU88J5SYZIqYksHOaKXmmjUqv/WZ3TisMVjedS2V/kOtMhPV5xwMJ2W
 TZCQ==
X-Gm-Message-State: AOAM531sr6hJ1zQVMlIDfnxfc8tV522UuZkCSIt08o9HpbSTBygC9cYB
 fkzWPmh/qvn+9XzStfmC8PD3WA==
X-Google-Smtp-Source: ABdhPJxtBlQGJnyok1lbhfELhlC7keSjRq5dEgW71kdGOE9Zh1k66S1spbqa3culHo/0IRULfLa1/Q==
X-Received: by 2002:a2e:a494:: with SMTP id h20mr3423122lji.145.1610635839367; 
 Thu, 14 Jan 2021 06:50:39 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id p5sm567229lfj.295.2021.01.14.06.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:50:38 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv6 3/3] arm-virt: combine code for secure and non secure pl061
Date: Thu, 14 Jan 2021 17:50:32 +0300
Message-Id: <20210114145032.8457-4-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210114145032.8457-1-maxim.uvarov@linaro.org>
References: <20210114145032.8457-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x234.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com, f4bug@amsat.org,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Combine code for secure and non secure pl061 (gpio) with
refining fdt creation.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/virt.c | 122 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 83 insertions(+), 39 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6f3ec15985..5317f32e3a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -821,35 +821,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
-static void create_gpio(const VirtMachineState *vms)
+static void create_gpio_keys(const VirtMachineState *vms,
+                             DeviceState *pl061_dev,
+                             uint32_t phandle)
 {
-    char *nodename;
-    DeviceState *pl061_dev;
-    hwaddr base = vms->memmap[VIRT_GPIO].base;
-    hwaddr size = vms->memmap[VIRT_GPIO].size;
-    int irq = vms->irqmap[VIRT_GPIO];
-    const char compat[] = "arm,pl061\0arm,primecell";
-
-    pl061_dev = sysbus_create_simple("pl061", base,
-                                     qdev_get_gpio_in(vms->gic, irq));
-
-    uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
-    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                 2, base, 2, size);
-    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "#gpio-cells", 2);
-    qemu_fdt_setprop(vms->fdt, nodename, "gpio-controller", NULL, 0);
-    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
-                           GIC_FDT_IRQ_TYPE_SPI, irq,
-                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "clocks", vms->clock_phandle);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
-
     gpio_key_dev = sysbus_create_simple("gpio-key", -1,
                                         qdev_get_gpio_in(pl061_dev, 3));
+
     qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
     qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
     qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
@@ -862,24 +840,16 @@ static void create_gpio(const VirtMachineState *vms)
                           KEY_POWER);
     qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
                            "gpios", phandle, 3, 0);
-    g_free(nodename);
 }
 
 #define ATF_GPIO_POWEROFF 3
 #define ATF_GPIO_REBOOT   4
 
-static void create_gpio_secure(const VirtMachineState *vms, MemoryRegion *mem)
+static void create_gpio_pwr(const VirtMachineState *vms,
+                            DeviceState *pl061_dev,
+                            uint32_t phandle)
 {
     DeviceState *gpio_pwr_dev;
-    SysBusDevice *s;
-    hwaddr base = vms->memmap[VIRT_SECURE_GPIO].base;
-    DeviceState *pl061_dev;
-
-    /* Secure pl061 */
-    pl061_dev = qdev_new("pl061");
-    s = SYS_BUS_DEVICE(pl061_dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
 
     /* gpio-pwr */
     gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
@@ -889,8 +859,82 @@ static void create_gpio_secure(const VirtMachineState *vms, MemoryRegion *mem)
                           qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
     qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
                           qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr", "compatible", "gpio-pwr");
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#size-cells", 0);
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr", "#address-cells", 1);
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/poweroff");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/poweroff",
+                            "label", "GPIO PWR Poweroff");
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/poweroff", "code",
+                          ATF_GPIO_POWEROFF);
+    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/poweroff",
+                           "gpios", phandle, 3, 0);
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-pwr/reboot");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-pwr/reboot",
+                            "label", "GPIO PWR Reboot");
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-pwr/reboot", "code",
+                          ATF_GPIO_REBOOT);
+    qemu_fdt_setprop_cells(vms->fdt, "/gpio-pwr/reboot",
+                           "gpios", phandle, 3, 0);
+}
+
+static void create_gpio_devices(const VirtMachineState *vms, int gpio,
+                                MemoryRegion *mem)
+{
+    char *nodename;
+    DeviceState *pl061_dev;
+    hwaddr base = vms->memmap[gpio].base;
+    hwaddr size = vms->memmap[gpio].size;
+    int irq = vms->irqmap[gpio];
+    const char compat[] = "arm,pl061\0arm,primecell";
+    SysBusDevice *s;
+
+    pl061_dev = qdev_new("pl061");
+    s = SYS_BUS_DEVICE(pl061_dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
+
+    uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
+    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "#gpio-cells", 2);
+    qemu_fdt_setprop(vms->fdt, nodename, "gpio-controller", NULL, 0);
+    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "clocks", vms->clock_phandle);
+    qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
+    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
+
+    if (gpio == VIRT_GPIO) {
+        qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
+    } else {
+        /* Mark as not usable by the normal world */
+        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+
+        qemu_fdt_setprop_string(vms->fdt, "/secure-chosen", "stdout-path",
+                                nodename);
+    }
+    g_free(nodename);
+
+    /* Child gpio devices */
+    if (gpio == VIRT_GPIO) {
+        create_gpio_keys(vms, pl061_dev, phandle);
+    } else {
+        create_gpio_pwr(vms, pl061_dev, phandle);
+    }
 }
 
+
 static void create_virtio_devices(const VirtMachineState *vms)
 {
     int i;
@@ -2017,11 +2061,11 @@ static void machvirt_init(MachineState *machine)
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
-        create_gpio(vms);
+        create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
     if (vms->secure && !vmc->no_secure_gpio) {
-        create_gpio_secure(vms, secure_sysmem);
+        create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
     }
 
      /* connect powerdown request */
-- 
2.17.1


