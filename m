Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6962CB837
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:12:02 +0100 (CET)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOB7-0004Pu-88
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNDE-0003cO-Hn
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCU-0003nO-S2
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpbvJW/SMDBxvm0PbHWGwM2LclD86UUF8ucPAfTPQ50=;
 b=Seg3/nh4QGseUAj39fDYZmyGoxPH7RbX+Bt7icyTGnwZ11bO4hxBl7gmsIX2vHAlRHaRgz
 P70pB8jrXoJxa2XRMAaUT3Eyp8oLkhsDis1SLYbzy5OSJnruTVzP+gYegsYJLprIi/ntYl
 mt9Tns4wWBbb6xSNM0dZJbHQx1mPeic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-T2K8urFEPMGi8XT1i6VvtA-1; Wed, 02 Dec 2020 03:09:19 -0500
X-MC-Unique: T2K8urFEPMGi8XT1i6VvtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63CFE1074641
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F6CE5D9C6
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 076/113] vl: extract softmmu/datadir.c
Date: Wed,  2 Dec 2020 03:08:12 -0500
Message-Id: <20201202080849.4125477-77-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/alpha/dp264.c        |   1 +
 hw/arm/boot.c           |   1 +
 hw/arm/digic_boards.c   |   1 +
 hw/arm/highbank.c       |   1 +
 hw/arm/npcm7xx_boards.c |   1 +
 hw/arm/sbsa-ref.c       |   1 +
 hw/arm/vexpress.c       |   1 +
 hw/arm/virt.c           |   1 +
 hw/avr/boot.c           |   1 +
 hw/core/loader.c        |   1 +
 hw/display/cg3.c        |   1 +
 hw/display/tcx.c        |   1 +
 hw/hppa/machine.c       |   1 +
 hw/i386/x86.c           |   1 +
 hw/lm32/milkymist.c     |   1 +
 hw/m68k/mcf5208.c       |   1 +
 hw/m68k/q800.c          |   1 +
 hw/microblaze/boot.c    |   1 +
 hw/mips/fuloong2e.c     |   1 +
 hw/mips/jazz.c          |   1 +
 hw/mips/malta.c         |   1 +
 hw/mips/mipssim.c       |   1 +
 hw/nios2/boot.c         |   1 +
 hw/nvram/fw_cfg.c       |   1 +
 hw/pci-host/prep.c      |   1 +
 hw/pci/pci.c            |   1 +
 hw/ppc/e500.c           |   1 +
 hw/ppc/mac_newworld.c   |   1 +
 hw/ppc/mac_oldworld.c   |   1 +
 hw/ppc/pnv.c            |   1 +
 hw/ppc/ppc405_boards.c  |   1 +
 hw/ppc/ppc440_bamboo.c  |   1 +
 hw/ppc/sam460ex.c       |   1 +
 hw/ppc/spapr.c          |   1 +
 hw/ppc/virtex_ml507.c   |   1 +
 hw/riscv/boot.c         |   1 +
 hw/s390x/ipl.c          |   1 +
 hw/sparc/leon3.c        |   1 +
 hw/sparc/sun4m.c        |   1 +
 hw/sparc64/sun4u.c      |   1 +
 include/qemu-common.h   |  21 -------
 include/qemu/datadir.h  |  28 +++++++++
 include/sysemu/sysemu.h |   2 -
 softmmu/datadir.c       | 129 ++++++++++++++++++++++++++++++++++++++++
 softmmu/meson.build     |   1 +
 softmmu/vl.c            |  95 +----------------------------
 tests/qtest/fuzz/fuzz.c |   1 +
 ui/keymaps.c            |   1 +
 48 files changed, 203 insertions(+), 115 deletions(-)
 create mode 100644 include/qemu/datadir.h
 create mode 100644 softmmu/datadir.c

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index c4d407a9f1..c8e300d93f 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -21,6 +21,7 @@
 #include "hw/dma/i8257.h"
 #include "net/net.h"
 #include "qemu/cutils.h"
