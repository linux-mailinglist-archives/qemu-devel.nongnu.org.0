Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D876B5134
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 20:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1painY-0001H7-Ap; Fri, 10 Mar 2023 14:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painU-0001G1-Mx
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:53:00 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1painS-0004eh-7w
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 14:53:00 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso10997931pjb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 11:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678477977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PCVfpfWkb0dy6EcTres8gN6yf4ibNKsCmhMREXR7+eQ=;
 b=jZ5YglmdHckafuqkOJjkWyuyK5jmu8V4T3bCYBEJgnDYzb6I6paUyfvdf15gXnP1FT
 3raexHYjvUP93G18esKqaQ1JBp9K1Yqoa/hFQZcMaf9I8LtfRqKt3KqASI2TyTzfWv/n
 DwgQayKZrqPr9bYsjdUHUbLbsPRheFRguYpuSWEC06OGupKaqvZB984fS2GPYoFjL27a
 Xtp+vcbrtwnF1OkT0FPQ8wCQcbbV/hwh6PKykYuTRSsmrT9NNzxk5ixrBAMurl1+0vM5
 Z9rMxjNWP8WK5oONezPiKmdczgxxhafiOrPMDZe6cLYya5elKDxkkdud0uiVQHenAk0z
 FuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678477977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PCVfpfWkb0dy6EcTres8gN6yf4ibNKsCmhMREXR7+eQ=;
 b=cZguSgVuft3UGdUAEEHtD9zglqhxJHSPerGw+29ZHpIsMrxP4A/xR94nJaMXQxYEM2
 tcDMFxWSUDaKXLYmIjj+yrX6Rt+8xC2ImXzmi7PJdhkqX4UqwiujFDXl0gJAblcM3Cb1
 ux+bBIGilqMvAiOf03EdIOsP05VSoYQPcflbi6hNzDwm+TW48LTNC5t9tPMBBeoEy3oo
 HCEeKzKK+ZW39tvv3ZEZJ06VHP7c2cmYPwXugxfquQSG0MaTN8NBoN0I5lIcBsnF4/Jp
 T1KSaACZrnct30xfx+Ohl+0e1wLghMfsl+uT24c82zA7UWqtES31NM12ZZY1B8dDOIvZ
 RDkw==
X-Gm-Message-State: AO0yUKVpe3fn59POwdhxI5g2vbTvIL9CsAYEysUZ4X1brc0A5aCFdCf+
 bcxsNMA3FqHDAHcVDWUE/PlzOVdruQtRCEUfbsA=
X-Google-Smtp-Source: AK7set8Qjemi8+yV8owuEu6NjirqZ4Y4H0IU9m3ceW3JGOmennX1Jbvadd9VbTGp/BmfIB6m6ym2uw==
X-Received: by 2002:a17:902:c40d:b0:19d:1ffd:1485 with SMTP id
 k13-20020a170902c40d00b0019d1ffd1485mr32975102plk.66.1678477976838; 
 Fri, 10 Mar 2023 11:52:56 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a170903244100b001991d6c6c64sm351465pls.185.2023.03.10.11.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 11:52:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 4/7] *: Add missing includes of qemu/error-report.h
Date: Fri, 10 Mar 2023 11:52:49 -0800
Message-Id: <20230310195252.210956-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310195252.210956-1-richard.henderson@linaro.org>
References: <20230310195252.210956-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This had been pulled in via qemu/plugin.h from hw/core/cpu.h,
but that will be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/accel-softmmu.c          | 2 +-
 block/monitor/block-hmp-cmds.c | 1 +
 dump/dump.c                    | 1 +
 dump/win_dump.c                | 1 +
 hw/arm/collie.c                | 2 ++
 hw/arm/cubieboard.c            | 1 +
 hw/arm/musicpal.c              | 2 ++
 hw/arm/npcm7xx_boards.c        | 2 ++
 hw/arm/nseries.c               | 2 ++
 hw/arm/omap_sx1.c              | 2 ++
 hw/arm/orangepi.c              | 1 +
 hw/arm/palm.c                  | 2 ++
 hw/core/machine-smp.c          | 2 ++
 hw/i386/sgx.c                  | 1 +
 hw/loongarch/acpi-build.c      | 1 +
 hw/loongarch/virt.c            | 2 ++
 hw/m68k/next-cube.c            | 1 +
 hw/m68k/q800.c                 | 1 +
 hw/m68k/virt.c                 | 1 +
 hw/openrisc/boot.c             | 1 +
 hw/ppc/spapr_softmmu.c         | 2 ++
 hw/riscv/opentitan.c           | 1 +
 hw/riscv/shakti_c.c            | 1 +
 hw/riscv/virt-acpi-build.c     | 1 +
 linux-user/elfload.c           | 1 +
 target/i386/cpu.c              | 1 +
 target/i386/host-cpu.c         | 1 +
 target/s390x/cpu_models.c      | 1 +
 target/s390x/diag.c            | 2 ++
 29 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index f9cdafb148..9c804ba9e3 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -27,7 +27,7 @@
 #include "qemu/accel.h"
 #include "hw/boards.h"
 #include "sysemu/cpus.h"
