Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1248761180B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:50:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSTc-0000RT-9a; Fri, 28 Oct 2022 12:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSTH-0008Bj-Ri; Fri, 28 Oct 2022 12:44:39 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSTF-0001AU-Le; Fri, 28 Oct 2022 12:44:39 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-13ba9a4430cso6859839fac.11; 
 Fri, 28 Oct 2022 09:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZuI/sWqN/0+9SVFkIbzFz+H5JQ8dWR3NVwh4Hgt251w=;
 b=KeRzlHbz6koe+jeYr7K59/nxi/+2luokKqzW5J7sEz+Ur1bKx0GnyZmFxA0s35OtYw
 kNc3L8ex8Lu2v+EPeOm32K2mCr1W/+1GS7hOjYmHHK9bEb4cu++NORvCpzWgZ3GoBP4Y
 p20cxafpZpOD2zCOkq4ZZQ5JDpOf1xbCKvZcuPlQmntWxSbx/9Zm+8OF4cJn1sbu3H2o
 gAE4imWFtI3Z9tDRXxlS+nKzjfuWzytMby3Ei4L0ufoSenbGW1tS70aY+LzxTVSc08CQ
 Zq1TaFfi1rcY5D34GV6e/l6a83Wq36mgfyr6ChuiiCDoFE6f+7DdHqeOsiXWH7RCJPon
 p9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZuI/sWqN/0+9SVFkIbzFz+H5JQ8dWR3NVwh4Hgt251w=;
 b=GL9TRsRdq6ObMjXsH2/WqVJJ5cLbJPemNMpUi8HbmAyZNX3uwUgfDBYWg11qyZiqXe
 Kz1gR0HHSnhgwOdfxLB7mFIulK0ACIp4cItL6+hyAjen8Mu7f/UWE3sSiiTirOc4AKcx
 wv/gWj0FgcqfMeO3/nSjcn7eELyX/8fHMUrKft4OYU0wlIoEf5R1ffZCCDOtvcwVI0pn
 OVZhwLW+pRoWPlDYlXtuzRXPVi0WRzYG8uj85qdv2QJcgulhRWHdd+t9A9God3m2iReq
 IJ3IIGNcmFkBpuxwyD2+6i6Wyk5suvFiHCDmHa9TP/fkWjxDUc4z6/icm0dPlWqwjDBd
 m3Lg==
X-Gm-Message-State: ACrzQf1Z7b3SrIvls9ectY2+5UzjlSbwnIRcoWvMiC1hPpadhKXM16CK
 tjKDxn7iIHWsP2C07Tw0GaTvt+LIpaEcsg==
X-Google-Smtp-Source: AMsMyM6EfaTo5gGmcXOK129Jwy42yk2m4yuKuK9iy2Z/W0lww4s+Iu1lHR75yrJtq/WConiYkya6aQ==
X-Received: by 2002:a05:6870:b68d:b0:12d:484a:2643 with SMTP id
 cy13-20020a056870b68d00b0012d484a2643mr9861490oab.105.1666975475909; 
 Fri, 28 Oct 2022 09:44:35 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:44:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 62/62] hw/ppc/e500: Implement pflash handling
Date: Fri, 28 Oct 2022 13:39:51 -0300
Message-Id: <20221028163951.810456-63-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Allows e500 boards to have their root file system reside on flash using
only builtin devices located in the eLBC memory region.

Note that the flash memory area is only created when a -pflash argument is
given, and that the size is determined by the given file. The idea is to
put users into control.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221018210146.193159-6-shentey@gmail.com>
[danielhb: use int128_get64() in mmio_size]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/system/ppc/ppce500.rst | 15 +++++++
 hw/ppc/Kconfig              |  1 +
 hw/ppc/e500.c               | 79 +++++++++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 7b5eb3c4ee..fa40e57d18 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -165,3 +165,18 @@ if “-device eTSEC” is given to QEMU:
 .. code-block:: bash
 
   -netdev tap,ifname=tap0,script=no,downscript=no,id=net0 -device eTSEC,netdev=net0
+
+Root file system on flash drive
+-------------------------------
+
+Rather than using a root file system on ram disk, it is possible to have it on
+CFI flash. Given an ext2 image whose size must be a power of two, it can be used
+as follows:
+
+.. code-block:: bash
+
+  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
+      -display none -serial stdio \
+      -kernel vmlinux \
+      -drive if=pflash,file=/path/to/rootfs.ext2,format=raw \
+      -append "rootwait root=/dev/mtdblock0"
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
index 3e950ea3ba..31c54ebb3d 100644
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
@@ -1024,6 +1061,48 @@ void ppce500_init(MachineState *machine)
                                 pmc->platform_bus_base,
                                 &pms->pbus_dev->mmio);
 
+    dinfo = drive_get(IF_PFLASH, 0, 0);
+    if (dinfo) {
+        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+        BlockDriverState *bs = blk_bs(blk);
+        uint64_t mmio_size = int128_get64(pms->pbus_dev->mmio.size);
+        uint64_t size = bdrv_getlength(bs);
+        uint32_t sector_len = 64 * KiB;
+
+        if (!is_power_of_2(size)) {
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
+        if (!QEMU_IS_ALIGNED(size, sector_len)) {
+            error_report("Size of pflash file must be a multiple of %" PRIu32
+                         ".", sector_len);
+            exit(1);
+        }
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
+        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+        memory_region_add_subregion(&pms->pbus_dev->mmio, 0,
+                                    pflash_cfi01_get_memory(PFLASH_CFI01(dev)));
+    }
+
     /*
      * Smart firmware defaults ahead!
      *
-- 
2.37.3


