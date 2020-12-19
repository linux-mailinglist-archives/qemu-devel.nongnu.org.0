Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5342DEC60
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 01:26:54 +0100 (CET)
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqQ5F-000196-8o
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 19:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitaly.wool@konsulko.com>)
 id 1kqQ3B-0000Nf-8f
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 19:24:45 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitaly.wool@konsulko.com>)
 id 1kqQ39-0008HR-C9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 19:24:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c5so4391899wrp.6
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 16:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EP26QphpZv4PRijhALYqwD2rrPC6l5BRDwk55robjYw=;
 b=nYPOcWnIz0Yz1L9G23x1SykZzW4nV77H7sBBztXyHPMEsfDt8jDKoea6jVYyQvFfO7
 N5ihHUjx4SeuRaYQs4h2XiGqk4zDbPVFSHRGcSVIxiOYfz6vWVbgEzd8wfg71qLgK90L
 2b+y4NevHXmZgSBKb5jX38HJ2C/WttVGINWe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EP26QphpZv4PRijhALYqwD2rrPC6l5BRDwk55robjYw=;
 b=d/X7iRfRrM6+mNlqzZYr2I9TeusKen9VRi7nH5TnNp9VVmnUzmIpckrPIU2Xe0S4Lt
 Nh+g1EPjpKQFZBKvLHg21Nm0e/IJ5TJukr+EXZ/L21MJT9sMhip1LDydldOswCfSLHk8
 KRSjvcmRkzQ2Q/tTXDrl+hUe/5CQKXnZ9hCFUp1+e9CJaqhs10y4SZgq5f5R2KuK68qU
 9B7cN7A2m5BSBgGC7fVWIZmodsr0njRl5lyuCfHUbv3ot9RWiZ6b7AvaTQqeUozJvtwX
 oO0UmZnLEwSYEcfaU4DReWBd53HyuNnfmyx/H5z4v0xEcVooc9A8fc4HZgunY+jTp5x5
 BxPw==
X-Gm-Message-State: AOAM530tnMKDIMIsYXmy9SQctw2a7SdOcJTPOGFb+4K2TWiT/wjrvqJN
 qmFdRmH5K5W87xL2H2edFgw7vL1FQZnmXz3p
X-Google-Smtp-Source: ABdhPJx6y4aurR3v4u7Rbo+36VjAeAa2BUJTSctwjjbA1zRpt67uinMfH2aiBoXA9uk1YOLnXzuKdA==
X-Received: by 2002:a05:6000:85:: with SMTP id
 m5mr6868614wrx.378.1608337481084; 
 Fri, 18 Dec 2020 16:24:41 -0800 (PST)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id u66sm13760951wmg.30.2020.12.18.16.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 16:24:40 -0800 (PST)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/riscv: microchip_pfsoc: specify XIP image
Date: Sat, 19 Dec 2020 02:24:30 +0200
Message-Id: <20201219002430.18481-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=vitaly.wool@konsulko.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add command line parameter to microchip_pfsoc machine to be able
to specify XIP kernel image file. To pass over XIP image file, it
will be enough to run

$ qemu-system-riscv64 -M microchip-icicle-kit,xipImage=<image> ...

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 hw/riscv/microchip_pfsoc.c         | 42 +++++++++++++++++++++++++++---
 include/hw/riscv/microchip_pfsoc.h |  1 +
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index e952b49e8c..04d81d52fe 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -181,6 +181,7 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
 static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
+    MicrochipIcicleKitState *mks = MICROCHIP_ICICLE_KIT_MACHINE(ms);
     MicrochipPFSoCState *s = MICROCHIP_PFSOC(dev);
     const struct MemmapEntry *memmap = microchip_pfsoc_memmap;
     MemoryRegion *system_memory = get_system_memory();
@@ -415,10 +416,19 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
                     memmap[MICROCHIP_PFSOC_IOSCB].base);
 
     /* QSPI Flash */
-    memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
-                           "microchip.pfsoc.qspi_xip",
-                           memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
-                           &error_fatal);
+    if (mks->xip_image) {
+        memory_region_init_ram_from_file(qspi_xip_mem, OBJECT(dev),
+                                         "microchip.pfsoc.qspi_xip",
+                                         memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
+                                         0x10000 /* align */, 0 /* ram_flags */,
+                                         mks->xip_image, &error_fatal);
+        qspi_xip_mem->readonly = true;
+    } else {
+        memory_region_init_rom(qspi_xip_mem, OBJECT(dev),
+                               "microchip.pfsoc.qspi_xip",
+                               memmap[MICROCHIP_PFSOC_QSPI_XIP].size,
+                               &error_fatal);
+    }
     memory_region_add_subregion(system_memory,
                                 memmap[MICROCHIP_PFSOC_QSPI_XIP].base,
                                 qspi_xip_mem);
@@ -517,6 +527,24 @@ static void microchip_icicle_kit_machine_init(MachineState *machine)
     }
 }
 
+static void microchip_pfsoc_prop_set_xipimage(Object *obj,
+                                              const char *value,
+                                              Error **errp)
+{
+    MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(obj);
+
+    g_free(s->xip_image);
+    s->xip_image = g_strdup(value);
+}
+
+static char *microchip_pfsoc_prop_get_xipimage(Object *obj,
+                                               Error **errp)
+{
+    MicrochipIcicleKitState *s = MICROCHIP_ICICLE_KIT_MACHINE(obj);
+
+    return g_strdup(s->xip_image);
+}
+
 static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -536,6 +564,12 @@ static void microchip_icicle_kit_machine_class_init(ObjectClass *oc, void *data)
      * See memory_tests() in mss_ddr.c in the HSS source code.
      */
     mc->default_ram_size = 1537 * MiB;
+
+    object_class_property_add_str(oc, "xipImage",
+                            microchip_pfsoc_prop_get_xipimage,
+                            microchip_pfsoc_prop_set_xipimage);
+    object_class_property_set_description(oc, "xipImage",
+                                    "Kernel XIP image to run from QSPI NOR");
 }
 
 static const TypeInfo microchip_icicle_kit_machine_typeinfo = {
diff --git a/include/hw/riscv/microchip_pfsoc.h b/include/hw/riscv/microchip_pfsoc.h
index d0c666aae0..a7b180a5d4 100644
--- a/include/hw/riscv/microchip_pfsoc.h
+++ b/include/hw/riscv/microchip_pfsoc.h
@@ -65,6 +65,7 @@ typedef struct MicrochipIcicleKitState {
 
     /*< public >*/
     MicrochipPFSoCState soc;
+    char *xip_image;
 } MicrochipIcicleKitState;
 
 #define TYPE_MICROCHIP_ICICLE_KIT_MACHINE \
-- 
2.20.1