+#include "qemu/datadir.h"
 #include "net/net.h"
 
 #define MAX_IDE_BUS 2
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index cf97600a91..4d9d47ba1c 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include <libfdt.h>
diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index fd228fa96f..be12873673 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/boards.h"
 #include "exec/address-spaces.h"
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index fd3429720e..bf7b8f4c64 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 9821013bc6..306260fa67 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -23,6 +23,7 @@
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "sysemu/sysemu.h"
 
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index c3a31f5b8b..b1fa3779d8 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 1adb663d77..ac098375c1 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9c54eea585..82cb9c95cf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -30,6 +30,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/option.h"
 #include "monitor/qdev.h"
diff --git a/hw/avr/boot.c b/hw/avr/boot.c
index d16bb3dbe1..cbede775ce 100644
--- a/hw/avr/boot.c
+++ b/hw/avr/boot.c
@@ -10,6 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "boot.h"
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 8bbb1797a4..fea22d265c 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -44,6 +44,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "trace.h"
 #include "hw/hw.h"
diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 42fcf40010..4b7e78d919 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "ui/console.h"
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index 3799d29b75..965f92ff6b 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "ui/console.h"
 #include "ui/pixel_ops.h"
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 7e41cb2462..f2b71db9bd 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -5,6 +5,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "elf.h"
 #include "hw/loader.h"
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 54c9d0c019..5d4b29052f 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -26,6 +26,7 @@
 #include "qemu/cutils.h"
 #include "qemu/units.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-visit-common.h"
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 93ca8bc2ac..72d1326531 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -21,6 +21,7 @@
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/irq.h"
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index 2205145ecc..7a03c71059 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -12,6 +12,7 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/irq.h"
 #include "hw/m68k/mcf.h"
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 6ebcddcfb2..4db2b9bbc7 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -23,6 +23,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/hw.h"
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index e1f56f83f9..6715ba2ff9 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -26,6 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 84a2132f85..45c596f4fe 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "cpu.h"
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index aa95c6a3d3..f9442731dd 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "hw/clock.h"
 #include "hw/mips/mips.h"
 #include "hw/mips/cpudevs.h"
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 467b21849e..5c11eecec1 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/clock.h"
 #include "hw/southbridge/piix.h"
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index cc9b0934b3..f2e6273525 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -28,6 +28,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/clock.h"
 #include "hw/mips/mips.h"
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 3cb864914b..95a8697906 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -31,6 +31,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 08539a1aab..9e80633d6e 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/dma.h"
 #include "sysemu/reset.h"
diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index d0323fefb1..0469db8c1d 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/pci/pci.h"
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 0131d9d02c..9424231542 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 153a74c98c..6a64eb31ab 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -16,6 +16,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "e500.h"
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 61c63819df..c0accda592 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -48,6 +48,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "hw/ppc/ppc.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 11623e8e67..04f98a4d81 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -26,6 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/ppc/ppc.h"
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 53a5121cab..14fc9758a9 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "sysemu/qtest.h"
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index c867e46330..b7249f21cf 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -26,6 +26,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/ppc/ppc.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 74028dc986..665bc1784e 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -15,6 +15,7 @@
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/error-report.h"
 #include "net/net.h"
 #include "hw/pci/pci.h"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 7e59a91981..14e6583eb0 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cd8be98caf..049efa0bbf 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -26,6 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index c790c1113f..7f1bca928c 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 70a9bf8f5d..d62f3dc758 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
 #include "exec/cpu-defs.h"
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index bddbaffac6..ff6b55e816 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -14,6 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qapi/error.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 1c50b02f81..4bc4ebea84 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -27,6 +27,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/irq.h"
 #include "qemu/timer.h"
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 0f9cd2bf52..8686371318 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "qemu/datadir.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 8bee7dd2f4..0fa13a7330 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -27,6 +27,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "cpu.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
diff --git a/include/qemu-common.h b/include/qemu-common.h
index fda7dc6ca7..654621444e 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -108,27 +108,6 @@ void qemu_progress_end(void);
 void qemu_progress_print(float delta, int max);
 const char *qemu_get_vm_name(void);
 
