Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE71916B30A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 22:45:10 +0100 (CET)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6LXJ-0006I9-QZ
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 16:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kr3-0006fw-3l
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:01:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kr1-0007CS-1L
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:01:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54048
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kqw-0007Af-If
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKmzrDzCP3CHZZoaY+XwEe6zXXagucHV9nyh6xOHbq4=;
 b=IDLPUefObRGMRPw7y0pnJmA7QQBTREWMvjpAtpkaGJQWmSUPH9BOSknqDRF+xfAbALWjJg
 ZwBs6xZcqyuygHtVaXIGW1/ak1yUUZtapcm9f8s4rW7PHDOnz6GGtcklMTe2s7Q7RdDMTE
 Rpi8+TEQfXniHG5R9hSQ0xe95YJm4mI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-u_6tkaW2MGeUpA4NqY-6Qg-1; Mon, 24 Feb 2020 16:01:20 -0500
X-MC-Unique: u_6tkaW2MGeUpA4NqY-6Qg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30EE98017CC;
 Mon, 24 Feb 2020 21:01:16 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 571AC5C21B;
 Mon, 24 Feb 2020 21:01:01 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 23/32] hw/arm: Let devices own the MemoryRegion they
 create
Date: Mon, 24 Feb 2020 21:55:24 +0100
Message-Id: <20200224205533.23798-24-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid orphan memory regions being added in the /unattached QOM
container.

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4210.c    | 12 ++++++------
 hw/arm/fsl-imx25.c     | 10 +++++-----
 hw/arm/fsl-imx31.c     |  6 +++---
 hw/arm/fsl-imx6.c      |  6 +++---
 hw/arm/fsl-imx6ul.c    |  9 +++++----
 hw/arm/msf2-soc.c      |  6 +++---
 hw/arm/nrf51_soc.c     |  2 +-
 hw/arm/stm32f205_soc.c |  8 ++++----
 hw/arm/stm32f405_soc.c |  9 +++++----
 hw/arm/xlnx-zynqmp.c   | 11 +++++------
 10 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 4e1fd7edb3..1f7253ef6f 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -305,20 +305,20 @@ static void exynos4210_realize(DeviceState *socdev, E=
rror **errp)
     /*** Memory ***/
=20
     /* Chip-ID and OMR */
-    memory_region_init_io(&s->chipid_mem, NULL, &exynos4210_chipid_and_omr=
_ops,
-        NULL, "exynos4210.chipid", sizeof(chipid_and_omr));
+    memory_region_init_io(&s->chipid_mem, OBJECT(socdev),
+                          &exynos4210_chipid_and_omr_ops, NULL,
+                          "exynos4210.chipid", sizeof(chipid_and_omr));
     memory_region_add_subregion(system_mem, EXYNOS4210_CHIPID_ADDR,
                                 &s->chipid_mem);
=20
     /* Internal ROM */
-    memory_region_init_rom(&s->irom_mem, NULL, "exynos4210.irom",
+    memory_region_init_rom(&s->irom_mem, OBJECT(socdev), "exynos4210.irom"=
,
                            EXYNOS4210_IROM_SIZE, &error_fatal);
     memory_region_add_subregion(system_mem, EXYNOS4210_IROM_BASE_ADDR,
                                 &s->irom_mem);
     /* mirror of iROM */
-    memory_region_init_alias(&s->irom_alias_mem, NULL, "exynos4210.irom_al=
ias",
-                             &s->irom_mem,
-                             0,
+    memory_region_init_alias(&s->irom_alias_mem, OBJECT(socdev),
+                             "exynos4210.irom_alias", &s->irom_mem, 0,
                              EXYNOS4210_IROM_SIZE);
     memory_region_add_subregion(system_mem, EXYNOS4210_IROM_MIRROR_BASE_AD=
DR,
                                 &s->irom_alias_mem);
diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index da3471b395..104bff6d61 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -247,16 +247,16 @@ static void fsl_imx25_realize(DeviceState *dev, Error=
 **errp)
     }
=20
     /* initialize 2 x 16 KB ROM */
-    memory_region_init_rom(&s->rom[0], NULL,
-                           "imx25.rom0", FSL_IMX25_ROM0_SIZE, &err);
+    memory_region_init_rom(&s->rom[0], OBJECT(dev), "imx25.rom0",
+                           FSL_IMX25_ROM0_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_ROM0_ADDR,
                                 &s->rom[0]);
-    memory_region_init_rom(&s->rom[1], NULL,
-                           "imx25.rom1", FSL_IMX25_ROM1_SIZE, &err);
+    memory_region_init_rom(&s->rom[1], OBJECT(dev), "imx25.rom1",
+                           FSL_IMX25_ROM1_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
         return;
@@ -275,7 +275,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error *=
*errp)
                                 &s->iram);
