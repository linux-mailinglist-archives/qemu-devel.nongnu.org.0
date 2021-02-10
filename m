Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0F2316361
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:13:15 +0100 (CET)
Received: from localhost ([::1]:49028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mUk-00021W-AP
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:13:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mS8-00006h-0W; Wed, 10 Feb 2021 05:10:33 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mS4-0002y3-QK; Wed, 10 Feb 2021 05:10:31 -0500
Received: by mail-ed1-x534.google.com with SMTP id l12so2240590edt.3;
 Wed, 10 Feb 2021 02:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wHun/rapgwJM6PolccCAv65od6gCIQ3ENKiLUbv1Qlk=;
 b=VaGIloK9Hr7iEFUQq0SK3XkMfKc61aWTk8fn3KtWn7MgtON1Q1uiWkVlBXP7Abkh7h
 A4YOlL3m+llswGr6b248MbqYDPTZKhAg03J9rGK/Cxd3RWVMzTD5KdTNnBdNkzanLGc1
 aPVdU2JmgWsf35AOf0B75KHD/Cy8a1QWnih8vuPbtSFhcRMYQaN9M1yHXbmPks3Tt2tb
 biF3u6UbrknTYuc957A6yuVUHCDGp/1xgfE9GNmr7yI77XQHwEH422dAssZJhSdctjwm
 3EsGRtlPbyP/PUy2pJOmWXs/JjdZj4WYGeOWq97BegIbZ2cpbLfsNINvn8w1EvdcjP28
 zsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wHun/rapgwJM6PolccCAv65od6gCIQ3ENKiLUbv1Qlk=;
 b=PB4QHK3Ih2zXL5TCMXDc7aS/Gbn4lzcaRKUvTtfXp9hM6yb9mF40Cisz7MlNeLJqK6
 Q4+JoMfwPK4wDtEO1La/rAF9Tef4DyfR69/p9Xw3S7QOywoy+bdNSPr5QbLiS/nIYS6H
 Kb8ASzt8O94IfN+Zn6kkHr/kKSCsS2tXefZuAs6YPnqsB3pVTBIA3iqw6oeC+7OD+qFk
 uQOWGhdrDbn4KAV73a+EAQW/vrjiZlB2zlS78xYdCv4DfvylLLQ/j67KPf4iqh3zxdN0
 tpYP8M0chClHo6DKywQjnzT8iUzk8YJPw0dlbrj9+rOuAdv7em7R009MWi93LNx4JfKB
 6vSA==
X-Gm-Message-State: AOAM530PpeES+xmS7J9QLoviPqtO9zVCFciW0bSN2XDRcRRPA3QHJjHi
 3wzroiFX/wsV44V9FwOP+7o=
X-Google-Smtp-Source: ABdhPJyncrB4jhkDecG/H1ky8m2corxahqGlzjDi+GJ+Na+qwgPGdtILQkyAlFhr5r79Xd4nYOv3hg==
X-Received: by 2002:a05:6402:17aa:: with SMTP id
 j10mr2503227edy.184.1612951827035; 
 Wed, 10 Feb 2021 02:10:27 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id y11sm785418ejd.72.2021.02.10.02.10.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 02:10:26 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 1/5] hw/dma: xlnx_csu_dma: Implement a basic XLNX CSU DMA
 model
Date: Wed, 10 Feb 2021 18:10:09 +0800
Message-Id: <1612951813-50542-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x534.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
crash. This is observed when testing VxWorks 7.

This adds a basic CSU DMA model and the implementation is based on
https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c

The model implements only the basic DMA transfer function of the DST
part, verified along with ZynqMP GQSPI model. Other advanced features
are not implemented.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- Implement DMA as a separate CSU DMA model

Changes in v2:
- Remove unconnected TYPE_STREAM_SINK link property
- Add a TYPE_MEMORY_REGION link property, to allow board codes to tell
  the device what its view of the world that it is doing DMA to is
