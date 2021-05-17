Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A1382AC4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:18:45 +0200 (CEST)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libGm-0002Ef-J2
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libA5-0004Rv-2E
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libA0-0000al-7K
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:47 -0400
Received: by mail-wr1-x432.google.com with SMTP id a4so5969264wrr.2
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7APzG3x41mko0SfaFm0KwH2t2u50MEWlP0EbYOzpKW8=;
 b=lfKQgdrzvyDI5SPpB5HRpXSzDskZktTJ8+Ot7dDxYWnJOjQ6VAogY4xzvpUjDjpkUl
 Sx6sSD6jv43wOaatLS9hgNYuyvE7gN14xEL5WY4h73yviNSVzCOQNSogCyzpT71GFxMW
 JtkcCZNwk5lplGntF/tixmoTXWwYUNTmaJMp7NN6m/I1Bv7I4VNLE41gHNiU6NhCE9dG
 ZwSFJGfQPPgxZ8msjm+OeeD2tJLpYReJq9zQp9+6nQupZXsNI2+eSmHRfxtyE1MSMJ53
 DTkWsC4gRa1MUgDC1gd4ipkD6XskD89wv5iSrLHU5/a6UJ5kYsi712heg9UPJDdLr09L
 ePew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7APzG3x41mko0SfaFm0KwH2t2u50MEWlP0EbYOzpKW8=;
 b=nAplPCicM7D9xbU/8KkTRNZ1mCIJS+cXp119u9uylZSLwktKAGoSuPRWJwfANqsn4D
 CoJw0kbsKjf1ThfxPAsNrVwfefPk7MUaM64ST4hnDt324wf6mGXSdZHnxH8L+6Bh7df7
 jHfLtlYrjGu4CNznzvH+quDZz7w2lHiwjANgcbHohm0fzdp9d81T7X2gL9jKXqzoGoae
 +F1O8XTnax9FjYudbQvtZSRMERi5+SQMdF2R59l8lFSqG/NQkoyFw8JMBF/fs8gVZijn
 41htfMov2E30LMGBAp1At2L58Fmvszv+ykGHA3Aw3fZ2/JUclojpviz/0adZt681zN+p
 icmw==
X-Gm-Message-State: AOAM533BuvDwWaFeTLKuTwnnY4IFu2wxPEqE8a0toBE4RuetSfwMWZcA
 mP4UG475q8/ulQ+EaAb1jUihaKq1Od1hwA==
X-Google-Smtp-Source: ABdhPJxRAZDbmYCUJWYXF3niAKglnFJr+jr4hhFj0tMoTftEElh3lg2cZLMyFzq2VJTkOCXxl3KkGQ==
X-Received: by 2002:a5d:4c46:: with SMTP id n6mr38355624wrt.95.1621249902240; 
 Mon, 17 May 2021 04:11:42 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v12sm18958960wrv.76.2021.05.17.04.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:11:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] exec: Restrict address-spaces.h to sysemu/
Date: Mon, 17 May 2021 13:11:06 +0200
Message-Id: <20210517111111.1068153-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517111111.1068153-1-f4bug@amsat.org>
References: <20210517111111.1068153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To make it clearer the address-spaces.h header is sysemu specific,
move it to the sysemu/ directory.

