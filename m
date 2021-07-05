Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1452C3BC3C9
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:52:26 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0WVt-0001jM-40
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WTY-0004so-2t
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:50:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43358
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WTW-0006Sp-Ff
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:49:59 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WTB-0001ZF-7u; Mon, 05 Jul 2021 22:49:41 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, jasowang@redhat.com, laurent@vivier.eu,
 fthain@linux-m68k.org, f4bug@amsat.org
Date: Mon,  5 Jul 2021 22:49:28 +0100
Message-Id: <20210705214929.17222-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/4] dp8393x: Store CAM registers as 16-bit
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Per the DP83932C datasheet from July 1995:

  4.0 SONIC Registers
  4.1 THE CAM UNIT

    The Content Addressable Memory (CAM) consists of sixteen
    48-bit entries for complete address filtering of network
    packets. Each entry corresponds to a 48-bit destination
    address that is user programmable and can contain any
    combination of Multicast or Physical addresses. Each entry
    is partitioned into three 16-bit CAM cells accessible
    through CAM Address Ports (CAP 2, CAP 1 and CAP 0) with
    CAP0 corresponding to the least significant 16 bits of
    the Destination Address and CAP2 corresponding to the
    most significant bits.

Store the CAM registers as 16-bit as it simplifies the code.
There is no change in the migration stream.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index cc7c001edb..22ceea338c 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -157,7 +157,7 @@ struct dp8393xState {
     MemoryRegion mmio;
 
     /* Registers */
-    uint8_t cam[16][6];
+    uint16_t cam[16][3];
     uint16_t regs[0x40];
 
     /* Temporaries */
@@ -280,15 +280,13 @@ static void dp8393x_do_load_cam(dp8393xState *s)
         address_space_read(&s->as, dp8393x_cdp(s),
                            MEMTXATTRS_UNSPECIFIED, s->data, size);
         index = dp8393x_get(s, width, 0) & 0xf;
-        s->cam[index][0] = dp8393x_get(s, width, 1) & 0xff;
-        s->cam[index][1] = dp8393x_get(s, width, 1) >> 8;
-        s->cam[index][2] = dp8393x_get(s, width, 2) & 0xff;
-        s->cam[index][3] = dp8393x_get(s, width, 2) >> 8;
-        s->cam[index][4] = dp8393x_get(s, width, 3) & 0xff;
-        s->cam[index][5] = dp8393x_get(s, width, 3) >> 8;
-        trace_dp8393x_load_cam(index, s->cam[index][0], s->cam[index][1],
-                               s->cam[index][2], s->cam[index][3],
-                               s->cam[index][4], s->cam[index][5]);
+        s->cam[index][0] = dp8393x_get(s, width, 1);
+        s->cam[index][1] = dp8393x_get(s, width, 2);
+        s->cam[index][2] = dp8393x_get(s, width, 3);
+        trace_dp8393x_load_cam(index,
+                               s->cam[index][0] >> 8, s->cam[index][0] & 0xff,
+                               s->cam[index][1] >> 8, s->cam[index][1] & 0xff,
+                               s->cam[index][2] >> 8, s->cam[index][2] & 0xff);
         /* Move to next entry */
         s->regs[SONIC_CDC]--;
         s->regs[SONIC_CDP] += size;
@@ -591,8 +589,7 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
     case SONIC_CAP1:
     case SONIC_CAP0:
         if (s->regs[SONIC_CR] & SONIC_CR_RST) {
-            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg) + 1] << 8;
-            val |= s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg)];
+            val = s->cam[s->regs[SONIC_CEP] & 0xf][2 * (SONIC_CAP0 - reg)];
         }
         break;
     /* All other registers have no special contraints */
@@ -990,7 +987,7 @@ static const VMStateDescription vmstate_dp8393x = {
     .version_id = 0,
     .minimum_version_id = 0,
     .fields = (VMStateField []) {
-        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 6),
+        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
         VMSTATE_UINT16_ARRAY(regs, dp8393xState, 0x40),
         VMSTATE_END_OF_LIST()
     }
-- 
2.20.1


