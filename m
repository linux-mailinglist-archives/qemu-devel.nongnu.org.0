Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF5C41FB0D
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 13:12:42 +0200 (CEST)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWcwb-0003hF-Lb
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 07:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWclH-00051D-2h
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33214
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWclF-0005BY-Bk
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 07:00:58 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mWcl1-00020j-Ob; Sat, 02 Oct 2021 12:00:47 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Sat,  2 Oct 2021 12:00:07 +0100
Message-Id: <20211002110007.30825-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
References: <20211002110007.30825-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/12] q800: wire macfb IRQ to separate video interrupt on VIA2
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

Whilst the in-built Quadra 800 framebuffer exists within the Nubus address
space for slot 9, it has its own dedicated interrupt on VIA2. Force the
macfb device to occupy slot 9 in the q800 machine and wire its IRQ to the
separate video interrupt since this is what is expected by the MacOS
interrupt handler.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index df3fd3711e..fd4855047e 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -407,8 +407,10 @@ static void q800_init(MachineState *machine)
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SUPER_SLOT_SIZE);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
-
-    for (i = 0; i < VIA2_NUBUS_IRQ_NB; i++) {
+    qdev_connect_gpio_out(dev, 9,
+                          qdev_get_gpio_in_named(via2_dev, "nubus-irq",
+                          VIA2_NUBUS_IRQ_INTVIDEO));
+    for (i = 1; i < VIA2_NUBUS_IRQ_NB; i++) {
         qdev_connect_gpio_out(dev, 9 + i,
                               qdev_get_gpio_in_named(via2_dev, "nubus-irq",
                                                      VIA2_NUBUS_IRQ_9 + i));
@@ -419,6 +421,7 @@ static void q800_init(MachineState *machine)
     /* framebuffer in nubus slot #9 */
 
     dev = qdev_new(TYPE_NUBUS_MACFB);
+    qdev_prop_set_uint32(dev, "slot", 9);
     qdev_prop_set_uint32(dev, "width", graphic_width);
     qdev_prop_set_uint32(dev, "height", graphic_height);
     qdev_prop_set_uint8(dev, "depth", graphic_depth);
-- 
2.20.1


