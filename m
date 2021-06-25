Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29493B3CEB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 08:59:05 +0200 (CEST)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwfnt-0005FX-16
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 02:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjM-0005p9-Nu
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58718
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfjG-0001rj-Uu
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 02:54:24 -0400
Received: from host109-153-84-9.range109-153.btcentralplus.com ([109.153.84.9]
 helo=kentang.home) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lwfj2-0006FO-5i; Fri, 25 Jun 2021 07:54:04 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 jasowang@redhat.com, fthain@telegraphics.com.au, laurent@vivier.eu
Date: Fri, 25 Jun 2021 07:53:56 +0100
Message-Id: <20210625065401.30170-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 05/10] dp8393x: remove onboard PROM containing MAC address
 and checksum
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

According to the datasheet the dp8393x chipset does not contain any NVRAM capable
of storing a MAC address or checksum. Now that both the MIPS jazz and m68k q800
boards generate the PROM region and checksum themselves, remove the generated
PROM from the dp8393x device itself.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index ea5b22f680..252c0a2664 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -30,8 +30,6 @@
 #include "qom/object.h"
 #include "trace.h"
 
-#define SONIC_PROM_SIZE 0x1000
-
 static const char *reg_names[] = {
     "CR", "DCR", "RCR", "TCR", "IMR", "ISR", "UTDA", "CTDA",
     "TPS", "TFC", "TSA0", "TSA1", "TFS", "URDA", "CRDA", "CRBA0",
@@ -157,7 +155,6 @@ struct dp8393xState {
     NICConf conf;
     NICState *nic;
     MemoryRegion mmio;
-    MemoryRegion prom;
 
     /* Registers */
     uint8_t cam[16][6];
@@ -966,16 +963,12 @@ static void dp8393x_instance_init(Object *obj)
     dp8393xState *s = DP8393X(obj);
 
     sysbus_init_mmio(sbd, &s->mmio);
-    sysbus_init_mmio(sbd, &s->prom);
     sysbus_init_irq(sbd, &s->irq);
 }
 
 static void dp8393x_realize(DeviceState *dev, Error **errp)
 {
     dp8393xState *s = DP8393X(dev);
-    int i, checksum;
-    uint8_t *prom;
-    Error *local_err = NULL;
 
     address_space_init(&s->as, s->dma_mr, "dp8393x");
     memory_region_init_io(&s->mmio, OBJECT(dev), &dp8393x_ops, s,
@@ -986,23 +979,6 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     s->watchdog = timer_new_ns(QEMU_CLOCK_VIRTUAL, dp8393x_watchdog, s);
-
-    memory_region_init_rom(&s->prom, OBJECT(dev), "dp8393x-prom",
-                           SONIC_PROM_SIZE, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return;
-    }
-    prom = memory_region_get_ram_ptr(&s->prom);
-    checksum = 0;
-    for (i = 0; i < 6; i++) {
-        prom[i] = s->conf.macaddr.a[i];
-        checksum += prom[i];
-        if (checksum > 0xff) {
-            checksum = (checksum + 1) & 0xff;
-        }
-    }
-    prom[7] = 0xff - checksum;
 }
 
 static const VMStateDescription vmstate_dp8393x = {
-- 
2.20.1


