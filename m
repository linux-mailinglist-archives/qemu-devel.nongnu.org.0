Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17ED689F4F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:32:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyxY-0001NG-Pa; Fri, 03 Feb 2023 11:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNyxU-0001KB-WC
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:30:41 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNyxP-0007mp-2R
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:30:37 -0500
Received: by mail-wr1-x433.google.com with SMTP id j25so1611952wrc.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rI8YBskLtC8mMs+vacOa3C62UUOa+s+K2Ki5NU8X6dw=;
 b=P4p9vMoYeGHLOtIRjTyP8rs+AoGOwUYjOPjdDUUL/ej3rquQ1e1WNMGK/jxuoBCZzj
 AlmuHpFIkyOalCcVkvOM+HAKiahel/q7gMqywE27avxsEzukSLkDyPvTw7YbzqV94ONu
 3UznkYYheR4UG6HkuHIo/RIoeFRdcmtkrXNEE9xT+uQSD347Guc298I0WvIKMjTJrbl+
 8KGgl6Ga4EB5EtW4xh/rHnAmk99tD2mxNS8y9LtLKtRHhESYGogBDoH50WFdvd/8vvxY
 aePaUpqPKsV4rw3g0bGUhnGWrPgXN35/TTVSmFK1lksgGmORGqHPDrjfzDArzzJAX4X2
 aqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rI8YBskLtC8mMs+vacOa3C62UUOa+s+K2Ki5NU8X6dw=;
 b=aFBPmYRuvQP1uGeHwcvDxWXx4nk8Jr7+DuHPMqwktuVgn77ASqgogbGu9WsukhyzYc
 VfKUcqSB+86y6aVI39ak5GbrtU3Hw++7zhmPOD2J2YoXfnad0+5QwajUaX9x925irlsp
 nOwjOmcmbmEGOEDhIWtRz8+b10Yr2O6Tmfi5J7TBvFpQ4yPDPc6OJvCwxy72Q7dPOKie
 fjC2ZXZRhf87jYZ6DnvTE5+7e5t1HSROkW/jBqGyKQt5abXB0z0UPb/7aBQ3qp4SV6Zf
 ECVSIJex6WwxBIYT3IgA9FNNd1R+P4Nv5VCWp9vJbVAN3lJdRMMLtTe+9yRcCEPL175N
 AYrQ==
X-Gm-Message-State: AO0yUKXGVPxz80D/FH/yv1ut0lQ2OJ+lqPC/kuYZRyJKAKDEtfi8hth6
 xXNE5xpdBo77yGl1WCj8uNzb1cMmiRfOQhVP
X-Google-Smtp-Source: AK7set/1dRdAPSfHG+ldHsgFOg6TO/tX79indbVy6ARyWomSbGZ6jMkQvFBybrLE1wrczTzXoGY1aA==
X-Received: by 2002:a05:6000:1005:b0:2bf:b35d:2797 with SMTP id
 a5-20020a056000100500b002bfb35d2797mr9074032wrx.11.1675441829644; 
 Fri, 03 Feb 2023 08:30:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a5d4d10000000b002bbed1388a5sm2348052wrt.15.2023.02.03.08.30.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 08:30:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 1/3] hw/acpi/cpu_hotplug: Rename gpe_cpu -> gpe
Date: Fri,  3 Feb 2023 17:30:19 +0100
Message-Id: <20230203163021.35754-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203163021.35754-1-philmd@linaro.org>
References: <20230203163021.35754-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rename 'g' and 'gpe_cpu' variables as 'gpe' to simplify.
No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/acpi-cpu-hotplug-stub.c |  6 ++---
 hw/acpi/cpu_hotplug.c           | 40 ++++++++++++++++-----------------
 hw/acpi/ich9.c                  |  8 +++----
 hw/acpi/piix4.c                 |  6 ++---
 include/hw/acpi/cpu_hotplug.h   |  8 +++----
 include/hw/acpi/ich9.h          |  2 +-
 include/hw/acpi/piix4.h         |  2 +-
 7 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
index 3fc4b14c26..b590ad57e1 100644
--- a/hw/acpi/acpi-cpu-hotplug-stub.c
+++ b/hw/acpi/acpi-cpu-hotplug-stub.c
@@ -6,7 +6,7 @@
 /* Following stubs are all related to ACPI cpu hotplug */
 const VMStateDescription vmstate_cpu_hotplug;
 
