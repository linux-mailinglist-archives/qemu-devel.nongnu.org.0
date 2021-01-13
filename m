Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF212F47EA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:46:23 +0100 (CET)
Received: from localhost ([::1]:59892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcjO-0005os-7e
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXt-0001CG-9V
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:34:29 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:37472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXq-0004HF-Kw
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:34:29 -0500
Received: by mail-lf1-x132.google.com with SMTP id o17so1780496lfg.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 01:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=I+AoetiZnepp9WjawFt3jLw9mzREJLA0cq3LfLqtAkE=;
 b=zx4i59JGsADi7hRibalsZTQmTeljGD5tV2qP98ixn1C5zN6hmgqbJiNXWNoD4bAqve
 mIC6sFREQFkggDIH42n4FUEa1EF3lRslat/VZLs/8WkUuG6vumdGnZMy/k651ygGGwuM
 +wLWJvxvdvvMYphsMgtoxfNmA5o5Axk7OztgVIqsLelcZltUTvUSW7F/ZZmfhEemwUBN
 Zo7KAyK+wtcxlfMckQLqEWY8EmUkcVyo0v0OsKKF6dATkMnNY3wWlQLFitB1wHzISJuJ
 731yzFxLTserEcvOmTxj4jh3yPAdP/I/kQOrlw0L14bsSAYfcSvxLejlZYKzCrSjw5j3
 fDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=I+AoetiZnepp9WjawFt3jLw9mzREJLA0cq3LfLqtAkE=;
 b=njJJbeyy7MLQkFWN+/PdGe5fWCYEP0hv5YCZFxub8m2ZATqz/bLu9ZPajx02Aioj/n
 eWvE5vTzyDz83zE2tVGvYbN1JwYvCPoQe/Gfdu3PFKtko1y+zfcJDGo7OOy4m3smUKP3
 kt5kMY9DGmYnOkllc+FD3fYX3qb8W6nzCo39xhIsHG7ERCb+6iaYuej5AnEiX7Oc7uwh
 GZhjnaPsiqA8md94OcvTUevResOZ91V4yt+FD8QlzzNBiTSHu3bUcugGhhDSFBaX3Xdl
 aZEBlhwD+iGw+6bQMfE0Dre0hcL2gCaEDnfGuw3gYQqC9wzcD6aYaMJNpgqEfDpb+snZ
 F5RA==
X-Gm-Message-State: AOAM5302tGy/VsvS1wc1bM0Pa2ldNnC6dfImgevN59Ce8iSnDJs1g9cC
 hlTyBcUAg9vYzvzT1IYlP2iXzg==
X-Google-Smtp-Source: ABdhPJybiyxNEmN738adWO0/U+BXng+Oj5ro92juiRDBd2j5QTG3YzSSxJ6fi287IUuifD7f65ZNag==
X-Received: by 2002:a19:5050:: with SMTP id z16mr489204lfj.48.1610530465133;
 Wed, 13 Jan 2021 01:34:25 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c3sm127472ljk.88.2021.01.13.01.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 01:34:24 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv5 3/3] arm-virt: combine code for secure and non secure pl061
Date: Wed, 13 Jan 2021 12:34:17 +0300
Message-Id: <20210113093417.11606-4-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113093417.11606-1-maxim.uvarov@linaro.org>
References: <20210113093417.11606-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x132.google.com
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
index d38a7d5d2f..97b8d2fe9a 100644
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