=20
     /* internal RAM (128 KB) is aliased over 128 MB - 128 KB */
-    memory_region_init_alias(&s->iram_alias, NULL, "imx25.iram_alias",
+    memory_region_init_alias(&s->iram_alias, OBJECT(dev), "imx25.iram_alia=
s",
                              &s->iram, 0, FSL_IMX25_IRAM_ALIAS_SIZE);
     memory_region_add_subregion(get_system_memory(), FSL_IMX25_IRAM_ALIAS_=
ADDR,
                                 &s->iram_alias);
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 55e90d104b..8472d2e911 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -206,7 +206,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error *=
*errp)
     }
=20
     /* On a real system, the first 16k is a `secure boot rom' */
-    memory_region_init_rom(&s->secure_rom, NULL, "imx31.secure_rom",
+    memory_region_init_rom(&s->secure_rom, OBJECT(dev), "imx31.secure_rom"=
,
                            FSL_IMX31_SECURE_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
@@ -216,7 +216,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error *=
*errp)
                                 &s->secure_rom);
=20
     /* There is also a 16k ROM */
-    memory_region_init_rom(&s->rom, NULL, "imx31.rom",
+    memory_region_init_rom(&s->rom, OBJECT(dev), "imx31.rom",
                            FSL_IMX31_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
@@ -236,7 +236,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error *=
*errp)
                                 &s->iram);
=20
     /* internal RAM (16 KB) is aliased over 256 MB - 16 KB */
-    memory_region_init_alias(&s->iram_alias, NULL, "imx31.iram_alias",
+    memory_region_init_alias(&s->iram_alias, OBJECT(dev), "imx31.iram_alia=
s",
                              &s->iram, 0, FSL_IMX31_IRAM_ALIAS_SIZE);
     memory_region_add_subregion(get_system_memory(), FSL_IMX31_IRAM_ALIAS_=
ADDR,
                                 &s->iram_alias);
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index ecc62855f2..9c09f71435 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -405,7 +405,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **=
errp)
     }
=20
     /* ROM memory */
-    memory_region_init_rom(&s->rom, NULL, "imx6.rom",
+    memory_region_init_rom(&s->rom, OBJECT(dev), "imx6.rom",
                            FSL_IMX6_ROM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
@@ -415,7 +415,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **=
errp)
                                 &s->rom);
=20
     /* CAAM memory */
-    memory_region_init_rom(&s->caam, NULL, "imx6.caam",
+    memory_region_init_rom(&s->caam, OBJECT(dev), "imx6.caam",
                            FSL_IMX6_CAAM_MEM_SIZE, &err);
     if (err) {
         error_propagate(errp, err);
@@ -435,7 +435,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **=
errp)
                                 &s->ocram);
=20
     /* internal OCRAM (256 KB) is aliased over 1 MB */
-    memory_region_init_alias(&s->ocram_alias, NULL, "imx6.ocram_alias",
+    memory_region_init_alias(&s->ocram_alias, OBJECT(dev), "imx6.ocram_ali=
as",
                              &s->ocram, 0, FSL_IMX6_OCRAM_ALIAS_SIZE);
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_OCRAM_ALIAS_=
ADDR,
                                 &s->ocram_alias);
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index c405b68d1d..f4a9ed6c4f 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -543,7 +543,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error =
**errp)
     /*
      * ROM memory
      */
-    memory_region_init_rom(&s->rom, NULL, "imx6ul.rom",
+    memory_region_init_rom(&s->rom, OBJECT(dev), "imx6ul.rom",
                            FSL_IMX6UL_ROM_SIZE, &error_abort);
     memory_region_add_subregion(get_system_memory(), FSL_IMX6UL_ROM_ADDR,
                                 &s->rom);
@@ -551,7 +551,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error =
**errp)
     /*
      * CAAM memory
      */
-    memory_region_init_rom(&s->caam, NULL, "imx6ul.caam",
+    memory_region_init_rom(&s->caam, OBJECT(dev), "imx6ul.caam",
                            FSL_IMX6UL_CAAM_MEM_SIZE, &error_abort);
     memory_region_add_subregion(get_system_memory(), FSL_IMX6UL_CAAM_MEM_A=
DDR,
                                 &s->caam);
@@ -568,8 +568,9 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error =
**errp)
     /*
      * internal OCRAM (128 KB) is aliased over 512 KB
      */
-    memory_region_init_alias(&s->ocram_alias, NULL, "imx6ul.ocram_alias",
-                             &s->ocram, 0, FSL_IMX6UL_OCRAM_ALIAS_SIZE);
+    memory_region_init_alias(&s->ocram_alias, OBJECT(dev),
+                             "imx6ul.ocram_alias", &s->ocram, 0,
+                             FSL_IMX6UL_OCRAM_ALIAS_SIZE);
     memory_region_add_subregion(get_system_memory(),
                                 FSL_IMX6UL_OCRAM_ALIAS_ADDR, &s->ocram_ali=
as);
 }
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 8f84692e64..588d643b8d 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -96,7 +96,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Erro=
r **errp)
     MemoryRegion *nvm_alias =3D g_new(MemoryRegion, 1);
     MemoryRegion *sram =3D g_new(MemoryRegion, 1);
