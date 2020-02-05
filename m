Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A7E1526B4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 08:12:27 +0100 (CET)
Received: from localhost ([::1]:42148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izErK-0003y3-GP
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 02:12:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1izEnE-0001EN-35
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 02:08:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1izEn9-0000BV-Um
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 02:08:10 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:58670 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1izEn3-0007jO-2N; Wed, 05 Feb 2020 02:08:01 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3B49D1F9887F0D343EAF;
 Wed,  5 Feb 2020 15:07:53 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 5 Feb 2020 15:07:44 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH 1/3] armv7m_systick: delay timer_new to avoid memleaks
Date: Wed, 5 Feb 2020 15:06:57 +0800
Message-ID: <20200205070659.22488-2-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20200205070659.22488-1-pannengyuan@huawei.com>
References: <20200205070659.22488-1-pannengyuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.136]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Euler Robot <euler.robot@huawei.com>, Pan Nengyuan <pannengyuan@huawei.com>,
 zhang.zhanghailiang@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

There is a memory leak when we call 'device_list_properties' with typenam=
e =3D armv7m_systick. It's easy to reproduce as follow:

  virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-prope=
rties", "arguments": {"typename": "armv7m_systick"}}'

This patch delay timer_new to fix this memleaks.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Cc: qemu-arm@nongnu.org
---
 hw/timer/armv7m_systick.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 85d122dbcb..74c58bcf24 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -216,6 +216,11 @@ static void systick_instance_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &systick_ops, s, "systick", 0x=
e0);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
+}
+
+static void systick_realize(DeviceState *dev, Error **errp)
+{
+    SysTickState *s =3D SYSTICK(dev);
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s)=
;
 }
=20
@@ -238,6 +243,7 @@ static void systick_class_init(ObjectClass *klass, vo=
id *data)
=20
     dc->vmsd =3D &vmstate_systick;
     dc->reset =3D systick_reset;
+    dc->realize =3D systick_realize;
 }
=20
 static const TypeInfo armv7m_systick_info =3D {
--=20
2.21.0.windows.1



