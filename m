Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8A689F4C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 17:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyxZ-0001NJ-6g; Fri, 03 Feb 2023 11:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNyxW-0001ML-Bp
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:30:43 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNyxT-0007qE-Gx
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 11:30:42 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6375590wmb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 08:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ptROtNuE3lb04ckVNKyGxQMWre2p5gfgVUcEG2lqtgQ=;
 b=VK5KjYlqlL6hd+FMx2A9gdVLSVw6j7WZvvGBxsn8DC4nfXGmtwSTP0U3ZmDaQO3jto
 Fc3XfItGxhpeHP8DoX542kSKvjlM+IVHKxxmO1OjflEE7fyOZPprND+iTTCpBAIibu5H
 1LAGcf7n0BOA7WTh0gwhvczN2/FojUs03AUxmMs+tC9ElshNCD8uNZLDTpqmuaODbnfY
 FyL0OLWymZW4GQt3Qxzivan3OzpAhb3eL3u5a/7idA36vPPpCReC7lb1SWviIu3wVaIG
 SXzTLOARooNykVPXkXC0ypEHLk72/F753f9h0dAjaCWysS80HFSknlSlQ6qX1NCR8AeP
 wR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ptROtNuE3lb04ckVNKyGxQMWre2p5gfgVUcEG2lqtgQ=;
 b=JhWMH9Zpuhd8YIN2jmp5DbInK1ZGdlgySPl7zROaihLWGncR6x8Q/7CZMS6LiEQMUl
 m+fUbkD8hXK/Ty8gW3bnw8Aukpt26sbv77Tnsy/z0pabDRuCMJ1eyiKUWXPMWHA/+05r
 S59eRctnIV2CNvmTTBYPXY3KrXO6nTGg9U4YRSEwZDIOblnO3aGT2xiO9zt6/BMjlhCi
 73OIizKHEZj0fAMOP5MwXPey4wQurUkiqWljSGj2FJmpha1P0fvvxxYySia/4Gmbw10c
 /hh0il62EaYWDIJFFnsIo9FIZNZ8w2S/kSL2haZOq3RxNERLqhgA0/5s7sYaK9ULS0av
 jQpg==
X-Gm-Message-State: AO0yUKWbxmLG0ylJ36LvEvN/P8+gZcTB2x/O+eCQGhYA0s9YziMnRM5C
 2I3NSITT5DWXC/+H8RMbIxqqo+q/5qMm1IgZ
X-Google-Smtp-Source: AK7set9fcZ1JEpakNePHMV908vh2DVSb2pYsYjcSnsVpW/Z/CfWo+x16ty3EKMrMUdLuesdz9svqEQ==
X-Received: by 2002:a05:600c:601b:b0:3dc:557f:6129 with SMTP id
 az27-20020a05600c601b00b003dc557f6129mr9946409wmb.2.1675441835935; 
 Fri, 03 Feb 2023 08:30:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b003dc522dd25esm3439513wmq.30.2023.02.03.08.30.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 08:30:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH 2/3] hw/acpi/cpu_hotplug: Rename 'parent' MemoryRegion as
 'container'
Date: Fri,  3 Feb 2023 17:30:20 +0100
Message-Id: <20230203163021.35754-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203163021.35754-1-philmd@linaro.org>
References: <20230203163021.35754-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

No logical change, rename for clarity.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/acpi/acpi-cpu-hotplug-stub.c |  2 +-
 hw/acpi/cpu_hotplug.c           | 10 +++++-----
 hw/acpi/piix4.c                 | 10 +++++-----
 include/hw/acpi/cpu_hotplug.h   |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
index b590ad57e1..cbd7a6ec00 100644
--- a/hw/acpi/acpi-cpu-hotplug-stub.c
+++ b/hw/acpi/acpi-cpu-hotplug-stub.c
@@ -13,7 +13,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
     return;
 }
 
-void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
+void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
                                   AcpiCpuHotplug *gpe, uint16_t base)
 {
     return;
diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
index 3cfa4f45dc..636e985c50 100644
--- a/hw/acpi/cpu_hotplug.c
+++ b/hw/acpi/cpu_hotplug.c
@@ -81,14 +81,14 @@ void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
     acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
 }
 
-void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
+void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
                                   AcpiCpuHotplug *gpe, uint16_t base)
 {
     CPUState *cpu;
 
     memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
                           gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
-    memory_region_add_subregion(parent, base, &gpe->io);
+    memory_region_add_subregion(container, base, &gpe->io);
     gpe->device = owner;
 
     CPU_FOREACH(cpu) {
@@ -100,10 +100,10 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
                                 CPUHotplugState *cpuhp_state,
                                 uint16_t io_port)
 {
-    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe->device));
+    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->device));
 
-    memory_region_del_subregion(parent, &gpe->io);
-    cpu_hotplug_hw_init(parent, gpe->device, cpuhp_state, io_port);
+    memory_region_del_subregion(container, &gpe->io);
+    cpu_hotplug_hw_init(container, gpe->device, cpuhp_state, io_port);
 }
 
 void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index c702d83f27..5595fe5be5 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -555,15 +555,15 @@ static void piix4_set_cpu_hotplug_legacy(Object *obj, bool value, Error **errp)
     s->cpu_hotplug_legacy = value;
 }
 
-static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
+static void piix4_acpi_system_hot_add_init(MemoryRegion *container,
                                            PCIBus *bus, PIIX4PMState *s)
 {
     memory_region_init_io(&s->io_gpe, OBJECT(s), &piix4_gpe_ops, s,
                           "acpi-gpe0", GPE_LEN);
-    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
+    memory_region_add_subregion(container, GPE_BASE, &s->io_gpe);
 
     if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
-        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
+        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, container,
                         s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
     }
 
@@ -571,11 +571,11 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
     object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
                              piix4_get_cpu_hotplug_legacy,
                              piix4_set_cpu_hotplug_legacy);
-    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe,
+    legacy_acpi_cpu_hotplug_init(container, OBJECT(s), &s->gpe,
                                  PIIX4_CPU_HOTPLUG_IO_BASE);
 
     if (s->acpi_memory_hotplug.is_enabled) {
-        acpi_memory_hotplug_init(parent, OBJECT(s), &s->acpi_memory_hotplug,
+        acpi_memory_hotplug_init(container, OBJECT(s), &s->acpi_memory_hotplug,
                                  ACPI_MEMORY_HOTPLUG_BASE);
     }
 }
diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
index 99c11b7151..5ff24ec417 100644
--- a/include/hw/acpi/cpu_hotplug.h
+++ b/include/hw/acpi/cpu_hotplug.h
@@ -28,7 +28,7 @@ typedef struct AcpiCpuHotplug {
 void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
                              DeviceState *dev, Error **errp);
 
-void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
+void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
                                   AcpiCpuHotplug *gpe, uint16_t base);
 
 void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
-- 
2.38.1


