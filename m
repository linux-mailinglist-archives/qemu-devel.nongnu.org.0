Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23A61872BB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:52:04 +0100 (CET)
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDuqJ-00017c-PR
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDuoy-0007N3-5r
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDuow-0008V6-Ki
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:50:40 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:34895)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDuow-0008Qt-G7
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584384638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hXIJL668freBf14eTVXascLoIFucgmXgkcGWSAplUNA=;
 b=GP7SnVfIflN2MzHSxiiG2dXJDZcbuw+Lvs/1b0GBjE5KbpHnuu8kEPnSL6iXNPk/0706If
 /hMBsOIoLsxiDOTFA2zM/WxIbO9d/XsMjWOHFlraDTJN41ad0EOsbQsQYnysLVYDFW3FOH
 M/qO9CQnF+9SbJ62EJvIeowYVej1oaQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-QciJYGRAPWC3ASAcCeZqiQ-1; Mon, 16 Mar 2020 14:50:35 -0400
X-MC-Unique: QciJYGRAPWC3ASAcCeZqiQ-1
Received: by mail-wm1-f72.google.com with SMTP id a23so6173765wmm.8
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 11:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QL+8S8VSX/i0yA2bSlkIiSqdqBMljhwg+YkcURAAts=;
 b=Q4mVKFy67csWbqNxS75yF/YOby93w4z2umx3/jGMRA4MGCIheh/dhJ4DjyYB/vUL2A
 XYjyJ4VrU++cut9+dHHhlv50e2OBsw6PdPMCbWeJXy9B12tfzfIuGxWvGJtdICKzP379
 aguYN5BnJgPp4aOcKWNZcDRrZ/ExcZp2q9DLBEzVDwzLToxbtEahoQG1E7kPJbdfxsQK
 h9aWvWGijayVdeVzR8YL9AeEiNVrcC/XcAbqJRhpJfjqpHbvRB8lkBvBIj2n67gZOQlD
 6Iz1IdsGTVEDqeGVAc5LfOWt1ejcIcUgkVnYs/HUXhQTfJbPbAP1/8pbPLYjFLSB9y2G
 GaEQ==
X-Gm-Message-State: ANhLgQ3ebNVnfcaMrUL767aaCGOWUVbmImtSRj4upXWBU51sbGIR4UQr
 fEbQLxKXKyoBszfL0l8WijsdWsgD4jix6C9YWL80ZglGWgeLheHpzvfIvIcTdM0e4vs2khaRNhD
 +5WUU64RHdSnxbxA=
X-Received: by 2002:a1c:156:: with SMTP id 83mr484821wmb.151.1584384634595;
 Mon, 16 Mar 2020 11:50:34 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvYSH5bQVhe7l3Eyrisd/fUWufhe9CCEW/brEle1wnTEqiYlpfJLLcCr6DkPXeks+UsP6XzXA==
X-Received: by 2002:a1c:156:: with SMTP id 83mr484810wmb.151.1584384634350;
 Mon, 16 Mar 2020 11:50:34 -0700 (PDT)
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id b5sm1036436wrw.86.2020.03.16.11.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 11:50:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 05/25] hw/arm: Use memory_region_init_rom() with read-only
 regions
Date: Mon, 16 Mar 2020 19:49:46 +0100
Message-Id: <20200316185006.576-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316185006.576-1-philmd@redhat.com>
References: <20200316185006.576-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4210.c | 3 +--
 hw/arm/mainstone.c  | 3 +--
 hw/arm/omap_sx1.c   | 6 ++----
 hw/arm/palm.c       | 3 +--
 hw/arm/spitz.c      | 3 +--
 hw/arm/stellaris.c  | 3 +--
 hw/arm/tosa.c       | 3 +--
 7 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 59a27bdd68..3af6502a5e 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -311,9 +311,8 @@ static void exynos4210_realize(DeviceState *socdev, Err=
or **errp)
                                 &s->chipid_mem);
=20
     /* Internal ROM */
