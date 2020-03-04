Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3E617891E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 04:24:13 +0100 (CET)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9Kdn-00012q-RG
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 22:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1j9Kcq-0000Vu-RV
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 22:23:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1j9Kcp-0001do-Rv
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 22:23:12 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:46184)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1j9Kcp-0001Xm-Nf
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 22:23:11 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 79D522A49D;
 Tue,  3 Mar 2020 22:23:07 -0500 (EST)
Date: Wed, 4 Mar 2020 14:23:05 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Jason Wang <jasowang@redhat.com>
Subject: [PATCH] dp8393x: Mask EOL bit from descriptor addresses, take 2
Message-ID: <alpine.LNX.2.22.394.2003041421280.12@nippy.intranet>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A portion of a recent patch got lost due to a merge snafu. That patch is
now commit 88f632fbb1 ("dp8393x: Mask EOL bit from descriptor addresses").
This patch restores the portion that got lost.

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
---
 hw/net/dp8393x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 8a3504d962..81fc13ee9f 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -525,8 +525,8 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
                                  * (4 + 3 * s->regs[SONIC_TFC]),
                                MEMTXATTRS_UNSPECIFIED, s->data,
                                size);
-            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0) & ~0x1;
-            if (dp8393x_get(s, width, 0) & SONIC_DESC_EOL) {
+            s->regs[SONIC_CTDA] = dp8393x_get(s, width, 0);
+            if (s->regs[SONIC_CTDA] & SONIC_DESC_EOL) {
                 /* EOL detected */
                 break;
             }
-- 
2.24.1

