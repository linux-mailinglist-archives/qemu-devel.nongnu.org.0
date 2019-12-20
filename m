Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958E12749A
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 05:29:47 +0100 (CET)
Received: from localhost ([::1]:50594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii9v8-0002cK-DZ
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 23:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9o1-0000c4-31
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9nz-0003PB-JT
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:24 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34448)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ii9nz-00020K-9q; Thu, 19 Dec 2019 23:22:23 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id DFF8B28D67; Thu, 19 Dec 2019 23:22:02 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <1367b9572494f04722aebcf4b90d3ff31b935ab1.1576815466.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1576815466.git.fthain@telegraphics.com.au>
References: <cover.1576815466.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 12/13] dp8393x: Always update RRA pointers and sequence
 numbers
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

These operations have to take place regardless of whether or not rx
descriptors have been used up (that is, EOL flag was observed).

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/net/dp8393x.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 6b69cca329..bd92fa28f6 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -893,12 +893,14 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
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
2.23.0