-
+#include "qemu/error-report.h"
 #include "accel-softmmu.h"
 
 int accel_init_machine(AccelState *accel, MachineState *ms)
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index 6aa5f1be0c..2846083546 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -48,6 +48,7 @@
 #include "qemu/option.h"
 #include "qemu/sockets.h"
 #include "qemu/cutils.h"
+#include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
 #include "monitor/monitor.h"
 #include "monitor/hmp.h"
diff --git a/dump/dump.c b/dump/dump.c
index 544d5bce3a..1f1a6edcab 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -24,6 +24,7 @@
 #include "qapi/qapi-commands-dump.h"
 #include "qapi/qapi-events-dump.h"
 #include "qapi/qmp/qerror.h"
+#include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
diff --git a/dump/win_dump.c b/dump/win_dump.c
index 0152f7330a..b7bfaff379 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -11,6 +11,7 @@
 #include "qemu/osdep.h"
 #include "sysemu/dump.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qapi/qmp/qerror.h"
 #include "exec/cpu-defs.h"
 #include "hw/core/cpu.h"
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 9edff59370..a0ad1b8dc7 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -19,6 +19,8 @@
 #include "exec/address-spaces.h"
 #include "cpu.h"
 #include "qom/object.h"
+#include "qemu/error-report.h"
+
 
 #define RAM_SIZE            (512 * MiB)
 #define FLASH_SIZE          (32 * MiB)
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 71a7df1508..8c7fa91529 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -17,6 +17,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-a10.h"
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 06d9add7c7..c9010b2ffb 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -37,6 +37,8 @@
 #include "qemu/cutils.h"
 #include "qom/object.h"
 #include "hw/net/mv88w8618_eth.h"
+#include "qemu/error-report.h"
+
 
 #define MP_MISC_BASE            0x80002000
 #define MP_MISC_SIZE            0x00001000
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 9b31207a06..2aef579aac 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -30,6 +30,8 @@
 #include "sysemu/blockdev.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/block-backend.h"
+#include "qemu/error-report.h"
+
 
 #define NPCM7XX_POWER_ON_STRAPS_DEFAULT (           \
         NPCM7XX_PWRON_STRAP_SPI0F18 |               \
diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index c9df063a08..9e49e9e177 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -45,6 +45,8 @@
 #include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
