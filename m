Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13716689F48
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:31:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyxz-0001O7-Au; Fri, 03 Feb 2023 11:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNyxa-0001Ns-S1
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:30:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNyxY-0007rb-Gw
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:30:46 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso4269102wmq.5
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 08:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1wBCF9bWIkPB8j4jWU6kzH466hslSu/AUgLyaE+mSGQ=;
 b=QN9H+AW+vRzJxaF7JIpaCv1AhDLbjcDzscI6nE9ha05QCfQg94A+uqgSxnvzqsWcCj
 LYcauZVv4GYuLpCVQU1tonk1xE4zMh+OG2sp6nCvFscWOF92BxXWfZUaMLdc2PDApHq3
 llJT3bGwyChXsyXkYVbA4BQWHg1NsHPo6BqcEDcrcnsMYo22K9opQFiYYIzg0PBKmwe+
 MYCNG0zm+AbBvddg6UvXSF7n2j/GtIQ069RDpx8OiW6Uoz5Wkn8gaJ06NkB965yxAuCi
 56ZCMM1y7wIEsECst76zfbiz0sOU5PjgAtY6/G5yYxYJEwnMb4l+yasCidUHlAWDo96l
 gKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wBCF9bWIkPB8j4jWU6kzH466hslSu/AUgLyaE+mSGQ=;
 b=5gI3GAlxwuXTvXopqs0FV0LPvXFSchEDg2Y9qwR5QZa7m79n4QzBZ85kwkf7sQXg1J
 Yqk1L3PJMH7rhCzJkCD3wEnDTRgfJMHhu9J9DV0fxvlNWXn9STPapqQ7i/U1jzQ2EPEn
 BiMV3NBwv7Yc85taWe+ZiFhX1i+La2T6014iQUyfkAZYEXdlHyJjnihz5bCi0v85hAbU
 cBPJgKxfo8o0fzCCIs90vM6J+yCi5FSWHrl6zRTdqF/rrQuS3Aa2MsihgaQ6FxjDvs7Z
 3YXpEfFOKnyZhrArxHyKhPwkZObLjlAENBP0YOeZrWexpBYMym2Qe6Xsz1MLH1gtLQih
 kt2w==
X-Gm-Message-State: AO0yUKUtTCViinvwqmk3nS/J2cxi1tjDVMB/L56OU/MtyqmaSq9TCgYL
 3BUp1p7rcFYXRbnad4SLEVUqrH44Fq12Pg0H
X-Google-Smtp-Source: AK7set+I5yonGaxfAm+fi5x5Zdis1wrgCyP/GjknOWnJoNuCAufBM8uqnGSU35bpHcXJ6HdW7b68nw==
X-Received: by 2002:a05:600c:1f0c:b0:3dd:97d6:8f2e with SMTP id
 bd12-20020a05600c1f0c00b003dd97d68f2emr10069500wmb.17.1675441842881; 
 Fri, 03 Feb 2023 08:30:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a05600c1c9300b003dc43a10fa5sm3469387wms.13.2023.02.03.08.30.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 08:30:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 3/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Date: Fri,  3 Feb 2023 17:30:21 +0100
Message-Id: <20230203163021.35754-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203163021.35754-1-philmd@linaro.org>
References: <20230203163021.35754-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

ACPI CPU hotplug parent can't be any QOM object, it must be a QDev.
Convert AcpiCpuHotplug::device field as QDev to enforce this.
Rename 'owner' and 'device' variables as 'parent'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/acpi-cpu-hotplug-stub.c |  2 +-
 hw/acpi/cpu_hotplug.c           | 18 +++++++++---------
 hw/acpi/ich9.c                  |  5 +++--
 hw/acpi/piix4.c                 |  2 +-
 include/hw/acpi/cpu_hotplug.h   |  4 ++--
 5 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
index cbd7a6ec00..0fcc1ec8ea 100644
--- a/hw/acpi/acpi-cpu-hotplug-stub.c
+++ b/hw/acpi/acpi-cpu-hotplug-stub.c
@@ -13,7 +13,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
     return;
 }
 
