Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C03F127AEC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 13:22:47 +0100 (CET)
Received: from localhost ([::1]:54324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiHIs-00012I-B5
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 07:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiGoN-0002WY-9j
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 06:51:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiGoM-0007h5-0P
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 06:51:15 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:45302)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iiGoL-0006YA-JS; Fri, 20 Dec 2019 06:51:13 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 31B2B96F50;
 Fri, 20 Dec 2019 11:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576842650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/q0xRzUUkwUJky1uH7feWGPJKonW4HvHlwDxIIr/bw=;
 b=ZkRA/p3usbPQEyIzgYHN1S8+QXdk1iltAf8UbefGef4tkysK6kev9t7Kb7idqbtq5hlrhF
 l9o+6+HPms802kaoiD9T5E9C76ysXDSEKIXCL1Q+85lJl5lkoXfcAwjEa82O++6689W0b9
 tWXfUuSOWrd6W4kwq4z8WMr9H4AuHDU=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/11] hw/s390x/ipl: replace deprecated qdev_reset_all
 registration
Date: Fri, 20 Dec 2019 12:50:35 +0100
Message-Id: <20191220115035.709876-12-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191220115035.709876-1-damien.hedde@greensocs.com>
References: <20191220115035.709876-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576842650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/q0xRzUUkwUJky1uH7feWGPJKonW4HvHlwDxIIr/bw=;
 b=ci4oHQD+yEyYscpLcrlX16nj8iEdqDH/vXSFes+bXYgVoulXZGuvycNCoDqVObmJrgRfRn
 4IrLPL3UrGz9B4Q71Yon9U+YxsblD9B1RDKzjfapCMgHE05BwBNIABjejNbo7xG/bPbQQi
 jct6tI/3uRCQlf7h9x/i3jFoS/jFOrk=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576842650; a=rsa-sha256; cv=none;
 b=ZzX5WK1ZyEdp7pnNZQNxRLw3UrF5sMe4L1f8aUWvmJi/otWwq9r1xHH+GZyaLsUtpp9f8q
 6jfbFrExro+oy9RbAuDdaKcH83xJNCMuedrlbDJWL8PzHoDeIKco/dPDboGw49H216ncb3
 dAoFReQwEpY9O2ySJA4Ak9p39gCckrU=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com, ehabkost@redhat.com,
 cohuck@redhat.com, mark.burton@greensocs.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, edgari@xilinx.com,
 pbonzini@redhat.com, philmd@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace deprecated qdev_reset_all by resettable_cold_reset_fn for
the ipl registration in the main reset handlers.

This does not impact the behavior for the following reasons:
+ at this point resettable just call the old reset methods of devices
  and buses in the same order than qdev/qbus.
+ resettable handlers registered with qemu_register_reset are
  serialized; there is no interleaving.
+ eventual explicit calls to legacy reset API (device_reset or
  qdev/qbus_reset) inside this reset handler will not be masked out
  by resettable mechanism; they do not go through resettable api.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-s390x@nongnu.org
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/ipl.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index ca544d64c5..2689f7a017 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -237,7 +237,15 @@ static void s390_ipl_realize(DeviceState *dev, Error=
 **errp)
      */
     ipl->compat_start_addr =3D ipl->start_addr;
     ipl->compat_bios_start_addr =3D ipl->bios_start_addr;
-    qemu_register_reset(qdev_reset_all_fn, dev);
+    /*
+     * Because this Device is not on any bus in the qbus tree (it is
+     * not a sysbus device and it's not on some other bus like a PCI
+     * bus) it will not be automatically reset by the 'reset the
+     * sysbus' hook registered by vl.c like most devices. So we must
+     * manually register a reset hook for it.
+     * TODO: there should be a better way to do this.
+     */
+    qemu_register_reset(resettable_cold_reset_fn, dev);
 error:
     error_propagate(errp, err);
 }
--=20
2.24.0


