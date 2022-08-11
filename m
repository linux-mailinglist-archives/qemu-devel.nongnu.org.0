Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E9258F650
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 05:12:57 +0200 (CEST)
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLyco-0000M0-Az
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 23:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1oLyaD-0003B1-9y
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 23:10:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60648 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1oLya9-0006Be-QR
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 23:10:05 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxzyP9cvRi8RcNAA--.8789S4;
 Thu, 11 Aug 2022 11:09:50 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH v1 2/6] hw/loongarch: Support fw_cfg dma function
Date: Thu, 11 Aug 2022 11:09:44 +0800
Message-Id: <20220811030948.2994206-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220811030948.2994206-1-yangxiaojuan@loongson.cn>
References: <20220811030948.2994206-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxzyP9cvRi8RcNAA--.8789S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KryUuw17WrW7uFWxtryxKrg_yoW8CrW8pF
 y7ZFykJr48JrsxtrZaq345W3WxXrs7KrW29a12yw40ka47Xw1UZr1Iy39IyFyUX34kJFyF
 vFZ5K3y5X3W0qaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Support fw_cfg dma function for LoongArch virt machine.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
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


