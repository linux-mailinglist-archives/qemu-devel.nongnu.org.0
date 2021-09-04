Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D70400D22
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:42:15 +0200 (CEST)
Received: from localhost ([::1]:51330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdQU-00013W-M4
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKn-00047f-7e
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKk-0000t7-RO
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MQoIZJyFdMdY94hp3DrB3LttB4+tU2elDC8nXR7x6VQ=;
 b=dRbECr/eMELv+Pg1xg6dciDCAVde/HgMVosjE1iTVlUVneqxy3m2HM4gnCPST/Zp63J0m7
 5jTA+ahVKPfgUVOHY1S6yuUcpdQLSfE3MKXrtJvrsWeGKdvbDOpBL/JnXxlq1ySyOgqUgm
 jNo5/PNP0wC6paoj2r2IqxmTZ1oZOlY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-cJzueab5PTCNZxlRphKk8A-1; Sat, 04 Sep 2021 17:36:17 -0400
X-MC-Unique: cJzueab5PTCNZxlRphKk8A-1
Received: by mail-ed1-f72.google.com with SMTP id
 b8-20020a056402350800b003c5e3d4e2a7so1508422edd.2
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MQoIZJyFdMdY94hp3DrB3LttB4+tU2elDC8nXR7x6VQ=;
 b=FlDKAflIycT8T6EuOtLDSetzhp1v7yzlIXBun1ZjYbSwSXN8Js4tsKWFttf2yibFv0
 fDoaHg8eMV1L/ZMEuSpgIowvHq5VIQvOuq4UDvwfdAdWjM1bapsU/VoDm56+JO/NSZ4I
 aT9FPOgy5KR2UmJ4qeHhZII/j0773At2T9pDVK8ZnM2hozP/WijKyQpRHJtAX9tzIBGp
 MlLVrqtGSB8M7iqDTtvSj55ZeMfQbO+cPefQ5EudtxwPPgu5FtIfvpn5BZlPPabLDsaS
 oFBYdWrNLw175HhFK+kb1zPlpJfbWIUxsF57kYEjPewg8WMRPBZaHzZRdd8e91Ywl15Z
 mo0Q==
X-Gm-Message-State: AOAM532i/ASYoK6rws3vlI4VjHXpS9I0Ot/b0r6WYbdrultp0DzVOYRw
 IhxT/rDWhNs/xWuUmsjb5ZgxCDdNaRr258FXzj1JIF5ucSuujE+kocUAHzSBvAKvB5KPEq9nVOr
 8yaHAcPG6S/7bABwUNopD7+hLLu13EvRexWi6actMZ/5diRndyoqhwzoEdoIZ
X-Received: by 2002:a17:906:d057:: with SMTP id
 bo23mr6015501ejb.208.1630791375425; 
 Sat, 04 Sep 2021 14:36:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5Qud6wVMK513eGB4fzWeB94mvPqCHn/afnvilM8vOTF1gA2FV1jb8v/73LkW9raOTYy64DQ==
X-Received: by 2002:a17:906:d057:: with SMTP id
 bo23mr6015474ejb.208.1630791375048; 
 Sat, 04 Sep 2021 14:36:15 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id lm21sm1526471ejb.58.2021.09.04.14.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:14 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets can
 just use what they need
Message-ID: <20210904213506.486886-7-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
This brings in support for whole lot of subsystems that some targets like
mips does not need. They are added just to satisfy symbol dependencies. This
is ugly and should be avoided. Targets should be able to pull in just what they
need and no more. For example, mips only needs support for PIIX4 and does not
need acpi pci hotplug support or cpu hotplug support or memory hotplug support
etc. This change is an effort to clean this up.
In this change, new config variables are added for various acpi hotplug
subsystems. Targets like mips can only enable PIIX4 support and not the rest
of all the other modules which were being previously pulled in as a part of
CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
are not required by mips (for example, symbols specific to pci hotplug etc)
are available to satisfy the dependencies.

Currently, this change only addresses issues with mips malta targets. In future
we might be able to clean up other targets which are similarly pulling in lot
of unnecessary hotplug modules by enabling ACPI_X86.

This change should also address issues such as the following:
https://gitlab.com/qemu-project/qemu/-/issues/221
https://gitlab.com/qemu-project/qemu/-/issues/193

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20210812071409.492299-1-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 configs/devices/mips-softmmu/common.mak |  5 +--
 hw/acpi/acpi-cpu-hotplug-stub.c         | 50 +++++++++++++++++++++++++
 hw/acpi/acpi-mem-hotplug-stub.c         | 35 +++++++++++++++++
 hw/acpi/acpi-nvdimm-stub.c              |  8 ++++
 hw/acpi/acpi-pci-hotplug-stub.c         | 47 +++++++++++++++++++++++
 hw/acpi/Kconfig                         | 10 +++++
 hw/acpi/meson.build                     | 14 +++++--
 7 files changed, 161 insertions(+), 8 deletions(-)
 create mode 100644 hw/acpi/acpi-cpu-hotplug-stub.c
 create mode 100644 hw/acpi/acpi-mem-hotplug-stub.c
 create mode 100644 hw/acpi/acpi-nvdimm-stub.c
 create mode 100644 hw/acpi/acpi-pci-hotplug-stub.c

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index ea78fe7275..752b62b1e6 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -18,10 +18,7 @@ CONFIG_PCSPK=y
 CONFIG_PCKBD=y
 CONFIG_FDC=y
 CONFIG_ACPI=y
-CONFIG_ACPI_X86=y
-CONFIG_ACPI_MEMORY_HOTPLUG=y
-CONFIG_ACPI_NVDIMM=y
-CONFIG_ACPI_CPU_HOTPLUG=y
+CONFIG_ACPI_PIIX4=y
 CONFIG_APM=y
 CONFIG_I8257=y
 CONFIG_PIIX4=y
diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
new file mode 100644
index 0000000000..3fc4b14c26
--- /dev/null
+++ b/hw/acpi/acpi-cpu-hotplug-stub.c
@@ -0,0 +1,50 @@
+#include "qemu/osdep.h"
+#include "hw/acpi/cpu_hotplug.h"
+#include "migration/vmstate.h"
+
+
+/* Following stubs are all related to ACPI cpu hotplug */
+const VMStateDescription vmstate_cpu_hotplug;
+
+void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
+                                CPUHotplugState *cpuhp_state,
+                                uint16_t io_port)
+{
+    return;
+}
+
+void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
+                                  AcpiCpuHotplug *gpe_cpu, uint16_t base)
+{
+    return;
+}
+
+void acpi_cpu_ospm_status(CPUHotplugState *cpu_st, ACPIOSTInfoList ***list)
+{
+    return;
+}
+
+void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
+                      CPUHotplugState *cpu_st, DeviceState *dev, Error **errp)
+{
+    return;
+}
+
+void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
+                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp)
+{
+    return;
+}
+
+void acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
+                        DeviceState *dev, Error **errp)
+{
+    return;
+}
+
+void acpi_cpu_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                CPUHotplugState *cpu_st,
+                                DeviceState *dev, Error **errp)
+{
+    return;
+}
diff --git a/hw/acpi/acpi-mem-hotplug-stub.c b/hw/acpi/acpi-mem-hotplug-stub.c
new file mode 100644
index 0000000000..73a076a265
--- /dev/null
+++ b/hw/acpi/acpi-mem-hotplug-stub.c
@@ -0,0 +1,35 @@
+#include "qemu/osdep.h"
+#include "hw/acpi/memory_hotplug.h"
+#include "migration/vmstate.h"
+
+const VMStateDescription vmstate_memory_hotplug;
+
+void acpi_memory_hotplug_init(MemoryRegion *as, Object *owner,
+                              MemHotplugState *state, hwaddr io_base)
+{
+    return;
+}
+
+void acpi_memory_ospm_status(MemHotplugState *mem_st, ACPIOSTInfoList ***list)
+{
+    return;
+}
+
+void acpi_memory_plug_cb(HotplugHandler *hotplug_dev, MemHotplugState *mem_st,
+                         DeviceState *dev, Error **errp)
+{
+    return;
+}
+
+void acpi_memory_unplug_cb(MemHotplugState *mem_st,
+                           DeviceState *dev, Error **errp)
+{
+    return;
+}
+
+void acpi_memory_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                   MemHotplugState *mem_st,
+                                   DeviceState *dev, Error **errp)
+{
+    return;
+}
diff --git a/hw/acpi/acpi-nvdimm-stub.c b/hw/acpi/acpi-nvdimm-stub.c
new file mode 100644
index 0000000000..8baff9be6f
--- /dev/null
+++ b/hw/acpi/acpi-nvdimm-stub.c
@@ -0,0 +1,8 @@
+#include "qemu/osdep.h"
+#include "hw/mem/nvdimm.h"
+#include "hw/hotplug.h"
+
+void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev)
+{
+    return;
+}
diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
new file mode 100644
index 0000000000..734e4c5986
--- /dev/null
+++ b/hw/acpi/acpi-pci-hotplug-stub.c
@@ -0,0 +1,47 @@
+#include "qemu/osdep.h"
+#include "hw/acpi/pcihp.h"
+#include "migration/vmstate.h"
+
+const VMStateDescription vmstate_acpi_pcihp_pci_status;
+
+void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
+                     MemoryRegion *address_space_io, bool bridges_enabled,
+                     uint16_t io_base)
+{
+    return;
+}
+
+void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
+                               DeviceState *dev, Error **errp)
+{
+    return;
+}
+
+void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                   DeviceState *dev, Error **errp)
+{
+    return;
+}
+
+void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
+                                 DeviceState *dev, Error **errp)
+{
+    return;
+}
+
+void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
+                                         AcpiPciHpState *s, DeviceState *dev,
+                                         Error **errp)
+{
+    return;
+}
+
+void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
+{
+    return;
+}
+
+bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
+{
+    return false;
+}
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index cfc4ede8d9..3b5e118c54 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -8,6 +8,8 @@ config ACPI_X86
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
     select ACPI_HMAT
