Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D86961104F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:00:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooNz7-0002GR-I7; Fri, 28 Oct 2022 07:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNye-0001lb-Ve; Fri, 28 Oct 2022 07:56:45 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ooNya-0006Nk-WD; Fri, 28 Oct 2022 07:56:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 530C075A135;
 Fri, 28 Oct 2022 13:56:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 197E775A16B; Fri, 28 Oct 2022 13:56:36 +0200 (CEST)
Message-Id: <61dc9f56579662f9b97c6cc9fcdc0007665c064f.1666957578.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1666957578.git.balaton@eik.bme.hu>
References: <cover.1666957578.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v6 19/19] mac_{old, new}world: Pass MacOS VGA NDRV in card ROM
 instead of fw_cfg
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Fri, 28 Oct 2022 13:56:36 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

OpenBIOS cannot run FCode ROMs yet but it can detect NDRV in VGA card
ROM and add it to the device tree for MacOS. Pass the NDRV this way
instead of via fw_cfg. This solves the problem with OpenBIOS also
adding the NDRV to ati-vga which it does not work with. This does not
need any changes to OpenBIOS as this NDRV ROM handling is already
there but this patch also allows simplifying OpenBIOS later to remove
the fw_cfg ndrv handling from the vga FCode and also drop the
vga-ndrv? option which is not needed any more as users can disable the
ndrv with -device VGA,romfile="" (or override it with their own NDRV
or ROM). Once FCode support is implemented in OpenBIOS, the proper
FCode ROM can be set the same way so this paves the way to remove some
hacks.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac_newworld.c | 18 ++++++------------
 hw/ppc/mac_oldworld.c | 18 ++++++------------
 2 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 4ca9ab3e03..104835b5a8 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -526,18 +526,6 @@ static void ppc_core99_init(MachineState *machine)
     fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_BUSFREQ, BUSFREQ);
     fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_NVRAM_ADDR, nvram_addr);
 
-    /* MacOS NDRV VGA driver */
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, NDRV_VGA_FILENAME);
-    if (filename) {
-        gchar *ndrv_file;
-        gsize ndrv_size;
-
-        if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
-            fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
-        }
-        g_free(filename);
-    }
-
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
 }
 
@@ -581,6 +569,11 @@ static int core99_kvm_type(MachineState *machine, const char *arg)
     return 2;
 }
 
+static GlobalProperty props[] = {
+    /* MacOS NDRV VGA driver */
+    { "VGA", "romfile", NDRV_VGA_FILENAME },
+};
+
 static void core99_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -601,6 +594,7 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
 #endif
     mc->default_ram_id = "ppc_core99.ram";
     mc->ignore_boot_device_suffixes = true;
+    compat_props_add(mc->compat_props, props, G_N_ELEMENTS(props));
     fwc->get_dev_path = core99_fw_dev_path;
 }
 
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 558c639202..801123c507 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -345,18 +345,6 @@ static void ppc_heathrow_init(MachineState *machine)
     fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_CLOCKFREQ, CLOCKFREQ);
     fw_cfg_add_i32(fw_cfg, FW_CFG_PPC_BUSFREQ, BUSFREQ);
 
-    /* MacOS NDRV VGA driver */
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, NDRV_VGA_FILENAME);
-    if (filename) {
-        gchar *ndrv_file;
-        gsize ndrv_size;
-
-        if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
-            fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
-        }
-        g_free(filename);
-    }
-
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
 }
 
@@ -401,6 +389,11 @@ static int heathrow_kvm_type(MachineState *machine, const char *arg)
     return 2;
 }
 
+static GlobalProperty props[] = {
+    /* MacOS NDRV VGA driver */
+    { "VGA", "romfile", NDRV_VGA_FILENAME },
+};
+
 static void heathrow_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -421,6 +414,7 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
     mc->default_display = "std";
     mc->ignore_boot_device_suffixes = true;
     mc->default_ram_id = "ppc_heathrow.ram";
+    compat_props_add(mc->compat_props, props, G_N_ELEMENTS(props));
     fwc->get_dev_path = heathrow_fw_dev_path;
 }
 
-- 
2.30.6


