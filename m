Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6834C3FDB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 09:15:09 +0100 (CET)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNVkp-0002zn-AO
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 03:15:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nNVaC-0008BB-78
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:04:12 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42100 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nNVZt-0002Sm-6D
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 03:04:06 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxqMg8jRhiw9UGAA--.8228S28; 
 Fri, 25 Feb 2022 16:03:24 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v6 26/29] hw/loongarch: Add LoongArch smbios support
Date: Fri, 25 Feb 2022 03:03:05 -0500
Message-Id: <20220225080308.1405-27-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
References: <20220225080308.1405-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxqMg8jRhiw9UGAA--.8228S28
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8tw1fXrW5Ar48JryrWFg_yoW5ZFyUpF
 y7uFn5Crs5Xrn3KrZxt343WFn5Zrs3GrnFqFWIyw40kFZxAr1UXa1kA34qyFyUJ3ykG34j
 qFn5K3W3Xa1UJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig             |  1 +
 hw/loongarch/loongson3.c         | 43 ++++++++++++++++++++++++++++++++
 include/hw/loongarch/loongarch.h |  1 +
 3 files changed, 45 insertions(+)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 33a9066586..26690dee48 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -15,6 +15,7 @@ config LOONGARCH_VIRT
     select LOONGARCH_EXTIOI
     select LS7A_RTC
     select FW_CFG_LOONGARCH
+    select SMBIOS
 
 config FW_CFG_LOONGARCH
     bool
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 9533057110..4189ffc34d 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -29,6 +29,9 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/misc/unimp.h"
 #include "hw/loongarch/fw_cfg.h"
+#include "hw/misc/unimp.h"
+#include "hw/loongarch/fw_cfg.h"
+#include "hw/firmware/smbios.h"
 
 #include "target/loongarch/cpu.h"
 
@@ -159,6 +162,42 @@ static void fw_cfg_add_kernel_info(FWCfgState *fw_cfg)
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
@@ -484,6 +523,10 @@ static void loongarch_init(MachineState *machine)
 
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams, ipi, extioi);
+
+    lams->machine_done.notify = loongarch_machine_done;
+    qemu_add_machine_init_done_notifier(&lams->machine_done);
+
 }
 
 static void loongarch_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index adb1ecd042..26e62a50bf 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -56,6 +56,7 @@ typedef struct LoongArchMachineState {
     MemoryRegion bios;
 
     /* State for other subsystems/APIs: */
+    Notifier machine_done;
     FWCfgState  *fw_cfg;
 } LoongArchMachineState;
 
-- 
2.27.0


