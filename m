Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1094D681B6D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:27:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMafa-0007kg-Am; Mon, 30 Jan 2023 15:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeG-0006aR-5Q
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeC-0007Nk-G1
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ij+3HPf1ZAtU65GOMkJAJ0uDJndIykCDvf+CEjzkQGo=;
 b=GJhjxbrBaQWvtTnrKEC8M9uRSIxa9ZTo+iiGNC/kN1hHgSnNSjQ4b/KqCi3qLQ9eJOZCob
 wIZwz8YtdE0fsBQ9pRb22JX93AQGCe+36djIhhOiy/gcD+POgpbUbfymly4U4RWgB7FQYA
 neGJ75efreIbV228ZWxjmWCnkb6I1AI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-rBelYcA8OwiJf-aVZriFSA-1; Mon, 30 Jan 2023 15:20:58 -0500
X-MC-Unique: rBelYcA8OwiJf-aVZriFSA-1
Received: by mail-ej1-f69.google.com with SMTP id
 kt9-20020a1709079d0900b00877f4df5aceso8156870ejc.21
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ij+3HPf1ZAtU65GOMkJAJ0uDJndIykCDvf+CEjzkQGo=;
 b=g2CR6pzR7v+leojE6oX+wJbVCzxJ2Crd/RUuefwNEr109D4lmisMWweMxOWmIWvpMt
 SrRBessIAfnLBvkePu36m5flmsHfDcefrAFNJd55uu70HRUS2Rf5TIpeL+vxMMUAJlAz
 Wp9nLajZw3PUHZk3QP69ojB12Jq4u32QTJKmv+k6GLK56pvRPkdm3ZHeSFUQlsMAd5ZL
 rJMQWcykU50gAMADd1iEPC4nWqFl6D4Tgqzeo8UeaQSckVKNeS6nj6u2/GTuLLYAOjxJ
 MjsKy/38XwjcOwmArPedh7TvXZRi05wtGZS9ghtUbKewih2HatsujTjIvKYoQ95eLCaF
 5cAQ==
X-Gm-Message-State: AO0yUKUlcCXw2rqxXnW/BoYCRNmbSrfoc8RCdzQl8kU53LQTrNJG7NgD
 ioQZm/TOjiduBnPXWdY8Exa2JpoFMksGJvQw8mf33YQqqUd975sVqDQ4DrUAZxMozrw+S4bikRs
 ovv52sCfDo7M/ScZFayMKxDpfWgiLkgCqnbCp2caQRpWijl5ciXm2QE5qplT9
X-Received: by 2002:a05:6402:378b:b0:4a2:4abc:29be with SMTP id
 et11-20020a056402378b00b004a24abc29bemr4595065edb.35.1675110055918; 
 Mon, 30 Jan 2023 12:20:55 -0800 (PST)
X-Google-Smtp-Source: AK7set8lc6XOtTdvMLue9PzxW0RpAyNAxNLQVQTdMqlxOk/TBaECvujfPZ5Z/9XBCWXXPjvoM9dscA==
X-Received: by 2002:a05:6402:378b:b0:4a2:4abc:29be with SMTP id
 et11-20020a056402378b00b004a24abc29bemr4595037edb.35.1675110055576; 
 Mon, 30 Jan 2023 12:20:55 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 w25-20020aa7d299000000b0048789661fa2sm7238401edq.66.2023.01.30.12.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:55 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 39/56] pcihp: make bridge describe itself using
 AcpiDevAmlIfClass:build_dev_aml
Message-ID: <20230130201810.11518-40-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

simplify build_append_pci_bus_devices() a bit by handling bridge
specific logic in bridge dedicated AcpiDevAmlIfClass::build_dev_aml
callback.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-30-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/pci.h     |  4 ++++
 hw/acpi/pci-bridge-stub.c | 20 ++++++++++++++++++++
 hw/acpi/pci-bridge.c      | 27 +++++++++++++++++++++++++++
 hw/i386/acpi-build.c      | 17 ++---------------
 hw/pci/pci_bridge.c       |  9 +++++++++
 hw/acpi/Kconfig           |  4 ++++
 hw/acpi/meson.build       |  4 +++-
 hw/i386/Kconfig           |  1 +
 8 files changed, 70 insertions(+), 16 deletions(-)
 create mode 100644 hw/acpi/pci-bridge-stub.c
 create mode 100644 hw/acpi/pci-bridge.c

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index b5deee0a9d..467a99461c 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -27,6 +27,7 @@
 #define HW_ACPI_PCI_H
 
 #include "hw/acpi/bios-linker-loader.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 typedef struct AcpiMcfgInfo {
     uint64_t base;
@@ -36,4 +37,7 @@ typedef struct AcpiMcfgInfo {
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
                 const char *oem_id, const char *oem_table_id);
 Aml *aml_pci_device_dsm(void);
+
+void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus);
+void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
 #endif
