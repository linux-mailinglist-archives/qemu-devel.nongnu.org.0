Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB23C6796
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 02:45:08 +0200 (CEST)
Received: from localhost ([::1]:47172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m36Xr-0006xP-NF
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 20:45:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1m36Vf-0004Eb-Jv
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 20:42:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jusual@redhat.com>) id 1m36Vd-0002Ds-U2
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 20:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626136968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vo37EQWYIecKJS85PrcVINVsvBgH+Ntvf0U9podZEzg=;
 b=D1yNYjoAiPM1LOeG4d8Q/VmHBkhKGAAwgJ8l0BxyvspH7Gixsn2bIu2BrqG0FxdjdJet3+
 ZTaxCC6Z6wn6TW93n/rU4AaxxxkVGxAb/aX3GEm3J3ECtsSCs0VptrWRi64EvMhJsNZqIv
 HEVLkiyi66lnTsQx7qKU9j8OeoiXXRo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-1bRLVyHkPPuNlp6-iLLApg-1; Mon, 12 Jul 2021 20:42:47 -0400
X-MC-Unique: 1bRLVyHkPPuNlp6-iLLApg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98EC9100B3AC;
 Tue, 13 Jul 2021 00:42:46 +0000 (UTC)
Received: from pc-58.home (unknown [10.40.192.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56D4B5C1D1;
 Tue, 13 Jul 2021 00:42:44 +0000 (UTC)
From: Julia Suvorova <jusual@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/6] hw/pci/pcie: Do not set HPC flag if acpihp is used
Date: Tue, 13 Jul 2021 02:42:02 +0200
Message-Id: <20210713004205.775386-4-jusual@redhat.com>
In-Reply-To: <20210713004205.775386-1-jusual@redhat.com>
References: <20210713004205.775386-1-jusual@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jusual@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jusual@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 David Gibson <dgibson@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of changing the hot-plug type in _OSC register, do not
set the 'Hot-Plug Capable' flag. This way guest will choose ACPI
hot-plug if it is preferred and leave the option to use SHPC with
pcie-pci-bridge.

The ability to control hot-plug for each downstream port is retained,
while 'hotplug=off' on the port means all hot-plug types are disabled.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/pci/pcie_port.h |  5 ++++-
 hw/acpi/pcihp.c            |  8 ++++++++
 hw/core/machine.c          |  1 -
 hw/i386/pc_q35.c           | 11 +++++++++++
 hw/pci/pcie.c              |  8 +++++++-
 hw/pci/pcie_port.c         |  1 +
 6 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index bea8ecad0f..e25b289ce8 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -57,8 +57,11 @@ struct PCIESlot {
     /* Disable ACS (really for a pcie_root_port) */
     bool        disable_acs;
 
-    /* Indicates whether hot-plug is enabled on the slot */
+    /* Indicates whether any type of hot-plug is allowed on the slot */
     bool        hotplug;
+
+    bool        native_hotplug;
+
     QLIST_ENTRY(PCIESlot) next;
 };
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 9fdc6342b0..f4d706e47d 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -31,6 +31,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
+#include "hw/pci/pcie_port.h"
 #include "hw/i386/acpi-build.h"
 #include "hw/acpi/acpi.h"
 #include "hw/pci/pci_bus.h"
@@ -336,6 +337,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
             object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
             PCIBus *sec = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
 
+            /* Remove all hot-plug handlers if hot-plug is disabled on slot */
+            if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT) &&
+                !PCIE_SLOT(pdev)->hotplug) {
+                qbus_set_hotplug_handler(BUS(sec), NULL);
+                return;
+            }
+
             qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));
             /* We don't have to overwrite any other hotplug handler yet */
             assert(QLIST_EMPTY(&sec->child));
diff --git a/hw/core/machine.c b/hw/core/machine.c
index ca69f0343a..339031219d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -583,7 +583,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
     ms->ram_memdev_id = g_strdup(value);
 }
 
-
 static void machine_init_notify(Notifier *notifier, void *data)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46a0f196f4..04b4a4788d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -37,6 +37,7 @@
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
 #include "hw/pci-host/q35.h"
+#include "hw/pci/pcie_port.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
@@ -136,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
     ram_addr_t lowmem;
     DriveInfo *hd[MAX_SATA_PORTS];
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    bool acpi_pcihp;
 
     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
@@ -236,6 +238,15 @@ static void pc_q35_init(MachineState *machine)
     object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
                              OBJECT(lpc), &error_abort);
 
+    acpi_pcihp = object_property_get_bool(OBJECT(lpc),
+                                          "acpi-pci-hotplug-with-bridge-support",
+                                          NULL);
+
+    if (acpi_pcihp) {
+        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
+                                   "false", true);
+    }
+
     /* irq lines */
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index fd0fa157e8..6e95d82903 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -529,7 +529,13 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
                                PCI_EXP_SLTCAP_PIP |
                                PCI_EXP_SLTCAP_AIP |
                                PCI_EXP_SLTCAP_ABP);
-    if (s->hotplug) {
+
+    /*
+     * Enable native hot-plug on all hot-plugged bridges unless
+     * hot-plug is disabled on the slot.
+     */
+    if (s->hotplug &&
+        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
         pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
                                    PCI_EXP_SLTCAP_HPS |
                                    PCI_EXP_SLTCAP_HPC);
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index eb563ad435..da850e8dde 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -148,6 +148,7 @@ static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
     DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
     DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
+    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.30.2


