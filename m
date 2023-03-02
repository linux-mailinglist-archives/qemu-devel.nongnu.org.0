Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A476A861B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:18:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXldL-000690-Eo; Thu, 02 Mar 2023 11:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXld5-0005tj-Ui
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:18:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXld3-0000oP-AN
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:18:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Om5Ynh5qeNP7xdOPXX2mCWFmkPn/fcBblTX2FojWlw=;
 b=XCwxAOaF0SeuUbjny3wNeaIAgsfv0OeolkWfSSeBOnlTCWeXJl5IdMLjluMTDfbbcTHwbN
 KaBAfkUkXKIqKidjoJue8tzcfmZj9lnkAniaF/W4NGjFumAmhm8gXR4pPopajQ0CVQkIbL
 3behPr4VDTiVlnY8PH9DWg2PMa6j5gM=
Received: from mimecast-mx02.redhat.com (66.187.233.88 [66.187.233.88]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-W94rgxDjOAOtrZi5Hl6cXg-1; Thu, 02 Mar 2023 11:16:12 -0500
X-MC-Unique: W94rgxDjOAOtrZi5Hl6cXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A112858F0E
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:16:10 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D60D3140EBF6;
 Thu,  2 Mar 2023 16:16:09 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 32/34] acpi: pci: move out ACPI PCI hotplug generator from
 generic slot generator build_append_pci_bus_devices()
Date: Thu,  2 Mar 2023 17:15:41 +0100
Message-Id: <20230302161543.286002-33-imammedo@redhat.com>
In-Reply-To: <20230302161543.286002-1-imammedo@redhat.com>
References: <20230302161543.286002-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
index 0459acfbb4..ec857a117e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -520,7 +520,7 @@ static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
     return false;
 }
 
-static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
+void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus)
 {
     int devfn;
     Aml *dev, *notify_method = NULL, *method;
@@ -599,10 +599,6 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
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


