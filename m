Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB5051F55B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 09:40:06 +0200 (CEST)
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnxzx-0005F7-GM
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 03:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnxq4-0007gH-6p
 for qemu-devel@nongnu.org; Mon, 09 May 2022 03:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnxq2-0000KH-8A
 for qemu-devel@nongnu.org; Mon, 09 May 2022 03:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652081389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9oDjHPUXCpdA1anELUoOmO5TEYF7W+V2ofd1NejScng=;
 b=AAqYzVHVPk4yvc4kqcqbJcGYKUmDllhvrCK/dzwt+FTQVXiOV8H5Z3T4pOrS6LhOpQLfht
 bQHTfkWSgAiIJ45tyE3Vayygr5PbU6D2BUwVI7Ap61Khih0kIJCWjvIUnSltM8mbT0ddHn
 kJT5rFdda5Y+Cw99NFITI6Cp1o85tuI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-61lBCgz2ON6HwJSDdv3Ejw-1; Mon, 09 May 2022 03:29:47 -0400
X-MC-Unique: 61lBCgz2ON6HwJSDdv3Ejw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55D7A811E81;
 Mon,  9 May 2022 07:29:47 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 302269E71;
 Mon,  9 May 2022 07:29:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Gautam Agrawal <gautamnagrawal@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 10/11] Warn user if the vga flag is passed but no vga device
 is created
Date: Mon,  9 May 2022 09:29:32 +0200
Message-Id: <20220509072933.48586-3-thuth@redhat.com>
In-Reply-To: <20220509072933.48586-1-thuth@redhat.com>
References: <20220509072933.48586-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gautam Agrawal <gautamnagrawal@gmail.com>

A global boolean variable "vga_interface_created"(declared in softmmu/globals.c)
has been used to track the creation of vga interface. If the vga flag is passed
in the command line "default_vga"(declared in softmmu/vl.c) variable is set to 0.
To warn user, the condition checks if vga_interface_created is false
and default_vga is equal to 0. If "-vga none" is passed, this patch will not warn the
user regarding the creation of VGA device.

The warning "A -vga option was passed but this
machine type does not use that option; no VGA device has been created"
is logged if vga flag is passed but no vga device is created.

This patch has been tested for x86_64, i386, sparc, sparc64 and arm boards.

Signed-off-by: Gautam Agrawal <gautamnagrawal@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
Message-Id: <20220501122505.29202-1-gautamnagrawal@gmail.com>
[thuth: Fix wrong warning with "-device" in some cases as reported by Paolo]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/sysemu/sysemu.h   | 1 +
 hw/hppa/machine.c         | 1 +
 hw/isa/isa-bus.c          | 1 +
 hw/mips/fuloong2e.c       | 1 +
 hw/pci/pci.c              | 1 +
 hw/ppc/spapr.c            | 1 +
 hw/sparc/sun4m.c          | 2 ++
 hw/sparc64/sun4u.c        | 1 +
 hw/xenpv/xen_machine_pv.c | 1 +
 softmmu/globals.c         | 1 +
 softmmu/vl.c              | 7 +++++++
 11 files changed, 18 insertions(+)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 10e283c170..360a408edf 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -34,6 +34,7 @@ typedef enum {
 } VGAInterfaceType;
 
 extern int vga_interface_type;
