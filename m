Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F3311DDD
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 15:41:44 +0100 (CET)
Received: from localhost ([::1]:34594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8OmN-0006G8-Nq
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 09:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8OjZ-0003bA-Sf; Sat, 06 Feb 2021 09:38:50 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l8OjX-0006fB-VY; Sat, 06 Feb 2021 09:38:49 -0500
Received: by mail-ej1-x62c.google.com with SMTP id w1so17536929ejf.11;
 Sat, 06 Feb 2021 06:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5nWfp1MvPZNDxou8htABUKGWG0b4CT3wGAY1PMDBpnM=;
 b=GyIHWA3HdhoNqxQ2qhAyMPkSVnQel7kTYuS681PuJKRA/X34AV/akgAhWd6fy+aAhZ
 iSVCn398KuQ3RNezBJNyqlRLfAVSXS547Ly1flPeFnT4hm+269QLxfdwcNNdpt8asGV/
 TnWx+VupVHKkTtjDNnUchp8cKQIKGd3ME6gFxMzjeG+RVzRg0xrf2Y1TyBg2YPZTGvHm
 7yFg6/QYFrZk1A0XJF1T6kFyTFMPPf9wCS9SoyxR/Kc7dEdEB8x0hlaDuc4A1m1aGhe9
 JLWzCWp4DXk2+aOqbnTc0ln5HsF+tNaGZ7FnSTQi+pXUoRIPYQMWm/4NWqhr57GcMBd2
 srsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5nWfp1MvPZNDxou8htABUKGWG0b4CT3wGAY1PMDBpnM=;
 b=mhjif94FFYCodEnsmSy8RlBzxizJZgm3k0G19kLVU6tWBRXjouvWFl0xfeduDE2RMP
 iOfpDur6exFToUYzo2SdGVsavmcqj47h3yZ3Fxj16vED4xfUHsNG23G4ycXwjNoMqMD9
 3Nk8yWYAukUFnr3kLV/jCapeviVFONYJT3l+KXnVGZ12guVbty+pIQDe6gTtvnI481+2
 1ULusAitTUzXJF6TWZSZMliQLVrgCHa86c33QwRBFXFGKHo0LrFTjWAUA+nYHQmqTftU
 Neht1HeLy61w/vB2xiXklf5ZsABl0CAOOWyhaI7qCnY/i+RXUailydRZXMmyOTD1e4ZI
 PTNQ==
X-Gm-Message-State: AOAM530/xbPPvCm7yMf7jdddIgzLyFDmPjFBO6yP3Y6XA9+w5C88vazZ
 /ET47Lw3rMd0UJa6/o7LLL4=
X-Google-Smtp-Source: ABdhPJxaKfpXCdmcdpLKyIkLJdPTSuJvXNq0M0TodnhAdzkQMynQRzmVyyMk31ktJrihKQT5kybb6g==
X-Received: by 2002:a17:907:28c9:: with SMTP id
 en9mr9209253ejc.314.1612622326147; 
 Sat, 06 Feb 2021 06:38:46 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id g22sm5394513ejw.31.2021.02.06.06.38.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Feb 2021 06:38:45 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/ssi: xilinx_spips: Implement basic QSPI DMA support
Date: Sat,  6 Feb 2021 22:38:14 +0800
Message-Id: <1612622294-37297-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
References: <1612622294-37297-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

ZynqMP QSPI supports SPI transfer using DMA mode, but currently this
is unimplemented. When QSPI is programmed to use DMA mode, QEMU will
crash. This is observed when testing VxWorks 7.

Add a basic implementation of QSPI DMA functionality.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

 hw/ssi/xilinx_spips.c | 188 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 169 insertions(+), 19 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8a0cc22..57ab9a3 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -195,12 +195,72 @@
 #define R_GQSPI_MOD_ID        (0x1fc / 4)
 #define R_GQSPI_MOD_ID_RESET  (0x10a0000)
 
-#define R_QSPIDMA_DST_CTRL         (0x80c / 4)
-#define R_QSPIDMA_DST_CTRL_RESET   (0x803ffa00)
-#define R_QSPIDMA_DST_I_MASK       (0x820 / 4)
-#define R_QSPIDMA_DST_I_MASK_RESET (0xfe)
-#define R_QSPIDMA_DST_CTRL2        (0x824 / 4)
-#define R_QSPIDMA_DST_CTRL2_RESET  (0x081bfff8)
+#define GQSPI_CNFG_MODE_EN_IO  (0)
+#define GQSPI_CNFG_MODE_EN_DMA (2)
+
+/*
+ * Ref: UG1087 (v1.7) February 8, 2019
+ * https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
+ */
+REG32(GQSPI_DMA_ADDR, 0x800)
+    FIELD(GQSPI_DMA_ADDR,   ADDR, 2, 30)
+REG32(GQSPI_DMA_SIZE, 0x804)
+    FIELD(GQSPI_DMA_SIZE,   SIZE, 2, 27)
+REG32(GQSPI_DMA_STS, 0x808)
+    FIELD(GQSPI_DMA_STS, DONE_CNT, 13, 3)
+    FIELD(GQSPI_DMA_STS, BUSY, 0, 1)
+REG32(GQSPI_DMA_CTRL, 0x80c)
+    FIELD(GQSPI_DMA_CTRL,   FIFO_LVL_HIT_THRESH, 25, 7)
+    FIELD(GQSPI_DMA_CTRL,   APB_ERR_RESP, 24, 1)
+    FIELD(GQSPI_DMA_CTRL,   ENDIANNESS, 23, 1)
+    FIELD(GQSPI_DMA_CTRL,   AXI_BRST_TYPE, 22, 1)
+    FIELD(GQSPI_DMA_CTRL,   TIMEOUT_VAL, 10, 12)
+    FIELD(GQSPI_DMA_CTRL,   FIFO_THRESH, 2, 8)
+    FIELD(GQSPI_DMA_CTRL,   PAUSE_STRM, 1, 1)
+    FIELD(GQSPI_DMA_CTRL,   PAUSE_MEM, 0, 1)
+REG32(GQSPI_DMA_I_STS, 0x814)
+    FIELD(GQSPI_DMA_I_STS, FIFO_OVERFLOW, 7, 1)
+    FIELD(GQSPI_DMA_I_STS, INVALID_APB, 6, 1)
+    FIELD(GQSPI_DMA_I_STS, THRESH_HIT, 5, 1)
+    FIELD(GQSPI_DMA_I_STS, TIMEOUT_MEM, 4, 1)
+    FIELD(GQSPI_DMA_I_STS, TIMEOUT_STRM, 3, 1)
+    FIELD(GQSPI_DMA_I_STS, AXI_BRESP_ERR, 2, 1)
+    FIELD(GQSPI_DMA_I_STS, DONE, 1, 1)
+REG32(GQSPI_DMA_I_EN, 0x818)
+    FIELD(GQSPI_DMA_I_EN, FIFO_OVERFLOW, 7, 1)
+    FIELD(GQSPI_DMA_I_EN, INVALID_APB, 6, 1)
+    FIELD(GQSPI_DMA_I_EN, THRESH_HIT, 5, 1)
+    FIELD(GQSPI_DMA_I_EN, TIMEOUT_MEM, 4, 1)
+    FIELD(GQSPI_DMA_I_EN, TIMEOUT_STRM, 3, 1)
+    FIELD(GQSPI_DMA_I_EN, AXI_BRESP_ERR, 2, 1)
+    FIELD(GQSPI_DMA_I_EN, DONE, 1, 1)
+REG32(GQSPI_DMA_I_DIS, 0x81c)
+    FIELD(GQSPI_DMA_I_DIS, FIFO_OVERFLOW, 7, 1)
+    FIELD(GQSPI_DMA_I_DIS, INVALID_APB, 6, 1)
+    FIELD(GQSPI_DMA_I_DIS, THRESH_HIT, 5, 1)
+    FIELD(GQSPI_DMA_I_DIS, TIMEOUT_MEM, 4, 1)
+    FIELD(GQSPI_DMA_I_DIS, TIMEOUT_STRM, 3, 1)
+    FIELD(GQSPI_DMA_I_DIS, AXI_BRESP_ERR, 2, 1)
+    FIELD(GQSPI_DMA_I_DIS, DONE, 1, 1)
+REG32(GQSPI_DMA_I_MASK, 0x820)
+    FIELD(GQSPI_DMA_I_MASK, FIFO_OVERFLOW, 7, 1)
+    FIELD(GQSPI_DMA_I_MASK, INVALID_APB, 6, 1)
+    FIELD(GQSPI_DMA_I_MASK, THRESH_HIT, 5, 1)
+    FIELD(GQSPI_DMA_I_MASK, TIMEOUT_MEM, 4, 1)
+    FIELD(GQSPI_DMA_I_MASK, TIMEOUT_STRM, 3, 1)
+    FIELD(GQSPI_DMA_I_MASK, AXI_BRESP_ERR, 2, 1)
+    FIELD(GQSPI_DMA_I_MASK, DONE, 1, 1)
+REG32(GQSPI_DMA_CTRL2, 0x824)
+    FIELD(GQSPI_DMA_CTRL2, ARCACHE, 24, 3)
+    FIELD(GQSPI_DMA_CTRL2, TIMEOUT_EN, 22, 1)
+    FIELD(GQSPI_DMA_CTRL2, TIMEOUT_PRE, 4, 12)
+    FIELD(GQSPI_DMA_CTRL2, MAX_OUTS_CMDS, 0, 4)
+REG32(GQSPI_DMA_ADDR_MSB, 0x828)
+    FIELD(GQSPI_DMA_ADDR_MSB, ADDR_MSB, 0, 12)
+
+#define R_GQSPI_DMA_CTRL_RESET    (0x803ffa00)
+#define R_GQSPI_DMA_INT_MASK      (0xfe)
+#define R_GQSPI_DMA_CTRL2_RESET   (0x081bfff8)
 
 /* size of TXRX FIFOs */
 #define RXFF_A          (128)
@@ -341,6 +401,7 @@ static void xilinx_spips_update_ixr(XilinxSPIPS *s)
 static void xlnx_zynqmp_qspips_update_ixr(XlnxZynqMPQSPIPS *s)
 {
     uint32_t gqspi_int;
+    uint32_t mode;
     int new_irqline;
 
     s->regs[R_GQSPI_ISR] &= ~IXR_SELF_CLEAR;
@@ -359,13 +420,20 @@ static void xlnx_zynqmp_qspips_update_ixr(XlnxZynqMPQSPIPS *s)
                                     IXR_TX_FIFO_NOT_FULL : 0);
 
     /* GQSPI Interrupt Trigger Status */
-    gqspi_int = (~s->regs[R_GQSPI_IMR]) & s->regs[R_GQSPI_ISR] & GQSPI_IXR_MASK;
-    new_irqline = !!(gqspi_int & IXR_ALL);
-
-    /* drive external interrupt pin */
-    if (new_irqline != s->gqspi_irqline) {
-        s->gqspi_irqline = new_irqline;
-        qemu_set_irq(XILINX_SPIPS(s)->irq, s->gqspi_irqline);
+    mode = ARRAY_FIELD_EX32(s->regs, GQSPI_CNFG, MODE_EN);
+    if (mode == GQSPI_CNFG_MODE_EN_IO) {
+        gqspi_int = (~s->regs[R_GQSPI_IMR]) & s->regs[R_GQSPI_ISR] \
+                                            & GQSPI_IXR_MASK;
+        new_irqline = !!(gqspi_int & IXR_ALL);
+
+        /* drive external interrupt pin */
+        if (new_irqline != s->gqspi_irqline) {
+            s->gqspi_irqline = new_irqline;
+            qemu_set_irq(XILINX_SPIPS(s)->irq, s->gqspi_irqline);
+        }
+    } else if (mode == GQSPI_CNFG_MODE_EN_DMA) {
+        new_irqline = s->regs[R_GQSPI_DMA_I_STS] & ~s->regs[R_GQSPI_DMA_I_MASK];
+        qemu_set_irq(XILINX_SPIPS(s)->irq, !!new_irqline);
     }
 }
 
@@ -417,9 +485,9 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
     s->regs[R_GQSPI_GPIO] = 1;
     s->regs[R_GQSPI_LPBK_DLY_ADJ] = R_GQSPI_LPBK_DLY_ADJ_RESET;
     s->regs[R_GQSPI_MOD_ID] = R_GQSPI_MOD_ID_RESET;
-    s->regs[R_QSPIDMA_DST_CTRL] = R_QSPIDMA_DST_CTRL_RESET;
-    s->regs[R_QSPIDMA_DST_I_MASK] = R_QSPIDMA_DST_I_MASK_RESET;
-    s->regs[R_QSPIDMA_DST_CTRL2] = R_QSPIDMA_DST_CTRL2_RESET;
+    s->regs[R_GQSPI_DMA_CTRL] = R_GQSPI_DMA_CTRL_RESET;
+    s->regs[R_GQSPI_DMA_I_MASK] = R_GQSPI_DMA_INT_MASK;
+    s->regs[R_GQSPI_DMA_CTRL2] = R_GQSPI_DMA_CTRL2_RESET;
     s->man_start_com_g = false;
     s->gqspi_irqline = 0;
     xlnx_zynqmp_qspips_update_ixr(s);
@@ -843,6 +911,62 @@ static const void *pop_buf(Fifo8 *fifo, uint32_t max, uint32_t *num)
     return ret;
 }
 
