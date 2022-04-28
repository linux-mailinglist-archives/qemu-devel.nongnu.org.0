Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE551390C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:53:09 +0200 (CEST)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6S4-00071d-Qe
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nk6JG-0001ya-L4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:44:02 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nk6JB-0000J7-Qv
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:44:02 -0400
Received: by mail-pf1-x42e.google.com with SMTP id p8so4576826pfh.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JGL3Qp1l8WE05rnIK2OgoPnem/71zB4pg5r718wtrvU=;
 b=fSJNxDOKK6B9M7OXSnIBxiF4iRaFIQvX1XW0zJMTW7PcURJA3k3M/Z+DNRtGd7DYmt
 9Jph1AtpN1ygMBVKZ8VStyWFTB6Y+KphysBhMk2lUJ2/xpINXU6RokuuoZd7Wqe4Kqmg
 VDDMtOGgYJRdnrBNSbkGrpxtyrWxtqn58ZcIs/eVwjsO4IsKRscbbAfncOfEV+667p9f
 xrSyzH8toFYVR7pnx+DFTJDDed8SSffxxT05kPkSLn1pM8QHihmWvnGNx82fCNPw+S4V
 +4utmIrX8kLgY7S2j/Z9oGNGzYGg8Vk/O1lbKFQoX/6CfhsskcZMKK+nGosPEsKbbst7
 iuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JGL3Qp1l8WE05rnIK2OgoPnem/71zB4pg5r718wtrvU=;
 b=eV6hVvbdvOds2phH+reJm7b8pnxpZKE1SDI5KEJ+3npFLjj+hOt0kKRWFs8NVidA5O
 G/dulQjpoy89eW5zLu+3fzm152e/ibK9STDSAsOKgDnB1E20KYk/jcVvmQIZSFM8ET9Q
 nanUZKpZJAOmQHFsvWVgsXsNVxIIRIeh056Ku6Pu2Lg+41DtBacLJhzBvqUeQOqjHHfP
 Z24Aj8bajL5EStQgGLdTN1cp4hctupCCaZthUcWbl90U90ElUtgVLrnVXhlajlUH6CKD
 odwC46TIYWd7b1EUZkD1glLOYiMfMyXe8Np3eQG1NatcPn4XIa2j1b4Alq+ODCk29Mrh
 hWTw==
X-Gm-Message-State: AOAM5308s3cxzsOHnz019C+Krx2zninbChcu+ABQatcav/T18+KGSfJD
 Bz4cyjqoYBfOFuXHXfP0oj8YzUbuP8Tlw15V
X-Google-Smtp-Source: ABdhPJyp2KGo9897p6DKmCpBaCsEWSp51al6o9IuBdJYlwUmkjKFp6hCM6q866XTXyBvRql+RXXLqg==
X-Received: by 2002:a05:6a00:1953:b0:50d:a0a5:38b1 with SMTP id
 s19-20020a056a00195300b0050da0a538b1mr2558147pfk.77.1651160635040; 
 Thu, 28 Apr 2022 08:43:55 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a63f04f000000b003c14af50613sm3303182pgj.43.2022.04.28.08.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 08:43:54 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/dma: Add Xilinx AXI CDMA
Date: Thu, 28 Apr 2022 23:43:46 +0800
Message-Id: <20220428154348.26380-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair@alistair23.me>,
 Markus Armbruster <armbru@redhat.com>, Jim Shu <jim.shu@sifive.com>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Add Xilinx AXI CDMA model, which follows
AXI Central Direct Memory Access v4.1 spec:
https://docs.xilinx.com/v/u/en-US/pg034-axi-cdma

Supports both Simple DMA and Scatter Gather modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/dma/meson.build              |   2 +-
 hw/dma/xilinx_axicdma.c         | 792 ++++++++++++++++++++++++++++++++
 include/hw/dma/xilinx_axicdma.h |  72 +++
 3 files changed, 865 insertions(+), 1 deletion(-)
 create mode 100644 hw/dma/xilinx_axicdma.c
 create mode 100644 include/hw/dma/xilinx_axicdma.h