-    memory_region_init_ram(&s->irom_mem, NULL, "exynos4210.irom",
+    memory_region_init_rom(&s->irom_mem, NULL, "exynos4210.irom",
                            EXYNOS4210_IROM_SIZE, &error_fatal);
-    memory_region_set_readonly(&s->irom_mem, true);
     memory_region_add_subregion(system_mem, EXYNOS4210_IROM_BASE_ADDR,
                                 &s->irom_mem);
     /* mirror of iROM */
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index 1042017086..6bc643651b 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -124,9 +124,8 @@ static void mainstone_common_init(MemoryRegion *address=
_space_mem,
     /* Setup CPU & memory */
     mpu =3D pxa270_init(address_space_mem, mainstone_binfo.ram_size,
                       machine->cpu_type);
-    memory_region_init_ram(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
+    memory_region_init_rom(rom, NULL, "mainstone.rom", MAINSTONE_ROM,
                            &error_fatal);
-    memory_region_set_readonly(rom, true);
     memory_region_add_subregion(address_space_mem, 0, rom);
=20
     /* There are two 32MiB flash devices on the board */
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index de5ff447dc..57829b3744 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -131,9 +131,8 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
     mpu =3D omap310_mpu_init(machine->ram, machine->cpu_type);
=20
     /* External Flash (EMIFS) */
-    memory_region_init_ram(flash, NULL, "omap_sx1.flash0-0", flash_size,
+    memory_region_init_rom(flash, NULL, "omap_sx1.flash0-0", flash_size,
                            &error_fatal);
-    memory_region_set_readonly(flash, true);
     memory_region_add_subregion(address_space, OMAP_CS0_BASE, flash);
=20
     memory_region_init_io(&cs[0], NULL, &static_ops, &cs0val,
@@ -167,9 +166,8 @@ static void sx1_init(MachineState *machine, const int v=
ersion)
     if ((version =3D=3D 1) &&
             (dinfo =3D drive_get(IF_PFLASH, 0, fl_idx)) !=3D NULL) {
         MemoryRegion *flash_1 =3D g_new(MemoryRegion, 1);
-        memory_region_init_ram(flash_1, NULL, "omap_sx1.flash1-0",
+        memory_region_init_rom(flash_1, NULL, "omap_sx1.flash1-0",
                                flash1_size, &error_fatal);
-        memory_region_set_readonly(flash_1, true);
         memory_region_add_subregion(address_space, OMAP_CS1_BASE, flash_1)=
;
=20
         memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 99554bda19..97ca105d29 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -213,9 +213,8 @@ static void palmte_init(MachineState *machine)
     mpu =3D omap310_mpu_init(machine->ram, machine->cpu_type);
=20
     /* External Flash (EMIFS) */
-    memory_region_init_ram(flash, NULL, "palmte.flash", flash_size,
+    memory_region_init_rom(flash, NULL, "palmte.flash", flash_size,
                            &error_fatal);
-    memory_region_set_readonly(flash, true);
     memory_region_add_subregion(address_space_mem, OMAP_CS0_BASE, flash);
=20
     memory_region_init_io(&cs[0], NULL, &static_ops, &cs0val, "palmte-cs0"=
,
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index cbfa6934cf..c28d9b5ed7 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -929,8 +929,7 @@ static void spitz_common_init(MachineState *machine,
=20
     sl_flash_register(mpu, (model =3D=3D spitz) ? FLASH_128M : FLASH_1024M=
);
=20
-    memory_region_init_ram(rom, NULL, "spitz.rom", SPITZ_ROM, &error_fatal=
);
-    memory_region_set_readonly(rom, true);
+    memory_region_init_rom(rom, NULL, "spitz.rom", SPITZ_ROM, &error_fatal=
);
     memory_region_add_subregion(address_space_mem, 0, rom);
=20
     /* Setup peripherals */
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 221a78674e..d136ba1a92 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1300,9 +1300,8 @@ static void stellaris_init(MachineState *ms, stellari=
s_board_info *board)
     sram_size =3D ((board->dc0 >> 18) + 1) * 1024;
=20
     /* Flash programming is done via the SCU, so pretend it is ROM.  */
-    memory_region_init_ram(flash, NULL, "stellaris.flash", flash_size,
+    memory_region_init_rom(flash, NULL, "stellaris.flash", flash_size,
                            &error_fatal);
-    memory_region_set_readonly(flash, true);
     memory_region_add_subregion(system_memory, 0, flash);
=20
     memory_region_init_ram(sram, NULL, "stellaris.sram", sram_size,
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index 4d95a1f3e2..5dee2d76c6 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -226,8 +226,7 @@ static void tosa_init(MachineState *machine)
=20
     mpu =3D pxa255_init(address_space_mem, tosa_binfo.ram_size);
=20
-    memory_region_init_ram(rom, NULL, "tosa.rom", TOSA_ROM, &error_fatal);
-    memory_region_set_readonly(rom, true);
+    memory_region_init_rom(rom, NULL, "tosa.rom", TOSA_ROM, &error_fatal);
     memory_region_add_subregion(address_space_mem, 0, rom);
=20
     tmio =3D tc6393xb_init(address_space_mem, 0x10000000,
--=20
2.21.1


