Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7731232D0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 17:45:36 +0100 (CET)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihFyY-0004YB-TZ
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 11:45:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihFvm-0002WJ-UT
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 11:42:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihFvl-0004t6-Pt
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 11:42:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42220
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihFvl-0004sb-J9
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 11:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576600961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1q0+8G9RTWbeMkR4IbHhx3lZKW72mNyCaGGTfMLDypg=;
 b=KhjVgIQOJeERrHh59Uic7l81qFudpOo5sS4d4+09CI7s4jfg3Z9LukbP5jJxfjBAT5DNFe
 rprGpolUU0GQbQ0LeEqolPp8MkQt0A/CrTdFtlUAkFjzZozKu4SVACinhyT8+bjXvHFG2U
 4BAYA+qg3jnG+VLEHkq7zwfMj/Q2fh8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-FX8W9uU1OgGW6LcCMY_TFA-1; Tue, 17 Dec 2019 11:42:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62959593D8;
 Tue, 17 Dec 2019 16:42:31 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B4AF68865;
 Tue, 17 Dec 2019 16:42:07 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 08/14] hw/usb/redirect: Explicit we ignore few
 QEMUChrEvent in IOEventHandler
Date: Tue, 17 Dec 2019 17:38:02 +0100
Message-Id: <20191217163808.20068-9-philmd@redhat.com>
In-Reply-To: <20191217163808.20068-1-philmd@redhat.com>
References: <20191217163808.20068-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: FX8W9uU1OgGW6LcCMY_TFA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
 Li Zhijian <lizhijian@cn.fujitsu.com>, Paul Burton <pburton@wavecomp.com>,
 Jason Wang <jasowang@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alberto Garcia <berto@igalia.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Joel Stanley <joel@jms.id.au>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-riscv@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Chardev events are listed in the QEMUChrEvent enum. To be
able to use this enum in the IOEventHandler typedef, we need to
explicit when frontends ignore some events, to silent GCC the
following warnings:

    CC      hw/usb/redirect.o
  hw/usb/redirect.c: In function =E2=80=98usbredir_chardev_event=E2=80=99:
  hw/usb/redirect.c:1361:5: error: enumeration value =E2=80=98CHR_EVENT_BRE=
AK=E2=80=99 not handled in switch [-Werror=3Dswitch]
   1361 |     switch (event) {
        |     ^~~~~~
  hw/usb/redirect.c:1361:5: error: enumeration value =E2=80=98CHR_EVENT_MUX=
_IN=E2=80=99 not handled in switch [-Werror=3Dswitch]
  hw/usb/redirect.c:1361:5: error: enumeration value =E2=80=98CHR_EVENT_MUX=
_OUT=E2=80=99 not handled in switch [-Werror=3Dswitch]
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/redirect.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index e0f5ca6f81..acc376cc95 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -1370,6 +1370,9 @@ static void usbredir_chardev_event(void *opaque, int =
event)
         DPRINTF("chardev close\n");
         qemu_bh_schedule(dev->chardev_close_bh);
         break;
+    default:
+        /* Ignore */
+        break;
     }
 }
=20
--=20
2.21.0


