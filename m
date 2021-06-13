Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5073A59A7
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 18:41:44 +0200 (CEST)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsTB9-0006Gn-Ce
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 12:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7U-0006xn-6o
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 12:37:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41236
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7R-0001bj-8g
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 12:37:55 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lsT7G-0006x0-2t; Sun, 13 Jun 2021 17:37:42 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 jasowang@redhat.com
Date: Sun, 13 Jun 2021 17:37:36 +0100
Message-Id: <20210613163738.2141-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
References: <20210613163738.2141-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/5] dp8393x: fix PROM checksum and MAC address storage
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

The checksum used by MacOS to validate the PROM content is an exclusive-OR
rather than a sum over the corresponding bytes. In addition the MAC address
must be stored in bit-reversed format as indicated in comments in Linux's
macsonic.c.

With the PROM contents fixed MacOS starts to probe the device registers
when AppleTalk is enabled in the Control Panel.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index ea5b22f680..7c745d7963 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -173,6 +173,42 @@ struct dp8393xState {
     AddressSpace as;
 };
 
+/* Table lookup for bitrev8 */
+static const uint8_t byte_rev_table[256] = {
+    0x00, 0x80, 0x40, 0xc0, 0x20, 0xa0, 0x60, 0xe0,
+    0x10, 0x90, 0x50, 0xd0, 0x30, 0xb0, 0x70, 0xf0,
+    0x08, 0x88, 0x48, 0xc8, 0x28, 0xa8, 0x68, 0xe8,
+    0x18, 0x98, 0x58, 0xd8, 0x38, 0xb8, 0x78, 0xf8,
+    0x04, 0x84, 0x44, 0xc4, 0x24, 0xa4, 0x64, 0xe4,
+    0x14, 0x94, 0x54, 0xd4, 0x34, 0xb4, 0x74, 0xf4,
+    0x0c, 0x8c, 0x4c, 0xcc, 0x2c, 0xac, 0x6c, 0xec,
+    0x1c, 0x9c, 0x5c, 0xdc, 0x3c, 0xbc, 0x7c, 0xfc,
+    0x02, 0x82, 0x42, 0xc2, 0x22, 0xa2, 0x62, 0xe2,
+    0x12, 0x92, 0x52, 0xd2, 0x32, 0xb2, 0x72, 0xf2,
+    0x0a, 0x8a, 0x4a, 0xca, 0x2a, 0xaa, 0x6a, 0xea,
+    0x1a, 0x9a, 0x5a, 0xda, 0x3a, 0xba, 0x7a, 0xfa,
+    0x06, 0x86, 0x46, 0xc6, 0x26, 0xa6, 0x66, 0xe6,
+    0x16, 0x96, 0x56, 0xd6, 0x36, 0xb6, 0x76, 0xf6,
+    0x0e, 0x8e, 0x4e, 0xce, 0x2e, 0xae, 0x6e, 0xee,
+    0x1e, 0x9e, 0x5e, 0xde, 0x3e, 0xbe, 0x7e, 0xfe,
+    0x01, 0x81, 0x41, 0xc1, 0x21, 0xa1, 0x61, 0xe1,
+    0x11, 0x91, 0x51, 0xd1, 0x31, 0xb1, 0x71, 0xf1,
+    0x09, 0x89, 0x49, 0xc9, 0x29, 0xa9, 0x69, 0xe9,
+    0x19, 0x99, 0x59, 0xd9, 0x39, 0xb9, 0x79, 0xf9,
+    0x05, 0x85, 0x45, 0xc5, 0x25, 0xa5, 0x65, 0xe5,
+    0x15, 0x95, 0x55, 0xd5, 0x35, 0xb5, 0x75, 0xf5,
+    0x0d, 0x8d, 0x4d, 0xcd, 0x2d, 0xad, 0x6d, 0xed,
+    0x1d, 0x9d, 0x5d, 0xdd, 0x3d, 0xbd, 0x7d, 0xfd,
+    0x03, 0x83, 0x43, 0xc3, 0x23, 0xa3, 0x63, 0xe3,
+    0x13, 0x93, 0x53, 0xd3, 0x33, 0xb3, 0x73, 0xf3,
+    0x0b, 0x8b, 0x4b, 0xcb, 0x2b, 0xab, 0x6b, 0xeb,
+    0x1b, 0x9b, 0x5b, 0xdb, 0x3b, 0xbb, 0x7b, 0xfb,
+    0x07, 0x87, 0x47, 0xc7, 0x27, 0xa7, 0x67, 0xe7,
+    0x17, 0x97, 0x57, 0xd7, 0x37, 0xb7, 0x77, 0xf7,
+    0x0f, 0x8f, 0x4f, 0xcf, 0x2f, 0xaf, 0x6f, 0xef,
+    0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff,
+};
+
 /*
  * Accessor functions for values which are formed by
  * concatenating two 16 bit device registers. By putting these
@@ -996,11 +1032,8 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
     prom = memory_region_get_ram_ptr(&s->prom);
     checksum = 0;
     for (i = 0; i < 6; i++) {
-        prom[i] = s->conf.macaddr.a[i];
-        checksum += prom[i];
-        if (checksum > 0xff) {
-            checksum = (checksum + 1) & 0xff;
-        }
+        prom[i] = byte_rev_table[s->conf.macaddr.a[i]];
+        checksum ^= prom[i];
     }
     prom[7] = 0xff - checksum;
 }
-- 
2.20.1


