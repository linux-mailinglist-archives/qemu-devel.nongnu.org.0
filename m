Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E830F5BB4B3
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 01:14:19 +0200 (CEST)
Received: from localhost ([::1]:53616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZKXL-0000RF-2a
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 19:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZKQk-0001gw-SK; Fri, 16 Sep 2022 19:07:30 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:18369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZKQj-0000Xe-8X; Fri, 16 Sep 2022 19:07:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BB81A75A166;
 Sat, 17 Sep 2022 01:07:24 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9AE2375A15D; Sat, 17 Sep 2022 01:07:24 +0200 (CEST)
Message-Id: <0b4208c52d7b5987da19d045c1ceea453c37dd0a.1663368422.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1663368422.git.balaton@eik.bme.hu>
References: <cover.1663368422.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 06/10] hw/ppc/mac.h: Move newworld specific atuff out from
 shared header
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Date: Sat, 17 Sep 2022 01:07:24 +0200 (CEST)
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

Move the parts specific to and only used by mac99 out from the shared
mac.h into mac_newworld.c where they better belong.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ppc/mac.h          | 24 ------------------------
 hw/ppc/mac_newworld.c | 19 +++++++++++++++++++
 hw/ppc/mac_oldworld.c |  1 +
 3 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index a1fa8f8e41..e97087c7e7 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -26,15 +26,8 @@
 #ifndef PPC_MAC_H
 #define PPC_MAC_H
 
-#include "qemu/units.h"
 #include "exec/memory.h"
-#include "hw/boards.h"
 #include "hw/sysbus.h"
-#include "hw/input/adb.h"
-#include "hw/misc/mos6522.h"
-#include "hw/pci/pci_host.h"
-#include "hw/pci-host/uninorth.h"
-#include "qom/object.h"
 
 #define NVRAM_SIZE        0x2000
 #define PROM_FILENAME    "openbios-ppc"
@@ -65,23 +58,6 @@
 #define NEWWORLD_EXTING_GPIO1  0x2f
 #define NEWWORLD_EXTING_GPIO9  0x37
 
-/* Core99 machine */
-#define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
-typedef struct Core99MachineState Core99MachineState;
-DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
-                         TYPE_CORE99_MACHINE)
-
-#define CORE99_VIA_CONFIG_CUDA     0x0
-#define CORE99_VIA_CONFIG_PMU      0x1
-#define CORE99_VIA_CONFIG_PMU_ADB  0x2
-
-struct Core99MachineState {
-    /*< private >*/
-    MachineState parent;
-
-    uint8_t via_config;
-};
-
 /* Grackle PCI */
 #define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index ae90e5c353..14cc8cd6ea 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -48,10 +48,13 @@
 
 #include "qemu/osdep.h"
 #include "qemu/datadir.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/ppc/ppc.h"
 #include "hw/qdev-properties.h"
 #include "hw/ppc/mac.h"
+#include "hw/boards.h"
+#include "hw/pci-host/uninorth.h"
 #include "hw/input/adb.h"
 #include "hw/ppc/mac_dbdma.h"
 #include "hw/pci/pci.h"
@@ -83,6 +86,22 @@
 #define PROM_BASE 0xfff00000
 #define PROM_SIZE (1 * MiB)
 
+#define TYPE_CORE99_MACHINE MACHINE_TYPE_NAME("mac99")
+typedef struct Core99MachineState Core99MachineState;
+DECLARE_INSTANCE_CHECKER(Core99MachineState, CORE99_MACHINE,
+                         TYPE_CORE99_MACHINE)
+
+#define CORE99_VIA_CONFIG_CUDA     0x0
+#define CORE99_VIA_CONFIG_PMU      0x1
+#define CORE99_VIA_CONFIG_PMU_ADB  0x2
+
+struct Core99MachineState {
+    /*< private >*/
+    MachineState parent;
+
+    uint8_t via_config;
+};
+
 static void fw_cfg_boot_set(void *opaque, const char *boot_device,
                             Error **errp)
 {
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index a497507f1d..f323a49d7a 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -31,6 +31,7 @@
 #include "hw/ppc/ppc.h"
 #include "hw/qdev-properties.h"
 #include "mac.h"
+#include "hw/boards.h"
 #include "hw/input/adb.h"
 #include "sysemu/sysemu.h"
 #include "net/net.h"
-- 
2.30.4


