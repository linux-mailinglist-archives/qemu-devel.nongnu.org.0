Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE1317A00F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 07:40:37 +0100 (CET)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9kBQ-0005cB-Jv
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 01:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j9kAG-0003w0-1V
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 01:39:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j9kAE-0006be-VA
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 01:39:23 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3261 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j9kAE-0006Zo-Jx; Thu, 05 Mar 2020 01:39:22 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 80FCB12617C58EFDA6F7;
 Thu,  5 Mar 2020 14:39:20 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 5 Mar 2020 14:39:10 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 3/3] hw/misc/mos6522: move timer_new from init() into
 realize() to avoid memleaks
Date: Thu, 5 Mar 2020 14:54:22 +0800
Message-ID: <20200305065422.12707-4-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200305065422.12707-1-pannengyuan@huawei.com>
References: <20200305065422.12707-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Pan Nengyuan <pannengyuan@huawei.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Laurent
 Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org, euler.robot@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-ppc@nongnu.org
---
v2->v1:
- no changes in this patch.
v3->v2:
- remove null check in reset, and add calls to mos6522_realize() in mac_via_realize to make this move to be valid.
v4->v3:
- split patch into two, this patch fix the memleaks.
---
 hw/misc/mos6522.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
index 19e154b870..c1cd154a84 100644
--- a/hw/misc/mos6522.c
+++ b/hw/misc/mos6522.c
@@ -485,6 +485,11 @@ static void mos6522_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->timers); i++) {
         s->timers[i].index = i;
     }
+}
+
+static void mos6522_realize(DeviceState *dev, Error **errp)
+{
+    MOS6522State *s = MOS6522(dev);
 
     s->timers[0].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer1, s);
     s->timers[1].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, mos6522_timer2, s);
@@ -502,6 +507,7 @@ static void mos6522_class_init(ObjectClass *oc, void *data)
 
     dc->reset = mos6522_reset;
     dc->vmsd = &vmstate_mos6522;
+    dc->realize = mos6522_realize;
     device_class_set_props(dc, mos6522_properties);
     mdc->parent_reset = dc->reset;
     mdc->set_sr_int = mos6522_set_sr_int;
-- 
2.18.2


