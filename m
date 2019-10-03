Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5EFCB230
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 01:16:05 +0200 (CEST)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGAKK-0007ya-1D
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 19:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGA9l-0000um-5k
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 19:05:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGA9i-0005zf-J6
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 19:05:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54910)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iGA9E-0005qe-BJ; Thu, 03 Oct 2019 19:04:38 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 14CEB18CB8F4;
 Thu,  3 Oct 2019 23:04:33 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D4C110013A7;
 Thu,  3 Oct 2019 23:04:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/14] hw/timer: Compile devices not target-dependent as
 common object
Date: Fri,  4 Oct 2019 01:03:51 +0200
Message-Id: <20191003230404.19384-2-philmd@redhat.com>
In-Reply-To: <20191003230404.19384-1-philmd@redhat.com>
References: <20191003230404.19384-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 03 Oct 2019 23:04:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All these devices do not contain any target-specific. While most
of them are arch-specific, they are shared between different
targets of the same arch family (ARM and AArch64, MIPS32/MIPS64,
endianess, ...).
Put them into common-obj-y to compile them once for all targets.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/Makefile.objs | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 123d92c969..f407523aa4 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -25,20 +25,20 @@ common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.=
o
 common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-rtc.o
 common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_timer.o
=20
-obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
-obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
-obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
-obj-$(CONFIG_SH4) +=3D sh_timer.o
-obj-$(CONFIG_DIGIC) +=3D digic-timer.o
-obj-$(CONFIG_MIPS_CPS) +=3D mips_gictimer.o
+common-obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
+common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
+common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
+common-obj-$(CONFIG_EXYNOS4) +=3D exynos4210_rtc.o
+common-obj-$(CONFIG_OMAP) +=3D omap_gptimer.o
+common-obj-$(CONFIG_OMAP) +=3D omap_synctimer.o
+common-obj-$(CONFIG_PXA2XX) +=3D pxa2xx_timer.o
+common-obj-$(CONFIG_SH4) +=3D sh_timer.o
+common-obj-$(CONFIG_DIGIC) +=3D digic-timer.o
+common-obj-$(CONFIG_MIPS_CPS) +=3D mips_gictimer.o
=20
 obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
=20
-obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
+common-obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
=20
 common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
 common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o aspeed_rtc.o
--=20
2.20.1


