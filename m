Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C418A6A1EC9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9y-0004e1-V3; Fri, 24 Feb 2023 10:38:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9m-00043r-S6
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9k-0007Zw-Ak
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MlTYern5b95w9iQACPyBvuRgXWZ5LGg/6CICTEt56eA=;
 b=T/Y0L84NP9DtK7lIv7iijxA+Z8iFOHsXnkl8Eq0vB8k0U3zcUA6zWTTg1bwVSdZJ5Ii2iN
 P9KvqwJNedUPSj3KZ97ZhpXMeRa2K5I18iJvHfaUt/gSTycr7qcautFFyQWOphHMYWzwrS
 pk22Z8g2u6LuaCvR+hUFFXT9HLLxrrU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-pyGMjmf8M1GzGB8RCuMEwg-1; Fri, 24 Feb 2023 10:38:42 -0500
X-MC-Unique: pyGMjmf8M1GzGB8RCuMEwg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C6163806109;
 Fri, 24 Feb 2023 15:38:42 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 815B3492B12;
 Fri, 24 Feb 2023 15:38:41 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 32/33] pcihp: move fields enabling hotplug into AcpiPciHpState
Date: Fri, 24 Feb 2023 16:38:11 +0100
Message-Id: <20230224153812.4176226-33-imammedo@redhat.com>
In-Reply-To: <20230224153812.4176226-1-imammedo@redhat.com>
References: <20230224153812.4176226-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

... instead of duplicating them in piix4 and lpc and then
trying to pass them to pcihp routines as arguments.
it simplifies call sites and places pcihp specific in
its own structure.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/pcihp.h         |  8 ++++----
 include/hw/acpi/piix4.h         |  2 --
 hw/acpi/acpi-pci-hotplug-stub.c |  5 ++---
 hw/acpi/ich9.c                  | 15 +++++++--------
 hw/acpi/pcihp.c                 | 16 ++++++++--------
 hw/acpi/piix4.c                 | 23 +++++++++++++----------
 6 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index cd18ebdcdc..04c98511a4 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -49,14 +49,14 @@ typedef struct AcpiPciHpState {
     uint32_t acpi_index;
     PCIBus *root;
     MemoryRegion io;
-    bool legacy_piix;
     uint16_t io_base;
     uint16_t io_len;
+    bool use_acpi_hotplug_bridge;
+    bool use_acpi_root_pci_hotplug;
 } AcpiPciHpState;
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
-                     MemoryRegion *address_space_io, bool bridges_enabled,
-                     uint16_t io_base);
+                     MemoryRegion *address_space_io, uint16_t io_base);
 
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp);
@@ -69,7 +69,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                          Error **errp);
 
 /* Called on reset */
-void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
+void acpi_pcihp_reset(AcpiPciHpState *s);
 
 void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus);
 
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
index be1f8ea80e..eb1c122d80 100644
--- a/include/hw/acpi/piix4.h
+++ b/include/hw/acpi/piix4.h
@@ -57,8 +57,6 @@ struct PIIX4PMState {
     Notifier powerdown_notifier;
 
     AcpiPciHpState acpi_pci_hotplug;
-    bool use_acpi_hotplug_bridge;
-    bool use_acpi_root_pci_hotplug;
     bool not_migrate_acpi_index;
 
     uint8_t disable_s3;
diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
index a43f6dafc9..d1794399f7 100644
--- a/hw/acpi/acpi-pci-hotplug-stub.c
+++ b/hw/acpi/acpi-pci-hotplug-stub.c
@@ -5,8 +5,7 @@
 const VMStateDescription vmstate_acpi_pcihp_pci_status;
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
-                     MemoryRegion *address_space_io, bool bridges_enabled,
-                     uint16_t io_base)
+                     MemoryRegion *address_space_io, uint16_t io_base)
 {
     return;
 }
@@ -36,7 +35,7 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
     return;
 }
 
