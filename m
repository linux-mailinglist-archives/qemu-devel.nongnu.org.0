Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A976A8F54
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:42:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXvMC-0002VL-8U; Thu, 02 Mar 2023 21:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pXvM9-0002Ug-UC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:41:13 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pXvM7-0004hM-8w
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:41:13 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Dxj81CXgFk0ncHAA--.8769S3;
 Fri, 03 Mar 2023 10:41:06 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxbL4_XgFkx4lHAA--.60313S7; 
 Fri, 03 Mar 2023 10:41:06 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 5/5] hw/loongarch/virt: add system_powerdown hmp command support
Date: Fri,  3 Mar 2023 10:41:03 +0800
Message-Id: <20230303024103.356250-6-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230303024103.356250-1-gaosong@loongson.cn>
References: <20230303024103.356250-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxbL4_XgFkx4lHAA--.60313S7
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw4DXw15Jw4rXF47CrWDXFb_yoW5JFy3pa
 sxurn7ua1kXryxWF929a4DZF45Arn7Cw12vF12krWFkFsFgr1q9rW8A3yqyFy8C3yrJayv
 vFn5tFy7W3WUWrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For loongarch virt machine, add powerdown notification callback
and send ACPI_POWER_DOWN_STATUS event by acpi ged. Also add
acpi dsdt table for ACPI_POWER_BUTTON_DEVICE device in this
patch.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20230303010548.295580-1-gaosong@loongson.cn>
---
 hw/loongarch/acpi-build.c   |  1 +
 hw/loongarch/virt.c         | 12 ++++++++++++
 include/hw/loongarch/virt.h |  1 +
 3 files changed, 14 insertions(+)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index 8aed50e858..6cb2472d33 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -260,6 +260,7 @@ build_la_ged_aml(Aml *dsdt, MachineState *machine)
                                  AML_SYSTEM_MEMORY,
                                  VIRT_GED_MEM_ADDR);
     }
+    acpi_dsdt_add_power_button(dsdt);
 }
 
 static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 49d25059f8..38ef7cc49f 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -316,6 +316,14 @@ static void virt_machine_done(Notifier *notifier, void *data)
     loongarch_acpi_setup(lams);
 }
 
+static void virt_powerdown_req(Notifier *notifier, void *opaque)
+{
+    LoongArchMachineState *s = container_of(notifier,
+                                   LoongArchMachineState, powerdown_notifier);
+
+    acpi_send_event(s->acpi_ged, ACPI_POWER_DOWN_STATUS);
+}
+
 struct memmap_entry {
     uint64_t address;
     uint64_t length;
@@ -859,6 +867,10 @@ static void loongarch_init(MachineState *machine)
                                    VIRT_PLATFORM_BUS_IRQ);
     lams->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&lams->machine_done);
+     /* connect powerdown request */
+    lams->powerdown_notifier.notify = virt_powerdown_req;
+    qemu_register_powerdown_notifier(&lams->powerdown_notifier);
+
     fdt_add_pcie_node(lams);
     /*
      * Since lowmem region starts from 0 and Linux kernel legacy start address
diff --git a/include/hw/loongarch/virt.h b/include/hw/loongarch/virt.h
index f5f818894e..7ae8a91229 100644
--- a/include/hw/loongarch/virt.h
+++ b/include/hw/loongarch/virt.h
@@ -45,6 +45,7 @@ struct LoongArchMachineState {
     /* State for other subsystems/APIs: */
     FWCfgState  *fw_cfg;
     Notifier     machine_done;
+    Notifier     powerdown_notifier;
     OnOffAuto    acpi;
     char         *oem_id;
     char         *oem_table_id;
-- 
2.31.1


