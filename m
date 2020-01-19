Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D71420E2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 00:22:34 +0100 (CET)
Received: from localhost ([::1]:55124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itJtp-0006BE-DL
	for lists+qemu-devel@lfdr.de; Sun, 19 Jan 2020 18:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56325)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1itJg4-0004jE-Mg
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 18:08:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1itJg2-00041r-Er
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 18:08:20 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54742)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1itJg2-0003lo-8l; Sun, 19 Jan 2020 18:08:18 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 8AD4A29983; Sun, 19 Jan 2020 18:07:55 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <e45b5be179d84ee6f7b8c666fa64548e8a74fdd1.1579474761.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1579474761.git.fthain@telegraphics.com.au>
References: <cover.1579474761.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v3 14/14] dp8393x: Don't stop reception upon RBE interrupt
 assertion
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

Section 3.4.7 of the datasheet explains that,

    The RBE bit in the Interrupt Status register is set when the
    SONIC finishes using the second to last receive buffer and reads
    the last RRA descriptor. Actually, the SONIC is not truly out of
    resources, but gives the system an early warning of an impending
    out of resources condition.

RBE does not mean actual receive buffer exhaustion, and reception should
not be stopped. This is important because Linux will not check and clear
the RBE interrupt until it receives another packet. But that won't
happen if can_receive returns false. This bug causes the SONIC to become
deaf (until reset).

Fix this with a new flag to indicate actual receive buffer exhaustion.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Tested-by: Laurent Vivier <laurent@vivier.eu>
---
Changed since v2:
 - Don't use can_receive to suspend packet reception.
 - Don't misuse the RBE interrupt flag as a proxy for RRP == RWP.
---
 hw/net/dp8393x.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 71af0fad51..1ccee0c189 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -158,6 +158,7 @@ typedef struct dp8393xState {
     /* Hardware */
     uint8_t it_shift;
     bool big_endian;
+    bool last_rba_is_full;
     qemu_irq irq;
 #ifdef DEBUG_SONIC
     int irq_level;
@@ -347,12 +348,15 @@ static void dp8393x_do_read_rra(dp8393xState *s)
         s->regs[SONIC_RRP] = s->regs[SONIC_RSA];
     }
 
-    /* Check resource exhaustion */
+    /* Warn the host if CRBA now has the last available resource */
     if (s->regs[SONIC_RRP] == s->regs[SONIC_RWP])
     {
         s->regs[SONIC_ISR] |= SONIC_ISR_RBE;
         dp8393x_update_irq(s);
     }
+
+    /* Allow packet reception */
+    s->last_rba_is_full = false;
 }
 
 static void dp8393x_do_software_reset(dp8393xState *s)
@@ -663,9 +667,6 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
                 dp8393x_do_read_rra(s);
             }
             dp8393x_update_irq(s);
-            if (dp8393x_can_receive(s->nic->ncs)) {
-                qemu_flush_queued_packets(qemu_get_queue(s->nic));
-            }
             break;
         /* The guest is required to store aligned pointers here */
         case SONIC_RSA:
@@ -725,8 +726,6 @@ static int dp8393x_can_receive(NetClientState *nc)
 
     if (!(s->regs[SONIC_CR] & SONIC_CR_RXEN))
         return 0;
-    if (s->regs[SONIC_ISR] & SONIC_ISR_RBE)
-        return 0;
     return 1;
 }
 
@@ -777,6 +776,10 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     s->regs[SONIC_RCR] &= ~(SONIC_RCR_PRX | SONIC_RCR_LBK | SONIC_RCR_FAER |
         SONIC_RCR_CRCR | SONIC_RCR_LPKT | SONIC_RCR_BC | SONIC_RCR_MC);
 
+    if (s->last_rba_is_full) {
+        return pkt_size;
+    }
+
     rx_len = pkt_size + sizeof(checksum);
     if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
         width = 2;
@@ -790,8 +793,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         DPRINTF("oversize packet, pkt_size is %d\n", pkt_size);
         s->regs[SONIC_ISR] |= SONIC_ISR_RBAE;
         dp8393x_update_irq(s);
-        dp8393x_do_read_rra(s);
-        return pkt_size;
+        s->regs[SONIC_RCR] |= SONIC_RCR_LPKT;
+        goto done;
     }
 
     packet_type = dp8393x_receive_filter(s, buf, pkt_size);
@@ -903,17 +906,23 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         s->regs[SONIC_ISR] |= SONIC_ISR_PKTRX;
     }
 
+    dp8393x_update_irq(s);
+
     s->regs[SONIC_RSC] = (s->regs[SONIC_RSC] & 0xff00) |
                          ((s->regs[SONIC_RSC] + 1) & 0x00ff);
 
+done:
+
     if (s->regs[SONIC_RCR] & SONIC_RCR_LPKT) {
-        /* Read next RRA */
-        dp8393x_do_read_rra(s);
+        if (s->regs[SONIC_RRP] == s->regs[SONIC_RWP]) {
+            /* Stop packet reception */
+            s->last_rba_is_full = true;
+        } else {
+            /* Read next resource */
+            dp8393x_do_read_rra(s);
+        }
     }
 
-    /* Done */
-    dp8393x_update_irq(s);
-
     return pkt_size;
 }
 
-- 
2.24.1


