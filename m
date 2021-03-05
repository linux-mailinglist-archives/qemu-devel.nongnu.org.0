Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2829932EE25
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:15:23 +0100 (CET)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICAk-0002yC-2w
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwQ-000274-Fd
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:59946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lIBwI-00042G-GI
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:00:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4521EAF1B;
 Fri,  5 Mar 2021 14:59:57 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v4 28/33] target/arm: move kvm-const.h, kvm.c, kvm64.c,
 kvm_arm.h to kvm/
Date: Fri,  5 Mar 2021 15:59:36 +0100
Message-Id: <20210305145941.32020-29-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305145941.32020-1-cfontana@suse.de>
References: <20210305145941.32020-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@centriq4.arch.suse.de>

and adapt the code including the header references,
and trace-events / trace.h

Signed-off-by: Claudio Fontana <cfontana@centriq4.arch.suse.de>
---
 meson.build                       |  2 +-
 target/arm/cpu.h                  |  2 +-
 target/arm/{ => kvm}/kvm-consts.h |  0
 target/arm/{ => kvm}/kvm_arm.h    |  0
 target/arm/kvm/trace.h            |  1 +
 target/arm/trace.h                |  1 -
 hw/arm/sbsa-ref.c                 |  2 +-
 hw/arm/virt-acpi-build.c          |  2 +-
 hw/arm/virt.c                     |  2 +-
 hw/arm/xlnx-versal.c              |  2 +-
 hw/arm/xlnx-zynqmp.c              |  2 +-
 hw/cpu/a15mpcore.c                |  2 +-
 hw/intc/arm_gic_kvm.c             |  2 +-
 hw/intc/arm_gicv3_its_kvm.c       |  2 +-
 hw/intc/arm_gicv3_kvm.c           |  2 +-
 target/arm/cpu-sysemu.c           |  2 +-
 target/arm/cpu.c                  |  2 +-
 target/arm/cpu32.c                |  2 +-
 target/arm/cpu64.c                |  2 +-
 target/arm/kvm-stub.c             | 24 ------------------------
 target/arm/{ => kvm}/kvm.c        |  0
 target/arm/{ => kvm}/kvm64.c      |  0
 target/arm/machine.c              |  2 +-
 target/arm/monitor.c              |  2 +-
 target/arm/tcg/sysemu/tcg-cpu.c   |  1 -
 MAINTAINERS                       |  2 +-
 target/arm/kvm/meson.build        |  5 +++++
 target/arm/{ => kvm}/trace-events |  0
 target/arm/meson.build            |  2 --
 29 files changed, 24 insertions(+), 46 deletions(-)
 rename target/arm/{ => kvm}/kvm-consts.h (100%)
 rename target/arm/{ => kvm}/kvm_arm.h (100%)
 create mode 100644 target/arm/kvm/trace.h
 delete mode 100644 target/arm/trace.h
 delete mode 100644 target/arm/kvm-stub.c
 rename target/arm/{ => kvm}/kvm.c (100%)
 rename target/arm/{ => kvm}/kvm64.c (100%)
 rename target/arm/{ => kvm}/trace-events (100%)

