Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569183D375B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 11:06:40 +0200 (CEST)
Received: from localhost ([::1]:32972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6r8h-0006JX-Dw
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 05:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6r6m-0004jf-Sg
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m6r6j-0005FZ-T9
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627031076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wgWh7vafa3tgTrBptO6XTnONlSm9JR3Hno9YBw/pF94=;
 b=Gx8m5NzhOC3KAud8oVEVTIOzLo3n1zl8y5nbKaOsYmzYZpGykY6E5lB11G8wigZXfG8Ojj
 QgA3ZIvX04PIhffzOvGo8ArIfZfxM2c4ot+k0iRlLYk5rMKacIZYVQSp9vOj0WjvYKaBZ1
 K3E3A0f/HUXxLCnsZVJukRPqU7RWS6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-d4zNa4MfMy2RaTcm-lPlCg-1; Fri, 23 Jul 2021 05:04:35 -0400
X-MC-Unique: d4zNa4MfMy2RaTcm-lPlCg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9936180FCCD;
 Fri, 23 Jul 2021 09:04:34 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E791A10016DB;
 Fri, 23 Jul 2021 09:04:25 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] acpi: x86: pcihp: add support hotplug on multifunction
 bridges
Date: Fri, 23 Jul 2021 05:04:24 -0400
Message-Id: <20210723090424.2092226-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Laurent Vivier <lvivier@redhat.com>, peter.maydell@linaro.org,
 berrange@redhat.com, mst@redhat.com, jusual@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit [1] switched PCI hotplug from native to ACPI one by default.

That however breaks hotplug on following CLI that used to work:
   -nodefaults -machine q35 \
   -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
   -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2

where PCI device is hotplugged to pcie-root-port-1 with error on guest side:

  ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND (20201113/psargs-330)
  ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
  ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
  ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (20201113/evgpe-515)

cause is that QEMU's ACPI hotplug never supported functions other then 0
and due to bug it was generating notification entries for not described
functions.

Technically there is no reason not to describe cold-plugged bridges
(root ports) on functions other then 0, as they similarly to bridge
on function 0 are unpluggable.

So since we need to describe multifunction devices iterate over
fuctions as well. But describe only cold-plugged bridges[root ports]
on functions other than 0 as well.

1)
Fixes: 17858a169508609ca9063c544833e5a1adeb7b52 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reported-by: Laurent Vivier <lvivier@redhat.com>
---
v2:
  * squash 1/2 "acpi: x86: pcihp: cleanup devfn usage in  build_append_pci_bus_devices()"
    into the main patch
  * drop Sxx -> Sxxx change as devfn fits into 2 digits anyway
  * cleanup PCI_FUN/DEVFN and use func/devfn local variables instead
  * fix typos
---
 hw/i386/acpi-build.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 17836149fe..a33ac8b91e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -374,7 +374,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     Aml *dev, *notify_method = NULL, *method;
     QObject *bsel;
     PCIBus *sec;
-    int i;
+    int devfn;
 
     bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
     if (bsel) {
@@ -384,23 +384,31 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
     }
 
-    for (i = 0; i < ARRAY_SIZE(bus->devices); i += PCI_FUNC_MAX) {
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         DeviceClass *dc;
         PCIDeviceClass *pc;
-        PCIDevice *pdev = bus->devices[i];
-        int slot = PCI_SLOT(i);
+        PCIDevice *pdev = bus->devices[devfn];
+        int slot = PCI_SLOT(devfn);
+        int func = PCI_FUNC(devfn);
+        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
+        int adr = slot << 16 | func;
         bool hotplug_enabled_dev;
         bool bridge_in_acpi;
         bool cold_plugged_bridge;
 
         if (!pdev) {
-            if (bsel) { /* add hotplug slots for non present devices */
+            /*
+             * add hotplug slots for non present devices.
+             * hotplug is supported only for non-multifunction device
+             * so generate device description only for function 0
+             */
+            if (bsel && !func) {
                 if (pci_bus_is_express(bus) && slot > 0) {
                     break;
                 }
-                dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
+                dev = aml_device("S%.02X", devfn);
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-                aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
+                aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
                 method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
                 aml_append(method,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
@@ -436,9 +444,18 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             continue;
         }
 
-        /* start to compose PCI slot descriptor */
-        dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
-        aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
+        /*
+         * allow describing coldplugged bridges in ACPI even if they are not
+         * on function 0, as they are not unpluggable, for all other devices
+         * generate description only for function 0 per slot
+         */
+        if (func && !bridge_in_acpi) {
+            continue;
+        }
+
+        /* start to compose PCI device descriptor */
+        dev = aml_device("S%.02X", devfn);
+        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
 
         if (bsel) {
             /*
@@ -496,7 +513,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
             build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
         }
-        /* slot descriptor has been composed, add it into parent context */
+        /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
     }
 
@@ -525,13 +542,12 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         /* Notify about child bus events in any case */
         if (pcihp_bridge_en) {
             QLIST_FOREACH(sec, &bus->child, sibling) {
-                int32_t devfn = sec->parent_dev->devfn;
-
                 if (pci_bus_is_root(sec)) {
                     continue;
                 }
 
-                aml_append(method, aml_name("^S%.02X.PCNT", devfn));
+                aml_append(method, aml_name("^S%.02X.PCNT",
+                                            sec->parent_dev->devfn));
             }
         }
 
-- 
2.27.0


