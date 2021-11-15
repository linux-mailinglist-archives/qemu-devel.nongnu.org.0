Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A69450A0A
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:48:37 +0100 (CET)
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf9o-0004bz-LD
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:48:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezk-0001gj-SQ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezi-0005Cy-L2
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y6C9J2NVK01b40eeKRTUlDWMs2jNYZycxWavDBC4bcI=;
 b=EvTQ5ouW6sx5Az9uau85ej4dKOIfrK+ozMHlFrrrGUSjn0G4ubtI41zxS6iplVLDKO+BMS
 LWwm8HgkU5dqL8MgqQfV+HAaO260fACeKMa7/Et5bHXBLFUilPHlfAbhrDrLIFSE93YhB3
 w28sWaZd0casHfbJZnPahilMVTK4FkA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-zQCPl7a_MpGGyWsux6gFQQ-1; Mon, 15 Nov 2021 11:38:08 -0500
X-MC-Unique: zQCPl7a_MpGGyWsux6gFQQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c1-20020aa7c741000000b003e7bf1da4bcso3255079eds.21
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y6C9J2NVK01b40eeKRTUlDWMs2jNYZycxWavDBC4bcI=;
 b=X8pmREksOo6YYKfiMIFWBBoEb2gL5NOyF97sMD1KQHJ9U3XGIZO3fRmwLFYKueiaJi
 RjAQYmRbTWF2q7NQ8GWx3maACoa+FJgYImfXKKDKSgjSrPZvNnyzGA3EbQbVASZRZPda
 KcOslS3KlLWJowDRJH6Ows6CWkXQvap7QL5CRr5YcP32Ym9DY0qHKgtAYQ97giZr7AA4
 shpcfBjiqVokwIvAKrTPGWcho7d6pHyNUcmW2m9fOh3//XJk+HR5IwfKCMp2k48fvhnA
 KH9ntrz7A+evnQ7FkWkLS0Tlx2orNmALNxFuuhu1gitdlTMr6P1vdvMQ9k96FyUayOu3
 0hzg==
X-Gm-Message-State: AOAM530ogyAvX9t/7tcL6yJipG2wJtq4yst4QDMetVX4f4khFxtxgdfQ
 y2ZZh4oTkLFajwwJKt8no/XF5UzfnSX23XJHzwi9G0VdFRJBJU/bg6ft0Ad8h1TQvlNXaxL8sSm
 CaisPgMgDpgBzfBKisuHhbpEknzvVy889Cf4hbakmn4ngVaYVkPXLzrM4rTac
X-Received: by 2002:a05:6402:190c:: with SMTP id
 e12mr31779341edz.309.1636994287243; 
 Mon, 15 Nov 2021 08:38:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvoi0H5ZibPX/as6v4jJLGmJru0YsrPMeauF4+jTrl6X8AQsCU+H1gdBplEzv+43oBrcvy0g==
X-Received: by 2002:a05:6402:190c:: with SMTP id
 e12mr31779301edz.309.1636994287047; 
 Mon, 15 Nov 2021 08:38:07 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id v13sm6673186ejo.36.2021.11.15.08.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:06 -0800 (PST)
Date: Mon, 15 Nov 2021 11:38:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/20] hw/acpi/ich9: Add compat prop to keep HPC bit set for
 6.1 machine type
Message-ID: <20211115163607.177432-8-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

To solve issues [1-2] the Hot Plug Capable bit in PCIe Slots will be
turned on, while the switch to ACPI Hot-plug will be done in the
DSDT table.

Introducing 'x-keep-native-hpc' property disables the HPC bit only
in 6.1 and as a result keeps the forced 'reserve-io' on
pcie-root-ports in 6.1 too.

[1] https://gitlab.com/qemu-project/qemu/-/issues/641
[2] https://bugzilla.redhat.com/show_bug.cgi?id=2006409

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211112110857.3116853-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ich9.h |  1 +
 hw/acpi/ich9.c         | 18 ++++++++++++++++++
 hw/i386/pc.c           |  2 ++
 hw/i386/pc_q35.c       |  7 ++++++-
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index f04f1791bd..7ca92843c6 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -56,6 +56,7 @@ typedef struct ICH9LPCPMRegs {
     AcpiCpuHotplug gpe_cpu;
     CPUHotplugState cpuhp_state;
 
+    bool keep_pci_slot_hpc;
     bool use_acpi_hotplug_bridge;
     AcpiPciHpState acpi_pci_hotplug;
     MemHotplugState acpi_memory_hotplug;
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 1ee2ba2c50..ebe08ed831 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -419,6 +419,20 @@ static void ich9_pm_set_acpi_pci_hotplug(Object *obj, bool value, Error **errp)
     s->pm.use_acpi_hotplug_bridge = value;
 }
 
+static bool ich9_pm_get_keep_pci_slot_hpc(Object *obj, Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    return s->pm.keep_pci_slot_hpc;
+}
+
+static void ich9_pm_set_keep_pci_slot_hpc(Object *obj, bool value, Error **errp)
+{
+    ICH9LPCState *s = ICH9_LPC_DEVICE(obj);
+
+    s->pm.keep_pci_slot_hpc = value;
+}
+
 void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
 {
     static const uint32_t gpe0_len = ICH9_PMIO_GPE0_LEN;
@@ -428,6 +442,7 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     pm->disable_s4 = 0;
     pm->s4_val = 2;
     pm->use_acpi_hotplug_bridge = true;
+    pm->keep_pci_slot_hpc = true;
 
     object_property_add_uint32_ptr(obj, ACPI_PM_PROP_PM_IO_BASE,
                                    &pm->pm_io_base, OBJ_PROP_FLAG_READ);
@@ -454,6 +469,9 @@ void ich9_pm_add_properties(Object *obj, ICH9LPCPMRegs *pm)
     object_property_add_bool(obj, ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                              ich9_pm_get_acpi_pci_hotplug,
                              ich9_pm_set_acpi_pci_hotplug);
+    object_property_add_bool(obj, "x-keep-pci-slot-hpc",
+                             ich9_pm_get_keep_pci_slot_hpc,
+                             ich9_pm_set_keep_pci_slot_hpc);
 }
 
 void ich9_pm_device_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2592a82148..a2ef40ecbc 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_1[] = {
     { TYPE_X86_CPU, "hv-version-id-build", "0x1bbc" },
     { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
     { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
+    { "ICH9-LPC", "x-keep-pci-slot-hpc", "false" },
 };
 const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
 
@@ -107,6 +108,7 @@ GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
     { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
     { "ICH9-LPC", ACPI_PM_PROP_ACPI_PCIHP_BRIDGE, "off" },
+    { "ICH9-LPC", "x-keep-pci-slot-hpc", "true" },
 };
 const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index fc34b905ee..e1e100316d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -137,6 +137,7 @@ static void pc_q35_init(MachineState *machine)
     DriveInfo *hd[MAX_SATA_PORTS];
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     bool acpi_pcihp;
+    bool keep_pci_slot_hpc;
 
     /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
      * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
@@ -242,7 +243,11 @@ static void pc_q35_init(MachineState *machine)
                                           ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                                           NULL);
 
-    if (acpi_pcihp) {
+    keep_pci_slot_hpc = object_property_get_bool(OBJECT(lpc),
+                                                 "x-keep-pci-slot-hpc",
+                                                 NULL);
+
+    if (!keep_pci_slot_hpc && acpi_pcihp) {
         object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
                                    "false", true);
     }
-- 
MST


