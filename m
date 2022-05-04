Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C341A519D08
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:36:22 +0200 (CEST)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmCMn-0005qX-IY
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIq-0000XC-76
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:28:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIo-0004B6-KE
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:28:11 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHh-0002VG-4a; Wed, 04 May 2022 10:27:05 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:47 +0100
Message-Id: <20220504092600.10048-38-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 37/50] lasi: remove address space parameter from
 lasi_initfn()
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

Now that all of the LASI devices are mapped by the board, this parameter is no
longer required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/hppa_sys.h | 2 +-
 hw/hppa/lasi.c     | 2 +-
 hw/hppa/machine.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index 3832b787d1..31e3856059 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -11,7 +11,7 @@
 
 #include "hppa_hardware.h"
 
-LasiState *lasi_initfn(MemoryRegion *);
+LasiState *lasi_initfn(void);
 #define enable_lasi_lan()       0
 
 /* hppa_pci.c.  */
diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 9d8c9e3936..81c8e4d2d9 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -227,7 +227,7 @@ static void lasi_set_irq(void *opaque, int irq, int level)
     }
 }
 
-LasiState *lasi_initfn(MemoryRegion *address_space)
+LasiState *lasi_initfn(void)
 {
     DeviceState *dev;
 
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 1d48ec341d..52f12f6604 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -178,7 +178,7 @@ static void machine_hppa_init(MachineState *machine)
 
 
     /* Init Lasi chip */
-    lasi_dev = DEVICE(lasi_initfn(addr_space));
+    lasi_dev = DEVICE(lasi_initfn());
     memory_region_add_subregion(addr_space, LASI_HPA,
                                 sysbus_mmio_get_region(
                                     SYS_BUS_DEVICE(lasi_dev), 0));
-- 
2.20.1