+static void xlnx_zynqmp_gspips_dma_done(XlnxZynqMPQSPIPS *s)
+{
+    int cnt;
+
+    s->regs[R_GQSPI_DMA_STS] &= ~R_GQSPI_DMA_STS_BUSY_MASK;
+    s->regs[R_GQSPI_DMA_I_STS] |= R_GQSPI_DMA_I_STS_DONE_MASK;
+
+    cnt = ARRAY_FIELD_EX32(s->regs, GQSPI_DMA_STS, DONE_CNT) + 1;
+    ARRAY_FIELD_DP32(s->regs, GQSPI_DMA_STS, DONE_CNT, cnt);
+
+}
+
+static uint32_t xlnx_zynqmp_gspips_dma_advance(XlnxZynqMPQSPIPS *s,
+                                               uint32_t len, hwaddr dst)
+{
+    uint32_t size = s->regs[R_GQSPI_DMA_SIZE];
+
+    size -= len;
+    size &= R_GQSPI_DMA_SIZE_SIZE_MASK;
+    dst += len;
+
+    s->regs[R_GQSPI_DMA_SIZE] = size;
+    s->regs[R_GQSPI_DMA_ADDR] = (uint32_t) dst;
+    s->regs[R_GQSPI_DMA_ADDR_MSB] = dst >> 32;
+
+    return size;
+}
+
+static size_t xlnx_zynqmp_gspips_dma_push(XlnxZynqMPQSPIPS *s,
+                                          uint8_t *buf, size_t len, bool eop)
+{
+    hwaddr dst = (hwaddr)s->regs[R_GQSPI_DMA_ADDR_MSB] << 32
+                 | s->regs[R_GQSPI_DMA_ADDR];
+    uint32_t size = s->regs[R_GQSPI_DMA_SIZE];
+    uint32_t mlen = MIN(size, len) & (~3); /* Size is word aligned */
+
+    if (size == 0 || len <= 0) {
+        return 0;
+    }
+
+    cpu_physical_memory_write(dst, buf, mlen);
+    size = xlnx_zynqmp_gspips_dma_advance(s, mlen, dst);
+
+    if (size == 0) {
+        xlnx_zynqmp_gspips_dma_done(s);
+        xlnx_zynqmp_qspips_update_ixr(s);
+    }
+
+   return mlen;
+}
+
+static bool xlnx_zynqmp_gspips_dma_can_push(XlnxZynqMPQSPIPS *s)
+{
+    return s->regs[R_GQSPI_DMA_SIZE] ? true : false;
+}
+
 static void xlnx_zynqmp_qspips_notify(void *opaque)
 {
     XlnxZynqMPQSPIPS *rq = XLNX_ZYNQMP_QSPIPS(opaque);
@@ -850,7 +974,8 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
     Fifo8 *recv_fifo;
 
     if (ARRAY_FIELD_EX32(rq->regs, GQSPI_SELECT, GENERIC_QSPI_EN)) {
-        if (!(ARRAY_FIELD_EX32(rq->regs, GQSPI_CNFG, MODE_EN) == 2)) {
+        if (ARRAY_FIELD_EX32(rq->regs, GQSPI_CNFG, MODE_EN)
+            != GQSPI_CNFG_MODE_EN_DMA) {
             return;
         }
         recv_fifo = &rq->rx_fifo_g;
@@ -861,7 +986,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
         recv_fifo = &s->rx_fifo;
     }
     while (recv_fifo->num >= 4
-           && stream_can_push(rq->dma, xlnx_zynqmp_qspips_notify, rq))
+           && xlnx_zynqmp_gspips_dma_can_push(rq))
     {
         size_t ret;
         uint32_t num;
@@ -874,7 +999,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
 
         memcpy(rq->dma_buf, rxd, num);
 
-        ret = stream_push(rq->dma, rq->dma_buf, num, false);
+        ret = xlnx_zynqmp_gspips_dma_push(rq, rq->dma_buf, num, false);
         assert(ret == num);
         xlnx_zynqmp_qspips_check_flush(rq);
     }
@@ -1127,6 +1252,31 @@ static void xlnx_zynqmp_qspips_write(void *opaque, hwaddr addr,
         case R_GQSPI_GF_SNAPSHOT:
         case R_GQSPI_MOD_ID:
             break;
+        case R_GQSPI_DMA_ADDR:
+            s->regs[R_GQSPI_DMA_ADDR] = value & R_GQSPI_DMA_ADDR_ADDR_MASK;
+            break;
+        case R_GQSPI_DMA_SIZE:
+            s->regs[R_GQSPI_DMA_SIZE] = value & R_GQSPI_DMA_SIZE_SIZE_MASK;
+            break;
+        case R_GQSPI_DMA_STS:
+            s->regs[R_GQSPI_DMA_STS] &= ~(value &
+                                          R_GQSPI_DMA_STS_DONE_CNT_MASK);
+            break;
+        case R_GQSPI_DMA_I_EN:
+            s->regs[R_GQSPI_DMA_I_EN]    = value & R_GQSPI_DMA_INT_MASK;
+            s->regs[R_GQSPI_DMA_I_MASK] &= ~s->regs[R_GQSPI_DMA_I_EN];
+            s->regs[R_GQSPI_DMA_I_DIS]  &= ~s->regs[R_GQSPI_DMA_I_EN];
+            break;
+        case R_GQSPI_DMA_I_DIS:
+            s->regs[R_GQSPI_DMA_I_DIS]  |= value & R_GQSPI_DMA_INT_MASK;
+            s->regs[R_GQSPI_DMA_I_MASK] |= s->regs[R_GQSPI_DMA_I_DIS];
+            s->regs[R_GQSPI_DMA_I_EN]   &= ~s->regs[R_GQSPI_DMA_I_DIS];
+            s->regs[R_GQSPI_DMA_STS] &= 0;
+            break;
+        case R_GQSPI_DMA_ADDR_MSB:
+            s->regs[R_GQSPI_DMA_ADDR_MSB] = value &
+                                            R_GQSPI_DMA_ADDR_MSB_ADDR_MSB_MASK;
+            break;
         default:
             s->regs[reg] = value;
             break;
-- 
2.7.4