+
 
 /* Nokia N8x0 support */
 struct n800_s {
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index e721292079..4bf1579f8c 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -37,6 +37,8 @@
 #include "exec/address-spaces.h"
 #include "cpu.h"
 #include "qemu/cutils.h"
+#include "qemu/error-report.h"
+
 
 /*****************************************************************************/
 /* Siemens SX1 Cellphone V1 */
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 3ace474870..10653361ed 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -21,6 +21,7 @@
 #include "qemu/units.h"
 #include "exec/address-spaces.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-h3.h"
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 1457f10c83..17c11ac4ce 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -32,6 +32,8 @@
 #include "cpu.h"
 #include "qemu/cutils.h"
 #include "qom/object.h"
+#include "qemu/error-report.h"
+
 
 static uint64_t static_read(void *opaque, hwaddr offset, unsigned size)
 {
diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index c3dab007da..89fe0cda42 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "hw/boards.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
+
 
 /*
  * Report information of a machine's supported CPU topology hierarchy.
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index db004d17a6..70305547d4 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -18,6 +18,7 @@
 #include "monitor/monitor.h"
 #include "monitor/hmp-target.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qapi/qapi-commands-misc-target.h"
 #include "exec/address-spaces.h"
 #include "sysemu/hw_accel.h"
diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 6cb2472d33..8e3ce07367 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -7,6 +7,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/bitmap.h"
 #include "hw/pci/pci.h"
 #include "hw/core/cpu.h"
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 38ef7cc49f..b702c3f51e 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -44,6 +44,8 @@
 #include "sysemu/tpm.h"
 #include "sysemu/block-backend.h"
 #include "hw/block/flash.h"
+#include "qemu/error-report.h"
+
 
 static void virt_flash_create(LoongArchMachineState *lams)
 {
diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
index e0d4a94f9d..ce8ee50b9e 100644
--- a/hw/m68k/next-cube.c
+++ b/hw/m68k/next-cube.c
@@ -24,6 +24,7 @@
 #include "hw/block/fdc.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "ui/console.h"
 #include "target/m68k/cpu.h"
 #include "migration/vmstate.h"
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 9d52ca6613..b35ecafbc7 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -45,6 +45,7 @@
 #include "hw/block/swim.h"
 #include "net/net.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "sysemu/reset.h"
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 4cb5beef1a..754b9bdfcc 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -23,6 +23,7 @@
 #include "bootinfo.h"
 #include "net/net.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "sysemu/qtest.h"
 #include "sysemu/runstate.h"
 #include "sysemu/reset.h"
diff --git a/hw/openrisc/boot.c b/hw/openrisc/boot.c
index 007e80cd5a..55475aa6d6 100644
--- a/hw/openrisc/boot.c
+++ b/hw/openrisc/boot.c
@@ -15,6 +15,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
+#include "qemu/error-report.h"
 
 #include <libfdt.h>
 
diff --git a/hw/ppc/spapr_softmmu.c b/hw/ppc/spapr_softmmu.c
index 5170a33369..278666317e 100644
--- a/hw/ppc/spapr_softmmu.c
+++ b/hw/ppc/spapr_softmmu.c
@@ -1,12 +1,14 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "qemu/memalign.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
 #include "mmu-hash64.h"
 #include "mmu-book3s-v3.h"
 
+
 static inline bool valid_ptex(PowerPCCPU *cpu, target_ulong ptex)
 {
     /*
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index b06944d382..bc678766e7 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -22,6 +22,7 @@
 #include "qemu/cutils.h"
 #include "hw/riscv/opentitan.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/misc/unimp.h"
 #include "hw/riscv/boot.h"
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index e43cc9445c..12ea74b032 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -20,6 +20,7 @@
 #include "hw/boards.h"
 #include "hw/riscv/shakti_c.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/intc/sifive_plic.h"
 #include "hw/intc/riscv_aclint.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 82da0a238c..7331248f59 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -29,6 +29,7 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "sysemu/reset.h"
 #include "migration/vmstate.h"
 #include "hw/riscv/virt.h"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5928c14dfc..8c794586c8 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -18,6 +18,7 @@
 #include "qemu/units.h"
 #include "qemu/selfmap.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "target_signal.h"
 #include "accel/tcg/debuginfo.h"
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cab1e2a957..6576287e5b 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -29,6 +29,7 @@
 #include "kvm/kvm_i386.h"
 #include "sev.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
 #include "standard-headers/asm-x86/kvm_para.h"
diff --git a/target/i386/host-cpu.c b/target/i386/host-cpu.c
index 10f8aba86e..92ecb7254b 100644
--- a/target/i386/host-cpu.c
+++ b/target/i386/host-cpu.c
@@ -11,6 +11,7 @@
 #include "cpu.h"
 #include "host-cpu.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
 
 /* Note: Only safe for use on x86(-64) hosts */
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 065ec6d66c..457b5cb10c 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -17,6 +17,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qapi/visitor.h"
 #include "qemu/module.h"
 #include "qemu/hw-version.h"
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 76b01dcd68..e5f0df19e7 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -22,6 +22,8 @@
 #include "hw/s390x/pv.h"
 #include "sysemu/kvm.h"
 #include "kvm/kvm_s390x.h"
+#include "qemu/error-report.h"
+
 
 int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
 {
-- 
2.34.1