+extern bool vga_interface_created;
 
 extern int graphic_width;
 extern int graphic_height;
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index ae0bc07e75..4d054ca869 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -265,6 +265,7 @@ static void machine_hppa_init(MachineState *machine)
 
     /* Graphics setup. */
     if (machine->enable_graphics && vga_interface_type != VGA_NONE) {
+        vga_interface_created = true;
         dev = qdev_new("artist");
         s = SYS_BUS_DEVICE(dev);
         sysbus_realize_and_unref(s, &error_fatal);
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 0ad1c5fd65..cd5ad3687d 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -166,6 +166,7 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp)
 
 ISADevice *isa_vga_init(ISABus *bus)
 {
+    vga_interface_created = true;
     switch (vga_interface_type) {
     case VGA_CIRRUS:
         return isa_create_simple(bus, "isa-cirrus-vga");
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 7b13098f9b..5ee546f5f6 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -320,6 +320,7 @@ static void mips_fuloong2e_init(MachineState *machine)
 
     /* GPU */
     if (vga_interface_type != VGA_NONE) {
+        vga_interface_created = true;
         pci_dev = pci_new(-1, "ati-vga");
         dev = DEVICE(pci_dev);
         qdev_prop_set_uint32(dev, "vgamem_mb", 16);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e99417e501..9c58f02853 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2037,6 +2037,7 @@ PCIDevice *pci_nic_init_nofail(NICInfo *nd, PCIBus *rootbus,
 
 PCIDevice *pci_vga_init(PCIBus *bus)
 {
+    vga_interface_created = true;
     switch (vga_interface_type) {
     case VGA_CIRRUS:
         return pci_create_simple(bus, -1, "cirrus-vga");
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fe9937e811..8bbae68e1b 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1742,6 +1742,7 @@ static void spapr_rtc_create(SpaprMachineState *spapr)
 /* Returns whether we want to use VGA or not */
 static bool spapr_vga_init(PCIBus *pci_bus, Error **errp)
 {
+    vga_interface_created = true;
     switch (vga_interface_type) {
     case VGA_NONE:
         return false;
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index fccaed1eb4..b693eea0e0 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -920,6 +920,7 @@ static void sun4m_hw_init(MachineState *machine)
             /* sbus irq 5 */
             cg3_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
                      graphic_width, graphic_height, graphic_depth);
+            vga_interface_created = true;
         } else {
             /* If no display specified, default to TCX */
             if (graphic_depth != 8 && graphic_depth != 24) {
@@ -935,6 +936,7 @@ static void sun4m_hw_init(MachineState *machine)
 
             tcx_init(hwdef->tcx_base, slavio_irq[11], 0x00100000,
                      graphic_width, graphic_height, graphic_depth);
+            vga_interface_created = true;
         }
     }
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 6fd08e2298..7c461d194a 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -632,6 +632,7 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     switch (vga_interface_type) {
     case VGA_STD:
         pci_create_simple(pci_busA, PCI_DEVFN(2, 0), "VGA");
+        vga_interface_created = true;
         break;
     case VGA_NONE:
         break;
diff --git a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
index 8df575a457..20c9611d71 100644
--- a/hw/xenpv/xen_machine_pv.c
+++ b/hw/xenpv/xen_machine_pv.c
@@ -63,6 +63,7 @@ static void xen_init_pv(MachineState *machine)
     if (vga_interface_type == VGA_XENFB) {
         xen_config_dev_vfb(0, "vnc");
         xen_config_dev_vkbd(0);
+        vga_interface_created = true;
     }
 
     /* configure disks */
diff --git a/softmmu/globals.c b/softmmu/globals.c
index 3ebd718e35..98b64e0492 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -40,6 +40,7 @@ int nb_nics;
 NICInfo nd_table[MAX_NICS];
 int autostart = 1;
 int vga_interface_type = VGA_NONE;
+bool vga_interface_created;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack;
 int singlestep;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index ad886fb878..488cc4d09e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1353,6 +1353,7 @@ static void qemu_disable_default_devices(void)
 
     if (!vga_model && !default_vga) {
         vga_interface_type = VGA_DEVICE;
+        vga_interface_created = true;
     }
     if (!has_defaults || machine_class->no_serial) {
         default_serial = 0;
@@ -2736,6 +2737,12 @@ static void qemu_machine_creation_done(void)
     if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
         exit(1);
     }
+    if (!vga_interface_created && !default_vga &&
+        vga_interface_type != VGA_NONE) {
+        warn_report("A -vga option was passed but this machine "
+                    "type does not use that option; "
+                    "No VGA device has been created");
+    }
 }
 
 void qmp_x_exit_preconfig(Error **errp)
-- 
2.27.0


