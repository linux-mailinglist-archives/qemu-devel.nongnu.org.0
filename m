Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2C258552
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 03:48:59 +0200 (CEST)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCvPu-0008UC-MM
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 21:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvIB-0004t8-T7; Mon, 31 Aug 2020 21:40:59 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kCvI9-0005bm-Ag; Mon, 31 Aug 2020 21:40:59 -0400
Received: by mail-pf1-x442.google.com with SMTP id g207so1748159pfb.1;
 Mon, 31 Aug 2020 18:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bXIVfvpKQPtNAPe1+jrOvtUCUMq1RSWy8OrFZDkFxw4=;
 b=iPJkyfhdQwX3FFf1dOlgZxktgJeD4n9YrP4S45fbu9DGh22JhRCyvUbozZrbTpJx2I
 DJsIHVzrVR3AnitcffvxNu12ySoaFs2Tk6U0pkOI+d+RJ87EP3DfC3JjyYr6W04SPiGa
 ih0Lv4v29IvRWbR+rHAP1Lq7Qx6X8mIDA+WShx4hwLimRhR5gySBxjaW7F7IGj0WlmB5
 V3zMS42P2TqjUkq6WCeB6M6FX7kXfpj0/UedlofpvhWsBYvnwvrk61mNKHbmKmoeVz5z
 xL9w3jZ4Ryrg1k7r/Kot7UKbXJ9GbDDTHbbp5NzYGqtLo03OS85KMhtvYpfcaAKvFOoa
 y83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bXIVfvpKQPtNAPe1+jrOvtUCUMq1RSWy8OrFZDkFxw4=;
 b=IdGsUmCgd/L4/JTHqqKJtUGWF91RQ0renHTO9mvEGH6vs74eDIHML6uf1/Wk1BCRBO
 Me0IF9+lAN6z+Z6Sy492094GAgZvhC8VQ1R0kZGObNNz07/iMqKE0JExF2nSp6MMAQBh
 Dx24BBNg4brA7meAs52B3Hofi08gd3+olf7zZzIv6cKlaIuCdcsMCxOda/Z0gMSnv2Sn
 6tAgeDMbOKFk2bHPXzZBsNfQ9LfwteGR92obGiDoo8+kvNXFP2+/MH1aDmai9Cs6o2Vr
 Jgh/HlQY4JEkLNHmHir/xoCFUEO7GpF7uNA8ea9e4QFUgnLmuL9q8e2EpWC50+lUjibC
 Ifdw==
X-Gm-Message-State: AOAM53371VMdLwZTfgXuSGeskI+nTqu+6XDKu14z6ojkRbQJwyPiJh2N
 RPGal8f/XAE8oQ/t5WczITM=
X-Google-Smtp-Source: ABdhPJyyjcnY2Znhx75j5+ddbnlUOirn4tQYx6Vd60/o3ijulw2zvNmOUd2zN3zkL4hMbfehq4D1ZA==
X-Received: by 2002:a63:4664:: with SMTP id v36mr3377362pgk.194.1598924455654; 
 Mon, 31 Aug 2020 18:40:55 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-146-144.windriver.com.
 [147.11.146.144])
 by smtp.gmail.com with ESMTPSA id l13sm8887520pgq.33.2020.08.31.18.40.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 31 Aug 2020 18:40:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 09/16] hw/dma: Add SiFive platform DMA controller emulation
Date: Tue,  1 Sep 2020 09:39:04 +0800
Message-Id: <1598924352-89526-10-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
References: <1598924352-89526-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Microchip PolarFire SoC integrates a DMA engine that supports:
* Independent concurrent DMA transfers using 4 DMA channels
* Generation of interrupts on various conditions during execution
which is actually an IP reused from the SiFive FU540 chip.

This creates a model to support both polling and interrupt modes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- change MCHP_PFSOC_DMA to SIFIVE_PDMA

