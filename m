Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A178D24D3C0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:19:13 +0200 (CEST)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k954i-0002HI-Mj
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94Eg-0003cw-AT
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54955
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1k94EU-0001un-Qf
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 06:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598005513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNT/jS4WliFELB3Y4N1skk3//tCoNoB/v6xjsu+GKJM=;
 b=SVtm+khgJNNHfIbB7rEiorufINUL2erU4+Dxdbxvtgb7Gy21QpIn3gc9rV1dGjQm970fee
 0aUhjAAk8+AyPRGhNT8MHkpB3YdpPNEieFYkwqoKl2x5YltrKW8pcrPR3A8Egy2Qsd/3WJ
 EfatzmDsYEhoE4Hnh/L1M8Do5M3wLJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-i3zxzCblOeK14KsPaGXxvQ-1; Fri, 21 Aug 2020 06:25:11 -0400
X-MC-Unique: i3zxzCblOeK14KsPaGXxvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBED781F036
 for <qemu-devel@nongnu.org>; Fri, 21 Aug 2020 10:25:10 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95D4610098AE;
 Fri, 21 Aug 2020 10:25:10 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v8 122/152] meson: convert hw/char
Date: Fri, 21 Aug 2020 06:22:59 -0400
Message-Id: <20200821102329.29777-123-pbonzini@redhat.com>
In-Reply-To: <20200821102329.29777-1-pbonzini@redhat.com>
References: <20200821102329.29777-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 hw/Makefile.objs      |  1 -
 hw/char/Makefile.objs | 39 ---------------------------------------
 hw/char/meson.build   | 38 ++++++++++++++++++++++++++++++++++++++
 hw/meson.build        |  1 +
 4 files changed, 39 insertions(+), 40 deletions(-)
 delete mode 100644 hw/char/Makefile.objs
 create mode 100644 hw/char/meson.build

diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 97ad30295e..04cfb6ca6d 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -4,7 +4,6 @@ devices-dirs-y += acpi/
 devices-dirs-y += adc/
 devices-dirs-y += audio/
 devices-dirs-y += block/
-devices-dirs-y += char/
 endif
 
 common-obj-y += $(devices-dirs-y)
diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
deleted file mode 100644
index bf177ac41d..0000000000
--- a/hw/char/Makefile.objs
+++ /dev/null
@@ -1,39 +0,0 @@
-common-obj-$(CONFIG_IPACK) += ipoctal232.o
-common-obj-$(CONFIG_ESCC) += escc.o
-common-obj-$(CONFIG_NRF51_SOC) += nrf51_uart.o
-common-obj-$(CONFIG_PARALLEL) += parallel.o
-common-obj-$(CONFIG_ISA_BUS) += parallel-isa.o
-common-obj-$(CONFIG_PL011) += pl011.o
-common-obj-$(CONFIG_SERIAL) += serial.o
-common-obj-$(CONFIG_SERIAL_ISA) += serial-isa.o
-common-obj-$(CONFIG_SERIAL_PCI) += serial-pci.o
-common-obj-$(CONFIG_SERIAL_PCI_MULTI) += serial-pci-multi.o
-common-obj-$(CONFIG_VIRTIO_SERIAL) += virtio-console.o
-common-obj-$(CONFIG_XILINX) += xilinx_uartlite.o
-common-obj-$(CONFIG_XEN) += xen_console.o
-common-obj-$(CONFIG_CADENCE) += cadence_uart.o
-common-obj-$(CONFIG_IBEX) += ibex_uart.o
-
-common-obj-$(CONFIG_EXYNOS4) += exynos4210_uart.o
-common-obj-$(CONFIG_COLDFIRE) += mcf_uart.o
-common-obj-$(CONFIG_OMAP) += omap_uart.o
-common-obj-$(CONFIG_SH4) += sh_serial.o
-common-obj-$(CONFIG_DIGIC) += digic-uart.o
-common-obj-$(CONFIG_STM32F2XX_USART) += stm32f2xx_usart.o
-common-obj-$(CONFIG_RASPI) += bcm2835_aux.o
-common-obj-$(CONFIG_RENESAS_SCI) += renesas_sci.o
-common-obj-$(CONFIG_AVR_USART) += avr_usart.o
-
-common-obj-$(CONFIG_CMSDK_APB_UART) += cmsdk-apb-uart.o
-common-obj-$(CONFIG_ETRAXFS) += etraxfs_ser.o
-common-obj-$(CONFIG_ISA_DEBUG) += debugcon.o
-common-obj-$(CONFIG_GRLIB) += grlib_apbuart.o
-common-obj-$(CONFIG_IMX) += imx_serial.o
-common-obj-$(CONFIG_LM32) += lm32_juart.o
-common-obj-$(CONFIG_LM32) += lm32_uart.o
-common-obj-$(CONFIG_MILKYMIST) += milkymist-uart.o
-common-obj-$(CONFIG_SCLPCONSOLE) += sclpconsole.o sclpconsole-lm.o
-
-obj-$(CONFIG_VIRTIO) += virtio-serial-bus.o
-obj-$(CONFIG_PSERIES) += spapr_vty.o
-obj-$(CONFIG_TERMINAL3270) += terminal3270.o
diff --git a/hw/char/meson.build b/hw/char/meson.build
new file mode 100644
index 0000000000..e888215145
--- /dev/null
+++ b/hw/char/meson.build
@@ -0,0 +1,38 @@
+softmmu_ss.add(when: 'CONFIG_CADENCE', if_true: files('cadence_uart.c'))
+softmmu_ss.add(when: 'CONFIG_CMSDK_APB_UART', if_true: files('cmsdk-apb-uart.c'))
+softmmu_ss.add(when: 'CONFIG_ESCC', if_true: files('escc.c'))
+softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_ser.c'))
+softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_apbuart.c'))
+softmmu_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_uart.c'))
+softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_serial.c'))
+softmmu_ss.add(when: 'CONFIG_IPACK', if_true: files('ipoctal232.c'))
+softmmu_ss.add(when: 'CONFIG_ISA_BUS', if_true: files('parallel-isa.c'))
+softmmu_ss.add(when: 'CONFIG_ISA_DEBUG', if_true: files('debugcon.c'))
+softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_juart.c'))
+softmmu_ss.add(when: 'CONFIG_LM32', if_true: files('lm32_uart.c'))
+softmmu_ss.add(when: 'CONFIG_MILKYMIST', if_true: files('milkymist-uart.c'))
+softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_uart.c'))
+softmmu_ss.add(when: 'CONFIG_PARALLEL', if_true: files('parallel.c'))
+softmmu_ss.add(when: 'CONFIG_PL011', if_true: files('pl011.c'))
+softmmu_ss.add(when: 'CONFIG_SCLPCONSOLE', if_true: files('sclpconsole.c', 'sclpconsole-lm.c'))
+softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('serial.c'))
+softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
+softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
+softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci-multi.c'))
+softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-console.c'))
+softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
+
+softmmu_ss.add(when: 'CONFIG_AVR_USART', if_true: files('avr_usart.c'))
+softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_uart.c'))
+softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic-uart.c'))
+softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_uart.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_uart.c'))
+softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
+softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
+softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_serial.c'))
+softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
+
+specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
+specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
+specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_vty.c'))
diff --git a/hw/meson.build b/hw/meson.build
index 103da4840b..dd0c77ec2b 100644
--- a/hw/meson.build
+++ b/hw/meson.build
@@ -1,3 +1,4 @@
+subdir('char')
 subdir('core')
 subdir('cpu')
 subdir('display')
-- 
2.26.2



