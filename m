Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498D51645F
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 14:27:37 +0200 (CEST)
Received: from localhost ([::1]:35258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl8fn-0007CA-PQ
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 08:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1nl8dj-0006NN-Ln
 for qemu-devel@nongnu.org; Sun, 01 May 2022 08:25:27 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gautamnagrawal@gmail.com>)
 id 1nl8dh-0006Cq-Py
 for qemu-devel@nongnu.org; Sun, 01 May 2022 08:25:27 -0400
Received: by mail-pf1-x436.google.com with SMTP id p8so10415017pfh.8
 for <qemu-devel@nongnu.org>; Sun, 01 May 2022 05:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rziqyFczxhxZ28n1Kc18WZNX7mn1ZLsgzVsUTLpUrZY=;
 b=S9FFhUecne4f20EuzOoZhWU4vJlFVS9ceS+u/Icr4mfnSYvfPSKD9h4kwu4iHCx668
 DhnB+DuVDAN9XiA5WmuRk7vtl39hRgzpQPa2dcvUNqqqt7UkGaOsqPPBW9TAqejHbrGc
 wZKMaQdDFzc40AKgNNBbzfMsAsSqriyJe++Tgo/aG1XzGJ//4E8O3KONEZc7b1FuwVJo
 v9ScP9fWGaPBEFLnPPoG1jrbxOtsu+XIruGWhX8hf8CkmK2J4t9qRO1cg/5K3vFrE8nW
 PQsX78NTi2kU7uUo3v3cBSOa3S8uD5isNMKxNc41M7UwS8kz4W/GlmUewS6O/J8hIIwl
 dSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rziqyFczxhxZ28n1Kc18WZNX7mn1ZLsgzVsUTLpUrZY=;
 b=onY8IhGrA/gd5zzAvKsq/bf7C/5aINzggrGPWu5ILmD71jTnnYVCBh7di5eJXghpRu
 SjB5rQ8nmkt+YLWh/H0rYtFlAkhVqt6gx1OGt/M3YVg9xbPrNuydxb4vzW6BH2j/R2k1
 LPVbGjfN9HJi4/YurQTiVDp9L18009Yj9LtsefvTgIs3fDZrIICFaN76wpSSNvowJM2p
 PyQhlidBQH5TZSTAmBjm1Y6FA+LiBsccg4fzMBoq8XqFYaI704omwFAYsiy6IznQR9VL
 mYaW8o2m9G1u8B084wyJhg/ZwWQZMOGZlafBev+/uBo4iCmCce2PP0OEQ3l9sOeWmTAb
 Uhwg==
X-Gm-Message-State: AOAM533sJG+kMMqPGIA60nSbiDTlRcpOY6KwhNclBI53aT0nOmb+VLtB
 FabJu9KPD1EuaecXffW2bcq8zF0+s3JEHA==
X-Google-Smtp-Source: ABdhPJxDVcaBrXofhYPB2FHdf1Z1g+N09p5NbJxqJO2eov3EE9ykiWiswvCngrjIau8nZlURZNQJaA==
X-Received: by 2002:a63:fd05:0:b0:3aa:127d:538a with SMTP id
 d5-20020a63fd05000000b003aa127d538amr6047403pgh.95.1651407922209; 
 Sun, 01 May 2022 05:25:22 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:201:43fc:28d2:c042:1f49:5f99])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a632f02000000b003c14af50601sm9324268pgv.25.2022.05.01.05.25.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 May 2022 05:25:21 -0700 (PDT)
From: Gautam Agrawal <gautamnagrawal@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] Warn user if the vga flag is passed but no vga device is
 created
Date: Sun,  1 May 2022 17:55:05 +0530
Message-Id: <20220501122505.29202-1-gautamnagrawal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=gautamnagrawal@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, kraxel@redhat.com,
 Gautam Agrawal <gautamnagrawal@gmail.com>, stefanha@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/581
---
 hw/hppa/machine.c         | 1 +
 hw/isa/isa-bus.c          | 1 +
 hw/mips/fuloong2e.c       | 1 +
 hw/pci/pci.c              | 1 +
 hw/ppc/spapr.c            | 1 +
 hw/sparc/sun4m.c          | 2 ++
 hw/sparc64/sun4u.c        | 1 +
 hw/xenpv/xen_machine_pv.c | 1 +
 include/sysemu/sysemu.h   | 1 +
 softmmu/globals.c         | 1 +
 softmmu/vl.c              | 6 ++++++
 11 files changed, 17 insertions(+)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index f7595c0857..2e37349347 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -192,6 +192,7 @@ static void machine_hppa_init(MachineState *machine)
 
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
index 22569305d2..9df493cfe2 100644
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
index 06a0e342fe..8411cb15af 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2734,6 +2734,12 @@ static void qemu_machine_creation_done(void)
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
2.34.1


