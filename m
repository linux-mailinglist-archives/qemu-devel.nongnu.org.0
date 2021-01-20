Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F9B2FCD7A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:32:55 +0100 (CET)
Received: from localhost ([::1]:46950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l29rD-0004nc-1x
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mT-0000ul-Rh
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:28:01 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:36272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l29mP-000569-PB
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:28:01 -0500
Received: by mail-lf1-x130.google.com with SMTP id o13so33232492lfr.3
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 01:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nyATO8LViNbtJAlpgYG4nBlTtGVbfXPoadAOe5B+tpw=;
 b=FeHkgiFL+Fqz/wKvODdXMXYqEbs8/4CqVnO+3nx31pdBGfH2tCQTLcS1kXkmvZT5sa
 rypEJZ3HxEDcvwC8X3SfbXXPUT1GZfSq/mEScbw73g0f9DGHwToS1O9E6dp2QkJ3nJH0
 p4XqvLsP9azFOrJnmur9JjmELvj//HmY1TW7SRo3v14fgEnRiH6D6o/9y+TRBboxaaRz
 aittoJmJnRcMsNyJesNrAKYBY+RA7EI88mmFKJaQFpvhpNIYYIGwIqhT7Cr95gcdy/e/
 paX5zk8pp8/YXz5LHbdPE7UIrkilfOHiW4jCa3fWoOB+XOpzYB6qcHX1CQ1aRpwW/tzq
 RT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nyATO8LViNbtJAlpgYG4nBlTtGVbfXPoadAOe5B+tpw=;
 b=GRGoPxA6waakglqokaQu0og3SadKoIGevedBdannYAU4xMfY9mpwHgLPaJzxZv2Ygl
 XqczHn6+tdKYU9IgriCV23yM25DVazmugNyWajc3CEicZSaEBbvQldFAssVOb6B6ZJeE
 3bIzhvKiRZkLl+CaFRD4tl4ynsFvzud+DROpMsQPJaTcbuTSoDOxCvavYEAdR7Z3TzRc
 ZvetVeLRq1PT53FEhANuSgfjdXf8+btyCF8eN/mABHejFrVigPGhIFOwt5piQkf8bpzG
 wwIfFnJWeyCK5dGWbtwuRvbFHHO0cM86JI0nonf+Ijnw2z5WQYTG1YXpP5d1DMyKcMw1
 LI7A==
X-Gm-Message-State: AOAM533AU3ToYFs7ED+v7UokVFhlzq9s3ZlXa8BcX8tvWeuaxZn915VF
 fdyWbq6rD31/mrTRavh+xlKD9A==
X-Google-Smtp-Source: ABdhPJyjQ1UmZzu7C6VCpG7dm4oHh449cI+yMWMTk+16zMNgPygzTCicKcLbgA+xZGLKu8IQWmdy+w==
X-Received: by 2002:a19:7ed2:: with SMTP id z201mr1918924lfc.310.1611134876232; 
 Wed, 20 Jan 2021 01:27:56 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id r81sm147479lff.215.2021.01.20.01.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 01:27:55 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv8 3/3] arm-virt: add secure pl061 for reset/power down
Date: Wed, 20 Jan 2021 12:27:48 +0300
Message-Id: <20210120092748.14789-4-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120092748.14789-1-maxim.uvarov@linaro.org>
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x130.google.com
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

Add secure pl061 for reset/power down machine from
the secure world (Arm Trusted Firmware). Connect it
with gpio-pwr driver.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 47 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  2 ++
 3 files changed, 50 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0a242e4c5d..13cc42dcc8 100644
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
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c427ce5f81..060a5f492e 100644
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
+#define SECURE_GPIO_REBOOT   1
+
+static void create_gpio_pwr(const VirtMachineState *vms,
+                            DeviceState *pl061_dev,
+                            uint32_t phandle)
+{
+    DeviceState *gpio_pwr_dev;
+
+    /* gpio-pwr */
+    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
+
+    /* connect secure pl061 to gpio-pwr */
+    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_REBOOT,
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
+                           "gpios", phandle, SECURE_GPIO_REBOOT, 0);
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "status", "disabled");
+    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "secure-status",
+                            "okay");
+}
+
 static void create_gpio_devices(const VirtMachineState *vms, int gpio,
                                 MemoryRegion *mem)
 {
@@ -883,6 +921,8 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     /* Child gpio devices */
     if (gpio == VIRT_GPIO) {
         create_gpio_keys(vms, pl061_dev, phandle);
+    } else {
+        create_gpio_pwr(vms, pl061_dev, phandle);
     }
 }
 
@@ -2015,6 +2055,10 @@ static void machvirt_init(MachineState *machine)
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
+    if (vms->secure && !vmc->no_secure_gpio) {
+        create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
@@ -2630,8 +2674,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
 
 static void virt_machine_5_2_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_6_0_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
+    vmc->no_secure_gpio = true;
 }
 DEFINE_VIRT_MACHINE(5, 2)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index abf54fab49..6f6c85ffcf 100644
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
-- 
2.17.1


