Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7DF519C7D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:02:13 +0200 (CEST)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBpk-0007Kt-LS
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIF-0008KD-Ug
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBI6-00044V-0i
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:27:27 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBGy-0002VG-Be; Wed, 04 May 2022 10:26:20 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:32 +0100
Message-Id: <20220504092600.10048-23-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 22/50] dino: move from hw/hppa to hw/pci-host
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

Move the DINO device implementation from hw/hppa to hw/pci-host so that it is
located with all the other PCI host bridges.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 MAINTAINERS                             | 2 ++
 hw/hppa/Kconfig                         | 2 +-
 hw/hppa/machine.c                       | 2 +-
 hw/hppa/meson.build                     | 2 +-
 hw/hppa/trace-events                    | 5 -----
 hw/pci-host/Kconfig                     | 4 ++++
 hw/{hppa => pci-host}/dino.c            | 3 +--
 hw/pci-host/meson.build                 | 3 +++
 hw/pci-host/trace-events                | 5 +++++
 {hw/hppa => include/hw/pci-host}/dino.h | 0
 10 files changed, 18 insertions(+), 10 deletions(-)
 rename hw/{hppa => pci-host}/dino.c (99%)
 rename {hw/hppa => include/hw/pci-host}/dino.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 294c88ace9..07f85829b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1114,7 +1114,9 @@ S: Odd Fixes
 F: configs/devices/hppa-softmmu/default.mak
 F: hw/hppa/
 F: hw/net/*i82596*
+F: hw/pci-host/dino.c
 F: include/hw/net/lasi_82596.h
+F: include/hw/pci-host/dino.h
 F: pc-bios/hppa-firmware.img
 
 M68K Machines
diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index 8d64ead217..724380ecec 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -3,7 +3,7 @@ config HPPA_B160L
     imply PCI_DEVICES
     imply E1000_PCI
     imply VIRTIO_VGA
-    select PCI
+    select DINO
     select SERIAL
     select ISA_BUS
     select I8259
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 4b753fa346..c847febe5d 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -17,7 +17,7 @@
 #include "hw/char/serial.h"
 #include "hw/net/lasi_82596.h"
 #include "hw/nmi.h"
-#include "dino.h"
+#include "hw/pci-host/dino.h"
 #include "hppa_sys.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
diff --git a/hw/hppa/meson.build b/hw/hppa/meson.build
index 32072bf204..a6f9db455c 100644
--- a/hw/hppa/meson.build
+++ b/hw/hppa/meson.build
@@ -1,4 +1,4 @@
 hppa_ss = ss.source_set()
-hppa_ss.add(when: 'CONFIG_HPPA_B160L', if_true: files('pci.c', 'machine.c', 'dino.c', 'lasi.c'))
+hppa_ss.add(when: 'CONFIG_HPPA_B160L', if_true: files('pci.c', 'machine.c', 'lasi.c'))
 
 hw_arch += {'hppa': hppa_ss}
diff --git a/hw/hppa/trace-events b/hw/hppa/trace-events
index 3f42be9056..871a473771 100644
--- a/hw/hppa/trace-events
+++ b/hw/hppa/trace-events
@@ -3,11 +3,6 @@
 # pci.c
 hppa_pci_iack_write(void) ""
 
-# dino.c
-dino_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
-dino_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
-dino_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
-
 # lasi.c
 lasi_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
 lasi_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 2b5f7d58cc..38fd2ee8f3 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -77,3 +77,7 @@ config MV64361
     bool
     select PCI
     select I8259
+
+config DINO
+    bool
+    select PCI
diff --git a/hw/hppa/dino.c b/hw/pci-host/dino.c
similarity index 99%
rename from hw/hppa/dino.c
rename to hw/pci-host/dino.c
index aa7f812e22..f257c24e64 100644
--- a/hw/hppa/dino.c
+++ b/hw/pci-host/dino.c
@@ -18,9 +18,8 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
-#include "dino.h"
+#include "hw/pci-host/dino.h"
 #include "migration/vmstate.h"
-#include "hppa_sys.h"
 #include "trace.h"
 #include "qom/object.h"
 
diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index 4c4f39c15c..c07596d0d1 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -25,6 +25,9 @@ pci_ss.add(when: 'CONFIG_MV64361', if_true: files('mv64361.c'))
 # ARM devices
 pci_ss.add(when: 'CONFIG_VERSATILE_PCI', if_true: files('versatile.c'))
 
+# HPPA devices
+pci_ss.add(when: 'CONFIG_DINO', if_true: files('dino.c'))
+
 softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
 specific_ss.add(when: 'CONFIG_PCI_POWERNV', if_true: files(
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index 6e5d8d3355..437e66ff50 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -34,3 +34,8 @@ unin_read(uint64_t addr, uint64_t value) "addr=0x%" PRIx64 " val=0x%"PRIx64
 pnv_phb4_xive_notify(uint64_t notif_port, uint64_t data) "notif=@0x%"PRIx64" data=0x%"PRIx64
 pnv_phb4_xive_notify_ic(uint64_t addr, uint64_t data) "addr=@0x%"PRIx64" data=0x%"PRIx64
 pnv_phb4_xive_notify_abt(uint64_t notif_port, uint64_t data) "notif=@0x%"PRIx64" data=0x%"PRIx64
+
+# dino.c
+dino_chip_mem_valid(uint64_t addr, uint32_t val) "access to addr 0x%"PRIx64" is %d"
+dino_chip_read(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
+dino_chip_write(uint64_t addr, uint32_t val) "addr 0x%"PRIx64" val 0x%08x"
diff --git a/hw/hppa/dino.h b/include/hw/pci-host/dino.h
similarity index 100%
rename from hw/hppa/dino.h
rename to include/hw/pci-host/dino.h
-- 
2.20.1


