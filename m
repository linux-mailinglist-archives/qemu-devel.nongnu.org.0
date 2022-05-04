Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149E8519C91
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:09:02 +0200 (CEST)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBwL-0007vJ-5w
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIr-0000Z5-FB
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:28:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIp-0004BF-Hn
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:28:13 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHl-0002VG-Bs; Wed, 04 May 2022 10:27:05 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:48 +0100
Message-Id: <20220504092600.10048-39-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 38/50] lasi: move lasi_initfn() to machine.c
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

Move the simplified lasi_initfn() back to machine.c whilst also renaming it
back to its original lasi_init() name.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/hppa_sys.h |  2 --
 hw/hppa/lasi.c     | 10 ----------
 hw/hppa/machine.c  | 12 +++++++++++-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index 31e3856059..f7a127be19 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -7,11 +7,9 @@
 #include "hw/pci/pci_host.h"
 #include "hw/boards.h"
 #include "hw/intc/i8259.h"
-#include "lasi.h"
 
 #include "hppa_hardware.h"
 
-LasiState *lasi_initfn(void);
 #define enable_lasi_lan()       0
 
 /* hppa_pci.c.  */
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 81c8e4d2d9..ad50880a13 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -227,16 +227,6 @@ static void lasi_set_irq(void *opaque, int irq, int level)
     }
 }
 
-LasiState *lasi_initfn(void)
-{
-    DeviceState *dev;
-
-    dev = qdev_new(TYPE_LASI_CHIP);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-
-    return LASI_CHIP(dev);
-}
-
 static void lasi_reset(DeviceState *dev)
 {
     LasiState *s = LASI_CHIP(dev);
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 52f12f6604..58b25ca5bc 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -125,6 +125,16 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
     return fw_cfg;
 }
 
+static LasiState *lasi_init(void)
+{
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_LASI_CHIP);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    return LASI_CHIP(dev);
+}
+
 static DinoState *dino_init(MemoryRegion *addr_space)
 {
     DeviceState *dev;
@@ -178,7 +188,7 @@ static void machine_hppa_init(MachineState *machine)
 
 
     /* Init Lasi chip */
-    lasi_dev = DEVICE(lasi_initfn());
+    lasi_dev = DEVICE(lasi_init());
     memory_region_add_subregion(addr_space, LASI_HPA,
                                 sysbus_mmio_get_region(
                                     SYS_BUS_DEVICE(lasi_dev), 0));
-- 
2.20.1