-#define QEMU_FILE_TYPE_BIOS   0
-#define QEMU_FILE_TYPE_KEYMAP 1
-/**
- * qemu_find_file:
- * @type: QEMU_FILE_TYPE_BIOS (for BIOS, VGA BIOS)
- *        or QEMU_FILE_TYPE_KEYMAP (for keymaps).
- * @name: Relative or absolute file name
- *
- * If @name exists on disk as an absolute path, or a path relative
- * to the current directory, then returns @name unchanged.
- * Otherwise searches for @name file in the data directories, either
- * configured at build time (DATADIR) or registered with the -L command
- * line option.
- *
- * The caller must use g_free() to free the returned data when it is
- * no longer required.
- *
- * Returns: a path that can access @name, or NULL if no matching file exists.
- */
-char *qemu_find_file(int type, const char *name);
-
 /* OS specific functions */
 void os_setup_early_signal_handling(void);
 int os_parse_cmd_args(int index, const char *optarg);
diff --git a/include/qemu/datadir.h b/include/qemu/datadir.h
new file mode 100644
index 0000000000..21f9097f58
--- /dev/null
+++ b/include/qemu/datadir.h
@@ -0,0 +1,28 @@
+#ifndef QEMU_DATADIR_H
+#define QEMU_DATADIR_H
+
+#define QEMU_FILE_TYPE_BIOS   0
+#define QEMU_FILE_TYPE_KEYMAP 1
+/**
+ * qemu_find_file:
+ * @type: QEMU_FILE_TYPE_BIOS (for BIOS, VGA BIOS)
+ *        or QEMU_FILE_TYPE_KEYMAP (for keymaps).
+ * @name: Relative or absolute file name
+ *
+ * If @name exists on disk as an absolute path, or a path relative
+ * to the current directory, then returns @name unchanged.
+ * Otherwise searches for @name file in the data directories, either
+ * configured at build time (DATADIR) or registered with the -L command
+ * line option.
+ *
+ * The caller must use g_free() to free the returned data when it is
+ * no longer required.
+ *
+ * Returns: a path that can access @name, or NULL if no matching file exists.
+ */
+char *qemu_find_file(int type, const char *name);
+void qemu_add_default_firmwarepath(void);
+void qemu_add_data_dir(char *path);
+void qemu_list_data_dirs(void);
+
+#endif
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 1336b4264a..c94b2e7159 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -13,8 +13,6 @@ extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
 extern bool qemu_uuid_set;
 
-void qemu_add_data_dir(char *path);
-
 void qemu_add_exit_notifier(Notifier *notify);
 void qemu_remove_exit_notifier(Notifier *notify);
 
