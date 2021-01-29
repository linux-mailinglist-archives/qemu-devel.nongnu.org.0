Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EBC308808
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:05:07 +0100 (CET)
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RaM-0001Am-9v
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW2-0004K9-07
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:38 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVl-0006u5-Vj
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:37 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s7so5397142wru.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IZw90pBbEJuDGmT7ybNPwx+U6Cu2tjmujRdy/bOW5DA=;
 b=AdCLESygSf5TVl31hugNxxzk9mIh4KMM7upRCyCi2k2o+iIBDxKXH2Gr8d1rCb6mEP
 QSx2ctjX/QeZ632lvvERx3uBa8q5jpzzMLF+xYNigs5YfeuLEdTt6slO546+02RZ2WMg
 WZyDI1H5luBOCSQF8KOQD/IsjJPzbKam6fYhsBqz17rOK4PRySNjtMj5qKXLX+EaUoBd
 o+6Sxl6h1g0skwO34okMN1MBLku1jbq0BY8PEQ3RWS7FuKWG+BKeO9CK24G7+yrkRaQS
 UPb9zn1gK1Wsr3fwWy/9Hq8na81sRTMfLJ09K45yQXmAa2o/yx4dPblYbPSzHb7R36lT
 phEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZw90pBbEJuDGmT7ybNPwx+U6Cu2tjmujRdy/bOW5DA=;
 b=Y+YeT81hHbQ2OqvYMuN2M84PVF4lJLbMhotclZwvi48QKP31twJTscj2YvonhPp4Ao
 gDRXXJreKSncDPvpVJ05XQ6q+ZfmMDRAZSnhJT4mcniV/AjflEIEdHdk7m6eEDK1OHJh
 WfXihBuXNTntRx0mDITxPkkc3n4/8Ul1YOMS6VtWSJOAxdH5U9tq9MlKPJC9wlmhUFd4
 IFgwoaCluVU0UURPr6uPPpJdIUl176Jj9I/xqmqfsLysxTeqrMdZ/FsocfEBG5lMDDRY
 D6XHh2DQM+rnirV25GZ5YEWqeHTiOVCK7lTIWAv5ZkSIaU95BuRM26VoMsaGB6685p/g
 KW0w==
X-Gm-Message-State: AOAM532z8/J9UeJFtHoLXJKe6RqEYjT6lQGzbJRkoXt4kMw7866Dsp4R
 iYvpgX1WIWkjKjVJ7eiutU9uSl9t2wNMuQ==
X-Google-Smtp-Source: ABdhPJwCbVq5n5OGqGsmAJsV7lolOHW3LS1zZxSHw2IfA7gcMVm4juI0wg9/kz9l4pExZmCJW34wLg==
X-Received: by 2002:adf:ee0d:: with SMTP id y13mr3955997wrn.228.1611918020591; 
 Fri, 29 Jan 2021 03:00:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/46] arm-virt: add secure pl061 for reset/power down
Date: Fri, 29 Jan 2021 10:59:32 +0000
Message-Id: <20210129110012.8660-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

Add secure pl061 for reset/power down machine from
the secure world (Arm Trusted Firmware). Connect it
with gpio-pwr driver.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
[PMM: Added mention of the new device to the documentation]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/virt.rst |  2 ++
 include/hw/arm/virt.h    |  2 ++
 hw/arm/virt.c            | 56 +++++++++++++++++++++++++++++++++++++++-
 hw/arm/Kconfig           |  1 +
 4 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 32dc5eb22ee..27652adfae1 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -43,6 +43,8 @@ The virt board supports:
 - Secure-World-only devices if the CPU has TrustZone:
 
   - A second PL011 UART
+  - A second PL061 GPIO controller, with GPIO lines for triggering
+    a system reset or system poweroff
   - A secure flash memory
   - 16MB of secure RAM
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e4a2d216420..36fcb296415 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -81,6 +81,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_SECURE_GPIO,
     VIRT_PCDIMM_ACPI,
     VIRT_ACPI_GED,
     VIRT_NVDIMM_ACPI,
@@ -127,6 +128,7 @@ struct VirtMachineClass {
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
     bool acpi_expose_flash;
+    bool no_secure_gpio;
 };
 
 struct VirtMachineState {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5e364656037..399da734548 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -153,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
     [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
     [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
+    [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -841,6 +842,43 @@ static void create_gpio_keys(const VirtMachineState *vms,
                            "gpios", phandle, 3, 0);
 }
 
+#define SECURE_GPIO_POWEROFF 0
+#define SECURE_GPIO_RESET    1
+
+static void create_secure_gpio_pwr(const VirtMachineState *vms,
+                                   DeviceState *pl061_dev,
+                                   uint32_t phandle)
+{
+    DeviceState *gpio_pwr_dev;
+
+    /* gpio-pwr */
+    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
+
+    /* connect secure pl061 to gpio-pwr */
+    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_RESET,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
+    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_POWEROFF,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-poweroff");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "compatible",
+                            "gpio-poweroff");
+    qemu_fdt_setprop_cells(vms->fdt, "/gpio-poweroff",
+                           "gpios", phandle, SECURE_GPIO_POWEROFF, 0);
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "status", "disabled");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "secure-status",
+                            "okay");
+
+    qemu_fdt_add_subnode(vms->fdt, "/gpio-restart");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "compatible",
+                            "gpio-restart");
+    qemu_fdt_setprop_cells(vms->fdt, "/gpio-restart",
+                           "gpios", phandle, SECURE_GPIO_RESET, 0);
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "status", "disabled");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "secure-status",
+                            "okay");
+}
+
 static void create_gpio_devices(const VirtMachineState *vms, int gpio,
                                 MemoryRegion *mem)
 {
@@ -873,10 +911,19 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
     qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
 
+    if (gpio != VIRT_GPIO) {
+        /* Mark as not usable by the normal world */
+        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+    }
     g_free(nodename);
 
     /* Child gpio devices */
-    create_gpio_keys(vms, pl061_dev, phandle);
+    if (gpio == VIRT_GPIO) {
+        create_gpio_keys(vms, pl061_dev, phandle);
+    } else {
+        create_secure_gpio_pwr(vms, pl061_dev, phandle);
+    }
 }
 
 static void create_virtio_devices(const VirtMachineState *vms)
@@ -2008,6 +2055,10 @@ static void machvirt_init(MachineState *machine)
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
+    if (vms->secure && !vmc->no_secure_gpio) {
+        create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
@@ -2623,8 +2674,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
 
 static void virt_machine_5_2_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_6_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    vmc->no_secure_gpio = true;
 }
 DEFINE_VIRT_MACHINE(5, 2)
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0a242e4c5d8..13cc42dcc84 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -17,6 +17,7 @@ config ARM_VIRT
     select PL011 # UART
     select PL031 # RTC
     select PL061 # GPIO
+    select GPIO_PWR
     select PLATFORM_BUS
     select SMBIOS
     select VIRTIO_MMIO
-- 
2.20.1


