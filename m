Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C75A86D6
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:36:47 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTW3-0008Ar-37
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSoy-0004J3-RZ; Wed, 31 Aug 2022 14:52:16 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSox-000890-5S; Wed, 31 Aug 2022 14:52:16 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-11e7e0a63e2so25419471fac.4; 
 Wed, 31 Aug 2022 11:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=q1+VQkCSgg5aO6+8TVFVWgwMo1nmNCm3IPfxXJPnBJA=;
 b=jLWXT2Sl4Ob8ujWSNTEdGM3q9PjmFkpAC0NV6sMzkW1fPi0dXHPHMBz5cT0Posd1iY
 n5ECU0iKOhU9nDOmV+9QqFSgeh3wcULmnj5BiCVi+DUx2WZX1h1IJY+MyweAhWATmJqw
 GxBb6Kt0M+BI9sDROYy1T6Zre8lIfIi8+FjbzwgU/9fqRATazk+GB2q7poZ0xwCVwuzE
 Zmegua158T+9zn6Gaw8RScsj92M9UTCkNBOd7S1xaHi84CXIEWVlccx9RJ4UqTY1OC9V
 XlSrVX6RwS7AKgcI2erSG2fVAOlDbM7o/RE92A9AOwNewQCAwf+EOa7MVah0f1g1lWh7
 h2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=q1+VQkCSgg5aO6+8TVFVWgwMo1nmNCm3IPfxXJPnBJA=;
 b=PFq55cDybW5mXNhfS0iQlkHZtKnPCWHA8cWWukmnYc8oBMDeO62q+ttWlYO5Cozlhl
 irmn0fsQKD3TISKOd9Fvgn7tthajuKKFWG056JKRog9Tkfh7AOXYbDDdgCmYnGZwnIom
 Yad85wu7d+UJZZdYwtAn6viIbgVY7fObMuVBG5EDvIrxv7yGz0zDhXWR/j4hgCVGDmwP
 2qyQqUK323kcwPnyPcKmHDoo1U7XtLBaWSbE7icL7/5ra5MssNZShASKKKixLmWLoimD
 1sVA5VRbJHmzCKh+JgvArU/p8uhH7JOV+quOXJSOVv147Eub/9uqpDXgN+gTZo0UMBHC
 vmlg==
X-Gm-Message-State: ACgBeo3SzETGTUwEjqmR3U6EoBbPi6lcC9Zlbvu1gIXQ6yOqVGH1YV1R
 BrmDSFtafO7B5aVcWVZKDRHzxazMWpk=
X-Google-Smtp-Source: AA6agR4aKW96u3WEg0byC/2uLiDBu85vehMFscG4y6SG8opkA2Oz53uQNreyraQk7VbVZDsBVT+jTg==
X-Received: by 2002:a05:6870:8092:b0:121:ece2:e41d with SMTP id
 q18-20020a056870809200b00121ece2e41dmr2261991oab.28.1661971933391; 
 Wed, 31 Aug 2022 11:52:13 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PULL 32/60] ppc/ppc405: Move devices under the ref405ep machine
Date: Wed, 31 Aug 2022 15:50:06 -0300
Message-Id: <20220831185034.23240-33-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220809153904.485018-4-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405_boards.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 96700be74d..f4794ba40c 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -230,13 +230,11 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
     env->load_info = &boot_info;
 }
 
-static void ref405ep_init(MachineState *machine)
+static void ppc405_init(MachineState *machine)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const char *kernel_filename = machine->kernel_filename;
     PowerPCCPU *cpu;
-    DeviceState *dev;
-    SysBusDevice *s;
     MemoryRegion *sram = g_new(MemoryRegion, 1);
     MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
@@ -294,15 +292,6 @@ static void ref405ep_init(MachineState *machine)
         memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), bios);
     }
 
-    /* Register FPGA */
-    ref405ep_fpga_init(sysmem, PPC405EP_FPGA_BASE);
-    /* Register NVRAM */
-    dev = qdev_new("sysbus-m48t08");
-    qdev_prop_set_int32(dev, "base-year", 1968);
-    s = SYS_BUS_DEVICE(dev);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
-
     /* Load kernel and initrd using U-Boot images */
     if (kernel_filename && machine->firmware) {
         target_ulong kernel_base, initrd_base;
@@ -335,6 +324,23 @@ static void ref405ep_init(MachineState *machine)
     }
 }
 
+static void ref405ep_init(MachineState *machine)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    ppc405_init(machine);
+
+    /* Register FPGA */
+    ref405ep_fpga_init(get_system_memory(), PPC405EP_FPGA_BASE);
+    /* Register NVRAM */
+    dev = qdev_new("sysbus-m48t08");
+    qdev_prop_set_int32(dev, "base-year", 1968);
+    s = SYS_BUS_DEVICE(dev);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
+}
+
 static void ref405ep_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -354,6 +360,7 @@ static void ppc405_machine_class_init(ObjectClass *oc, void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "PPC405 generic machine";
+    mc->init = ppc405_init;
     mc->default_ram_size = 128 * MiB;
     mc->default_ram_id = "ppc405.ram";
 }
-- 
2.37.2


