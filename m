Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29875D80D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 00:22:28 +0200 (CEST)
Received: from localhost ([::1]:57962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiRAR-0000Jz-Vi
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 18:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46224)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hiR6x-0006s5-Vm
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hiR6v-0002k6-UQ
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:51 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:44552
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hiR6r-0002EH-Oz
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 18:18:47 -0400
Received: from host109-146-132-17.range109-146.btcentralplus.com
 ([109.146.132.17] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1hiR3p-0004bu-2C; Tue, 02 Jul 2019 23:15:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 23:16:04 +0100
Message-Id: <20190702221606.21600-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190702221606.21600-1-mark.cave-ayland@ilande.co.uk>
References: <20190702221606.21600-1-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 109.146.132.17
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PULL 4/6] sunhme: flush any queued packets when
 HME_MAC_RXCFG_ENABLE bit is raised
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

Some client drivers use this bit to pause and resume the driver so make sure
that queued packets are flushed when the MAC is disabled and then reactivated.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/sunhme.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index e3a488ee1d..14e7effb88 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -373,10 +373,20 @@ static void sunhme_mac_write(void *opaque, hwaddr addr,
                           uint64_t val, unsigned size)
 {
     SunHMEState *s = SUNHME(opaque);
+    uint64_t oldval = s->macregs[addr >> 2];
 
     trace_sunhme_mac_write(addr, val);
 
     s->macregs[addr >> 2] = val;
+
+    switch (addr) {
+    case HME_MACI_RXCFG:
+        if (!(oldval & HME_MAC_RXCFG_ENABLE) &&
+             (val & HME_MAC_RXCFG_ENABLE)) {
+            qemu_flush_queued_packets(qemu_get_queue(s->nic));
+        }
+        break;
+    }
 }
 
 static uint64_t sunhme_mac_read(void *opaque, hwaddr addr,
-- 
2.11.0


