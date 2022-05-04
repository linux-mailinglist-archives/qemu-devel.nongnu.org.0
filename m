Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85120519C9A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:11:25 +0200 (CEST)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBye-00019f-J2
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHz-000875-JA
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHy-00043Z-2t
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:19 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBGq-0002VG-Cp; Wed, 04 May 2022 10:26:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:29 +0100
Message-Id: <20220504092600.10048-20-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 19/50] hppa: move dino_init() from dino.c to machine.c
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now that dino_init() is completely decoupled from dino.c it can be moved to
machine.c with the rest of the board configuration.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/dino.c     | 14 --------------
 hw/hppa/hppa_sys.h |  2 --
 hw/hppa/machine.c  | 12 ++++++++++++
 3 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
index d8baf139d6..6d12c385aa 100644
--- a/hw/hppa/dino.c
+++ b/hw/hppa/dino.c
@@ -399,20 +399,6 @@ static int dino_pci_map_irq(PCIDevice *d, int irq_num)
     return slot & 0x03;
 }
 
-DinoState *dino_init(MemoryRegion *addr_space)
-{
-    DeviceState *dev;
-    DinoState *s;
-
-    dev = qdev_new(TYPE_DINO_PCI_HOST_BRIDGE);
-    object_property_set_link(OBJECT(dev), "memory-as", OBJECT(addr_space),
-                             &error_fatal);
-    s = DINO_PCI_HOST_BRIDGE(dev);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    return s;
-}
-
 static void dino_pcihost_reset(DeviceState *dev)
 {
     DinoState *s = DINO_PCI_HOST_BRIDGE(dev);
diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index ebedecf1c8..7c31dd8396 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -9,9 +9,7 @@
 #include "hw/intc/i8259.h"
 
 #include "hppa_hardware.h"
-#include "dino.h"
 
-DinoState *dino_init(MemoryRegion *);
 DeviceState *lasi_init(MemoryRegion *);
 #define enable_lasi_lan()       0
 
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 49ecb971be..4b753fa346 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -122,6 +122,18 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
     return fw_cfg;
 }
 
+static DinoState *dino_init(MemoryRegion *addr_space)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_DINO_PCI_HOST_BRIDGE);
+    object_property_set_link(OBJECT(dev), "memory-as", OBJECT(addr_space),
+                             &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    return DINO_PCI_HOST_BRIDGE(dev);
+}
+
 static void machine_hppa_init(MachineState *machine)
 {
     const char *kernel_filename = machine->kernel_filename;
-- 
2.20.1


