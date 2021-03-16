Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25433E07A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:28:01 +0100 (CET)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHEO-0004Rc-C6
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3W-0006ko-66
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:46 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:54465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3U-0003yy-87
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:45 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MrQMz-1m1NHy2Jxn-00oakO; Tue, 16 Mar 2021 22:16:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/7] mac_via: fix 60Hz VIA1 timer interval
Date: Tue, 16 Mar 2021 22:16:30 +0100
Message-Id: <20210316211631.107417-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316211631.107417-1-laurent@vivier.eu>
References: <20210316211631.107417-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HbgICZv4D4bZYNo8jh+W+S1quxJqTIpWeJOrIqOpy0cfr97a6iB
 5nuWinov0fEo7uVWqSSe3Nwb1SfpORMzLqyIw9fVufK1uQGvHZr8b5292x8jRvtZxvmwPeh
 FLMdzu3Pj5TTymN1QWw6F2Rr71KtQ70JZCsgd6gSgqd0+7MgIlv5b4p0SUqrO7aSefleZTf
 FpcPQpqjPCjbFd+xGyHKA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uEgqoFJwNXI=:OZewy82OK+oMF4izKo1Nqo
 4jPEjdDMlp6SsgHZvf3h0Lw/eht/dsW7eCEGod+COR9caK1tPWyh11faHWjWt9xUe4FwYmyr7
 STFmbLnJjLlCzkABvdUkJgMXQyfKqHBFUbvFAe3k1o0fUiNXJrAsh/UVYYBl712k+xJrg+hOd
 +xmxDHt+u62KSnlZTxxd6I5sw8mUHmjxo0s2IA7PlSz8ehSK4TdwMP2pCTvX+L40G9XTjZ3Za
 fDbQE7RFUaoPMZrVqmcVUU90+bmPulCDUYSZXL+9QV3Mif/IaS6f77bZtrlFHNRZq6gw1ql73
 1bFj9yCUMjDSnr3mdCfnoygU8hxkuZL0GMtQfylAjeDJi2ba+AJlDZ/QVOImuJT56W19dIiOF
 9x7wtmel/T9IrqeEvhG8AiK2BAOG3xfmIpY0rOkf5PBymAJTmfNi+0QXhHwnZmihKk7XYKvoB
 3luoS/fkrg==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The 60Hz timer is initialised using timer_new_ns() meaning that the timer
interval should be measured in ns, and therefore its period is a thousand
times too short.

Use a define for the 60Hz timer period taking the more precise value as
documented in the Guide To The Macintosh Family Hardware.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20210311100505.22596-7-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/mac_via.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 9617e04f02ef..36e70674feda 100644
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
2.30.2