+    select ACPI_PIIX4
+    select ACPI_PCIHP
 
 config ACPI_X86_ICH
     bool
@@ -24,6 +26,14 @@ config ACPI_NVDIMM
     bool
     depends on ACPI
 
+config ACPI_PIIX4
+    bool
+    depends on ACPI
+
+config ACPI_PCIHP
+    bool
+    depends on ACPI
+
 config ACPI_HMAT
     bool
     depends on ACPI
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 29f804d13e..7d8c0eb43e 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -6,16 +6,20 @@ acpi_ss.add(files(
   'core.c',
   'utils.c',
 ))
-acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu_hotplug.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c', 'cpu_hotplug.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_false: files('acpi-cpu-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_MEMORY_HOTPLUG', if_true: files('memory_hotplug.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_MEMORY_HOTPLUG', if_false: files('acpi-mem-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_true: files('nvdimm.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_NVDIMM', if_false: files('acpi-nvdimm-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCI', if_true: files('pci.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VMGENID', if_true: files('vmgenid.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
@@ -23,4 +27,6 @@ acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
 softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
-                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c'))
+                                                  'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
+                                                  'acpi-mem-hotplug-stub.c', 'acpi-cpu-hotplug-stub.c',
+                                                  'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c'))
-- 
MST