diff --git a/hw/dma/meson.build b/hw/dma/meson.build
index f3f0661bc3..85edf80b82 100644
--- a/hw/dma/meson.build
+++ b/hw/dma/meson.build
@@ -3,7 +3,7 @@ softmmu_ss.add(when: 'CONFIG_PL080', if_true: files('pl080.c'))
 softmmu_ss.add(when: 'CONFIG_PL330', if_true: files('pl330.c'))
 softmmu_ss.add(when: 'CONFIG_I82374', if_true: files('i82374.c'))
 softmmu_ss.add(when: 'CONFIG_I8257', if_true: files('i8257.c'))
-softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('xilinx_axidma.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('xilinx_axidma.c', 'xilinx_axicdma.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ_DEVCFG', if_true: files('xlnx-zynq-devcfg.c'))
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
 softmmu_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
diff --git a/hw/dma/xilinx_axicdma.c b/hw/dma/xilinx_axicdma.c
new file mode 100644
index 0000000000..50aec3ec45
--- /dev/null
+++ b/hw/dma/xilinx_axicdma.c
@@ -0,0 +1,792 @@
+/*
+ * QEMU model of Xilinx AXI-CDMA block.
+ *
+ * Copyright (c) 2022 Frank Chang <frank.chang@sifive.com>.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "hw/ptimer.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "qom/object.h"
+#include "sysemu/dma.h"
+#include "hw/dma/xilinx_axicdma.h"
+
+#define R_CDMACR                    0x00
+#define R_CDMASR                    0x04
+#define R_CURDESC                   0x08
+#define R_CURDESC_MSB               0x0c
+#define R_TAILDESC                  0x10
+#define R_TAILDESC_MSB              0x14
+#define R_SA                        0x18
+#define R_SA_MSB                    0x1c
+#define R_DA                        0x20
+#define R_DA_MSB                    0x24
+#define R_BTT                       0x28
+
+#define R_MAX                       0x30
+
+/* CDMACR */
+#define CDMACR_TAIL_PNTR_EN         BIT(1)
+#define CDMACR_RESET                BIT(2)
+#define CDMACR_SGMODE               BIT(3)
+#define CDMACR_KEY_HOLE_READ        BIT(4)
+#define CDMACR_KEY_HOLE_WRITE       BIT(5)
+#define CDMACR_CYCLIC_BD_ENABLE     BIT(6)
+#define CDMACR_IOC_IRQ_EN           BIT(12)
+#define CDMACR_DLY_IRQ_EN           BIT(13)
+#define CDMACR_ERR_IRQ_EN           BIT(14)
+
+#define CDMACR_MASK                 0xffff707c
+
+/* TailPntrEn = 1,  IRQThreshold = 1. */
+#define CDMACR_DEFAULT              0x10002
+
+/* CDMASR */
+#define CDMASR_IDLE                 BIT(1)
+#define CDMASR_SG_INCLUD            BIT(3)
+#define CDMASR_DMA_INT_ERR          BIT(4)
+#define CDMASR_DMA_SLV_ERR          BIT(5)
+#define CDMASR_DMA_DEC_ERR          BIT(6)
+#define CDMASR_SG_INT_ERR           BIT(8)
+#define CDMASR_SG_SLV_ERR           BIT(9)
+#define CDMASR_SG_DEC_ERR           BIT(10)
+#define CDMASR_IOC_IRQ              BIT(12)
+#define CDMASR_DLY_IRQ              BIT(13)
+#define CDMASR_ERR_IRQ              BIT(14)
+
+#define CDMASR_IRQ_THRES_SHIFT      16
+#define CDMASR_IRQ_THRES_WIDTH      8
+#define CDMASR_IRQ_DELAY_SHIFT      24
+#define CDMASR_IRQ_DELAY_WIDTH      8
+
+#define CDMASR_IRQ_MASK             (CDMASR_IOC_IRQ | \
+                                     CDMASR_DLY_IRQ | \
+                                     CDMASR_ERR_IRQ)
+
+/* Idle = 1, SGIncld = 1, IRQThresholdSts = 1. */
+#define CDMASR_DEFAULT              0x1000a
+
+#define CURDESC_MASK                0xffffffc0
+
+#define TAILDESC_MASK               0xffffffc0
+
+#define BTT_MAX_SIZE                (1UL << 26)
+#define BTT_MASK                    (BTT_MAX_SIZE - 1)
+
+/* SDesc - Status */
+#define SDEC_STATUS_DMA_INT_ERR     BIT(28)
+#define SDEC_STATUS_DMA_SLV_ERR     BIT(29)
+#define SDEC_STATUS_DMA_DEC_ERR     BIT(30)
+#define SDEC_STATUS_DMA_CMPLT       BIT(31)
+
+
+static void axicdma_set_dma_err(XilinxAXICDMA *s, uint32_t err);
+static void axicdma_set_sg_dma_err(XilinxAXICDMA *s, uint32_t err, hwaddr addr);
+static void axicdma_set_sg_err(XilinxAXICDMA *s, uint32_t err);
+
+static void axicdma_update_irq(XilinxAXICDMA *s)
+{
+    uint32_t enable, pending;
+
+    enable = s->control & CDMASR_IRQ_MASK;
+    pending = s->status & CDMASR_IRQ_MASK;
+
+    qemu_set_irq(s->irq, !!(enable & pending));
+}
+
+static void axicdma_set_irq(XilinxAXICDMA *s, uint32_t irq, bool level)
+{
+    g_assert(irq == CDMASR_IOC_IRQ ||
+             irq == CDMASR_DLY_IRQ ||
+             irq == CDMASR_ERR_IRQ);
+
+    if (level) {
+        s->status |= irq;
+    } else {
+        s->status &= ~irq;
+    }
+
+    axicdma_update_irq(s);
+}
+
+static void axicdma_reload_complete_cnt(XilinxAXICDMA *s)
+{
+    s->complete_cnt = extract32(s->control, CDMASR_IRQ_THRES_SHIFT,
+                                CDMASR_IRQ_THRES_WIDTH);
+}
+
+static void timer_hit(void *opaque)
+{
+    XilinxAXICDMA *s = XILINX_AXI_CDMA(opaque);
+
+    axicdma_set_irq(s, CDMASR_DLY_IRQ, true);
+    axicdma_reload_complete_cnt(s);
+}
+
+static bool sdesc_load(XilinxAXICDMA *s, hwaddr addr)
+{
+    SDesc *d = &s->sdesc;
+    MemTxResult ret;
+
+    ret = address_space_read(s->as, addr, MEMTXATTRS_UNSPECIFIED,
+                             d, sizeof(SDesc));
+    if (ret != MEMTX_OK) {
+        axicdma_set_sg_err(s, CDMASR_SG_DEC_ERR);
+        return false;
+    }
+
+    /* Convert from LE into host endianness. */
+    d->nxtdesc = le64_to_cpu(d->nxtdesc);
+    d->src = le64_to_cpu(d->src);
+    d->dest = le64_to_cpu(d->dest);
+    d->control = le32_to_cpu(d->control);
+    d->status = le32_to_cpu(d->status);
+
+    return true;
+}
+
+static bool sdesc_store(XilinxAXICDMA *s, hwaddr addr)
+{
+    SDesc *d = &s->sdesc;
+    MemTxResult ret;
+
+    /* Convert from host endianness into LE. */
+    d->nxtdesc = cpu_to_le64(d->nxtdesc);
+    d->src = cpu_to_le64(d->src);
+    d->dest = cpu_to_le64(d->dest);
+    d->control = cpu_to_le32(d->control);
+    d->status = cpu_to_le32(d->status);
+
+    ret = address_space_write(s->as, addr, MEMTXATTRS_UNSPECIFIED,
+                              d, sizeof(SDesc));
+    if (ret != MEMTX_OK) {
+        axicdma_set_sg_err(s, CDMASR_SG_DEC_ERR);
+        return false;
+    }
+
+    return true;
+}
+
+static void sdesc_complete(XilinxAXICDMA *s)
+{
+    uint32_t irq_delay = extract32(s->control, CDMASR_IRQ_DELAY_SHIFT,
+                                   CDMASR_IRQ_DELAY_WIDTH);
+
+    if (irq_delay) {
+        /* Restart the delayed timer. */
+        ptimer_transaction_begin(s->ptimer);
+        ptimer_stop(s->ptimer);
+        ptimer_set_count(s->ptimer, irq_delay);
+        ptimer_run(s->ptimer, 1);
+        ptimer_transaction_commit(s->ptimer);
+    }
+
+    s->complete_cnt--;
+
+    if (s->complete_cnt == 0) {
+        /* Raise the IOC irq. */
+        axicdma_set_irq(s, CDMASR_IOC_IRQ, true);
+        axicdma_reload_complete_cnt(s);
+    }
+}
+
+static inline bool axicdma_sgmode(XilinxAXICDMA *s)
+{
+    return !!(s->control & CDMACR_SGMODE);
+}
+
+static void axicdma_set_dma_err(XilinxAXICDMA *s, uint32_t err)
+{
+    g_assert(err == CDMASR_DMA_INT_ERR ||
+             err == CDMASR_DMA_SLV_ERR ||
+             err == CDMASR_DMA_DEC_ERR);
+
+    s->status |= err;
+    axicdma_set_irq(s, CDMASR_ERR_IRQ, true);
+}
+
+static void axicdma_set_sg_dma_err(XilinxAXICDMA *s, uint32_t err, hwaddr addr)
+{
+    g_assert(axicdma_sgmode(s));
+
+    axicdma_set_dma_err(s, err);
+
+    /*
+     * There are 24-bit shift between
+     * SDesc status bit and CDMACR.DMA_[INT|SLV|DEC]_ERR bit.
+     */
+    s->sdesc.status |= (err << 24);
+    sdesc_store(s, addr);
+}
+
+static void axicdma_set_sg_err(XilinxAXICDMA *s, uint32_t err)
+{
+    g_assert(err == CDMASR_SG_INT_ERR ||
+             err == CDMASR_SG_SLV_ERR ||
+             err == CDMASR_SG_DEC_ERR);
+
+    s->status |= err;
+    axicdma_set_irq(s, CDMASR_ERR_IRQ, true);
+}
+
+static bool axicdma_perform_dma(XilinxAXICDMA *s, hwaddr src, hwaddr dest,
+                                uint32_t btt)
+{
+    uint32_t r_off = 0, w_off = 0;
+    uint32_t len;
+    MemTxResult ret;
+
+    while (btt > 0) {
+        len = MIN(btt, CDMA_BUF_SIZE);
+
+        ret = dma_memory_read(s->as, src + r_off, s->buf + r_off, len,
+                              MEMTXATTRS_UNSPECIFIED);
+        if (ret != MEMTX_OK) {
+            return false;
+        }
+
+        ret = dma_memory_write(s->as, dest + w_off, s->buf + w_off, len,
+                               MEMTXATTRS_UNSPECIFIED);
+        if (ret != MEMTX_OK) {
+            return false;
+        }
+
+        btt -= len;
+
+        if (!(s->control & CDMACR_KEY_HOLE_READ)) {
+            r_off += len;
+        }
+
+        if (!(s->control & CDMACR_KEY_HOLE_WRITE)) {
+            w_off += len;
+        }
+    }
+
+    return true;
+}
+
+static void axicdma_run_simple(XilinxAXICDMA *s)
+{
+    if (!s->btt) {
+        /* Value of zero BTT is not allowed. */
+        axicdma_set_dma_err(s, CDMASR_DMA_INT_ERR);
+        return;
+    }
+
+    if (!axicdma_perform_dma(s, s->src, s->dest, s->btt)) {
+        axicdma_set_dma_err(s, CDMASR_DMA_DEC_ERR);
+        return;
+    }
+
+    /* Generate IOC interrupt. */
+    axicdma_set_irq(s, CDMASR_IOC_IRQ, true);
+}
+
+static void axicdma_run_sgmode(XilinxAXICDMA *s)
+{
+    uint64_t pdesc;
+    uint32_t btt;
+
+    while (1) {
+        if (!sdesc_load(s, s->curdesc)) {
+            break;
+        }
+
+        if (s->sdesc.status & SDEC_STATUS_DMA_CMPLT) {
+            axicdma_set_sg_err(s, CDMASR_SG_INT_ERR);
+            break;
+        }
+
+        btt = s->sdesc.control & BTT_MASK;
+
+        if (btt == 0) {
+            /* Value of zero BTT is not allowed. */
+            axicdma_set_sg_err(s, CDMASR_SG_INT_ERR);
+            break;
+        }
+
+        if (!axicdma_perform_dma(s, s->sdesc.src, s->sdesc.dest, btt)) {
+            axicdma_set_sg_dma_err(s, CDMASR_DMA_DEC_ERR, s->curdesc);
+            break;
+        }
+
+        /* Update the descriptor. */
+        s->sdesc.status |= SDEC_STATUS_DMA_CMPLT;
+        sdesc_store(s, s->curdesc);
+        sdesc_complete(s);
+
+        /* Advance current descriptor pointer. */
+        pdesc = s->curdesc;
+        s->curdesc = s->sdesc.nxtdesc;
+
+        if (!(s->control & CDMACR_CYCLIC_BD_ENABLE) &&
+            pdesc == s->taildesc) {
+            /* Reach the tail descriptor. */
+            break;
+        }
+    }
+
+    /* Stop the delayed timer. */
+    ptimer_transaction_begin(s->ptimer);
+    ptimer_stop(s->ptimer);
+    ptimer_transaction_commit(s->ptimer);
+}
+
+static void axicdma_run(XilinxAXICDMA *s)
+{
+    bool sgmode = axicdma_sgmode(s);
+
+    /* Not idle. */
+    s->status &= ~CDMASR_IDLE;
+
+    if (!sgmode) {
+        axicdma_run_simple(s);
+    } else {
+        axicdma_run_sgmode(s);
+    }
+
+    /* Idle. */
+    s->status |= CDMASR_IDLE;
+}
+
+static void axicdma_reset(XilinxAXICDMA *s)
+{
+    s->control = CDMACR_DEFAULT;
+    s->status = CDMASR_DEFAULT;
+    s->complete_cnt = 1;
+    qemu_irq_lower(s->irq);
+}
+
+static void axicdma_write_control(XilinxAXICDMA *s, uint32_t value)
+{
+    if (value & CDMACR_RESET) {
+        axicdma_reset(s);
+        return;
+    }
+
+    /*
+     * The minimum setting for the threshold is 0x01.
+     * A write of 0x00 to CDMACR.IRQThreshold has no effect.
+     */
+    if (!extract32(value, CDMASR_IRQ_THRES_SHIFT, CDMASR_IRQ_THRES_WIDTH)) {
+        value = deposit32(value, CDMASR_IRQ_THRES_SHIFT, CDMASR_IRQ_THRES_WIDTH,
+                          s->control);
+    }
+
+    /*
+     * AXI CDMA is built with SG enabled,
+     * tail pointer mode is always enabled.
+     */
+    s->control = (value & CDMACR_MASK) | CDMACR_TAIL_PNTR_EN;
+
+    if (!axicdma_sgmode(s)) {
+        /*
+         * CDMASR.Dly_Irq, CURDESC_PNTR, TAILDESC_PNTR are cleared
+         * when not in SGMode.
+         */
+        s->status &= ~CDMASR_DLY_IRQ;
+        s->curdesc = 0;
+        s->taildesc = 0;
+    }
+
+    axicdma_reload_complete_cnt(s);
+}
+
+static uint32_t axicdma_read_status(XilinxAXICDMA *s)
+{
+    uint32_t value = s->status;
+
+    value = deposit32(value, CDMASR_IRQ_THRES_SHIFT,
+                      CDMASR_IRQ_THRES_WIDTH, s->complete_cnt);
+    value = deposit32(value, CDMASR_IRQ_DELAY_SHIFT,
+                      CDMASR_IRQ_DELAY_WIDTH, ptimer_get_count(s->ptimer));
+
+    return value;
+}
+
+static void axicdma_write_status(XilinxAXICDMA *s, uint32_t value)
+{
+    /* Write 1s to clear interrupts. */
+    s->status &= ~(value & CDMASR_IRQ_MASK);
+    axicdma_update_irq(s);
+}
+
+static void axicdma_write_curdesc(XilinxAXICDMA *s, uint64_t value)
+{
+    /* Should be idle. */
+    g_assert(s->status & CDMASR_IDLE);
+
+    if (!axicdma_sgmode(s)) {
+        /* This register is cleared if SGMode = 0. */
+        return;
+    }
+
+    s->curdesc = value & CURDESC_MASK;
+}
+
+static void axicdma_write_taildesc(XilinxAXICDMA *s, uint64_t value)
+{
+    /* Should be idle. */
+    g_assert(s->status & CDMASR_IDLE);
+
+    if (!axicdma_sgmode(s)) {
+        /* This register is cleared if SGMode = 0. */
+        return;
+    }
+
+    s->taildesc = value & TAILDESC_MASK;
+
+    /* Kick-off CDMA. */
+    axicdma_run(s);
+}
+
+static void axicdma_write_btt(XilinxAXICDMA *s, uint64_t value)
+{
+    s->btt = value & BTT_MASK;
+
+    if (!axicdma_sgmode(s)) {
+        /* Kick-off CDMA. */
+        axicdma_run(s);
+    }
+}
+
+static uint32_t axicdma_readl(void *opaque, hwaddr addr, unsigned size)
+{
+    XilinxAXICDMA *s = opaque;
+    uint32_t value = 0;
+
+    if (s->addrwidth <= 32) {
+        switch (addr) {
+        case R_CURDESC_MSB:
+        case R_TAILDESC_MSB:
+        case R_SA_MSB:
+        case R_DA_MSB:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Invalid 32-bit read to 0x%" HWADDR_PRIX "\n",
+                          __func__, addr);
+            return value;
+        }
+    }
+
+    switch (addr) {
+    case R_CDMACR:
+        value = s->control;
+        break;
+    case R_CDMASR:
+        value = axicdma_read_status(s);
+        break;
+    case R_CURDESC:
+        value = s->curdesc;
+        break;
+    case R_CURDESC_MSB:
+        value = extract64(s->curdesc, 32, 32);
+        break;
+    case R_TAILDESC:
+        value = s->taildesc;
+        break;
+    case R_TAILDESC_MSB:
+        value = extract64(s->taildesc, 32, 32);
+        break;
+    case R_SA:
+        value = s->src;
+        break;
+    case R_SA_MSB:
+        value = extract64(s->src, 32, 32);
+        break;
+    case R_DA:
+        value = s->dest;
+        break;
+    case R_DA_MSB:
+        value = extract64(s->dest, 32, 32);
+        break;
+    case R_BTT:
+        value = s->btt;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid 32-bit read to 0x%" HWADDR_PRIX "\n",
+                      __func__, addr);
+    }
+
+    return value;
+}
+
+static uint32_t axicdma_readq(void *opaque, hwaddr addr, unsigned size)
+{
+    XilinxAXICDMA *s = opaque;
+    uint64_t value = 0;
+
+    switch (addr) {
+    case R_CDMACR:
+        value = s->control;
+        break;
+    case R_CDMASR:
+        value = axicdma_read_status(s);
+        break;
+    case R_CURDESC:
+        value = s->curdesc;
+        break;
+    case R_TAILDESC:
+        value = s->taildesc;
+        break;
+    case R_SA:
+        value = s->src;
+        break;
+    case R_DA:
+        value = s->dest;
+        break;
+    case R_BTT:
+        value = s->btt;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid 64-bit read to 0x%" HWADDR_PRIX "\n",
+                      __func__, addr);
+    }
+
+    return value;
+}
+
+static uint64_t axicdma_read(void *opaque, hwaddr addr, unsigned size)
+{
+    uint64_t value = 0;
+
+    switch (size) {
+    case 4:
+        value = axicdma_readl(opaque, addr, size);
+        break;
+    case 8:
+        value = axicdma_readq(opaque, addr, size);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid read size %u to AXI-CDMA\n",
+                      __func__, size);
+    }
+
+    return value;
+}
+
+static void axicdma_writel(void *opaque, hwaddr addr, uint32_t value,
+                           unsigned size)
+{
+    XilinxAXICDMA *s = opaque;
+
+    if (s->addrwidth <= 32) {
+        switch (addr) {
+        case R_CURDESC_MSB:
+        case R_TAILDESC_MSB:
+        case R_SA_MSB:
+        case R_DA_MSB:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Invalid 32-bit write to 0x%" HWADDR_PRIX "\n",
+                          __func__, addr);
+            return;
+        }
+    }
+
+    switch (addr) {
+    case R_CDMACR:
+        axicdma_write_control(s, value);
+        break;
+    case R_CDMASR:
+        axicdma_write_status(s, value);
+        break;
+    case R_CURDESC:
+        axicdma_write_curdesc(s, deposit64(s->curdesc, 0, 32, value));
+        break;
+    case R_CURDESC_MSB:
+        axicdma_write_curdesc(s, deposit64(s->curdesc, 32, 32, value));
+        break;
+    case R_TAILDESC:
+        axicdma_write_taildesc(s, deposit64(s->taildesc, 0, 32, value));
+        break;
+    case R_TAILDESC_MSB:
+        axicdma_write_taildesc(s, deposit64(s->taildesc, 32, 32, value));
+        break;
+    case R_SA:
+        s->src = deposit64(s->src, 0, 32, value);
+        break;
+    case R_SA_MSB:
+        s->src = deposit64(s->src, 32, 32, value);
+        break;
+    case R_DA:
+        s->dest = deposit64(s->dest, 0, 32, value);
+        break;
+    case R_DA_MSB:
+        s->dest = deposit64(s->dest, 32, 32, value);
+        break;
+    case R_BTT:
+        axicdma_write_btt(s, value);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid 32-bit write to 0x%" HWADDR_PRIX "\n",
+                      __func__, addr);
+    }
+}
+
+static void axicdma_writeq(void *opaque, hwaddr addr, uint64_t value,
+                           unsigned size)
+{
+    XilinxAXICDMA *s = opaque;
+
+    switch (addr) {
+    case R_CDMACR:
+        axicdma_write_control(s, value);
+        break;
+    case R_CDMASR:
+        axicdma_write_status(s, value);
+        break;
+    case R_CURDESC:
+        axicdma_write_curdesc(s, value);
+        break;
+    case R_TAILDESC:
+        axicdma_write_taildesc(s, value);
+        break;
+    case R_SA:
+        s->src = value;
+        break;
+    case R_DA:
+        s->dest = value;
+        break;
+    case R_BTT:
+        axicdma_write_btt(s, value);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid 64-bit write to 0x%" HWADDR_PRIX "\n",
+                      __func__, addr);
+    }
+}
+
+static void axicdma_write(void *opaque, hwaddr addr,
+                          uint64_t value, unsigned size)
+{
+    switch (size) {
+    case 4:
+        axicdma_writel(opaque, addr, value, size);
+        break;
+    case 8:
+        axicdma_writeq(opaque, addr, value, size);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid write size %u to AXI-CDMA\n",
+                      __func__, size);
+    }
+}
+
+static const MemoryRegionOps axicdma_ops = {
+    .read = axicdma_read,
+    .write = axicdma_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 8
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
+    },
+};
+
+static void xilinx_axicdma_realize(DeviceState *dev, Error **errp)
+{
+    XilinxAXICDMA *s = XILINX_AXI_CDMA(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(dev), &axicdma_ops, s,
+                          TYPE_XILINX_AXI_CDMA, R_MAX);
+    sysbus_init_mmio(sbd, &s->mmio);
+    sysbus_init_irq(sbd, &s->irq);
+
+    if (!s->dma_mr || s->dma_mr == get_system_memory()) {
+        /* Avoid creating new AddressSpace for system memory. */
+        s->as = &address_space_memory;
+    } else {
+        s->as = g_new0(AddressSpace, 1);
+        address_space_init(s->as, s->dma_mr, memory_region_name(s->dma_mr));
+    }
+
+    s->ptimer = ptimer_init(timer_hit, s, PTIMER_POLICY_DEFAULT);
+    ptimer_transaction_begin(s->ptimer);
+    ptimer_set_freq(s->ptimer, s->freqhz);
+    ptimer_transaction_commit(s->ptimer);
+}
+
+static void xilinx_axicdma_unrealize(DeviceState *dev)
+{
+    XilinxAXICDMA *s = XILINX_AXI_CDMA(dev);
+
+    if (s->ptimer) {
+        ptimer_free(s->ptimer);
+    }
+
+    if (s->as && s->dma_mr != get_system_memory()) {
+        g_free(s->as);
+    }
+}
+
+static Property axicdma_properties[] = {
+    DEFINE_PROP_UINT32("freqhz", XilinxAXICDMA, freqhz, 50000000),
+    DEFINE_PROP_INT32("addrwidth", XilinxAXICDMA, addrwidth, 64),
+    DEFINE_PROP_LINK("dma", XilinxAXICDMA, dma_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void xilinx_axicdma_reset_enter(Object *obj, ResetType type)
+{
+    axicdma_reset(XILINX_AXI_CDMA(obj));
+}
+
+static void axicdma_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    dc->realize = xilinx_axicdma_realize;
+    dc->unrealize = xilinx_axicdma_unrealize;
+    device_class_set_props(dc, axicdma_properties);
+
+    rc->phases.enter = xilinx_axicdma_reset_enter;
+}
+
+static const TypeInfo axicdma_info = {
+    .name          = TYPE_XILINX_AXI_CDMA,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(XilinxAXICDMA),
+    .class_init    = axicdma_class_init,
+};
+
+static void xilinx_axicdma_register_types(void)
+{
+    type_register_static(&axicdma_info);
+}
+
+type_init(xilinx_axicdma_register_types)
diff --git a/include/hw/dma/xilinx_axicdma.h b/include/hw/dma/xilinx_axicdma.h
new file mode 100644
index 0000000000..67b7cfce99
--- /dev/null
+++ b/include/hw/dma/xilinx_axicdma.h
@@ -0,0 +1,72 @@
+/*
+ * QEMU model of Xilinx AXI-CDMA block.
+ *
+ * Copyright (c) 2022 Frank Chang <frank.chang@sifive.com>.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "exec/hwaddr.h"
+#include "hw/ptimer.h"
+#include "hw/sysbus.h"
+#include "qom/object.h"
+#include "qemu/units.h"
+
+#define CDMA_BUF_SIZE   (64 * KiB)
+
+typedef struct XilinxAXICDMA XilinxAXICDMA;
+
+#define TYPE_XILINX_AXI_CDMA "xlnx.axi-cdma"
+OBJECT_DECLARE_SIMPLE_TYPE(XilinxAXICDMA, XILINX_AXI_CDMA)
+
+/* Scatter Gather Transfer Descriptor */
+typedef struct SDesc {
+    uint64_t nxtdesc;
+    hwaddr src;
+    hwaddr dest;
+    uint32_t control;
+    uint32_t status;
+} SDesc;
+
+struct XilinxAXICDMA {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion mmio;
+    AddressSpace *as;
+    MemoryRegion *dma_mr;
+
+    /* Properties */
+    uint32_t control;
+    uint32_t status;
+    uint64_t curdesc;
+    uint64_t taildesc;
+    hwaddr src;
+    hwaddr dest;
+    uint32_t btt;
+
+    uint32_t freqhz;
+    int32_t addrwidth;
+    ptimer_state *ptimer;
+    SDesc sdesc;
+    qemu_irq irq;
+    uint16_t complete_cnt;
+    char buf[CDMA_BUF_SIZE];
+};
-- 
2.35.1


