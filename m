Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8C1420B9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 00:17:59 +0100 (CET)
Received: from localhost ([::1]:54976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itJpO-0000NW-2C
	for lists+qemu-devel@lfdr.de; Sun, 19 Jan 2020 18:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1itJfj-0004AU-KB
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 18:08:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1itJfh-0003mX-E0
 for qemu-devel@nongnu.org; Sun, 19 Jan 2020 18:07:59 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:54652)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1itJfh-0003k6-7O; Sun, 19 Jan 2020 18:07:57 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 0A10B2991B; Sun, 19 Jan 2020 18:07:55 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <9c3243048ebb89a2af674847c0570d0c84cc3e79.1579474761.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1579474761.git.fthain@telegraphics.com.au>
References: <cover.1579474761.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v3 03/14] dp8393x: Clean up endianness hacks
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

According to the datasheet, section 3.4.4, "in 32-bit mode ... the SONIC
always writes long words".

Therefore, use the same technique for the 'in_use' field that is used
everywhere else, and write the full long word.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Tested-by: Laurent Vivier <laurent@vivier.eu>
---
Changed since v1:
 - Use existing 'address' variable rather than declare a new one.

Laurent tells me that a similar clean-up has been tried before.
He referred me to commit c744cf7879 ("dp8393x: fix dp8393x_receive()")
and commit 409b52bfe1 ("net/dp8393x: correctly reset in_use field").
I believe the underlying issue has been fixed by the preceding patch,
as this no longer breaks NetBSD 5.1.
---
 hw/net/dp8393x.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index b2fd44bc2f..2d2ace2549 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -776,8 +776,6 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         return -1;
     }
 
-    /* XXX: Check byte ordering */
-
     /* Check for EOL */
     if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
         /* Are we still in resource exhaustion? */
@@ -847,15 +845,12 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         /* EOL detected */
         s->regs[SONIC_ISR] |= SONIC_ISR_RDE;
     } else {
-        /* Clear in_use, but it is always 16bit wide */
-        int offset = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
-        if (s->big_endian && width == 2) {
-            /* we need to adjust the offset of the 16bit field */
-            offset += sizeof(uint16_t);
-        }
-        s->data[0] = 0;
-        address_space_rw(&s->as, offset, MEMTXATTRS_UNSPECIFIED,
-                         (uint8_t *)s->data, sizeof(uint16_t), 1);
+        /* Clear in_use */
+        size = sizeof(uint16_t) * width;
+        address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
+        dp8393x_put(s, width, 0, 0);
+        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                         (uint8_t *)s->data, size, 1);
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
         s->regs[SONIC_ISR] |= SONIC_ISR_PKTRX;
         s->regs[SONIC_RSC] = (s->regs[SONIC_RSC] & 0xff00) | (((s->regs[SONIC_RSC] & 0x00ff) + 1) & 0x00ff);
-- 
2.24.1


