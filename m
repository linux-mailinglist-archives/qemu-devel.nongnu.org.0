Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5394882C0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 10:21:02 +0100 (CET)
Received: from localhost ([::1]:56858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67uH-0004Hm-R3
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 04:21:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1n67oY-0004Ut-Nj
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:15:06 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39246 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1n67oU-0000sP-Vj
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 04:15:05 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKMrrVdlhvLMAAA--.1341S29; 
 Sat, 08 Jan 2022 17:14:47 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 27/30] hw/loongarch: Add LoongArch smbios support
Date: Sat,  8 Jan 2022 04:14:16 -0500
Message-Id: <20220108091419.2027710-28-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
References: <20220108091419.2027710-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxKMrrVdlhvLMAAA--.1341S29
X-Coremail-Antispam: 1UD129KBjvJXoWxGry5Gr17Cw15AF1kAFy7Wrg_yoW5ZFyxpF
 y3CF1kGrs5Xrn3KrZxt347uFn5Zrs3KwnFqFWIyw40kFZrJr1UZw4kA34qyFyUJ3ykGa4j
 qFnYg3W3Xa1UJ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: philmd@redhat.com, mark.cave-ayland@ilande.co.uk,
 richard.henderson@linaro.org, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig             |  1 +
 hw/loongarch/loongson3.c         | 40 ++++++++++++++++++++++++++++++++
 include/hw/loongarch/loongarch.h |  1 +
 3 files changed, 42 insertions(+)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 06bfb82b1d..6e24e112b3 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -14,6 +14,7 @@ config LOONGSON3_LS7A
     select LOONGARCH_EXTIOI
     select LS7A_RTC
     select FW_CFG_LOONGARCH
+    select SMBIOS
 
 config FW_CFG_LOONGARCH
     bool
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 546ef6f4f1..8856225a99 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -27,6 +27,7 @@
 #include "hw/pci-host/ls7a.h"
 #include "hw/misc/unimp.h"
 #include "hw/loongarch/fw_cfg.h"
+#include "hw/firmware/smbios.h"
 
 #define LOONGSON3_BIOSNAME "loongarch_bios.bin"
 
@@ -100,6 +101,42 @@ static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
     fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, (const char *)cmdline_buf);
 }
 
+static void loongarch_build_smbios(LoongArchMachineState *lams)
+{
+    MachineState *ms = MACHINE(lams);
+    MachineClass *mc = MACHINE_GET_CLASS(lams);
+    uint8_t *smbios_tables, *smbios_anchor;
+    size_t smbios_tables_len, smbios_anchor_len;
+    const char *product = "QEMU Virtual Machine";
+
+    if (!lams->fw_cfg) {
+        return;
+    }
+
+    product = "Loongson-3A5000-7A1000-TCG";
+
+    smbios_set_defaults("QEMU", product, mc->name, false,
+                        true, SMBIOS_ENTRY_POINT_TYPE_64);
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
 static void loongarch_cpu_reset(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
@@ -417,6 +454,9 @@ static void loongarch_init(MachineState *machine)
     memory_region_set_readonly(&lams->bios, true);
     memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, &lams->bios);
 
+    lams->machine_done.notify = loongarch_machine_done;
+    qemu_add_machine_init_done_notifier(&lams->machine_done);
+
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
 }
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index 9ffcf8429f..9080864804 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -54,6 +54,7 @@ typedef struct LoongArchMachineState {
     MemoryRegion bios;
 
     /* State for other subsystems/APIs: */
+    Notifier machine_done;
     FWCfgState  *fw_cfg;
 } LoongArchMachineState;
 
-- 
2.27.0


