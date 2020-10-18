Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941C629183D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Oct 2020 18:10:29 +0200 (CEST)
Received: from localhost ([::1]:58892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUBGO-0005a0-Kk
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 12:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUB6K-0002Zo-IB; Sun, 18 Oct 2020 12:00:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60374
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUB6I-0004OA-Ji; Sun, 18 Oct 2020 12:00:04 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kUB6I-0001FH-Ek; Sun, 18 Oct 2020 17:00:06 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au, atar4qemu@gmail.com
Date: Sun, 18 Oct 2020 16:59:12 +0100
Message-Id: <20201018155919.21200-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201018155919.21200-1-mark.cave-ayland@ilande.co.uk>
References: <20201018155919.21200-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 06/13] sun4u: use qdev properties instead of legacy
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
Message-Id: <20201016182739.22875-4-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/sparc64/sun4u.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index ad5ca2472a..05e659c8a4 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -671,10 +671,13 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     pci_ide_create_devs(pci_dev);
 
     /* Map NVRAM into I/O (ebus) space */
-    nvram = m48t59_init(NULL, 0, 0, NVRAM_SIZE, 1968, 59);
-    s = SYS_BUS_DEVICE(nvram);
+    dev = qdev_new("sysbus-m48t59");
+    qdev_prop_set_int32(dev, "base-year", 1968);
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
     memory_region_add_subregion(pci_address_space_io(ebus), 0x2000,
                                 sysbus_mmio_get_region(s, 0));
+    nvram = NVRAM(dev);
  
     initrd_size = 0;
     initrd_addr = 0;
-- 
2.20.1


