Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A1E2F766A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:16:28 +0100 (CET)
Received: from localhost ([::1]:53554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0M9b-0007cn-6a
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4x-0004Ah-0Q
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:11:39 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:43467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4v-00020M-64
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:11:38 -0500
Received: by mail-lj1-x22a.google.com with SMTP id e7so9763345ljg.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 02:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O0YFV+YZ2UgNy+qYmX9Ey2NvrguxWS3z2aink+mDMlk=;
 b=f1Dsv9UiD5W2bniEep1IrvuvHE8e8djFbIapgurHoq+nn+za8SE4UJqGugx8gA3f+X
 N19LTFj0cr47siGlxuJVaZuFOFUYpyZbYC4XKrABf/ZN6qv7ehlYjlT/4lc8XrVPdb8v
 xRVnqkjboHoiNTa3qn5vwGnQMVWaJ4/xOtPgQsw5HMEe+wI2edSNt8hNDFl7NZ9+e6bP
 h9ZU7cDmh7gOEB7lHgJJuxQdsuLgFcSDGwjqbSZM1NkTkcjADUfD6YHVq74j9fpjaxUR
 cz5uSamDsrqBWIAxnuP6V8wLGoRBtB96onNb32MMz4WI07VS3+9As1eJr7NR4MQA1Ppn
 0aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O0YFV+YZ2UgNy+qYmX9Ey2NvrguxWS3z2aink+mDMlk=;
 b=jTo9WZRKMC1lkT7VI5DYJU+eHg5NIxptdHeGeq6vTn0QGZPbf3pCJu/VMSfh0xXka/
 ElQt73dfr1ZXRVrMP5ylvKP0jPcJ4IWSTZeJf++/ViIo396sE9miF6vKhz1p8lsUv3Sj
 9a7uFK27zaf2lHJaGklm9d8PC6mke88I3BD/hqlg+RvW3hcu4s8Op7tIgegWyhYoE4Lf
 sOpNi0ZgkfOIsRXBYMm5iUhO2GiIGLP9EmWncX9Wyotb6HxwjKj7DbaSU7Bk5XI0aRTS
 JuCKECAwQzPfG6m9qUYvhMrahSj+ZP6dY/+x6sUqIU8pL0FRI7LmJThmYou44c0nikoe
 SuDw==
X-Gm-Message-State: AOAM533zTMeIummvz35otxCyBalUvmnMUGczBP1JhBn6l8n60tvOhCkC
 yner/OwowEVg/t4sHL7nGPZrcA==
X-Google-Smtp-Source: ABdhPJw4XFAmkEM+HFr0bbLg9HSedp0NTQSqoC9FiVLYJ9pm3uDrii+x1qrd2Tnsboa3zEGjm5J4YQ==
X-Received: by 2002:a2e:9dd2:: with SMTP id x18mr4937319ljj.359.1610705495612; 
 Fri, 15 Jan 2021 02:11:35 -0800 (PST)
Received: from localhost.localdomain ([91.193.178.207])
 by smtp.gmail.com with ESMTPSA id a15sm731886lji.105.2021.01.15.02.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 02:11:34 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv7 3/3] arm-virt: add secure pl061 for reset/power down
Date: Fri, 15 Jan 2021 13:11:26 +0300
Message-Id: <20210115101126.4259-4-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115101126.4259-1-maxim.uvarov@linaro.org>
References: <20210115101126.4259-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22a.google.com
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
 hw/arm/virt.c         | 50 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  2 ++
 3 files changed, 53 insertions(+)

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
index 26bb66e8e1..436ae894c9 100644
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
@@ -841,6 +842,46 @@ static void create_gpio_keys(const VirtMachineState *vms,
                            "gpios", phandle, 3, 0);
 }
 
+#define ATF_GPIO_POWEROFF 3
+#define ATF_GPIO_REBOOT   4
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
+    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
+    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
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
 static void create_gpio_devices(const VirtMachineState *vms, int gpio,
                                 MemoryRegion *mem)
 {
@@ -888,6 +929,8 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     /* Child gpio devices */
     if (gpio == VIRT_GPIO) {
         create_gpio_keys(vms, pl061_dev, phandle);
+    } else {
+        create_gpio_pwr(vms, pl061_dev, phandle);
     }
 }
 
@@ -2020,6 +2063,10 @@ static void machvirt_init(MachineState *machine)
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
 
+    if (vms->secure && !vmc->no_secure_gpio) {
+        create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
@@ -2635,8 +2682,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
 
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


