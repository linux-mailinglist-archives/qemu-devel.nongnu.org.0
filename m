Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086C519E979
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Apr 2020 07:18:18 +0200 (CEST)
Received: from localhost ([::1]:44664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jKxfl-0005Cn-3p
	for lists+qemu-devel@lfdr.de; Sun, 05 Apr 2020 01:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jKxbn-0001RC-5H
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 01:14:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jKxbk-0007wU-Jg
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 01:14:11 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46712)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jKxbk-0007vN-BG; Sun, 05 Apr 2020 01:14:08 -0400
Received: by mail-pg1-x52b.google.com with SMTP id k191so5815102pgc.13;
 Sat, 04 Apr 2020 22:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qO1ejdnCjfK8zusCkGHArTPTV54HH5uZ4gmthT25iqM=;
 b=szfVytC8Ehcdtf8CK3JxhbBEN5vdD4IKOf39ChLAUIyeNDabjj4g7fbjBe7hONXmUy
 WTnPPRtAzDJc6UyMrLfFhHzXgsjQxDt3W/licZ92r/VIKW1y98LOTJTR0iVxsA0SRAN/
 4dTCqvWbxAchMBRI+I+MuReR+24ao4xA/0uRdpUJb8NKC22eV9ZEsLgFTiBqrO6A4/5d
 EBILGUs48SXfY01eeIVbw8JO7VuFUEW9MLHUHYUrucn8Vc0rpRQLUd7oW0VnLi7AyGJ0
 ndaGA4k1II1NPXulAVDTU2ls4NlWS8zzBxxJ3v0k/3smfHKUDKKiuCQ/ofE1kOCR+S9L
 FxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qO1ejdnCjfK8zusCkGHArTPTV54HH5uZ4gmthT25iqM=;
 b=dwg1TToruyj8ptNOqhDrZ/2dxcVfIyxhiqLEZ/5lV0lR5toYUyX16mwPy/zISenSpD
 9nxXp8ABv0WcME0EDwVUGSPlGcCbd3w12u0huGMCXbjDTGvftJ2MfoXumWGGPDoUdk+5
 VxCUFHMAEC1Ohbrg8aaU76B5ibbW7D0otGRxB6gDAfSE3XGgXgwNdaWm2dk09PUF4uAG
 pvzcoD6vrHBtVvDN+FXm9fA5s1HA9eVaQCEeRE1JbCIUDYaHXeu9e+jyWC/1hxOa7EBG
 BVdsz2vri9oJbCJMndPUdif6FwPQ10xLo4WUjpR/GDc+RIvJzU7dj/I4wUW28vF4+Fgl
 Y2UQ==
X-Gm-Message-State: AGi0PuYGv7NvRMyyijm0Efqv6L1leQApNtiGfhseV4g6DMdLwIdCDlj2
 KEvjfZQhGE+E3nkGFzR/oPE=
X-Google-Smtp-Source: APiQypJB20ECjj5gjHbmgU+xxZp34b645lA7ITzBMKlBSCKBr4drSPOG720dc7y1Z3gtIg4fgmu8FA==
X-Received: by 2002:a65:6447:: with SMTP id s7mr15951609pgv.163.1586063646991; 
 Sat, 04 Apr 2020 22:14:06 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id j24sm3466012pji.20.2020.04.04.22.14.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 04 Apr 2020 22:14:06 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu-devel PATCH v2 1/2] hw/net: Add Smartfusion2 emac block
Date: Sun,  5 Apr 2020 10:43:43 +0530
Message-Id: <1586063624-13375-2-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586063624-13375-1-git-send-email-sundeep.lkml@gmail.com>
References: <1586063624-13375-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52b
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
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

Modelled Ethernet MAC of Smartfusion2 SoC.
Micrel KSZ8051 PHY is present on Emcraft's
SOM kit hence same PHY is emulated.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 MAINTAINERS                |   2 +
 hw/net/Makefile.objs       |   1 +
 hw/net/msf2-emac.c         | 556 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/net/msf2-emac.h |  50 ++++
 4 files changed, 609 insertions(+)
 create mode 100644 hw/net/msf2-emac.c
 create mode 100644 include/hw/net/msf2-emac.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 7cb53ec..84277dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -918,6 +918,8 @@ F: include/hw/arm/msf2-soc.h
 F: include/hw/misc/msf2-sysreg.h
 F: include/hw/timer/mss-timer.h
 F: include/hw/ssi/mss-spi.h
