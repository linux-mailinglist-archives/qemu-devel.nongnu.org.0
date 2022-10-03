Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0435F37FA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:43:34 +0200 (CEST)
Received: from localhost ([::1]:42854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofTDp-0002ts-Gy
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7p-000239-P7; Mon, 03 Oct 2022 16:33:25 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7n-00044V-AP; Mon, 03 Oct 2022 16:33:16 -0400
Received: by mail-ej1-x629.google.com with SMTP id z23so7913263ejw.12;
 Mon, 03 Oct 2022 13:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5Us3aGLaDNYofg3OTea2sbJpWyU45ySCPralc/Z/sTA=;
 b=D6bVAztGr7ofJqD5XYuZC1AY03RBx2Gy5X7lW0NCrKI7DXW7lQB2qoRAkTqzJftu4Q
 s5A11w2IAD4MR6j+uMHGRcocFSqbIJDThxn96Nawi6yMdGScNXl8UeKJS7kjjbJFarhj
 m8d9W41LsyNyd2A7nlFCQVH/UGlcns4895MdG/RtC0p5WmUAGIvUpP/oXknptyT1/7qh
 ot8AfH89wS8mBUrEWeqr6qSY7FICvz3gCK6AKoC4Ux8QJAhKFkyPst6niYmqGy3+9Bq4
 UqOy75K9FTzZndJED6gYPXBm7Ch3WtseRuY5DAKprTeOLUfB+ipWYH14zd82+BD7Dp06
 xsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5Us3aGLaDNYofg3OTea2sbJpWyU45ySCPralc/Z/sTA=;
 b=p4YiFU2pRXmOCK/zDBhxp7khGAaymelVmyO26L6C/xRRbjCkVVZuEgBIZy9w3kETh3
 VPwZk/q+2uyFt1vHi40M938+hnnb5vOVsLm7iBTb3tuMCWkmIOhqGfoRksI0LiHQKTlK
 bKl13b4O/8+QmE+jXNTPxpLfdHy/pRr5d1oAtJac8Im6pbEqHlgmHH/7rI5k7F4T/yCx
 fUdryAvr9OYztQ+z/JYI4e9Y7yhzhREiWXqSdh5sGAwff/BZYpxGPKtTW3V/CTrhNuKi
 toNgtUB8fUO+tHMTmOFdz8o91/UeQQwKcy6djnPlhICv1tsC1VrH5Lm/EgT4YaxyuTN2
 WcKQ==
X-Gm-Message-State: ACrzQf2sUm3pNkDHq07AlDyz9MYzHFnS4e3ea56CkZ+Eu6SxlY9vyAxf
 OwuhKEnxfI+HcRSL0V7LUzCwWPPY4ls=
X-Google-Smtp-Source: AMsMyM5NE78EA4+UW1zEBtJU/oJrD5pIyS+KKFXzkjdJLYMy2vToupfIcPNPuMYoTc1Iw4WMafBDkw==
X-Received: by 2002:a17:907:160d:b0:782:bc5d:162e with SMTP id
 hb13-20020a170907160d00b00782bc5d162emr16503234ejc.291.1664829192997; 
 Mon, 03 Oct 2022 13:33:12 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:12 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 09/13] hw/ppc/e500: Implement pflash handling
Date: Mon,  3 Oct 2022 22:31:38 +0200
Message-Id: <20221003203142.24355-10-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Allows e500 boards to have their root file system reside on flash using
only builtin devices located in the eLBC memory region.

Note that the flash memory area is only created when a -pflash argument is
given, and that the size is determined by the given file. The idea is to
put users into control.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/ppc/ppce500.rst | 12 ++++++
 hw/ppc/Kconfig              |  1 +
 hw/ppc/e500.c               | 76 +++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index ba6bcb7314..1ed6c36599 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -119,6 +119,18 @@ To boot the 32-bit Linux kernel:
       -initrd /path/to/rootfs.cpio \
       -append "root=/dev/ram"
 
+Rather than using a root file system on ram disk, it is possible to have it on
+emulated flash. Given an ext2 image whose size must be a power of two, it can
+be used as follows:
+
+.. code-block:: bash
+
+  $ qemu-system-ppc{64|32} -M ppce500 -cpu e500mc -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel vmlinux \
+      -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
+      -append "rootwait root=/dev/mtdblock0"
+
 Running U-Boot
 --------------
 
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 791fe78a50..769a1ead1c 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -126,6 +126,7 @@ config E500
     select ETSEC
     select GPIO_MPC8XXX
     select OPENPIC
+    select PFLASH_CFI01
     select PLATFORM_BUS
     select PPCE500_PCI
     select SERIAL
diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 3e950ea3ba..2b1430fca4 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -23,8 +23,10 @@
 #include "e500-ccsr.h"
 #include "net/net.h"
 #include "qemu/config-file.h"
+#include "hw/block/flash.h"
 #include "hw/char/serial.h"
 #include "hw/pci/pci.h"
+#include "sysemu/block-backend-io.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
@@ -267,6 +269,31 @@ static void sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
     }
 }
 
+static void create_devtree_flash(SysBusDevice *sbdev,
+                                 PlatformDevtreeData *data)
+{
+    g_autofree char *name = NULL;
+    uint64_t num_blocks = object_property_get_uint(OBJECT(sbdev),
+                                                   "num-blocks",
+                                                   &error_fatal);
+    uint64_t sector_length = object_property_get_uint(OBJECT(sbdev),
+                                                      "sector-length",
+                                                      &error_fatal);
+    uint64_t bank_width = object_property_get_uint(OBJECT(sbdev),
+                                                   "width",
+                                                   &error_fatal);
+    hwaddr flashbase = 0;
+    hwaddr flashsize = num_blocks * sector_length;
+    void *fdt = data->fdt;
+
+    name = g_strdup_printf("%s/nor@%" PRIx64, data->node, flashbase);
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 1, flashbase, 1, flashsize);
+    qemu_fdt_setprop_cell(fdt, name, "bank-width", bank_width);
+}
+
 static void platform_bus_create_devtree(PPCE500MachineState *pms,
                                         void *fdt, const char *mpic)
 {
@@ -276,6 +303,8 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
     uint64_t addr = pmc->platform_bus_base;
     uint64_t size = pmc->platform_bus_size;
     int irq_start = pmc->platform_bus_first_irq;
+    SysBusDevice *sbdev;
+    bool ambiguous;
 
     /* Create a /platform node that we can put all devices into */
 
@@ -302,6 +331,13 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
     /* Loop through all dynamic sysbus devices and create nodes for them */
     foreach_dynamic_sysbus_device(sysbus_device_create_devtree, &data);
 
+    sbdev = SYS_BUS_DEVICE(object_resolve_path_type("", TYPE_PFLASH_CFI01,
+                                                    &ambiguous));
+    if (sbdev) {
+        assert(!ambiguous);
+        create_devtree_flash(sbdev, &data);
+    }
+
     g_free(node);
 }
 
@@ -856,6 +892,7 @@ void ppce500_init(MachineState *machine)
     unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
     IrqLines *irqs;
     DeviceState *dev, *mpicdev;
+    DriveInfo *dinfo;
     CPUPPCState *firstenv = NULL;
     MemoryRegion *ccsr_addr_space;
     SysBusDevice *s;
@@ -1024,6 +1061,45 @@ void ppce500_init(MachineState *machine)
                                 pmc->platform_bus_base,
                                 &pms->pbus_dev->mmio);
 
+    dinfo = drive_get(IF_PFLASH, 0, 0);
+    if (dinfo) {
+        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+        BlockDriverState *bs = blk_bs(blk);
+        uint64_t size = bdrv_getlength(bs);
+        uint64_t mmio_size = pms->pbus_dev->mmio.size;
+        uint32_t sector_len = 64 * KiB;
+
+        if (ctpop64(size) != 1) {
+            error_report("Size of pflash file must be a power of two.");
+            exit(1);
+        }
+
+        if (size > mmio_size) {
+            error_report("Size of pflash file must not be bigger than %" PRIu64
+                         " bytes.", mmio_size);
+            exit(1);
+        }
+
+        assert(QEMU_IS_ALIGNED(size, sector_len));
+
+        dev = qdev_new(TYPE_PFLASH_CFI01);
+        qdev_prop_set_drive(dev, "drive", blk);
+        qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
+        qdev_prop_set_uint64(dev, "sector-length", sector_len);
+        qdev_prop_set_uint8(dev, "width", 2);
+        qdev_prop_set_bit(dev, "big-endian", true);
+        qdev_prop_set_uint16(dev, "id0", 0x89);
+        qdev_prop_set_uint16(dev, "id1", 0x18);
+        qdev_prop_set_uint16(dev, "id2", 0x0000);
+        qdev_prop_set_uint16(dev, "id3", 0x0);
+        qdev_prop_set_string(dev, "name", "e500.flash");
+        s = SYS_BUS_DEVICE(dev);
+        sysbus_realize_and_unref(s, &error_fatal);
+
+        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
+                                    sysbus_mmio_get_region(s, 0));
+    }
+
     /*
      * Smart firmware defaults ahead!
      *
-- 
2.37.3


