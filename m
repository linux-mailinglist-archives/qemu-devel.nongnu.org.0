Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32EA554562
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:50:18 +0200 (CEST)
Received: from localhost ([::1]:60452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xw9-0007He-Nx
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3xpb-000848-W6
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53544 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3xpZ-0003yG-TA
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:43:31 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0838rJi+BtUAA--.28846S5; 
 Wed, 22 Jun 2022 18:43:04 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 03/10] hw/loongarch: Add uefi bios loading support
Date: Wed, 22 Jun 2022 18:42:54 +0800
Message-Id: <20220622104301.804447-4-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
References: <20220622104301.804447-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL0838rJi+BtUAA--.28846S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGryUKr47WF4xtFWkuw45ZFb_yoW5Xr4kpF
 y7CFn8Wrs5GrsxWrs3K345urn5Jrs7Ca47WF47Cr4FkF13ur1DZrW8J3s0yFyUAa95WFyj
 qF9Yqw4xW3WUJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add uefi bios loading support, now only uefi bios is porting to
loongarch virt machine.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/loongson3.c    | 34 ++++++++++++++++++++++++++++++++++
 include/hw/loongarch/virt.h |  4 ++++
 2 files changed, 38 insertions(+)

diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index e570919f48..ac4a7e4143 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -312,6 +312,37 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     loongarch_devices_init(pch_pic);
 }
 
+static void loongarch_firmware_init(LoongArchMachineState *lams)
+{
+    char *filename = MACHINE(lams)->firmware;
+    char *bios_name = NULL;
+    int bios_size;
+
+    lams->bios_loaded = false;
+    if (filename) {
+        bios_name = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
+        if (!bios_name) {
+            error_report("Could not find ROM image '%s'", filename);
+            exit(1);
+        }
+
+        bios_size = load_image_targphys(bios_name, VIRT_BIOS_BASE, VIRT_BIOS_SIZE);
+        if (bios_size < 0) {
+            error_report("Could not load ROM image '%s'", bios_name);
+            exit(1);
+        }
+
+        g_free(bios_name);
+
+        memory_region_init_ram(&lams->bios, NULL, "loongarch.bios",
+                               VIRT_BIOS_SIZE, &error_fatal);
+        memory_region_set_readonly(&lams->bios, true);
+        memory_region_add_subregion(get_system_memory(), VIRT_BIOS_BASE, &lams->bios);
+        lams->bios_loaded = true;
+    }
+
+}
+
 static void reset_load_elf(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
@@ -371,6 +402,9 @@ static void loongarch_init(MachineState *machine)
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    /* load the BIOS image. */
+    loongarch_firmware_init(lams);
+
     /* fw_cfg init */
     lams->fw_cfg = loongarch_fw_cfg_init(ram_size, machine);
     rom_set_fw(lams->fw_cfg);
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 9fec1f8a5c..ec37d86e44 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -18,6 +18,8 @@
 #define LOONGARCH_ISA_IO_BASE   0x18000000UL
 #define LOONGARCH_ISA_IO_SIZE   0x0004000
 #define VIRT_FWCFG_BASE         0x1e020000UL
+#define VIRT_BIOS_BASE          0x1c000000UL
+#define VIRT_BIOS_SIZE          (4 * MiB)
 
 struct LoongArchMachineState {
     /*< private >*/
@@ -27,6 +29,8 @@ struct LoongArchMachineState {
     MemoryRegion lowmem;
     MemoryRegion highmem;
     MemoryRegion isa_io;
+    MemoryRegion bios;
+    bool         bios_loaded;
     /* State for other subsystems/APIs: */
     FWCfgState  *fw_cfg;
 };
-- 
2.31.1


