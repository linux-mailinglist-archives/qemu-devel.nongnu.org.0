Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F43170E84
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 03:37:00 +0100 (CET)
Received: from localhost ([::1]:52952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j792p-0001f8-6M
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 21:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j791R-0007wn-Jm
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 21:35:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j791Q-0001ah-Hb
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 21:35:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3171 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j791O-0001O6-4z; Wed, 26 Feb 2020 21:35:30 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 854A496A2BE4FCDFB2BD;
 Thu, 27 Feb 2020 10:35:26 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 10:35:19 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH v3 4/6] hw/arm/strongarm: move timer_new from init() into
 realize() to avoid memleaks
Date: Thu, 27 Feb 2020 10:50:53 +0800
Message-ID: <20200227025055.14341-5-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200227025055.14341-1-pannengyuan@huawei.com>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: euler.robot@huawei.com, qemu-arm@nongnu.org,
 Pan Nengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 hw/arm/strongarm.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index cd8a99aaf2..3010d765bb 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -399,9 +399,6 @@ static void strongarm_rtc_init(Object *obj)
     s->last_rcnr = (uint32_t) mktimegm(&tm);
     s->last_hz = qemu_clock_get_ms(rtc_clock);
 
-    s->rtc_alarm = timer_new_ms(rtc_clock, strongarm_rtc_alarm_tick, s);
-    s->rtc_hz = timer_new_ms(rtc_clock, strongarm_rtc_hz_tick, s);
-
     sysbus_init_irq(dev, &s->rtc_irq);
     sysbus_init_irq(dev, &s->rtc_hz_irq);
 
@@ -410,6 +407,13 @@ static void strongarm_rtc_init(Object *obj)
     sysbus_init_mmio(dev, &s->iomem);
 }
 
+static void strongarm_rtc_realize(DeviceState *dev, Error **errp)
+{
+    StrongARMRTCState *s = STRONGARM_RTC(dev);
+    s->rtc_alarm = timer_new_ms(rtc_clock, strongarm_rtc_alarm_tick, s);
+    s->rtc_hz = timer_new_ms(rtc_clock, strongarm_rtc_hz_tick, s);
+}
+
 static int strongarm_rtc_pre_save(void *opaque)
 {
     StrongARMRTCState *s = opaque;
@@ -451,6 +455,7 @@ static void strongarm_rtc_sysbus_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "StrongARM RTC Controller";
     dc->vmsd = &vmstate_strongarm_rtc_regs;
+    dc->realize = strongarm_rtc_realize;
 }
 
 static const TypeInfo strongarm_rtc_sysbus_info = {
@@ -1240,15 +1245,16 @@ static void strongarm_uart_init(Object *obj)
                           "uart", 0x10000);
     sysbus_init_mmio(dev, &s->iomem);
     sysbus_init_irq(dev, &s->irq);
-
-    s->rx_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_rx_to, s);
-    s->tx_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_tx, s);
 }
 
 static void strongarm_uart_realize(DeviceState *dev, Error **errp)
 {
     StrongARMUARTState *s = STRONGARM_UART(dev);
 
+    s->rx_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                       strongarm_uart_rx_to,
+                                       s);
+    s->tx_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, strongarm_uart_tx, s);
     qemu_chr_fe_set_handlers(&s->chr,
                              strongarm_uart_can_receive,
                              strongarm_uart_receive,
-- 
2.18.2


