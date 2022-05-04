Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD19519CD3
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:22:23 +0200 (CEST)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmC9G-0005x7-8U
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBJ2-0000sX-TH
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:28:24 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBJ1-0004D8-5B
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:28:24 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHu-0002VG-BP; Wed, 04 May 2022 10:27:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:52 +0100
Message-Id: <20220504092600.10048-43-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 42/50] lasi: move from hw/hppa to hw/misc
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Move the LASI device implementation from hw/hppa to hw/misc so that it is
located with all the other miscellaneous devices.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 MAINTAINERS                         | 2 ++
 hw/hppa/Kconfig                     | 1 +
 hw/hppa/machine.c                   | 2 +-
 hw/hppa/meson.build                 | 2 +-
 hw/hppa/trace-events                | 5 -----
 hw/misc/Kconfig                     | 3 +++
 hw/{hppa => misc}/lasi.c            | 3 +--
 hw/misc/meson.build                 | 3 +++
 hw/misc/trace-events                | 5 +++++
 {hw/hppa => include/hw/misc}/lasi.h | 0
 10 files changed, 17 insertions(+), 9 deletions(-)
 rename hw/{hppa => misc}/lasi.c (99%)
 rename {hw/hppa => include/hw/misc}/lasi.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 07f85829b0..162a1732d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1114,7 +1114,9 @@ S: Odd Fixes
 F: configs/devices/hppa-softmmu/default.mak
 F: hw/hppa/
 F: hw/net/*i82596*
+F: hw/misc/lasi.c
 F: hw/pci-host/dino.c
+F: include/hw/misc/lasi.h
 F: include/hw/net/lasi_82596.h
 F: include/hw/pci-host/dino.h
 F: pc-bios/hppa-firmware.img
diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index 724380ecec..5dd8b5b21e 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -4,6 +4,7 @@ config HPPA_B160L
     imply E1000_PCI
     imply VIRTIO_VGA
     select DINO
+    select LASI
     select SERIAL
     select ISA_BUS
     select I8259
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 9d904b7a60..f3d72b4c35 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -22,7 +22,7 @@
 #include "hw/nmi.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/dino.h"
-#include "lasi.h"
+#include "hw/misc/lasi.h"
 #include "hppa_sys.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
diff --git a/hw/hppa/meson.build b/hw/hppa/meson.build
index a6f9db455c..bd5a1fb1d2 100644
--- a/hw/hppa/meson.build
+++ b/hw/hppa/meson.build
@@ -1,4 +1,4 @@
 hppa_ss = ss.source_set()
-hppa_ss.add(when: 'CONFIG_HPPA_B160L', if_true: files('pci.c', 'machine.c', 'lasi.c'))
+hppa_ss.add(when: 'CONFIG_HPPA_B160L', if_true: files('pci.c', 'machine.c'))
 
 hw_arch += {'hppa': hppa_ss}
diff --git a/hw/hppa/trace-events b/hw/hppa/trace-events
index 871a473771..1a4fbe2fa8 100644
--- a/hw/hppa/trace-events
+++ b/hw/hppa/trace-events
@@ -2,8 +2,3 @@
 
 # pci.c
 hppa_pci_iack_write(void) ""
-
-# lasi.c
-lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
-lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
-lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 507058d8bf..cbabe9f78c 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -171,4 +171,7 @@ config SIFIVE_U_PRCI
 config VIRT_CTRL
     bool
 
+config LASI
+    bool
+
 source macio/Kconfig
diff --git a/hw/hppa/lasi.c b/hw/misc/lasi.c
similarity index 99%
rename from hw/hppa/lasi.c
rename to hw/misc/lasi.c
index 5ef36f3f58..23a7634a8c 100644
--- a/hw/hppa/lasi.c
+++ b/hw/misc/lasi.c
@@ -17,10 +17,9 @@
 #include "hw/irq.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
-#include "hppa_sys.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
-#include "lasi.h"
+#include "hw/misc/lasi.h"
 
 
 static bool lasi_chip_mem_valid(void *opaque, hwaddr addr,
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 2ff05c7afa..132b7b7344 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -134,3 +134,6 @@ specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_cmgcr.c', 'mips_cp
 specific_ss.add(when: 'CONFIG_MIPS_ITU', if_true: files('mips_itu.c'))
 
 specific_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
+
+# HPPA devices
+softmmu_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 4e0c7973a4..c5e37b0154 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -263,3 +263,8 @@ virt_ctrl_write(void *dev, unsigned int addr, unsigned int size, uint64_t value)
 virt_ctrl_reset(void *dev) "ctrl: %p"
 virt_ctrl_realize(void *dev) "ctrl: %p"
 virt_ctrl_instance_init(void *dev) "ctrl: %p"
+
+# lasi.c
+lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
+lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+lasi_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
diff --git a/hw/hppa/lasi.h b/include/hw/misc/lasi.h
similarity index 100%
rename from hw/hppa/lasi.h
rename to include/hw/misc/lasi.h
-- 
2.20.1


