Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC52E109E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 00:43:35 +0100 (CET)
Received: from localhost ([::1]:44462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krrJW-0001zO-6D
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 18:43:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrGB-0000Nx-9L
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrG7-0005IN-Hu
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608680400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRqJIElpNRLwzQi92GzEhWLqvO2sH/KNhssq3GcOdPw=;
 b=HiAkWxIyQPCVDMy+4iWQ9fhsctQELtqfNNa6YhSdZEUOQO77fufBk648p/EFbL6qqt9FY5
 YcDsmFGnLPAAWC7igEcCnHVFQHoGeH6Xo45+qBRPfF7higF9EmN5LooWt9vINW4IYilW4E
 4gkDRRA/u5ovEXfbImx4N2fZWlV7118=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-7cDFr3wdNnSWXtyIY63WPg-1; Tue, 22 Dec 2020 18:39:58 -0500
X-MC-Unique: 7cDFr3wdNnSWXtyIY63WPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1805E801817;
 Tue, 22 Dec 2020 23:39:57 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1528B5D9CC;
 Tue, 22 Dec 2020 23:39:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 3/5] pci: introduce apci-index property for PCI device
Date: Tue, 22 Dec 2020 18:39:32 -0500
Message-Id: <20201222233934.451578-4-imammedo@redhat.com>
In-Reply-To: <20201222233934.451578-1-imammedo@redhat.com>
References: <20201222233934.451578-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, jusual@redhat.com, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In x86/ACPI world, since systemd v197, linux distros are
using predictable network interface naming since systemd
v197. Which on QEMU based VMs results into path based
naming scheme, that names network interfaces based on PCI
topology.

With this one has to plug NIC in exacly the same bus/slot,
which was used when disk image was first provisioned/configured
or one risks to loose network configuration due to NIC being
renamed to actually used topology.
That also restricts freedom reshape PCI configuration of
VM without need to reconfigure used guest image.

systemd also offers "onboard" naming scheme which is
preffered over PCI slot/topology one, provided that
firmware implements:
    "
    PCI Firmware Specification 3.1
    4.6.7.  DSM for Naming a PCI or PCI Express Device Under
            Operating Systems
    "
that allows to assign user defined index to PCI device,
which systemd will use to name NIC. For example, using
  -device e1000,acpi-index=100
guest will rename NIC to 'eno100', where 'eno' is default
prefix for "onboard" naming scheme. This doesn't reqiure
any advance configuration on guest side.

Hope is that 'acpi-index' will be easier to consume by
mangment layer, compared to forcing specic PCI topology
and/or having several disk image templates for different
topologies and will help to simplify process of spawning
VM from the same template without need to reconfigure
guest network configuration.

this patch adds, 'acpi-index'* property and wires up
(abuses) unused pci hotplug registers to pass index
value to AML code at runtime.
Following patch will add corresponding _DSM code and
wire it up to PCI devices described in ACPI.

*) name comes from linux kernel terminology

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: libvir-list@redhat.com

 include/hw/acpi/pcihp.h |  7 ++++++-
 include/hw/pci/pci.h    |  1 +
 hw/acpi/pci.c           |  6 ++++++
 hw/acpi/pcihp.c         | 25 ++++++++++++++++++++++++-
 hw/i386/acpi-build.c    | 10 ++++++++++
 hw/pci/pci.c            |  1 +
 6 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index dfd375820f..72d1773ca1 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -46,6 +46,7 @@ typedef struct AcpiPciHpPciStatus {
 typedef struct AcpiPciHpState {
     AcpiPciHpPciStatus acpi_pcihp_pci_status[ACPI_PCIHP_MAX_HOTPLUG_BUS];
     uint32_t hotplug_select;
+    uint32_t acpi_index;
     PCIBus *root;
     MemoryRegion io;
     bool legacy_piix;
@@ -71,6 +72,8 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
 
 extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
 
+bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id);
+
 #define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp) \
         VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
                             test_pcihp), \
@@ -78,6 +81,8 @@ extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
                                   ACPI_PCIHP_MAX_HOTPLUG_BUS, \
                                   test_pcihp, 1, \
                                   vmstate_acpi_pcihp_pci_status, \
-                                  AcpiPciHpPciStatus)
+                                  AcpiPciHpPciStatus), \
+        VMSTATE_UINT32_TEST(pcihp.acpi_index, state, \
+                            vmstate_acpi_pcihp_use_acpi_index)
 
 #endif
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 259f9c992d..e592532558 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -357,6 +357,7 @@ struct PCIDevice {
 
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
+    uint32_t acpi_index;
 };
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index 9510597a19..07d5101d83 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -27,6 +27,7 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/pci.h"
 #include "hw/pci/pcie_host.h"
+#include "hw/acpi/pcihp.h"
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
@@ -59,3 +60,8 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
                  "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
 }
 
+bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
+{
+     AcpiPciHpState *s = opaque;
+     return s->acpi_index;
+}
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 9dc4d3e2db..9634567e3a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -347,7 +347,8 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
         trace_acpi_pci_down_read(val);
         break;
     case PCI_EJ_BASE:
-        /* No feature defined yet */
+        val = s->acpi_index;
+        s->acpi_index = 0;
         trace_acpi_pci_features_read(val);
         break;
     case PCI_RMV_BASE:
@@ -367,8 +368,30 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
 static void pci_write(void *opaque, hwaddr addr, uint64_t data,
                       unsigned int size)
 {
+    int slot;
+    PCIBus *bus;
+    BusChild *kid, *next;
     AcpiPciHpState *s = opaque;
+
+    s->acpi_index = 0;
     switch (addr) {
+    case PCI_UP_BASE:
+        slot = ctz32(data);
+
+        if (s->hotplug_select >= ACPI_PCIHP_MAX_HOTPLUG_BUS) {
+            break;
+        }
+
+        bus = acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
+        QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
+            Object *o = OBJECT(kid->child);
+            PCIDevice *dev = PCI_DEVICE(o);
+            if (PCI_SLOT(dev->devfn) == slot) {
+                s->acpi_index = object_property_get_uint(o, "acpi-index", NULL);
+                break;
+            }
+        }
+        break;
     case PCI_EJ_BASE:
         if (s->hotplug_select >= ACPI_PCIHP_MAX_HOTPLUG_BUS) {
             break;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f18b71dea9..27d2958e25 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1132,6 +1132,16 @@ static void build_piix4_pci_hotplug(Aml *table)
     aml_append(method, aml_return(aml_int(0)));
     aml_append(scope, method);
 
+    method = aml_method("AIDX", 2, AML_NOTSERIALIZED);
+    aml_append(method, aml_acquire(aml_name("BLCK"), 0xFFFF));
+    aml_append(method, aml_store(aml_arg(0), aml_name("BNUM")));
+    aml_append(method,
+        aml_store(aml_shiftleft(aml_int(1), aml_arg(1)), aml_name("PCIU")));
+    aml_append(method, aml_store(aml_name("B0EJ"), aml_local(0)));
+    aml_append(method, aml_release(aml_name("BLCK")));
+    aml_append(method, aml_return(aml_local(0)));
+    aml_append(scope, method);
+
     aml_append(table, scope);
 }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index d4349ea577..617f48ff3b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -76,6 +76,7 @@ static Property pci_props[] = {
                     QEMU_PCIE_EXTCAP_INIT_BITNR, true),
     DEFINE_PROP_STRING("failover_pair_id", PCIDevice,
                        failover_pair_id),
+    DEFINE_PROP_UINT32("acpi-index",  PCIDevice, acpi_index, -1),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.27.0


