Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58EF3BC3C8
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:52:23 +0200 (CEST)
Received: from localhost ([::1]:60364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0WVq-0001cs-Vx
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WTU-0004g4-0Q
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:49:56 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43346
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WTS-0006Oj-C9
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:49:55 -0400
Received: from host86-179-59-238.range86-179.btcentralplus.com
 ([86.179.59.238] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1m0WT7-0001ZF-4w; Mon, 05 Jul 2021 22:49:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, jasowang@redhat.com, laurent@vivier.eu,
 fthain@linux-m68k.org, f4bug@amsat.org
Date: Mon,  5 Jul 2021 22:49:27 +0100
Message-Id: <20210705214929.17222-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.59.238
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/4] dp8393x: Replace address_space_rw(is_write=1) by
 address_space_write()
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 44a1955015..cc7c001edb 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -820,8 +820,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
         size = sizeof(uint16_t) * width;
         address = dp8393x_crda(s) + sizeof(uint16_t) * 6 * width;
         dp8393x_put(s, width, 0, 0);
-        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-                         (uint8_t *)s->data, size, 1);
+        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                            (uint8_t *)s->data, size);
 
         /* Move to next descriptor */
         s->regs[SONIC_CRDA] = s->regs[SONIC_LLFA];
@@ -850,8 +850,8 @@ static ssize_t dp8393x_receive(NetClientState *nc, const uint8_t * buf,
     /* Pad short packets to keep pointers aligned */
     if (rx_len < padded_len) {
         size = padded_len - rx_len;
-        address_space_rw(&s->as, address, MEMTXATTRS_UNSPECIFIED,
-            (uint8_t *)"\xFF\xFF\xFF", size, 1);
+        address_space_write(&s->as, address, MEMTXATTRS_UNSPECIFIED,
+                            (uint8_t *)"\xFF\xFF\xFF", size);
         address += size;
     }
 
-- 
2.20.1


