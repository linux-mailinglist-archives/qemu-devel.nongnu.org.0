Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8229733C58A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:27:04 +0100 (CET)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrvj-0004ZP-Hz
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrX1-0001J7-PA
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrWy-0008Pm-LX
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tOBcNpzTLRc+kcMrgDtow2laLgRQVOebIYmbeYy1IHE=;
 b=FNatv9kRvkziAgejvA5F65QSdVG2lRyq75Rh5cr9Gw2ebhbxTUleXa1ohWflVAPyrYmPWd
 tg9XPkTe2gWRqWcNWaWw4YvNYeLt2sqi+6GXfMli6/ds06RFT/CwlLmoiBhylMYmumQvq7
 PkjRB7oCaqd8Kbb76xDy0se3nrLWKSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-Xvhu1o0wPRGBkPyVTXr49g-1; Mon, 15 Mar 2021 14:01:25 -0400
X-MC-Unique: Xvhu1o0wPRGBkPyVTXr49g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D08A21015CB9
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 18:01:12 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C483F84411;
 Mon, 15 Mar 2021 18:01:11 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] pci: introduce apci-index property for PCI device
Date: Mon, 15 Mar 2021 14:00:58 -0400
Message-Id: <20210315180102.3008391-3-imammedo@redhat.com>
In-Reply-To: <20210315180102.3008391-1-imammedo@redhat.com>
References: <20210315180102.3008391-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jusual@redhat.com, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In x86/ACPI world, linux distros are using predictable
network interface naming since systemd v197. Which on
QEMU based VMs results into path based naming scheme,
that names network interfaces based on PCI topology.

With itm on has to plug NIC in exactly the same bus/slot,
which was used when disk image was first provisioned/configured
or one risks to loose network configuration due to NIC being
renamed to actually used topology.
That also restricts freedom to reshape PCI configuration of
VM without need to reconfigure used guest image.

systemd also offers "onboard" naming scheme which is
preferred over PCI slot/topology one, provided that
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
prefix for "onboard" naming scheme. This doesn't require
any advance configuration on guest side to com in effect
at 'onboard' scheme takes priority over path based naming.

Hope is that 'acpi-index' it will be easier to consume by
management layer, compared to forcing specific PCI topology
and/or having several disk image templates for different
topologies and will help to simplify process of spawning
VM from the same template without need to reconfigure
guest NIC.

This patch adds, 'acpi-index'* property and wires up
a 32bit register on top of pci hotplug register block
to pass index value to AML code at runtime.
Following patch will add corresponding _DSM code and
wire it up to PCI devices described in ACPI.

*) name comes from linux kernel terminology

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v1:
 *  fix build failure of mips target
 *  move out handling acpi-index into separate MMIO register,
    instead of abusing unused PCI hotplug registers (mst)
 *  default acpi-index property value to 0
 *  set and check for max acpi-index value (systemd limitation)
---
 include/hw/acpi/pcihp.h |  9 +++++--
 include/hw/pci/pci.h    |  1 +
 hw/acpi/pci.c           |  1 -
 hw/acpi/pcihp.c         | 58 +++++++++++++++++++++++++++++++++++++++--
 hw/acpi/piix4.c         |  3 ++-
 hw/acpi/trace-events    |  2 ++
 hw/i386/acpi-build.c    | 13 ++++++++-
 hw/pci/pci.c            |  1 +
 8 files changed, 81 insertions(+), 7 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index dfd375820f..2dd90aea30 100644
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
@@ -71,13 +72,17 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
 
 extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
 
-#define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp) \
+bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id);
+
+#define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
         VMSTATE_UINT32_TEST(pcihp.hotplug_select, state, \
                             test_pcihp), \
         VMSTATE_STRUCT_ARRAY_TEST(pcihp.acpi_pcihp_pci_status, state, \
                                   ACPI_PCIHP_MAX_HOTPLUG_BUS, \
                                   test_pcihp, 1, \
                                   vmstate_acpi_pcihp_pci_status, \
-                                  AcpiPciHpPciStatus)
+                                  AcpiPciHpPciStatus), \
+        VMSTATE_UINT32_TEST(pcihp.acpi_index, state, \
+                            test_acpi_index)
 
 #endif
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 1bc231480f..6be4e0c460 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -359,6 +359,7 @@ struct PCIDevice {
 
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
+    uint32_t acpi_index;
 };
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index ec455c3b25..75b1103ec4 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -59,4 +59,3 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
     build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
                  "MCFG", table_data->len - mcfg_start, 1, oem_id, oem_table_id);
 }
-
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 9dc4d3e2db..ceab287bd3 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -39,12 +39,13 @@
 #include "trace.h"
 
 #define ACPI_PCIHP_ADDR 0xae00
-#define ACPI_PCIHP_SIZE 0x0014
+#define ACPI_PCIHP_SIZE 0x0018
 #define PCI_UP_BASE 0x0000
 #define PCI_DOWN_BASE 0x0004
 #define PCI_EJ_BASE 0x0008
 #define PCI_RMV_BASE 0x000c
 #define PCI_SEL_BASE 0x0010
+#define PCI_AIDX_BASE 0x0014
 
 typedef struct AcpiPciHpFind {
     int bsel;
@@ -251,9 +252,13 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
     acpi_pcihp_update(s);
 }
 
+#define ONBOARD_INDEX_MAX (16 * 1024 - 1)
+
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp)
 {
+    PCIDevice *pdev = PCI_DEVICE(dev);
+
     /* Only hotplugged devices need the hotplug capability. */
     if (dev->hotplugged &&
         acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))) < 0) {
@@ -261,6 +266,17 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                    ACPI_PCIHP_PROP_BSEL "' set");
         return;
     }
