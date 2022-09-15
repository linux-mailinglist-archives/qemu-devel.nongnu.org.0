Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B7D5B9F0B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:40:01 +0200 (CEST)
Received: from localhost ([::1]:43744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqy8-0001a5-IL
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkg-0008Bq-8T; Thu, 15 Sep 2022 11:26:06 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqke-0007LP-A8; Thu, 15 Sep 2022 11:26:05 -0400
Received: by mail-ej1-x62c.google.com with SMTP id bj12so42886655ejb.13;
 Thu, 15 Sep 2022 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=z96/64N+G/WnLnhun69vxUjqijqvFp7jCOFVN/irSOM=;
 b=DhjUu2WAEAxvyFMOSlnHXWJwcxLLGaGWIY2RgB8W+CLxjVRflZRKCuH4WwEq00Ov73
 Qadx7ved9R7J6n9nkqsbhbz3tN4HUNi1F7O4O41F3PBIRTsSpe8yn3mqZBgzezsGiUUt
 RrHRASRewEQA7xdaIXsSzjO6xAkW715Q5bEyqq8N+BOPUrQpTR9Fr0YMa2X2uyRBYCUr
 N+hV27Z3JBa0LywaY9drAJvTeT6qeaxLC+l+IdLl3VGUY/xA0CkvzGgEr8cxYCkejjjt
 CShERvPcld/IaBbRFViyVDLKyUeGUL9e4aLlUX56qjFhfHkwIY1+9zHMLuqezjOXgPP9
 /Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=z96/64N+G/WnLnhun69vxUjqijqvFp7jCOFVN/irSOM=;
 b=7cgRqU+QlkOPl+7cJcnYHk/yu9fTGFL2QRSXzQrtbNVCquEwr9DDvlmMfvMF7qe2zn
 UavvlNL0lmCeJVD3rbPQVAdhzB3pi0eWdJqdxlRv3VdO24teTshVldqiypJbTBH+rSB3
 YyN26md3m36rUeIAf8pLdIki59+ttZ8UK94OZKpOV2bBAUTlRbjg0hakbHFRmT0MQhIO
 RXppv9f6m9j7wXi0Fhvhe/JYPXaKVInomGrn684L/7Oy9IdaiqHz1BTHLrJmKhV9LZRv
 InVir7pA8GMx/dHbw5tEap7aN7xa4M6QVtylP5F1083Se+zC8X9FLv40pYc56HjFVbXv
 v0Jw==
X-Gm-Message-State: ACrzQf2NZBW6il/a39uWay19MWMFae+WTN29tx7+hjVITdvmgl/McNkA
 gXJ+lcAAO/0jVmeXJ8kNNlyZEkvR6Vk=
X-Google-Smtp-Source: AMsMyM67QeKT6YuYJ3XxO7jFg43DNTafmx5LK3So15p2pngNHeZDqTZHOjasrJB7mHQUgrz+lGSNQw==
X-Received: by 2002:a17:907:763b:b0:77b:c559:2bcb with SMTP id
 jy27-20020a170907763b00b0077bc5592bcbmr362342ejc.490.1663255561991; 
 Thu, 15 Sep 2022 08:26:01 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:26:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 07/11] hw/ppc/e500: Implement pflash handling
Date: Thu, 15 Sep 2022 17:25:16 +0200
Message-Id: <20220915152520.21948-8-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allows e500 boards to have their root file system reside on flash using
only builtin devices.

Note that the flash memory area is only created when a -pflash argument is
given, and that the size is determined by the given file. The idea is to
put users into control.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/ppc/ppce500.rst | 12 +++++++++
 hw/ppc/Kconfig              |  1 +
 hw/ppc/e500.c               | 54 +++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index ba6bcb7314..c3f55c6f3d 100644
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
+  $ qemu-system-ppc64 -M ppce500 -cpu e500mc -smp 4 -m 2G \
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
index 864b6f3d92..7843a4e04b 100644
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
@@ -267,6 +269,34 @@ static void sysbus_device_create_devtree(SysBusDevice *sbdev, void *opaque)
     }
 }
 
+static void create_devtree_flash(SysBusDevice *sbdev,
+                                 PlatformDevtreeData *data)
+{
+    char *name;
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
+    qemu_fdt_setprop_cell(fdt, name, "#address-cells", 1);
+    qemu_fdt_setprop_cell(fdt, name, "#size-cells", 1);
+    qemu_fdt_setprop_string(fdt, name, "compatible", "cfi-flash");
+    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                 1, flashbase, 1, flashsize);
+    qemu_fdt_setprop_cell(fdt, name, "bank-width", bank_width);
+    g_free(name);
+}
+
 static void platform_bus_create_devtree(PPCE500MachineState *pms,
                                         void *fdt, const char *mpic)
 {
@@ -276,6 +306,8 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
     uint64_t addr = pmc->platform_bus_base;
     uint64_t size = pmc->platform_bus_size;
     int irq_start = pmc->platform_bus_first_irq;
+    SysBusDevice *sbdev;
+    bool ambiguous;
 
     /* Create a /platform node that we can put all devices into */
 
@@ -302,6 +334,13 @@ static void platform_bus_create_devtree(PPCE500MachineState *pms,
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
 
@@ -856,6 +895,7 @@ void ppce500_init(MachineState *machine)
     unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
     IrqLines *irqs;
     DeviceState *dev, *mpicdev;
+    DriveInfo *dinfo;
     CPUPPCState *firstenv = NULL;
     MemoryRegion *ccsr_addr_space;
     SysBusDevice *s;
@@ -1024,6 +1064,20 @@ void ppce500_init(MachineState *machine)
                                 pmc->platform_bus_base,
                                 sysbus_mmio_get_region(s, 0));
 
+    dinfo = drive_get(IF_PFLASH, 0, 0);
+    if (dinfo) {
+        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
+        BlockDriverState *bs = blk_bs(blk);
+        uint64_t size = bdrv_getlength(bs);
+        if (ctpop64(size) != 1) {
+            error_report("Size of pflash file must be a power of two.");
+            exit(1);
+        }
+        pflash_cfi01_register(pmc->platform_bus_base, "e500.flash",
+                              size, blk,
+                              64 * KiB, 2, 0x89, 0x18, 0x0000, 0x0, 1);
+    }
+
     /*
      * Smart firmware defaults ahead!
      *
-- 
2.37.3


