Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6B44CF70
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 03:04:07 +0100 (CET)
Received: from localhost ([::1]:39128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzRe-0002Bg-Qj
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 21:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0z-0006di-FT
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:36 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54360 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0w-0001sv-3h
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:31 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S29; 
 Thu, 11 Nov 2021 09:36:15 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 27/30] hw/loongarch: Add LoongArch smbios support
Date: Thu, 11 Nov 2021 09:35:25 +0800
Message-Id: <1636594528-8175-28-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S29
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8Zw18trWkCw1xGw4xCrg_yoW5uw4xpF
 y7CF1kurs5Xrn3KrZIq347WFn5Zws7Kw12qFWIy3yFkFZrAr1Uuw4kA34qyFy8J3y8Ga4j
 vFn5K3W3Xa1UJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig             |  1 +
 hw/loongarch/ls3a5000_virt.c     | 41 ++++++++++++++++++++++++++++++++
 include/hw/loongarch/loongarch.h |  2 ++
 3 files changed, 44 insertions(+)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index b59cd98a7a..595c19ad83 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -14,6 +14,7 @@ config LOONGSON_3A5000
     select LOONGARCH_EXTIOI
     select LS7A_RTC
     select FW_CFG_LOONGARCH
+    select SMBIOS
 
 config FW_CFG_LOONGARCH
     bool
diff --git a/hw/loongarch/ls3a5000_virt.c b/hw/loongarch/ls3a5000_virt.c
index 902a0c7630..bfe8dd4757 100644
--- a/hw/loongarch/ls3a5000_virt.c
+++ b/hw/loongarch/ls3a5000_virt.c
@@ -26,6 +26,7 @@
 #include "hw/pci-host/ls7a.h"
 #include "hw/misc/unimp.h"
 #include "hw/loongarch/fw_cfg.h"
+#include "hw/firmware/smbios.h"
 
 #define LOONGSON3_BIOSNAME "loongarch_bios.bin"
 
@@ -101,6 +102,43 @@ static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
     fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, (const char *)cmdline_buf);
 }
 
+static void loongarch_build_smbios(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    MachineClass *mc = MACHINE_GET_CLASS(lams);
+    uint8_t *smbios_tables, *smbios_anchor;
+    size_t smbios_tables_len, smbios_anchor_len;
+    const char *product = "QEMU Virtual Machine";
+    ms->smp.cores = 4;
+
+    if (!lams->fw_cfg) {
+        return;
+    }
+
+    product = "LoongArch-3A5K-7A1000-TCG";
+
+    smbios_set_defaults("QEMU", product, mc->name, false,
+                        true, SMBIOS_ENTRY_POINT_30);
+
+    smbios_get_tables(ms, NULL, 0, &smbios_tables, &smbios_tables_len,
+                      &smbios_anchor, &smbios_anchor_len, &error_fatal);
+
+    if (smbios_anchor) {
+        fw_cfg_add_file(lams->fw_cfg, "etc/smbios/smbios-tables",
+                        smbios_tables, smbios_tables_len);
+        fw_cfg_add_file(lams->fw_cfg, "etc/smbios/smbios-anchor",
+                        smbios_anchor, smbios_anchor_len);
+    }
+}
+
+static
+void loongarch_machine_done(Notifier *notifier, void *data)
+{
+    LoongArchMachineState *lams = container_of(notifier,
+                                        LoongArchMachineState, machine_done);
+    loongarch_build_smbios(lams);
+}
+
 static void main_cpu_reset(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
@@ -377,6 +415,9 @@ static void ls3a5000_virt_init(MachineState *machine)
     memory_region_set_readonly(bios, true);
     memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, bios);
 
+    lams->machine_done.notify = loongarch_machine_done;
+    qemu_add_machine_init_done_notifier(&lams->machine_done);
+
     /* Add PM mmio memory for reboot and shutdown*/
     iomem = g_new(MemoryRegion, 1);
     memory_region_init_io(iomem, NULL, &loongarch_pm_ops, NULL,
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index dc7617ab64..b165b4fd07 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -49,6 +49,8 @@ typedef struct LoongArchMachineState {
     AddressSpace *address_space_iocsr;
     MemoryRegion *system_iocsr;
 
+    /* State for other subsystems/APIs: */
+    Notifier machine_done;
     gipiState   *gipi;
     qemu_irq    *pch_irq;
     FWCfgState  *fw_cfg;
-- 
2.27.0