Patch created mechanically using:

  $ sed -i s,exec/address-spaces.h,exec/sysemu/address-spaces.h, $(git grep -l exec/address-spaces.h)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/i82596.h                            |  2 +-
 hw/s390x/ipl.h                             |  2 +-
 hw/tpm/tpm_ppi.h                           |  2 +-
 include/exec/{ => sysemu}/address-spaces.h | 12 ++++++------
 include/hw/nubus/nubus.h                   |  2 +-
 include/hw/tricore/triboard.h              |  2 +-
 include/sysemu/dma.h                       |  2 +-
 target/i386/hvf/vmx.h                      |  2 +-
 cpu.c                                      |  2 +-
 hw/arm/collie.c                            |  2 +-
 hw/arm/exynos4_boards.c                    |  2 +-
 hw/arm/fsl-imx31.c                         |  2 +-
 hw/arm/gumstix.c                           |  2 +-
 hw/arm/integratorcp.c                      |  2 +-
 hw/arm/kzm.c                               |  2 +-
 hw/arm/mainstone.c                         |  2 +-
 hw/arm/microbit.c                          |  2 +-
 hw/arm/mps2-tz.c                           |  2 +-
 hw/arm/mps2.c                              |  2 +-
 hw/arm/msf2-soc.c                          |  2 +-
 hw/arm/msf2-som.c                          |  2 +-
 hw/arm/musca.c                             |  2 +-
 hw/arm/omap1.c                             |  2 +-
 hw/arm/omap2.c                             |  2 +-
 hw/arm/omap_sx1.c                          |  2 +-
 hw/arm/orangepi.c                          |  2 +-
 hw/arm/spitz.c                             |  2 +-
 hw/arm/stellaris.c                         |  2 +-
 hw/arm/stm32f205_soc.c                     |  2 +-
 hw/arm/stm32f405_soc.c                     |  2 +-
 hw/arm/tosa.c                              |  2 +-
 hw/arm/z2.c                                |  2 +-
 hw/avr/atmega.c                            |  2 +-
 hw/char/goldfish_tty.c                     |  2 +-
 hw/char/omap_uart.c                        |  2 +-
 hw/core/null-machine.c                     |  2 +-
 hw/core/sysbus.c                           |  2 +-
 hw/dma/etraxfs_dma.c                       |  2 +-
 hw/dma/rc4030.c                            |  2 +-
 hw/hyperv/hyperv.c                         |  2 +-
 hw/input/lasips2.c                         |  2 +-
 hw/microblaze/petalogix_ml605_mmu.c        |  2 +-
 hw/microblaze/petalogix_s3adsp1800_mmu.c   |  2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c            |  2 +-
 hw/misc/allwinner-h3-dramc.c               |  2 +-
 hw/misc/omap_gpmc.c                        |  2 +-
 hw/nios2/10m50_devboard.c                  |  2 +-
 hw/nios2/generic_nommu.c                   |  2 +-
 hw/pci-host/mv64361.c                      |  2 +-
 hw/ppc/pegasos2.c                          |  2 +-
 hw/ppc/ppc405_uc.c                         |  2 +-
 hw/ppc/ppc4xx_devs.c                       |  2 +-
 hw/ppc/prep_systemio.c                     |  2 +-
 hw/ppc/rs6000_mc.c                         |  2 +-
 hw/ppc/spapr_ovec.c                        |  2 +-
 hw/riscv/shakti_c.c                        |  2 +-
 hw/s390x/css.c                             |  2 +-
 hw/sparc/sun4m_iommu.c                     |  2 +-
 hw/sparc64/sun4u_iommu.c                   |  2 +-
 hw/timer/hpet.c                            |  2 +-
 hw/vfio/ap.c                               |  2 +-
 hw/vfio/ccw.c                              |  2 +-
 hw/vfio/common.c                           |  2 +-
 hw/vfio/platform.c                         |  2 +-
 hw/virtio/virtio-balloon.c                 |  2 +-
 hw/virtio/virtio-bus.c                     |  2 +-
 semihosting/arm-compat-semi.c              |  2 +-
 softmmu/ioport.c                           |  2 +-
 softmmu/memory_mapping.c                   |  2 +-
 target/arm/kvm.c                           |  2 +-
 target/avr/helper.c                        |  2 +-
 target/i386/cpu-sysemu.c                   |  2 +-
 target/i386/cpu.c                          |  2 +-
 target/i386/hax/hax-all.c                  |  2 +-
 target/i386/hax/hax-mem.c                  |  2 +-
 target/i386/nvmm/nvmm-all.c                |  2 +-
 target/i386/tcg/sysemu/misc_helper.c       |  2 +-
 target/i386/tcg/sysemu/tcg-cpu.c           |  2 +-
 target/i386/whpx/whpx-all.c                |  2 +-
 target/s390x/excp_helper.c                 |  2 +-
 target/s390x/mmu_helper.c                  |  2 +-
 target/s390x/sigp.c                        |  2 +-
 target/xtensa/dbg_helper.c                 |  2 +-
 83 files changed, 88 insertions(+), 88 deletions(-)
 rename include/exec/{ => sysemu}/address-spaces.h (84%)

