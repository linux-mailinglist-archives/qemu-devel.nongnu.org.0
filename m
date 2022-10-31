Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02C76134FD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 12:55:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTNQ-0005ED-Vs; Mon, 31 Oct 2022 07:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTNJ-000563-Ix
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opTNC-00057X-0n
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:54:41 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bs21so15620480wrb.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rOz1DKZXV40J6g7C+ONkZnsrdceIgT9c6MhorQOyVQk=;
 b=hMLVFq4fnca67iVicKyJb0/l0K6J8q6tNoXKLuLHKEvFDmc3S1Fy4YppxssYQjoAMA
 66em6ckL/KBsSLzIUXpzjHMC8DYNLUbbdsrVg+3uq3auR45oLmaw5TzbC846y+jOKdHH
 WJcdjgbBdeH4qXddJz1I1T44DwmE9Webty0bM7zziygFVGo4/pj8IaPj62Bp0GKYpzWY
 cChTGH6jagYIcQ+q9TVCmkm/1wcm82so4NN/yrX8BvBvjOom6VeBvsa5UbcL/Wr0y9qm
 h1lye6jNt4YRVCB5hhMazNjD8sxSUijVpOwp3Tb+j8AegA4ZxWOgkWxTq+UEp3TNg35i
 1YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rOz1DKZXV40J6g7C+ONkZnsrdceIgT9c6MhorQOyVQk=;
 b=zSc+PMw+95Nft+etx9DGns3t5wcezH/CwaXX0jU0PAR5CWnIe3jic20CGzOtcROjtz
 89CgeIBPhpP4vuA7ds3NL07i5WuM5FEX3ByPs85lY9fA0DvQCxn+6vz6NcbMmb1SzINl
 s8963v5KBateqabiS9DfpiDz8grJWs+sSucZJj1WWb9yCRk8wtvau8ErKATYT6FQhmrV
 iiK5PqGs5dKOO7YSm6F8/MrTHL72Ry1oZ99veGpUcJSufX7geLpUOKddGlP7dmC/ZZIT
 WJWAY6V3owFGJuXD49UrNz4Or51c8mGvEs0Go5wyCvpRGi0GCPYPGyh0VyClz/GP6NJv
 IRSg==
X-Gm-Message-State: ACrzQf0BiVMX+XQSj4V8+1IzeOnSt8kUUnwY6WcqEtSGl5WwE26+DJD6
 Ng9Gjxe4k/HKcr9FbeTtCGL8QFgUpib2qw==
X-Google-Smtp-Source: AMsMyM6RdyPHd7WNd0NPX/4Wc5XMcQDzCaDeuqBEvGYi76Ii8X64HoV+cEzP8SwdjoE5yxEtKrqk8Q==
X-Received: by 2002:a5d:6112:0:b0:236:740e:5938 with SMTP id
 v18-20020a5d6112000000b00236740e5938mr7592682wrt.155.1667217272442; 
 Mon, 31 Oct 2022 04:54:32 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a1ce907000000b003c701c12a17sm6993131wmc.12.2022.10.31.04.54.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Oct 2022 04:54:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 5/6] hw/ppc/e500: Implement pflash handling
Date: Mon, 31 Oct 2022 12:54:01 +0100
Message-Id: <20221031115402.91912-6-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221031115402.91912-1-philmd@linaro.org>
References: <20221031115402.91912-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
[PMD: Use memory_region_size()]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/system/ppc/ppce500.rst | 16 ++++++++
 hw/ppc/Kconfig              |  1 +
 hw/ppc/e500.c               | 79 +++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 7b5eb3c4ee..38f8ceb0cf 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -165,3 +165,19 @@ if “-device eTSEC” is given to QEMU:
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
+
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
index 3e950ea3ba..84bcc25526 100644
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
+        uint64_t size = bdrv_getlength(bs);
+        uint32_t sector_len = 64 * KiB;
+        uint64_t mmio_size = memory_region_size(&pms->pbus_dev->mmio);
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


