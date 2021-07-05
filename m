Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B63BC3C6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:51:12 +0200 (CEST)
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0WUh-0006Lu-BR
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WTQ-0004U7-04
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:49:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43336
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WTO-0006MD-G6
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:49:51 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WT2-0001ZF-Hk; Mon, 05 Jul 2021 22:49:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, jasowang@redhat.com, laurent@vivier.eu,
 fthain@linux-m68k.org, f4bug@amsat.org
Date: Mon,  5 Jul 2021 22:49:26 +0100
Message-Id: <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/4] dp8393x: don't force 32-bit register access
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" set .impl.min_access_size
and .impl.max_access_size to 4 to try and fix the Linux jazzsonic driver which uses
32-bit accesses.

The problem with forcing the register access to 32-bit in this way is that since the
dp8393x uses 16-bit registers, a manual endian swap is required for devices on big
endian machines with 32-bit accesses.

For both access sizes and machine endians the QEMU memory API can do the right thing
automatically: all that is needed is to set .impl.min_access_size to 2 to declare that
the dp8393x implements 16-bit registers.

Normally .impl.max_access_size should also be set to 2, however that doesn't quite
work in this case since the register stride is specified using a (dynamic) it_shift
property which is applied during the MMIO access itself. The effect of this is that
for a 32-bit access the memory API performs 2 x 16-bit accesses, but the use of
it_shift within the MMIO access itself causes the register value to be repeated in both
the top 16-bits and bottom 16-bits. The Linux jazzsonic driver expects the stride to be
zero-extended up to access size and therefore fails to correctly detect the dp8393x
device due to the extra data in the top 16-bits.

The solution here is to remove .impl.max_access_size so that the memory API will
correctly zero-extend the 16-bit registers to the access size up to and including
it_shift. Since it_shift is never greater than 2 than this will always do the right
thing for both 16-bit and 32-bit accesses regardless of the machine endian, allowing
the manual endian swap code to be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
---
 hw/net/dp8393x.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 11810c9b60..44a1955015 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -602,15 +602,14 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
 
     trace_dp8393x_read(reg, reg_names[reg], val, size);
 
-    return s->big_endian ? val << 16 : val;
+    return val;
 }
 
-static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
+static void dp8393x_write(void *opaque, hwaddr addr, uint64_t val,
                           unsigned int size)
 {
     dp8393xState *s = opaque;
     int reg = addr >> s->it_shift;
-    uint32_t val = s->big_endian ? data >> 16 : data;
 
     trace_dp8393x_write(reg, reg_names[reg], val, size);
 
@@ -691,11 +690,16 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
     }
 }
 
+/*
+ * Since .impl.max_access_size is effectively controlled by the it_shift
+ * property, leave it unspecified for now to allow the memory API to
+ * correctly zero extend the 16-bit register values to the access size up to and
+ * including it_shift.
+ */
 static const MemoryRegionOps dp8393x_ops = {
     .read = dp8393x_read,
     .write = dp8393x_write,
-    .impl.min_access_size = 4,
-    .impl.max_access_size = 4,
+    .impl.min_access_size = 2,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.20.1


