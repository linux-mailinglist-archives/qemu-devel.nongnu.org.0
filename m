Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D05A86DE
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 21:39:52 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTTYw-00045U-Gn
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 15:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSot-00042l-Qe; Wed, 31 Aug 2022 14:52:11 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:39590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSor-000889-1M; Wed, 31 Aug 2022 14:52:11 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso10881639otb.6; 
 Wed, 31 Aug 2022 11:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=z00BuQpjkjFGQ4Tae+W62g7FAluG5PFIBrcQ1FvAq0c=;
 b=Oo/ZBllc1VO6IYXFJrZpDhh7KG0qYnPLqkkujz4knHJCyVGVmJ8iI3CYXICzLql6fa
 r6G4bD9Kmvl1xWJwoh6UuoWbm7ou+qyS5VSzCM9aAMFIdefx6k2yixktsgvDLVlPxJXI
 z4Lob470oJZAGx+4bIIa3w2ba391EW7n0w6pTGzGe+Z4vwjTJazB0B+dZNKiBdjjESfN
 Rai6VsT+gi1hdccwI5dPdAYCb3/1JsGUWQrW+iHszsjmYuNEojoRYiKRP8Bpo7YZnbRx
 A4sy03KNc1Juzq0SVP8IuogAqx4aptMB0n15E/WsZSFBVjoGAQujzczY4scRqK+Ez39D
 fmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=z00BuQpjkjFGQ4Tae+W62g7FAluG5PFIBrcQ1FvAq0c=;
 b=BotFu/t1lhKs/xwzAMkMlOrx872WgjlNJEHZvBvu55YmvzVJEfV/rioOrWm/g2LGHg
 Kg9aJT1YtNw9wJ//7aYQb6zafqlBZ6+aaxiDIIffTJch/z8pe8SMiRuVUZoX+UH++15X
 ICW9dZr5+MtCXy+p+LarSg6xgbhHmLjbQYzS8B0MjT4KPGRc5yKnWGKB5j9W1kZMhHRP
 Z96wchFpI4PQddwTMso2movTVJPVz8Y42PMeqHYTiTc0NMSmAspaf8Kwe8NoTitq6gOV
 SOvXKt3NsM+iILjDGQ7ZtS5HZ64WiJa+Px2yEsKWW5T3SOPT2YDdiW7KFndu4sWD3rC6
 x8zg==
X-Gm-Message-State: ACgBeo1nS2waTHOyfFEBYQLvWLIdkxQwpKmjvTygRcxCx47WrjSXTE+Y
 k1cqZY06kKoMz7CrrVsw8NEIi17fFUw=
X-Google-Smtp-Source: AA6agR4q/LbBoIntSvpFzvsg8D5d1uj/vbD3rzExeiuLOqwyLCxC85bNifSwVYlINDhSJfGzsbu1Ag==
X-Received: by 2002:a9d:63ce:0:b0:638:dadc:8ce0 with SMTP id
 e14-20020a9d63ce000000b00638dadc8ce0mr10946132otl.93.1661971927265; 
 Wed, 31 Aug 2022 11:52:07 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:52:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 30/60] ppc/ppc405: Remove taihu machine
Date: Wed, 31 Aug 2022 15:50:04 -0300
Message-Id: <20220831185034.23240-31-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
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

It has been deprecated since 7.0.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220809153904.485018-2-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 MAINTAINERS                     |   2 +-
 docs/about/deprecated.rst       |   9 --
 docs/about/removed-features.rst |   6 +
 docs/system/ppc/embedded.rst    |   1 -
 hw/ppc/ppc405_boards.c          | 232 --------------------------------
 5 files changed, 7 insertions(+), 243 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ce4227ff6..1729c0901c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1282,7 +1282,7 @@ F: hw/openrisc/openrisc_sim.c
 
 PowerPC Machines
 ----------------
-405 (ref405ep and taihu)
+405 (ref405ep)
 L: qemu-ppc@nongnu.org
 S: Orphan
 F: hw/ppc/ppc405_boards.c
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 91b03115ee..c75a25daad 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -233,15 +233,6 @@ deprecated; use the new name ``dtb-randomness`` instead. The new name
 better reflects the way this property affects all random data within
 the device tree blob, not just the ``kaslr-seed`` node.
 
