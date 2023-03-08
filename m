Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A756AFBE3
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiNV-0003UX-61; Tue, 07 Mar 2023 20:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNS-0003KI-OA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiNQ-0001zJ-Ct
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678238035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wjqSjKZVM4uvusMfe+UV5rGNkLAJNX4ER32Wm66+3LY=;
 b=f87uRRywSmoNS/Nh5Dc45nbcxfgsaa4ZceNeOnvXQtFdrGZhm8y861z1xBtLzyfPJCREg1
 qGG/JNA/UIQiqsv6+Fyn0Q22Q/Kye6lFLTBQ/ceX4qkO0SthMRzUBb67Q4uCnLGHo1PXKA
 QV8FAhvBK7BD3xwV0+Q37fMjxtv/NgQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-bMtb90nfMgOw6Lm5Ou_19w-1; Tue, 07 Mar 2023 20:13:54 -0500
X-MC-Unique: bMtb90nfMgOw6Lm5Ou_19w-1
Received: by mail-ed1-f72.google.com with SMTP id
 z14-20020a05640235ce00b004e07ddbc2f8so12719700edc.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678238033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wjqSjKZVM4uvusMfe+UV5rGNkLAJNX4ER32Wm66+3LY=;
 b=U5+M+27GTeEhofoG+hb+oj79iflz+AE9F4IjYJfXHxNXTxx9J424wAaZIeAZxbv853
 DV0ngp6YZCD6DYMVPuraRKCMO8nlSxE0fH4495a8FRvIXDdp9D6GvO5hlz0A/Clm6yrY
 en3N2yLK7OLRLEtrCZSgJZrco+4upCEii3D4b6odNdNYyD/PImQgInWoQ/JkxBzcQBos
 2Gugc781lQu3UdlhcdqxG/qhb94k1D4d/b5yrGQDRhB3KxSehkQNCYxdozLyk1UOJz1Z
 qZNrYlaIilAKvxagRfk1dPJNcEp8PgFHMykfFBqHWFO+uxG4N5uIVRXWp0VnLndCzc/R
 +pnA==
X-Gm-Message-State: AO0yUKXkVpP41DB0XS/Yzj24jyg0buvhemUKPp4lS1fp7TaSu53N/KyK
 MULOshuiMVBnG0qfbWeld7i2fNnA2yCjTVTalyFF6aYgZLxARQZTBc/IYMfa+0vSC1pLvF/MrqF
 5Lfp/CR0vi+zLr4OTuJANAY08KIwjPpfQx62zUkt615yM6jX2TtqPjWmCoMmnurBve1T5
X-Received: by 2002:a17:907:9484:b0:886:7eae:26c4 with SMTP id
 dm4-20020a170907948400b008867eae26c4mr21064781ejc.5.1678238032833; 
 Tue, 07 Mar 2023 17:13:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8HwdiBtg00lp1J7bTH99VvSLWrIFTINR/25MSA0ASWzSxNFSItKJmAjJ8/QGm27Xv1bmg3mA==
X-Received: by 2002:a17:907:9484:b0:886:7eae:26c4 with SMTP id
 dm4-20020a170907948400b008867eae26c4mr21064761ejc.5.1678238032547; 
 Tue, 07 Mar 2023 17:13:52 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 q8-20020a170906940800b008eb89a435c9sm6715144ejx.164.2023.03.07.17.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:52 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PULL 60/73] pcihp: add ACPI PCI hotplug specific
 is_hotpluggable_bus() callback
Message-ID: <f18e29fc90cf271bae0c671151d0f55bd7649d52.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Provide pcihp specific callback to check if bus is hotpluggable
and consolidate its scattered hotplug criteria there.
While at it clean up no longer needed
   qbus_set_hotplug_handler(BUS(bus), NULL)
workarounds since callback makes qbus_is_hotpluggable() return
correct answer even if hotplug_handler is set on bus.

PS:
see ("pci: fix 'hotplugglable' property behavior") for details
why callback was introduced.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-35-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ich9.h          |  1 +
 include/hw/acpi/pcihp.h         |  1 +
 hw/acpi/acpi-pci-hotplug-stub.c |  4 ++++
 hw/acpi/ich9.c                  |  6 +++++
 hw/acpi/pcihp.c                 | 42 ++++++++++++++-------------------
 hw/acpi/piix4.c                 |  8 +++++++
 hw/isa/lpc_ich9.c               |  1 +
 7 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 57a542c4b8..2faf7f0cae 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -87,6 +87,7 @@ void ich9_pm_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                       DeviceState *dev, Error **errp);
 void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp);
+bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev, BusState *bus);
 
 void ich9_pm_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list);
 #endif /* HW_ACPI_ICH9_H */
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 04c98511a4..ef59810c17 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -58,6 +58,7 @@ typedef struct AcpiPciHpState {
 void acpi_pcihp_init(Object *owner, AcpiPciHpState *, PCIBus *root,
                      MemoryRegion *address_space_io, uint16_t io_base);
 
+bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus);
 void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp);
 void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