diff --git a/hw/net/i82596.h b/hw/net/i82596.h
index de5cc7d0c5b..478b5237b3e 100644
--- a/hw/net/i82596.h
+++ b/hw/net/i82596.h
@@ -4,7 +4,7 @@
 #define I82596_IOPORT_SIZE       0x20
 
 #include "exec/sysemu/memory.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 #define PORT_RESET              0x00    /* reset 82596 */
 #define PORT_SELFTEST           0x01    /* selftest */
diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index dfc6dfd89c8..6f3ca5ba57f 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -14,7 +14,7 @@
 #define HW_S390_IPL_H
 
 #include "cpu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
diff --git a/hw/tpm/tpm_ppi.h b/hw/tpm/tpm_ppi.h
index 6f773c25a0b..c88c24facdb 100644
--- a/hw/tpm/tpm_ppi.h
+++ b/hw/tpm/tpm_ppi.h
@@ -12,7 +12,7 @@
 #ifndef TPM_TPM_PPI_H
 #define TPM_TPM_PPI_H
 
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 typedef struct TPMPPI {
     MemoryRegion ram;
diff --git a/include/exec/address-spaces.h b/include/exec/sysemu/address-spaces.h
similarity index 84%
rename from include/exec/address-spaces.h
rename to include/exec/sysemu/address-spaces.h
index b7533b33f72..800c0206ddd 100644
--- a/include/exec/address-spaces.h
+++ b/include/exec/sysemu/address-spaces.h
@@ -11,8 +11,12 @@
  *
  */
 
-#ifndef EXEC_ADDRESS_SPACES_H
-#define EXEC_ADDRESS_SPACES_H
+#ifndef EXEC_SYSEMU_ADDRESS_SPACES_H
+#define EXEC_SYSEMU_ADDRESS_SPACES_H
+
+#ifdef CONFIG_USER_ONLY
+#error Cannot include sysemu specific header from user emulation
+#endif
 
 /*
  * Internal interfaces between memory.c/exec.c/vl.c.  Do not #include unless
@@ -21,8 +25,6 @@
 
 #include "exec/sysemu/memory.h"
 
-#ifndef CONFIG_USER_ONLY
-
 /* Get the root memory region.  This interface should only be used temporarily
  * until a proper bus interface is available.
  */
@@ -37,5 +39,3 @@ extern AddressSpace address_space_memory;
 extern AddressSpace address_space_io;
 
 #endif
-
-#endif
diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
index e2b5cf260ba..9ea894f2fd0 100644
--- a/include/hw/nubus/nubus.h
+++ b/include/hw/nubus/nubus.h
@@ -10,7 +10,7 @@
 #define HW_NUBUS_NUBUS_H
 
 #include "hw/qdev-properties.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qom/object.h"
 
 #define NUBUS_SUPER_SLOT_SIZE 0x10000000U
diff --git a/include/hw/tricore/triboard.h b/include/hw/tricore/triboard.h
index f3844be447a..e2f1787df7c 100644
--- a/include/hw/tricore/triboard.h
+++ b/include/hw/tricore/triboard.h
@@ -23,7 +23,7 @@
 #include "hw/boards.h"
 #include "hw/arm/boot.h"
 #include "sysemu/sysemu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qom/object.h"
 
 #include "hw/tricore/tc27x_soc.h"
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index d06482d8c54..3f69547ef24 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -11,7 +11,7 @@
 #define DMA_H
 
 #include "exec/sysemu/memory.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "block/block.h"
 #include "block/accounting.h"
 
diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
index 24c4cdf0be0..7ef6064ee94 100644
--- a/target/i386/hvf/vmx.h
+++ b/target/i386/hvf/vmx.h
@@ -31,7 +31,7 @@
 #include "cpu.h"
 #include "x86.h"
 
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 static inline uint64_t rreg(hv_vcpuid_t vcpu, hv_x86_reg_t reg)
 {
diff --git a/cpu.c b/cpu.c
index 164fefeaa35..0df444c7358 100644
--- a/cpu.c
+++ b/cpu.c
@@ -30,7 +30,7 @@
 #include "qemu.h"
 #else
 #include "hw/core/sysemu-cpu-ops.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index 8df31e27932..c989fcbbe93 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -16,7 +16,7 @@
 #include "strongarm.h"
 #include "hw/arm/boot.h"
 #include "hw/block/flash.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "cpu.h"
 #include "qom/object.h"
 
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index 35dd9875da1..59cfd1d1e01 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -28,7 +28,7 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/arm/boot.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/arm/exynos4210.h"
 #include "hw/net/lan9118.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index def27bb9136..1af0987b87f 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -23,7 +23,7 @@
 #include "qapi/error.h"
 #include "hw/arm/fsl-imx31.h"
 #include "sysemu/sysemu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/qdev-properties.h"
 #include "chardev/char.h"
 
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 3a4bc332c42..aea5e69efc0 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -41,7 +41,7 @@
 #include "hw/block/flash.h"
 #include "hw/net/smc91c111.h"
 #include "hw/boards.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/qtest.h"
 #include "cpu.h"
 
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 16e89859539..dd96c63e362 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -17,7 +17,7 @@
 #include "hw/misc/arm_integrator_debug.h"
 #include "hw/net/smc91c111.h"
 #include "net/net.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/runstate.h"
 #include "sysemu/sysemu.h"
 #include "qemu/log.h"
diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
index 39559c44c29..4a9996b3387 100644
--- a/hw/arm/kzm.c
+++ b/hw/arm/kzm.c
@@ -18,7 +18,7 @@
 #include "hw/arm/fsl-imx31.h"
 #include "hw/boards.h"
 #include "qemu/error-report.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "net/net.h"
 #include "hw/net/lan9118.h"
 #include "hw/char/serial.h"
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 8454b654585..53a6f6a643e 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -21,7 +21,7 @@
 #include "hw/boards.h"
 #include "hw/block/flash.h"
 #include "hw/sysbus.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "cpu.h"
 
 /* Device addresses */
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index e9494334ce7..8c8dc96f75f 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -13,7 +13,7 @@
 #include "hw/boards.h"
 #include "hw/arm/boot.h"
 #include "sysemu/sysemu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 #include "hw/arm/nrf51_soc.h"
 #include "hw/i2c/microbit_i2c.h"
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 70aa31a7f6c..d8df945188d 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -53,7 +53,7 @@
 #include "hw/arm/armv7m.h"
 #include "hw/or-irq.h"
 #include "hw/boards.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/reset.h"
 #include "hw/misc/unimp.h"
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 81413b7133e..cb6cf03ecc5 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -33,7 +33,7 @@
 #include "hw/arm/armv7m.h"
 #include "hw/or-irq.h"
 #include "hw/boards.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/misc/unimp.h"
 #include "hw/char/cmsdk-apb-uart.h"
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 5cfe7caf834..e977aa4b378 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/char/serial.h"
 #include "hw/arm/msf2-soc.h"
 #include "hw/misc/unimp.h"
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 343ec977c07..e007bcbe1e4 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -29,7 +29,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/boot.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/arm/msf2-soc.h"
 
 #define DDR_BASE_ADDRESS      0xA0000000
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 7a83f7dda7d..71d34f0dac3 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -22,7 +22,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/armsse.h"
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 180d3788f89..56e2ec3937b 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -23,7 +23,7 @@
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index 02b1aa8c974..0984fdb46ad 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -22,7 +22,7 @@
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/blockdev.h"
 #include "sysemu/qtest.h"
 #include "sysemu/reset.h"
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 57829b37441..5bc01c4645c 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -33,7 +33,7 @@
 #include "hw/arm/boot.h"
 #include "hw/block/flash.h"
 #include "sysemu/qtest.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "cpu.h"
 #include "qemu/cutils.h"
 
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index 0cf9895ce79..ade08fb688d 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -19,7 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index b45a929cbd9..9634138ce5d 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -32,7 +32,7 @@
 #include "hw/sysbus.h"
 #include "hw/misc/max111x.h"
 #include "migration/vmstate.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "cpu.h"
 #include "qom/object.h"
 
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 8b4dab9b79f..9f13c5f649f 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -17,7 +17,7 @@
 #include "net/net.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/armv7m.h"
 #include "hw/char/pl011.h"
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 9cd41bf56da..5f0c603aabb 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -26,7 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "hw/arm/boot.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/arm/stm32f205_soc.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index cb04c111987..bdd93f0127a 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/stm32f405_soc.h"
 #include "hw/misc/unimp.h"
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index d5a6763cf9a..73dd2cff0bb 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -25,7 +25,7 @@
 #include "hw/ssi/ssi.h"
 #include "hw/sysbus.h"
 #include "hw/misc/led.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qom/object.h"
 
 #define TOSA_RAM 0x04000000
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 9c1e876207b..6d1c458b922 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -23,7 +23,7 @@
 #include "ui/console.h"
 #include "hw/audio/wm8750.h"
 #include "audio/audio.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "cpu.h"
 #include "qom/object.h"
 
diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
index 7ccbb80194c..e9b218f0270 100644
--- a/hw/avr/atmega.c
+++ b/hw/avr/atmega.c
@@ -13,7 +13,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "exec/sysemu/memory.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
diff --git a/hw/char/goldfish_tty.c b/hw/char/goldfish_tty.c
index 8365a187614..f882fd1ee25 100644
--- a/hw/char/goldfish_tty.c
+++ b/hw/char/goldfish_tty.c
@@ -15,7 +15,7 @@
 #include "chardev/char-fe.h"
 #include "qemu/log.h"
 #include "trace.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/char/goldfish_tty.h"
 
 #define GOLDFISH_TTY_VERSION 1
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index e8da9333782..7ac760f60b0 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -21,7 +21,7 @@
 #include "chardev/char.h"
 #include "hw/arm/omap.h"
 #include "hw/char/serial.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 /* UARTs */
 struct omap_uart_s {
diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index f586a4bef54..9586c1716ac 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -14,7 +14,7 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "hw/boards.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/core/cpu.h"
 
 static void machine_none_init(MachineState *mch)
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index aaae8e23cc4..f7ae45677d2 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -22,7 +22,7 @@
 #include "qemu/module.h"
 #include "hw/sysbus.h"
 #include "monitor/monitor.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
 static char *sysbus_get_fw_dev_path(DeviceState *dev);
diff --git a/hw/dma/etraxfs_dma.c b/hw/dma/etraxfs_dma.c
index c4334e87bf5..9356f54e846 100644
--- a/hw/dma/etraxfs_dma.c
+++ b/hw/dma/etraxfs_dma.c
@@ -27,7 +27,7 @@
 #include "hw/irq.h"
 #include "qemu/main-loop.h"
 #include "sysemu/runstate.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 #include "hw/cris/etraxfs_dma.h"
 
diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index e4d2f1725bc..e23bd30a10a 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -32,7 +32,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "trace.h"
 #include "qom/object.h"
 
diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
index cb1074f234c..c3ef86f4f16 100644
--- a/hw/hyperv/hyperv.c
+++ b/hw/hyperv/hyperv.c
@@ -11,7 +11,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "sysemu/kvm.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index f84f37411fd..f5bd98b65cd 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -28,7 +28,7 @@
 #include "hw/input/lasips2.h"
 #include "exec/sysemu/hwaddr.h"
 #include "trace.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index 159db6cbe22..17bd4a0f905 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -36,7 +36,7 @@
 #include "hw/boards.h"
 #include "hw/char/serial.h"
 #include "hw/qdev-properties.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/ssi/ssi.h"
 
 #include "boot.h"
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 9d959d1ad80..82156e6e69f 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -33,7 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/misc/unimp.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/char/xilinx_uartlite.h"
 
 #include "boot.h"
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 5a2016672a3..2982461559b 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -17,7 +17,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/boards.h"
 #include "cpu.h"
 #include "boot.h"
diff --git a/hw/misc/allwinner-h3-dramc.c b/hw/misc/allwinner-h3-dramc.c
index 1d37cf422cd..cc050049089 100644
--- a/hw/misc/allwinner-h3-dramc.c
+++ b/hw/misc/allwinner-h3-dramc.c
@@ -24,7 +24,7 @@
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "hw/misc/allwinner-h3-dramc.h"
diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
index cec48723d63..99c803baec8 100644
--- a/hw/misc/omap_gpmc.c
+++ b/hw/misc/omap_gpmc.c
@@ -24,7 +24,7 @@
 #include "hw/block/flash.h"
 #include "hw/arm/omap.h"
 #include "exec/sysemu/memory.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 /* General-Purpose Memory Controller */
 struct omap_gpmc_s {
diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 1efc61ee7c4..38452c0841c 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -31,7 +31,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "exec/sysemu/memory.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qemu/config-file.h"
 
 #include "boot.h"
diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c
index 2888de27086..a1af8ba45d2 100644
--- a/hw/nios2/generic_nommu.c
+++ b/hw/nios2/generic_nommu.c
@@ -33,7 +33,7 @@
 #include "hw/char/serial.h"
 #include "hw/boards.h"
 #include "exec/sysemu/memory.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qemu/config-file.h"
 
 #include "boot.h"
diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index 20510d86803..ea7eb05c337 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -19,7 +19,7 @@
 #include "hw/irq.h"
 #include "hw/intc/i8259.h"
 #include "hw/qdev-properties.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "trace.h"
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 0bfd0928aa5..e9454f123af 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -30,7 +30,7 @@
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "trace.h"
 #include "qemu/datadir.h"
 #include "sysemu/device_tree.h"
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index e632c408bdf..bbc1fb06a88 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -34,7 +34,7 @@
 #include "qemu/timer.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/intc/ppc-uic.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 980c48944fc..516c2bff74d 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -32,7 +32,7 @@
 #include "hw/intc/ppc-uic.h"
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 
diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index b2bd7832487..a89d24b8881 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -28,7 +28,7 @@
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qom/object.h"
 #include "qemu/error-report.h" /* for error_report() */
 #include "qemu/module.h"
diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
index c0bc212e924..f79df1cf01e 100644
--- a/hw/ppc/rs6000_mc.c
+++ b/hw/ppc/rs6000_mc.c
@@ -22,7 +22,7 @@
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qapi/error.h"
 #include "trace.h"
 #include "qom/object.h"
diff --git a/hw/ppc/spapr_ovec.c b/hw/ppc/spapr_ovec.c
index b2567caa5cf..5255d349c42 100644
--- a/hw/ppc/spapr_ovec.c
+++ b/hw/ppc/spapr_ovec.c
@@ -15,7 +15,7 @@
 #include "hw/ppc/spapr_ovec.h"
 #include "migration/vmstate.h"
 #include "qemu/bitmap.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qemu/error-report.h"
 #include "trace.h"
 #include <libfdt.h>
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 18f70fadaa9..4c60b97ac72 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -24,7 +24,7 @@
 #include "hw/intc/sifive_clint.h"
 #include "sysemu/sysemu.h"
 #include "hw/qdev-properties.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/riscv/boot.h"
 
 
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index bed46f5ec3a..3b1fbb41295 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -14,7 +14,7 @@
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/s390x/ioinst.h"
 #include "hw/qdev-properties.h"
 #include "hw/s390x/css.h"
diff --git a/hw/sparc/sun4m_iommu.c b/hw/sparc/sun4m_iommu.c
index 71f5465249f..4cdce4af5c5 100644
--- a/hw/sparc/sun4m_iommu.c
+++ b/hw/sparc/sun4m_iommu.c
@@ -29,7 +29,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "trace.h"
 
 /*
diff --git a/hw/sparc64/sun4u_iommu.c b/hw/sparc64/sun4u_iommu.c
index 9178277f824..189e2a13ec2 100644
--- a/hw/sparc64/sun4u_iommu.c
+++ b/hw/sparc64/sun4u_iommu.c
@@ -27,7 +27,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "hw/sparc/sun4u_iommu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 9520471be2c..134fa55ecf5 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -36,7 +36,7 @@
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "hw/timer/i8254.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qom/object.h"
 
 //#define HPET_DEBUG
diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
index 4b32aca1a05..18c35fd1982 100644
--- a/hw/vfio/ap.c
+++ b/hw/vfio/ap.c
@@ -25,7 +25,7 @@
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
 #include "hw/s390x/ap-bridge.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qom/object.h"
 
 #define TYPE_VFIO_AP_DEVICE      "vfio-ap"
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index e752c845e9e..2e4d1f27b6c 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -26,7 +26,7 @@
 #include "hw/s390x/vfio-ccw.h"
 #include "hw/qdev-properties.h"
 #include "hw/s390x/ccw-device.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 472ab394109..91171e4f658 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -27,7 +27,7 @@
 
 #include "hw/vfio/vfio-common.h"
 #include "hw/vfio/vfio.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "exec/sysemu/memory.h"
 #include "exec/ram_addr.h"
 #include "hw/hw.h"
diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
index ea9bcdf2bf7..9779aed8d8b 100644
--- a/hw/vfio/platform.c
+++ b/hw/vfio/platform.c
@@ -27,7 +27,7 @@
 #include "qemu/module.h"
 #include "qemu/range.h"
 #include "exec/sysemu/memory.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qemu/queue.h"
 #include "hw/sysbus.h"
 #include "trace.h"
diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index 4b5d9e5e503..7d0533059d6 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -23,7 +23,7 @@
 #include "hw/boards.h"
 #include "sysemu/balloon.h"
 #include "hw/virtio/virtio-balloon.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qapi/error.h"
 #include "qapi/qapi-events-machine.h"
 #include "qapi/visitor.h"
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d6332d45c3b..a324e3e251e 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -28,7 +28,7 @@
 #include "qapi/error.h"
 #include "hw/virtio/virtio-bus.h"
 #include "hw/virtio/virtio.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 /* #define DEBUG_VIRTIO_BUS */
 
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c29146dcfa..9dfbc7b5a1e 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -144,7 +144,7 @@ typedef struct GuestFD {
 static GArray *guestfd_array;
 
 #ifndef CONFIG_USER_ONLY
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 /*
  * Find the base of a RAM region containing the specified address
  */
diff --git a/softmmu/ioport.c b/softmmu/ioport.c
index dfb9fbc7ffa..6ace5ec966a 100644
--- a/softmmu/ioport.c
+++ b/softmmu/ioport.c
@@ -29,7 +29,7 @@
 #include "cpu.h"
 #include "exec/ioport.h"
 #include "exec/sysemu/memory.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "trace.h"
 
 typedef struct MemoryRegionPortioList {
diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index 60ff72790ea..646d3d184d7 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -16,7 +16,7 @@
 
 #include "sysemu/memory_mapping.h"
 #include "exec/sysemu/memory.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 //#define DEBUG_GUEST_PHYS_REGION_ADD
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba2245..aff19af3561 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -28,7 +28,7 @@
 #include "internals.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/boards.h"
 #include "hw/irq.h"
 #include "qemu/log.h"
diff --git a/target/avr/helper.c b/target/avr/helper.c
index 35e10195940..1dba5ffa6eb 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -22,7 +22,7 @@
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "exec/helper-proto.h"
 
 bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 6477584313a..2746a592d9b 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -29,7 +29,7 @@
 #include "qapi/qapi-commands-machine-target.h"
 #include "hw/qdev-properties.h"
 
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/i386/apic_internal.h"
 
 #include "cpu-internal.h"
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 839b9d9f8b2..ec8b7745381 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -34,7 +34,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/i386/topology.h"
 #ifndef CONFIG_USER_ONLY
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "hw/boards.h"
 #endif
 
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index bf65ed6fa92..29fe6577e7d 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -25,7 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 #include "qemu-common.h"
 #include "qemu/accel.h"
diff --git a/target/i386/hax/hax-mem.c b/target/i386/hax/hax-mem.c
index 8d44edbffdd..06c8f6ccfdd 100644
--- a/target/i386/hax/hax-mem.c
+++ b/target/i386/hax/hax-mem.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "qemu/error-report.h"
 
 #include "hax-accel-ops.h"
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index dfa690d65da..8adbfcb82d9 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "exec/ioport.h"
 #include "qemu-common.h"
 #include "qemu/accel.h"
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 66e7939537f..54c6bfeb2d5 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -22,7 +22,7 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "tcg/helper-tcg.h"
 
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
diff --git a/target/i386/tcg/sysemu/tcg-cpu.c b/target/i386/tcg/sysemu/tcg-cpu.c
index c223c0fe9bc..a6227564590 100644
--- a/target/i386/tcg/sysemu/tcg-cpu.c
+++ b/target/i386/tcg/sysemu/tcg-cpu.c
@@ -23,7 +23,7 @@
 
 #include "sysemu/sysemu.h"
 #include "qemu/units.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 #include "tcg/tcg-cpu.h"
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index f832f286ac3..7abc77d1c1f 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "exec/ioport.h"
 #include "qemu-common.h"
 #include "qemu/accel.h"
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 20625c2c8f6..bcdde18e366 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -26,9 +26,9 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "hw/s390x/ioinst.h"
-#include "exec/address-spaces.h"
 #include "tcg_s390x.h"
 #ifndef CONFIG_USER_ONLY
+#include "exec/sysemu/address-spaces.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/boards.h"
 #endif
diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index d492b23a177..11dfb873df9 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -17,7 +17,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "cpu.h"
 #include "internal.h"
 #include "kvm_s390x.h"
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index c604f177100..2546675d5f0 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -13,7 +13,7 @@
 #include "internal.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 #include "exec/exec-all.h"
 #include "sysemu/tcg.h"
 #include "trace.h"
diff --git a/target/xtensa/dbg_helper.c b/target/xtensa/dbg_helper.c
index be1f81107b4..5b1356b9792 100644
--- a/target/xtensa/dbg_helper.c
+++ b/target/xtensa/dbg_helper.c
@@ -31,7 +31,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
-#include "exec/address-spaces.h"
+#include "exec/sysemu/address-spaces.h"
 
 static void tb_invalidate_virtual_addr(CPUXtensaState *env, uint32_t vaddr)
 {
-- 
2.26.3


