Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE511EF85
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 02:31:11 +0100 (CET)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifwGz-0005go-R8
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 20:31:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41470)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifwEd-00041s-SA
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 20:28:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifwEc-00018M-Ad
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 20:28:43 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47372)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ifwEc-00014s-3r; Fri, 13 Dec 2019 20:28:42 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 04B54230A5; Fri, 13 Dec 2019 20:28:40 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <397259001f92f93620a618e83599463b1faa54ee.1576286757.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1576286757.git.fthain@telegraphics.com.au>
References: <cover.1576286757.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 02/10] dp8393x: Clean up endianness hacks
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

The in_use field is no different to the other words handled using
dp8393x_put() and dp8393x_get(). Use the same technique for in_use
that is used everywhere else.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
Laurent tells me that this clean-up has been tried before. He referred
me to commit c744cf7879 ("dp8393x: fix dp8393x_receive()") and
commit 409b52bfe1 ("net/dp8393x: correctly reset in_use field").

Both of those patches look wrong to me because they both pass the wrong
byte count to address_space_rw(). It's possible that those patches were
needed to work around some kind of bug elsewhere, for example, an
off-by-one result from dp8393x_crda(). The preceding patch in this series
might help there.

This needs testing with the little endian MIPS Jazz emulation.
---
 hw/net/dp8393x.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 164311c055..3fd59bc1d4 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -760,8 +760,6 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         return -1;
     }
 
-    /* XXX: Check byte ordering */
-
     /* Check for EOL */
     if (s->regs[SONIC_LLFA] & 0x1) {
         /* Are we still in resource exhaustion? */
@@ -831,15 +829,12 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         /* EOL detected */
         s->regs[SONIC_ISR] |= SONIC_ISR_RDE;
     } else {
-        /* Clear in_use, but it is always 16bit wide */
+        /* Clear in_use */
         int offset = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
-        if (s->big_endian && width == 2) {
-            /* we need to adjust the offset of the 16bit field */
-            offset += sizeof(uint16_t);
-        }
-        s->data[0] = 0;
+        size = sizeof(uint16_t) * width;
+        dp8393x_put(s, width, 0, 0);
         address_space_rw(&s->as, offset, MEMTXATTRS_UNSPECIFIED,
-                         (uint8_t *)s->data, sizeof(uint16_t), 1);
+                         (uint8_t *)s->data, size, 1);
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
         s->regs[SONIC_ISR] |= SONIC_ISR_PKTRX;
         s->regs[SONIC_RSC] = (s->regs[SONIC_RSC] & 0xff00) | (((s->regs[SONIC_RSC] & 0x00ff) + 1) & 0x00ff);
-- 
2.23.0


