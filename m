Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D6667715
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:39:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBX-0002XX-Qe; Thu, 12 Jan 2023 09:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBK-0002HZ-Dp
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBG-00061S-HS
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phRzmiDzg4jqp88p3MuTm/AcgGzZs7mH5KQjmTL9e20=;
 b=KivSnmC461ZluZe0OltKj3CcUGUFwsiwGzAcx143X+3bVAfcCR+mev5p6P4tNJIMmI05Xm
 eV5AO9hkh8BUMiv7JF8VfYUFruMmzUJ9u3hG96hz/MZnOlzbRBSc2QXPKU/Rk2pzJh4nq1
 sgOPZff/EK/B0FabHl5dOXVaELhb8os=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-hXCzG826MTq_aIGnuLa5xA-1; Thu, 12 Jan 2023 09:03:44 -0500
X-MC-Unique: hXCzG826MTq_aIGnuLa5xA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A9848030D4;
 Thu, 12 Jan 2023 14:03:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A91F64085721;
 Thu, 12 Jan 2023 14:03:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 33/40] pcihp: acpi: decouple hotplug and generic slots
 description
Date: Thu, 12 Jan 2023 15:03:05 +0100
Message-Id: <20230112140312.3096331-34-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Split build_append_pci_bus_devices() onto generic part that builds
AML descriptions only for populated slots which is applicable to
both hotplug disabled and enabled bridges. And a hotplug only
part that complements generic AML with hotplug depended bits
(that depend on BSEL), like _SUN/_EJ0 entries, dynamic _DSM.

Hotplug part, will generate full 'Device' descriptors for
non-populated slots (like it used to be) and complementary
'Scope' descriptors for populated slots that are hotplug capable.
i.e. something like this:
  - ...
  +                Name (BSEL, 0x03)
  +                Scope (S00)
  +                {
  +                    Name (ASUN, Zero)
  +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  +                    {
  +                        Local0 = Package (0x02)
  +                            {
  +                                BSEL,
  +                                ASUN
  +                            }
  +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  +                    }
  +  [ ... other hotplug depended bits ]
  +                }

While generic build_append_pci_bus_devices() still calls hotplug part at
its end it doesn't really depend on any hotplug bits anymore and later
both could be completely separated when it's necessary.

Main benefit though is that both build_append_pci_bus_devices() and
build_append_pcihp_slots() become more readable and it makes easier
to modify them with less risk of affecting another part. Also it opens
possibility to re-use generic part elsewhere (microvm, arm/virt).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
PS:
All that comes at cost of some code duplication and extra AML (Scope),
but I think simpler and more resuable code well worth of it.
---
 hw/i386/acpi-build.c | 121 +++++++++++++++++++++++++------------------
 1 file changed, 72 insertions(+), 49 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 56a4d0549c..a4f882dc72 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -385,35 +385,40 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
     aml_append(method, if_ctx);
 }
 
