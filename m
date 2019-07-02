Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363ED5D80B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 00:22:24 +0200 (CEST)
Received: from localhost ([::1]:57958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiRAM-0000B2-Rt
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 18:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46047)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hiR6q-0006ov-Sh
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hiR6n-0002WF-OB
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:44 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:44564
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hiR6l-0002G1-BH
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:40 -0400
Received: from host109-146-132-17.range109-146.btcentralplus.com
 ([109.146.132.17] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hiR3p-0004bu-CE; Tue, 02 Jul 2019 23:15:39 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 23:16:05 +0100
Message-Id: <20190702221606.21600-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190702221606.21600-1-mark.cave-ayland@ilande.co.uk>
References: <20190702221606.21600-1-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 109.146.132.17
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PULL 5/6] sunhme: fix return values from
 sunhme_receive() during receive packet processing
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

The current return values in sunhme_receive() when processing incoming packets
are inverted from what they should be. Make sure that we return 0 to indicate
the packet was discarded (and polling is to be disabled) and -1 to indicate
that the packet was discarded but polling for incoming data is to be continued.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/sunhme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index 14e7effb88..cd076d642b 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -728,7 +728,7 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
 
     /* Do nothing if MAC RX disabled */
     if (!(s->macregs[HME_MACI_RXCFG >> 2] & HME_MAC_RXCFG_ENABLE)) {
-        return -1;
+        return 0;
     }
 
     trace_sunhme_rx_filter_destmac(buf[0], buf[1], buf[2],
@@ -757,14 +757,14 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
                 /* Didn't match hash filter */
                 trace_sunhme_rx_filter_hash_nomatch();
                 trace_sunhme_rx_filter_reject();
-                return 0;
+                return -1;
             } else {
                 trace_sunhme_rx_filter_hash_match();
             }
         } else {
             /* Not for us */
             trace_sunhme_rx_filter_reject();
-            return 0;
+            return -1;
         }
     } else {
         trace_sunhme_rx_filter_promisc_match();
-- 
2.11.0