-void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
+void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
                                 CPUHotplugState *cpuhp_state,
                                 uint16_t io_port)
 {
@@ -14,7 +14,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
 }
 
 void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
-                                  AcpiCpuHotplug *gpe_cpu, uint16_t base)
+                                  AcpiCpuHotplug *gpe, uint16_t base)
 {
     return;
 }
@@ -31,7 +31,7 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
 }
 
 void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
-                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp)
+                             AcpiCpuHotplug *gpe, DeviceState *dev, Error **errp)
 {
     return;
 }
diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index ff14c3f410..3cfa4f45dc 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -26,8 +26,8 @@
 
 static uint64_t cpu_status_read(void *opaque, hwaddr addr, unsigned int size)
 {
-    AcpiCpuHotplug *cpus = opaque;
-    uint64_t val = cpus->sts[addr];
+    AcpiCpuHotplug *gpe = opaque;
+    uint64_t val = gpe->sts[addr];
 
     return val;
 }
@@ -40,8 +40,8 @@ static void cpu_status_write(void *opaque, hwaddr addr, uint64_t data,
        mode by writing 0 at the beginning of legacy CPU bitmap
      */
     if (addr == 0 && data == 0) {
-        AcpiCpuHotplug *cpus = opaque;
-        object_property_set_bool(cpus->device, "cpu-hotplug-legacy", false,
+        AcpiCpuHotplug *gpe = opaque;
+        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
                                  &error_abort);
     }
 }
@@ -59,51 +59,51 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
     },
 };
 
-static void acpi_set_cpu_present_bit(AcpiCpuHotplug *g, CPUState *cpu)
+static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gpe, CPUState *cpu)
 {
     CPUClass *k = CPU_GET_CLASS(cpu);
     int64_t cpu_id;
 
     cpu_id = k->get_arch_id(cpu);
     if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
-        object_property_set_bool(g->device, "cpu-hotplug-legacy", false,
+        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
                                  &error_abort);
         return;
     }
 
-    g->sts[cpu_id / 8] |= (1 << (cpu_id % 8));
+    gpe->sts[cpu_id / 8] |= (1 << (cpu_id % 8));
 }
 
-void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
-                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp)
+void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
+                             DeviceState *dev, Error **errp)
 {
-    acpi_set_cpu_present_bit(g, CPU(dev));
+    acpi_set_cpu_present_bit(gpe, CPU(dev));
     acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
 }
 
 void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
-                                  AcpiCpuHotplug *gpe_cpu, uint16_t base)
+                                  AcpiCpuHotplug *gpe, uint16_t base)
 {
     CPUState *cpu;
 
-    memory_region_init_io(&gpe_cpu->io, owner, &AcpiCpuHotplug_ops,
-                          gpe_cpu, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
-    memory_region_add_subregion(parent, base, &gpe_cpu->io);
-    gpe_cpu->device = owner;
+    memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
+                          gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
+    memory_region_add_subregion(parent, base, &gpe->io);
+    gpe->device = owner;
 
     CPU_FOREACH(cpu) {
-        acpi_set_cpu_present_bit(gpe_cpu, cpu);
+        acpi_set_cpu_present_bit(gpe, cpu);
     }
 }
 
-void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
+void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
                                 CPUHotplugState *cpuhp_state,
                                 uint16_t io_port)
 {
-    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe_cpu->device));
+    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe->device));
 
-    memory_region_del_subregion(parent, &gpe_cpu->io);
-    cpu_hotplug_hw_init(parent, gpe_cpu->device, cpuhp_state, io_port);
+    memory_region_del_subregion(parent, &gpe->io);
+    cpu_hotplug_hw_init(parent, gpe->device, cpuhp_state, io_port);
 }
 
 void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index a93c470e9d..4f8385b894 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -197,7 +197,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
 static int vmstate_cpuhp_pre_load(void *opaque)
 {
     ICH9LPCPMRegs *s = opaque;
-    Object *obj = OBJECT(s->gpe_cpu.device);
+    Object *obj = OBJECT(s->gpe.device);
     object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_abort);
     return 0;
 }
@@ -338,7 +338,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
     qemu_register_powerdown_notifier(&pm->powerdown_notifier);
 
     legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