diff --git a/softmmu/datadir.c b/softmmu/datadir.c
new file mode 100644
index 0000000000..504c4665be
--- /dev/null
+++ b/softmmu/datadir.c
@@ -0,0 +1,129 @@
+/*
+ * QEMU firmware and keymap file search
+ *
+ * Copyright (c) 2003-2020 QEMU contributors
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/datadir.h"
+#include "qemu/cutils.h"
+#include "trace.h"
+
+static const char *data_dir[16];
+static int data_dir_idx;
+
+char *qemu_find_file(int type, const char *name)
+{
+    int i;
+    const char *subdir;
+    char *buf;
+
+    /* Try the name as a straight path first */
+    if (access(name, R_OK) == 0) {
+        trace_load_file(name, name);
+        return g_strdup(name);
+    }
+
+    switch (type) {
+    case QEMU_FILE_TYPE_BIOS:
+        subdir = "";
+        break;
+    case QEMU_FILE_TYPE_KEYMAP:
+        subdir = "keymaps/";
+        break;
+    default:
+        abort();
+    }
+
+    for (i = 0; i < data_dir_idx; i++) {
+        buf = g_strdup_printf("%s/%s%s", data_dir[i], subdir, name);
+        if (access(buf, R_OK) == 0) {
+            trace_load_file(name, buf);
+            return buf;
+        }
+        g_free(buf);
+    }
+    return NULL;
+}
+
+void qemu_add_data_dir(char *path)
+{
+    int i;
+
+    if (path == NULL) {
+        return;
+    }
+    if (data_dir_idx == ARRAY_SIZE(data_dir)) {
+        return;
+    }
+    for (i = 0; i < data_dir_idx; i++) {
+        if (strcmp(data_dir[i], path) == 0) {
+            g_free(path); /* duplicate */
+            return;
+        }
+    }
+    data_dir[data_dir_idx++] = path;
+}
+
+/*
+ * Find a likely location for support files using the location of the binary.
+ * When running from the build tree this will be "$bindir/pc-bios".
+ * Otherwise, this is CONFIG_QEMU_DATADIR (possibly relocated).
+ *
+ * The caller must use g_free() to free the returned data when it is
+ * no longer required.
+ */
+static char *find_datadir(void)
+{
+    g_autofree char *dir = NULL;
+
+    dir = g_build_filename(qemu_get_exec_dir(), "pc-bios", NULL);
+    if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
+        return g_steal_pointer(&dir);
+    }
+
+    return get_relocated_path(CONFIG_QEMU_DATADIR);
+}
+
+void qemu_add_default_firmwarepath(void)
+{
+    char **dirs;
+    size_t i;
+
+    /* add configured firmware directories */
+    dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
+    for (i = 0; dirs[i] != NULL; i++) {
+        qemu_add_data_dir(get_relocated_path(dirs[i]));
+    }
+    g_strfreev(dirs);
+
+    /* try to find datadir relative to the executable path */
+    qemu_add_data_dir(find_datadir());
+}
+
+void qemu_list_data_dirs(void)
+{
+    int i;
+    for (i = 0; i < data_dir_idx; i++) {
+        printf("%s\n", data_dir[i]);
+    }
+}
diff --git a/softmmu/meson.build b/softmmu/meson.build
index 8f7210b4f0..7b52339e7a 100644
--- a/softmmu/meson.build
+++ b/softmmu/meson.build
@@ -3,6 +3,7 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
   'balloon.c',
   'cpus.c',
   'cpu-throttle.c',
+  'datadir.c',
   'physmem.c',
   'ioport.c',
   'memory.c',
diff --git a/softmmu/vl.c b/softmmu/vl.c
index dc8a47efcb..28aafc1101 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
@@ -128,8 +129,6 @@ typedef struct BlockdevOptionsQueueEntry {
 typedef QSIMPLEQ_HEAD(, BlockdevOptionsQueueEntry) BlockdevOptionsQueue;
 
 static const char *cpu_option;
-static const char *data_dir[16];
-static int data_dir_idx;
 static const char *mem_path;
 static const char *boot_order;
 static const char *boot_once;
@@ -1994,59 +1993,6 @@ static void parse_display(const char *p)
     }
 }
 
