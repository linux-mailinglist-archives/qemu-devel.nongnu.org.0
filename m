Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEECF23E2D6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 22:07:27 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3mAg-0004lm-Og
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 16:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lR2-0002dJ-Rf
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:20:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36330
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k3lQy-0006s2-0e
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 15:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596741611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Ob3oEcEC1asUEUq+V/vTO4zQqPx6RtNL/OAy2vPqD8=;
 b=LRVfCCK9Qi9mvM8AGdQ4sDGj6JhyU2IqEIqKwOG/hd+RMRqh80nqmQimlkrgJ3v2nDKDno
 5dIZgCfvN2x6OsfaBeO+iVUczCB4mhwKd4egf/4j1xOGEDWdSqjoXkh/wJBvqCOH8ueJV8
 T9g7nLBDckAQaqe4MaUKT+kuUVCbP1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-Kq_12vfvNoCWIswrYRc-Yw-1; Thu, 06 Aug 2020 15:20:09 -0400
X-MC-Unique: Kq_12vfvNoCWIswrYRc-Yw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5071F800404
 for <qemu-devel@nongnu.org>; Thu,  6 Aug 2020 19:20:08 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49C7D5F9DC;
 Thu,  6 Aug 2020 19:20:07 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 123/143] meson: convert hw/arch*
Date: Thu,  6 Aug 2020 21:15:59 +0200
Message-Id: <1596741379-12902-124-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:24:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.target             |  7 ----
 hw/alpha/Makefile.objs      |  1 -
 hw/alpha/meson.build        |  8 +++++
 hw/arm/Makefile.objs        | 56 -------------------------------
 hw/arm/meson.build          | 59 +++++++++++++++++++++++++++++++++
 hw/avr/Makefile.objs        |  3 --
 hw/avr/meson.build          |  6 ++++
 hw/cris/Makefile.objs       |  2 --
 hw/cris/meson.build         |  5 +++
 hw/hppa/Makefile.objs       |  1 -
 hw/hppa/meson.build         |  4 +++
 hw/i386/Makefile.objs       | 20 ------------
 hw/i386/kvm/Makefile.objs   |  5 ---
 hw/i386/kvm/meson.build     |  8 +++++
 hw/i386/meson.build         | 32 ++++++++++++++++++
 hw/i386/xen/Makefile.objs   |  1 -
 hw/i386/xen/meson.build     |  7 ++++
 hw/lm32/Makefile.objs       |  3 --
 hw/lm32/meson.build         |  6 ++++
 hw/m68k/Makefile.objs       |  4 ---
 hw/m68k/meson.build         |  7 ++++
 hw/meson.build              | 25 ++++++++++++++
 hw/microblaze/Makefile.objs |  4 ---
 hw/microblaze/meson.build   |  7 ++++
 hw/mips/Makefile.objs       |  8 -----
 hw/mips/meson.build         | 11 +++++++
 hw/moxie/Makefile.objs      |  2 --
 hw/moxie/meson.build        |  4 +++
 hw/nios2/Makefile.objs      |  3 --
 hw/nios2/meson.build        |  6 ++++
 hw/openrisc/Makefile.objs   |  2 --
 hw/openrisc/meson.build     |  5 +++
 hw/ppc/Makefile.objs        | 35 --------------------
 hw/ppc/meson.build          | 80 +++++++++++++++++++++++++++++++++++++++++++++
 hw/riscv/Makefile.objs      | 16 ---------
 hw/riscv/meson.build        | 19 +++++++++++
 hw/rx/Makefile.objs         |  2 --
 hw/rx/meson.build           |  5 +++
 hw/s390x/Makefile.objs      | 37 ---------------------
 hw/s390x/meson.build        | 46 ++++++++++++++++++++++++++
 hw/sh4/Makefile.objs        |  4 ---
 hw/sh4/meson.build          | 10 ++++++
 hw/sparc/Makefile.objs      |  3 --
 hw/sparc/meson.build        |  6 ++++
 hw/sparc64/Makefile.objs    |  4 ---
 hw/sparc64/meson.build      |  6 ++++
 hw/tricore/Makefile.objs    |  1 -
 hw/tricore/meson.build      |  4 +++
 hw/unicore32/Makefile.objs  |  4 ---
 hw/unicore32/meson.build    |  5 +++
 hw/xenpv/Makefile.objs      |  2 --
 hw/xenpv/meson.build        |  3 ++
 hw/xtensa/Makefile.objs     |  6 ----
 hw/xtensa/meson.build       | 11 +++++++
 meson.build                 |  4 +++
 55 files changed, 399 insertions(+), 236 deletions(-)
 delete mode 100644 hw/alpha/Makefile.objs
 create mode 100644 hw/alpha/meson.build
 delete mode 100644 hw/arm/Makefile.objs
 create mode 100644 hw/arm/meson.build
 delete mode 100644 hw/avr/Makefile.objs
 create mode 100644 hw/avr/meson.build
 delete mode 100644 hw/cris/Makefile.objs
 create mode 100644 hw/cris/meson.build
 delete mode 100644 hw/hppa/Makefile.objs
 create mode 100644 hw/hppa/meson.build
 delete mode 100644 hw/i386/Makefile.objs
 delete mode 100644 hw/i386/kvm/Makefile.objs
 create mode 100644 hw/i386/kvm/meson.build
 create mode 100644 hw/i386/meson.build
 delete mode 100644 hw/i386/xen/Makefile.objs
 create mode 100644 hw/i386/xen/meson.build
 delete mode 100644 hw/lm32/Makefile.objs
 create mode 100644 hw/lm32/meson.build
 delete mode 100644 hw/m68k/Makefile.objs
 create mode 100644 hw/m68k/meson.build
 delete mode 100644 hw/microblaze/Makefile.objs
 create mode 100644 hw/microblaze/meson.build
 delete mode 100644 hw/mips/Makefile.objs
 create mode 100644 hw/mips/meson.build
 delete mode 100644 hw/moxie/Makefile.objs
 create mode 100644 hw/moxie/meson.build
 delete mode 100644 hw/nios2/Makefile.objs
 create mode 100644 hw/nios2/meson.build
 delete mode 100644 hw/openrisc/Makefile.objs
 create mode 100644 hw/openrisc/meson.build
 delete mode 100644 hw/ppc/Makefile.objs
 create mode 100644 hw/ppc/meson.build
 delete mode 100644 hw/riscv/Makefile.objs
 create mode 100644 hw/riscv/meson.build
 delete mode 100644 hw/rx/Makefile.objs
 create mode 100644 hw/rx/meson.build
 delete mode 100644 hw/s390x/Makefile.objs
 create mode 100644 hw/s390x/meson.build
 delete mode 100644 hw/sh4/Makefile.objs
 create mode 100644 hw/sh4/meson.build
 delete mode 100644 hw/sparc/Makefile.objs
 create mode 100644 hw/sparc/meson.build
 delete mode 100644 hw/sparc64/Makefile.objs
 create mode 100644 hw/sparc64/meson.build
 delete mode 100644 hw/tricore/Makefile.objs
 create mode 100644 hw/tricore/meson.build
 delete mode 100644 hw/unicore32/Makefile.objs
 create mode 100644 hw/unicore32/meson.build
 delete mode 100644 hw/xenpv/Makefile.objs
 create mode 100644 hw/xenpv/meson.build
 delete mode 100644 hw/xtensa/Makefile.objs
 create mode 100644 hw/xtensa/meson.build

