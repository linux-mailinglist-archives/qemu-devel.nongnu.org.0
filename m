Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186911526AD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 08:10:17 +0100 (CET)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izEpE-00028m-5y
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 02:10:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1izEn9-0001DU-Uh
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 02:08:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1izEn3-0008Ka-Er
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 02:08:04 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:58672 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1izEn3-0007jS-24
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 02:08:01 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3377740340993C654414;
 Wed,  5 Feb 2020 15:07:53 +0800 (CST)
Received: from DESKTOP-9NTIQGG.china.huawei.com (10.173.221.136) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 5 Feb 2020 15:07:44 +0800
From: <pannengyuan@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [PATCH 2/3] stm32f2xx_timer: delay timer_new to avoid memleaks
Date: Wed, 5 Feb 2020 15:06:58 +0800
Message-ID: <20200205070659.22488-3-pannengyuan@huawei.com>
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
 zhang.zhanghailiang@huawei.com, Alistair
 Francis <alistair@alistair23.me>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pan Nengyuan <pannengyuan@huawei.com>

There is a memory leak when we call 'device_list_properties' with typenam=
e =3D stm32f2xx_timer. It's easy to reproduce as follow:

    virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-pro=
perties", "arguments": {"typename": "stm32f2xx_timer"}}'

This patch delay timer_new to fix this memleaks.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Cc: Alistair Francis <alistair@alistair23.me>
---
 hw/timer/stm32f2xx_timer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index fb370ce0f0..06ec8a02c2 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -314,7 +314,11 @@ static void stm32f2xx_timer_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &stm32f2xx_timer_ops, s,
                           "stm32f2xx_timer", 0x400);
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
+}
=20
+static void stm32f2xx_timer_realize(DeviceState *dev, Error **errp)
+{
+    STM32F2XXTimerState *s =3D STM32F2XXTIMER(dev);
     s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, stm32f2xx_timer_interr=
upt, s);
 }
=20
@@ -325,6 +329,7 @@ static void stm32f2xx_timer_class_init(ObjectClass *k=
lass, void *data)
     dc->reset =3D stm32f2xx_timer_reset;
     device_class_set_props(dc, stm32f2xx_timer_properties);
     dc->vmsd =3D &vmstate_stm32f2xx_timer;
+    dc->realize =3D stm32f2xx_timer_realize;
 }
=20
 static const TypeInfo stm32f2xx_timer_info =3D {
--=20
2.21.0.windows.1



