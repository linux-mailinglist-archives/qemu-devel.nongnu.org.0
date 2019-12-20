Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88361274A6
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 05:32:44 +0100 (CET)
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii9xz-0007kv-Vw
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 23:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55881)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9nh-0008UX-7Z
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9nf-00023M-K8
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:04 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34454)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ii9nf-00020y-0p; Thu, 19 Dec 2019 23:22:03 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id B1EDD28523; Thu, 19 Dec 2019 23:22:02 -0500 (EST)
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Message-Id: <7e4a17ec16270797b1d47042f95263c3dcbeea5a.1576815466.git.fthain@telegraphics.com.au>
In-Reply-To: <cover.1576815466.git.fthain@telegraphics.com.au>
References: <cover.1576815466.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 09/13] dp8393x: Use long-word-aligned RRA pointers in
 32-bit mode
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

Section 3.4.1 of the datasheet says,

    The alignment of the RRA is confined to either word or long word
    boundaries, depending upon the data width mode. In 16-bit mode,
    the RRA must be aligned to a word boundary (A0 is always zero)
    and in 32-bit mode, the RRA is aligned to a long word boundary
    (A0 and A1 are always zero).

This constraint has been implemented for 16-bit mode; implement it
for 32-bit mode too.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/net/dp8393x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index d722bbe8c1..a3936d3b7b 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -659,12 +659,16 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
                 qemu_flush_queued_packets(qemu_get_queue(s->nic));
             }
             break;
-        /* Ignore least significant bit */
+        /* The guest is required to store aligned pointers here */
         case SONIC_RSA:
         case SONIC_REA:
         case SONIC_RRP:
         case SONIC_RWP:
-            s->regs[reg] = data & 0xfffe;
+            if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
+                s->regs[reg] = data & 0xfffc;
+            } else {
+                s->regs[reg] = data & 0xfffe;
+            }
             break;
         /* Invert written value for some registers */
         case SONIC_CRCT:
-- 
2.23.0


