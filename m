Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F399A613ED4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:17:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbC6-0007mn-9Z; Mon, 31 Oct 2022 16:15:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbC4-0007l8-4w; Mon, 31 Oct 2022 16:15:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbC1-0000mP-JI; Mon, 31 Oct 2022 16:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ImOXHYiv8O4xotxGyVdu9Mo4Ou027BIs5Y7o98ZDwYg=; b=sEmWriwws8azvH7APlpdRPGjCv
 D1+bwgGyKEtWlDmyouq0q0K8wggedTKNXY6gRPo5sif5sFyn1+CU8qgLVA84AwL7F0i9MtnlLg9QS
 x6PJrnHqTl2MyS/L4sSVU8erEDTZlqWgMb1SD5meaP3oocMOwWykOcMlf0xTShTjN+cQuetUo+/co
 9LZBv+1QqwheDQsSEVlCVTSpqlvEwMskYmnTPNkTYAYNCd+JHL+h6MZk1JMod2uJ+Ak7iGiCe4z4f
 MRsLOJDcfrWBG0QejUa47CvgSB8dTTFhwi+QV8GiW9Rc8UjE+szES1ytZz4dSFiuYJtbAMw2gU2zG
 lU22M3yQG8M4Peg744LqApv9m1ddh39YW5IqVmsxPiZ6kZjcwEks9rtHkUByVwNqDASM2J9yJY9n8
 Le7gXjNfh30tkyswMrdWCp74zeVWMAFTdvjtTPwj46YsemQSinV+HaV3WWGwUm0D6JkbY0yXkx/JO
 K5+qu99Xo4Y61pwmBfHHEZ8uojPmj/rocF/5rw4dzyltLstdl6eEqErDwEpawQv0aLRjykdv9ECE/
 bRASVgIcj4ea/cKPAuls97w3dJtQGXPBDU63zmYy4Uh0dP62zn72i2umDFotDhMeBjlEh5D6Ataxu
 3O1lFvl7bJMuTVe7SoajRTlBcLuGPgkLywO7ndLoM=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opbBs-0003Dd-Cx; Mon, 31 Oct 2022 20:15:28 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org,
	stefanha@redhat.com
Date: Mon, 31 Oct 2022 20:14:28 +0000
Message-Id: <20221031201435.677168-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 07/14] hw/ppc/mac.h: Move newworld specific parts out from
 shared header
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Move the parts specific to and only used by mac99 out from the shared
mac.h into mac_newworld.c where they better belong.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <f3c6862de5b51ef49ae0714cf7ee21828d0502cf.1666957578.git.balaton@eik.bme.hu>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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
index 4bfffa586b..873c9f5cb4 100644
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
2.30.2


