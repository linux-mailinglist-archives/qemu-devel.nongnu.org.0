Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7533D4D32
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 13:07:17 +0200 (CEST)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7byV-0008OG-Og
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 07:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m7bxf-0007iE-L1
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 07:06:23 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43688
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m7bxc-0003Eb-3K
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 07:06:23 -0400
Received: from host86-145-86-143.range86-145.btcentralplus.com
 ([86.145.86.143] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m7bxO-0005Bq-36; Sun, 25 Jul 2021 12:06:10 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, f4bug@amsat.org, laurent@vivier.eu
Date: Sun, 25 Jul 2021 12:05:57 +0100
Message-Id: <20210725110557.3007-1-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.145.86.143
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH for-6.1?] bitops.h: revert db1ffc32dd ("qemu/bitops.h: add
 bitrev8 implementation")
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

Commit db1ffc32dd ("qemu/bitops.h: add bitrev8 implementation") introduced a
bitrev8() function to reverse the bit ordering required for storing the MAC
address in the q800 PROM.

This function is not required since QEMU implements its own revbit8() function
which does exactly the same thing. Remove the extraneous bitrev8() function and
switch its only caller in hw/m68k/q800.c to use revbit8() instead.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c        |  2 +-
 include/qemu/bitops.h | 22 ----------------------
 2 files changed, 1 insertion(+), 23 deletions(-)

---
I picked this up reading the loongarch thread where I realised that QEMU
already has a revbit8() function - I was searching for bitrev8() before
deciding that this needed to be added since this was the name of the equivalent
function in Linux.

I think this is a good candidate for 6.1 still because a) it only has 1 caller
which is easy for me to test and b) it prevents anyone else coming along and
accidentally using it later.

MCA. 

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 6817c8b5d1..ac0a13060b 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -334,7 +334,7 @@ static void q800_init(MachineState *machine)
     prom = memory_region_get_ram_ptr(dp8393x_prom);
     checksum = 0;
     for (i = 0; i < 6; i++) {
-        prom[i] = bitrev8(nd_table[0].macaddr.a[i]);
+        prom[i] = revbit8(nd_table[0].macaddr.a[i]);
         checksum ^= prom[i];
     }
     prom[7] = 0xff - checksum;
diff --git a/include/qemu/bitops.h b/include/qemu/bitops.h
index 110c56e099..03213ce952 100644
--- a/include/qemu/bitops.h
+++ b/include/qemu/bitops.h
@@ -618,26 +618,4 @@ static inline uint64_t half_unshuffle64(uint64_t x)
     return x;
 }
 
-/**
- * bitrev8:
- * @x: 8-bit value to be reversed
- *
- * Given an input value with bits::
- *
- *   ABCDEFGH
- *
- * return the value with its bits reversed from left to right::
- *
- *   HGFEDCBA
- *
- * Returns: the bit-reversed value.
- */
-static inline uint8_t bitrev8(uint8_t x)
-{
-    x = ((x >> 1) & 0x55) | ((x << 1) & 0xaa);
-    x = ((x >> 2) & 0x33) | ((x << 2) & 0xcc);
-    x = (x >> 4) | (x << 4) ;
-    return x;
-}
-
 #endif
-- 
2.20.1


