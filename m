Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FAF4400E6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:03:23 +0200 (CEST)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVHm-0002mO-Ky
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUvm-00074E-T6
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:39 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:51039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mgUve-0004oO-30
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E71CA7561D1;
 Fri, 29 Oct 2021 18:40:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7A62E75605F; Fri, 29 Oct 2021 18:40:26 +0200 (CEST)
Message-Id: <2752afeb6cc9faeaa73f704d97a2dab7ed702b9a.1635524617.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1635524616.git.balaton@eik.bme.hu>
References: <cover.1635524616.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v5 06/25] hw/char/sh_serial: Embed QEMUTimer in state struct
Date: Fri, 29 Oct 2021 18:23:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of allocating timer with timer_new store it directly in the
state struct. This makes it simpler to free it together with the device.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/char/sh_serial.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index bc5e0c4404..5ee93dc732 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -65,7 +65,7 @@ typedef struct {
     int rtrg;
 
     CharBackend chr;
-    QEMUTimer *fifo_timeout_timer;
+    QEMUTimer fifo_timeout_timer;
     uint64_t etu; /* Elementary Time Unit (ns) */
 
     qemu_irq eri;
@@ -353,11 +353,11 @@ static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
                 if (s->rx_cnt >= s->rtrg) {
                     s->flags |= SH_SERIAL_FLAG_RDF;
                     if (s->scr & (1 << 6) && s->rxi) {
-                        timer_del(s->fifo_timeout_timer);
+                        timer_del(&s->fifo_timeout_timer);
                         qemu_set_irq(s->rxi, 1);
                     }
                 } else {
-                    timer_mod(s->fifo_timeout_timer,
+                    timer_mod(&s->fifo_timeout_timer,
                         qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 15 * s->etu);
                 }
             }
@@ -427,8 +427,8 @@ void sh_serial_init(MemoryRegion *sysmem,
                                  sh_serial_event, NULL, s, NULL, true);
     }
 
-    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                         sh_serial_timeout_int, s);
+    timer_init_ns(&s->fifo_timeout_timer, QEMU_CLOCK_VIRTUAL,
+                  sh_serial_timeout_int, s);
     s->etu = NANOSECONDS_PER_SECOND / 9600;
     s->eri = eri_source;
     s->rxi = rxi_source;
-- 
2.21.4


