Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D2CE5E84
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 20:13:14 +0200 (CEST)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOQYr-000249-4M
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 14:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iOQPR-0000lc-9f
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 14:03:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iOQPQ-0007Tz-4R
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 14:03:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:42979
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iOQPP-0007Tj-OT
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 14:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOd0udsusP6PV9SSkD8zKTkS3mLJ/h//I9mB8ltdC+8=;
 b=OqZQkHvCmg2NhmWGc9LT3/aTrpUgP9UTpRb7Ag5rKkLGrQQHySBAbeqKNJjJ37cf50IhE7
 JD7rVMly1L14XrzW1saNughHCAGmfiAElgmyPkAbmDNh2h7jwTd0WwgSR7qlowcpBH53Y9
 PDIwxNyAj1Kqh+W63PWPl8DuDCZh4R8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-uTTQ-BWHNRq0tavASywL-w-1; Sat, 26 Oct 2019 14:03:23 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A916107AD25;
 Sat, 26 Oct 2019 18:03:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C4E760C57;
 Sat, 26 Oct 2019 18:03:16 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/20] piix4: Add an i8254 PIT Controller as specified in
 datasheet
Date: Sat, 26 Oct 2019 20:01:30 +0200
Message-Id: <20191026180143.7369-8-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uTTQ-BWHNRq0tavASywL-w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Remove i8254 instanciated in malta board, to not have it twice.

Acked-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
Message-Id: <20171216090228.28505-10-hpoussin@reactos.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Fixed typo (thuth)
---
 hw/isa/piix4.c       | 4 ++++
 hw/mips/mips_malta.c | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9ebe98bdc3..c07a1e14a8 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -30,6 +30,7 @@
 #include "hw/isa/isa.h"
 #include "hw/sysbus.h"
 #include "hw/dma/i8257.h"
+#include "hw/timer/i8254.h"
 #include "migration/vmstate.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
@@ -168,6 +169,9 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     /* initialize ISA irqs */
     isa_bus_irqs(isa_bus, s->isa);
=20
+    /* initialize pit */
+    i8254_pit_init(isa_bus, 0x40, 0, NULL);
+
     /* DMA */
     i8257_dma_init(isa_bus, 0);
=20
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 44e5f8b26b..9af486c77c 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -45,7 +45,6 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "hw/rtc/mc146818rtc.h"
-#include "hw/timer/i8254.h"
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"             /* SysBusDevice */
 #include "qemu/host-utils.h"
@@ -99,8 +98,6 @@ typedef struct {
     qemu_irq i8259[ISA_NUM_IRQS];
 } MaltaState;
=20
-static ISADevice *pit;
-
 static struct _loaderparams {
     int ram_size, ram_low_size;
     const char *kernel_filename;
@@ -1428,7 +1425,6 @@ void mips_malta_init(MachineState *machine)
     pci_create_simple(pci_bus, piix4_devfn + 2, "piix4-usb-uhci");
     smbus =3D piix4_pm_init(pci_bus, piix4_devfn + 3, 0x1100,
                           isa_get_irq(NULL, 9), NULL, 0, NULL);
-    pit =3D i8254_pit_init(isa_bus, 0x40, 0, NULL);
     mc146818_rtc_init(isa_bus, 2000, NULL);
=20
     /* generate SPD EEPROM data */
--=20
2.21.0


