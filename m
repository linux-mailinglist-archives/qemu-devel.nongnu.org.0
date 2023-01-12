Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00987666B1C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 07:13:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFqop-00074e-UC; Thu, 12 Jan 2023 01:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pFqoi-00074Q-Qm
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 01:12:00 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pFqof-00067K-5B
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 01:12:00 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxCeqgpL9jiiMBAA--.3433S3;
 Thu, 12 Jan 2023 14:11:44 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxD7+gpL9jt0kYAA--.6398S2; 
 Thu, 12 Jan 2023 14:11:44 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, yangxiaojuan@loongson.cn,
 maobibo@loongson.cn
Subject: [PATCH 1/1] hw/loongarch/virt: add system_powerdown hmp command
 support
Date: Thu, 12 Jan 2023 14:11:44 +0800
Message-Id: <20230112061144.3539393-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxD7+gpL9jt0kYAA--.6398S2
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw4DXw15Jw1ktF17Kw13twb_yoW8KFWDpa
 sxuFn3ua1kXryfWF9Fqas8Zr15Arn7C342vF1IkrWFkFsFgr1v9rWrA34qyFy8G3yrGFWv
 vFn5tFy7W3WUWrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bn8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2
 zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_WwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
 aVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
 Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY
 6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
 1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj4RC_MaUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For loongarch virt machine, add powerdown notification callback
and send ACPI_POWER_DOWN_STATUS event by acpi ged. Also add
acpi dsdt table for ACPI_POWER_BUTTON_DEVICE device in this
patch.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/acpi-build.c   |  1 +
 hw/loongarch/virt.c         | 14 ++++++++++++++
 include/hw/loongarch/virt.h |  1 +
 3 files changed, 16 insertions(+)

diff --git a/hw/loongarch/acpi-build.c b/hw/loongarch/acpi-build.c
index c2b237736d..b7601cb284 100644
--- a/hw/loongarch/acpi-build.c
+++ b/hw/loongarch/acpi-build.c
@@ -261,6 +261,7 @@ build_la_ged_aml(Aml *dsdt, MachineState *machine)
                                  AML_SYSTEM_MEMORY,
                                  VIRT_GED_MEM_ADDR);
     }
+    acpi_dsdt_add_power_button(dsdt);
 }
 
 static void build_pci_device_aml(Aml *scope, LoongArchMachineState *lams)
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 66be925068..a4998599d3 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -316,6 +316,16 @@ static void virt_machine_done(Notifier *notifier, void *data)
     loongarch_acpi_setup(lams);
 }
 
+static void virt_powerdown_req(Notifier *notifier, void *opaque)
+{
+    LoongArchMachineState *s = container_of(notifier,
+                                   LoongArchMachineState, powerdown_notifier);
+
+    if (s->acpi_ged) {
+        acpi_send_event(s->acpi_ged, ACPI_POWER_DOWN_STATUS);
+    }
+}
+
 struct memmap_entry {
     uint64_t address;
     uint64_t length;
@@ -859,6 +869,10 @@ static void loongarch_init(MachineState *machine)
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