- Replace cpu_physical_memory_write() with address_space_write()

 include/hw/dma/xlnx_csu_dma.h |  39 ++++
 hw/dma/xlnx_csu_dma.c         | 444 ++++++++++++++++++++++++++++++++++++++++++
 hw/dma/Kconfig                |   4 +
 hw/dma/meson.build            |   1 +
 4 files changed, 488 insertions(+)
 create mode 100644 include/hw/dma/xlnx_csu_dma.h
 create mode 100644 hw/dma/xlnx_csu_dma.c

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
new file mode 100644
index 0000000..bd87ee7
--- /dev/null
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -0,0 +1,39 @@
+/*
+ * ZynqMP Platform CSU Stream DMA emulation
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef XLNX_CSU_DMA_H
+#define XLNX_CSU_DMA_H
+
+#define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
+
+#define XLNX_CSU_DMA_REGS_MAX ((0x28 / 4) + 1)
+
+typedef struct XlnxCSUDMA {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+    MemoryRegion *dma_mr;
+    AddressSpace *dma_as;
+    qemu_irq irq;
+    StreamSink *tx;
+    uint32_t regs[XLNX_CSU_DMA_REGS_MAX];
+    RegisterInfo regs_info[XLNX_CSU_DMA_REGS_MAX];
+} XlnxCSUDMA;
+
+#define XLNX_CSU_DMA(obj) \
+     OBJECT_CHECK(XlnxCSUDMA, (obj), TYPE_XLNX_CSU_DMA)
+
+#endif
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
new file mode 100644
index 0000000..6f237ca
--- /dev/null
+++ b/hw/dma/xlnx_csu_dma.c
@@ -0,0 +1,444 @@
+/*
+ * ZynqMP Platform CSU Stream DMA emulation
+ *
+ * This implements only the basic DMA transfer function of the DST part,
+ * other advanced features are not implemented.
+ *
+ * This implementation is based on
+ * https://github.com/Xilinx/qemu/blob/master/hw/dma/csu_stream_dma.c
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "sysemu/dma.h"
+#include "hw/ptimer.h"
+#include "hw/stream.h"
+#include "hw/register.h"
+#include "hw/dma/xlnx_csu_dma.h"
+
+/*
+ * Ref: UG1087 (v1.7) February 8, 2019
+ * https://www.xilinx.com/html_docs/registers/ug1087/
+ * ug1087-zynq-ultrascale-registers.html
+ */
+REG32(ADDR, 0x0)
+    FIELD(ADDR, ADDR, 2, 30) /* wo */
+REG32(SIZE, 0x4)
+    FIELD(SIZE, SIZE, 2, 27) /* wo */
+REG32(STATUS, 0x8)
+    FIELD(STATUS, DONE_CNT, 13, 3) /* wtc */
+    FIELD(STATUS, BUSY, 0, 1) /* ro */
+REG32(CTRL, 0xc)
+    FIELD(CTRL, FIFO_LVL_HIT_THRESH, 25, 7) /* rw, reset: 0x40 */
+    FIELD(CTRL, APB_ERR_RESP, 24, 1) /* rw */
+    FIELD(CTRL, ENDIANNESS, 23, 1) /* rw */
+    FIELD(CTRL, AXI_BRST_TYPE, 22, 1) /* rw */
+    FIELD(CTRL, TIMEOUT_VAL, 10, 12) /* rw, reset: 0xFFE */
+    FIELD(CTRL, FIFO_THRESH, 2, 8) /* rw, reset: 0x80 */
+    FIELD(CTRL, PAUSE_STRM, 1, 1) /* rw */
+    FIELD(CTRL, PAUSE_MEM, 0, 1) /* rw */
+REG32(RES, 0x10)
+REG32(INT_STATUS, 0x14)
+    FIELD(INT_STATUS, FIFO_OVERFLOW, 7, 1) /* wtc */
+    FIELD(INT_STATUS, INVALID_APB, 6, 1) /* wtc */
+    FIELD(INT_STATUS, THRESH_HIT, 5, 1) /* wtc */
+    FIELD(INT_STATUS, TIMEOUT_MEM, 4, 1) /* wtc */
+    FIELD(INT_STATUS, TIMEOUT_STRM, 3, 1) /* wtc */
+    FIELD(INT_STATUS, AXI_BRESP_ERR, 2, 1) /* wtc */
+    FIELD(INT_STATUS, DONE, 1, 1) /* wtc */
+REG32(INT_ENABLE, 0x18)
+    FIELD(INT_ENABLE, FIFO_OVERFLOW, 7, 1) /* wtc */
+    FIELD(INT_ENABLE, INVALID_APB, 6, 1) /* wtc */
+    FIELD(INT_ENABLE, THRESH_HIT, 5, 1) /* wtc */
+    FIELD(INT_ENABLE, TIMEOUT_MEM, 4, 1) /* wtc */
+    FIELD(INT_ENABLE, TIMEOUT_STRM, 3, 1) /* wtc */
+    FIELD(INT_ENABLE, AXI_BRESP_ERR, 2, 1) /* wtc */
+    FIELD(INT_ENABLE, DONE, 1, 1) /* wtc */
+REG32(INT_DISABLE, 0x1c)
+    FIELD(INT_DISABLE, FIFO_OVERFLOW, 7, 1) /* wtc */
+    FIELD(INT_DISABLE, INVALID_APB, 6, 1) /* wtc */
+    FIELD(INT_DISABLE, THRESH_HIT, 5, 1) /* wtc */
+    FIELD(INT_DISABLE, TIMEOUT_MEM, 4, 1) /* wtc */
+    FIELD(INT_DISABLE, TIMEOUT_STRM, 3, 1) /* wtc */
+    FIELD(INT_DISABLE, AXI_BRESP_ERR, 2, 1) /* wtc */
+    FIELD(INT_DISABLE, DONE, 1, 1) /* wtc */
+REG32(INT_MASK, 0x20) /* reset: 0xFE */
+    FIELD(INT_MASK, FIFO_OVERFLOW, 7, 1) /* ro, reset: 0x1 */
+    FIELD(INT_MASK, INVALID_APB, 6, 1) /* ro, reset: 0x1 */
+    FIELD(INT_MASK, THRESH_HIT, 5, 1) /* ro, reset: 0x1 */
+    FIELD(INT_MASK, TIMEOUT_MEM, 4, 1) /* ro, reset: 0x1 */
+    FIELD(INT_MASK, TIMEOUT_STRM, 3, 1) /* ro, reset: 0x1 */
+    FIELD(INT_MASK, AXI_BRESP_ERR, 2, 1) /* ro, reset: 0x1 */
+    FIELD(INT_MASK, DONE, 1, 1) /* ro, reset: 0x1 */
+REG32(CTRL2, 0x24) /* reset: 0xFFF8 */
+    FIELD(CTRL2, ARCACHE, 24, 3) /* rw */
+    FIELD(CTRL2, TIMEOUT_EN, 22, 1) /* rw */
+    FIELD(CTRL2, TIMEOUT_PRE, 4, 12) /* rw, reset: 0xFFF */
+    FIELD(CTRL2, MAX_OUTS_CMDS, 0, 4) /* rw, reset: 0x8 */
+REG32(ADDR_MSB, 0x28)
+    FIELD(ADDR_MSB, ADDR_MSB, 0, 12) /* wo */
+
+#define CSU_DMA_INT_REGS_MASK 0xfe
+
+static uint64_t addr_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    return val & R_ADDR_ADDR_MASK;
+}
+
+static uint64_t size_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    return val & R_SIZE_SIZE_MASK;
+}
+
+static uint64_t status_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    return val & (R_STATUS_DONE_CNT_MASK | R_STATUS_BUSY_MASK);
+}
+
+static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    return val & R_ADDR_MSB_ADDR_MSB_MASK;
+}
+
+static void csu_dma_done(XlnxCSUDMA *s)
+{
+    int cnt;
+
+    s->regs[R_STATUS] &= ~R_STATUS_BUSY_MASK;
+    s->regs[R_INT_STATUS] |= R_INT_STATUS_DONE_MASK;
+
+    cnt = ARRAY_FIELD_EX32(s->regs, STATUS, DONE_CNT) + 1;
+    ARRAY_FIELD_DP32(s->regs, STATUS, DONE_CNT, cnt);
+}
+
+static void csu_dma_update_irq(XlnxCSUDMA *s)
+{
+    qemu_set_irq(s->irq, !!(s->regs[R_INT_STATUS] & ~s->regs[R_INT_MASK]));
+}
+
+static uint64_t int_enable_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
+    /*
+     * 1: Enable this interrupt field (The mask bit will be cleared to 0)
+     * 0: No effect
+     * Reads to this register will return 0
+     */
+    uint32_t ret = s->regs[R_INT_ENABLE] | (val & CSU_DMA_INT_REGS_MASK);
+
+    s->regs[R_INT_MASK] &= ~ret;
+
+    /* The field in int_disable should also be cleared */
+    s->regs[R_INT_DISABLE] &= ~ret;
+
+    return ret;
+}
+
+static void int_enable_post_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
+
+    csu_dma_update_irq(s);
+    return;
+}
+
+static void int_disable_post_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
+
+    csu_dma_update_irq(s);
+
+    /* Clear int_status when disable DMA interrupt */
+    s->regs[R_INT_STATUS] &= 0;
+    return;
+}
+
+static uint64_t int_disable_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
+    /*
+     * 1: Disable this interrupt field (The mask bit will be set to 1)
+     * 0: No effect
+     * Reads to this register will return 0
+     */
+    uint32_t ret = s->regs[R_INT_DISABLE] | (val & CSU_DMA_INT_REGS_MASK);
+
+    s->regs[R_INT_MASK] |= ret;
+
+    /* The field in int_enable should also be cleared */
+    s->regs[R_INT_ENABLE] &= ~ret;
+    return ret;
+}
+
+static uint64_t int_status_pre_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(reg->opaque);
+
+    /* Write 1: clear status bit */
+    return s->regs[R_INT_STATUS] & ~(val & CSU_DMA_INT_REGS_MASK);
+}
+
+static RegisterAccessInfo xlnx_csu_dma_regs_info[] = {
+    {   .name = "CSU_DMA_ADDR",
+        .addr = A_ADDR,
+        .pre_write = addr_pre_write
+    }, {
+        .name = "CSU_DMA_SIZE",
+        .addr = A_SIZE,
+        .pre_write = size_pre_write
+    }, {
+        .name = "CSU_DMA_STATUS",
+        .addr = A_STATUS,
+        .pre_write = status_pre_write,
+        .ro = R_STATUS_BUSY_MASK
+    }, {
+        .name = "CSU_DMA_CTRL",
+        .addr = A_CTRL,
+        .reset = 0x803FFA00
+    }, {
+        .name = "CSU_DMA_RES",
+         .addr = A_RES,
+    }, {
+        .name = "CSU_DMA_INT_STATUS",
+        .addr = A_INT_STATUS,
+        .pre_write = int_status_pre_write
+    }, {
+        .name = "CSU_DMA_INT_ENABLE",
+        .addr = A_INT_ENABLE,
+        .pre_write = int_enable_pre_write,
+        .post_write = int_enable_post_write
+    }, {
+        .name = "CSU_DMA_INT_DISABLE",
+        .addr = A_INT_DISABLE,
+        .pre_write = int_disable_pre_write,
+        .post_write = int_disable_post_write
+    }, {
+        .name = "CSU_DMA_INT_MASK",
+        .addr = A_INT_MASK,
+        .ro = ~0,
+        .reset = CSU_DMA_INT_REGS_MASK
+    }, {
+        .name = "CSU_DMA_CTRL2",
+        .addr = A_CTRL2,
+        .reset = 0x081BFFF8
+    }, {
+        .name = "CSU_DMA_ADDR_MSB",
+        .addr = A_ADDR_MSB,
+        .pre_write = addr_msb_pre_write
+    }
+};
+
+static uint32_t csu_dma_advance(XlnxCSUDMA *s, uint32_t len, hwaddr dst)
+{
+    uint32_t size = s->regs[R_SIZE];
+
+    size -= len;
+    size &= R_SIZE_SIZE_MASK;
+    dst += len;
+
+    s->regs[R_SIZE] = size;
+    s->regs[R_ADDR] = (uint32_t) dst;
+    s->regs[R_ADDR_MSB] = dst >> 32;
+
+    return size;
+}
+
+static size_t xlnx_csu_dma_stream_push(StreamSink *obj, uint8_t *buf,
+                                       size_t len, bool eop)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(obj);
+    hwaddr dst = (hwaddr)s->regs[R_ADDR_MSB] << 32 | s->regs[R_ADDR];
+    uint32_t size = s->regs[R_SIZE];
+    uint32_t mlen = MIN(size, len) & (~3); /* Size is word aligned */
+
+    if (size == 0 || len <= 0) {
+        return 0;
+    }
+
+    if (address_space_write(s->dma_as, dst, MEMTXATTRS_UNSPECIFIED, buf, mlen)
+        != MEMTX_OK) {
+        return 0;
+    }
+
+    size = csu_dma_advance(s, mlen, dst);
+
+    if (size == 0) {
+        csu_dma_done(s);
+        csu_dma_update_irq(s);
+    }
+
+   return mlen;
+}
+
+static bool xlnx_csu_dma_stream_can_push(StreamSink *obj,
+                                         StreamCanPushNotifyFn notify,
+                                         void *notify_opaque)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(obj);
+
+    return s->regs[R_SIZE] ? true : false;
+}
+
+static uint64_t xlnx_csu_dma_read(void *opaque, hwaddr offset, unsigned size)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(opaque);
+    RegisterInfo *r = &s->regs_info[offset / 4];
+    uint64_t ret = 0;
+
+    if (!r->data) {
+        char *path = object_get_canonical_path(OBJECT(s));
+        qemu_log("%s: Decode error: read from %" HWADDR_PRIx "\n",
+                 path, offset);
+        g_free(path);
+        return 0;
+    }
+
+    ret = register_read(r, ~0, NULL, false);
+    return ret;
+}
+
+static void xlnx_csu_dma_write(void *opaque, hwaddr offset,
+                               uint64_t value, unsigned size)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(opaque);
+    uint32_t reg = offset / 4;
+    RegisterInfo *r = &s->regs_info[reg];
+
+    if (!r->data) {
+        char *path = object_get_canonical_path(OBJECT(s));
+        qemu_log("%s: Decode error: read from %" HWADDR_PRIx "\n",
+                 path, offset);
+        g_free(path);
+        return;
+    }
+
+    register_write(r, value, ~0, NULL, false);
+}
+
+static const MemoryRegionOps xlnx_csu_dma_ops = {
+    .read = xlnx_csu_dma_read,
+    .write = xlnx_csu_dma_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    }
+};
+
+static void xlnx_csu_dma_reset(DeviceState *dev)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(dev);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+}
+
+static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(dev);
+    unsigned int i = 0;
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &xlnx_csu_dma_ops, s,
+                          TYPE_XLNX_CSU_DMA, XLNX_CSU_DMA_REGS_MAX * 4);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+
+    for (i = 0; i < ARRAY_SIZE(xlnx_csu_dma_regs_info); i++) {
+        RegisterInfo *r = &s->regs_info[xlnx_csu_dma_regs_info[i].addr / 4];
+        r->data = (uint8_t *)&s->regs[xlnx_csu_dma_regs_info[i].addr / 4];
+        r->data_size = sizeof(uint32_t);
+        r->access = (const RegisterAccessInfo *)&xlnx_csu_dma_regs_info[i];
+        r->opaque = s;
+    }
+
+    if (s->dma_mr) {
+        s->dma_as = g_malloc0(sizeof(AddressSpace));
+        address_space_init(s->dma_as, s->dma_mr, NULL);
+    } else {
+        s->dma_as = &address_space_memory;
+    }
+}
+
+static void xlnx_csu_dma_init(Object *obj)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(obj);
+
+    object_property_add_link(obj, "stream-connected-dma", TYPE_STREAM_SINK,
+                             (Object **)&s->tx,
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_STRONG);
+    object_property_add_link(obj, "xlnx-csu-dma-mr", TYPE_MEMORY_REGION,
+                             (Object **)&s->dma_mr,
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_STRONG);
+}
+
+static const VMStateDescription vmstate_xlnx_csu_dma = {
+    .name = TYPE_XLNX_CSU_DMA,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .minimum_version_id_old = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxCSUDMA, XLNX_CSU_DMA_REGS_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
+
+    dc->reset = xlnx_csu_dma_reset;
+    dc->realize = xlnx_csu_dma_realize;
+    dc->vmsd = &vmstate_xlnx_csu_dma;
+
+    ssc->push = ((StreamSinkClass *)data)->push;
+    ssc->can_push = ((StreamSinkClass *)data)->can_push;
+}
+
+static StreamSinkClass xlnx_csu_dma_stream_class = {
+    .push = xlnx_csu_dma_stream_push,
+    .can_push = xlnx_csu_dma_stream_can_push,
+};
+
+static const TypeInfo xlnx_csu_dma_info = {
+    .name          = TYPE_XLNX_CSU_DMA,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XlnxCSUDMA),
+    .class_init    = xlnx_csu_dma_class_init,
+    .class_data    = &xlnx_csu_dma_stream_class,
+    .instance_init = xlnx_csu_dma_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_STREAM_SINK },
+        { }
+    }
+};
+
+static void xlnx_csu_dma_register_types(void)
+{
+    type_register_static(&xlnx_csu_dma_info);
+}
+
+type_init(xlnx_csu_dma_register_types)
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index 5d6be1a..98fbb1b 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -26,3 +26,7 @@ config STP2000
 
 config SIFIVE_PDMA
     bool
+
+config XLNX_CSU_DMA
+    bool
+    select REGISTER
diff --git a/hw/dma/meson.build b/hw/dma/meson.build
index 47b4a7c..5c78a4e 100644
--- a/hw/dma/meson.build
+++ b/hw/dma/meson.build
@@ -14,3 +14,4 @@ softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dma.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
 softmmu_ss.add(when: 'CONFIG_SIFIVE_PDMA', if_true: files('sifive_pdma.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_CSU_DMA', if_true: files('xlnx_csu_dma.c'))
-- 
2.7.4