+
+    /*
+     * capped by systemd (see: udev-builtin-net_id.c)
+     * as it's the only known user honor it to avoid users
+     * misconfigure QEMU and then wonder why acpi-index doesn't work
+     */
+    if (pdev->acpi_index > ONBOARD_INDEX_MAX) {
+        error_setg(errp, "acpi-index should be less or equal to %u",
+                   ONBOARD_INDEX_MAX);
+        return;
+    }
 }
 
 void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
@@ -347,7 +363,6 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
         trace_acpi_pci_down_read(val);
         break;
     case PCI_EJ_BASE:
-        /* No feature defined yet */
         trace_acpi_pci_features_read(val);
         break;
     case PCI_RMV_BASE:
@@ -357,6 +372,12 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
     case PCI_SEL_BASE:
         val = s->hotplug_select;
         trace_acpi_pci_sel_read(val);
+        break;
+    case PCI_AIDX_BASE:
+        val = s->acpi_index;
+        s->acpi_index = 0;
+        trace_acpi_pci_acpi_index_read(val);
+        break;
     default:
         break;
     }
@@ -367,8 +388,35 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
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
+    case PCI_AIDX_BASE:
+        /*
+         * fetch acpi-index for specified slot so that follow up read from
+         * PCI_AIDX_BASE can return it to guest
+         */
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
+        trace_acpi_pci_acpi_index_write(s->hotplug_select, slot, s->acpi_index);
+        break;
     case PCI_EJ_BASE:
         if (s->hotplug_select >= ACPI_PCIHP_MAX_HOTPLUG_BUS) {
             break;
@@ -413,6 +461,12 @@ void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
                                    OBJ_PROP_FLAG_READ);
 }
 
+bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
+{
+     AcpiPciHpState *s = opaque;
+     return s->acpi_index;
+}
+
 const VMStateDescription vmstate_acpi_pcihp_pci_status = {
     .name = "acpi_pcihp_pci_status",
     .version_id = 1,
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 1efc0ded9f..6056d51667 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -297,7 +297,8 @@ static const VMStateDescription vmstate_acpi = {
             2, vmstate_pci_status,
             struct AcpiPciHpPciStatus),
         VMSTATE_PCI_HOTPLUG(acpi_pci_hotplug, PIIX4PMState,
-                            vmstate_test_use_acpi_hotplug_bridge),
+                            vmstate_test_use_acpi_hotplug_bridge,
+                            vmstate_acpi_pcihp_use_acpi_index),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index f91ced477d..dcc1438f3a 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -41,6 +41,8 @@ acpi_pci_unplug_request(int bsel, int slot) "bsel: %d slot: %d"
 acpi_pci_up_read(uint32_t val) "%" PRIu32
 acpi_pci_down_read(uint32_t val) "%" PRIu32
 acpi_pci_features_read(uint32_t val) "%" PRIu32
+acpi_pci_acpi_index_read(uint32_t val) "%" PRIu32
+acpi_pci_acpi_index_write(unsigned bsel, unsigned slot, uint32_t aidx) "bsel: %u slot: %u aidx: %" PRIu32
 acpi_pci_rmv_read(uint32_t val) "%" PRIu32
 acpi_pci_sel_read(uint32_t val) "%" PRIu32
 acpi_pci_ej_write(uint64_t addr, uint64_t data) "0x%" PRIx64 " <== %" PRIu64
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 442b4629a9..e49fae2bfd 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1168,9 +1168,10 @@ static void build_piix4_pci_hotplug(Aml *table)
     aml_append(scope, field);
 
     aml_append(scope,
-        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10), 0x04));
+        aml_operation_region("BNMR", AML_SYSTEM_IO, aml_int(0xae10), 0x08));
     field = aml_field("BNMR", AML_DWORD_ACC, AML_NOLOCK, AML_WRITE_AS_ZEROS);
     aml_append(field, aml_named_field("BNUM", 32));
+    aml_append(field, aml_named_field("PIDX", 32));
     aml_append(scope, field);
 
     aml_append(scope, aml_mutex("BLCK", 0));
@@ -1184,6 +1185,16 @@ static void build_piix4_pci_hotplug(Aml *table)
     aml_append(method, aml_return(aml_int(0)));
     aml_append(scope, method);
 
+    method = aml_method("AIDX", 2, AML_NOTSERIALIZED);
+    aml_append(method, aml_acquire(aml_name("BLCK"), 0xFFFF));
+    aml_append(method, aml_store(aml_arg(0), aml_name("BNUM")));
+    aml_append(method,
+        aml_store(aml_shiftleft(aml_int(1), aml_arg(1)), aml_name("PIDX")));
+    aml_append(method, aml_store(aml_name("PIDX"), aml_local(0)));
+    aml_append(method, aml_release(aml_name("BLCK")));
+    aml_append(method, aml_return(aml_local(0)));
+    aml_append(scope, method);
+
     aml_append(table, scope);
 }
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 0eadcdbc9e..ac9a24889c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -79,6 +79,7 @@ static Property pci_props[] = {
                     QEMU_PCIE_EXTCAP_INIT_BITNR, true),
     DEFINE_PROP_STRING("failover_pair_id", PCIDevice,
                        failover_pair_id),
+    DEFINE_PROP_UINT32("acpi-index",  PCIDevice, acpi_index, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.27.0


