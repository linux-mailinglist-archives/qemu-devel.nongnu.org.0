Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E211EF91
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 02:36:55 +0100 (CET)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifwMZ-0005A2-0m
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 20:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41240)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifwEd-00041n-1R
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 20:28:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifwEb-000166-KG
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 20:28:42 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47368)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ifwEb-00014o-Fs; Fri, 13 Dec 2019 20:28:41 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id EAE5F227AE; Fri, 13 Dec 2019 20:28:40 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <7d220205700c43b15d6ae6cefd6520a97c763709.1576286757.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1576286757.git.fthain@telegraphics.com.au>
References: <cover.1576286757.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 01/10] dp8393x: Mask EOL bit from descriptor addresses
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

The LSB of descriptor address registers is used as an EOL flag.
It has to be masked when those registers are to be used as actual
addresses for copying memory around. But when the registers are
to be updated the EOL bit should not be masked.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/net/dp8393x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 3d991af163..164311c055 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -197,7 +197,7 @@ static uint32_t dp8393x_crba(dp8393xState *s)
 
 static uint32_t dp8393x_crda(dp8393xState *s)
 {
-    return (s->regs[SONIC_URDA] << 16) | s->regs[SONIC_CRDA];
+    return (s->regs[SONIC_URDA] << 16) | (s->regs[SONIC_CRDA] & 0xfffe);
 }
 
 static uint32_t dp8393x_rbwc(dp8393xState *s)
@@ -217,7 +217,7 @@ static uint32_t dp8393x_tsa(dp8393xState *s)
 
 static uint32_t dp8393x_ttda(dp8393xState *s)
 {
-    return (s->regs[SONIC_UTDA] << 16) | s->regs[SONIC_TTDA];
+    return (s->regs[SONIC_UTDA] << 16) | (s->regs[SONIC_TTDA] & 0xfffe);
 }
 
 static uint32_t dp8393x_wt(dp8393xState *s)
@@ -506,8 +506,8 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
                              sizeof(uint16_t) *
                              (4 + 3 * s->regs[SONIC_TFC]) * width,
                 MEMTXATTRS_UNSPECIFIED, (uint8_t *)s->data, size, 0);
-            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0) & ~0x1;
-            if (dp8393x_get(s, width, 0) & 0x1) {
+            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0);
+            if (s->regs[SONIC_CTDA] & 0x1) {
                 /* EOL detected */
                 break;
             }
-- 
2.23.0


