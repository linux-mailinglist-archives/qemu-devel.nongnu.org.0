Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5600214C844
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 10:42:54 +0100 (CET)
Received: from localhost ([::1]:43390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwjs5-0000ev-Ej
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 04:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjlO-0004LL-IA
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwjlN-0001Dl-Ff
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:35:58 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:50078)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1iwjlN-0000lO-BV; Wed, 29 Jan 2020 04:35:57 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id B1C6E299C6; Wed, 29 Jan 2020 04:35:35 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <1204caba37a4b63ab7b5fa37e316fba038a6ad25.1580290069.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1580290069.git.fthain@telegraphics.com.au>
References: <cover.1580290069.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v4 12/14] dp8393x: Always update RRA pointers and sequence
 numbers
Date: Wed, 29 Jan 2020 20:27:49 +1100
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These operations need to take place regardless of whether or not
rx descriptors have been used up (that is, EOL flag was observed).

The algorithm is now the same for a packet that was withheld as for
a packet that was not.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Tested-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/net/dp8393x.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 99c5dad7c4..1b73a8703b 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -897,12 +897,14 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
         s->regs[SONIC_ISR] |= SONIC_ISR_PKTRX;
-        s->regs[SONIC_RSC] = (s->regs[SONIC_RSC] & 0xff00) | (((s->regs[SONIC_RSC] & 0x00ff) + 1) & 0x00ff);
+    }
 
-        if (s->regs[SONIC_RCR] & SONIC_RCR_LPKT) {
-            /* Read next RRA */
-            dp8393x_do_read_rra(s);
-        }
+    s->regs[SONIC_RSC] = (s->regs[SONIC_RSC] & 0xff00) |
+                         ((s->regs[SONIC_RSC] + 1) & 0x00ff);
+
+    if (s->regs[SONIC_RCR] & SONIC_RCR_LPKT) {
+        /* Read next RRA */
+        dp8393x_do_read_rra(s);
     }
 
     /* Done */
-- 
2.24.1