-void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
+void acpi_pcihp_reset(AcpiPciHpState *s)
 {
     return;
 }
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index a93c470e9d..34a58fc07c 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -218,7 +218,7 @@ static bool vmstate_test_use_pcihp(void *opaque)
 {
     ICH9LPCPMRegs *s = opaque;
 
-    return s->use_acpi_hotplug_bridge;
+    return s->acpi_pci_hotplug.use_acpi_hotplug_bridge;
 }
 
 static const VMStateDescription vmstate_pcihp_state = {
@@ -277,8 +277,8 @@ static void pm_reset(void *opaque)
     }
     pm->smi_en_wmask = ~0;
 
-    if (pm->use_acpi_hotplug_bridge) {
-        acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
+    if (pm->acpi_pci_hotplug.use_acpi_hotplug_bridge) {
+        acpi_pcihp_reset(&pm->acpi_pci_hotplug);
     }
 
     acpi_update_sci(&pm->acpi_regs, pm->irq);
@@ -320,12 +320,11 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
         acpi_pm_tco_init(&pm->tco_regs, &pm->io);
     }
 
-    if (pm->use_acpi_hotplug_bridge) {
+    if (pm->acpi_pci_hotplug.use_acpi_hotplug_bridge) {
         acpi_pcihp_init(OBJECT(lpc_pci),
                         &pm->acpi_pci_hotplug,
                         pci_get_bus(lpc_pci),
                         pci_address_space_io(lpc_pci),
-                        true,
                         ACPI_PCIHP_ADDR_ICH9);
 
         qbus_set_hotplug_handler(BUS(pci_get_bus(lpc_pci)),
@@ -407,14 +406,14 @@ static bool ich9_pm_get_acpi_pci_hotplug(Object *obj, Error **errp)
 {
     ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
 
-    return s->pm.use_acpi_hotplug_bridge;
+    return s->pm.acpi_pci_hotplug.use_acpi_hotplug_bridge;
 }
 
 static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
 {
     ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
 
-    s->pm.use_acpi_hotplug_bridge = value;
+    s->pm.acpi_pci_hotplug.use_acpi_hotplug_bridge = value;
 }
 
 static bool ich9_pm_get_keep_pci_slot_hpc(Object *obj, Error **errp)
@@ -439,7 +438,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s3 = 0;
     pm->disable_s4 = 0;
     pm->s4_val = 2;
-    pm->use_acpi_hotplug_bridge = true;
+    pm->acpi_pci_hotplug.use_acpi_hotplug_bridge = true;
     pm->keep_pci_slot_hpc = true;
     pm->enable_tco = true;
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index adf45e8443..34cad061a8 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -276,12 +276,12 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
     }
 }
 
-void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
+void acpi_pcihp_reset(AcpiPciHpState *s)
 {
-    if (acpihp_root_off) {
+    if (!s->use_acpi_root_pci_hotplug) {
         acpi_pcihp_disable_root_bus();
     }
-    acpi_set_pci_info(!s->legacy_piix);
+    acpi_set_pci_info(s->use_acpi_hotplug_bridge);
     acpi_pcihp_update(s);
 }
 
@@ -316,7 +316,7 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
          * Overwrite the default hotplug handler with the ACPI PCI one
          * for cold plugged bridges only.
          */
-        if (!s->legacy_piix &&
+        if (s->use_acpi_hotplug_bridge &&
             object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
             PCIBus *sec = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
 
@@ -398,7 +398,7 @@ static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
     switch (addr) {
     case PCI_UP_BASE:
         val = s->acpi_pcihp_pci_status[bsel].up;
-        if (!s->legacy_piix) {
+        if (s->use_acpi_hotplug_bridge) {
             s->acpi_pcihp_pci_status[bsel].up = 0;
         }
         trace_acpi_pci_up_read(val);
@@ -473,7 +473,8 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
         trace_acpi_pci_ej_write(addr, data);
         break;
     case PCI_SEL_BASE:
-        s->hotplug_select = s->legacy_piix ? ACPI_PCIHP_BSEL_DEFAULT : data;
+        s->hotplug_select = s->use_acpi_hotplug_bridge ? data :
+            ACPI_PCIHP_BSEL_DEFAULT;
         trace_acpi_pci_sel_write(addr, data);
     default:
         break;
@@ -491,14 +492,13 @@ static const MemoryRegionOps acpi_pcihp_io_ops = {
 };
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *s, PCIBus *root_bus,
-                     MemoryRegion *address_space_io, bool bridges_enabled,
+                     MemoryRegion *address_space_io,
                      uint16_t io_base)
 {
     s->io_len = ACPI_PCIHP_SIZE;
     s->io_base = io_base;
 
     s->root = root_bus;
-    s->legacy_piix = !bridges_enabled;
 
     memory_region_init_io(&s->io, owner, &acpi_pcihp_io_ops, s,
                           "acpi-pci-hotplug", s->io_len);
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 8fc422829a..0a233fa95d 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -170,14 +170,14 @@ static const VMStateDescription vmstate_pci_status = {
 static bool vmstate_test_use_acpi_hotplug_bridge(void *opaque, int version_id)
 {
     PIIX4PMState *s = opaque;
-    return s->use_acpi_hotplug_bridge;
+    return s->acpi_pci_hotplug.use_acpi_hotplug_bridge;
 }
 
 static bool vmstate_test_no_use_acpi_hotplug_bridge(void *opaque,
                                                     int version_id)
 {
     PIIX4PMState *s = opaque;
-    return !s->use_acpi_hotplug_bridge;
+    return !s->acpi_pci_hotplug.use_acpi_hotplug_bridge;
 }
 
 static bool vmstate_test_use_memhp(void *opaque)
@@ -234,7 +234,8 @@ static bool piix4_vmstate_need_smbus(void *opaque, int version_id)
 static bool vmstate_test_migrate_acpi_index(void *opaque, int version_id)
 {
     PIIX4PMState *s = PIIX4_PM(opaque);
-    return s->use_acpi_hotplug_bridge && !s->not_migrate_acpi_index;
+    return s->acpi_pci_hotplug.use_acpi_hotplug_bridge &&
+           !s->not_migrate_acpi_index;
 }
 
 /* qemu-kvm 1.2 uses version 3 but advertised as 2
@@ -303,8 +304,9 @@ static void piix4_pm_reset(DeviceState *dev)
     acpi_update_sci(&s->ar, s->irq);
 
     pm_io_space_update(s);
-    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
-        acpi_pcihp_reset(&s->acpi_pci_hotplug, !s->use_acpi_root_pci_hotplug);
+    if (s->acpi_pci_hotplug.use_acpi_hotplug_bridge ||
+        s->acpi_pci_hotplug.use_acpi_root_pci_hotplug) {
+        acpi_pcihp_reset(&s->acpi_pci_hotplug);
     }
 }
 
@@ -487,7 +489,7 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     qemu_add_machine_init_done_notifier(&s->machine_ready);
 
     if (xen_enabled()) {
-        s->use_acpi_hotplug_bridge = false;
+        s->acpi_pci_hotplug.use_acpi_hotplug_bridge = false;
     }
 
     piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
@@ -560,9 +562,10 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
                           "acpi-gpe0", GPE_LEN);
     memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
 
-    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
+    if (s->acpi_pci_hotplug.use_acpi_hotplug_bridge ||
+        s->acpi_pci_hotplug.use_acpi_root_pci_hotplug) {
         acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
-                        s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
+                        ACPI_PCIHP_ADDR_PIIX4);
         qbus_set_hotplug_handler(BUS(pci_get_bus(PCI_DEVICE(s))), OBJECT(s));
     }
 
@@ -602,9 +605,9 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_DISABLED, PIIX4PMState, disable_s4, 0),
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
     DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, PIIX4PMState,
-                     use_acpi_hotplug_bridge, true),
+                     acpi_pci_hotplug.use_acpi_hotplug_bridge, true),
     DEFINE_PROP_BOOL(ACPI_PM_PROP_ACPI_PCI_ROOTHP, PIIX4PMState,
-                     use_acpi_root_pci_hotplug, true),
+                     acpi_pci_hotplug.use_acpi_root_pci_hotplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
     DEFINE_PROP_BOOL("smm-compat", PIIX4PMState, smm_compat, false),
-- 
2.39.1


