Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F018E1420A7
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 00:11:01 +0100 (CET)
Received: from localhost ([::1]:54812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itJie-0007Uc-Lg
	for lists+qemu-devel@lfdr.de; Sun, 19 Jan 2020 18:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1itJg2-0004f0-Bm
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 18:08:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1itJg1-00041A-BN
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 18:08:18 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54734)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1itJg1-0003lA-7K; Sun, 19 Jan 2020 18:08:17 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 8469D29984; Sun, 19 Jan 2020 18:07:55 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <34caf9dea82cd30dc51b4f8768adb7a90b236bf2.1579474761.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1579474761.git.fthain@telegraphics.com.au>
References: <cover.1579474761.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v3 13/14] dp8393x: Don't reset Silicon Revision register
Date: Mon, 20 Jan 2020 09:59:21 +1100
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 98.124.60.144
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The jazzsonic driver in Linux uses the Silicon Revision register value
to probe the chip. The driver fails unless the SR register contains 4.
Unfortunately, reading this register in QEMU usually returns 0 because
the s->regs[] array gets wiped after a software reset.

Fixes: bd8f1ebce4 ("net/dp8393x: fix hardware reset")
Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/net/dp8393x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 1b73a8703b..71af0fad51 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -591,6 +591,10 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
                 val |= s->cam[s->regs[SONIC_CEP] & 0xf][2* (SONIC_CAP0 - reg)];
             }
             break;
+        /* Read-only */
+        case SONIC_SR:
+            val = 4; /* only revision recognized by Linux/mips */
+            break;
         /* All other registers have no special contrainst */
         default:
             val = s->regs[reg];
@@ -971,7 +975,6 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
 
     s->watchdog = timer_new_ns(QEMU_CLOCK_VIRTUAL, dp8393x_watchdog, s);
-    s->regs[SONIC_SR] = 0x0004; /* only revision recognized by Linux */
 
     memory_region_init_ram(&s->prom, OBJECT(dev),
                            "dp8393x-prom", SONIC_PROM_SIZE, &local_err);
-- 
2.24.1


