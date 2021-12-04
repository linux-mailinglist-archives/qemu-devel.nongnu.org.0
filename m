Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDEB4684CB
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 13:29:59 +0100 (CET)
Received: from localhost ([::1]:49088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtUAw-0004yX-Fb
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 07:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mtTpf-0007i3-Le
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:59 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58524 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mtTpd-0003Jh-N6
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 07:07:59 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axysj9Wath8+ECAA--.6122S28; 
 Sat, 04 Dec 2021 20:07:43 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 26/27] hw/loongarch: Add LoongArch smbios support
Date: Sat,  4 Dec 2021 20:07:24 +0800
Message-Id: <1638619645-11283-27-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1638619645-11283-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Axysj9Wath8+ECAA--.6122S28
X-Coremail-Antispam: 1UD129KBjvJXoWxGry8Ww1UJry8AFy3ZrykGrg_yoW5ur48pF
 y3CF1kGrs5Xrn3KrZ3t347uFn5Zrs3KwnFqFWIyw40kFZrAr1UZw4kA34qyFyUJ3ykG34j
 qFnYg3W3Xa1UJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 philmd@redhat.com, i.qemu@xen0n.name, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, richard.henderson@linaro.org, alex.bennee@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig             |  1 +
 hw/loongarch/loongson3.c         | 41 ++++++++++++++++++++++++++++++++
 include/hw/loongarch/loongarch.h |  1 +
 3 files changed, 43 insertions(+)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 44319531bc..26138516e3 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -15,6 +15,7 @@ config LOONGSON3_LS7A
     select LOONGARCH_EXTIOI
     select LS7A_RTC
     select FW_CFG_LOONGARCH
+    select SMBIOS
 
 config FW_CFG_LOONGARCH
     bool
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 677d61c262..83fb6b8f0f 100644
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
 static void loongarch_cpu_reset(void *opaque)
 {
     LoongArchCPU *cpu = opaque;
@@ -362,6 +399,10 @@ static void loongson3_init(MachineState *machine)
                            LA_BIOS_SIZE, &error_fatal);
     memory_region_set_readonly(&lams->bios, true);
     memory_region_add_subregion(get_system_memory(), LA_BIOS_BASE, &lams->bios);
+
+    lams->machine_done.notify = loongarch_machine_done;
+    qemu_add_machine_init_done_notifier(&lams->machine_done);
+
     /*
      * There are some invalid guest memory access.
      * Create some unimplemented devices to emulate this.
diff --git a/include/hw/loongarch/loongarch.h b/include/hw/loongarch/loongarch.h
index fd09d987b2..bda7dd645d 100644
--- a/include/hw/loongarch/loongarch.h
+++ b/include/hw/loongarch/loongarch.h
@@ -52,6 +52,7 @@ typedef struct LoongArchMachineState {
     MemoryRegion bios;
 
     /* State for other subsystems/APIs: */
+    Notifier machine_done;
     FWCfgState  *fw_cfg;
 } LoongArchMachineState;
 
-- 
2.27.0


