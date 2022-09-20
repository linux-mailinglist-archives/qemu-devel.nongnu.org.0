Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10A85BE397
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 12:44:34 +0200 (CEST)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaajx-0001IK-RQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 06:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oaZuj-0000PO-6s
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33974 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oaZuc-0005Tn-Uv
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 05:51:35 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxnmsCjSljVJ8eAA--.35099S4; 
 Tue, 20 Sep 2022 17:51:28 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, stefanha@gmail.com,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PULL v2 2/9] hw/loongarch: Support fw_cfg dma function
Date: Tue, 20 Sep 2022 17:50:51 +0800
Message-Id: <20220920095058.4124145-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220920095058.4124145-1-gaosong@loongson.cn>
References: <20220920095058.4124145-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxnmsCjSljVJ8eAA--.35099S4
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWfuw1xAF1DAw1rZF1DJrb_yoW8ur4rpF
 y7Za4DJr48JrsxtrZag34UXr1xJrZ7GrW2qF4Iyw40kasrXw1UZr10v39IyFyUX3s5JFy0
 va95K3y5X3W8ta7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Support fw_cfg dma function for LoongArch virt machine.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220908094623.73051-3-yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 hw/loongarch/Kconfig  | 1 +
 hw/loongarch/fw_cfg.c | 3 ++-
 hw/loongarch/virt.c   | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/loongarch/Kconfig b/hw/loongarch/Kconfig
index 73c52b093e..1deea83626 100644
--- a/hw/loongarch/Kconfig
+++ b/hw/loongarch/Kconfig
@@ -16,3 +16,4 @@ config LOONGARCH_VIRT
     select SMBIOS
     select ACPI_PCI
     select ACPI_HW_REDUCED
+    select FW_CFG_DMA
diff --git a/hw/loongarch/fw_cfg.c b/hw/loongarch/fw_cfg.c
index f6503d5607..f15a17416c 100644
--- a/hw/loongarch/fw_cfg.c
+++ b/hw/loongarch/fw_cfg.c
@@ -23,7 +23,8 @@ FWCfgState *loongarch_fw_cfg_init(ram_addr_t ram_size, MachineState *ms)
     int max_cpus = ms->smp.max_cpus;
     int smp_cpus = ms->smp.cpus;
 
-    fw_cfg = fw_cfg_init_mem_wide(VIRT_FWCFG_BASE + 8, VIRT_FWCFG_BASE, 8, 0, NULL);
+    fw_cfg = fw_cfg_init_mem_wide(VIRT_FWCFG_BASE + 8, VIRT_FWCFG_BASE, 8,
+                                  VIRT_FWCFG_BASE + 16, &address_space_memory);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)max_cpus);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index b56820ecda..4f833a2044 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -118,7 +118,7 @@ static void fdt_add_fw_cfg_node(const LoongArchMachineState *lams)
     qemu_fdt_setprop_string(ms->fdt, nodename,
                             "compatible", "qemu,fw-cfg-mmio");
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-                                 2, base, 2, 0x8);
+                                 2, base, 2, 0x18);
     qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
     g_free(nodename);
 }
-- 
2.31.1


