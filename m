Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A19F2447C0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 12:11:57 +0200 (CEST)
Received: from localhost ([::1]:44538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6Wgm-0006DB-24
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 06:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnQ-00073f-6X
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k6VnK-00034E-M2
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 05:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597396477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCtt3wfDk2U6pD6XbYja2DKFOXpiv+tulHE30GporkU=;
 b=XI8z6D2JFndA4i+49KBSj0xC4milP/YVC0IxyuxSCKuPksHDNqie/0zlWUYJfbOLsoySxJ
 ThggmLdC7L396/ZYmdWyn3zZGP4ymzGMIsvgw3ml2ppHlOGuLR4B/DNP0VKjiK9IrlLo+5
 mU/kUXYhkB4MNrLOZwQjlPhMRnPyWmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-OIXvaZFGMO20ft75ardDwQ-1; Fri, 14 Aug 2020 05:14:36 -0400
X-MC-Unique: OIXvaZFGMO20ft75ardDwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4994A1853DB0
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 09:14:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 085B6600E4;
 Fri, 14 Aug 2020 09:14:34 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 096/150] meson: convert hw/timer
Date: Fri, 14 Aug 2020 05:12:32 -0400
Message-Id: <20200814091326.16173-97-pbonzini@redhat.com>
In-Reply-To: <20200814091326.16173-1-pbonzini@redhat.com>
References: <20200814091326.16173-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/14 05:13:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/Makefile.objs       |  1 -
 hw/meson.build         |  1 +
 hw/timer/Makefile.objs | 41 -----------------------------------------
 hw/timer/meson.build   | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 38 insertions(+), 42 deletions(-)
 delete mode 100644 hw/timer/Makefile.objs
 create mode 100644 hw/timer/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index f0e5728d13..70ecaa8135 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -28,7 +28,6 @@ devices-dirs-y += rtc/
 devices-dirs-$(CONFIG_SCSI) += scsi/
 devices-dirs-y += sd/
 devices-dirs-y += ssi/
-devices-dirs-y += timer/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/meson.build b/hw/meson.build
index 2ddf6bad33..50b26db852 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -3,6 +3,7 @@ subdir('mem')
 subdir('nubus')
 subdir('semihosting')
 subdir('smbios')
+subdir('timer')
 subdir('tpm')
 subdir('usb')
 subdir('vfio')
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
deleted file mode 100644
index 1303b13e0d..0000000000
--- a/hw/timer/Makefile.objs
+++ /dev/null
@@ -1,41 +0,0 @@
-common-obj-$(CONFIG_ARM_TIMER) += arm_timer.o
-common-obj-$(CONFIG_ARM_MPTIMER) += arm_mptimer.o
-common-obj-$(CONFIG_ARM_V7M) += armv7m_systick.o
-common-obj-$(CONFIG_A9_GTIMER) += a9gtimer.o
-common-obj-$(CONFIG_CADENCE) += cadence_ttc.o
-common-obj-$(CONFIG_HPET) += hpet.o
-common-obj-$(CONFIG_I8254) += i8254_common.o i8254.o
-common-obj-$(CONFIG_PUV3) += puv3_ost.o
-common-obj-$(CONFIG_XILINX) += xilinx_timer.o
-common-obj-$(CONFIG_SLAVIO) += slavio_timer.o
-common-obj-$(CONFIG_ETRAXFS) += etraxfs_timer.o
-common-obj-$(CONFIG_GRLIB) += grlib_gptimer.o
-common-obj-$(CONFIG_IMX) += imx_epit.o
-common-obj-$(CONFIG_IMX) += imx_gpt.o
-common-obj-$(CONFIG_LM32) += lm32_timer.o
-common-obj-$(CONFIG_MILKYMIST) += milkymist-sysctl.o
-common-obj-$(CONFIG_NRF51_SOC) += nrf51_timer.o
-
-common-obj-$(CONFIG_ALTERA_TIMER) += altera_timer.o
-common-obj-$(CONFIG_EXYNOS4) += exynos4210_mct.o
-common-obj-$(CONFIG_EXYNOS4) += exynos4210_pwm.o
-common-obj-$(CONFIG_OMAP) += omap_gptimer.o
-common-obj-$(CONFIG_OMAP) += omap_synctimer.o
-common-obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
-common-obj-$(CONFIG_SH4) += sh_timer.o
-common-obj-$(CONFIG_RENESAS_TMR) += renesas_tmr.o
-common-obj-$(CONFIG_RENESAS_CMT) += renesas_cmt.o
-common-obj-$(CONFIG_DIGIC) += digic-timer.o
-common-obj-$(CONFIG_MIPS_CPS) += mips_gictimer.o
-
-common-obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
-
-common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
-common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
-
-common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
-common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) += cmsdk-apb-dualtimer.o
-common-obj-$(CONFIG_MSF2) += mss-timer.o
-common-obj-$(CONFIG_RASPI) += bcm2835_systmr.o
-
-obj-$(CONFIG_AVR_TIMER16) += avr_timer16.o
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
new file mode 100644
index 0000000000..9f0a267c83
--- /dev/null
+++ b/hw/timer/meson.build
@@ -0,0 +1,37 @@
+softmmu_ss.add(when: 'CONFIG_A9_GTIMER', if_true: files('a9gtimer.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_PIT', if_true: files('allwinner-a10-pit.c'))
+softmmu_ss.add(when: 'CONFIG_ALTERA_TIMER', if_true: files('altera_timer.c'))
+softmmu_ss.add(when: 'CONFIG_ARM_MPTIMER', if_true: files('arm_mptimer.c'))
+softmmu_ss.add(when: 'CONFIG_ARM_TIMER', if_true: files('arm_timer.c'))
+softmmu_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_systick.c'))
+softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_timer.c'))
+softmmu_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_ttc.c'))
+softmmu_ss.add(when: 'CONFIG_CMSDK_APB_DUALTIMER', if_true: files('cmsdk-apb-dualtimer.c'))
+softmmu_ss.add(when: 'CONFIG_CMSDK_APB_TIMER', if_true: files('cmsdk-apb-timer.c'))
+softmmu_ss.add(when: 'CONFIG_RENESAS_TMR', if_true: files('renesas_tmr.c'))
+softmmu_ss.add(when: 'CONFIG_RENESAS_CMT', if_true: files('renesas_cmt.c'))
+softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic-timer.c'))
+softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_timer.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_mct.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_pwm.c'))
+softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_gptimer.c'))
+softmmu_ss.add(when: 'CONFIG_HPET', if_true: files('hpet.c'))
+softmmu_ss.add(when: 'CONFIG_I8254', if_true: files('i8254_common.c', 'i8254.c'))
+softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_epit.c'))
+softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpt.c'))
+softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_timer.c'))
+softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-sysctl.c'))
+softmmu_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gictimer.c'))
+softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('mss-timer.c'))
+softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_timer.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gptimer.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_synctimer.c'))
+softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_ost.c'))
+softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
+softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_timer.c'))
+softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
+
+specific_ss.add(when: 'CONFIG_AVR_TIMER16', if_true: files('avr_timer16.c'))
-- 
2.26.2



