Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EEE42CCC4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 23:24:35 +0200 (CEST)
Received: from localhost ([::1]:43036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maljm-00070I-FS
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 17:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malh9-0002qg-Nb
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:21:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48408
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malh8-0006oi-61
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:21:51 -0400
Received: from [2a00:23c4:8b9d:d300:c17b:cf83:be43:9708] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1malgq-0000Dh-Nj; Wed, 13 Oct 2021 22:21:36 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 13 Oct 2021 22:21:26 +0100
Message-Id: <20211013212132.31519-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:d300:c17b:cf83:be43:9708
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/8] q800: move VIA1 IRQ from level 1 to level 6
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

On a Quadra 800 machine Linux sets via_alt_mapping to 1 and clears port B bit 6 to
ensure that the VIA1 IRQ is delivered at level 6 rather than level 1. Even though
QEMU doesn't yet emulate this behaviour, Linux still installs the VIA1 level 1 IRQ
handler regardless of the value of via_alt_mapping which is why the kernel has been
able to boot until now.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index fd4855047e..15f3067811 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -284,7 +284,7 @@ static void q800_init(MachineState *machine)
     sysbus = SYS_BUS_DEVICE(via1_dev);
     sysbus_realize_and_unref(sysbus, &error_fatal);
     sysbus_mmio_map(sysbus, 1, VIA_BASE);
-    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 0));
+    sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(glue, 5));
 
     adb_bus = qdev_get_child_bus(via1_dev, "adb.0");
     dev = qdev_new(TYPE_ADB_KEYBOARD);
-- 
2.20.1