-PPC 405 ``taihu`` machine (since 7.0)
-'''''''''''''''''''''''''''''''''''''
-
-The PPC 405 CPU is a system-on-a-chip, so all 405 machines are very similar,
-except for some external periphery. However, the periphery of the ``taihu``
-machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
-been implemented), so there is not much value added by this board. Use the
-``ref405ep`` machine instead.
-
 ``pc-i440fx-1.4`` up to ``pc-i440fx-1.7`` (since 7.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 925e22016f..a4aa3dca69 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -668,6 +668,12 @@ Aspeed ``swift-bmc`` machine (removed in 7.0)
 This machine was removed because it was unused. Alternative AST2500 based
 OpenPOWER machines are ``witherspoon-bmc`` and ``romulus-bmc``.
 
+ppc ``taihu`` machine (removed in 7.2)
+'''''''''''''''''''''''''''''''''''''''''''''
+
+This machine was removed because it was partially emulated and 405
+machines are very similar. Use the ``ref405ep`` machine instead.
+
 linux-user mode CPUs
 --------------------
 
diff --git a/docs/system/ppc/embedded.rst b/docs/system/ppc/embedded.rst
index cfffbda24d..af3b3d9fa4 100644
--- a/docs/system/ppc/embedded.rst
+++ b/docs/system/ppc/embedded.rst
@@ -6,5 +6,4 @@ Embedded family boards
 - ``ppce500``              generic paravirt e500 platform
 - ``ref405ep``             ref405ep
 - ``sam460ex``             aCube Sam460ex
-- ``taihu``                taihu
 - ``virtex-ml507``         Xilinx Virtex ML507 reference design
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index a66ad05e3a..1a4e7588c5 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -342,241 +342,9 @@ static const TypeInfo ref405ep_type = {
     .class_init = ref405ep_class_init,
 };
 
-/*****************************************************************************/
-/* AMCC Taihu evaluation board */
-/* - PowerPC 405EP processor
- * - SDRAM               128 MB at 0x00000000
- * - Boot flash          2 MB   at 0xFFE00000
- * - Application flash   32 MB  at 0xFC000000
- * - 2 serial ports
- * - 2 ethernet PHY
- * - 1 USB 1.1 device    0x50000000
- * - 1 LCD display       0x50100000
- * - 1 CPLD              0x50100000
- * - 1 I2C EEPROM
- * - 1 I2C thermal sensor
- * - a set of LEDs
- * - bit-bang SPI port using GPIOs
- * - 1 EBC interface connector 0 0x50200000
- * - 1 cardbus controller + expansion slot.
- * - 1 PCI expansion slot.
- */
-typedef struct taihu_cpld_t taihu_cpld_t;
-struct taihu_cpld_t {
-    uint8_t reg0;
-    uint8_t reg1;
-};
-
-static uint64_t taihu_cpld_read(void *opaque, hwaddr addr, unsigned size)
-{
-    taihu_cpld_t *cpld;
-    uint32_t ret;
-
-    cpld = opaque;
-    switch (addr) {
-    case 0x0:
-        ret = cpld->reg0;
-        break;
-    case 0x1:
-        ret = cpld->reg1;
-        break;
-    default:
-        ret = 0;
-        break;
-    }
-
-    return ret;
-}
-
-static void taihu_cpld_write(void *opaque, hwaddr addr,
-                             uint64_t value, unsigned size)
-{
-    taihu_cpld_t *cpld;
-
-    cpld = opaque;
-    switch (addr) {
-    case 0x0:
-        /* Read only */
-        break;
-    case 0x1:
-        cpld->reg1 = value;
-        break;
-    default:
-        break;
-    }
-}
-
-static const MemoryRegionOps taihu_cpld_ops = {
-    .read = taihu_cpld_read,
-    .write = taihu_cpld_write,
-    .impl = {
-        .min_access_size = 1,
-        .max_access_size = 1,
-    },
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static void taihu_cpld_reset (void *opaque)
-{
-    taihu_cpld_t *cpld;
-
-    cpld = opaque;
-    cpld->reg0 = 0x01;
-    cpld->reg1 = 0x80;
-}
-
-static void taihu_cpld_init(MemoryRegion *sysmem, uint32_t base)
-{
-    taihu_cpld_t *cpld;
-    MemoryRegion *cpld_memory = g_new(MemoryRegion, 1);
-
-    cpld = g_new0(taihu_cpld_t, 1);
-    memory_region_init_io(cpld_memory, NULL, &taihu_cpld_ops, cpld, "cpld", 0x100);
-    memory_region_add_subregion(sysmem, base, cpld_memory);
-    qemu_register_reset(&taihu_cpld_reset, cpld);
-}
-
-static void taihu_405ep_init(MachineState *machine)
-{
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const char *bios_name = machine->firmware ?: BIOS_FILENAME;
-    const char *kernel_filename = machine->kernel_filename;
-    const char *initrd_filename = machine->initrd_filename;
-    char *filename;
-    MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *bios;
-    MemoryRegion *ram_memories = g_new(MemoryRegion, 2);
-    hwaddr ram_bases[2], ram_sizes[2];
-    long bios_size;
-    target_ulong kernel_base, initrd_base;
-    long kernel_size, initrd_size;
-    int linux_boot;
-    int fl_idx;
-    DriveInfo *dinfo;
-    DeviceState *uicdev;
-
-    if (machine->ram_size != mc->default_ram_size) {
-        char *sz = size_to_str(mc->default_ram_size);
-        error_report("Invalid RAM size, should be %s", sz);
-        g_free(sz);
-        exit(EXIT_FAILURE);
-    }
-
-    ram_bases[0] = 0;
-    ram_sizes[0] = 0x04000000;
-    memory_region_init_alias(&ram_memories[0], NULL,
-                             "taihu_405ep.ram-0", machine->ram, ram_bases[0],
-                             ram_sizes[0]);
-    ram_bases[1] = 0x04000000;
-    ram_sizes[1] = 0x04000000;
-    memory_region_init_alias(&ram_memories[1], NULL,
-                             "taihu_405ep.ram-1", machine->ram, ram_bases[1],
-                             ram_sizes[1]);
-    ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
-                  33333333, &uicdev, kernel_filename == NULL ? 0 : 1);
-    /* allocate and load BIOS */
-    fl_idx = 0;
-#if defined(USE_FLASH_BIOS)
-    dinfo = drive_get(IF_PFLASH, 0, fl_idx);
-    if (dinfo) {
-        bios_size = 2 * MiB;
-        pflash_cfi02_register(0xFFE00000,
-                              "taihu_405ep.bios", bios_size,
-                              blk_by_legacy_dinfo(dinfo),
-                              64 * KiB, 1,
-                              4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x2AA,
-                              1);
-        fl_idx++;
-    } else
-#endif
-    {
-        bios = g_new(MemoryRegion, 1);
-        memory_region_init_rom(bios, NULL, "taihu_405ep.bios", BIOS_SIZE,
-                               &error_fatal);
-        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-        if (filename) {
-            bios_size = load_image_size(filename,
-                                        memory_region_get_ram_ptr(bios),
-                                        BIOS_SIZE);
-            g_free(filename);
-            if (bios_size < 0) {
-                error_report("Could not load PowerPC BIOS '%s'", bios_name);
-                exit(1);
-            }
-            bios_size = (bios_size + 0xfff) & ~0xfff;
-            memory_region_add_subregion(sysmem, (uint32_t)(-bios_size), bios);
-        } else if (!qtest_enabled()) {
-            error_report("Could not load PowerPC BIOS '%s'", bios_name);
-            exit(1);
-        }
-    }
-    /* Register Linux flash */
-    dinfo = drive_get(IF_PFLASH, 0, fl_idx);
-    if (dinfo) {
-        bios_size = 32 * MiB;
-        pflash_cfi02_register(0xfc000000, "taihu_405ep.flash", bios_size,
-                              blk_by_legacy_dinfo(dinfo),
-                              64 * KiB, 1,
-                              4, 0x0001, 0x22DA, 0x0000, 0x0000, 0x555, 0x2AA,
-                              1);
-        fl_idx++;
-    }
-    /* Register CLPD & LCD display */
-    taihu_cpld_init(sysmem, 0x50100000);
-    /* Load kernel */
-    linux_boot = (kernel_filename != NULL);
-    if (linux_boot) {
-        kernel_base = KERNEL_LOAD_ADDR;
-        /* now we can load the kernel */
-        kernel_size = load_image_targphys(kernel_filename, kernel_base,
-                                          machine->ram_size - kernel_base);
-        if (kernel_size < 0) {
-            error_report("could not load kernel '%s'", kernel_filename);
-            exit(1);
-        }
-        /* load initrd */
-        if (initrd_filename) {
-            initrd_base = INITRD_LOAD_ADDR;
-            initrd_size = load_image_targphys(initrd_filename, initrd_base,
-                                              machine->ram_size - initrd_base);
-            if (initrd_size < 0) {
-                error_report("could not load initial ram disk '%s'",
-                             initrd_filename);
-                exit(1);
-            }
-        } else {
-            initrd_base = 0;
-            initrd_size = 0;
-        }
-    } else {
-        kernel_base = 0;
-        kernel_size = 0;
-        initrd_base = 0;
-        initrd_size = 0;
-    }
-}
-
-static void taihu_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->desc = "taihu";
-    mc->init = taihu_405ep_init;
-    mc->default_ram_size = 0x08000000;
-    mc->default_ram_id = "taihu_405ep.ram";
-    mc->deprecation_reason = "incomplete, use 'ref405ep' instead";
-}
-
-static const TypeInfo taihu_type = {
-    .name = MACHINE_TYPE_NAME("taihu"),
-    .parent = TYPE_MACHINE,
-    .class_init = taihu_class_init,
-};
-
 static void ppc405_machine_init(void)
 {
     type_register_static(&ref405ep_type);
-    type_register_static(&taihu_type);
 }
 
 type_init(ppc405_machine_init)
-- 
2.37.2


