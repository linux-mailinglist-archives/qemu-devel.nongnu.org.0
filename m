Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EA4416D34
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:56:21 +0200 (CEST)
Received: from localhost ([::1]:50396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTg4C-0000QP-VG
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfoB-0004in-Q4
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:39:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:50306
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfoA-0004hD-Bj
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 03:39:47 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mTfnp-0002uw-7s; Fri, 24 Sep 2021 08:39:28 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Fri, 24 Sep 2021 08:38:07 +0100
Message-Id: <20210924073808.1041-20-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
References: <20210924073808.1041-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v6 19/20] q800: wire up nubus IRQs
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

Nubus IRQs are routed to the CPU through the VIA2 device so wire up the IRQs
using gpios accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 074acf4fdc..5bc9df58a0 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -398,6 +398,12 @@ static void q800_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
                     MAC_NUBUS_FIRST_SLOT * NUBUS_SLOT_SIZE);
 
+    for (i = 0; i < VIA2_NUBUS_IRQ_NB; i++) {
+        qdev_connect_gpio_out(dev, 9 + i,
+                              qdev_get_gpio_in_named(via2_dev, "nubus-irq",
+                                                     VIA2_NUBUS_IRQ_9 + i));
+    }
+
     nubus = &NUBUS_BRIDGE(dev)->bus;
 
     /* framebuffer in nubus slot #9 */
-- 
2.20.1


