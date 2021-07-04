Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A63BADAB
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 17:28:38 +0200 (CEST)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m042v-00086x-Eo
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 11:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0429-0007Sk-I7
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 11:27:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41698
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0427-00025P-Ss
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 11:27:49 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m041m-0004ZC-2H; Sun, 04 Jul 2021 16:27:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, jasowang@redhat.com, laurent@vivier.eu,
 fthain@linux-m68k.org, f4bug@amsat.org
Date: Sun,  4 Jul 2021 16:27:39 +0100
Message-Id: <20210704152739.18213-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3] dp8393x: don't force 32-bit register access
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

Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that all accesses
to the registers were 32-bit but this is actually not the case. The access size is
determined by the CPU instruction used and not the number of physical address lines.

The big_endian workaround applied to the register read/writes was actually caused
by forcing the access size to 32-bit when the guest OS was using a 16-bit access.
Since the registers are 16-bit then we can simply set .impl.min_access and
.impl.max_accessto 2 and then the memory API will automatically do the right thing
for both 16-bit accesses used by Linux and 32-bit accesses used by the MacOS toolbox
ROM.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
---
 hw/net/dp8393x.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 11810c9b60..d16ade2b19 100644
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
 
@@ -694,8 +693,8 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
 static const MemoryRegionOps dp8393x_ops = {
     .read = dp8393x_read,
     .write = dp8393x_write,
-    .impl.min_access_size = 4,
-    .impl.max_access_size = 4,
+    .impl.min_access_size = 2,
+    .impl.max_access_size = 2,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.20.1