-void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
+void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
                                   AcpiCpuHotplug *gpe, uint16_t base)
 {
     return;
diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 636e985c50..b8c9081738 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -41,8 +41,8 @@ static void cpu_status_write(void *opaque, hwaddr addr, uint64_t data,
      */
     if (addr == 0 && data == 0) {
         AcpiCpuHotplug *gpe = opaque;
-        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
-                                 &error_abort);
+        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
+                                 false, &error_abort);
     }
 }
 
@@ -66,8 +66,8 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gpe, CPUState *cpu)
 
     cpu_id = k->get_arch_id(cpu);
     if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
-        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
-                                 &error_abort);
+        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
+                                 false, &error_abort);
         return;
     }
 
@@ -81,15 +81,15 @@ void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
     acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
 }
 
-void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
+void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
                                   AcpiCpuHotplug *gpe, uint16_t base)
 {
     CPUState *cpu;
 
-    memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
+    memory_region_init_io(&gpe->io, OBJECT(parent), &AcpiCpuHotplug_ops,
                           gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
     memory_region_add_subregion(container, base, &gpe->io);
-    gpe->device = owner;
+    gpe->parent = parent;
 
     CPU_FOREACH(cpu) {
         acpi_set_cpu_present_bit(gpe, cpu);
@@ -100,10 +100,10 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
                                 CPUHotplugState *cpuhp_state,
                                 uint16_t io_port)
 {
-    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->device));
+    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->parent));
 
     memory_region_del_subregion(container, &gpe->io);
-    cpu_hotplug_hw_init(container, gpe->device, cpuhp_state, io_port);
+    cpu_hotplug_hw_init(container, OBJECT(gpe->parent), cpuhp_state, io_port);
 }
 
 void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 4f8385b894..6c9a737479 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -197,7 +197,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
 static int vmstate_cpuhp_pre_load(void *opaque)
 {
     ICH9LPCPMRegs *s = opaque;
-    Object *obj = OBJECT(s->gpe.device);
+    Object *obj = OBJECT(s->gpe.parent);
     object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_abort);
     return 0;
 }
@@ -338,7 +338,8 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
     qemu_register_powerdown_notifier(&pm->powerdown_notifier);
 
     legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
-        OBJECT(lpc_pci), &pm->gpe, ICH9_CPU_HOTPLUG_IO_BASE);
+                                 DEVICE(lpc_pci), &pm->gpe,
+                                 ICH9_CPU_HOTPLUG_IO_BASE);
 
     if (pm->acpi_memory_hotplug.is_enabled) {
         acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(lpc_pci),
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 5595fe5be5..3a61d89f92 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -571,7 +571,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *container,
     object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
                              piix4_get_cpu_hotplug_legacy,
                              piix4_set_cpu_hotplug_legacy);
-    legacy_acpi_cpu_hotplug_init(container, OBJECT(s), &s->gpe,
+    legacy_acpi_cpu_hotplug_init(container, DEVICE(s), &s->gpe,
                                  PIIX4_CPU_HOTPLUG_IO_BASE);
 
     if (s->acpi_memory_hotplug.is_enabled) {
diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
index 5ff24ec417..b2f990f0b8 100644
--- a/include/hw/acpi/cpu_hotplug.h
+++ b/include/hw/acpi/cpu_hotplug.h
@@ -20,7 +20,7 @@
 #include "hw/acpi/cpu.h"
 
 typedef struct AcpiCpuHotplug {
-    Object *device;
+    DeviceState *parent;
     MemoryRegion io;
     uint8_t sts[ACPI_GPE_PROC_LEN];
 } AcpiCpuHotplug;
@@ -28,7 +28,7 @@ typedef struct AcpiCpuHotplug {
 void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
                              DeviceState *dev, Error **errp);
 
-void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
+void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
                                   AcpiCpuHotplug *gpe, uint16_t base);
 
 void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
-- 
2.38.1


