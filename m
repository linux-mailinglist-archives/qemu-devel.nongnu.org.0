Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493901891E9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 00:25:45 +0100 (CET)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jELai-0001GO-BJ
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 19:25:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jELZ1-0007rM-Kv
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 19:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jELZ0-0000c3-Hm
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 19:23:59 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:60711)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jELZ0-0000WL-C0
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 19:23:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584487438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7dLqdiEes8H33sS8Bqku5/hNy1COftaI3m/4oCVcdlM=;
 b=iy435T67jxNp3sr8mh2/d2EPJjH/bieVbS20AL42rKWvU3SzvhEj2ZNrsGWXQNrdDZlKwJ
 j1EK52rZAM9Z2nb8qmxLi8U7kZ7pLZvl7WMJPHgmYl9I35dhzjJT7KbWjKr0nfeYkh4Ytl
 /kwn2fjyx8UbrH2QbAJRRyG380VsS5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-60kKBKIoPda8_xJP4XHmXg-1; Tue, 17 Mar 2020 19:23:53 -0400
X-MC-Unique: 60kKBKIoPda8_xJP4XHmXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B1F9801E5C;
 Tue, 17 Mar 2020 23:23:51 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 815DF60BE0;
 Tue, 17 Mar 2020 23:23:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/20] cmd646: register vmstate_ide_pci VMStateDescription in
 DeviceClass
Date: Tue, 17 Mar 2020 19:23:11 -0400
Message-Id: <20200317232329.22362-3-jsnow@redhat.com>
In-Reply-To: <20200317232329.22362-1-jsnow@redhat.com>
References: <20200317232329.22362-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Helge Deller <deller@gmx.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20200307151536.32709-3-mark.cave-ayland@ilande.co.uk
Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/ide/cmd646.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
index 2f11d8de24..3c4f765bd6 100644
--- a/hw/ide/cmd646.c
+++ b/hw/ide/cmd646.c
@@ -301,8 +301,6 @@ static void pci_cmd646_ide_realize(PCIDevice *dev, Erro=
r **errp)
         ide_register_restart_cb(&d->bus[i]);
     }
     g_free(irq);
-
-    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 }
=20
 static void pci_cmd646_ide_exitfn(PCIDevice *dev)
@@ -339,6 +337,7 @@ static void cmd646_ide_class_init(ObjectClass *klass, v=
oid *data)
     PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
=20
     dc->reset =3D cmd646_reset;
+    dc->vmsd =3D &vmstate_ide_pci;
     k->realize =3D pci_cmd646_ide_realize;
     k->exit =3D pci_cmd646_ide_exitfn;
     k->vendor_id =3D PCI_VENDOR_ID_CMD;
--=20
2.21.1


