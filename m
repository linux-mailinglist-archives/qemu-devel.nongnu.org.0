Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B76A1EB7
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:41:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVa9x-0004Yg-PU; Fri, 24 Feb 2023 10:38:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9n-00044g-C9
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pVa9l-0007aY-Mw
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677253125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WLok6xEh1b09jOGpnE1T5rh9mLeis4wHRMjtGqG6TxU=;
 b=AjNkBmmm+H1n5yQKSzpM/GpJ1+eyYuvTK6L6ugk3u4FDVCP6O7lttc459CJqNhOhO7Xys8
 bgEVgA57kw3lUFWinLNe52XEPUHGbVqvyXn8x3rWozcJRKP+fOYfa1Aqkf+gVgftOkBLKp
 PegwBHoTYu884zyOOY6RDQJlEO0Y0ME=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-4bX1vJDBO8aYZL3_FHWLMg-1; Fri, 24 Feb 2023 10:38:41 -0500
X-MC-Unique: 4bX1vJDBO8aYZL3_FHWLMg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50EB23806102;
 Fri, 24 Feb 2023 15:38:41 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5DB6492B12;
 Fri, 24 Feb 2023 15:38:40 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca,
	berrange@redhat.com
Subject: [PATCH 31/33] acpi: pci: move out ACPI PCI hotplug generator from
 generic slot generator build_append_pci_bus_devices()
Date: Fri, 24 Feb 2023 16:38:10 +0100
Message-Id: <20230224153812.4176226-32-imammedo@redhat.com>
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

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/pcihp.h |  2 ++
 hw/acpi/pci-bridge.c    | 12 +++++++++++-
 hw/i386/acpi-build.c    |  9 ++++-----
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 7e268c2c9c..cd18ebdcdc 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -71,6 +71,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 /* Called on reset */
 void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off);
 
+void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus);
+
 extern const VMStateDescription vmstate_acpi_pcihp_pci_status;
 
 #define VMSTATE_PCI_HOTPLUG(pcihp, state, test_pcihp, test_acpi_index) \
diff --git a/hw/acpi/pci-bridge.c b/hw/acpi/pci-bridge.c
index 4fbf6da6ad..7baa7034a1 100644
--- a/hw/acpi/pci-bridge.c
+++ b/hw/acpi/pci-bridge.c
@@ -22,6 +22,16 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope)
     PCIBridge *br = PCI_BRIDGE(adev);
 
     if (!DEVICE(br)->hotplugged) {
-        build_append_pci_bus_devices(scope, pci_bridge_get_sec_bus(br));
+        PCIBus *sec_bus = pci_bridge_get_sec_bus(br);
+
+        build_append_pci_bus_devices(scope, sec_bus);
+
+        /*
+         * generate hotplug slots descriptors if
+         * bridge has ACPI PCI hotplug attached,
+         */
+        if (object_property_find(OBJECT(sec_bus), ACPI_PCIHP_PROP_BSEL)) {
+            build_append_pcihp_slots(scope, sec_bus);
+        }
     }
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d068b0507e..0c298b5f60 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -519,7 +519,7 @@ static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
     return false;
 }
 
-static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
+void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
 {
     int devfn;
     Aml *dev, *notify_method = NULL, *method;
@@ -598,10 +598,6 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
         /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
     }
-
-    if (object_property_find(OBJECT(bus), ACPI_PCIHP_PROP_BSEL)) {
-        build_append_pcihp_slots(parent_scope, bus);
-    }
 }
 
 static bool build_append_notfication_callback(Aml *parent_scope,
@@ -1790,6 +1786,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             Aml *scope = aml_scope("PCI0");
             /* Scan all PCI buses. Generate tables to support hotplug. */
             build_append_pci_bus_devices(scope, bus);
+            if (object_property_find(OBJECT(bus), ACPI_PCIHP_PROP_BSEL)) {
+                build_append_pcihp_slots(scope, bus);
+            }
             aml_append(sb_scope, scope);
         }
     }
-- 
2.39.1


