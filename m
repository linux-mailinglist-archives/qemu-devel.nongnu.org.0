Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07A25F379C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:22:28 +0200 (CEST)
Received: from localhost ([::1]:32932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofStP-0006Xw-Ns
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRog-00055Y-QJ; Mon, 03 Oct 2022 16:13:38 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:20432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ofRoa-0000y7-Lw; Mon, 03 Oct 2022 16:13:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2B298759B50;
 Mon,  3 Oct 2022 22:13:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0A8D9746324; Mon,  3 Oct 2022 22:13:17 +0200 (CEST)
Message-Id: <76704ea91a1d74565f424a6ea2b4030efbdb5f92.1664827008.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1664827008.git.balaton@eik.bme.hu>
References: <cover.1664827008.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v3 03/13] mac_{old|new}world: Set tbfreq at declaration
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Mon,  3 Oct 2022 22:13:17 +0200 (CEST)
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tbfreq variable is only set once in an if-else which can be done
at the variable declaration saving some lines of code and making it
simpler.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_newworld.c | 9 +--------
 hw/ppc/mac_oldworld.c | 9 +--------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 27e4e8d136..6327694f85 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -130,7 +130,7 @@ static void ppc_core99_init(MachineState *machine)
     DeviceState *dev, *pic_dev;
     DeviceState *uninorth_internal_dev = NULL, *uninorth_agp_dev = NULL;
     hwaddr nvram_addr = 0xFFF04000;
-    uint64_t tbfreq;
+    uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
 
     /* init CPUs */
     for (i = 0; i < machine->smp.cpus; i++) {
@@ -343,13 +343,6 @@ static void ppc_core99_init(MachineState *machine)
     has_adb = (core99_machine->via_config == CORE99_VIA_CONFIG_CUDA ||
                core99_machine->via_config == CORE99_VIA_CONFIG_PMU_ADB);
 
-    /* Timebase Frequency */
-    if (kvm_enabled()) {
-        tbfreq = kvmppc_get_tbfreq();
-    } else {
-        tbfreq = TBFREQ;
-    }
-
     /* init basic PC hardware */
     pci_bus = PCI_HOST_BRIDGE(uninorth_pci)->bus;
 
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 86512d31ad..5cabc410e7 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -99,7 +99,7 @@ static void ppc_heathrow_init(MachineState *machine)
     uint16_t ppc_boot_device;
     DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
-    uint64_t tbfreq;
+    uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
 
     /* init CPUs */
     for (i = 0; i < machine->smp.cpus; i++) {
@@ -223,13 +223,6 @@ static void ppc_heathrow_init(MachineState *machine)
         }
     }
 
-    /* Timebase Frequency */
-    if (kvm_enabled()) {
-        tbfreq = kvmppc_get_tbfreq();
-    } else {
-        tbfreq = TBFREQ;
-    }
-
     /* Grackle PCI host bridge */
     grackle_dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
     qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
-- 
2.30.4


