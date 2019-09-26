Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E34BF60C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 17:37:39 +0200 (CEST)
Received: from localhost ([::1]:39508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDVpp-0005SG-IE
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 11:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDVY4-0003bC-8y
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 11:19:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDVY1-0004zV-GH
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 11:19:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2497)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iDVXy-0004u2-4O; Thu, 26 Sep 2019 11:19:11 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 862EA7BDA5;
 Thu, 26 Sep 2019 15:18:52 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E206D5D6B0;
 Thu, 26 Sep 2019 15:18:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] hw/timer/etraxfs: Convert reset handler to DeviceReset
Date: Thu, 26 Sep 2019 17:17:32 +0200
Message-Id: <20190926151733.25349-11-philmd@redhat.com>
In-Reply-To: <20190926151733.25349-1-philmd@redhat.com>
References: <20190926151733.25349-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 26 Sep 2019 15:18:52 +0000 (UTC)
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the reset handler into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/etraxfs_timer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
index d62025b879..c2623ecd59 100644
--- a/hw/timer/etraxfs_timer.c
+++ b/hw/timer/etraxfs_timer.c
@@ -24,7 +24,6 @@
=20
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
-#include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -307,9 +306,9 @@ static const MemoryRegionOps timer_ops =3D {
     }
 };
=20
-static void etraxfs_timer_reset(void *opaque)
+static void etraxfs_timer_reset(DeviceState *dev)
 {
-    ETRAXTimerState *t =3D opaque;
+    ETRAXTimerState *t =3D ETRAX_TIMER(dev);
=20
     ptimer_stop(t->ptimer_t0);
     ptimer_stop(t->ptimer_t1);
@@ -338,13 +337,13 @@ static void etraxfs_timer_realize(DeviceState *dev,=
 Error **errp)
     memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
                           "etraxfs-timer", 0x5c);
     sysbus_init_mmio(sbd, &t->mmio);
-    qemu_register_reset(etraxfs_timer_reset, t);
 }
=20
 static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->reset =3D etraxfs_timer_reset;
     dc->realize =3D etraxfs_timer_realize;
 }
=20
--=20
2.20.1