diff --git a/Makefile.target b/Makefile.target
index c95e0de..28cefba 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -170,13 +170,6 @@ LIBS := $(LIBS) $(VDE_LIBS) $(SLIRP_LIBS)
 LIBS := $(LIBS) $(LIBUSB_LIBS) $(SMARTCARD_LIBS) $(USB_REDIR_LIBS)
 LIBS := $(LIBS) $(VIRGL_LIBS)
 
-# Hardware support
-ifeq ($(TARGET_NAME), sparc64)
-obj-y += hw/sparc64/
-else
-obj-y += hw/$(TARGET_BASE_ARCH)/
-endif
-
 generated-files-y += hmp-commands.h hmp-commands-info.h
 
 endif # CONFIG_SOFTMMU
diff --git a/hw/alpha/Makefile.objs b/hw/alpha/Makefile.objs
deleted file mode 100644
index 62fdf3e..0000000
--- a/hw/alpha/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_DP264) += dp264.o pci.o typhoon.o
diff --git a/hw/alpha/meson.build b/hw/alpha/meson.build
new file mode 100644
index 0000000..81ca215
--- /dev/null
+++ b/hw/alpha/meson.build
@@ -0,0 +1,8 @@
+alpha_ss = ss.source_set()
+alpha_ss.add(when: 'CONFIG_DP264', if_true: files(
+  'dp264.c',
+  'pci.c',
+  'typhoon.c',
+))
+
+hw_arch += {'alpha': alpha_ss}
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
deleted file mode 100644
index 534a6a1..0000000
--- a/hw/arm/Makefile.objs
+++ /dev/null
@@ -1,56 +0,0 @@
-obj-y += boot.o
-obj-$(CONFIG_PLATFORM_BUS) += sysbus-fdt.o
-obj-$(CONFIG_ARM_VIRT) += virt.o
-obj-$(CONFIG_ACPI) += virt-acpi-build.o
-obj-$(CONFIG_DIGIC) += digic_boards.o
-obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
-obj-$(CONFIG_EMCRAFT_SF2) += msf2-som.o
-obj-$(CONFIG_HIGHBANK) += highbank.o
-obj-$(CONFIG_INTEGRATOR) += integratorcp.o
-obj-$(CONFIG_MAINSTONE) += mainstone.o
-obj-$(CONFIG_MICROBIT) += microbit.o
-obj-$(CONFIG_MUSICPAL) += musicpal.o
-obj-$(CONFIG_NETDUINO2) += netduino2.o
-obj-$(CONFIG_NETDUINOPLUS2) += netduinoplus2.o
-obj-$(CONFIG_NSERIES) += nseries.o
-obj-$(CONFIG_SX1) += omap_sx1.o
-obj-$(CONFIG_CHEETAH) += palm.o
-obj-$(CONFIG_GUMSTIX) += gumstix.o
-obj-$(CONFIG_SPITZ) += spitz.o
-obj-$(CONFIG_TOSA) += tosa.o
-obj-$(CONFIG_Z2) += z2.o
-obj-$(CONFIG_REALVIEW) += realview.o
-obj-$(CONFIG_SBSA_REF) += sbsa-ref.o
-obj-$(CONFIG_STELLARIS) += stellaris.o
-obj-$(CONFIG_COLLIE) += collie.o
-obj-$(CONFIG_VERSATILE) += versatilepb.o
-obj-$(CONFIG_VEXPRESS) += vexpress.o
-obj-$(CONFIG_ZYNQ) += xilinx_zynq.o
-obj-$(CONFIG_SABRELITE) += sabrelite.o
-
-obj-$(CONFIG_ARM_V7M) += armv7m.o
-obj-$(CONFIG_EXYNOS4) += exynos4210.o
-obj-$(CONFIG_PXA2XX) += pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
-obj-$(CONFIG_DIGIC) += digic.o
-obj-$(CONFIG_OMAP) += omap1.o omap2.o
-obj-$(CONFIG_STRONGARM) += strongarm.o
-obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3.o orangepi.o
-obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
-obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
-obj-$(CONFIG_STM32F405_SOC) += stm32f405_soc.o
-obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
-obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o xlnx-versal-virt.o
-obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
-obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
-obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o
-obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o aspeed_ast2600.o
-obj-$(CONFIG_MPS2) += mps2.o
-obj-$(CONFIG_MPS2) += mps2-tz.o
-obj-$(CONFIG_MSF2) += msf2-soc.o
-obj-$(CONFIG_MUSCA) += musca.o
-obj-$(CONFIG_ARMSSE) += armsse.o
-obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
-obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
-obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
-obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
new file mode 100644
index 0000000..1ae5e17
--- /dev/null
+++ b/hw/arm/meson.build
@@ -0,0 +1,59 @@
+arm_ss = ss.source_set()
+arm_ss.add(files('boot.c'))
+arm_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.c'))
+arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
+arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
+arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
+arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+arm_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
+arm_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
+arm_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
+arm_ss.add(when: 'CONFIG_MAINSTONE', if_true: files('mainstone.c'))
+arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
+arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
+arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
+arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
+arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
+arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
+arm_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
+arm_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
+arm_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
+arm_ss.add(when: 'CONFIG_TOSA', if_true: files('tosa.c'))
+arm_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
+arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
+arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
+arm_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
+arm_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
+arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
+arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
+arm_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
+arm_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
+
+arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
+arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
+arm_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c', 'pxa2xx_gpio.c', 'pxa2xx_pic.c'))
+arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
+arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
+arm_ss.add(when: 'CONFIG_STRONGARM', if_true: files('strongarm.c'))
+arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
+arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
+arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
+arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
+arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
+arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
+arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
+arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
+arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
+arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
+arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_soc.c', 'aspeed.c', 'aspeed_ast2600.c'))
+arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
+arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
+arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))
+arm_ss.add(when: 'CONFIG_MUSCA', if_true: files('musca.c'))
+arm_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
+arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
+arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c', 'smmuv3.c'))
+arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
+arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
+
+hw_arch += {'arm': arm_ss}
diff --git a/hw/avr/Makefile.objs b/hw/avr/Makefile.objs
deleted file mode 100644
index 4dca064..0000000
--- a/hw/avr/Makefile.objs
+++ /dev/null
@@ -1,3 +0,0 @@
-obj-y += boot.o
-obj-$(CONFIG_AVR_ATMEGA_MCU) += atmega.o
-obj-$(CONFIG_ARDUINO) += arduino.o
diff --git a/hw/avr/meson.build b/hw/avr/meson.build
new file mode 100644
index 0000000..46d53fb
--- /dev/null
+++ b/hw/avr/meson.build
@@ -0,0 +1,6 @@
+avr_ss = ss.source_set()
+avr_ss.add(files('boot.c'))
+avr_ss.add(when: 'CONFIG_AVR_ATMEGA_MCU', if_true: files('atmega.c'))
+avr_ss.add(when: 'CONFIG_ARDUINO', if_true: files('arduino.c'))
+
+hw_arch += {'avr': avr_ss}
diff --git a/hw/cris/Makefile.objs b/hw/cris/Makefile.objs
deleted file mode 100644
index a4a27b3..0000000
--- a/hw/cris/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-y += boot.o
-obj-$(CONFIG_AXIS) += axis_dev88.o
diff --git a/hw/cris/meson.build b/hw/cris/meson.build
new file mode 100644
index 0000000..dc808a4
--- /dev/null
+++ b/hw/cris/meson.build
@@ -0,0 +1,5 @@
+cris_ss = ss.source_set()
+cris_ss.add(files('boot.c'))
+cris_ss.add(when: 'CONFIG_AXIS', if_true: files('axis_dev88.c'))
+
+hw_arch += {'cris': cris_ss}
diff --git a/hw/hppa/Makefile.objs b/hw/hppa/Makefile.objs
deleted file mode 100644
index eac3467..0000000
--- a/hw/hppa/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_DINO) += pci.o machine.o dino.o lasi.o
diff --git a/hw/hppa/meson.build b/hw/hppa/meson.build
new file mode 100644
index 0000000..1deae83
--- /dev/null
+++ b/hw/hppa/meson.build
@@ -0,0 +1,4 @@
+hppa_ss = ss.source_set()
+hppa_ss.add(when: 'CONFIG_DINO', if_true: files('pci.c', 'machine.c', 'dino.c', 'lasi.c'))
+
+hw_arch += {'hppa': hppa_ss}
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
deleted file mode 100644
index 6abc745..0000000
--- a/hw/i386/Makefile.objs
+++ /dev/null
@@ -1,20 +0,0 @@
-obj-$(CONFIG_KVM) += kvm/
-obj-y += e820_memory_layout.o multiboot.o
-obj-y += x86.o
-obj-$(CONFIG_PC) += pc.o pc_sysfw.o
-obj-$(CONFIG_I440FX) += pc_piix.o
-obj-$(CONFIG_Q35) += pc_q35.o
-obj-$(CONFIG_MICROVM) += microvm.o
-obj-y += fw_cfg.o
-obj-$(CONFIG_X86_IOMMU) += x86-iommu.o
-obj-$(call lnot,$(CONFIG_X86_IOMMU)) += x86-iommu-stub.o
-obj-$(CONFIG_VTD) += intel_iommu.o
-obj-$(CONFIG_AMD_IOMMU) += amd_iommu.o
-obj-$(CONFIG_XEN) += ../xenpv/ xen/
-obj-$(CONFIG_VMPORT) += vmport.o
-obj-$(CONFIG_VMMOUSE) += vmmouse.o
-obj-$(CONFIG_PC) += port92.o
-
-obj-y += kvmvapic.o
-obj-$(CONFIG_ACPI) += acpi-common.o
-obj-$(CONFIG_PC) += acpi-build.o
diff --git a/hw/i386/kvm/Makefile.objs b/hw/i386/kvm/Makefile.objs
deleted file mode 100644
index 0c8d5f2..0000000
--- a/hw/i386/kvm/Makefile.objs
+++ /dev/null
@@ -1,5 +0,0 @@
-obj-y += clock.o
-obj-$(CONFIG_APIC) += apic.o
-obj-$(CONFIG_IOAPIC) += ioapic.o
-obj-$(CONFIG_I8254) += i8254.o
-obj-$(CONFIG_I8259) += i8259.o
diff --git a/hw/i386/kvm/meson.build b/hw/i386/kvm/meson.build
new file mode 100644
index 0000000..95467f1
--- /dev/null
+++ b/hw/i386/kvm/meson.build
@@ -0,0 +1,8 @@
+i386_kvm_ss = ss.source_set()
+i386_kvm_ss.add(files('clock.c'))
+i386_kvm_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c'))
+i386_kvm_ss.add(when: 'CONFIG_I8254', if_true: files('i8254.c'))
+i386_kvm_ss.add(when: 'CONFIG_I8259', if_true: files('i8259.c'))
+i386_kvm_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
+
+i386_ss.add_all(when: 'CONFIG_KVM', if_true: i386_kvm_ss)
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
new file mode 100644
index 0000000..63918fb
--- /dev/null
+++ b/hw/i386/meson.build
@@ -0,0 +1,32 @@
+i386_ss = ss.source_set()
+i386_ss.add(files(
+  'fw_cfg.c',
+  'kvmvapic.c',
+  'e820_memory_layout.c',
+  'multiboot.c',
+  'x86.c',
+))
+
+i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
+                                      if_false: files('x86-iommu-stub.c'))
+i386_ss.add(when: 'CONFIG_AMD_IOMMU', if_true: files('amd_iommu.c'))
+i386_ss.add(when: 'CONFIG_I440FX', if_true: files('pc_piix.c'))
+i386_ss.add(when: 'CONFIG_MICROVM', if_true: files('microvm.c'))
+i386_ss.add(when: 'CONFIG_Q35', if_true: files('pc_q35.c'))
+i386_ss.add(when: 'CONFIG_VMMOUSE', if_true: files('vmmouse.c'))
+i386_ss.add(when: 'CONFIG_VMPORT', if_true: files('vmport.c'))
+i386_ss.add(when: 'CONFIG_VTD', if_true: files('intel_iommu.c'))
+
+i386_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-common.c'))
+i386_ss.add(when: 'CONFIG_PC', if_true: files(
+  'pc.c',
+  'pc_sysfw.c',
+  'acpi-build.c',
+  'port92.c'))
+
+subdir('kvm')
+subdir('xen')
+
+i386_ss.add_all(xenpv_ss)
+
+hw_arch += {'i386': i386_ss}
diff --git a/hw/i386/xen/Makefile.objs b/hw/i386/xen/Makefile.objs
deleted file mode 100644
index be9d10c..0000000
--- a/hw/i386/xen/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-obj-y += xen_platform.o xen_apic.o xen_pvdevice.o xen-hvm.o xen-mapcache.o
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
new file mode 100644
index 0000000..be84130
--- /dev/null
+++ b/hw/i386/xen/meson.build
@@ -0,0 +1,7 @@
+i386_ss.add(when: 'CONFIG_XEN', if_true: files(
+  'xen-hvm.c',
+  'xen-mapcache.c',
+  'xen_apic.c',
+  'xen_platform.c',
+  'xen_pvdevice.c',
+))
diff --git a/hw/lm32/Makefile.objs b/hw/lm32/Makefile.objs
deleted file mode 100644
index c394186..0000000
--- a/hw/lm32/Makefile.objs
+++ /dev/null
@@ -1,3 +0,0 @@
-# LM32 boards
-obj-$(CONFIG_LM32) += lm32_boards.o
-obj-$(CONFIG_MILKYMIST) += milkymist.o
diff --git a/hw/lm32/meson.build b/hw/lm32/meson.build
new file mode 100644
index 0000000..8caf0a7
--- /dev/null
+++ b/hw/lm32/meson.build
@@ -0,0 +1,6 @@
+lm32_ss = ss.source_set()
+# LM32 boards
+lm32_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_boards.c'))
+lm32_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist.c'))
+
+hw_arch += {'lm32': lm32_ss}
diff --git a/hw/m68k/Makefile.objs b/hw/m68k/Makefile.objs
deleted file mode 100644
index b2c9e5a..0000000
--- a/hw/m68k/Makefile.objs
+++ /dev/null
@@ -1,4 +0,0 @@
-obj-$(CONFIG_AN5206) += an5206.o mcf5206.o
-obj-$(CONFIG_MCF5208) += mcf5208.o mcf_intc.o
-obj-$(CONFIG_NEXTCUBE) += next-kbd.o next-cube.o
-obj-$(CONFIG_Q800) += q800.o
diff --git a/hw/m68k/meson.build b/hw/m68k/meson.build
new file mode 100644
index 0000000..ca0044c6
--- /dev/null
+++ b/hw/m68k/meson.build
@@ -0,0 +1,7 @@
+m68k_ss = ss.source_set()
+m68k_ss.add(when: 'CONFIG_AN5206', if_true: files('an5206.c', 'mcf5206.c'))
+m68k_ss.add(when: 'CONFIG_MCF5208', if_true: files('mcf5208.c', 'mcf_intc.c'))
+m68k_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-kbd.c', 'next-cube.c'))
+m68k_ss.add(when: 'CONFIG_Q800', if_true: files('q800.c'))
+
+hw_arch += {'m68k': m68k_ss}
diff --git a/hw/meson.build b/hw/meson.build
index ba8763c..010de72 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -40,3 +40,28 @@ subdir('vfio')
 subdir('virtio')
 subdir('watchdog')
 subdir('xen')
