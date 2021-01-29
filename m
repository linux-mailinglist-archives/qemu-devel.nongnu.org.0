Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFC1308803
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:03:01 +0100 (CET)
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RYJ-00067D-Ug
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVu-0004Ee-Ef
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:33 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVl-0006tf-TL
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id 6so8389522wri.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FtNu0X6aw+UWU/grRMnywbZfUCpJxNqSTCzA8QG7YAM=;
 b=Dptx+ifBAw46NuD/QrZp2NTZFfXLI4Z7AIPXzfM0Y4cYMTr086e6qFUJIYICFRN4v2
 B7chMqUZnMI9j8cwerECp9cqRhKNffqwaAdhok5AMfIyTh5U/6i8LTEVdAPVa+h6dqOk
 Qrnj/wE1TZpuQMQgH/gIIjBiFhWpSsawupQer6ZNsBx2VfqZIsi7aQE/7QNoXV1hqOuk
 kQ3ruBVWxnn68FXp8DqA0UnS0RhjrXzJ385FTvyQkb1QjmdDOeDWZsKvnG3f18FJy7y9
 v9RB9GahjNypb+ZMxSGxa91nf3BKeUUcIqcWBqUCb7L3zo1yv6XFpuojwNxl4Z52MrTN
 KR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtNu0X6aw+UWU/grRMnywbZfUCpJxNqSTCzA8QG7YAM=;
 b=PpKDdmTqJsfVjNWuU+SK355inHYLh8rkTm47EBOga3VZj1IwCN98HuNd4L/2Mg/5ic
 ntG6Ic3e1Wnmx4XMSG+rdZTZV/EnJc3lmCc4ZlJY1CYUahG8jknKVFsl5Uyro458RwY1
 Ilq/kh1YQDAQU/uRPlQnjA2keteincVBedHlknhi2zvKK7Axd5Pfa2Np2+D4ZLSnLzV0
 A9JPbxCJv6hx03qj8ryxOKqI0AUilZVp6NhQIMc9YrN5HC6XHy18dPdnDUoNwA9/TKc2
 WsDXsrkhL5hl0TCx/2QbR8Ah+2o7zIc6BXEWyge+yHvqxNafk2GyIVr7bHTZ3n72uij1
 1G4g==
X-Gm-Message-State: AOAM532Ffxg/85zvWsrHnvyQ1YCurRjRAvhNcLnn3t3aJTz5zRAA3jUa
 i3QhO8QDzoUJsyMmsG9a6ADgHgVlNy21LQ==
X-Google-Smtp-Source: ABdhPJyZULW57UYOfpfXU/t8xLj6Ql+6TqmWAj0S5PSTuvoaa/aFsSASNv/QSkiZr+c024fn8oZ9xw==
X-Received: by 2002:adf:dfce:: with SMTP id q14mr3851141wrn.133.1611918019663; 
 Fri, 29 Jan 2021 03:00:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/46] arm-virt: refactor gpios creation
Date: Fri, 29 Jan 2021 10:59:31 +0000
Message-Id: <20210129110012.8660-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Maxim Uvarov <maxim.uvarov@linaro.org>

No functional change. Just refactor code to better
support secure and normal world gpios.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 57 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 86070dfd98b..5e364656037 100644
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
2.20.1