+F: hw/net/msf2-emac.c
+F: include/hw/net/msf2-emac.h
 
 Emcraft M2S-FG484
 M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs
index af4d194..f2b7398 100644
--- a/hw/net/Makefile.objs
+++ b/hw/net/Makefile.objs
@@ -55,3 +55,4 @@ common-obj-$(CONFIG_ROCKER) += rocker/rocker.o rocker/rocker_fp.o \
 obj-$(call lnot,$(CONFIG_ROCKER)) += rocker/qmp-norocker.o
 
 common-obj-$(CONFIG_CAN_BUS) += can/
+common-obj-$(CONFIG_MSF2) += msf2-emac.o
diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
new file mode 100644
index 0000000..cb80e19
--- /dev/null
+++ b/hw/net/msf2-emac.c
@@ -0,0 +1,556 @@
+/*
+ * QEMU model of the Smartfusion2 Ethernet MAC.
+ *
+ * Copyright (c) 2020 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
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
+ *
+ * Refer to section Ethernet MAC in the document:
+ * UG0331: SmartFusion2 Microcontroller Subsystem User Guide
+ * Datasheet URL:
+ * https://www.microsemi.com/document-portal/cat_view/56661-internal-documents/
+ * 56758-soc?lang=en&limit=20&limitstart=220
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/log.h"
+#include "exec/address-spaces.h"
+#include "hw/registerfields.h"
+#include "hw/net/msf2-emac.h"
+#include "hw/net/mii.h"
+#include "hw/irq.h"
+#include "net/net.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+
+REG32(CFG1, 0x0)
+REG32(CFG2, 0x4)
+REG32(IFG, 0x8)
+REG32(HALF_DUPLEX, 0xc)
+REG32(FRM_LEN, 0x10)
+REG32(MII_CMD, 0x24)
+REG32(MII_ADDR, 0x28)
+REG32(MII_CTL, 0x2c)
+REG32(MII_STS, 0x30)
+REG32(STA1, 0x40)
+REG32(STA2, 0x44)
+REG32(FIFO_CFG0, 0x48)
+REG32(DMA_TX_CTL, 0x180)
+REG32(DMA_TX_DESC, 0x184)
+REG32(DMA_TX_STATUS, 0x188)
+REG32(DMA_RX_CTL, 0x18c)
+REG32(DMA_RX_DESC, 0x190)
+REG32(DMA_RX_STATUS, 0x194)
+REG32(DMA_IRQ_MASK, 0x198)
+REG32(DMA_IRQ, 0x19c)
+
+FIELD(DMA, PKTCNT, 16, 8)
+
+#define R_DMA_PKT_TXRX          (1 << 0)
+#define DMA_TX_UNDERRUN         (1 << 1)
+#define DMA_RX_OVERFLOW         (1 << 2)
+
+#define EMPTY_MASK              (1 << 31)
+#define PKT_SIZE                0x7FF
+
+#define CFG1_RESET              (1 << 31)
+#define CFG1_RX_EN              (1 << 2)
+#define CFG1_TX_EN              (1 << 0)
+
+#define DMA_TX_CTL_EN           (1 << 0)
+#define DMA_RX_CTL_EN           (1 << 0)
+
+#define MII_CMD_READ            (1 << 0)
+
+#define PHYADDR                 0x1
+#define MII_ADDR_MASK           0x1F
+#define PHY_ADDR_SHIFT          8
+#define MAX_PKT_SIZE            2048
+
+typedef struct {
+    uint32_t pktaddr;
+    uint32_t pktsize;
+    uint32_t next;
+} EmacDesc;
+
+static uint32_t emac_get_isr(MSF2EmacState *s)
+{
+    uint32_t ier = s->regs[R_DMA_IRQ_MASK];
+    uint32_t tx = s->regs[R_DMA_TX_STATUS] & 0xF;
+    uint32_t rx = s->regs[R_DMA_RX_STATUS] & 0xF;
+    uint32_t isr = (rx << 4) | tx;
+
+    s->regs[R_DMA_IRQ] = ier & isr;
+    return s->regs[R_DMA_IRQ];
+}
+
+static void emac_update_irq(MSF2EmacState *s)
+{
+    bool intr = emac_get_isr(s);
+
+    qemu_set_irq(s->irq, intr);
+}
+
+static void emac_load_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
+{
+    address_space_read(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED,
+                       (uint8_t *)d, sizeof *d);
+    /* Convert from LE into host endianness. */
+    d->pktaddr = le32_to_cpu(d->pktaddr);
+    d->pktsize = le32_to_cpu(d->pktsize);
+    d->next = le32_to_cpu(d->next);
+}
+
+static void emac_store_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
+{
+    /* Convert from host endianness into LE. */
+    d->pktaddr = cpu_to_le32(d->pktaddr);
+    d->pktsize = cpu_to_le32(d->pktsize);
+    d->next = cpu_to_le32(d->next);
+
+    address_space_write(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED,
+                        (uint8_t *)d, sizeof *d);
+}
+
+static void msf2_dma_tx(MSF2EmacState *s)
+{
+    hwaddr desc = s->regs[R_DMA_TX_DESC];
+    uint8_t buf[MAX_PKT_SIZE];
+    EmacDesc d;
+    int size;
+    uint8_t pktcnt;
+    uint32_t status;
+
+    if (!(s->regs[R_CFG1] & CFG1_TX_EN)) {
+        return;
+    }
+
+    while (1) {
+        emac_load_desc(s, &d, desc);
+        if (d.pktsize & EMPTY_MASK) {
+            break;
+        }
+        size = d.pktsize & PKT_SIZE;
+        address_space_read(&s->dma_as, d.pktaddr, MEMTXATTRS_UNSPECIFIED,
+                           buf, size);
+        /*
+         * This is very basic way to send packets. Ideally there should be
+         * a FIFO and packets should be sent out from FIFO only when
+         * R_CFG1 bit 0 is set.
+         */
+        qemu_send_packet(qemu_get_queue(s->nic), buf, size);
+        d.pktsize |= EMPTY_MASK;
+        emac_store_desc(s, &d, desc);
+        /* update sent packets count */
+        status = s->regs[R_DMA_TX_STATUS];
+        pktcnt = extract32(status, R_DMA_PKTCNT_SHIFT, 8);
+        pktcnt++;
+        s->regs[R_DMA_TX_STATUS] = deposit32(status, R_DMA_PKTCNT_SHIFT,
+                                             8, pktcnt);
+        s->regs[R_DMA_TX_STATUS] |= R_DMA_PKT_TXRX;
+        desc = d.next;
+    }
+    s->regs[R_DMA_TX_STATUS] |= DMA_TX_UNDERRUN;
+    s->regs[R_DMA_TX_CTL] &= ~DMA_TX_CTL_EN;
+}
+
+static void msf2_phy_update_link(MSF2EmacState *s)
+{
+    /* Autonegotiation status mirrors link status. */
+    if (qemu_get_queue(s->nic)->link_down) {
+        s->phy_regs[MII_BMSR] &= ~(MII_BMSR_AN_COMP |
+                                         MII_BMSR_LINK_ST);
+    } else {
+        s->phy_regs[MII_BMSR] |= (MII_BMSR_AN_COMP |
+                                         MII_BMSR_LINK_ST);
+    }
+}
+
+static void msf2_phy_reset(MSF2EmacState *s)
+{
+    memset(&s->phy_regs[0], 0, sizeof(s->phy_regs));
+    s->phy_regs[MII_BMCR] = 0x1140;
+    s->phy_regs[MII_BMSR] = 0x7968;
+    s->phy_regs[MII_PHYID1] = 0x0022;
+    s->phy_regs[MII_PHYID2] = 0x1550;
+    s->phy_regs[MII_ANAR] = 0x01E1;
+    s->phy_regs[MII_ANLPAR] = 0xCDE1;
+
+    msf2_phy_update_link(s);
+}
+
+static void write_to_phy(MSF2EmacState *s)
+{
+    uint8_t reg_addr = s->regs[R_MII_ADDR] & MII_ADDR_MASK;
+    uint8_t phy_addr = (s->regs[R_MII_ADDR] >> PHY_ADDR_SHIFT) & MII_ADDR_MASK;
+    uint16_t data = s->regs[R_MII_CTL] & 0xFFFF;
+
+    if (phy_addr != PHYADDR) {
+        return;
+    }
+
+    switch (reg_addr) {
+    case MII_BMCR:
+        if (data & MII_BMCR_RESET) {
+            /* Phy reset */
+            msf2_phy_reset(s);
+            data &= ~MII_BMCR_RESET;
+        }
+        if (data & MII_BMCR_AUTOEN) {
+            /* Complete autonegotiation immediately */
+            data &= ~MII_BMCR_AUTOEN;
+            s->phy_regs[MII_BMSR] |= MII_BMSR_AN_COMP;
+        }
+        break;
+    }
+
+    s->phy_regs[reg_addr] = data;
+}
+
+static uint16_t read_from_phy(MSF2EmacState *s)
+{
+    uint8_t reg_addr = s->regs[R_MII_ADDR] & MII_ADDR_MASK;
+    uint8_t phy_addr = (s->regs[R_MII_ADDR] >> PHY_ADDR_SHIFT) & MII_ADDR_MASK;
+
+    if (phy_addr == PHYADDR) {
+        return s->phy_regs[reg_addr];
+    } else {
+        return 0xFFFF;
+    }
+}
+
+static void msf2_emac_do_reset(MSF2EmacState *s)
+{
+    memset(&s->regs[0], 0, sizeof(s->regs));
+    s->regs[R_CFG1] = 0x80000000;
+    s->regs[R_CFG2] = 0x00007000;
+    s->regs[R_IFG] = 0x40605060;
+    s->regs[R_HALF_DUPLEX] = 0x00A1F037;
+    s->regs[R_FRM_LEN] = 0x00000600;
+
+    msf2_phy_reset(s);
+}
+
+static uint64_t emac_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    MSF2EmacState *s = opaque;
+    uint32_t r = 0;
+
+    addr >>= 2;
+
+    switch (addr) {
+    case R_DMA_IRQ:
+        r = emac_get_isr(s);
+        break;
+    default:
+        if (addr < ARRAY_SIZE(s->regs)) {
+            r = s->regs[addr];
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
+                         addr * 4);
+            return r;
+        }
+        break;
+    }
+    return r;
+}
+
+static void emac_write(void *opaque, hwaddr addr, uint64_t val64,
+        unsigned int size)
+{
+    MSF2EmacState *s = opaque;
+    uint32_t value = val64;
+    uint32_t enreqbits;
+    uint8_t pktcnt;
+
+    addr >>= 2;
+    switch (addr) {
+    case R_DMA_TX_CTL:
+        s->regs[addr] = value;
+        if (value & DMA_TX_CTL_EN) {
+            msf2_dma_tx(s);
+        }
+        break;
+    case R_DMA_RX_CTL:
+        s->regs[addr] = value;
+        if (value & DMA_RX_CTL_EN) {
+            s->rx_desc = s->regs[R_DMA_RX_DESC];
+            qemu_flush_queued_packets(qemu_get_queue(s->nic));
+        }
+        break;
+    case R_CFG1:
+        if (value & CFG1_RESET) {
+            msf2_emac_do_reset(s);
+        }
+    case R_FIFO_CFG0:
+       /*
+        * For our implementation, turning on modules is instantaneous,
+        * so the states requested via the *ENREQ bits appear in the
+        * *ENRPLY bits immediately. Also the reset bits to reset PE-MCXMAC
+        * module are not emulated here since it deals with start of frames,
+        * inter-packet gap and control frames.
+        */
+        enreqbits = extract32(value, 8, 5);
+        value = deposit32(value, 16, 5, enreqbits);
+        s->regs[addr] = value;
+        break;
+    case R_DMA_TX_DESC:
+        if (value & 0x3) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Tx Descriptor address should be"
+                        " 32 bit aligned\n");
+        }
+        /* Ignore [1:0] bits */
+        s->regs[addr] = value & 0xFFFFFFFC;
+        break;
+    case R_DMA_RX_DESC:
+        if (value & 0x3) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Rx Descriptor address should be"
+                        " 32 bit aligned\n");
+        }
+        /* Ignore [1:0] bits */
+        s->regs[addr] = value & 0xFFFFFFFC;
+        break;
+    case R_DMA_TX_STATUS:
+        if (value & DMA_TX_UNDERRUN) {
+            s->regs[addr] &= ~DMA_TX_UNDERRUN;
+        }
+        if (value & R_DMA_PKT_TXRX) {
+            pktcnt = extract32(s->regs[addr], R_DMA_PKTCNT_SHIFT,
+                               R_DMA_PKTCNT_LENGTH);
+            pktcnt--;
+            s->regs[addr] = deposit32(s->regs[addr], R_DMA_PKTCNT_SHIFT,
+                                      8, pktcnt);
+            if (pktcnt == 0) {
+                s->regs[addr] &= ~R_DMA_PKT_TXRX;
+            }
+        }
+        break;
+    case R_DMA_RX_STATUS:
+        if (value & DMA_RX_OVERFLOW) {
+            s->regs[addr] &= ~DMA_RX_OVERFLOW;
+        }
+        if (value & R_DMA_PKT_TXRX) {
+            pktcnt = extract32(s->regs[addr], R_DMA_PKTCNT_SHIFT,
+                               R_DMA_PKTCNT_LENGTH);
+            pktcnt--;
+            s->regs[addr] = deposit32(s->regs[addr], R_DMA_PKTCNT_SHIFT,
+                                      8, pktcnt);
+            if (pktcnt == 0) {
+                s->regs[addr] &= ~R_DMA_PKT_TXRX;
+            }
+        }
+        break;
+    case R_DMA_IRQ:
+        break;
+    case R_MII_CMD:
+        if (value & MII_CMD_READ) {
+            s->regs[R_MII_STS] = read_from_phy(s);
+        }
+        break;
+    case R_MII_CTL:
+        s->regs[addr] = value;
+        write_to_phy(s);
+        break;
+    default:
+        if (addr < ARRAY_SIZE(s->regs)) {
+            s->regs[addr] = value;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
+                         addr * 4);
+            return;
+        }
+        break;
+    }
+    emac_update_irq(s);
+}
+
+static const MemoryRegionOps emac_ops = {
+    .read = emac_read,
+    .write = emac_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static bool emac_can_rx(NetClientState *nc)
+{
+    MSF2EmacState *s = qemu_get_nic_opaque(nc);
+
+    return (s->regs[R_CFG1] & CFG1_RX_EN) &&
+           (s->regs[R_DMA_RX_CTL] & DMA_RX_CTL_EN);
+}
+
+static bool match_addr(MSF2EmacState *s, const uint8_t *buf)
+{
+    /* The broadcast MAC address: FF:FF:FF:FF:FF:FF */
+    static const uint8_t broadcast_addr[] = { 0xFF, 0xFF, 0xFF, 0xFF,
+                                              0xFF, 0xFF };
+    uint8_t addr[6];
+
+    if (!memcmp(buf, broadcast_addr, sizeof(broadcast_addr))) {
+        return true;
+    }
+
+    /*
+     * R_STA1 [31:24] : octet 1 of mac address
+     * R_STA1 [23:16] : octet 2 of mac address
+     *          .
+     *          .
+     * R_STA2 [31:24] : octet 5 of mac address
+     * R_STA2 [23:16] : octet 6 of mac address
+     */
+    stl_le_p(addr, s->regs[R_STA1]);
+    stw_le_p(addr + 4, s->regs[R_STA2] >> 16);
+
+    if (!memcmp(buf, addr, sizeof(addr))) {
+        return false;
+    }
+
+    return true;
+}
+
+static ssize_t emac_rx(NetClientState *nc, const uint8_t *buf, size_t size)
+{
+    MSF2EmacState *s = qemu_get_nic_opaque(nc);
+    EmacDesc d;
+    uint8_t pktcnt;
+    uint32_t status;
+
+    if (size > (s->regs[R_FRM_LEN] & 0xFFFF)) {
+        return -1;
+    }
+    if (!match_addr(s, buf)) {
+        return -1;
+    }
+
+    emac_load_desc(s, &d, s->rx_desc);
+
+    if (d.pktsize & EMPTY_MASK) {
+        address_space_write(&s->dma_as, d.pktaddr, MEMTXATTRS_UNSPECIFIED,
+                            buf, size & PKT_SIZE);
+        d.pktsize = size & PKT_SIZE;
+        emac_store_desc(s, &d, s->rx_desc);
+        /* update received packets count */
+        status = s->regs[R_DMA_RX_STATUS];
+        pktcnt = extract32(status, R_DMA_PKTCNT_SHIFT, 8);
+        pktcnt++;
+        s->regs[R_DMA_RX_STATUS] = deposit32(status, R_DMA_PKTCNT_SHIFT,
+                                             8, pktcnt);
+        s->regs[R_DMA_RX_STATUS] |= R_DMA_PKT_TXRX;
+        s->rx_desc = d.next;
+    } else {
+        s->regs[R_DMA_RX_CTL] &= ~DMA_RX_CTL_EN;
+        s->regs[R_DMA_RX_STATUS] |= DMA_RX_OVERFLOW;
+    }
+    emac_update_irq(s);
+    return size;
+}
+
+static void msf2_emac_reset(DeviceState *dev)
+{
+    MSF2EmacState *s = MSS_EMAC(dev);
+
+    msf2_emac_do_reset(s);
+}
+
+static void emac_set_link(NetClientState *nc)
+{
+    MSF2EmacState *s = qemu_get_nic_opaque(nc);
+
+    msf2_phy_update_link(s);
+}
+
+static NetClientInfo net_msf2_emac_info = {
+    .type = NET_CLIENT_DRIVER_NIC,
+    .size = sizeof(NICState),
+    .can_receive = emac_can_rx,
+    .receive = emac_rx,
+    .link_status_changed = emac_set_link,
+};
+
+static void msf2_emac_realize(DeviceState *dev, Error **errp)
+{
+    MSF2EmacState *s = MSS_EMAC(dev);
+
+    address_space_init(&s->dma_as,
+                       s->dma_mr ? s->dma_mr : get_system_memory(), "dma");
+
+    qemu_macaddr_default_if_unset(&s->conf.macaddr);
+    s->nic = qemu_new_nic(&net_msf2_emac_info, &s->conf,
+                          object_get_typename(OBJECT(dev)), dev->id, s);
+    qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
+}
+
+static void msf2_emac_init(Object *obj)
+{
+    MSF2EmacState *s = MSS_EMAC(obj);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+
+    memory_region_init_io(&s->mmio, obj, &emac_ops, s,
+                          "msf2-emac", R_MAX * 4);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static Property msf2_emac_properties[] = {
+    DEFINE_NIC_PROPERTIES(MSF2EmacState, conf),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static const VMStateDescription vmstate_msf2_emac = {
+    .name = TYPE_MSS_EMAC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(rx_desc, MSF2EmacState),
+        VMSTATE_UINT16_ARRAY(phy_regs, MSF2EmacState, PHY_MAX_REGS),
+        VMSTATE_UINT32_ARRAY(regs, MSF2EmacState, R_MAX),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void msf2_emac_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = msf2_emac_realize;
+    dc->reset = msf2_emac_reset;
+    dc->vmsd = &vmstate_msf2_emac;
+    device_class_set_props(dc, msf2_emac_properties);
+}
+
+static const TypeInfo msf2_emac_info = {
+    .name          = TYPE_MSS_EMAC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MSF2EmacState),
+    .instance_init = msf2_emac_init,
+    .class_init    = msf2_emac_class_init,
+};
+
+static void msf2_emac_register_types(void)
+{
+    type_register_static(&msf2_emac_info);
+}
+
+type_init(msf2_emac_register_types)
diff --git a/include/hw/net/msf2-emac.h b/include/hw/net/msf2-emac.h
new file mode 100644
index 0000000..ab0da62
--- /dev/null
+++ b/include/hw/net/msf2-emac.h
@@ -0,0 +1,50 @@
+/*
+ * QEMU model of the Smartfusion2 Ethernet MAC.
+ *
+ * Copyright (c) 2020 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
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
+#include "hw/sysbus.h"
+#include "net/net.h"
+
+#define TYPE_MSS_EMAC "msf2-emac"
+#define MSS_EMAC(obj) \
+    OBJECT_CHECK(MSF2EmacState, (obj), TYPE_MSS_EMAC)
+
+#define R_MAX         (0x1a0 / 4)
+#define PHY_MAX_REGS  32
+
+typedef struct MSF2EmacState {
+    SysBusDevice parent;
+
+    MemoryRegion mmio;
+    MemoryRegion *dma_mr;
+    AddressSpace dma_as;
+
+    qemu_irq irq;
+    NICState *nic;
+    NICConf conf;
+
+    uint32_t rx_desc;
+    uint16_t phy_regs[PHY_MAX_REGS];
+
+    uint32_t regs[R_MAX];
+} MSF2EmacState;
-- 
2.7.4


