Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60843127497
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 05:28:32 +0100 (CET)
Received: from localhost ([::1]:50584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii9tv-0001Nw-5u
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 23:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9ng-0008U3-NO
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9nf-00022P-8s
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:04 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34450)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ii9nf-00020I-09; Thu, 19 Dec 2019 23:22:03 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 409D628D32; Thu, 19 Dec 2019 23:22:02 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <8f8d4dcf6323eb4fe8535914772053c0857f0e5e.1576815466.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1576815466.git.fthain@telegraphics.com.au>
References: <cover.1576815466.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 06/13] dp8393x: Implement packet size limit and RBAE
 interrupt
Date: Fri, 20 Dec 2019 15:17:46 +1100
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

Add a bounds check to prevent a large packet from causing a buffer
overflow. This is defensive programming -- I haven't actually tried
sending an oversized packet or a jumbo ethernet frame.

The SONIC handles packets that are too big for the buffer by raising
the RBAE interrupt and dropping them. Linux uses that interrupt to
count dropped packets.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
Changed since v1:
 - Perform length check after Recieve Control Register initialization.
---
 hw/net/dp8393x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 593853244d..9d2c205dce 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -137,6 +137,7 @@ do { printf("sonic ERROR: %s: " fmt, __func__ , ## __VA_ARGS__); } while (0)
 #define SONIC_TCR_CRCI   0x2000
 #define SONIC_TCR_PINT   0x8000
 
+#define SONIC_ISR_RBAE   0x0010
 #define SONIC_ISR_RBE    0x0020
 #define SONIC_ISR_RDE    0x0040
 #define SONIC_ISR_TC     0x0080
@@ -759,6 +760,14 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     s->regs[SONIC_RCR] &= ~(SONIC_RCR_PRX | SONIC_RCR_LBK | SONIC_RCR_FAER |
         SONIC_RCR_CRCR | SONIC_RCR_LPKT | SONIC_RCR_BC | SONIC_RCR_MC);
 
+    if (pkt_size + 4 > dp8393x_rbwc(s) * 2) {
+        DPRINTF("oversize packet, pkt_size is %d\n", pkt_size);
+        s->regs[SONIC_ISR] |= SONIC_ISR_RBAE;
+        dp8393x_update_irq(s);
+        dp8393x_do_read_rra(s);
+        return pkt_size;
+    }
+
     packet_type = dp8393x_receive_filter(s, buf, pkt_size);
     if (packet_type < 0) {
         DPRINTF("packet not for netcard\n");
-- 
2.23.0


