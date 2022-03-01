Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 558764C8EB6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 16:15:51 +0100 (CET)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP4E6-0003QQ-5b
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 10:15:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP4Ay-0000YX-Q4
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:12:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nP4Av-0004Hc-8K
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 10:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646147548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wFCe6uFJI4gp/0JNTA6uwG6zOoe8/MAO9EmBnYHG7LY=;
 b=hLGmbpNaBR2b5m0CLTdp5/mGw77+YIGSv9sw2GIRQ7v0WO3smGHrHJ99cvU8rHDTOkzEzG
 v4uTWiV9WG1YuI5Tuyo1jRhixIsZQQpDZbWk9lHtJ406tr0ktbkQ9HL4AHSza/72vydLb/
 j7Uv7h9DZBxgOENr2eogRwhihanqDv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-1xPMUhKYMEmL-G167uUisQ-1; Tue, 01 Mar 2022 10:12:27 -0500
X-MC-Unique: 1xPMUhKYMEmL-G167uUisQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E02A180FD76
 for <qemu-devel@nongnu.org>; Tue,  1 Mar 2022 15:12:26 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B61427DE4B;
 Tue,  1 Mar 2022 15:12:25 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] q35: compat: keep hotplugged PCIe device broken after
 migration for 6.2 and older machine types
Date: Tue,  1 Mar 2022 10:12:00 -0500
Message-Id: <20220301151200.3507298-4-imammedo@redhat.com>
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

Q35 switched to ACPI PCI hotplug by default in since 6.1
machine type and migration worked as expected (with BARs
on target being the same as on source)

However native PCIe fixes [1] merged in 6.2 time, regressed
migration part, resulting in disabled BARs on target. The
issue affects pc-q35-6.2 and pc-q35-6.1 machine types (and
older if qemu-6.2 binary is used on source with manually
enabled ACPI PCI hotplug).

Introduce x-pcihp-disable-pcie-slot-power-on-fixup compat
property to keep 6.2 and older machine types in broken state
when ACPI PCI hotplug is enabled to make sure that guest does
see the same PCIe device and slot on src & dst.

1)
Fixes: d5daff7d312 (pcie: implement slot power control for pcie root ports)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/pcihp.h |  1 +
 hw/acpi/ich9.c          | 20 ++++++++++++++++++++
 hw/acpi/pcihp.c         | 11 +++++++----
 hw/core/machine.c       |  4 +++-
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index af1a169fc3..2436151678 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -52,6 +52,7 @@ typedef struct AcpiPciHpState {
     bool legacy_piix;
     uint16_t io_base;
     uint16_t io_len;
+    bool disable_pcie_slot_power_on_fixup;
 } AcpiPciHpState;
 
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index bd9bbade70..e3bffdef71 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -430,6 +430,23 @@ static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
     s->pm.keep_pci_slot_hpc = value;
 }
 
+static bool ich9_pm_get_disable_pcie_slot_power_on_fixup(Object *obj,
+                                                         Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    return s->pm.acpi_pci_hotplug.disable_pcie_slot_power_on_fixup;
+}
+
+static void ich9_pm_set_disable_pcie_slot_power_on_fixup(Object *obj,
+                                                         bool value,
+                                                         Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    s->pm.acpi_pci_hotplug.disable_pcie_slot_power_on_fixup = value;
+}
+
 void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
 {
     static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
@@ -469,6 +486,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     object_property_add_bool(obj, "x-keep-pci-slot-hpc",
                              ich9_pm_get_keep_pci_slot_hpc,
                              ich9_pm_set_keep_pci_slot_hpc);
+    object_property_add_bool(obj, "x-pcihp-disable-pcie-slot-power-on-fixup",
+                             ich9_pm_get_disable_pcie_slot_power_on_fixup,
+                             ich9_pm_set_disable_pcie_slot_power_on_fixup);
 }
 
 void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 6351bd3424..4c06caf4a9 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -369,10 +369,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
     }
 
     bus = pci_get_bus(pdev);
-    bridge = pci_bridge_get_device(bus);
-    if (object_dynamic_cast(OBJECT(bridge), TYPE_PCIE_ROOT_PORT) ||
-        object_dynamic_cast(OBJECT(bridge), TYPE_XIO3130_DOWNSTREAM)) {
-        pcie_cap_slot_enable_power(bridge);
+    /* compat knob to preserve pci_config as in 6.2 & older when pcihp in use */
+    if (s->disable_pcie_slot_power_on_fixup == false) {
+        bridge = pci_bridge_get_device(bus);
+        if (object_dynamic_cast(OBJECT(bridge), TYPE_PCIE_ROOT_PORT) ||
+            object_dynamic_cast(OBJECT(bridge), TYPE_XIO3130_DOWNSTREAM)) {
+            pcie_cap_slot_enable_power(bridge);
+        }
     }
 
     bsel = acpi_pcihp_get_bsel(bus);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index d856485cb4..1758b49c2f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,9 @@
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-pci.h"
 
-GlobalProperty hw_compat_6_2[] = {};
+GlobalProperty hw_compat_6_2[] = {
+    { "ICH9-LPC", "x-pcihp-disable-pcie-slot-power-on-fixup", "on" },
+};
 const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
 
 GlobalProperty hw_compat_6_1[] = {
-- 
2.31.1


