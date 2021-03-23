Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60222345567
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:14:57 +0100 (CET)
Received: from localhost ([::1]:41456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWZM-000133-CF
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKc-0002P6-Dj
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:42 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKZ-0006u2-Ua
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464779; x=1648000779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oLkCz0lZT4A60erKaB4yvIxQdcUhOsonIWr+vFgAKrQ=;
 b=ccdkp3KciZnKGLRzMM4gcvaNNpVKOafM8kXez7XrN20apKRkAVe2fqDc
 lH1ed+3eErWu/+RwyXh4I8p1K6qkydFYDBFDbn3ItskRnp0upY4fcpaHl
 UvOKym59A2Gqsw8tvjZD7uYoFhRcFmyo4HXcFb/RawfRJd5AJbrYExZ3M
 wjVixxpkr5XJ8mqag4+cGvUS86yxhdEiDDDNwa4L3KENaRRdnIDZlxEAv
 Ah8ZbyvL92vIy4SJAJ/4qSiXdixKergecF2XDxM3h5sfVz3I4Uc/dipA5
 nsLYl9e4SZo/AHTgkBdNVD/F5c1EhMfpx886i2mnIN33PVVDx+uDRZi+4 w==;
IronPort-SDR: Tl+ISuT7fTo44ubY7lE9m1ALD76v9o69K33Iq+R2XVasiD0k5OakikQsQAdQtfSRvjSxJtrKc4
 7RT52ATlKejP3POuLQ2k+N5ClED7XAzQ9/F3oHr4qkHWQJkLkRVTs0BBSRVThrizgdfuVys05t
 geB5ulg7i0GyAkchTdAxsd9+i3HdsrFdm27gjzx+gaYr/2XbDGC3XbFO3fOva61JoXrAOYLjGH
 FtCajpZvFEyqI8aizY4pG217cxRm6L/yzIveREKfr34JgPVz7mm4xycoxTtf+ZmtS3KfUYwJFd
 NRc=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707639"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:36 +0800
IronPort-SDR: KCLPEcoMaaUqtoafi7HrM1VLd88hczBoRbgD6a8zMmPQveZpxL8hzyCTuR8kRVY4SGVUf5TK4A
 55SU+y0z0trCCe839fUhIs2nrCDUpw3bCthvNDSF6dJuIXXjpAnGm5qyDwgFBAHJA/ID54LhMZ
 bFZSUU3Lr8EP2a/jd0f6ARR84nCKGClWMzSJmBF9YL4GFYAMI6ErxTw9ZQtZ5jVHSTrUgLslFA
 u3V9iydI0+NHsiVXSakpfNp3wMR37eA8NRc50OD9VL0Sel+VZz5vTkkQ/vWRL4TgcAafs5Yypq
 AqxTB/3I9NPy8bc8EiVbpIFf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:44 -0700
IronPort-SDR: D+C2JqRPgd5kmn++R2GFVQV1gz6zMik0qatB420F74bIoQK9+eG8u9ewSi4sHOVavsl9Fq74Ot
 iQeKHmP96PCf5pVtxuJFHdzCa9QboYe1MxF2sQxDlO9hi3UTlDp1jOxOzpFI2mN0bYZOVivUBq
 7UE2zcM/vPQMmhCExKeFlJFly1B/zNHC7W3FJlFrG6H5348ncfww+J19kZv9gc8tI8Y68+2pGq
 7SOZRDy4GY+aRbsS4ulZ7t/pWAxGrvMj342ZhAJO1C+vF9cldWzJ1mtoYJmwbPnv0MZX52Nm2X
 5D0=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:35 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 09/16] hw/riscv: Add fw_cfg support to virt
Date: Mon, 22 Mar 2021 21:57:49 -0400
Message-Id: <20210323015756.3168650-10-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Asherah Connor <ashe@kivikakk.ee>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Asherah Connor <ashe@kivikakk.ee>

Provides fw_cfg for the virt machine on riscv.  This enables
using e.g.  ramfb later.

Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210318235041.17175-2-ashe@kivikakk.ee
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h |  2 ++
 hw/riscv/virt.c         | 30 ++++++++++++++++++++++++++++++
 hw/riscv/Kconfig        |  1 +
 3 files changed, 33 insertions(+)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index 632da52018..349fee1f89 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -40,6 +40,7 @@ struct RISCVVirtState {
     RISCVHartArrayState soc[VIRT_SOCKETS_MAX];
     DeviceState *plic[VIRT_SOCKETS_MAX];
     PFlashCFI01 *flash[2];
+    FWCfgState *fw_cfg;
 
     int fdt_size;
 };
@@ -53,6 +54,7 @@ enum {
     VIRT_PLIC,
     VIRT_UART0,
     VIRT_VIRTIO,
+    VIRT_FW_CFG,
     VIRT_FLASH,
     VIRT_DRAM,
     VIRT_PCIE_MMIO,
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 0b39101a5e..e96ec4cbbc 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -53,6 +53,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_PLIC] =        {  0xc000000, VIRT_PLIC_SIZE(VIRT_CPUS_MAX * 2) },
     [VIRT_UART0] =       { 0x10000000,         0x100 },
     [VIRT_VIRTIO] =      { 0x10001000,        0x1000 },
+    [VIRT_FW_CFG] =      { 0x10100000,          0x18 },
     [VIRT_FLASH] =       { 0x20000000,     0x4000000 },
     [VIRT_PCIE_ECAM] =   { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =   { 0x40000000,    0x40000000 },
@@ -507,6 +508,28 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
     return dev;
 }
 
+static FWCfgState *create_fw_cfg(const MachineState *mc)
+{
+    hwaddr base = virt_memmap[VIRT_FW_CFG].base;
+    hwaddr size = virt_memmap[VIRT_FW_CFG].size;
+    FWCfgState *fw_cfg;
+    char *nodename;
+
+    fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
+                                  &address_space_memory);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)mc->smp.cpus);
+
+    nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
+    qemu_fdt_add_subnode(mc->fdt, nodename);
+    qemu_fdt_setprop_string(mc->fdt, nodename,
+                            "compatible", "qemu,fw-cfg-mmio");
+    qemu_fdt_setprop_sized_cells(mc->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop(mc->fdt, nodename, "dma-coherent", NULL, 0);
+    g_free(nodename);
+    return fw_cfg;
+}
+
 static void virt_machine_init(MachineState *machine)
 {
     const MemMapEntry *memmap = virt_memmap;
@@ -688,6 +711,13 @@ static void virt_machine_init(MachineState *machine)
         start_addr = virt_memmap[VIRT_FLASH].base;
     }
 
+    /*
+     * Init fw_cfg.  Must be done before riscv_load_fdt, otherwise the device
+     * tree cannot be altered and we get FDT_ERR_NOSPACE.
+     */
+    s->fw_cfg = create_fw_cfg(machine);
+    rom_set_fw(s->fw_cfg);
+
     /* Compute the fdt load address in dram */
     fdt_load_addr = riscv_load_fdt(memmap[VIRT_DRAM].base,
                                    machine->ram_size, machine->fdt);
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index d139074b02..1de18cdcf1 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -33,6 +33,7 @@ config RISCV_VIRT
     select SIFIVE_PLIC
     select SIFIVE_TEST
     select VIRTIO_MMIO
+    select FW_CFG_DMA
 
 config SIFIVE_E
     bool
-- 
2.30.1