diff --git a/meson.build b/meson.build
index 86b07f1a1a..41dc367758 100644
--- a/meson.build
+++ b/meson.build
@@ -1827,8 +1827,8 @@ if have_system or have_user
   trace_events_subdirs += [
     'accel/tcg',
     'hw/core',
-    'target/arm',
     'target/arm/tcg',
+    'target/arm/kvm',
     'target/hppa',
     'target/i386',
     'target/i386/kvm',
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4dd26c598a..ed5b442aba 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -20,7 +20,7 @@
 #ifndef ARM_CPU_H
 #define ARM_CPU_H
 
-#include "kvm-consts.h"
+#include "kvm/kvm-consts.h"
 #include "hw/registerfields.h"
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
diff --git a/target/arm/kvm-consts.h b/target/arm/kvm/kvm-consts.h
similarity index 100%
rename from target/arm/kvm-consts.h
rename to target/arm/kvm/kvm-consts.h
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm/kvm_arm.h
similarity index 100%
rename from target/arm/kvm_arm.h
rename to target/arm/kvm/kvm_arm.h
diff --git a/target/arm/kvm/trace.h b/target/arm/kvm/trace.h
new file mode 100644
index 0000000000..c688745b90
--- /dev/null
+++ b/target/arm/kvm/trace.h
@@ -0,0 +1 @@
+#include "trace/trace-target_arm_kvm.h"
diff --git a/target/arm/trace.h b/target/arm/trace.h
deleted file mode 100644
index 60372d8e26..0000000000
--- a/target/arm/trace.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "trace/trace-target_arm.h"
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9f70735153..adb24eb6ed 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -29,7 +29,7 @@
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
 #include "exec/hwaddr.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "hw/arm/boot.h"
 #include "hw/block/flash.h"
 #include "hw/boards.h"
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f9c9df916c..76b4e17243 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -51,7 +51,7 @@
 #include "sysemu/numa.h"
 #include "sysemu/reset.h"
 #include "sysemu/tpm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae..01385a91c2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -65,7 +65,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/irq.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "hw/firmware/smbios.h"
 #include "qapi/visitor.h"
 #include "qapi/qapi-visit-common.h"
diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index 628e77ef66..e864db2bfa 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -18,7 +18,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "hw/arm/boot.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "hw/misc/unimp.h"
 #include "hw/arm/xlnx-versal.h"
 
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 881847255b..c9c57ae0d8 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -25,7 +25,7 @@
 #include "exec/address-spaces.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 
 #define GIC_NUM_SPI_INTR 160
 
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index 774ca9987a..670d07a98c 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -25,7 +25,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/kvm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 
 static void a15mp_priv_set_irq(void *opaque, int irq, int level)
 {
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 9494185cf4..c10e96496a 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -26,7 +26,7 @@
 #include "hw/sysbus.h"
 #include "migration/blocker.h"
 #include "sysemu/kvm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "gic_internal.h"
 #include "vgic_common.h"
 #include "qom/object.h"
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 057cb53f13..6f2e99ebde 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -25,7 +25,7 @@
 #include "hw/qdev-properties.h"
 #include "sysemu/runstate.h"
 #include "sysemu/kvm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "migration/blocker.h"
 #include "qom/object.h"
 
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 55e9c4a2d5..691b67c953 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -27,7 +27,7 @@
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "gicv3_internal.h"
 #include "vgic_common.h"
 #include "migration/blocker.h"
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 05d6e79ad9..cb4ae2263c 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -24,7 +24,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "sysemu/tcg.h"
 
 #ifdef CONFIG_TCG
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 98a1f476c0..eac5cd132c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -41,7 +41,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "cpu-mmu.h"
diff --git a/target/arm/cpu32.c b/target/arm/cpu32.c
index 08e9506509..182f66db0a 100644
--- a/target/arm/cpu32.c
+++ b/target/arm/cpu32.c
@@ -37,7 +37,7 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "cpu-mmu.h"
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 76a9d0c930..3478282c20 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -30,7 +30,7 @@
 #include "hw/loader.h"
 #endif
 #include "sysemu/kvm.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "qapi/visitor.h"
 #include "hw/qdev-properties.h"
 #include "cpregs.h"
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
deleted file mode 100644
index 56a7099e6b..0000000000
--- a/target/arm/kvm-stub.c
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * QEMU KVM ARM specific function stubs
- *
- * Copyright Linaro Limited 2013
- *
- * Author: Peter Maydell <peter.maydell@linaro.org>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "kvm_arm.h"
-
-bool write_kvmstate_to_list(ARMCPU *cpu)
-{
-    abort();
-}
-
-bool write_list_to_kvmstate(ARMCPU *cpu, int level)
-{
-    abort();
-}
diff --git a/target/arm/kvm.c b/target/arm/kvm/kvm.c
similarity index 100%
rename from target/arm/kvm.c
rename to target/arm/kvm/kvm.c
diff --git a/target/arm/kvm64.c b/target/arm/kvm/kvm64.c
similarity index 100%
rename from target/arm/kvm64.c
rename to target/arm/kvm/kvm64.c
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 2982e8d7f4..595ab94237 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -3,7 +3,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
 #include "cpregs.h"
diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 80c64fa355..0c72bf7c31 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -22,7 +22,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/boards.h"
-#include "kvm_arm.h"
+#include "kvm/kvm_arm.h"
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qapi/qobject-input-visitor.h"
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 5e0ebac703..ed030678f3 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -39,7 +39,6 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/tcg.h"
 #include "sysemu/hw_accel.h"
-#include "kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "cpu-mmu.h"
diff --git a/MAINTAINERS b/MAINTAINERS
index ac7b0d6c6a..2e83b2b63a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -398,7 +398,7 @@ ARM KVM CPUs
 M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
-F: target/arm/kvm.c
+F: target/arm/kvm/kvm.c
 
 MIPS KVM CPUs
 M: Huacai Chen <chenhuacai@kernel.org>
diff --git a/target/arm/kvm/meson.build b/target/arm/kvm/meson.build
index 1015fc0afb..ba02e96e76 100644
--- a/target/arm/kvm/meson.build
+++ b/target/arm/kvm/meson.build
@@ -1,3 +1,8 @@
 arm_ss.add(when: 'CONFIG_TCG', if_false: files(
   'helper-stubs.c',
 ))
+
+arm_ss.add(when: 'CONFIG_KVM', if_true: files(
+  'kvm.c',
+  'kvm64.c',
+))
\ No newline at end of file
diff --git a/target/arm/trace-events b/target/arm/kvm/trace-events
similarity index 100%
rename from target/arm/trace-events
rename to target/arm/kvm/trace-events
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 3166e88c0d..6bc95197fd 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,8 +11,6 @@ arm_ss.add(files(
 ))
 arm_ss.add(zlib)
 
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
-
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
   'gdbstub64.c',
-- 
2.26.2


