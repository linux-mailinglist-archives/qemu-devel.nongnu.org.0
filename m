Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A8B127492
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 05:26:25 +0100 (CET)
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii9rs-0005cH-40
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 23:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9ng-0008Tr-IA
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9ne-00020u-Tx
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:04 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34436)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ii9ne-0001y5-EA; Thu, 19 Dec 2019 23:22:02 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id 216B928CD6; Thu, 19 Dec 2019 23:22:02 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <6e980c3ffe0a9a1f4e112ad16b1003e1f620d0ca.1576815466.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1576815466.git.fthain@telegraphics.com.au>
References: <cover.1576815466.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 04/13] dp8393x: Update LLFA and CRDA registers from rx
 descriptor
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

Follow the algorithm given in the National Semiconductor DP83932C
datasheet in section 3.4.7:

    At the next reception, the SONIC re-reads the last RXpkt.link field,
    and updates its CRDA register to point to the next descriptor.

The chip is designed to allow the host to provide a new list of
descriptors in this way.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
Changed since v1:
 - Update CRDA register from LLFA register after EOL is cleared.
---
 hw/net/dp8393x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index a3e3a82ff4..1ead502a8f 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -773,12 +773,13 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         address = dp8393x_crda(s) + sizeof(uint16_t) * 5 * width;
         address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
                          (uint8_t *)s->data, size, 0);
-        if (dp8393x_get(s, width, 0) & SONIC_DESC_EOL) {
+        s->regs[SONIC_LLFA] = dp8393x_get(s, width, 0);
+        if (s->regs[SONIC_LLFA] & SONIC_DESC_EOL) {
             /* Still EOL ; stop reception */
             return -1;
-        } else {
-            s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
         }
+        /* Link has been updated by host */
+        s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
     }
 
     /* Save current position */
@@ -826,7 +827,7 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     address_space_rw(&s->as, dp8393x_crda(s),
         MEMTXATTRS_UNSPECIFIED, (uint8_t *)s->data, size, 1);
 
-    /* Move to next descriptor */
+    /* Check link field */
     size = sizeof(uint16_t) * width;
     address_space_rw(&s->as, dp8393x_crda(s) + sizeof(uint16_t) * 5 * width,
         MEMTXATTRS_UNSPECIFIED, (uint8_t *)s->data, size, 0);
@@ -841,6 +842,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         dp8393x_put(s, width, 0, 0);
         address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
                          (uint8_t *)s->data, size, 1);
+
+        /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
         s->regs[SONIC_ISR] |= SONIC_ISR_PKTRX;
         s->regs[SONIC_RSC] = (s->regs[SONIC_RSC] & 0xff00) | (((s->regs[SONIC_RSC] & 0x00ff) + 1) & 0x00ff);
-- 
2.23.0