diff --git a/hw/acpi/acpi-pci-hotplug-stub.c b/hw/acpi/acpi-pci-hotplug-stub.c
index d1794399f7..dcee3ad7a1 100644
--- a/hw/acpi/acpi-pci-hotplug-stub.c
+++ b/hw/acpi/acpi-pci-hotplug-stub.c
@@ -40,3 +40,7 @@ void acpi_pcihp_reset(AcpiPciHpState *s)
     return;
 }
 
+bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
+{
+    return true;
+}
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index f778ade7ea..25e2c7243e 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -578,6 +578,12 @@ void ich9_pm_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
     }
 }
 
+bool ich9_pm_is_hotpluggable_bus(HotplugHandler *hotplug_dev, BusState *bus)
+{
+    ICH9LPCState *lpc = ICH9_LPC_DEVICE(hotplug_dev);
+    return acpi_pcihp_is_hotpluggbale_bus(&lpc->pm.acpi_pci_hotplug, bus);
+}
+
 void ich9_pm_ospm_status(AcpiDeviceIf *adev, ACPIOSTInfoList ***list)
 {
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 34cad061a8..dcfb779a7a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -121,20 +121,6 @@ static void acpi_set_pci_info(bool has_bridge_hotplug)
     }
 }
 
-static void acpi_pcihp_disable_root_bus(void)
-{
-    Object *host = acpi_get_i386_pci_host();
-    PCIBus *bus;
-
-    bus = PCI_HOST_BRIDGE(host)->bus;
-    if (bus && qbus_is_hotpluggable(BUS(bus))) {
-        /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
-        qbus_set_hotplug_handler(BUS(bus), NULL);
-    }
-
-    return;
-}
-
 static void acpi_pcihp_test_hotplug_bus(PCIBus *bus, void *opaque)
 {
     AcpiPciHpFind *find = opaque;
@@ -278,9 +264,6 @@ static void acpi_pcihp_update(AcpiPciHpState *s)
 
 void acpi_pcihp_reset(AcpiPciHpState *s)
 {
-    if (!s->use_acpi_root_pci_hotplug) {
-        acpi_pcihp_disable_root_bus();
-    }
     acpi_set_pci_info(s->use_acpi_hotplug_bridge);
     acpi_pcihp_update(s);
 }
@@ -320,13 +303,6 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
             object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
             PCIBus *sec = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
 
-            /* Remove all hot-plug handlers if hot-plug is disabled on slot */
-            if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT) &&
-                !PCIE_SLOT(pdev)->hotplug) {
-                qbus_set_hotplug_handler(BUS(sec), NULL);
-                return;
-            }
-
             qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));
             /* We don't have to overwrite any other hotplug handler yet */
             assert(QLIST_EMPTY(&sec->child));
@@ -385,6 +361,24 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
 }
 
+bool acpi_pcihp_is_hotpluggbale_bus(AcpiPciHpState *s, BusState *bus)
+{
+    Object *o = OBJECT(bus->parent);
+
+    if (s->use_acpi_hotplug_bridge &&
+        object_dynamic_cast(o, TYPE_PCI_BRIDGE)) {
+        if (object_dynamic_cast(o, TYPE_PCIE_SLOT) && !PCIE_SLOT(o)->hotplug) {
+            return false;
+        }
+        return true;
+    }
+
+    if (s->use_acpi_root_pci_hotplug) {
+        return true;
+    }
+    return false;
+}
+
 static uint64_t pci_read(void *opaque, hwaddr addr, unsigned int size)
 {
     AcpiPciHpState *s = opaque;
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 0a233fa95d..63d2113b86 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -404,6 +404,13 @@ static void piix4_device_unplug_cb(HotplugHandler *hotplug_dev,
     }
 }
 
+static bool piix4_is_hotpluggable_bus(HotplugHandler *hotplug_dev,
+                                      BusState *bus)
+{
+    PIIX4PMState *s = PIIX4_PM(hotplug_dev);
+    return acpi_pcihp_is_hotpluggbale_bus(&s->acpi_pci_hotplug, bus);
+}
+
 static void piix4_pm_machine_ready(Notifier *n, void *opaque)
 {
     PIIX4PMState *s = container_of(n, PIIX4PMState, machine_ready);
@@ -644,6 +651,7 @@ static void piix4_pm_class_init(ObjectClass *klass, void *data)
     hc->plug = piix4_device_plug_cb;
     hc->unplug_request = piix4_device_unplug_request_cb;
     hc->unplug = piix4_device_unplug_cb;
+    hc->is_hotpluggable_bus = piix4_is_hotpluggable_bus;
     adevc->ospm_status = piix4_ospm_status;
     adevc->send_event = piix4_send_gpe;
     adevc->madt_cpu = pc_madt_cpu_entry;
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index d8303d0322..9714b0001e 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -865,6 +865,7 @@ static void ich9_lpc_class_init(ObjectClass *klass, void *data)
     hc->plug = ich9_pm_device_plug_cb;
     hc->unplug_request = ich9_pm_device_unplug_request_cb;
     hc->unplug = ich9_pm_device_unplug_cb;
+    hc->is_hotpluggable_bus = ich9_pm_is_hotpluggable_bus;
     adevc->ospm_status = ich9_pm_ospm_status;
     adevc->send_event = ich9_send_gpe;
     adevc->madt_cpu = pc_madt_cpu_entry;
-- 
MST


