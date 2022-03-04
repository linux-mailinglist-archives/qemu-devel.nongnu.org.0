Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 745C74CD675
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:31:41 +0100 (CET)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8y4-0006wJ-6l
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:31:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8CL-0005BN-HN
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8CJ-0001GI-N3
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SQth6lOfktpVOUsr0klqFIRbAjmvm/XtYoxQErUCb0c=;
 b=PJKO3x14InZd3bOR+cfLbyHknHUhzkUWq97iP2Tzlytr/NJVSWF96ed2FazepRvhRkbWZm
 VPOS+VtL4FfvoS1+HioiqXcNWsGHxYWY3AUfcL4Rcf3Telcb7bG1xCgvxEmtpZYorOtAmM
 U8+/jIwnSV9f9dHNj/aqBDF+HXDe/00=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-503-ZnGgRR0hOlGjCKbMRHSaOQ-1; Fri, 04 Mar 2022 08:42:18 -0500
X-MC-Unique: ZnGgRR0hOlGjCKbMRHSaOQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ba15-20020a0560001c0f00b001f01822f821so3402468wrb.7
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SQth6lOfktpVOUsr0klqFIRbAjmvm/XtYoxQErUCb0c=;
 b=qM99z2aWABXQ/NKeF8/NX9aSnWmvmOLg8pkX7HBnWhRCC31smuQvL4AbF9GwADaZin
 o4Mn3zFtWj+nuPwKnj/U66XEtFIBLXzBU6pLTUfyFvaaRQVAZ8odvqUG7e5v4Ey76+3n
 jWEKpitV/MJ+unHL5AxcMno/FbKg2zHLHLTWR4hZ8ReMycBAsEO9Hu6QE7lRY0uw7+iy
 bfp0PNXSoGmX+9w/xaurxn+zJeoeAXBRffAehfP4xNcrmzxJ1ORvJYURmRDwcv1BhsfL
 xVPePxCG15k97DNDt9N1JteLbRnom/jKgrpX/++0Q8lFdpGexJeisZ4yJtCOzj61xwVU
 z+Mw==
X-Gm-Message-State: AOAM530JlUqqUa8nbvYAwDxQPz5iAEzf08eiMMacuDOBRClzsyu0EtFV
 zbhF4nP7OC4nW5YE0wkqTI6SMVWHN4nE7oh0Ix2fhQr88v/x8m8abwMon/1GYj81B47O+nEsWNL
 n9zXw3PZQ+FmrErc4LreD0NBFkZFyMYSpb0/k3+//rs3mA5ce09hGNzIktKLw
X-Received: by 2002:a05:600c:35cc:b0:382:441f:897e with SMTP id
 r12-20020a05600c35cc00b00382441f897emr7951461wmq.127.1646401336459; 
 Fri, 04 Mar 2022 05:42:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyy+f8IWbEMBUzuy4igQQ40LAWgd5x8fjlSNp7ZHBS+d6tJG1NAU602RZ1VQQInQUckAf+FOA==
X-Received: by 2002:a05:600c:35cc:b0:382:441f:897e with SMTP id
 r12-20020a05600c35cc00b00382441f897emr7951432wmq.127.1646401336162; 
 Fri, 04 Mar 2022 05:42:16 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b001f0256761b9sm6468726wrt.45.2022.03.04.05.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:42:14 -0800 (PST)
Date: Fri, 4 Mar 2022 08:42:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/45] acpi: pcihp: pcie: set power on cap on parent slot
Message-ID: <20220304133556.233983-39-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