-char *qemu_find_file(int type, const char *name)
-{
-    int i;
-    const char *subdir;
-    char *buf;
-
-    /* Try the name as a straight path first */
-    if (access(name, R_OK) == 0) {
-        trace_load_file(name, name);
-        return g_strdup(name);
-    }
-
-    switch (type) {
-    case QEMU_FILE_TYPE_BIOS:
-        subdir = "";
-        break;
-    case QEMU_FILE_TYPE_KEYMAP:
-        subdir = "keymaps/";
-        break;
-    default:
-        abort();
-    }
-
-    for (i = 0; i < data_dir_idx; i++) {
-        buf = g_strdup_printf("%s/%s%s", data_dir[i], subdir, name);
-        if (access(buf, R_OK) == 0) {
-            trace_load_file(name, buf);
-            return buf;
-        }
-        g_free(buf);
-    }
-    return NULL;
-}
-
-void qemu_add_data_dir(char *path)
-{
-    int i;
-
-    if (path == NULL) {
-        return;
-    }
-    if (data_dir_idx == ARRAY_SIZE(data_dir)) {
-        return;
-    }
-    for (i = 0; i < data_dir_idx; i++) {
-        if (strcmp(data_dir[i], path) == 0) {
-            g_free(path); /* duplicate */
-            return;
-        }
-    }
-    data_dir[data_dir_idx++] = path;
-}
-
 static inline bool nonempty_str(const char *str)
 {
     return str && *str;
@@ -3187,26 +3133,6 @@ static void create_default_memdev(MachineState *ms, const char *path)
                             &error_fatal);
 }
 
-/*
- * Find a likely location for support files using the location of the binary.
- * When running from the build tree this will be "$bindir/pc-bios".
- * Otherwise, this is CONFIG_QEMU_DATADIR (possibly relocated).
- *
- * The caller must use g_free() to free the returned data when it is
- * no longer required.
- */
-static char *find_datadir(void)
-{
-    g_autofree char *dir = NULL;
-
-    dir = g_build_filename(qemu_get_exec_dir(), "pc-bios", NULL);
-    if (g_file_test(dir, G_FILE_TEST_IS_DIR)) {
-        return g_steal_pointer(&dir);
-    }
-
-    return get_relocated_path(CONFIG_QEMU_DATADIR);
-}
-
 static void qemu_validate_options(void)
 {
     QemuOpts *machine_opts = qemu_get_machine_opts();
@@ -3266,9 +3192,6 @@ static void qemu_process_sugar_options(void)
 
 static void qemu_process_early_options(void)
 {
-    char **dirs;
-    int i;
-
 #ifdef CONFIG_SECCOMP
     QemuOptsList *olist = qemu_find_opts_err("sandbox", NULL);
     if (olist) {
@@ -3306,21 +3229,11 @@ static void qemu_process_early_options(void)
         qemu_set_log(0);
     }
 
-    /* add configured firmware directories */
-    dirs = g_strsplit(CONFIG_QEMU_FIRMWAREPATH, G_SEARCHPATH_SEPARATOR_S, 0);
-    for (i = 0; dirs[i] != NULL; i++) {
-        qemu_add_data_dir(get_relocated_path(dirs[i]));
-    }
-    g_strfreev(dirs);
-
-    /* try to find datadir relative to the executable path */
-    qemu_add_data_dir(find_datadir());
+    qemu_add_default_firmwarepath();
 }
 
 static void qemu_process_help_options(void)
 {
-    int i;
-
     /*
      * Check for -cpu help and -device help before we call select_machine(),
      * which will return an error if the architecture has no default machine
@@ -3339,9 +3252,7 @@ static void qemu_process_help_options(void)
 
     /* -L help lists the data directories and exits. */
     if (list_data_dirs) {
-        for (i = 0; i < data_dir_idx; i++) {
-            printf("%s\n", data_dir[i]);
-        }
+        qemu_list_data_dirs();
         exit(0);
     }
 }
diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
index 7be7226bc0..238866a037 100644
--- a/tests/qtest/fuzz/fuzz.c
+++ b/tests/qtest/fuzz/fuzz.c
@@ -15,6 +15,7 @@
 
 #include <wordexp.h>
 
+#include "qemu/datadir.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
diff --git a/ui/keymaps.c b/ui/keymaps.c
index 4e5fca57a8..d4a647464b 100644
--- a/ui/keymaps.c
+++ b/ui/keymaps.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
+#include "qemu/datadir.h"
 #include "keymaps.h"
 #include "trace.h"
 #include "qemu/ctype.h"
-- 
2.26.2



