Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A3300F57
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:54:37 +0100 (CET)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34O4-0001vA-Qm
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M9-0000Tw-VI
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:52:37 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:46619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M6-0007Ij-6n
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:52:37 -0500
Received: by mail-lj1-x234.google.com with SMTP id u11so8168621ljo.13
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uWdb+6sbsmmk4J0dROkTnS6VgjAUEcnwu8MSo63pZwk=;
 b=ShykAJE8kUjlLlXhyDShniXiaA+p21UBg6Kzv2lgVpkCA/VnqX4GMkFo6h9EYHfGv6
 YM1F9UTNFVNyRrX+Ek/HJwnM/lePQL3tr4lNWGbjiZGTplGKSLWfVRV0DNtR9J/p1llA
 jE73GqjtvypjCqZ/bCEsdpAXUkvnsJgttLjt4enu8D6x6ODSbH9uXtVPC6Bih14ykPu4
 PrfJdwgTdODUkzqC8W4ZCJZxNFQ3JJZd0/TgmbaqSTYH2CZUEbqgDIXY2QFrmxNZuGKv
 LjhOC0zpZNquxHjQyba+fPebkttp41964q+/FlyBMTUJrNhDhYVKu3GG9hL1NtADmDJ1
 GjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uWdb+6sbsmmk4J0dROkTnS6VgjAUEcnwu8MSo63pZwk=;
 b=APGMXcFjVZg2RtLK+njWpAPyXbjtsoCg5+m6WgpzFEhgMlRiNP62Fjggl9ln+EJ7ya
 Deve+IVPkxm+PVKgy0NLBTuGIzo+/Y5lT4obhsK8mSZ4JeRLtmrPmFU0W//pO/8jyE3A
 dAp6LeBn32TkJgLC7kL+SB6KUfIQ32G0B19dXBymgWbEqIwk6FII784yKslAkUUGXIjK
 EGnxU/enbjnC1aYX6CiXbYQREOrIEFZdhC3v9bmDFP8oR2yEPSEfzp4cUKcgiL1Cpxe+
 zeMhIsnauKlaoER2Cncdj7Yz0SbS0yKHMaEnQmWMo7qZFJ/ek7FJaqn11dbQ0fZfXnUv
 byCw==
X-Gm-Message-State: AOAM5304pwmxyAseCKVYeKgeCi9/fE0R6bryIyyBoZAF2uz9pxQMs3My
 IUUxTwrS+BW2H7zRLstUU0ueu5houAlO9Q==
X-Google-Smtp-Source: ABdhPJyI5L28PrI7Je2qcFcHv6+n0mvQkKnBe+mA6OTQgFcVScXWcbgSLe85G4FgqEH5f85TrHBPdQ==
X-Received: by 2002:a2e:8350:: with SMTP id l16mr3509585ljh.403.1611352352593; 
 Fri, 22 Jan 2021 13:52:32 -0800 (PST)
Received: from localhost.localdomain ([176.59.42.245])
 by smtp.gmail.com with ESMTPSA id a11sm1019890lfl.22.2021.01.22.13.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:52:31 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv9 2/3] arm-virt: refactor gpios creation
Date: Sat, 23 Jan 2021 00:52:21 +0300
Message-Id: <20210122215222.8320-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122215222.8320-1-maxim.uvarov@linaro.org>
References: <20210122215222.8320-1-maxim.uvarov@linaro.org>
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

No functional change. Just refactor code to better
support secure and normal world gpios.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 57 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 96985917d3..a135316741 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -820,17 +820,43 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
-static void create_gpio(const VirtMachineState *vms)
+static void create_gpio_keys(const VirtMachineState *vms,
+                             DeviceState *pl061_dev,
+                             uint32_t phandle)
+{
+    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
+                                        qdev_get_gpio_in(pl061_dev, 3));
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#address-cells", 1);
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys/poweroff");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys/poweroff",
+                            "label", "GPIO Key Poweroff");
+    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys/poweroff", "linux,code",
+                          KEY_POWER);
+    qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
+                           "gpios", phandle, 3, 0);
+}
+
+static void create_gpio_devices(const VirtMachineState *vms, int gpio,
+                                MemoryRegion *mem)
 {
     char *nodename;
     DeviceState *pl061_dev;
-    hwaddr base = vms->memmap[VIRT_GPIO].base;
-    hwaddr size = vms->memmap[VIRT_GPIO].size;
-    int irq = vms->irqmap[VIRT_GPIO];
+    hwaddr base = vms->memmap[gpio].base;
+    hwaddr size = vms->memmap[gpio].size;
+    int irq = vms->irqmap[gpio];
     const char compat[] = "arm,pl061\0arm,primecell";
+    SysBusDevice *s;
 
-    pl061_dev = sysbus_create_simple("pl061", base,
-                                     qdev_get_gpio_in(vms->gic, irq));
+    pl061_dev = qdev_new("pl061");
+    s = SYS_BUS_DEVICE(pl061_dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
     uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
     nodename = g_strdup_printf("/pl061@%" PRIx64, base);
@@ -847,21 +873,10 @@ static void create_gpio(const VirtMachineState *vms)
     qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
 
-    gpio_key_dev = sysbus_create_simple("gpio-key", -1,
-                                        qdev_get_gpio_in(pl061_dev, 3));
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#address-cells", 1);
-
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys/poweroff");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys/poweroff",
-                            "label", "GPIO Key Poweroff");
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys/poweroff", "linux,code",
-                          KEY_POWER);
-    qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
-                           "gpios", phandle, 3, 0);
     g_free(nodename);
+
+    /* Child gpio devices */
+    create_gpio_keys(vms, pl061_dev, phandle);
 }
 
 static void create_virtio_devices(const VirtMachineState *vms)
@@ -1990,7 +2005,7 @@ static void machvirt_init(MachineState *machine)
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
-        create_gpio(vms);
+        create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
      /* connect powerdown request */
-- 
2.17.1


