Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08D336F9C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:12:29 +0100 (CET)
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIIu-0004Pu-S7
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKICO-00060i-TJ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:46 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52310
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKICN-0004hi-72
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:44 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKICL-0001He-E5; Thu, 11 Mar 2021 10:05:44 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 11 Mar 2021 10:05:04 +0000
Message-Id: <20210311100505.22596-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
References: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 6/7] mac_via: fix 60Hz VIA1 timer interval
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

The 60Hz timer is initialised using timer_new_ns() meaning that the timer
interval should be measured in ns, and therefore its period is a thousand
times too short.

Use a define for the 60Hz timer period taking the more precise value as
documented in the Guide To The Macintosh Family Hardware.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index f994fefa7c..e7dd31f291 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -279,6 +279,12 @@
 #define VIA_TIMER_FREQ (783360)
 #define VIA_ADB_POLL_FREQ 50 /* XXX: not real */
 
+/*
+ * Guide to the Macintosh Family Hardware ch. 12 "Displays" p. 401 gives the
+ * precise 60Hz interrupt frequency as ~60.15Hz with a period of 16625.8 us
+ */
+#define VIA_60HZ_TIMER_PERIOD_NS   16625800
+
 /* VIA returns time offset from Jan 1, 1904, not 1970 */
 #define RTC_OFFSET 2082844800
 
@@ -302,8 +308,9 @@ static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
     MOS6522State *s = MOS6522(v1s);
 
     /* 60 Hz irq */
-    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
-                          16630 * 16630;
+    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+                          VIA_60HZ_TIMER_PERIOD_NS) /
+                          VIA_60HZ_TIMER_PERIOD_NS * VIA_60HZ_TIMER_PERIOD_NS;
 
     if (s->ier & VIA1_IRQ_60HZ) {
         timer_mod(v1s->sixty_hz_timer, v1s->next_sixty_hz);
-- 
2.20.1


