Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A498C4C8EB7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:15:52 +0100 (CET)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4EB-0003QP-CU
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:15:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP4Az-0000Yd-Ti
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:12:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP4Av-0004HX-7K
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646147547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kGABQjJm6zavu00l3hbhNQIDW/PtATU2d4AEyNwGYoQ=;
 b=T+bos0ofazEQp6I2gjNQM8uE8w4X/RjRO8n5xVzHDEIO3Og7hJLnCvnbkNXMSuq5IxrHwq
 gWhsZrvY8GlwuYnXz9yqPKSRFZdDbXshl05xxYm8/6DOK4/Q5be2dUXo27k2b90YKLW5QL
 h4GLo4FvygjWshNpiG0K1+qq4cq10qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-p7llVXu5MA61wGleJvSoeQ-1; Tue, 01 Mar 2022 10:12:26 -0500
X-MC-Unique: p7llVXu5MA61wGleJvSoeQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D6D1800422
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 15:12:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96C4F7D3CB;
 Tue,  1 Mar 2022 15:12:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] acpi: pcihp: pcie: set power on cap on parent slot
Date: Tue,  1 Mar 2022 10:11:59 -0500
Message-Id: <20220301151200.3507298-3-imammedo@redhat.com>
In-Reply-To: <20220301151200.3507298-1-imammedo@redhat.com>
References: <20220301151200.3507298-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

on creation a PCIDevice has power turned on at the end of pci_qdev_realize()
however later on if PCIe slot isn't populated with any children
it's power is turned off. It's fine if native hotplug is used
as plug callback will power slot on among other things.
However when ACPI hotplug is enabled it replaces native PCIe plug
callbacks with ACPI specific ones (acpi_pcihp_device_*plug_cb) and
as result slot stays powered off. It works fine as ACPI hotplug
on guest side takes care of enumerating/initializing hotplugged
device. But when later guest is migrated, call chain introduced by]
commit d5daff7d312 (pcie: implement slot power control for pcie root ports)

   pcie_cap_slot_post_load()
       -> pcie_cap_update_power()
           -> pcie_set_power_device()
               -> pci_set_power()
                   -> pci_update_mappings()

will disable earlier initialized BARs for the hotplugged device
in powered off slot due to commit 23786d13441 (pci: implement power state)
which disables BARs if power is off.

Fix it by setting PCI_EXP_SLTCTL_PCC to PCI_EXP_SLTCTL_PWR_ON
on slot (root port/downstream port) at the time a device
hotplugged into it. As result PCI_EXP_SLTCTL_PWR_ON is migrated
to target and above call chain keeps device plugged into it
powered on.

Fixes: d5daff7d312 ("pcie: implement slot power control for pcie root ports")
Fixes: 23786d13441 ("pci: implement power state")
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
Suggested-by: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/pci/pcie.h |  1 +
 hw/acpi/pcihp.c       | 12 +++++++++++-
 hw/pci/pcie.c         | 11 +++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 6063bee0ec..c27368d077 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -112,6 +112,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
                                 uint32_t addr, uint32_t val, int len);
 int pcie_cap_slot_post_load(void *opaque, int version_id);
 void pcie_cap_slot_push_attention_button(PCIDevice *dev);
+void pcie_cap_slot_enable_power(PCIDevice *dev);
 
 void pcie_cap_root_init(PCIDevice *dev);
 void pcie_cap_root_reset(PCIDevice *dev);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 6befd23e16..6351bd3424 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -32,6 +32,7 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci-bridge/xio3130_downstream.h"
 #include "hw/i386/acpi-build.h"
 #include "hw/acpi/acpi.h"
 #include "hw/pci/pci_bus.h"
@@ -336,6 +337,8 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
 {
     PCIDevice *pdev = PCI_DEVICE(dev);
     int slot = PCI_SLOT(pdev->devfn);
+    PCIDevice *bridge;
+    PCIBus *bus;
     int bsel;
 
     /* Don't send event when device is enabled during qemu machine creation:
@@ -365,7 +368,14 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
         return;
     }
 
-    bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
+    bus = pci_get_bus(pdev);
+    bridge = pci_bridge_get_device(bus);
+    if (object_dynamic_cast(OBJECT(bridge), TYPE_PCIE_ROOT_PORT) ||
+        object_dynamic_cast(OBJECT(bridge), TYPE_XIO3130_DOWNSTREAM)) {
+        pcie_cap_slot_enable_power(bridge);
+    }
+
+    bsel = acpi_pcihp_get_bsel(bus);
     g_assert(bsel >= 0);
     s->acpi_pcihp_pci_status[bsel].up |= (1U << slot);
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index d7d73a31e4..996f0e24fe 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -366,6 +366,17 @@ static void hotplug_event_clear(PCIDevice *dev)
     }
 }
 
+void pcie_cap_slot_enable_power(PCIDevice *dev)
+{
+    uint8_t *exp_cap = dev->config + dev->exp.exp_cap;
+    uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
+
+    if (sltcap & PCI_EXP_SLTCAP_PCP) {
+        pci_set_word_by_mask(exp_cap + PCI_EXP_SLTCTL,
+                             PCI_EXP_SLTCTL_PCC, PCI_EXP_SLTCTL_PWR_ON);
+    }
+}
+
 static void pcie_set_power_device(PCIBus *bus, PCIDevice *dev, void *opaque)
 {
     bool *power = opaque;
-- 
2.31.1


