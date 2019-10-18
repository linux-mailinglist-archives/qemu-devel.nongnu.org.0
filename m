Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6A0DC64E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 15:40:12 +0200 (CEST)
Received: from localhost ([::1]:40144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLSUF-00036y-9a
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 09:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iLSQe-0007Kf-Qq
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iLSQd-0007mz-OA
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:36:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33644)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iLSQd-0007lm-Hq
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:36:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C33BA10CC1E6;
 Fri, 18 Oct 2019 13:36:26 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1C2F58B5;
 Fri, 18 Oct 2019 13:36:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] mc146818rtc: always register rtc to rtc list
Date: Fri, 18 Oct 2019 15:35:47 +0200
Message-Id: <20191018133547.10936-5-philmd@redhat.com>
In-Reply-To: <20191018133547.10936-1-philmd@redhat.com>
References: <20191018133547.10936-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Fri, 18 Oct 2019 13:36:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

We are not required anymore to use rtc_init() function.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Message-Id: <20171216090228.28505-5-hpoussin@reactos.org>
[PMD: rebased, fix OBJECT() value]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/mc146818rtc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
index 0c04b74c2e..8f7d3a9cdf 100644
--- a/hw/timer/mc146818rtc.c
+++ b/hw/timer/mc146818rtc.c
@@ -963,17 +963,16 @@ static void rtc_realizefn(DeviceState *dev, Error *=
*errp)
     object_property_add_tm(OBJECT(s), "date", rtc_get_date, NULL);
=20
     qdev_init_gpio_out(dev, &s->irq, 1);
+    QLIST_INSERT_HEAD(&rtc_devices, s, link);
 }
=20
 ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq interc=
ept_irq)
 {
     DeviceState *dev;
     ISADevice *isadev;
-    RTCState *s;
=20
     isadev =3D isa_create(bus, TYPE_MC146818_RTC);
     dev =3D DEVICE(isadev);
-    s =3D MC146818_RTC(isadev);
     qdev_prop_set_int32(dev, "base_year", base_year);
     qdev_init_nofail(dev);
     if (intercept_irq) {
@@ -981,9 +980,8 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_ye=
ar, qemu_irq intercept_irq)
     } else {
         isa_connect_gpio_out(isadev, 0, RTC_ISA_IRQ);
     }
-    QLIST_INSERT_HEAD(&rtc_devices, s, link);
=20
-    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(s),
+    object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(isa=
dev),
                               "date", NULL);
=20
     return isadev;
@@ -1015,8 +1013,6 @@ static void rtc_class_initfn(ObjectClass *klass, vo=
id *data)
     dc->reset =3D rtc_resetdev;
     dc->vmsd =3D &vmstate_rtc;
     dc->props =3D mc146818rtc_properties;
-    /* Reason: needs to be wired up by rtc_init() */
-    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo mc146818rtc_info =3D {
--=20
2.21.0


