Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D07F961224E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 13:19:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oojqY-0004fL-Qx; Sat, 29 Oct 2022 07:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oojqX-0004ex-9y; Sat, 29 Oct 2022 07:17:49 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oojqV-0004vj-Gg; Sat, 29 Oct 2022 07:17:49 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso4362397otb.6; 
 Sat, 29 Oct 2022 04:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UqJIAkt6vrDYioz1nVux9gwrA2+V9DnsY8Ni4WPtzac=;
 b=IyiWU7ZbRayJy6vvhbTVVzqm1hMgWH1ofe08O+uniXT5dRR7Mu3Fpv4hTsNBugxRhJ
 rvS6ZVtrvpprngfGQDTobqIooq9DEBrj++N3ZJ/n3QurgWUUESxBYRXIXNsLZYJQBXy3
 9SCKfMqL0bGn7mSDZOb6Mw3BZFVjo0JAfDb0ankbCSpTsdOuQbq2oof+4sV4mGfr+Rwg
 PiMVFYOkVSuQzVzNkH2cKuWketDqq8ykcp2Dq/AZBGDm1WcMeaQo2r7fpdoa5OQKARzu
 +UEvDAILEkyQV1YUPeBj4GqU3qrcD+4qNejzFDcbAukRt9BO9POQ0mQqW9SeWVTSg0Ok
 b2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UqJIAkt6vrDYioz1nVux9gwrA2+V9DnsY8Ni4WPtzac=;
 b=5GHbYmFxcADdT5GXtpTpRAYVUZl7mXRsi7ktI9ZdMjoy6TVV0qLHrTQ1uIE4YPK5n3
 /Whui0pLxSPL4i5l/vVtNHVN1U5OmFVbGGm+Z8QSorDZ6cvxNC+v4w/WR4a6iYQS+6sj
 GKeVG/+72GpUHvFjDsCZGi8YVBXBaClDHSV02/bZuh6HyjJ8TghVt7h9pBn2J9Wta9dw
 b68She2rZHDRk2xZZydlcN9Bz8cKbA7HvRXtUpQyFcUV2wYLNkTTFITiRoMCGeP3WxO1
 lfenPbLtlGvGLuZzDcCAl8lLy450RP2Gs8k8zI672H6lPX3P4fSF0JTS+JC40+PliKTm
 lE1g==
X-Gm-Message-State: ACrzQf2Q61RwuDhnykH4wlf3ZBgwR00Wr9S2s6sXr813nXVSN8T+Z8aF
 2AJ6OHqjEveBqAuqdmajzY4E3QKkASznyA==
X-Google-Smtp-Source: AMsMyM6uPzOc2fF6goOI2GmDPc0CshaSnt+ovSvVw7RCsS4fUHwaIDBiz4mb7BoE+sIyWBG9/2poXw==
X-Received: by 2002:a9d:6544:0:b0:665:be47:df05 with SMTP id
 q4-20020a9d6544000000b00665be47df05mr1914837otl.7.1667042265311; 
 Sat, 29 Oct 2022 04:17:45 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a9d6c19000000b00661a05691fasm494163otq.79.2022.10.29.04.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 04:17:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 62/63] hw/ppc/e500: Implement pflash handling
Date: Sat, 29 Oct 2022 08:17:26 -0300
Message-Id: <20221029111727.1065252-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029111727.1065252-1-danielhb413@gmail.com>
References: <20221029111727.1065252-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
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
[danielhb: use memory_region_size() in mmio_size]
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
index 3e950ea3ba..2fe496677c 100644
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
+        uint64_t mmio_size = memory_region_size(&pms->pbus_dev->mmio);
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