Changes in v2:
- change to update hw/dma/meson.build
- rename the file names to sifive_pdma.[c|h]
- update irq number to 8 per the SiFive FU540 manual
- fix the register offset for channel 1/2/3 in the read/write ops

 include/hw/dma/sifive_pdma.h |  57 ++++++++
 hw/dma/sifive_pdma.c         | 313 +++++++++++++++++++++++++++++++++++++++++++
 hw/dma/Kconfig               |   3 +
 hw/dma/meson.build           |   1 +
 4 files changed, 374 insertions(+)
 create mode 100644 include/hw/dma/sifive_pdma.h
 create mode 100644 hw/dma/sifive_pdma.c

diff --git a/include/hw/dma/sifive_pdma.h b/include/hw/dma/sifive_pdma.h
new file mode 100644
index 0000000..e319bbd
--- /dev/null
+++ b/include/hw/dma/sifive_pdma.h
@@ -0,0 +1,57 @@
+/*
+ * SiFive Platform DMA emulation
+ *
+ * Copyright (c) 2020 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef SIFIVE_PDMA_H
+#define SIFIVE_PDMA_H
+
+struct sifive_pdma_chan {
+    uint32_t control;
+    uint32_t next_config;
+    uint64_t next_bytes;
+    uint64_t next_dst;
+    uint64_t next_src;
+    uint32_t exec_config;
+    uint64_t exec_bytes;
+    uint64_t exec_dst;
+    uint64_t exec_src;
+    int state;
+};
+
+#define SIFIVE_PDMA_CHANS           4
+#define SIFIVE_PDMA_IRQS            (SIFIVE_PDMA_CHANS * 2)
+#define SIFIVE_PDMA_REG_SIZE        0x100000
+#define SIFIVE_PDMA_CHAN_NO(reg)    ((reg & (SIFIVE_PDMA_REG_SIZE - 1)) >> 12)
+
+typedef struct SiFivePDMAState {
+    SysBusDevice parent;
+    MemoryRegion iomem;
+    qemu_irq irq[SIFIVE_PDMA_IRQS];
+
+    struct sifive_pdma_chan chan[SIFIVE_PDMA_CHANS];
+} SiFivePDMAState;
+
+#define TYPE_SIFIVE_PDMA    "sifive.pdma"
+
+#define SIFIVE_PDMA(obj)    \
+    OBJECT_CHECK(SiFivePDMAState, (obj), TYPE_SIFIVE_PDMA)
+
+#endif /* SIFIVE_PDMA_H */
diff --git a/hw/dma/sifive_pdma.c b/hw/dma/sifive_pdma.c
new file mode 100644
index 0000000..e1f6fed
--- /dev/null
+++ b/hw/dma/sifive_pdma.c
@@ -0,0 +1,313 @@
+/*
+ * SiFive Platform DMA emulation
+ *
+ * Copyright (c) 2020 Wind River Systems, Inc.
+ *
+ * Author:
+ *   Bin Meng <bin.meng@windriver.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "sysemu/dma.h"
+#include "hw/dma/sifive_pdma.h"
+
+#define DMA_CONTROL         0x000
+#define   CONTROL_CLAIM     BIT(0)
+#define   CONTROL_RUN       BIT(1)
+#define   CONTROL_DONE_IE   BIT(14)
+#define   CONTROL_ERR_IE    BIT(15)
+#define   CONTROL_DONE      BIT(30)
+#define   CONTROL_ERR       BIT(31)
+
+#define DMA_NEXT_CONFIG     0x004
+#define   CONFIG_REPEAT     BIT(2)
+#define   CONFIG_ORDER      BIT(3)
+#define   CONFIG_WRSZ_SHIFT 24
+#define   CONFIG_RDSZ_SHIFT 28
+#define   CONFIG_SZ_MASK    0xf
+
+#define DMA_NEXT_BYTES      0x008
+#define DMA_NEXT_DST        0x010
+#define DMA_NEXT_SRC        0x018
+#define DMA_EXEC_CONFIG     0x104
+#define DMA_EXEC_BYTES      0x108
+#define DMA_EXEC_DST        0x110
+#define DMA_EXEC_SRC        0x118
+
+enum dma_chan_state {
+    DMA_CHAN_STATE_IDLE,
+    DMA_CHAN_STATE_STARTED,
+    DMA_CHAN_STATE_ERROR,
+    DMA_CHAN_STATE_DONE
+};
+
+static void sifive_pdma_run(SiFivePDMAState *s, int ch)
+{
+    uint64_t bytes = s->chan[ch].next_bytes;
+    uint64_t dst = s->chan[ch].next_dst;
+    uint64_t src = s->chan[ch].next_src;
+    uint32_t config = s->chan[ch].next_config;
+    int wsize, rsize, size;
+    uint8_t buf[64];
+    int n;
+
+    /* do nothing if bytes to transfer is zero */
+    if (!bytes) {
+        goto error;
+    }
+
+    /*
+     * The manual does not describe how the hardware behaviors when
+     * config.wsize and config.rsize are given different values.
+     * A common case is memory to memory DMA, and in this case they
+     * are normally the same. Abort if this expectation fails.
+     */
+    wsize = (config >> CONFIG_WRSZ_SHIFT) & CONFIG_SZ_MASK;
+    rsize = (config >> CONFIG_RDSZ_SHIFT) & CONFIG_SZ_MASK;
+    if (wsize != rsize) {
+        goto error;
+    }
+
+    /*
+     * Calculate the transaction size
+     *
+     * size field is base 2 logarithm of DMA transaction size,
+     * but there is an upper limit of 64 bytes per transaction.
+     */
+    size = wsize;
+    if (size > 6) {
+        size = 6;
+    }
+    size = 1 << size;
+
+    /* the bytes to transfer should be multiple of transaction size */
+    if (bytes % size) {
+        goto error;
+    }
+
+    /* indicate a DMA transfer is started */
+    s->chan[ch].state = DMA_CHAN_STATE_STARTED;
+    s->chan[ch].control &= ~CONTROL_DONE;
+    s->chan[ch].control &= ~CONTROL_ERR;
+
+    /* load the next_ registers into their exec_ counterparts */
+    s->chan[ch].exec_config = config;
+    s->chan[ch].exec_bytes = bytes;
+    s->chan[ch].exec_dst = dst;
+    s->chan[ch].exec_src = src;
+
+    for (n = 0; n < bytes / size; n++) {
+        cpu_physical_memory_read(s->chan[ch].exec_src, buf, size);
+        cpu_physical_memory_write(s->chan[ch].exec_dst, buf, size);
+        s->chan[ch].exec_src += size;
+        s->chan[ch].exec_dst += size;
+        s->chan[ch].exec_bytes -= size;
+    }
+
+    /* indicate a DMA transfer is done */
+    s->chan[ch].state = DMA_CHAN_STATE_DONE;
+    s->chan[ch].control &= ~CONTROL_RUN;
+    s->chan[ch].control |= CONTROL_DONE;
+
+    /* reload exec_ registers if repeat is required */
+    if (s->chan[ch].next_config & CONFIG_REPEAT) {
+        s->chan[ch].exec_bytes = bytes;
+        s->chan[ch].exec_dst = dst;
+        s->chan[ch].exec_src = src;
+    }
+
+    return;
+
+error:
+    s->chan[ch].state = DMA_CHAN_STATE_ERROR;
+    s->chan[ch].control |= CONTROL_ERR;
+    return;
+}
+
+static inline void sifive_pdma_update_irq(SiFivePDMAState *s, int ch)
+{
+    bool done_ie, err_ie;
+
+    done_ie = !!(s->chan[ch].control & CONTROL_DONE_IE);
+    err_ie = !!(s->chan[ch].control & CONTROL_ERR_IE);
+
+    if (done_ie && (s->chan[ch].control & CONTROL_DONE)) {
+        qemu_irq_raise(s->irq[ch * 2]);
+    } else {
+        qemu_irq_lower(s->irq[ch * 2]);
+    }
+
+    if (err_ie && (s->chan[ch].control & CONTROL_ERR)) {
+        qemu_irq_raise(s->irq[ch * 2 + 1]);
+    } else {
+        qemu_irq_lower(s->irq[ch * 2 + 1]);
+    }
+
+    s->chan[ch].state = DMA_CHAN_STATE_IDLE;
+}
+
+static uint64_t sifive_pdma_read(void *opaque, hwaddr offset, unsigned size)
+{
+    SiFivePDMAState *s = opaque;
+    int ch = SIFIVE_PDMA_CHAN_NO(offset);
+    uint64_t val = 0;
+
+    if (ch >= SIFIVE_PDMA_CHANS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
+                      __func__, ch);
+        return 0;
+    }
+
+    offset &= 0xfff;
+    switch (offset) {
+    case DMA_CONTROL:
+        val = s->chan[ch].control;
+        break;
+    case DMA_NEXT_CONFIG:
+        val = s->chan[ch].next_config;
+        break;
+    case DMA_NEXT_BYTES:
+        val = s->chan[ch].next_bytes;
+        break;
+    case DMA_NEXT_DST:
+        val = s->chan[ch].next_dst;
+        break;
+    case DMA_NEXT_SRC:
+        val = s->chan[ch].next_src;
+        break;
+    case DMA_EXEC_CONFIG:
+        val = s->chan[ch].exec_config;
+        break;
+    case DMA_EXEC_BYTES:
+        val = s->chan[ch].exec_bytes;
+        break;
+    case DMA_EXEC_DST:
+        val = s->chan[ch].exec_dst;
+        break;
+    case DMA_EXEC_SRC:
+        val = s->chan[ch].exec_src;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
+        break;
+    }
+
+    return val;
+}
+
+static void sifive_pdma_write(void *opaque, hwaddr offset,
+                              uint64_t value, unsigned size)
+{
+    SiFivePDMAState *s = opaque;
+    int ch = SIFIVE_PDMA_CHAN_NO(offset);
+
+    if (ch >= SIFIVE_PDMA_CHANS) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid channel no %d\n",
+                      __func__, ch);
+        return;
+    }
+
+    offset &= 0xfff;
+    switch (offset) {
+    case DMA_CONTROL:
+        s->chan[ch].control = value;
+
+        if (value & CONTROL_RUN) {
+            sifive_pdma_run(s, ch);
+        }
+
+        sifive_pdma_update_irq(s, ch);
+        break;
+    case DMA_NEXT_CONFIG:
+        s->chan[ch].next_config = value;
+        break;
+    case DMA_NEXT_BYTES:
+        s->chan[ch].next_bytes = value;
+        break;
+    case DMA_NEXT_DST:
+        s->chan[ch].next_dst = value;
+        break;
+    case DMA_NEXT_SRC:
+        s->chan[ch].next_src = value;
+        break;
+    case DMA_EXEC_CONFIG:
+    case DMA_EXEC_BYTES:
+    case DMA_EXEC_DST:
+    case DMA_EXEC_SRC:
+        /* these are read-only registers */
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n",
+                      __func__, offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps sifive_pdma_ops = {
+    .read = sifive_pdma_read,
+    .write = sifive_pdma_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    /* there are 32-bit and 64-bit wide registers */
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    }
+};
+
+static void sifive_pdma_realize(DeviceState *dev, Error **errp)
+{
+    SiFivePDMAState *s = SIFIVE_PDMA(dev);
+    int i;
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &sifive_pdma_ops, s,
+                          TYPE_SIFIVE_PDMA, SIFIVE_PDMA_REG_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
+
+    for (i = 0; i < SIFIVE_PDMA_IRQS; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[i]);
+    }
+}
+
+static void sifive_pdma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "SiFive Platform DMA controller";
+    dc->realize = sifive_pdma_realize;
+}
+
+static const TypeInfo sifive_pdma_info = {
+    .name          = TYPE_SIFIVE_PDMA,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(SiFivePDMAState),
+    .class_init    = sifive_pdma_class_init,
+};
+
+static void sifive_pdma_register_types(void)
+{
+    type_register_static(&sifive_pdma_info);
+}
+
+type_init(sifive_pdma_register_types)
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index 5c61b67..d67492d 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -20,3 +20,6 @@ config ZYNQ_DEVCFG
 
 config STP2000
     bool
+
+config SIFIVE_PDMA
+    bool
diff --git a/hw/dma/meson.build b/hw/dma/meson.build
index ff5bb37..b991d76 100644
--- a/hw/dma/meson.build
+++ b/hw/dma/meson.build
@@ -13,3 +13,4 @@ softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zdma.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dma.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
+softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
-- 
2.7.4


