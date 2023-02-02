Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA194687249
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:27:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNR4-0005UB-I7; Wed, 01 Feb 2023 19:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNNR2-0005T8-7Q; Wed, 01 Feb 2023 19:26:40 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNNQx-0000PQ-94; Wed, 01 Feb 2023 19:26:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 55201746377;
 Thu,  2 Feb 2023 01:24:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 3248C74634B; Thu,  2 Feb 2023 01:24:06 +0100 (CET)
Message-Id: <1aadee8f0ca0f56cf1b7c45c3944676a07d91de9.1675297286.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1675297286.git.balaton@eik.bme.hu>
References: <cover.1675297286.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 2/2] mac_oldworld: Allow specifying nvram backing store
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Thu,  2 Feb 2023 01:24:06 +0100 (CET)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, PP_MIME_FAKE_ASCII_TEXT=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Add a way to set a backing store for the mac_nvram. Use -drive
file=nvram.img,format=raw,if=mtd to specify backing file where
nvram.img must be MACIO_NVRAM_SIZE which is 8192 bytes.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/mac_oldworld.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 558c639202..55190add55 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -102,7 +102,7 @@ static void ppc_heathrow_init(MachineState *machine)
     DeviceState *dev, *pic_dev, *grackle_dev;
     BusState *adb_bus;
     uint16_t ppc_boot_device;
-    DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
+    DriveInfo *dinfo, *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
     uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
 
@@ -245,6 +245,12 @@ static void ppc_heathrow_init(MachineState *machine)
     qdev_prop_set_chr(dev, "chrA", serial_hd(0));
     qdev_prop_set_chr(dev, "chrB", serial_hd(1));
 
+    dinfo = drive_get(IF_MTD, 0, 0);
+    if (dinfo) {
+        dev = DEVICE(object_resolve_path_component(macio, "nvram"));
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+
     pci_realize_and_unref(PCI_DEVICE(macio), pci_bus, &error_fatal);
 
     pic_dev = DEVICE(object_resolve_path_component(macio, "pic"));
-- 
2.30.6