diff --git a/hw/acpi/pci-bridge-stub.c b/hw/acpi/pci-bridge-stub.c
new file mode 100644
index 0000000000..9d78638c48
--- /dev/null
+++ b/hw/acpi/pci-bridge-stub.c
@@ -0,0 +1,20 @@
+/*
+ * QEMU ACPI PCI bridge stub
+ *
+ * Copyright (c) 2023 Red Hat, Inc.
+ *
+ * Author:
+ *   Igor Mammedov <imammedo@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/pci.h"
+
+void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+}
diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
new file mode 100644
index 0000000000..5f3ee5157f
--- /dev/null
+++ b/hw/acpi/pci-bridge.c
@@ -0,0 +1,27 @@
+/*
+ * QEMU ACPI PCI bridge
+ *
+ * Copyright (c) 2023 Red Hat, Inc.
+ *
+ * Author:
+ *   Igor Mammedov <imammedo@redhat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/pci.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/acpi/pcihp.h"
+
+void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    PCIBridge *br = PCI_BRIDGE(adev);
+
+    if (object_property_find(OBJECT(&br->sec_bus), ACPI_PCIHP_PROP_BSEL)) {
+        build_append_pci_bus_devices(scope, pci_bridge_get_sec_bus(br));
+    }
+}
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8045b20713..49181a55b1 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -383,8 +383,7 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
     aml_append(method, if_ctx);
 }
 
-static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
-                                         bool pcihp_bridge_en)
+void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
 {
     Aml *dev, *notify_method = NULL, *method;
     QObject *bsel;
@@ -406,7 +405,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = slot << 16 | func;
         bool hotpluggbale_slot = false;
-        bool bridge_in_acpi = false;
         bool cold_plugged_bridge = false;
 
         if (pdev) {
@@ -418,7 +416,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
              */
             cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
                                   !DEVICE(pdev)->hotplugged;
-            bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
 
             hotpluggbale_slot = bsel && dc->hotpluggable &&
                                 !cold_plugged_bridge;
@@ -471,16 +468,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
         call_dev_aml_func(DEVICE(pdev), dev);
 
-        if (bridge_in_acpi) {
-            /*
-             * device is coldplugged bridge,
-             * add child device descriptions into its scope
-             */
-            PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
-
-            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
-        }
-
         if (hotpluggbale_slot) {
             aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
             /* add _EJ0 to make slot hotpluggable  */
@@ -1704,7 +1691,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             PCIBus *bus = PCI_HOST_BRIDGE(pci_host)->bus;
             Aml *scope = aml_scope("PCI0");
             /* Scan all PCI buses. Generate tables to support hotplug. */
-            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
+            build_append_pci_bus_devices(scope, bus);
             aml_append(sb_scope, scope);
         }
     }
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index a1a1cc861e..dd5af508f9 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -37,6 +37,7 @@
 #include "qemu/range.h"
 #include "qapi/error.h"
 #include "hw/acpi/acpi_aml_interface.h"
+#include "hw/acpi/pci.h"
 
 /* PCI bridge subsystem vendor ID helper functions */
 #define PCI_SSVID_SIZEOF        8
@@ -468,10 +469,18 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
     return 0;
 }
 
+static void pci_bridge_class_init(ObjectClass *klass, void *data)
+{
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
+
+    adevc->build_dev_aml = build_pci_bridge_aml;
+}
+
 static const TypeInfo pci_bridge_type_info = {
     .name = TYPE_PCI_BRIDGE,
     .parent = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIBridge),
+    .class_init = pci_bridge_class_init,
     .abstract = true,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_ACPI_DEV_AML_IF },
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 1f7803fdab..e07d3204eb 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -39,6 +39,10 @@ config ACPI_PCIHP
     bool
     depends on ACPI
 
+config ACPI_PCI_BRIDGE
+    bool
+    depends on ACPI && PCI && ACPI_PCIHP
+
 config ACPI_HMAT
     bool
     depends on ACPI
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index 30054a8cdc..50b73129b4 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -19,6 +19,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files('ghes-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_true: files('pci-bridge.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
@@ -30,9 +31,10 @@ if have_tpm
   acpi_ss.add(files('tpm.c'))
 endif
 softmmu_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
+softmmu_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_false: files('pci-bridge-stub.c'))
 softmmu_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-stub.c', 'aml-build-stub.c',
                                                   'acpi-x86-stub.c', 'ipmi-stub.c', 'ghes-stub.c',
                                                   'acpi-mem-hotplug-stub.c', 'acpi-cpu-hotplug-stub.c',
                                                   'acpi-pci-hotplug-stub.c', 'acpi-nvdimm-stub.c',
-                                                  'cxl-stub.c'))
+                                                  'cxl-stub.c', 'pci-bridge-stub.c'))
diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index c4fb5b49bd..1bf47b0b0b 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -58,6 +58,7 @@ config PC_ACPI
     select ACPI_X86
     select ACPI_CPU_HOTPLUG
     select ACPI_MEMORY_HOTPLUG
+    select ACPI_PCI_BRIDGE
     select ACPI_VIOT
     select SMBUS_EEPROM
     select PFLASH_CFI01
-- 
MST


