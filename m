Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F637290B6C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 20:37:08 +0200 (CEST)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTUbD-0005Gz-CW
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 14:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSd-0008G9-Ji; Fri, 16 Oct 2020 14:28:15 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57642
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSb-0000Gy-UY; Fri, 16 Oct 2020 14:28:15 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTUSX-0003wP-7H; Fri, 16 Oct 2020 19:28:15 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, f4bug@amsat.org,
 hpoussin@reactos.org, qemu-ppc@nongnu.org, atar4qemu@gmail.com,
 david@gibson.dropbear.id.au
Date: Fri, 16 Oct 2020 19:27:38 +0100
Message-Id: <20201016182739.22875-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016182739.22875-1-mark.cave-ayland@ilande.co.uk>
References: <20201016182739.22875-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 4/5] ppc405_boards: use qdev properties instead of legacy
 m48t59_init() function
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/ppc405_boards.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 6198ec1035..4687715b15 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -28,6 +28,8 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/ppc/ppc.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
 #include "ppc405.h"
 #include "hw/rtc/m48t59.h"
 #include "hw/block/flash.h"
@@ -145,6 +147,8 @@ static void ref405ep_init(MachineState *machine)
     char *filename;
     ppc4xx_bd_info_t bd;
     CPUPPCState *env;
+    DeviceState *dev;
+    SysBusDevice *s;
     qemu_irq *pic;
     MemoryRegion *bios;
     MemoryRegion *sram = g_new(MemoryRegion, 1);
@@ -227,7 +231,11 @@ static void ref405ep_init(MachineState *machine)
     /* Register FPGA */
     ref405ep_fpga_init(sysmem, 0xF0300000);
     /* Register NVRAM */
-    m48t59_init(NULL, 0xF0000000, 0, 8192, 1968, 8);
+    dev = qdev_new("sysbus-m48t08");
+    qdev_prop_set_int32(dev, "base-year", 1968);
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, 0xF0000000);
     /* Load kernel */
     linux_boot = (kernel_filename != NULL);
     if (linux_boot) {
-- 
2.20.1


