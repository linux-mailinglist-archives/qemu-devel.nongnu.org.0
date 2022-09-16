Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785AC5BB4C2
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 01:17:45 +0200 (CEST)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZKae-0003Wu-KY
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 19:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZKQn-0001oF-TD; Fri, 16 Sep 2022 19:07:33 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:18374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZKQm-0000ZQ-7g; Fri, 16 Sep 2022 19:07:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E1BE075A15D;
 Sat, 17 Sep 2022 01:07:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C3CF575A150; Sat, 17 Sep 2022 01:07:27 +0200 (CEST)
Message-Id: <f8554a36947fc60caf104deffc6cfa5c4f244ae5.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663368422.git.balaton@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 09/10] hw/ppc/mac.h: Move PROM and KERNEL defines to board code
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sat, 17 Sep 2022 01:07:27 +0200 (CEST)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PROM_FILENAME and KERNEL_* defines are used by mac_oldworld and
mac_newworld but they don't have to be identical so these could be
moved to the individual boards. The NVRAM_SIZE define is not used so
it can be dropped. This further reduces the mac.h header.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac.h          | 6 ------
 hw/ppc/mac_newworld.c | 4 ++++
 hw/ppc/mac_oldworld.c | 7 ++++++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index fe77a6c6db..3c0c3cc43d 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -29,12 +29,6 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 
-#define NVRAM_SIZE        0x2000
-#define PROM_FILENAME    "openbios-ppc"
-
-#define KERNEL_LOAD_ADDR 0x01000000
-#define KERNEL_GAP       0x00100000
-
 /* Mac NVRAM */
 #define TYPE_MACIO_NVRAM "macio-nvram"
 OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 14cc8cd6ea..1cb10726d3 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -83,9 +83,13 @@
 
 #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
 
+#define PROM_FILENAME "openbios-ppc"
 #define PROM_BASE 0xfff00000
 #define PROM_SIZE (1 * MiB)
 
+#define KERNEL_LOAD_ADDR 0x01000000
+#define KERNEL_GAP       0x00100000
+
 #define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
 typedef struct Core99MachineState Core99MachineState;
 DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index a4094226bc..e196090f49 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -57,10 +57,15 @@
 
 #define NDRV_VGA_FILENAME "qemu_vga.ndrv"
 
-#define GRACKLE_BASE 0xfec00000
+#define PROM_FILENAME "openbios-ppc"
 #define PROM_BASE 0xffc00000
 #define PROM_SIZE (4 * MiB)
 
+#define KERNEL_LOAD_ADDR 0x01000000
+#define KERNEL_GAP       0x00100000
+
+#define GRACKLE_BASE 0xfec00000
+
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
                             Error **errp)
 {
-- 
2.30.4


