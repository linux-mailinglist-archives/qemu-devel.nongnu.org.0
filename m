Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF0EBF617
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 17:42:26 +0200 (CEST)
Received: from localhost ([::1]:39606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDVuS-0000Yk-9U
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 11:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDVY4-0003bA-8c
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 11:19:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDVY1-0004yr-9v
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 11:19:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33982)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iDVXx-0004vd-37; Thu, 26 Sep 2019 11:19:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D80AE10DCC9D;
 Thu, 26 Sep 2019 15:18:59 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E7A15D6B0;
 Thu, 26 Sep 2019 15:18:52 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] hw/misc/vmcoreinfo: Convert reset handler to DeviceReset
Date: Thu, 26 Sep 2019 17:17:33 +0200
Message-Id: <20190926151733.25349-12-philmd@redhat.com>
In-Reply-To: <20190926151733.25349-1-philmd@redhat.com>
References: <20190926151733.25349-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 26 Sep 2019 15:18:59 +0000 (UTC)
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the reset handler into a proper Device reset method.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/vmcoreinfo.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/misc/vmcoreinfo.c b/hw/misc/vmcoreinfo.c
index 326a3ce8f4..a1c4847cdf 100644
--- a/hw/misc/vmcoreinfo.c
+++ b/hw/misc/vmcoreinfo.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
-#include "sysemu/reset.h"
 #include "hw/nvram/fw_cfg.h"
 #include "migration/vmstate.h"
 #include "hw/misc/vmcoreinfo.h"
@@ -26,7 +25,7 @@ static void fw_cfg_vmci_write(void *dev, off_t offset, =
size_t len)
         && s->vmcoreinfo.guest_format !=3D FW_CFG_VMCOREINFO_FORMAT_NONE=
;
 }
=20
-static void vmcoreinfo_reset(void *dev)
+static void vmcoreinfo_reset(DeviceState *dev)
 {
     VMCoreInfoState *s =3D VMCOREINFO(dev);
=20
@@ -61,7 +60,6 @@ static void vmcoreinfo_realize(DeviceState *dev, Error =
**errp)
                              NULL, fw_cfg_vmci_write, s,
                              &s->vmcoreinfo, sizeof(s->vmcoreinfo), fals=
e);
=20
-    qemu_register_reset(vmcoreinfo_reset, dev);
     vmcoreinfo_state =3D s;
 }
=20
@@ -84,6 +82,7 @@ static void vmcoreinfo_device_class_init(ObjectClass *k=
lass, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->vmsd =3D &vmstate_vmcoreinfo;
+    dc->reset =3D vmcoreinfo_reset;
     dc->realize =3D vmcoreinfo_realize;
     dc->hotpluggable =3D false;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
--=20
2.20.1


