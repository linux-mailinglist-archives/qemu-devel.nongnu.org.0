Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64611EF90
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 02:35:58 +0100 (CET)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifwLd-0003ow-S3
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 20:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41595)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifwEe-00041w-Bp
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 20:28:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifwEc-00019J-On
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 20:28:44 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47410)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ifwEc-00016t-8z; Fri, 13 Dec 2019 20:28:42 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 70CAB27DAC; Fri, 13 Dec 2019 20:28:41 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <f0acfe7f91ac42560a07661cd0f07143fce338c3.1576286757.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1576286757.git.fthain@telegraphics.com.au>
References: <cover.1576286757.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 09/10] dp8393x: Don't stop reception upon RBE interrupt
 assertion
Date: Sat, 14 Dec 2019 12:25:57 +1100
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
 Herve Poussineau <hpoussin@reactos.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Section 5.4.7 of the datasheet explains that the RBE interrupt is an
"early warning". It indicates that the last RBA is still available to
receive a packet. It doesn't imply actual receive buffer exhaustion.

This is an important distinction because Linux will not check and clear
the RBE interrupt until it receives another packet. But that won't
happen if can_receive returns false. So the SONIC becomes deaf (until
reset).

Fix this with a new flag to indicate actual receive buffer exhaustion.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/net/dp8393x.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 24f2e19f07..8e66b1f5de 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -157,6 +157,7 @@ typedef struct dp8393xState {
     /* Hardware */
     uint8_t it_shift;
     bool big_endian;
+    bool last_rba_is_full;
     qemu_irq irq;
 #ifdef DEBUG_SONIC
     int irq_level;
@@ -311,6 +312,12 @@ static void dp8393x_do_read_rra(dp8393xState *s)
 {
     int width, size;
 
+    /* Already on the last RBA? */
+    s->last_rba_is_full = s->regs[SONIC_ISR] & SONIC_ISR_RBE;
+    if (s->last_rba_is_full) {
+        return;
+    }
+
     /* Read memory */
     width = (s->regs[SONIC_DCR] & SONIC_DCR_DW) ? 2 : 1;
     size = sizeof(uint16_t) * 4 * width;
@@ -334,7 +341,7 @@ static void dp8393x_do_read_rra(dp8393xState *s)
         s->regs[SONIC_RRP] = s->regs[SONIC_RSA];
     }
 
-    /* Check resource exhaustion */
+    /* Warn the host if this entry is the last one */
     if (s->regs[SONIC_RRP] == s->regs[SONIC_RWP])
     {
         s->regs[SONIC_ISR] |= SONIC_ISR_RBE;
@@ -703,8 +710,9 @@ static int dp8393x_can_receive(NetClientState *nc)
 
     if (!(s->regs[SONIC_CR] & SONIC_CR_RXEN))
         return 0;
-    if (s->regs[SONIC_ISR] & SONIC_ISR_RBE)
+    if (s->last_rba_is_full) {
         return 0;
+    }
     return 1;
 }
 
-- 
2.23.0


