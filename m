Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CA455123A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 10:11:04 +0200 (CEST)
Received: from localhost ([::1]:33940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3CUw-00018l-6j
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 04:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o3CPT-0006ey-Um
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47766 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o3CPI-0007Jo-S1
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 04:05:17 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+YjKrBilqVOAA--.20331S5; 
 Mon, 20 Jun 2022 16:04:52 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org,
 chenhuacai@loongson.cn
Subject: [PATCH 3/8] hw/loongarch: Add LoongArch smbios support
Date: Mon, 20 Jun 2022 16:04:46 +0800
Message-Id: <20220620080451.3711049-4-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
References: <20220620080451.3711049-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+YjKrBilqVOAA--.20331S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8GFy7ZF4kXr15Jw1rtFb_yoW5Ww48pF
 y3CFn5Cr4rXrn3KrZxt343uF15Xrs3Kr12qF4Ivw40kFZxAr1UXF48C34qyFyDJ3ykGa4U
 XFn5K3W3Wa1UX3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/loongarch/Kconfig        |  1 +
 hw/loongarch/loongson3.c    | 38 +++++++++++++++++++++++++++++++++++++
 include/hw/loongarch/virt.h |  1 +
 3 files changed, 40 insertions(+)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 35b6680772..610552e522 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -14,3 +14,4 @@ config LOONGARCH_VIRT
     select LOONGARCH_PCH_MSI
     select LOONGARCH_EXTIOI
     select LS7A_RTC
+    select SMBIOS
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 638280c4e7..b638d02eb5 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -30,11 +30,47 @@
 #include "hw/misc/unimp.h"
 #include "hw/loongarch/fw_cfg.h"
 #include "target/loongarch/cpu.h"
+#include "hw/misc/unimp.h"
+#include "hw/loongarch/fw_cfg.h"
+#include "hw/firmware/smbios.h"
 
 #define PM_BASE 0x10080000
 #define PM_SIZE 0x100
 #define PM_CTRL 0x10
 
+static void virt_build_smbios(LoongArchMachineState *lams)
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
+static void virt_machine_done(Notifier *notifier, void *data)
+{
+    LoongArchMachineState *lams = container_of(notifier,
+                                        LoongArchMachineState, machine_done);
+    virt_build_smbios(lams);
+}
+
 struct la_memmap_entry {
     uint64_t address;
     uint64_t length;
@@ -525,6 +561,8 @@ static void loongarch_init(MachineState *machine)
     }
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
+    lams->machine_done.notify = virt_machine_done;
+    qemu_add_machine_init_done_notifier(&lams->machine_done);
 }
 
 static void loongarch_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index 448f46fc6b..55bc2fe4e9 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -33,6 +33,7 @@ struct LoongArchMachineState {
 
     /* State for other subsystems/APIs: */
     FWCfgState  *fw_cfg;
+    Notifier machine_done;
 };
 
 #define TYPE_LOONGARCH_MACHINE  MACHINE_TYPE_NAME("virt")
-- 
2.31.1


