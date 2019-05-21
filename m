Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD06824816
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 08:32:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47327 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSyK8-0007e4-Rw
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 02:32:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHS-0005s5-K9
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hSyHR-0007gm-Db
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:29:46 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:53285)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hSyHQ-0007V4-EU; Tue, 21 May 2019 02:29:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 457Qpf1sPPz9sB8; Tue, 21 May 2019 16:29:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558420170;
	bh=wYkYWuH7ycMxiKGkoDj9ZRZOWZRg8x2Va/UMRnZg9lM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WbxQVwV53zZg7kRoijhiL1xrh2xkNhmo4jVQ5kR9uCovCaDCx8iDDZyARe3ijc4GC
	nOrKRz9ivXX5wapRIpEegbzqqlB8Sz6BLt5gjYO65PLIQCYl71OZJAvE0Jek/G0aoS
	qqTEl41nxRuFY4SeT1nlvpwZt8GdtR4t7ITy4Bqo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Tue, 21 May 2019 16:28:51 +1000
Message-Id: <20190521062924.6930-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190521062924.6930-1-david@gibson.dropbear.id.au>
References: <20190521062924.6930-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 05/38] hw/ppc/40p: Move the MC146818 RTC to the
 board where it belongs
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
Cc: lvivier@redhat.com, gkurz@kaod.org, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, clg@kaod.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The MC146818 RTC was incorrectly added to the i82378 chipset in
commit a04ff940974a. In the next commit (506b7ddf8893) the PReP
machine use the i82378.
Since the MC146818 is specific to the PReP machine, move its use
there.

Fixes: a04ff940974a
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190505152839.18650-3-philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/isa/i82378.c | 4 ----
 hw/ppc/prep.c   | 3 +++
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index a5d67bc6d7..c08970b24a 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -21,7 +21,6 @@
 #include "hw/pci/pci.h"
 #include "hw/i386/pc.h"
 #include "hw/timer/i8254.h"
-#include "hw/timer/mc146818rtc.h"
 #include "hw/audio/pcspk.h"
=20
 #define TYPE_I82378 "i82378"
@@ -105,9 +104,6 @@ static void i82378_realize(PCIDevice *pci, Error **er=
rp)
=20
     /* 2 82C37 (dma) */
     isa =3D isa_create_simple(isabus, "i82374");
-
-    /* timer */
-    isa_create_simple(isabus, TYPE_MC146818_RTC);
 }
=20
 static void i82378_init(Object *obj)
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index ebee321148..7a0d311d43 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -675,6 +675,9 @@ static void ibm_40p_init(MachineState *machine)
     qdev_prop_set_uint32(dev, "ram-size", machine->ram_size);
     qdev_init_nofail(dev);
=20
+    /* RTC */
+    isa_create_simple(isa_bus, TYPE_MC146818_RTC);
+
     /* initialize CMOS checksums */
     cmos_checksum =3D 0x6aa9;
     qbus_walk_children(BUS(isa_bus), prep_set_cmos_checksum, NULL, NULL,=
 NULL,
--=20
2.21.0


