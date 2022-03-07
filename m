Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0705B4D0BC8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:11:34 +0100 (CET)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMVo-0001Jw-Gv
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:11:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7X-0008GL-7S
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7V-0005j0-A3
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SQth6lOfktpVOUsr0klqFIRbAjmvm/XtYoxQErUCb0c=;
 b=O+eBLcfxgkva54zdrxmIi7mTn2jGWxHOuaq/BvgvWYZByqsfBSK56LiASBKMAdRwKiSmPt
 c8J+JZ8fjK6p5+1zIdHRfDXoJXs/CrHZaaBgjMtkhAfm9YdlO/n4nrsLIVBxON66F3ZJqx
 tm0HsnIWDBbalnDhjL7TQdEpRz8oDW0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-hJr1Ab05NXiDHAAhKMH39Q-1; Mon, 07 Mar 2022 17:46:23 -0500
X-MC-Unique: hJr1Ab05NXiDHAAhKMH39Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 f189-20020a1c38c6000000b0037d1bee4847so246117wma.9
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SQth6lOfktpVOUsr0klqFIRbAjmvm/XtYoxQErUCb0c=;
 b=JGDerfuJMY4ZJjR7WCaphoH8RWYx27WkWmMdKRYbhpGlJZUHNKHBPLURUI35T6cJqV
 EjLtFfj1wDxAVXaR9aaMn4Hh4x3QKLtw+NNHH2pilbsQFurCpPFA+F9qM8WzWJn2GHZK
 /VtP4xFGnkOW1ENyxCRv1WlmHsdYbig2KYaGe4+NWv7v+80Hyrj3aO7jr/IDYE3hxSGQ
 CWd1Gcs31mNkQper/4Kx7uhXhzDeO9BrRRRu4VsokEYXnSPCG9iAhAzaIY2pZBcsAi1S
 sqK8kuaXanA8DjfBRYbcworOcCHteXMd97pE8RDhvFIgKmL8JQFSC2ipoicOCNDQZ6kO
 AzgA==
X-Gm-Message-State: AOAM5307D3+m8npx1RwwIB/Vqo/OCmPJi2AO+rn0v4j5G2JG8DbZpPjY
 7iQb9jW7aHJGP9LSbhl8Swu9rpJ5nWxb7jxmodYdphFOG9BzRzOzIpIF/IRKVP2LdQK9bo2x+Hw
 D/qTZuSW/91TZT4oFk8qglHFjyt7yMuxoqV2tnA2E+PgYW7e4jyC61tjMwhXk
X-Received: by 2002:a5d:6241:0:b0:1ed:b534:e04e with SMTP id
 m1-20020a5d6241000000b001edb534e04emr10438428wrv.68.1646693181989; 
 Mon, 07 Mar 2022 14:46:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+3F2rCzsD8QnEn/ztkjjDBkUmYgE1UZMmznm86AffNlohAjeU4XpxDhkrpq5o7lS9GDszZA==
X-Received: by 2002:a5d:6241:0:b0:1ed:b534:e04e with SMTP id
 m1-20020a5d6241000000b001edb534e04emr10438407wrv.68.1646693181722; 
 Mon, 07 Mar 2022 14:46:21 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b00382871cf734sm515411wma.25.2022.03.07.14.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:21 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 34/47] acpi: pcihp: pcie: set power on cap on parent slot
Message-ID: <20220307224357.682101-35-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

on creation a PCIDevice has power turned on at the end of pci_qdev_realize()
however later on if PCIe slot isn't populated with any children
it's power is turned off. It's fine if native hotplug is used
as plug callback will power slot on among other things.
However when ACPI hotplug is enabled it replaces native PCIe plug
callbacks with ACPI specific ones (acpi_pcihp_device_*plug_cb) and
as result slot stays powered off. It works fine as ACPI hotplug
on guest side takes care of enumerating/initializing hotplugged
device. But when later guest is migrated, call chain introduced by]
commit d5daff7d312 (pcie: implement slot power control for pcie root ports)

   pcie_cap_slot_post_load()
       -> pcie_cap_update_power()
           -> pcie_set_power_device()
               -> pci_set_power()
                   -> pci_update_mappings()