=20
-    memory_region_init_rom(nvm, NULL, "MSF2.eNVM", s->envm_size,
+    memory_region_init_rom(nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size=
,
                            &error_fatal);
     /*
      * On power-on, the eNVM region 0x60000000 is automatically
@@ -104,8 +104,8 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Er=
ror **errp)
      * start address (0x0). We do not support remapping other eNVM,
      * eSRAM and DDR regions by guest(via Sysreg) currently.
      */
-    memory_region_init_alias(nvm_alias, NULL, "MSF2.eNVM",
-                             nvm, 0, s->envm_size);
+    memory_region_init_alias(nvm_alias, OBJECT(dev_soc), "MSF2.eNVM", nvm,=
 0,
+                             s->envm_size);
=20
     memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
     memory_region_add_subregion(system_memory, 0, nvm_alias);
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 4817a76ae0..57eff63f0d 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -165,7 +165,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Err=
or **errp)
     }
=20
     /* STUB Peripherals */
-    memory_region_init_io(&s->clock, NULL, &clock_ops, NULL,
+    memory_region_init_io(&s->clock, OBJECT(dev_soc), &clock_ops, NULL,
                           "nrf51_soc.clock", 0x1000);
     memory_region_add_subregion_overlap(&s->container,
                                         NRF51_IOMEM_BASE, &s->clock, -1);
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 6e93726d45..118c342559 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -93,10 +93,10 @@ static void stm32f205_soc_realize(DeviceState *dev_soc,=
 Error **errp)
     MemoryRegion *flash =3D g_new(MemoryRegion, 1);
     MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
=20
-    memory_region_init_rom(flash, NULL, "STM32F205.flash", FLASH_SIZE,
-                           &error_fatal);
-    memory_region_init_alias(flash_alias, NULL, "STM32F205.flash.alias",
-                             flash, 0, FLASH_SIZE);
+    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F205.flash",
+                           FLASH_SIZE, &error_fatal);
+    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
+                             "STM32F205.flash.alias", flash, 0, FLASH_SIZE=
);
=20
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
     memory_region_add_subregion(system_memory, 0, flash_alias);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index d590cd040d..4f10ce6176 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -95,14 +95,15 @@ static void stm32f405_soc_realize(DeviceState *dev_soc,=
 Error **errp)
     Error *err =3D NULL;
     int i;
=20
-    memory_region_init_rom(&s->flash, NULL, "STM32F405.flash", FLASH_SIZE,
-                           &err);
+    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F405.flash",
+                           FLASH_SIZE, &err);
     if (err !=3D NULL) {
         error_propagate(errp, err);
         return;
     }
-    memory_region_init_alias(&s->flash_alias, NULL, "STM32F405.flash.alias=
",
-                             &s->flash, 0, FLASH_SIZE);
+    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
+                             "STM32F405.flash.alias", &s->flash, 0,
+                             FLASH_SIZE);
=20
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->fla=
sh);
     memory_region_add_subregion(system_memory, 0, &s->flash_alias);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index cab0160ae9..49f1c8d0de 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -318,9 +318,9 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error=
 **errp)
         ddr_low_size =3D XLNX_ZYNQMP_MAX_LOW_RAM_SIZE;
         ddr_high_size =3D ram_size - XLNX_ZYNQMP_MAX_LOW_RAM_SIZE;
=20
-        memory_region_init_alias(&s->ddr_ram_high, NULL,
-                                 "ddr-ram-high", s->ddr_ram,
-                                  ddr_low_size, ddr_high_size);
+        memory_region_init_alias(&s->ddr_ram_high, OBJECT(dev),
+                                 "ddr-ram-high", s->ddr_ram, ddr_low_size,
+                                 ddr_high_size);
         memory_region_add_subregion(get_system_memory(),
                                     XLNX_ZYNQMP_HIGH_RAM_START,
                                     &s->ddr_ram_high);
@@ -330,9 +330,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error=
 **errp)
         ddr_low_size =3D ram_size;
     }
=20
-    memory_region_init_alias(&s->ddr_ram_low, NULL,
-                             "ddr-ram-low", s->ddr_ram,
-                              0, ddr_low_size);
+    memory_region_init_alias(&s->ddr_ram_low, OBJECT(dev), "ddr-ram-low",
+                             s->ddr_ram, 0, ddr_low_size);
     memory_region_add_subregion(get_system_memory(), 0, &s->ddr_ram_low);
=20
     /* Create the four OCM banks */
--=20
2.21.1


