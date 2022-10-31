Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A99A613EC7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:16:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbBz-0007gH-72; Mon, 31 Oct 2022 16:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBx-0007fo-8x; Mon, 31 Oct 2022 16:15:29 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBs-0000j4-IV; Mon, 31 Oct 2022 16:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hwaUYYVU+41OOeU0hyXJRy+VYii281OzaGpgj7bDplE=; b=I0rdjEUlcvKOHHK2pOrGVi/NZT
 Zkm45etUnJvmzgbKoMR934MdJ1J6ajTJ0K/Tkc5hrQ+6FR5yctC+Sg2BuxAKzDNjDLmzbFefRxjIw
 1i+S/AzPHr045OSTQjuyQrlITN4giGnKZFHipd0xjmWhimWpCPNfixVfi+pLvxwRNxJlQeijKIUDN
 AkFGNem3Bi3L9OtjB4nslrRumJzuJPRPtrE3AMsoi1yh8KeOVvRn7dyfr3B/Kh3GOxpe4me0mmuFX
 VPoQwl3vptfIZBlxgNI6JQP/vCguXXO4TwjIBDSRW/P72JI8nnSSmEDlc7myjA1fIO1rVdkh0PEXj
 VC52VK7YE5+RU1yQiuUWghxDpmTxLDs7RAaORNpfFvXGwHPVgTR+HziNQy3uUzVmQ83xgw0j834x6
 f1BbKj5cjTrl/iuWNBbyu6tz7OPHM6KhUl8bZLCaUB/EpF5uhRGtPATdWqp1wqmJGitvg06/oCJkb
 8hcI/raLKbmlkax2Aij8D0NDHUdLumuNhX9FJ283LhQ8lJeURATfHq6U/AJIr3EWAXLRmsLSDLNH3
 rX4vqpfxrX3cIx81vql6GYXxYeqhoxOa1W3JA7zw6A1+AAymv4O8EGHyGZjEw3YGAAVveb/ruYxL+
 SUZpctumPHU0a5eXrxiS3JUkFUpB75gIKPK2QzK9E=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBj-0003Dd-9Y; Mon, 31 Oct 2022 20:15:19 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:24 +0000
Message-Id: <20221031201435.677168-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 03/14] mac_{old|new}world: Set tbfreq at declaration
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

The tbfreq variable is only set once in an if-else which can be done
at the variable declaration saving some lines of code and making it
simpler.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <15668da8eb8bad4561428a5f25b02f91e16d9c1b.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
2.30.2