will disable earlier initialized BARs for the hotplugged device
in powered off slot due to commit 23786d13441 (pci: implement power state)
which disables BARs if power is off.

Fix it by setting PCI_EXP_SLTCTL_PCC to PCI_EXP_SLTCTL_PWR_ON
on slot (root port/downstream port) at the time a device
hotplugged into it. As result PCI_EXP_SLTCTL_PWR_ON is migrated
to target and above call chain keeps device plugged into it
powered on.

Fixes: d5daff7d312 ("pcie: implement slot power control for pcie root ports")
Fixes: 23786d13441 ("pci: implement power state")
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2053584
Suggested-by: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220301151200.3507298-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie.h |  1 +
 hw/acpi/pcihp.c       | 12 +++++++++++-
 hw/pci/pcie.c         | 11 +++++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 168950a83b..798a262a0a 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -118,6 +118,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
                                 uint32_t addr, uint32_t val, int len);
 int pcie_cap_slot_post_load(void *opaque, int version_id);
 void pcie_cap_slot_push_attention_button(PCIDevice *dev);
+void pcie_cap_slot_enable_power(PCIDevice *dev);
 
 void pcie_cap_root_init(PCIDevice *dev);
 void pcie_cap_root_reset(PCIDevice *dev);
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 6befd23e16..6351bd3424 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -32,6 +32,7 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci/pcie_port.h"
+#include "hw/pci-bridge/xio3130_downstream.h"
 #include "hw/i386/acpi-build.h"
 #include "hw/acpi/acpi.h"
 #include "hw/pci/pci_bus.h"
@@ -336,6 +337,8 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
 {
     PCIDevice *pdev = PCI_DEVICE(dev);
     int slot = PCI_SLOT(pdev->devfn);
+    PCIDevice *bridge;
+    PCIBus *bus;
     int bsel;
 
     /* Don't send event when device is enabled during qemu machine creation:
@@ -365,7 +368,14 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
         return;
     }
 
-    bsel = acpi_pcihp_get_bsel(pci_get_bus(pdev));
+    bus = pci_get_bus(pdev);
+    bridge = pci_bridge_get_device(bus);
+    if (object_dynamic_cast(OBJECT(bridge), TYPE_PCIE_ROOT_PORT) ||
+        object_dynamic_cast(OBJECT(bridge), TYPE_XIO3130_DOWNSTREAM)) {
+        pcie_cap_slot_enable_power(bridge);
+    }
+
+    bsel = acpi_pcihp_get_bsel(bus);
     g_assert(bsel >= 0);
     s->acpi_pcihp_pci_status[bsel].up |= (1U << slot);
     acpi_send_event(DEVICE(hotplug_dev), ACPI_PCI_HOTPLUG_STATUS);
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 3c44204cf3..67a5d67372 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -366,6 +366,17 @@ static void hotplug_event_clear(PCIDevice *dev)
     }
 }
 
+void pcie_cap_slot_enable_power(PCIDevice *dev)
+{
+    uint8_t *exp_cap = dev->config + dev->exp.exp_cap;
+    uint32_t sltcap = pci_get_long(exp_cap + PCI_EXP_SLTCAP);
+
+    if (sltcap & PCI_EXP_SLTCAP_PCP) {
+        pci_set_word_by_mask(exp_cap + PCI_EXP_SLTCTL,
+                             PCI_EXP_SLTCTL_PCC, PCI_EXP_SLTCTL_PWR_ON);
+    }
+}
+
 static void pcie_set_power_device(PCIBus *bus, PCIDevice *dev, void *opaque)
 {
     bool *power = opaque;
-- 
MST