-static bool is_devfn_ignored(const int devfn, const PCIBus *bus,
-                             bool bus_has_hotplug)
+static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
 {
     const PCIDevice *pdev = bus->devices[devfn];
 
-    if (pdev) {
-        if (PCI_FUNC(devfn)) {
-            if (IS_PCI_BRIDGE(pdev)) {
-                /*
-                 * Ignore only hotplugged PCI bridges on !0 functions, but
-                 * allow describing cold plugged bridges on all functions
-                 */
-                if (DEVICE(pdev)->hotplugged) {
-                    return true;
-                }
-            } else if (!get_dev_aml_func(DEVICE(pdev))) {
-                /*
-                 * Ignore all other devices on !0 functions unless they
-                 * have AML description (i.e have get_dev_aml_func() != 0)
-                 */
+    if (PCI_FUNC(devfn)) {
+        if (IS_PCI_BRIDGE(pdev)) {
+            /*
+             * Ignore only hotplugged PCI bridges on !0 functions, but
+             * allow describing cold plugged bridges on all functions
+             */
+            if (DEVICE(pdev)->hotplugged) {
                 return true;
             }
+        } else if (!get_dev_aml_func(DEVICE(pdev))) {
+            /*
+             * Ignore all other devices on !0 functions unless they
+             * have AML description (i.e have get_dev_aml_func() != 0)
+             */
+            return true;
         }
+    }
+    return false;
+}
+
+static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
+{
+    if (bus->devices[devfn]) {
+        return is_devfn_ignored_generic(devfn, bus);
     } else { /* non populated slots */
-        /*
+         /*
          * hotplug is supported only for non-multifunction device
          * so generate device description only for function 0
          */
-        if (!bus_has_hotplug || PCI_FUNC(devfn) ||
+        if (PCI_FUNC(devfn) ||
             (pci_bus_is_express(bus) && PCI_SLOT(devfn) > 0)) {
             return true;
         }
@@ -421,29 +426,23 @@ static bool is_devfn_ignored(const int devfn, const PCIBus *bus,
     return false;
 }
 
-void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
+static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
+                                     QObject *bsel)
 {
-    Aml *dev, *notify_method = NULL, *method;
-    QObject *bsel;
     int devfn;
+    Aml *dev, *notify_method = NULL, *method;
+    uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
-    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
-    if (bsel) {
-        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
-
-        aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
-        notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
-    }
+    aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
+    notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
 
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         PCIDevice *pdev = bus->devices[devfn];
         int slot = PCI_SLOT(devfn);
-        int func = PCI_FUNC(devfn);
-        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
-        int adr = slot << 16 | func;
+        int adr = slot << 16 | PCI_FUNC(devfn);
         bool hotpluggbale_slot = true;
 
-        if (is_devfn_ignored(devfn, bus, !!bsel)) {
+        if (is_devfn_ignored_hotplug(devfn, bus)) {
             continue;
         }
 
@@ -454,24 +453,20 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
              */
             bool cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
                                   !DEVICE(pdev)->hotplugged;
-            hotpluggbale_slot = bsel && DEVICE_GET_CLASS(pdev)->hotpluggable &&
+            hotpluggbale_slot = DEVICE_GET_CLASS(pdev)->hotpluggable &&
                                 !cold_plugged_bridge;
+            dev = aml_scope("S%.02X", devfn);
+        } else {
+            dev = aml_device("S%.02X", devfn);
+            aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
         }
 
-        /* start to compose PCI device descriptor */
-        dev = aml_device("S%.02X", devfn);
-        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
-
-        if (bsel) {
-            /*
-             * Can't declare _SUN here for every device as it changes 'slot'
-             * enumeration order in linux kernel, so use another variable for it
-             */
-            aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
-            aml_append(dev, aml_pci_device_dsm());
-        }
-
-        call_dev_aml_func(DEVICE(pdev), dev);
+        /*
+         * Can't declare _SUN here for every device as it changes 'slot'
+         * enumeration order in linux kernel, so use another variable for it
+         */
+        aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
+        aml_append(dev, aml_pci_device_dsm());
 
         if (hotpluggbale_slot) {
             aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
@@ -488,9 +483,37 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
         /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
     }
+    aml_append(parent_scope, notify_method);
+}
+
+void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
+{
+    QObject *bsel;
+    int devfn;
+    Aml *dev;
+
+    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
+
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
+        int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
+
+        if (!bus->devices[devfn] || is_devfn_ignored_generic(devfn, bus)) {
+            continue;
+        }
+
+        /* start to compose PCI device descriptor */
+        dev = aml_device("S%.02X", devfn);
+        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
+
+        call_dev_aml_func(DEVICE(bus->devices[devfn]), dev);
+
+        /* device descriptor has been composed, add it into parent context */
+        aml_append(parent_scope, dev);
+    }
 
     if (bsel) {
-        aml_append(parent_scope, notify_method);
+        build_append_pcihp_slots(parent_scope, bus, bsel);
     }
 
     qobject_unref(bsel);
-- 
2.31.1


