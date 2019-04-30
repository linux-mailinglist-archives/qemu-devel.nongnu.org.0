Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15060F10A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 09:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLN17-00073b-5h
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 03:17:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMya-0005eF-F0
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:14:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMyZ-0004EB-Gl
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:14:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38888)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLMyV-0004CQ-6C; Tue, 30 Apr 2019 03:14:47 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3038A2D7F5;
	Tue, 30 Apr 2019 07:14:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5F0C1001E85;
	Tue, 30 Apr 2019 07:14:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:37 +0200
Message-Id: <20190430071405.16714-3-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 30 Apr 2019 07:14:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 02/30] hw/ide/ahci: Add a Kconfig switch for
 the AHCI-ICH9 device
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some of our machines (like the ARM cubieboard) use CONFIG_AHCI for an AHC=
I
sysbus device, but do not use CONFIG_PCI since they do not feature a PCI
bus. With CONFIG_AHCI but without CONFIG_PCI, currently linking fails:

    ../hw/ide/ich.o: In function `pci_ich9_ahci_realize':
    hw/ide/ich.c:124: undefined reference to `pci_allocate_irq'
    hw/ide/ich.c:126: undefined reference to `pci_register_bar'
    hw/ide/ich.c:128: undefined reference to `pci_register_bar'
    hw/ide/ich.c:131: undefined reference to `pci_add_capability'
    hw/ide/ich.c:147: undefined reference to `msi_init'
    ../hw/ide/ich.o: In function `pci_ich9_uninit':
    hw/ide/ich.c:158: undefined reference to `msi_uninit'
    ../hw/ide/ich.o:(.data.rel+0x50): undefined reference to `vmstate_pci=
_device'

We must only compile ich.c if CONFIG_PCI is available, too, so introduce =
a
new config switch for this device.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ide/Kconfig       | 6 +++++-
 hw/ide/Makefile.objs | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index ab47b6a7a3..5d9106b1ac 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -43,10 +43,14 @@ config MICRODRIVE
     select IDE_QDEV
=20
 config AHCI
+    bool
+    select IDE_QDEV
+
+config AHCI_ICH9
     bool
     default y if PCI_DEVICES
     depends on PCI
-    select IDE_QDEV
+    select AHCI
=20
 config IDE_SII3112
     bool
diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
index a142add90e..faf04e0209 100644
--- a/hw/ide/Makefile.objs
+++ b/hw/ide/Makefile.objs
@@ -9,6 +9,6 @@ common-obj-$(CONFIG_IDE_MMIO) +=3D mmio.o
 common-obj-$(CONFIG_IDE_VIA) +=3D via.o
 common-obj-$(CONFIG_MICRODRIVE) +=3D microdrive.o
 common-obj-$(CONFIG_AHCI) +=3D ahci.o
-common-obj-$(CONFIG_AHCI) +=3D ich.o
+common-obj-$(CONFIG_AHCI_ICH9) +=3D ich.o
 common-obj-$(CONFIG_ALLWINNER_A10) +=3D ahci-allwinner.o
 common-obj-$(CONFIG_IDE_SII3112) +=3D sii3112.o
--=20
2.21.0


