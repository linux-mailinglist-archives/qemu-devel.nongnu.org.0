Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3562F3314
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:40:56 +0100 (CET)
Received: from localhost ([::1]:34796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKqt-0005mZ-52
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhT-0006El-ID
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:31:13 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:45624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzKhO-0004fd-EQ
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:31:11 -0500
Received: by mail-lj1-x22f.google.com with SMTP id f17so3006372ljg.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 06:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QCSkSvV5HRs0ULOp7vuKE7k9WF5Xyng96RKUNvE/TUM=;
 b=tgMgHDpUWkiKkpPbA5daH9ZlFpD91A1MeXp5VyAwmDGM/n1ugUxSAB3NekkkiVe9+v
 Nk/Wi1YgrPRW09n7Ht8aftDtkskvt3hW7iWzJeYClm5jdkG2A0YOW8rQe9EC0N1fGwHe
 ILjdR1LYNqeT2Wtsmka3cOmqE2CgCUL+sIQoxQ9um5lRQnEM85ZD0E8eMK6sIKvRsFX0
 NajjQek+WKze7BBZM+JbhYGtrUKb0o30Gfyw4swZxftSO2GOWQNxR8aYHejiKfLzDzUM
 ESVGK+HVY1i97xAejZOgdCCA7T1S9spNJP+FgEy8wkvcj7392ENm+2z9k9igvOAmi1v2
 Ug6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QCSkSvV5HRs0ULOp7vuKE7k9WF5Xyng96RKUNvE/TUM=;
 b=F9RodGLqqGWKTqMumPhThJMuXEoDqER3DSMQeqeIGtnpN9ywLNmhe1unnUvgHWwcNk
 x5rvTXueUVjrQx9pdp4dRUir21tFTytEN3ss14gVFsi95vAQQvxs4a71WcrRtizo1r1z
 3GUSGTbKfRChsmvCMNAHRwbXz7T6LFN3toZ7Qqde4XoPPZ9rpw6lzEjDc3E9AJbsQjsw
 8ieg8nZLBBRcSCKrJE6U38eeH9lF743EukJpKTGVO+R8sulZck62kmWJVNM5vP52Izjc
 XmcH78rJuhdLBvZm/dP3ocwNtFMHGKJMuFK9NpT8vSky8IjmwYLJTiM2RbXtBZwQBgz9
 hubQ==
X-Gm-Message-State: AOAM532xeDY5WzfXNEpttbKvyNpteT7z2f6NbmpbhGAMdIaaXbS5pNUV
 WdwJjkCfnA2xH7pvMGm7iWrSXg==
X-Google-Smtp-Source: ABdhPJys91ryDkt1NGX5GgmMXFr/tlHcDv/JwobPsh5+KbkcpFSGv6Hae3QnicN79/QrugEDiYjpoQ==
X-Received: by 2002:a2e:7307:: with SMTP id o7mr2110422ljc.452.1610461864211; 
 Tue, 12 Jan 2021 06:31:04 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c24sm365499ljn.116.2021.01.12.06.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:31:03 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
Date: Tue, 12 Jan 2021 17:30:58 +0300
Message-Id: <20210112143058.12159-3-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112143058.12159-1-maxim.uvarov@linaro.org>
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, Maxim Uvarov <maxim.uvarov@linaro.org>,
 f4bug@amsat.org, Jose.Marinho@arm.com, tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add secure pl061 for reset/power down machine from
the secure world (Arm Trusted Firmware). Connect it
with gpio-pwr driver.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 hw/arm/Kconfig        |  1 +
 hw/arm/virt.c         | 40 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  3 +++
 3 files changed, 44 insertions(+)

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
index 96985917d3..19605390c2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -147,6 +147,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
+    [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
     [VIRT_PCDIMM_ACPI] =        { 0x09070000, MEMORY_HOTPLUG_IO_LEN },
@@ -864,6 +865,32 @@ static void create_gpio(const VirtMachineState *vms)
     g_free(nodename);
 }
 
+#define ATF_GPIO_POWEROFF 3
+#define ATF_GPIO_REBOOT   4
+
+static void create_gpio_secure(const VirtMachineState *vms, MemoryRegion *mem)
+{
+    DeviceState *gpio_pwr_dev;
+    SysBusDevice *s;
+    hwaddr base = vms->memmap[VIRT_SECURE_GPIO].base;
+    DeviceState *pl061_dev;
+
+    /* Secure pl061 */
+    pl061_dev = qdev_new("pl061");
+    s = SYS_BUS_DEVICE(pl061_dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
+
+    /* gpio-pwr */
+    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
+
+    /* connect secure pl061 to gpio-pwr */
+    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
+    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
+                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
+}
+
 static void create_virtio_devices(const VirtMachineState *vms)
 {
     int i;
@@ -1993,6 +2020,10 @@ static void machvirt_init(MachineState *machine)
         create_gpio(vms);
     }
 
+    if (vms->secure && vms->secure_gpio) {
+        create_gpio_secure(vms, secure_sysmem);
+    }
+
      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);
@@ -2567,6 +2598,12 @@ static void virt_instance_init(Object *obj)
         vms->its = true;
     }
 
+    if (vmc->no_secure_gpio) {
+        vms->secure_gpio = false;
+    }  else {
+        vms->secure_gpio = true;
+    }
+
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
@@ -2608,8 +2645,11 @@ DEFINE_VIRT_MACHINE_AS_LATEST(6, 0)
 
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
index abf54fab49..a140e75444 100644
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
@@ -136,6 +138,7 @@ struct VirtMachineState {
     FWCfgState *fw_cfg;
     PFlashCFI01 *flash[2];
     bool secure;
+    bool secure_gpio;
     bool highmem;
     bool highmem_ecam;
     bool its;
-- 
2.17.1


