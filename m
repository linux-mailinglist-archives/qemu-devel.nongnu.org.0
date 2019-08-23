Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9469B182
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 16:01:06 +0200 (CEST)
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1A7l-00034t-Od
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 10:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1A5L-0001aP-9w
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:58:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1A5K-0007ML-1f
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:58:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45696)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1A5H-0007Jp-Fu; Fri, 23 Aug 2019 09:58:31 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5C399300CB28;
 Fri, 23 Aug 2019 13:58:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 285CC4526;
 Fri, 23 Aug 2019 13:58:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 15:58:10 +0200
Message-Id: <20190823135811.13883-4-philmd@redhat.com>
In-Reply-To: <20190823135811.13883-1-philmd@redhat.com>
References: <20190823135811.13883-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Fri, 23 Aug 2019 13:58:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/4] RFC target/arm: Do not build pre-ARMv7
 cpus when using KVM
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A KVM-only build won't be able to run pre-ARMv7 cpus, disable them.

If KVM is not enabled, they are enabled by default.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Sadly this does not work with --enable-tcg --enable-kvm dual config.
---
 default-configs/arm-softmmu.mak | 33 ++++++++++++++++-----------------
 hw/arm/Kconfig                  | 26 ++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 1f2e0e7fde..081d507c87 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -9,34 +9,33 @@ CONFIG_ARM_V7M=3Dy
 CONFIG_ARM_VIRT=3Dy
 CONFIG_CUBIEBOARD=3Dy
 CONFIG_EXYNOS4=3Dy
-CONFIG_HIGHBANK=3Dy
-CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
-CONFIG_MUSICPAL=3Dy
 CONFIG_MUSCA=3Dy
-CONFIG_CHEETAH=3Dy
-CONFIG_SX1=3Dy
-CONFIG_NSERIES=3Dy
 CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
-CONFIG_VERSATILE=3Dy
 CONFIG_VEXPRESS=3Dy
 CONFIG_ZYNQ=3Dy
-CONFIG_MAINSTONE=3Dy
-CONFIG_GUMSTIX=3Dy
-CONFIG_SPITZ=3Dy
-CONFIG_TOSA=3Dy
-CONFIG_Z2=3Dy
-CONFIG_COLLIE=3Dy
-CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
-CONFIG_DIGIC=3Dy
 CONFIG_SABRELITE=3Dy
 CONFIG_EMCRAFT_SF2=3Dy
-CONFIG_MICROBIT=3Dy
-CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
 CONFIG_SEMIHOSTING=3Dy
+#CONFIG_CHEETAH=3Dy
+#CONFIG_SX1=3Dy
+#CONFIG_DIGIC=3Dy
+#CONFIG_INTEGRATOR=3Dy
+#CONFIG_MUSICPAL=3Dy
+#CONFIG_MAINSTONE=3Dy
+#CONFIG_GUMSTIX=3Dy
+#CONFIG_SPITZ=3Dy
+#CONFIG_TOSA=3Dy
+#CONFIG_COLLIE=3Dy
+#CONFIG_VERSATILE=3Dy
+#CONFIG_FSL_IMX25=3Dy
+#CONFIG_ASPEED_SOC=3Dy
+#CONFIG_NSERIES=3Dy
+#CONFIG_HIGHBANK=3Dn
+#CONFIG_MICROBIT=3Dn
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 76a2a6bcbf..902cceca7e 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -1,3 +1,18 @@
+config ARM_V4
+    default y
+    depends on !KVM
+    bool
+
+config ARM_V5
+    default y
+    depends on !KVM
+    bool
+
+config ARM_V6
+    default y
+    depends on !KVM
+    bool
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -23,6 +38,7 @@ config ARM_VIRT
=20
 config CHEETAH
     bool
+    select ARM_V4
     select OMAP
     select TSC210X
=20
@@ -32,6 +48,7 @@ config CUBIEBOARD
=20
 config DIGIC
     bool
+    select ARM_V5
     select PTIMER
     select PFLASH_CFI02
=20
@@ -61,6 +78,7 @@ config HIGHBANK
=20
 config INTEGRATOR
     bool
+    select ARM_V5
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -86,6 +104,7 @@ config MUSCA
=20
 config MUSICPAL
     bool
+    select ARM_V5
     select BITBANG_I2C
     select MARVELL_88W8618
     select PTIMER
@@ -99,6 +118,7 @@ config NETDUINO2
=20
 config NSERIES
     bool
+    select ARM_V6
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -121,6 +141,7 @@ config OMAP
=20
 config PXA2XX
     bool
+    select ARM_V5
     select FRAMEBUFFER
     select I2C
     select SERIAL
@@ -232,10 +253,12 @@ config COLLIE
=20
 config SX1
     bool
+    select ARM_V4
     select OMAP
=20
 config VERSATILE
     bool
+    select ARM_V5
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -327,6 +350,7 @@ config XLNX_VERSAL
=20
 config FSL_IMX25
     bool
+    select ARM_V5
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -334,6 +358,7 @@ config FSL_IMX25
=20
 config FSL_IMX31
     bool
+    select ARM_V6
     select SERIAL
     select IMX
     select IMX_I2C
@@ -349,6 +374,7 @@ config FSL_IMX6
=20
 config ASPEED_SOC
     bool
+    select ARM_V5
     select DS1338
     select FTGMAC100
     select I2C
--=20
2.20.1


