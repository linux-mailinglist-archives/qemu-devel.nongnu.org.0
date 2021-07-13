Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA523C7975
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 00:13:19 +0200 (CEST)
Received: from localhost ([::1]:39688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3QeU-00037Q-4k
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 18:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qbe-0006X4-4t
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3Qbc-0007bV-BU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 18:10:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626214219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hx1EPiPggxOFuAl77QnkazGCnyRccijDT3bkBz4qVPY=;
 b=UUx9JYjz9T3l0StwPbObbnBfIVueZPF8zvKl55xySTFvJBtsCUqQj/Ik02RlWgGKvlKXlw
 jOTD49xPaG8SKsVIbhlMAi3kjJGX41IK7636skkYunSlVLIuFiz+WFKMaRdMnVua+oqwWG
 vm0pOq7U7YuAeDEnvVtilCtB0umom4I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-8GD9ywi4P_GTrAbTKhdtcQ-1; Tue, 13 Jul 2021 18:10:18 -0400
X-MC-Unique: 8GD9ywi4P_GTrAbTKhdtcQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l17-20020a05600c4f11b0290225ef65c35dso969620wmq.2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 15:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hx1EPiPggxOFuAl77QnkazGCnyRccijDT3bkBz4qVPY=;
 b=sIGNBedj3MfCr8Ezd3SocoPtXVir0wpXHEdCZqFEiyQH0eFlJvoaWQxFzyB8+8Ayxq
 eDBphO5rwMWgCwdKbuibQUBOSQgVFY/xZZZ5RmVcyc5eefPMWPdmsLcCG5n0m13mdGY6
 dc+6OefFOrmdwhL3XVV0Wcn8ZIcwqePrWQIIvTCKB21hOrCBpO0HpFUsmdmhGqsN1voO
 eC/q/9+VeVpXeXWw97U5BqvSnGuvJPgjRgLs9puh4W5GAWEI3sd69PBWRHs3+2lxcte0
 yM4IO5l2AsCpLrxmZa+7uK1rD+kprLOdBKDyKRlZPFrqxfhvDVMYJ4P0/9ZvKaHe7QS6
 +omg==
X-Gm-Message-State: AOAM531rTPpaW+pdTENVIhkhKgWjKmhrz7Joe+nkehmix/POFaw/suBn
 45Ga6OnAWfpWtc7eAXQ3Cj58n1pqhcjzsdEE/KT30n0wJNh5A1huIjiv6ayv6OUzPcIhuk2bzrl
 scFYZnamidpLh1Hg7cJSTvHgWpB+XcsPCmrfzarMQ1KQDrQSiogONsvvGhyVN
X-Received: by 2002:a1c:7e44:: with SMTP id z65mr408789wmc.1.1626214216627;
 Tue, 13 Jul 2021 15:10:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzakRcGuN6ePndKT9arscPNmug3IpZ6s5RhkrkWH9R9/aiHiA2a8x4NWC4lsBXxpB3V4E5YXg==
X-Received: by 2002:a1c:7e44:: with SMTP id z65mr408748wmc.1.1626214216263;
 Tue, 13 Jul 2021 15:10:16 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id q81sm1412969wme.18.2021.07.13.15.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:10:15 -0700 (PDT)
Date: Tue, 13 Jul 2021 18:10:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/23] hw/pci/pcie: Do not set HPC flag if acpihp is used
Message-ID: <20210713220946.212562-4-mst@redhat.com>
References: <20210713220946.212562-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210713220946.212562-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

Instead of changing the hot-plug type in _OSC register, do not
set the 'Hot-Plug Capable' flag. This way guest will choose ACPI
hot-plug if it is preferred and leave the option to use SHPC with
pcie-pci-bridge.

The ability to control hot-plug for each downstream port is retained,
while 'hotplug=off' on the port means all hot-plug types are disabled.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210713004205.775386-4-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pcie_port.h |  5 ++++-
 hw/acpi/pcihp.c            |  8 ++++++++
 hw/core/machine.c          |  1 -
 hw/i386/pc_q35.c           | 11 +++++++++++
 hw/pci/pcie.c              |  8 +++++++-
 hw/pci/pcie_port.c         |  1 +
 6 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index bea8ecad0f..e25b289ce8 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -57,8 +57,11 @@ struct PCIESlot {
     /* Disable ACS (really for a pcie_root_port) */
     bool        disable_acs;
 
-    /* Indicates whether hot-plug is enabled on the slot */
+    /* Indicates whether any type of hot-plug is allowed on the slot */
     bool        hotplug;
+
+    bool        native_hotplug;
+
     QLIST_ENTRY(PCIESlot) next;
 };
 
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 9fdc6342b0..f4d706e47d 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -31,6 +31,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
+#include "hw/pci/pcie_port.h"
 #include "hw/i386/acpi-build.h"
 #include "hw/acpi/acpi.h"
 #include "hw/pci/pci_bus.h"
@@ -336,6 +337,13 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
             object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
             PCIBus *sec = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
 
+            /* Remove all hot-plug handlers if hot-plug is disabled on slot */
+            if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT) &&
+                !PCIE_SLOT(pdev)->hotplug) {
+                qbus_set_hotplug_handler(BUS(sec), NULL);
+                return;
+            }
+
             qbus_set_hotplug_handler(BUS(sec), OBJECT(hotplug_dev));
             /* We don't have to overwrite any other hotplug handler yet */
             assert(QLIST_EMPTY(&sec->child));
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 57c18f909a..11c26eeabd 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -584,7 +584,6 @@ static void machine_set_memdev(Object *obj, const char *value, Error **errp)
     ms->ram_memdev_id = g_strdup(value);
 }
 
-
 static void machine_init_notify(Notifier *notifier, void *data)
 {
     MachineState *machine = MACHINE(qdev_get_machine());
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 46a0f196f4..04b4a4788d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -37,6 +37,7 @@
 #include "sysemu/kvm.h"
 #include "hw/kvm/clock.h"
 #include "hw/pci-host/q35.h"
+#include "hw/pci/pcie_port.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
@@ -136,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
     ram_addr_t lowmem;
     DriveInfo *hd[MAX_SATA_PORTS];
     MachineClass *mc = MACHINE_GET_CLASS(machine);
+    bool acpi_pcihp;
 
     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
@@ -236,6 +238,15 @@ static void pc_q35_init(MachineState *machine)
     object_property_set_link(OBJECT(machine), PC_MACHINE_ACPI_DEVICE_PROP,
                              OBJECT(lpc), &error_abort);
 
+    acpi_pcihp = object_property_get_bool(OBJECT(lpc),
+                                          "acpi-pci-hotplug-with-bridge-support",
+                                          NULL);
+
+    if (acpi_pcihp) {
+        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
+                                   "false", true);
+    }
+
     /* irq lines */
     gsi_state = pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
 
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index fd0fa157e8..6e95d82903 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -529,7 +529,13 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
                                PCI_EXP_SLTCAP_PIP |
                                PCI_EXP_SLTCAP_AIP |
                                PCI_EXP_SLTCAP_ABP);
-    if (s->hotplug) {
+
+    /*
+     * Enable native hot-plug on all hot-plugged bridges unless
+     * hot-plug is disabled on the slot.
+     */
+    if (s->hotplug &&
+        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
         pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCAP,
                                    PCI_EXP_SLTCAP_HPS |
                                    PCI_EXP_SLTCAP_HPC);
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index eb563ad435..da850e8dde 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -148,6 +148,7 @@ static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
     DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
     DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
+    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
MST