-        OBJECT(lpc_pci), &pm->gpe_cpu, ICH9_CPU_HOTPLUG_IO_BASE);
+        OBJECT(lpc_pci), &pm->gpe, ICH9_CPU_HOTPLUG_IO_BASE);
 
     if (pm->acpi_memory_hotplug.is_enabled) {
         acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(lpc_pci),
@@ -385,7 +385,7 @@ static void ich9_pm_set_cpu_hotplug_legacy(Object *obj, bool value,
 
     assert(!value);
     if (s->pm.cpu_hotplug_legacy && value == false) {
-        acpi_switch_to_modern_cphp(&s->pm.gpe_cpu, &s->pm.cpuhp_state,
+        acpi_switch_to_modern_cphp(&s->pm.gpe, &s->pm.cpuhp_state,
                                    ICH9_CPU_HOTPLUG_IO_BASE);
     }
     s->pm.cpu_hotplug_legacy = value;
@@ -514,7 +514,7 @@ void ich9_pm_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
         }
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         if (lpc->pm.cpu_hotplug_legacy) {
-            legacy_acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.gpe_cpu, dev, errp);
+            legacy_acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.gpe, dev, errp);
         } else {
             acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.cpuhp_state, dev, errp);
         }
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 724294b378..c702d83f27 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -353,7 +353,7 @@ static void piix4_device_plug_cb(HotplugHandler *hotplug_dev,
         acpi_pcihp_device_plug_cb(hotplug_dev, &s->acpi_pci_hotplug, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         if (s->cpu_hotplug_legacy) {
-            legacy_acpi_cpu_plug_cb(hotplug_dev, &s->gpe_cpu, dev, errp);
+            legacy_acpi_cpu_plug_cb(hotplug_dev, &s->gpe, dev, errp);
         } else {
             acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
         }
@@ -549,7 +549,7 @@ static void piix4_set_cpu_hotplug_legacy(Object *obj, bool value, Error **errp)
 
     assert(!value);
     if (s->cpu_hotplug_legacy && value == false) {
-        acpi_switch_to_modern_cphp(&s->gpe_cpu, &s->cpuhp_state,
+        acpi_switch_to_modern_cphp(&s->gpe, &s->cpuhp_state,
                                    PIIX4_CPU_HOTPLUG_IO_BASE);
     }
     s->cpu_hotplug_legacy = value;
@@ -571,7 +571,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
     object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
                              piix4_get_cpu_hotplug_legacy,
                              piix4_set_cpu_hotplug_legacy);
-    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe_cpu,
+    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe,
                                  PIIX4_CPU_HOTPLUG_IO_BASE);
 
     if (s->acpi_memory_hotplug.is_enabled) {
diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
index 3b932abbbb..99c11b7151 100644
--- a/include/hw/acpi/cpu_hotplug.h
+++ b/include/hw/acpi/cpu_hotplug.h
@@ -25,13 +25,13 @@ typedef struct AcpiCpuHotplug {
     uint8_t sts[ACPI_GPE_PROC_LEN];
 } AcpiCpuHotplug;
 
-void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
-                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp);
+void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
+                             DeviceState *dev, Error **errp);
 
 void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
-                                  AcpiCpuHotplug *gpe_cpu, uint16_t base);
+                                  AcpiCpuHotplug *gpe, uint16_t base);
 
-void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
+void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
                                 CPUHotplugState *cpuhp_state,
                                 uint16_t io_port);
 
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index d41866a229..3ec706c0d7 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -53,7 +53,7 @@ typedef struct ICH9LPCPMRegs {
     Notifier powerdown_notifier;
 
     bool cpu_hotplug_legacy;
-    AcpiCpuHotplug gpe_cpu;
+    AcpiCpuHotplug gpe;
     CPUHotplugState cpuhp_state;
 
     bool keep_pci_slot_hpc;
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
index be1f8ea80e..b88ef92455 100644
--- a/include/hw/acpi/piix4.h
+++ b/include/hw/acpi/piix4.h
@@ -66,7 +66,7 @@ struct PIIX4PMState {
     uint8_t s4_val;
 
     bool cpu_hotplug_legacy;
-    AcpiCpuHotplug gpe_cpu;
+    AcpiCpuHotplug gpe;
     CPUHotplugState cpuhp_state;
 
     MemHotplugState acpi_memory_hotplug;
-- 
2.38.1


