Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77FF61E2A2
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 15:40:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orgo3-0004FL-3k; Sun, 06 Nov 2022 09:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1orgo0-0004Eh-Ul
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 09:39:25 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1orgnz-0001oc-4L
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 09:39:24 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so8219599pjd.4
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 06:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0fB0udMZsQvg+8bmyp7ro9M87xUAvgONQV5uxUWqipI=;
 b=ggDIFH98FXDYmmiwkLS0iwWF9t7b7GVvHrlwecxRF2F053snlg9f9BM67ed2qr++J8
 6p52T30J7KJwpqNkobym2Re7QqKcq6sapzH5fkgm4S7ISlnEwVbzyTfIgnJPACn38bEo
 QHOrqdf0YZSHaj8nm7iVRVf/8wiOZh+VOBZ568aC9ywLwFmPHyFjl5s9oriXjrlVWetr
 CEWM1YQAUyi2sTjZVHUlrdyGcYhIM8GSpyOL6U3SnmoXg6PIGruQeN5nw5MYQPeAWxuV
 zwg7PBV8rm9eeau4DzANqNGDyu0rxppsPRAtbcvI+UBPAAtnbALgRl+EgAno+fyaVmne
 kGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0fB0udMZsQvg+8bmyp7ro9M87xUAvgONQV5uxUWqipI=;
 b=XUbFhVuxpNVNDMub6INNiubgwsOHXotxwtQJj5hqAllC5Cqt/k0EUGhjUPo9BpwFEd
 DBNuvV43WhewIw4oDsEmveCs+HusX8HIZJoespmfA1XWzqs0ZEyLKWTqXskvBH+ndbeB
 YcdRYpFbnRlYkMEdxe+ofqBwimF4HIETpgXc/WQQEogv5dNE1+Y1YwbJz3sWdI+KbwJf
 JMZLJ2uqx3fzLcH+Yv1K/XtiRoHK2ATWnbHlxiMNYXbg23CDSv5wjQlVgWxowNy8CiBa
 iUrJh0JzaF4HzyjcSEWvEoLwZQJx7w3OIAsKJiZQJtA9/FyqzXhF6BOWf0vSJa/UheYk
 AYUQ==
X-Gm-Message-State: ACrzQf0qdiAOlBJJeFDFsZ3CU1RJcK/xj/QlhTnI6Sj4jzd+Ooq3SP40
 GRHQYujqPRnVPlNa9GfKPAvQsw==
X-Google-Smtp-Source: AMsMyM6V8hLxqW4YpWe4tjoHcKpzTHKqP74L/YQAUFEn42140SN0bgY9R4Hc2Pt8Vs86BMEhLmuFsg==
X-Received: by 2002:a17:90b:19ca:b0:212:d2c4:83ac with SMTP id
 nm10-20020a17090b19ca00b00212d2c483acmr63709269pjb.166.1667745560751; 
 Sun, 06 Nov 2022 06:39:20 -0800 (PST)
Received: from localhost.localdomain ([49.206.12.236])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a170902da9100b001811a197797sm3209279plx.194.2022.11.06.06.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 06:39:20 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH] hw/riscv: virt: Remove size restriction for pflash
Date: Sun,  6 Nov 2022 20:09:00 +0530
Message-Id: <20221106143900.2229449-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1033.google.com
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

The pflash implementation currently assumes fixed size of the
backend storage. Due to this, the backend storage file needs to be
exactly of size 32M. Otherwise, there will be an error like below.

"device requires 33554432 bytes, block backend provides 3145728 bytes"

Fix this issue by using the actual size of the backing store.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..aad175fa31 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -49,6 +49,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
+#include "sysemu/block-backend.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -144,10 +145,17 @@ static void virt_flash_map1(PFlashCFI01 *flash,
                             MemoryRegion *sysmem)
 {
     DeviceState *dev = DEVICE(flash);
+    BlockBackend *blk;
+    hwaddr real_size;
 
-    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
-    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
-    qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
+    blk = pflash_cfi01_get_blk(flash);
+
+    real_size = blk ? blk_getlength(blk): size;
+
+    assert(real_size);
+    assert(QEMU_IS_ALIGNED(real_size, VIRT_FLASH_SECTOR_SIZE));
+    assert(real_size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
+    qdev_prop_set_uint32(dev, "num-blocks", real_size / VIRT_FLASH_SECTOR_SIZE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     memory_region_add_subregion(sysmem, base,
@@ -971,15 +979,24 @@ static void create_fdt_flash(RISCVVirtState *s, const MemMapEntry *memmap)
 {
     char *name;
     MachineState *mc = MACHINE(s);
-    hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
-    hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
+    MemoryRegion *flash_mem;
+    hwaddr flashsize[2];
+    hwaddr flashbase[2];
+
+    flash_mem = pflash_cfi01_get_memory(s->flash[0]);
+    flashbase[0] = flash_mem->addr;
+    flashsize[0] = flash_mem->size;
+
+    flash_mem = pflash_cfi01_get_memory(s->flash[1]);
+    flashbase[1] = flash_mem->addr;
+    flashsize[1] = flash_mem->size;
 
-    name = g_strdup_printf("/flash@%" PRIx64, flashbase);
+    name = g_strdup_printf("/flash@%" PRIx64, flashbase[0]);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "cfi-flash");
     qemu_fdt_setprop_sized_cells(mc->fdt, name, "reg",
-                                 2, flashbase, 2, flashsize,
-                                 2, flashbase + flashsize, 2, flashsize);
+                                 2, flashbase[0], 2, flashsize[0],
+                                 2, flashbase[1], 2, flashsize[1]);
     qemu_fdt_setprop_cell(mc->fdt, name, "bank-width", 4);
     g_free(name);
 }
-- 
2.38.0


