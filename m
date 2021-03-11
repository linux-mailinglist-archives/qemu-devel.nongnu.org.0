Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9586C336FA8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:14:51 +0100 (CET)
Received: from localhost ([::1]:39924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKILC-0007Mh-MK
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKICT-00063U-Ns
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:49 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52316
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKICQ-0004jm-Hx
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:49 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKICO-0001He-N3; Thu, 11 Mar 2021 10:05:47 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 11 Mar 2021 10:05:05 +0000
Message-Id: <20210311100505.22596-8-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
References: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 7/7] mac_via: remove VIA1 timer optimisations
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

The original implementation of the Macintosh VIA devices in commit 6dca62a000
"hw/m68k: add VIA support" used timer optimisations to reduce high CPU usage on
the host when booting Linux. These optimisations worked by waiting until VIA1
port B was accessed before re-arming the timers.

The MacOS toolbox ROM constantly writes to VIA1 port B which calls
via1_one_second_update() and via1_sixty_hz_update() to calculate the new expiry
time, causing the timers to constantly reset and never fire. The effect of this
is that the Ticks (0x16a) global variable holding the number of 60Hz timer ticks
since reset is never incremented by the interrupt causing time to stand still.

Whilst the code was introduced as a performance optimisation, it is likely that
the high CPU usage was actually caused by the incorrect 60Hz timer interval
fixed in the previous patch. Remove the optimisation to keep everything simple
and enable the MacOS toolbox ROM to start keeping time.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 43 ++++---------------------------------------
 1 file changed, 4 insertions(+), 39 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index e7dd31f291..f164c8c606 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -305,31 +305,18 @@ enum {
 
 static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
 {
-    MOS6522State *s = MOS6522(v1s);
-
     /* 60 Hz irq */
     v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
                           VIA_60HZ_TIMER_PERIOD_NS) /
                           VIA_60HZ_TIMER_PERIOD_NS * VIA_60HZ_TIMER_PERIOD_NS;
-
-    if (s->ier & VIA1_IRQ_60HZ) {
-        timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
-    } else {
-        timer_del(v1s->sixty_hz_timer);
-    }
+    timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
 }
 
 static void via1_one_second_update(MOS6522Q800VIA1State *v1s)
 {
-    MOS6522State *s = MOS6522(v1s);
-
     v1s->next_second = (qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 1000) /
                        1000 * 1000;
-    if (s->ier & VIA1_IRQ_ONE_SECOND) {
-        timer_mod(v1s->one_second_timer, v1s->next_second);
-    } else {
-        timer_del(v1s->one_second_timer);
-    }
+    timer_mod(v1s->one_second_timer, v1s->next_second);
 }
 
 static void via1_sixty_hz(void *opaque)
@@ -900,21 +887,6 @@ static uint64_t mos6522_q800_via1_read(void *opaque, hwaddr addr, unsigned size)
 {
     MOS6522Q800VIA1State *s = MOS6522_Q800_VIA1(opaque);
     MOS6522State *ms = MOS6522(s);
-    int64_t now = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
-
-    /*
-     * If IRQs are disabled, timers are disabled, but we need to update
-     * VIA1_IRQ_60HZ and VIA1_IRQ_ONE_SECOND bits in the IFR
-     */
-
-    if (now >= s->next_sixty_hz) {
-        ms->ifr |= VIA1_IRQ_60HZ;
-        via1_sixty_hz_update(s);
-    }
-    if (now >= s->next_second) {
-        ms->ifr |= VIA1_IRQ_ONE_SECOND;
-        via1_one_second_update(s);
-    }
 
     addr = (addr >> 9) & 0xf;
     return mos6522_read(ms, addr, size);
@@ -938,9 +910,6 @@ static void mos6522_q800_via1_write(void *opaque, hwaddr addr, uint64_t val,
         v1s->last_b = ms->b;
         break;
     }
-
-    via1_one_second_update(v1s);
-    via1_sixty_hz_update(v1s);
 }
 
 static const MemoryRegionOps mos6522_q800_via1_ops = {
@@ -985,16 +954,10 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
 static void mac_via_reset(DeviceState *dev)
 {
     MacVIAState *m = MAC_VIA(dev);
-    MOS6522Q800VIA1State *v1s = &m->mos6522_via1;
     ADBBusState *adb_bus = &m->adb_bus;
 
     adb_set_autopoll_enabled(adb_bus, true);
 
-    timer_del(v1s->sixty_hz_timer);
-    v1s->next_sixty_hz = 0;
-    timer_del(v1s->one_second_timer);
-    v1s->next_second = 0;
-
     m->cmd = REG_EMPTY;
     m->alt = REG_EMPTY;
 }
@@ -1033,9 +996,11 @@ static void mac_via_realize(DeviceState *dev, Error **errp)
     m->mos6522_via1.one_second_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
                                                      via1_one_second,
                                                      &m->mos6522_via1);
+    via1_one_second_update(&m->mos6522_via1);
     m->mos6522_via1.sixty_hz_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                                   via1_sixty_hz,
                                                   &m->mos6522_via1);
+    via1_sixty_hz_update(&m->mos6522_via1);
 
     qemu_get_timedate(&tm, 0);
     m->tick_offset = (uint32_t)mktimegm(&tm) + RTC_OFFSET;
-- 
2.20.1