+subdir('xenpv')
+
+subdir('alpha')
+subdir('arm')
+subdir('avr')
+subdir('cris')
+subdir('hppa')
+subdir('i386')
+subdir('lm32')
+subdir('m68k')
+subdir('microblaze')
+subdir('mips')
+subdir('moxie')
+subdir('nios2')
+subdir('openrisc')
+subdir('ppc')
+subdir('riscv')
+subdir('rx')
+subdir('s390x')
+subdir('sh4')
+subdir('sparc')
+subdir('sparc64')
+subdir('tricore')
+subdir('unicore32')
+subdir('xtensa')
diff --git a/hw/microblaze/Makefile.objs b/hw/microblaze/Makefile.objs
deleted file mode 100644
index 8595a62..0000000
--- a/hw/microblaze/Makefile.objs
+++ /dev/null
@@ -1,4 +0,0 @@
-obj-$(CONFIG_PETALOGIX_S3ADSP1800) += petalogix_s3adsp1800_mmu.o
-obj-$(CONFIG_PETALOGIX_ML605) += petalogix_ml605_mmu.o
-obj-$(CONFIG_XLNX_ZYNQMP_PMU) += xlnx-zynqmp-pmu.o
-obj-y += boot.o
diff --git a/hw/microblaze/meson.build b/hw/microblaze/meson.build
new file mode 100644
index 0000000..bb9e4eb
--- /dev/null
+++ b/hw/microblaze/meson.build
@@ -0,0 +1,7 @@
+microblaze_ss = ss.source_set()
+microblaze_ss.add(files('boot.c'))
+microblaze_ss.add(when: 'CONFIG_PETALOGIX_S3ADSP1800', if_true: files('petalogix_s3adsp1800_mmu.c'))
+microblaze_ss.add(when: 'CONFIG_PETALOGIX_ML605', if_true: files('petalogix_ml605_mmu.c'))
+microblaze_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-zynqmp-pmu.c'))
+
+hw_arch += {'microblaze': microblaze_ss}
diff --git a/hw/mips/Makefile.objs b/hw/mips/Makefile.objs
deleted file mode 100644
index 739e2b7..0000000
--- a/hw/mips/Makefile.objs
+++ /dev/null
@@ -1,8 +0,0 @@
-obj-y += addr.o mips_int.o
-obj-$(CONFIG_R4K) += r4k.o
-obj-$(CONFIG_MALTA) += gt64xxx_pci.o malta.o
-obj-$(CONFIG_MIPSSIM) += mipssim.o
-obj-$(CONFIG_JAZZ) += jazz.o
-obj-$(CONFIG_FULOONG) += fuloong2e.o
-obj-$(CONFIG_MIPS_CPS) += cps.o
-obj-$(CONFIG_MIPS_BOSTON) += boston.o
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
new file mode 100644
index 0000000..6ac9dc4
--- /dev/null
+++ b/hw/mips/meson.build
@@ -0,0 +1,11 @@
+mips_ss = ss.source_set()
+mips_ss.add(files('addr.c', 'mips_int.c'))
+mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
+mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
+mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
+mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
+mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: files('boston.c'))
+mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
+mips_ss.add(when: 'CONFIG_R4K', if_true: files('r4k.c'))
+
+hw_arch += {'mips': mips_ss}
diff --git a/hw/moxie/Makefile.objs b/hw/moxie/Makefile.objs
deleted file mode 100644
index ddbf300..0000000
--- a/hw/moxie/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-# moxie boards
-obj-$(CONFIG_MOXIESIM) += moxiesim.o
diff --git a/hw/moxie/meson.build b/hw/moxie/meson.build
new file mode 100644
index 0000000..05a7c2e
--- /dev/null
+++ b/hw/moxie/meson.build
@@ -0,0 +1,4 @@
+moxie_ss = ss.source_set()
+moxie_ss.add(when: 'CONFIG_MOXIESIM', if_true: files('moxiesim.c'))
+
+hw_arch += {'moxie': moxie_ss}
diff --git a/hw/nios2/Makefile.objs b/hw/nios2/Makefile.objs
deleted file mode 100644
index 3e01798..0000000
--- a/hw/nios2/Makefile.objs
+++ /dev/null
@@ -1,3 +0,0 @@
-obj-y = boot.o cpu_pic.o
-obj-$(CONFIG_NIOS2_10M50) += 10m50_devboard.o
-obj-$(CONFIG_NIOS2_GENERIC_NOMMU) += generic_nommu.o
diff --git a/hw/nios2/meson.build b/hw/nios2/meson.build
new file mode 100644
index 0000000..dd66ebb
--- /dev/null
+++ b/hw/nios2/meson.build
@@ -0,0 +1,6 @@
+nios2_ss = ss.source_set()
+nios2_ss.add(files('boot.c', 'cpu_pic.c'))
+nios2_ss.add(when: 'CONFIG_NIOS2_10M50', if_true: files('10m50_devboard.c'))
+nios2_ss.add(when: 'CONFIG_NIOS2_GENERIC_NOMMU', if_true: files('generic_nommu.c'))
+
+hw_arch += {'nios2': nios2_ss}
diff --git a/hw/openrisc/Makefile.objs b/hw/openrisc/Makefile.objs
deleted file mode 100644
index aa04de7..0000000
--- a/hw/openrisc/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-y = pic_cpu.o cputimer.o
-obj-$(CONFIG_OR1K_SIM) += openrisc_sim.o
diff --git a/hw/openrisc/meson.build b/hw/openrisc/meson.build
new file mode 100644
index 0000000..57c4255
--- /dev/null
+++ b/hw/openrisc/meson.build
@@ -0,0 +1,5 @@
+openrisc_ss = ss.source_set()
+openrisc_ss.add(files('pic_cpu.c', 'cputimer.c'))
+openrisc_ss.add(when: 'CONFIG_OR1K_SIM', if_true: files('openrisc_sim.c'))
+
+hw_arch += {'openrisc': openrisc_ss}
diff --git a/hw/ppc/Makefile.objs b/hw/ppc/Makefile.objs
deleted file mode 100644
index c3d3cc5..0000000
--- a/hw/ppc/Makefile.objs
+++ /dev/null
@@ -1,35 +0,0 @@
-# shared objects
-obj-y += ppc.o ppc_booke.o
-obj-$(CONFIG_FDT_PPC) += fdt.o
-obj-$(CONFIG_FW_CFG_PPC) += fw_cfg.o
-# IBM pSeries (sPAPR)
-obj-$(CONFIG_PSERIES) += spapr.o spapr_caps.o spapr_vio.o spapr_events.o
-obj-$(CONFIG_PSERIES) += spapr_hcall.o spapr_iommu.o spapr_rtas.o
-obj-$(CONFIG_PSERIES) += spapr_pci.o spapr_rtc.o spapr_drc.o
-obj-$(CONFIG_PSERIES) += spapr_cpu_core.o spapr_ovec.o spapr_irq.o
-obj-$(CONFIG_PSERIES) += spapr_tpm_proxy.o spapr_nvdimm.o
-obj-$(CONFIG_SPAPR_RNG) +=  spapr_rng.o
-obj-$(call land,$(CONFIG_PSERIES),$(CONFIG_LINUX)) += spapr_pci_vfio.o spapr_pci_nvlink2.o
-# IBM PowerNV
-obj-$(CONFIG_POWERNV) += pnv.o pnv_xscom.o pnv_core.o pnv_lpc.o pnv_psi.o pnv_occ.o pnv_bmc.o
-obj-$(CONFIG_POWERNV) += pnv_homer.o pnv_pnor.o
-
-obj-$(CONFIG_PSERIES) += spapr_rtas_ddw.o
-# PowerPC 4xx boards
-obj-$(CONFIG_PPC405) += ppc405_boards.o ppc405_uc.o
-obj-$(CONFIG_PPC440) += ppc440_bamboo.o ppc440_pcix.o ppc440_uc.o
-obj-$(CONFIG_PPC4XX) += ppc4xx_pci.o ppc4xx_devs.o
-obj-$(CONFIG_SAM460EX) += sam460ex.o
-# PReP
-obj-$(CONFIG_PREP) += prep.o
-obj-$(CONFIG_PREP) += prep_systemio.o
-obj-${CONFIG_RS6000_MC} += rs6000_mc.o
-# OldWorld PowerMac
-obj-$(CONFIG_MAC_OLDWORLD) += mac_oldworld.o
-# NewWorld PowerMac
-obj-$(CONFIG_MAC_NEWWORLD) += mac_newworld.o
-# e500
-obj-$(CONFIG_E500) += e500.o mpc8544ds.o e500plat.o
-obj-$(CONFIG_E500) += mpc8544_guts.o ppce500_spin.o
-# PowerPC 440 Xilinx ML507 reference board.
-obj-$(CONFIG_VIRTEX) += virtex_ml507.o
diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
new file mode 100644
index 0000000..918969b
--- /dev/null
+++ b/hw/ppc/meson.build
@@ -0,0 +1,80 @@
+ppc_ss = ss.source_set()
+ppc_ss.add(files(
+  'ppc.c',
+  'ppc_booke.c',
+))
+ppc_ss.add(when: 'CONFIG_FDT_PPC', if_true: [files(
+  'fdt.c',
+), fdt])
+ppc_ss.add(when: 'CONFIG_FW_CFG_PPC', if_true: files('fw_cfg.c'))
+
+# IBM pSeries (sPAPR)
+ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
+  'spapr.c',
+  'spapr_caps.c',
+  'spapr_vio.c',
+  'spapr_events.c',
+  'spapr_hcall.c',
+  'spapr_iommu.c',
+  'spapr_rtas.c',
+  'spapr_pci.c',
+  'spapr_rtc.c',
+  'spapr_drc.c',
+  'spapr_cpu_core.c',
+  'spapr_ovec.c',
+  'spapr_irq.c',
+  'spapr_tpm_proxy.c',
+  'spapr_nvdimm.c',
+  'spapr_rtas_ddw.c'
+))
+ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
+ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
+  'spapr_pci_vfio.c',
+  'spapr_pci_nvlink2.c'
+))
+
+# IBM PowerNV
+ppc_ss.add(when: 'CONFIG_POWERNV', if_true: files(
+  'pnv.c',
+  'pnv_xscom.c',
+  'pnv_core.c',
+  'pnv_lpc.c',
+  'pnv_psi.c',
+  'pnv_occ.c',
+  'pnv_bmc.c',
+  'pnv_homer.c',
+  'pnv_pnor.c',
+))
+# PowerPC 4xx boards
+ppc_ss.add(when: 'CONFIG_PPC405', if_true: files(
+  'ppc405_boards.c',
+  'ppc405_uc.c'))
+ppc_ss.add(when: 'CONFIG_PPC440', if_true: files(
+  'ppc440_bamboo.c',
+  'ppc440_pcix.c', 'ppc440_uc.c'))
+ppc_ss.add(when: 'CONFIG_PPC4XX', if_true: files(
+  'ppc4xx_pci.c',
+  'ppc4xx_devs.c'))
+ppc_ss.add(when: 'CONFIG_SAM460EX', if_true: files('sam460ex.c'))
+# PReP
+ppc_ss.add(when: 'CONFIG_PREP', if_true: files('prep.c'))
+ppc_ss.add(when: 'CONFIG_PREP', if_true: files('prep_systemio.c'))
+ppc_ss.add(when: 'CONFIG_RS6000_MC', if_true: files('rs6000_mc.c'))
+# OldWorld PowerMac
+ppc_ss.add(when: 'CONFIG_MAC_OLDWORLD', if_true: files('mac_oldworld.c'))
+# NewWorld PowerMac
+ppc_ss.add(when: 'CONFIG_MAC_NEWWORLD', if_true: files('mac_newworld.c'))
+# e500
+ppc_ss.add(when: 'CONFIG_E500', if_true: files(
+  'e500.c',
+  'mpc8544ds.c',
+  'e500plat.c'
+))
+ppc_ss.add(when: 'CONFIG_E500', if_true: files(
+  'mpc8544_guts.c',
+  'ppce500_spin.c'
+))
+# PowerPC 440 Xilinx ML507 reference board.
+ppc_ss.add(when: 'CONFIG_VIRTEX', if_true: files('virtex_ml507.c'))
+
+hw_arch += {'ppc': ppc_ss}
diff --git a/hw/riscv/Makefile.objs b/hw/riscv/Makefile.objs
deleted file mode 100644
index 57cc708..0000000
--- a/hw/riscv/Makefile.objs
+++ /dev/null
@@ -1,16 +0,0 @@
-obj-y += boot.o
-obj-$(CONFIG_SPIKE) += riscv_htif.o
-obj-$(CONFIG_HART) += riscv_hart.o
-obj-$(CONFIG_OPENTITAN) += opentitan.o
-obj-$(CONFIG_SIFIVE_E) += sifive_e.o
-obj-$(CONFIG_SIFIVE_E) += sifive_e_prci.o
-obj-$(CONFIG_SIFIVE) += sifive_clint.o
-obj-$(CONFIG_SIFIVE) += sifive_gpio.o
-obj-$(CONFIG_SIFIVE) += sifive_plic.o
-obj-$(CONFIG_SIFIVE) += sifive_test.o
-obj-$(CONFIG_SIFIVE_U) += sifive_u.o
-obj-$(CONFIG_SIFIVE_U) += sifive_u_otp.o
-obj-$(CONFIG_SIFIVE_U) += sifive_u_prci.o
-obj-$(CONFIG_SIFIVE) += sifive_uart.o
-obj-$(CONFIG_SPIKE) += spike.o
-obj-$(CONFIG_RISCV_VIRT) += virt.o
diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
new file mode 100644
index 0000000..2de8e5a
--- /dev/null
+++ b/hw/riscv/meson.build
@@ -0,0 +1,19 @@
+riscv_ss = ss.source_set()
+riscv_ss.add(files('boot.c'))
+riscv_ss.add(when: 'CONFIG_HART', if_true: files('riscv_hart.c'))
+riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
+riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_clint.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_gpio.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_plic.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_test.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE', if_true: files('sifive_uart.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE_E', if_true: files('sifive_e_prci.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u_otp.c'))
+riscv_ss.add(when: 'CONFIG_SIFIVE_U', if_true: files('sifive_u_prci.c'))
+riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('riscv_htif.c'))
+riscv_ss.add(when: 'CONFIG_SPIKE', if_true: files('spike.c'))
+
+hw_arch += {'riscv': riscv_ss}
diff --git a/hw/rx/Makefile.objs b/hw/rx/Makefile.objs
deleted file mode 100644
index 4ef6b9e..0000000
--- a/hw/rx/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-obj-$(CONFIG_RX62N_MCU) += rx62n.o
-obj-$(CONFIG_RX_GDBSIM) += rx-gdbsim.o
diff --git a/hw/rx/meson.build b/hw/rx/meson.build
new file mode 100644
index 0000000..d223512
--- /dev/null
+++ b/hw/rx/meson.build
@@ -0,0 +1,5 @@
+rx_ss = ss.source_set()
+rx_ss.add(when: 'CONFIG_RX_GDBSIM', if_true: files('rx-gdbsim.c'))
+rx_ss.add(when: 'CONFIG_RX62N_MCU', if_true: files('rx62n.c'))
+
+hw_arch += {'rx': rx_ss}
diff --git a/hw/s390x/Makefile.objs b/hw/s390x/Makefile.objs
deleted file mode 100644
index a46a1c7..0000000
--- a/hw/s390x/Makefile.objs
+++ /dev/null
@@ -1,37 +0,0 @@
-obj-y += s390-virtio-hcall.o
-obj-y += sclp.o
-obj-y += event-facility.o
-obj-y += sclpquiesce.o
-obj-y += sclpcpu.o
-obj-y += ipl.o
-obj-y += css.o
-obj-$(CONFIG_S390_CCW_VIRTIO) += s390-virtio-ccw.o
-obj-$(CONFIG_TERMINAL3270) += 3270-ccw.o
-ifeq ($(CONFIG_VIRTIO_CCW),y)
-obj-y += virtio-ccw.o
-obj-$(CONFIG_VIRTIO_SERIAL) += virtio-ccw-serial.o
-obj-$(CONFIG_VIRTIO_BALLOON) += virtio-ccw-balloon.o
-obj-$(CONFIG_VIRTIO_SCSI) += virtio-ccw-scsi.o
-obj-$(CONFIG_VIRTIO_RNG) += virtio-ccw-rng.o
-obj-$(CONFIG_VIRTIO_CRYPTO) += virtio-ccw-crypto.o
-obj-$(CONFIG_VIRTIO_GPU) += virtio-ccw-gpu.o
-obj-$(CONFIG_VIRTIO_INPUT) += virtio-ccw-input.o
-obj-$(CONFIG_VIRTIO_NET) += virtio-ccw-net.o
-obj-$(CONFIG_VIRTIO_BLK) += virtio-ccw-blk.o
-obj-$(call land,$(CONFIG_VIRTIO_9P),$(CONFIG_VIRTFS)) += virtio-ccw-9p.o
-obj-$(CONFIG_VHOST_VSOCK) += vhost-vsock-ccw.o
-endif
-obj-y += css-bridge.o
-obj-y += ccw-device.o
-obj-y += s390-pci-bus.o s390-pci-inst.o
-obj-y += s390-skeys.o
-obj-y += s390-stattrib.o
-obj-y += tod.o
-obj-y += tod-qemu.o
-obj-$(CONFIG_KVM) += tod-kvm.o
-obj-$(CONFIG_KVM) += s390-skeys-kvm.o
-obj-$(CONFIG_KVM) += s390-stattrib-kvm.o
-obj-$(CONFIG_KVM) += pv.o
-obj-y += s390-ccw.o
-obj-y += ap-device.o
-obj-y += ap-bridge.o
diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
new file mode 100644
index 0000000..b63782d
--- /dev/null
+++ b/hw/s390x/meson.build
@@ -0,0 +1,46 @@
+s390x_ss = ss.source_set()
+s390x_ss.add(files(
+  'ap-bridge.c',
+  'ap-device.c',
+  'ccw-device.c',
+  'css-bridge.c',
+  'css.c',
+  'event-facility.c',
+  'ipl.c',
+  's390-ccw.c',
+  's390-pci-bus.c',
+  's390-pci-inst.c',
+  's390-skeys.c',
+  's390-stattrib.c',
+  's390-virtio-hcall.c',
+  'sclp.c',
+  'sclpcpu.c',
+  'sclpquiesce.c',
+  'tod-qemu.c',
+  'tod.c',
+))
+s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
+  'tod-kvm.c',
+  's390-skeys-kvm.c',
+  's390-stattrib-kvm.c',
+  'pv.c',
+))
+s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-ccw.c'))
+s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
+
+virtio_ss = ss.source_set()
+virtio_ss.add(files('virtio-ccw.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ccw-balloon.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-ccw-blk.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-ccw-crypto.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: files('virtio-ccw-gpu.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-ccw-input.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_SCSI', if_true: files('virtio-ccw-scsi.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-ccw-serial.c'))
+virtio_ss.add(when: ['CONFIG_VIRTIO_9P', 'CONFIG_VIRTFS'], if_true: files('virtio-ccw-blk.c'))
+virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-ccw.c'))
+s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
+
+hw_arch += {'s390x': s390x_ss}
diff --git a/hw/sh4/Makefile.objs b/hw/sh4/Makefile.objs
deleted file mode 100644
index 2a707f9..0000000
--- a/hw/sh4/Makefile.objs
+++ /dev/null
@@ -1,4 +0,0 @@
-obj-y += sh7750.o sh7750_regnames.o
-obj-y += sh_pci.o
-obj-$(CONFIG_R2D) +=  r2d.o
-obj-$(CONFIG_SHIX) += shix.o
diff --git a/hw/sh4/meson.build b/hw/sh4/meson.build
new file mode 100644
index 0000000..303c0f4
--- /dev/null
+++ b/hw/sh4/meson.build
@@ -0,0 +1,10 @@
+sh4_ss = ss.source_set()
+sh4_ss.add(files(
+  'sh7750.c',
+  'sh7750_regnames.c',
+  'sh_pci.c'
+))
+sh4_ss.add(when: 'CONFIG_R2D', if_true: files('r2d.c'))
+sh4_ss.add(when: 'CONFIG_SHIX', if_true: files('shix.c'))
+
+hw_arch += {'sh4': sh4_ss}
diff --git a/hw/sparc/Makefile.objs b/hw/sparc/Makefile.objs
deleted file mode 100644
index d57e33f..0000000
--- a/hw/sparc/Makefile.objs
+++ /dev/null
@@ -1,3 +0,0 @@
-obj-$(CONFIG_SUN4M) += sun4m_iommu.o
-obj-$(CONFIG_SUN4M) += sun4m.o
-obj-$(CONFIG_LEON3) += leon3.o
diff --git a/hw/sparc/meson.build b/hw/sparc/meson.build
new file mode 100644
index 0000000..19c442c
--- /dev/null
+++ b/hw/sparc/meson.build
@@ -0,0 +1,6 @@
+sparc_ss = ss.source_set()
+sparc_ss.add(when: 'CONFIG_LEON3', if_true: files('leon3.c'))
+sparc_ss.add(when: 'CONFIG_SUN4M', if_true: files('sun4m.c'))
+sparc_ss.add(when: 'CONFIG_SUN4M', if_true: files('sun4m_iommu.c'))
+
+hw_arch += {'sparc': sparc_ss}
diff --git a/hw/sparc64/Makefile.objs b/hw/sparc64/Makefile.objs
deleted file mode 100644
index af0525c..0000000
--- a/hw/sparc64/Makefile.objs
+++ /dev/null
@@ -1,4 +0,0 @@
-obj-y += sparc64.o
-obj-$(CONFIG_SUN4U) += sun4u_iommu.o
-obj-$(CONFIG_SUN4U) += sun4u.o
-obj-$(CONFIG_NIAGARA) += niagara.o
diff --git a/hw/sparc64/meson.build b/hw/sparc64/meson.build
new file mode 100644
index 0000000..58b5504
--- /dev/null
+++ b/hw/sparc64/meson.build
@@ -0,0 +1,6 @@
+sparc64_ss = ss.source_set()
+sparc64_ss.add(files('sparc64.c'))
+sparc64_ss.add(when: 'CONFIG_NIAGARA', if_true: files('niagara.c'))
+sparc64_ss.add(when: 'CONFIG_SUN4U', if_true: files('sun4u.c', 'sun4u_iommu.c'))
+
+hw_arch += {'sparc64': sparc64_ss}
diff --git a/hw/tricore/Makefile.objs b/hw/tricore/Makefile.objs
deleted file mode 100644
index 5501f6c..0000000
--- a/hw/tricore/Makefile.objs
+++ /dev/null
@@ -1 +0,0 @@
-obj-$(CONFIG_TRICORE) += tricore_testboard.o
diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
new file mode 100644
index 0000000..579aa13
--- /dev/null
+++ b/hw/tricore/meson.build
@@ -0,0 +1,4 @@
+tricore_ss = ss.source_set()
+tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
+
+hw_arch += {'tricore': tricore_ss}
diff --git a/hw/unicore32/Makefile.objs b/hw/unicore32/Makefile.objs
deleted file mode 100644
index e0fd628..0000000
--- a/hw/unicore32/Makefile.objs
+++ /dev/null
@@ -1,4 +0,0 @@
-# For UniCore32 machines and boards
-
-# PKUnity-v3 SoC and board information
-obj-${CONFIG_PUV3} += puv3.o
diff --git a/hw/unicore32/meson.build b/hw/unicore32/meson.build
new file mode 100644
index 0000000..fc26d6b
--- /dev/null
+++ b/hw/unicore32/meson.build
@@ -0,0 +1,5 @@
+unicore32_ss = ss.source_set()
+# PKUnity-v3 SoC and board information
+unicore32_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3.c'))
+
+hw_arch += {'unicore32': unicore32_ss}
diff --git a/hw/xenpv/Makefile.objs b/hw/xenpv/Makefile.objs
deleted file mode 100644
index 8bfa458..0000000
--- a/hw/xenpv/Makefile.objs
+++ /dev/null
@@ -1,2 +0,0 @@
-# Xen PV machine support
-obj-$(CONFIG_XEN) += xen_machine_pv.o
diff --git a/hw/xenpv/meson.build b/hw/xenpv/meson.build
new file mode 100644
index 0000000..40f911a
--- /dev/null
+++ b/hw/xenpv/meson.build
@@ -0,0 +1,3 @@
+xenpv_ss = ss.source_set()
+
+xenpv_ss.add(when: 'CONFIG_XEN', if_true: files('xen_machine_pv.c'))
diff --git a/hw/xtensa/Makefile.objs b/hw/xtensa/Makefile.objs
deleted file mode 100644
index 2b40e1b..0000000
--- a/hw/xtensa/Makefile.objs
+++ /dev/null
@@ -1,6 +0,0 @@
-obj-y += mx_pic.o
-obj-y += pic_cpu.o
-obj-y += xtensa_memory.o
-obj-$(CONFIG_XTENSA_SIM) += sim.o
-obj-$(CONFIG_XTENSA_VIRT) += virt.o
-obj-$(CONFIG_XTENSA_XTFPGA) += xtfpga.o
diff --git a/hw/xtensa/meson.build b/hw/xtensa/meson.build
new file mode 100644
index 0000000..1d5835d
--- /dev/null
+++ b/hw/xtensa/meson.build
@@ -0,0 +1,11 @@
+xtensa_ss = ss.source_set()
+xtensa_ss.add(files(
+  'mx_pic.c',
+  'pic_cpu.c',
+  'xtensa_memory.c',
+))
+xtensa_ss.add(when: 'CONFIG_XTENSA_SIM', if_true: files('sim.c'))
+xtensa_ss.add(when: 'CONFIG_XTENSA_VIRT', if_true: files('virt.c'))
+xtensa_ss.add(when: 'CONFIG_XTENSA_XTFPGA', if_true: files('xtfpga.c'))
+
+hw_arch += {'xtensa': xtensa_ss}
diff --git a/meson.build b/meson.build
index e2a80b8..03d9876 100644
--- a/meson.build
+++ b/meson.build
@@ -760,6 +760,10 @@ foreach target : target_dirs
   if target.endswith('-softmmu')
     qemu_target_name = 'qemu-system-' + target_name
     target_type='system'
+    hw_dir = target_name == 'sparc64' ? 'sparc64' : arch
+    hw = hw_arch[hw_dir].apply(config_target, strict: false)
+    arch_srcs += hw.sources()
+
     arch_srcs += config_devices_h[target]
   else
     target_type='user'
-- 
1.8.3.1



