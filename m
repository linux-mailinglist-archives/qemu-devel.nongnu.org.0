Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C766A407C5D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 10:07:37 +0200 (CEST)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPKWW-0008DX-Rd
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 04:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKG8-0003fr-Hk
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:50:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35100
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKG4-000363-DM
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 03:50:39 -0400
Received: from host109-153-76-56.range109-153.btcentralplus.com
 ([109.153.76.56] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mPKFn-00034U-MU; Sun, 12 Sep 2021 08:50:23 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sun, 12 Sep 2021 08:49:14 +0100
Message-Id: <20210912074914.22048-21-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.76.56
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 20/20] q800: configure nubus available slots for Quadra 800
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Slot 0x9 is reserved for use by the in-built framebuffer whilst only slots
0xc, 0xd and 0xe physically exist on the Quadra 800.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index fbc45a301f..65c80421c6 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -78,6 +78,13 @@
 
 #define MAC_CLOCK  3686418
 
+/*
+ * Slot 0x9 is reserved for use by the in-built framebuffer whilst only
+ * slots 0xc, 0xd and 0xe physically exist on the Quadra 800
+ */
+#define Q800_NUBUS_SLOTS_AVAILABLE    ((1UL << 0x9) | (1UL << 0xc) | \
+                                       (1UL << 0xd) | (1UL << 0xe))
+
 /*
  * The GLUE (General Logic Unit) is an Apple custom integrated circuit chip
  * that performs a variety of functions (RAM management, clock generation, ...).
@@ -392,6 +399,8 @@ static void q800_init(MachineState *machine)
     /* NuBus */
 
     dev = qdev_new(TYPE_MAC_NUBUS_BRIDGE);
+    qdev_prop_set_uint32(dev, "slot-available-mask",
+                         Q800_NUBUS_SLOTS_AVAILABLE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 9 * NUBUS_SUPER_SLOT_SIZE);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
-- 
2.20.1


