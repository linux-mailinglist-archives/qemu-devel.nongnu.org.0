Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B731CE76
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:54:05 +0100 (CET)
Received: from localhost ([::1]:60614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3bw-0004yk-PX
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC33T-0000YV-4o
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:27 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32Y-0002Z5-C6
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id v1so13780416wrd.6
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bfU+AGoaB/3f4C3ROicmkkQgxo7JYiTLQwrmJhg6mXE=;
 b=uP2Z4525ISXBsjO9WVVFbBZZtaiebKqgZpQPfnGO0TqzsRJNe+++rjQNdDoRkx7W2X
 9W1LE5FBhn1jyPYkD8N9hWmMZpHZI9YJVCEeFRfOVC2aPVpqr40/ynTxkCFeqClJxmZ5
 NFJvvi0OZOOFAMy0p7oapbVG6bKfv9Lf8DDNQJNLr8FgHWMzKu7Pv+6jEjdqEll/i8Jd
 t+israhSll5UwhZHVj0pyGWeRuKeo9gRCyRF9Xb3G0xmBbERUHSZukMPpEGl3Zv+2T+C
 BsZ2mIugyLpb4oaVD2emSuiT3la2kXhiPlugptedgdrhgaMqBBIK7Ee+gJ79Htc55fuT
 8agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfU+AGoaB/3f4C3ROicmkkQgxo7JYiTLQwrmJhg6mXE=;
 b=UfKVJgZogY85CR92zUQjqcV5/I7Yc7CAY5YqrHZzPHBt0ORJfLTKQ1tbb99igacnyp
 gatoNtubdmGiyMBGa2D+mMDTqa0KPCevhut7kNkmemWm4cdOTwIT0BDFv/bRXrOne79O
 7ecbWLJ31qnxr7Ou1K5gUmR2UGitGM9zYlfCpKbmwL0fwmynjQ77a85v6niQb7+Hz4wW
 lLlt25ahvcFOpX/WmEfBsJNl2m0g9hcv87qM81xVDpIPMRxxP0ShaH0DN7Sudwz8yFu1
 LKHTJuv6eWadF4JVo4isKLDnjXcy8g/myrfR6LA70QctWN669aeDoth8BH6yWrJGJk5y
 Zw9A==
X-Gm-Message-State: AOAM531ccyQgvwiutC3YPYsJT/TUwwkriolqJjdj29EM5wLPds0Sm85X
 IO8w/yFEVGHSnRiISLkn3MfNvboIkcub6g==
X-Google-Smtp-Source: ABdhPJw40+7qBxQIbGrNzqNQQqUaUwSlBdFtB3k1yLBCRnPJPc1nli3NHZLj1FIQFJ2dNT66Bvmeqg==
X-Received: by 2002:adf:c785:: with SMTP id l5mr18393763wrg.234.1613492248805; 
 Tue, 16 Feb 2021 08:17:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/40] hw/net: Add npcm7xx emc model
Date: Tue, 16 Feb 2021 16:16:56 +0000
Message-Id: <20210216161658.29881-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Doug Evans <dje@google.com>

This is a 10/100 ethernet device that has several features.
Only the ones needed by the Linux driver have been implemented.
See npcm7xx_emc.c for a list of unimplemented features.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Doug Evans <dje@google.com>
Message-id: 20210213002520.1374134-2-dje@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/net/npcm7xx_emc.h | 286 ++++++++++++
 hw/net/npcm7xx_emc.c         | 857 +++++++++++++++++++++++++++++++++++
 hw/net/meson.build           |   1 +
 hw/net/trace-events          |  17 +
 4 files changed, 1161 insertions(+)
 create mode 100644 include/hw/net/npcm7xx_emc.h
 create mode 100644 hw/net/npcm7xx_emc.c

diff --git a/include/hw/net/npcm7xx_emc.h b/include/hw/net/npcm7xx_emc.h
new file mode 100644
index 00000000000..eac7f298167
--- /dev/null
+++ b/include/hw/net/npcm7xx_emc.h
@@ -0,0 +1,286 @@
+/*
+ * Nuvoton NPCM7xx EMC Module
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#ifndef NPCM7XX_EMC_H
+#define NPCM7XX_EMC_H
+
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "net/net.h"
+
+/* 32-bit register indices. */
+enum NPCM7xxPWMRegister {
+    /* Control registers. */
+    REG_CAMCMR,
+    REG_CAMEN,
+
+    /* There are 16 CAMn[ML] registers. */
+    REG_CAMM_BASE,
+    REG_CAML_BASE,
+    REG_CAMML_LAST = 0x21,
+
+    REG_TXDLSA = 0x22,
+    REG_RXDLSA,
+    REG_MCMDR,
+    REG_MIID,
+    REG_MIIDA,
+    REG_FFTCR,
+    REG_TSDR,
+    REG_RSDR,
+    REG_DMARFC,
+    REG_MIEN,
+
+    /* Status registers. */
+    REG_MISTA,
+    REG_MGSTA,
+    REG_MPCNT,
+    REG_MRPC,
+    REG_MRPCC,
+    REG_MREPC,
+    REG_DMARFS,
+    REG_CTXDSA,
+    REG_CTXBSA,
+    REG_CRXDSA,
+    REG_CRXBSA,
+
+    NPCM7XX_NUM_EMC_REGS,
+};
+
+/* REG_CAMCMR fields */
+/* Enable CAM Compare */
+#define REG_CAMCMR_ECMP (1 << 4)
+/* Complement CAM Compare */
+#define REG_CAMCMR_CCAM (1 << 3)
+/* Accept Broadcast Packet */
+#define REG_CAMCMR_ABP (1 << 2)
+/* Accept Multicast Packet */
+#define REG_CAMCMR_AMP (1 << 1)
+/* Accept Unicast Packet */
+#define REG_CAMCMR_AUP (1 << 0)
+
+/* REG_MCMDR fields */
+/* Software Reset */
+#define REG_MCMDR_SWR (1 << 24)
+/* Internal Loopback Select */
+#define REG_MCMDR_LBK (1 << 21)
+/* Operation Mode Select */
+#define REG_MCMDR_OPMOD (1 << 20)
+/* Enable MDC Clock Generation */
+#define REG_MCMDR_ENMDC (1 << 19)
+/* Full-Duplex Mode Select */
+#define REG_MCMDR_FDUP (1 << 18)
+/* Enable SQE Checking */
+#define REG_MCMDR_ENSEQ (1 << 17)
+/* Send PAUSE Frame */
+#define REG_MCMDR_SDPZ (1 << 16)
+/* No Defer */
+#define REG_MCMDR_NDEF (1 << 9)
+/* Frame Transmission On */
+#define REG_MCMDR_TXON (1 << 8)
+/* Strip CRC Checksum */
+#define REG_MCMDR_SPCRC (1 << 5)
+/* Accept CRC Error Packet */
+#define REG_MCMDR_AEP (1 << 4)
+/* Accept Control Packet */
+#define REG_MCMDR_ACP (1 << 3)
+/* Accept Runt Packet */
+#define REG_MCMDR_ARP (1 << 2)
+/* Accept Long Packet */
+#define REG_MCMDR_ALP (1 << 1)
+/* Frame Reception On */
+#define REG_MCMDR_RXON (1 << 0)
+
+/* REG_MIEN fields */
+/* Enable Transmit Descriptor Unavailable Interrupt */
+#define REG_MIEN_ENTDU (1 << 23)
+/* Enable Transmit Completion Interrupt */
+#define REG_MIEN_ENTXCP (1 << 18)
+/* Enable Transmit Interrupt */
+#define REG_MIEN_ENTXINTR (1 << 16)
+/* Enable Receive Descriptor Unavailable Interrupt */
+#define REG_MIEN_ENRDU (1 << 10)
+/* Enable Receive Good Interrupt */
+#define REG_MIEN_ENRXGD (1 << 4)
+/* Enable Receive Interrupt */
+#define REG_MIEN_ENRXINTR (1 << 0)
+
+/* REG_MISTA fields */
+/* TODO: Add error fields and support simulated errors? */
+/* Transmit Bus Error Interrupt */
+#define REG_MISTA_TXBERR (1 << 24)
+/* Transmit Descriptor Unavailable Interrupt */
+#define REG_MISTA_TDU (1 << 23)
+/* Transmit Completion Interrupt */
+#define REG_MISTA_TXCP (1 << 18)
+/* Transmit Interrupt */
+#define REG_MISTA_TXINTR (1 << 16)
+/* Receive Bus Error Interrupt */
+#define REG_MISTA_RXBERR (1 << 11)
+/* Receive Descriptor Unavailable Interrupt */
+#define REG_MISTA_RDU (1 << 10)
+/* DMA Early Notification Interrupt */
+#define REG_MISTA_DENI (1 << 9)
+/* Maximum Frame Length Interrupt */
+#define REG_MISTA_DFOI (1 << 8)
+/* Receive Good Interrupt */
+#define REG_MISTA_RXGD (1 << 4)
+/* Packet Too Long Interrupt */
+#define REG_MISTA_PTLE (1 << 3)
+/* Receive Interrupt */
+#define REG_MISTA_RXINTR (1 << 0)
+
+/* REG_MGSTA fields */
+/* Transmission Halted */
+#define REG_MGSTA_TXHA (1 << 11)
+/* Receive Halted */
+#define REG_MGSTA_RXHA (1 << 11)
+
+/* REG_DMARFC fields */
+/* Maximum Receive Frame Length */
+#define REG_DMARFC_RXMS(word) extract32((word), 0, 16)
+
+/* REG MIIDA fields */
+/* Busy Bit */
+#define REG_MIIDA_BUSY (1 << 17)
+
+/* Transmit and receive descriptors */
+typedef struct NPCM7xxEMCTxDesc NPCM7xxEMCTxDesc;
+typedef struct NPCM7xxEMCRxDesc NPCM7xxEMCRxDesc;
+
+struct NPCM7xxEMCTxDesc {
+    uint32_t flags;
+    uint32_t txbsa;
+    uint32_t status_and_length;
+    uint32_t ntxdsa;
+};
+
+struct NPCM7xxEMCRxDesc {
+    uint32_t status_and_length;
+    uint32_t rxbsa;
+    uint32_t reserved;
+    uint32_t nrxdsa;
+};
+
+/* NPCM7xxEMCTxDesc.flags values */
+/* Owner: 0 = cpu, 1 = emc */
+#define TX_DESC_FLAG_OWNER_MASK (1 << 31)
+/* Transmit interrupt enable */
+#define TX_DESC_FLAG_INTEN (1 << 2)
+/* CRC append */
+#define TX_DESC_FLAG_CRCAPP (1 << 1)
+/* Padding enable */
+#define TX_DESC_FLAG_PADEN (1 << 0)
+
+/* NPCM7xxEMCTxDesc.status_and_length values */
+/* Collision count */
+#define TX_DESC_STATUS_CCNT_SHIFT 28
+#define TX_DESC_STATUS_CCNT_BITSIZE 4
+/* SQE error */
+#define TX_DESC_STATUS_SQE (1 << 26)
+/* Transmission paused */
+#define TX_DESC_STATUS_PAU (1 << 25)
+/* P transmission halted */
+#define TX_DESC_STATUS_TXHA (1 << 24)
+/* Late collision */
+#define TX_DESC_STATUS_LC (1 << 23)
+/* Transmission abort */
+#define TX_DESC_STATUS_TXABT (1 << 22)
+/* No carrier sense */
+#define TX_DESC_STATUS_NCS (1 << 21)
+/* Defer exceed */
+#define TX_DESC_STATUS_EXDEF (1 << 20)
+/* Transmission complete */
+#define TX_DESC_STATUS_TXCP (1 << 19)
+/* Transmission deferred */
+#define TX_DESC_STATUS_DEF (1 << 17)
+/* Transmit interrupt */
+#define TX_DESC_STATUS_TXINTR (1 << 16)
+
+#define TX_DESC_PKT_LEN(word) extract32((word), 0, 16)
+
+/* Transmit buffer start address */
+#define TX_DESC_TXBSA(word) ((uint32_t) (word) & ~3u)
+
+/* Next transmit descriptor start address */
+#define TX_DESC_NTXDSA(word) ((uint32_t) (word) & ~3u)
+
+/* NPCM7xxEMCRxDesc.status_and_length values */
+/* Owner: 0b00 = cpu, 0b01 = undefined, 0b10 = emc, 0b11 = undefined */
+#define RX_DESC_STATUS_OWNER_SHIFT 30
+#define RX_DESC_STATUS_OWNER_BITSIZE 2
+#define RX_DESC_STATUS_OWNER_MASK (3 << RX_DESC_STATUS_OWNER_SHIFT)
+/* Runt packet */
+#define RX_DESC_STATUS_RP (1 << 22)
+/* Alignment error */
+#define RX_DESC_STATUS_ALIE (1 << 21)
+/* Frame reception complete */
+#define RX_DESC_STATUS_RXGD (1 << 20)
+/* Packet too long */
+#define RX_DESC_STATUS_PTLE (1 << 19)
+/* CRC error */
+#define RX_DESC_STATUS_CRCE (1 << 17)
+/* Receive interrupt */
+#define RX_DESC_STATUS_RXINTR (1 << 16)
+
+#define RX_DESC_PKT_LEN(word) extract32((word), 0, 16)
+
+/* Receive buffer start address */
+#define RX_DESC_RXBSA(word) ((uint32_t) (word) & ~3u)
+
+/* Next receive descriptor start address */
+#define RX_DESC_NRXDSA(word) ((uint32_t) (word) & ~3u)
+
+/* Minimum packet length, when TX_DESC_FLAG_PADEN is set. */
+#define MIN_PACKET_LENGTH 64
+
+struct NPCM7xxEMCState {
+    /*< private >*/
+    SysBusDevice parent;
+    /*< public >*/
+
+    MemoryRegion iomem;
+
+    qemu_irq tx_irq;
+    qemu_irq rx_irq;
+
+    NICState *nic;
+    NICConf conf;
+
+    /* 0 or 1, for log messages */
+    uint8_t emc_num;
+
+    uint32_t regs[NPCM7XX_NUM_EMC_REGS];
+
+    /*
+     * tx is active. Set to true by TSDR and then switches off when out of
+     * descriptors. If the TXON bit in REG_MCMDR is off then this is off.
+     */
+    bool tx_active;
+
+    /*
+     * rx is active. Set to true by RSDR and then switches off when out of
+     * descriptors. If the RXON bit in REG_MCMDR is off then this is off.
+     */
+    bool rx_active;
+};
+
+typedef struct NPCM7xxEMCState NPCM7xxEMCState;
+
+#define TYPE_NPCM7XX_EMC "npcm7xx-emc"
+#define NPCM7XX_EMC(obj) \
+    OBJECT_CHECK(NPCM7xxEMCState, (obj), TYPE_NPCM7XX_EMC)
+
+#endif /* NPCM7XX_EMC_H */
diff --git a/hw/net/npcm7xx_emc.c b/hw/net/npcm7xx_emc.c
new file mode 100644
index 00000000000..714a742ba7a
--- /dev/null
+++ b/hw/net/npcm7xx_emc.c
@@ -0,0 +1,857 @@
+/*
+ * Nuvoton NPCM7xx EMC Module
+ *
+ * Copyright 2020 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ *
+ * Unsupported/unimplemented features:
+ * - MCMDR.FDUP (full duplex) is ignored, half duplex is not supported
+ * - Only CAM0 is supported, CAM[1-15] are not
+ *   - writes to CAMEN.[1-15] are ignored, these bits always read as zeroes
+ * - MII is not implemented, MIIDA.BUSY and MIID always return zero
+ * - MCMDR.LBK is not implemented
+ * - MCMDR.{OPMOD,ENSQE,AEP,ARP} are not supported
+ * - H/W FIFOs are not supported, MCMDR.FFTCR is ignored
+ * - MGSTA.SQE is not supported
+ * - pause and control frames are not implemented
+ * - MGSTA.CCNT is not supported
+ * - MPCNT, DMARFS are not implemented
+ */
+
+#include "qemu/osdep.h"
+
+/* For crc32 */
+#include <zlib.h>
+
+#include "qemu-common.h"
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "hw/net/npcm7xx_emc.h"
+#include "net/eth.h"
+#include "migration/vmstate.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/units.h"
+#include "sysemu/dma.h"
+#include "trace.h"
+
+#define CRC_LENGTH 4
+
+/*
+ * The maximum size of a (layer 2) ethernet frame as defined by 802.3.
+ * 1518 = 6(dest macaddr) + 6(src macaddr) + 2(proto) + 4(crc) + 1500(payload)
+ * This does not include an additional 4 for the vlan field (802.1q).
+ */
+#define MAX_ETH_FRAME_SIZE 1518
+
+static const char *emc_reg_name(int regno)
+{
+#define REG(name) case REG_ ## name: return #name;
+    switch (regno) {
+    REG(CAMCMR)
+    REG(CAMEN)
+    REG(TXDLSA)
+    REG(RXDLSA)
+    REG(MCMDR)
+    REG(MIID)
+    REG(MIIDA)
+    REG(FFTCR)
+    REG(TSDR)
+    REG(RSDR)
+    REG(DMARFC)
+    REG(MIEN)
+    REG(MISTA)
+    REG(MGSTA)
+    REG(MPCNT)
+    REG(MRPC)
+    REG(MRPCC)
+    REG(MREPC)
+    REG(DMARFS)
+    REG(CTXDSA)
+    REG(CTXBSA)
+    REG(CRXDSA)
+    REG(CRXBSA)
+    case REG_CAMM_BASE + 0: return "CAM0M";
+    case REG_CAML_BASE + 0: return "CAM0L";
+    case REG_CAMM_BASE + 2 ... REG_CAMML_LAST:
+        /* Only CAM0 is supported, fold the others into something simple. */
+        if (regno & 1) {
+            return "CAM<n>L";
+        } else {
+            return "CAM<n>M";
+        }
+    default: return "UNKNOWN";
+    }
+#undef REG
+}
+
+static void emc_reset(NPCM7xxEMCState *emc)
+{
+    trace_npcm7xx_emc_reset(emc->emc_num);
+
+    memset(&emc->regs[0], 0, sizeof(emc->regs));
+
+    /* These regs have non-zero reset values. */
+    emc->regs[REG_TXDLSA] = 0xfffffffc;
+    emc->regs[REG_RXDLSA] = 0xfffffffc;
+    emc->regs[REG_MIIDA] = 0x00900000;
+    emc->regs[REG_FFTCR] = 0x0101;
+    emc->regs[REG_DMARFC] = 0x0800;
+    emc->regs[REG_MPCNT] = 0x7fff;
+
+    emc->tx_active = false;
+    emc->rx_active = false;
+}
+
+static void npcm7xx_emc_reset(DeviceState *dev)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(dev);
+    emc_reset(emc);
+}
+
+static void emc_soft_reset(NPCM7xxEMCState *emc)
+{
+    /*
+     * The docs say at least MCMDR.{LBK,OPMOD} bits are not changed during a
+     * soft reset, but does not go into further detail. For now, KISS.
+     */
+    uint32_t mcmdr = emc->regs[REG_MCMDR];
+    emc_reset(emc);
+    emc->regs[REG_MCMDR] = mcmdr & (REG_MCMDR_LBK | REG_MCMDR_OPMOD);
+
+    qemu_set_irq(emc->tx_irq, 0);
+    qemu_set_irq(emc->rx_irq, 0);
+}
+
+static void emc_set_link(NetClientState *nc)
+{
+    /* Nothing to do yet. */
+}
+
+/* MISTA.TXINTR is the union of the individual bits with their enables. */
+static void emc_update_mista_txintr(NPCM7xxEMCState *emc)
+{
+    /* Only look at the bits we support. */
+    uint32_t mask = (REG_MISTA_TXBERR |
+                     REG_MISTA_TDU |
+                     REG_MISTA_TXCP);
+    if (emc->regs[REG_MISTA] & emc->regs[REG_MIEN] & mask) {
+        emc->regs[REG_MISTA] |= REG_MISTA_TXINTR;
+    } else {
+        emc->regs[REG_MISTA] &= ~REG_MISTA_TXINTR;
+    }
+}
+
+/* MISTA.RXINTR is the union of the individual bits with their enables. */
+static void emc_update_mista_rxintr(NPCM7xxEMCState *emc)
+{
+    /* Only look at the bits we support. */
+    uint32_t mask = (REG_MISTA_RXBERR |
+                     REG_MISTA_RDU |
+                     REG_MISTA_RXGD);
+    if (emc->regs[REG_MISTA] & emc->regs[REG_MIEN] & mask) {
+        emc->regs[REG_MISTA] |= REG_MISTA_RXINTR;
+    } else {
+        emc->regs[REG_MISTA] &= ~REG_MISTA_RXINTR;
+    }
+}
+
+/* N.B. emc_update_mista_txintr must have already been called. */
+static void emc_update_tx_irq(NPCM7xxEMCState *emc)
+{
+    int level = !!(emc->regs[REG_MISTA] &
+                   emc->regs[REG_MIEN] &
+                   REG_MISTA_TXINTR);
+    trace_npcm7xx_emc_update_tx_irq(level);
+    qemu_set_irq(emc->tx_irq, level);
+}
+
+/* N.B. emc_update_mista_rxintr must have already been called. */
+static void emc_update_rx_irq(NPCM7xxEMCState *emc)
+{
+    int level = !!(emc->regs[REG_MISTA] &
+                   emc->regs[REG_MIEN] &
+                   REG_MISTA_RXINTR);
+    trace_npcm7xx_emc_update_rx_irq(level);
+    qemu_set_irq(emc->rx_irq, level);
+}
+
+/* Update IRQ states due to changes in MIEN,MISTA. */
+static void emc_update_irq_from_reg_change(NPCM7xxEMCState *emc)
+{
+    emc_update_mista_txintr(emc);
+    emc_update_tx_irq(emc);
+
+    emc_update_mista_rxintr(emc);
+    emc_update_rx_irq(emc);
+}
+
+static int emc_read_tx_desc(dma_addr_t addr, NPCM7xxEMCTxDesc *desc)
+{
+    if (dma_memory_read(&address_space_memory, addr, desc, sizeof(*desc))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    desc->flags = le32_to_cpu(desc->flags);
+    desc->txbsa = le32_to_cpu(desc->txbsa);
+    desc->status_and_length = le32_to_cpu(desc->status_and_length);
+    desc->ntxdsa = le32_to_cpu(desc->ntxdsa);
+    return 0;
+}
+
+static int emc_write_tx_desc(const NPCM7xxEMCTxDesc *desc, dma_addr_t addr)
+{
+    NPCM7xxEMCTxDesc le_desc;
+
+    le_desc.flags = cpu_to_le32(desc->flags);
+    le_desc.txbsa = cpu_to_le32(desc->txbsa);
+    le_desc.status_and_length = cpu_to_le32(desc->status_and_length);
+    le_desc.ntxdsa = cpu_to_le32(desc->ntxdsa);
+    if (dma_memory_write(&address_space_memory, addr, &le_desc,
+                         sizeof(le_desc))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    return 0;
+}
+
+static int emc_read_rx_desc(dma_addr_t addr, NPCM7xxEMCRxDesc *desc)
+{
+    if (dma_memory_read(&address_space_memory, addr, desc, sizeof(*desc))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    desc->status_and_length = le32_to_cpu(desc->status_and_length);
+    desc->rxbsa = le32_to_cpu(desc->rxbsa);
+    desc->reserved = le32_to_cpu(desc->reserved);
+    desc->nrxdsa = le32_to_cpu(desc->nrxdsa);
+    return 0;
+}
+
+static int emc_write_rx_desc(const NPCM7xxEMCRxDesc *desc, dma_addr_t addr)
+{
+    NPCM7xxEMCRxDesc le_desc;
+
+    le_desc.status_and_length = cpu_to_le32(desc->status_and_length);
+    le_desc.rxbsa = cpu_to_le32(desc->rxbsa);
+    le_desc.reserved = cpu_to_le32(desc->reserved);
+    le_desc.nrxdsa = cpu_to_le32(desc->nrxdsa);
+    if (dma_memory_write(&address_space_memory, addr, &le_desc,
+                         sizeof(le_desc))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to write descriptor @ 0x%"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return -1;
+    }
+    return 0;
+}
+
+static void emc_set_mista(NPCM7xxEMCState *emc, uint32_t flags)
+{
+    trace_npcm7xx_emc_set_mista(flags);
+    emc->regs[REG_MISTA] |= flags;
+    if (extract32(flags, 16, 16)) {
+        emc_update_mista_txintr(emc);
+    }
+    if (extract32(flags, 0, 16)) {
+        emc_update_mista_rxintr(emc);
+    }
+}
+
+static void emc_halt_tx(NPCM7xxEMCState *emc, uint32_t mista_flag)
+{
+    emc->tx_active = false;
+    emc_set_mista(emc, mista_flag);
+}
+
+static void emc_halt_rx(NPCM7xxEMCState *emc, uint32_t mista_flag)
+{
+    emc->rx_active = false;
+    emc_set_mista(emc, mista_flag);
+}
+
+static void emc_set_next_tx_descriptor(NPCM7xxEMCState *emc,
+                                       const NPCM7xxEMCTxDesc *tx_desc,
+                                       uint32_t desc_addr)
+{
+    /* Update the current descriptor, if only to reset the owner flag. */
+    if (emc_write_tx_desc(tx_desc, desc_addr)) {
+        /*
+         * We just read it so this shouldn't generally happen.
+         * Error already reported.
+         */
+        emc_set_mista(emc, REG_MISTA_TXBERR);
+    }
+    emc->regs[REG_CTXDSA] = TX_DESC_NTXDSA(tx_desc->ntxdsa);
+}
+
+static void emc_set_next_rx_descriptor(NPCM7xxEMCState *emc,
+                                       const NPCM7xxEMCRxDesc *rx_desc,
+                                       uint32_t desc_addr)
+{
+    /* Update the current descriptor, if only to reset the owner flag. */
+    if (emc_write_rx_desc(rx_desc, desc_addr)) {
+        /*
+         * We just read it so this shouldn't generally happen.
+         * Error already reported.
+         */
+        emc_set_mista(emc, REG_MISTA_RXBERR);
+    }
+    emc->regs[REG_CRXDSA] = RX_DESC_NRXDSA(rx_desc->nrxdsa);
+}
+
+static void emc_try_send_next_packet(NPCM7xxEMCState *emc)
+{
+    /* Working buffer for sending out packets. Most packets fit in this. */
+#define TX_BUFFER_SIZE 2048
+    uint8_t tx_send_buffer[TX_BUFFER_SIZE];
+    uint32_t desc_addr = TX_DESC_NTXDSA(emc->regs[REG_CTXDSA]);
+    NPCM7xxEMCTxDesc tx_desc;
+    uint32_t next_buf_addr, length;
+    uint8_t *buf;
+    g_autofree uint8_t *malloced_buf = NULL;
+
+    if (emc_read_tx_desc(desc_addr, &tx_desc)) {
+        /* Error reading descriptor, already reported. */
+        emc_halt_tx(emc, REG_MISTA_TXBERR);
+        emc_update_tx_irq(emc);
+        return;
+    }
+
+    /* Nothing we can do if we don't own the descriptor. */
+    if (!(tx_desc.flags & TX_DESC_FLAG_OWNER_MASK)) {
+        trace_npcm7xx_emc_cpu_owned_desc(desc_addr);
+        emc_halt_tx(emc, REG_MISTA_TDU);
+        emc_update_tx_irq(emc);
+        return;
+     }
+
+    /* Give the descriptor back regardless of what happens. */
+    tx_desc.flags &= ~TX_DESC_FLAG_OWNER_MASK;
+    tx_desc.status_and_length &= 0xffff;
+
+    /*
+     * Despite the h/w documentation saying the tx buffer is word aligned,
+     * the linux driver does not word align the buffer. There is value in not
+     * aligning the buffer: See the description of NET_IP_ALIGN in linux
+     * kernel sources.
+     */
+    next_buf_addr = tx_desc.txbsa;
+    emc->regs[REG_CTXBSA] = next_buf_addr;
+    length = TX_DESC_PKT_LEN(tx_desc.status_and_length);
+    buf = &tx_send_buffer[0];
+
+    if (length > sizeof(tx_send_buffer)) {
+        malloced_buf = g_malloc(length);
+        buf = malloced_buf;
+    }
+
+    if (dma_memory_read(&address_space_memory, next_buf_addr, buf, length)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Failed to read packet @ 0x%x\n",
+                      __func__, next_buf_addr);
+        emc_set_mista(emc, REG_MISTA_TXBERR);
+        emc_set_next_tx_descriptor(emc, &tx_desc, desc_addr);
+        emc_update_tx_irq(emc);
+        trace_npcm7xx_emc_tx_done(emc->regs[REG_CTXDSA]);
+        return;
+    }
+
+    if ((tx_desc.flags & TX_DESC_FLAG_PADEN) && (length < MIN_PACKET_LENGTH)) {
+        memset(buf + length, 0, MIN_PACKET_LENGTH - length);
+        length = MIN_PACKET_LENGTH;
+    }
+
+    /* N.B. emc_receive can get called here. */
+    qemu_send_packet(qemu_get_queue(emc->nic), buf, length);
+    trace_npcm7xx_emc_sent_packet(length);
+
+    tx_desc.status_and_length |= TX_DESC_STATUS_TXCP;
+    if (tx_desc.flags & TX_DESC_FLAG_INTEN) {
+        emc_set_mista(emc, REG_MISTA_TXCP);
+    }
+    if (emc->regs[REG_MISTA] & emc->regs[REG_MIEN] & REG_MISTA_TXINTR) {
+        tx_desc.status_and_length |= TX_DESC_STATUS_TXINTR;
+    }
+
+    emc_set_next_tx_descriptor(emc, &tx_desc, desc_addr);
+    emc_update_tx_irq(emc);
+    trace_npcm7xx_emc_tx_done(emc->regs[REG_CTXDSA]);
+}
+
+static bool emc_can_receive(NetClientState *nc)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(qemu_get_nic_opaque(nc));
+
+    bool can_receive = emc->rx_active;
+    trace_npcm7xx_emc_can_receive(can_receive);
+    return can_receive;
+}
+
+/* If result is false then *fail_reason contains the reason. */
+static bool emc_receive_filter1(NPCM7xxEMCState *emc, const uint8_t *buf,
+                                size_t len, const char **fail_reason)
+{
+    eth_pkt_types_e pkt_type = get_eth_packet_type(PKT_GET_ETH_HDR(buf));
+
+    switch (pkt_type) {
+    case ETH_PKT_BCAST:
+        if (emc->regs[REG_CAMCMR] & REG_CAMCMR_CCAM) {
+            return true;
+        } else {
+            *fail_reason = "Broadcast packet disabled";
+            return !!(emc->regs[REG_CAMCMR] & REG_CAMCMR_ABP);
+        }
+    case ETH_PKT_MCAST:
+        if (emc->regs[REG_CAMCMR] & REG_CAMCMR_CCAM) {
+            return true;
+        } else {
+            *fail_reason = "Multicast packet disabled";
+            return !!(emc->regs[REG_CAMCMR] & REG_CAMCMR_AMP);
+        }
+    case ETH_PKT_UCAST: {
+        bool matches;
+        if (emc->regs[REG_CAMCMR] & REG_CAMCMR_AUP) {
+            return true;
+        }
+        matches = ((emc->regs[REG_CAMCMR] & REG_CAMCMR_ECMP) &&
+                   /* We only support one CAM register, CAM0. */
+                   (emc->regs[REG_CAMEN] & (1 << 0)) &&
+                   memcmp(buf, emc->conf.macaddr.a, ETH_ALEN) == 0);
+        if (emc->regs[REG_CAMCMR] & REG_CAMCMR_CCAM) {
+            *fail_reason = "MACADDR matched, comparison complemented";
+            return !matches;
+        } else {
+            *fail_reason = "MACADDR didn't match";
+            return matches;
+        }
+    }
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static bool emc_receive_filter(NPCM7xxEMCState *emc, const uint8_t *buf,
+                               size_t len)
+{
+    const char *fail_reason = NULL;
+    bool ok = emc_receive_filter1(emc, buf, len, &fail_reason);
+    if (!ok) {
+        trace_npcm7xx_emc_packet_filtered_out(fail_reason);
+    }
+    return ok;
+}
+
+static ssize_t emc_receive(NetClientState *nc, const uint8_t *buf, size_t len1)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(qemu_get_nic_opaque(nc));
+    const uint32_t len = len1;
+    size_t max_frame_len;
+    bool long_frame;
+    uint32_t desc_addr;
+    NPCM7xxEMCRxDesc rx_desc;
+    uint32_t crc;
+    uint8_t *crc_ptr;
+    uint32_t buf_addr;
+
+    trace_npcm7xx_emc_receiving_packet(len);
+
+    if (!emc_can_receive(nc)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Unexpected packet\n", __func__);
+        return -1;
+    }
+
+    if (len < ETH_HLEN ||
+        /* Defensive programming: drop unsupportable large packets. */
+        len > 0xffff - CRC_LENGTH) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Dropped frame of %u bytes\n",
+                      __func__, len);
+        return len;
+    }
+
+    /*
+     * DENI is set if EMC received the Length/Type field of the incoming
+     * packet, so it will be set regardless of what happens next.
+     */
+    emc_set_mista(emc, REG_MISTA_DENI);
+
+    if (!emc_receive_filter(emc, buf, len)) {
+        emc_update_rx_irq(emc);
+        return len;
+    }
+
+    /* Huge frames (> DMARFC) are dropped. */
+    max_frame_len = REG_DMARFC_RXMS(emc->regs[REG_DMARFC]);
+    if (len + CRC_LENGTH > max_frame_len) {
+        trace_npcm7xx_emc_packet_dropped(len);
+        emc_set_mista(emc, REG_MISTA_DFOI);
+        emc_update_rx_irq(emc);
+        return len;
+    }
+
+    /*
+     * Long Frames (> MAX_ETH_FRAME_SIZE) are also dropped, unless MCMDR.ALP
+     * is set.
+     */
+    long_frame = false;
+    if (len + CRC_LENGTH > MAX_ETH_FRAME_SIZE) {
+        if (emc->regs[REG_MCMDR] & REG_MCMDR_ALP) {
+            long_frame = true;
+        } else {
+            trace_npcm7xx_emc_packet_dropped(len);
+            emc_set_mista(emc, REG_MISTA_PTLE);
+            emc_update_rx_irq(emc);
+            return len;
+        }
+    }
+
+    desc_addr = RX_DESC_NRXDSA(emc->regs[REG_CRXDSA]);
+    if (emc_read_rx_desc(desc_addr, &rx_desc)) {
+        /* Error reading descriptor, already reported. */
+        emc_halt_rx(emc, REG_MISTA_RXBERR);
+        emc_update_rx_irq(emc);
+        return len;
+    }
+
+    /* Nothing we can do if we don't own the descriptor. */
+    if (!(rx_desc.status_and_length & RX_DESC_STATUS_OWNER_MASK)) {
+        trace_npcm7xx_emc_cpu_owned_desc(desc_addr);
+        emc_halt_rx(emc, REG_MISTA_RDU);
+        emc_update_rx_irq(emc);
+        return len;
+    }
+
+    crc = 0;
+    crc_ptr = (uint8_t *) &crc;
+    if (!(emc->regs[REG_MCMDR] & REG_MCMDR_SPCRC)) {
+        crc = cpu_to_be32(crc32(~0, buf, len));
+    }
+
+    /* Give the descriptor back regardless of what happens. */
+    rx_desc.status_and_length &= ~RX_DESC_STATUS_OWNER_MASK;
+
+    buf_addr = rx_desc.rxbsa;
+    emc->regs[REG_CRXBSA] = buf_addr;
+    if (dma_memory_write(&address_space_memory, buf_addr, buf, len) ||
+        (!(emc->regs[REG_MCMDR] & REG_MCMDR_SPCRC) &&
+         dma_memory_write(&address_space_memory, buf_addr + len, crc_ptr,
+                          4))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bus error writing packet\n",
+                      __func__);
+        emc_set_mista(emc, REG_MISTA_RXBERR);
+        emc_set_next_rx_descriptor(emc, &rx_desc, desc_addr);
+        emc_update_rx_irq(emc);
+        trace_npcm7xx_emc_rx_done(emc->regs[REG_CRXDSA]);
+        return len;
+    }
+
+    trace_npcm7xx_emc_received_packet(len);
+
+    /* Note: We've already verified len+4 <= 0xffff. */
+    rx_desc.status_and_length = len;
+    if (!(emc->regs[REG_MCMDR] & REG_MCMDR_SPCRC)) {
+        rx_desc.status_and_length += 4;
+    }
+    rx_desc.status_and_length |= RX_DESC_STATUS_RXGD;
+    emc_set_mista(emc, REG_MISTA_RXGD);
+
+    if (emc->regs[REG_MISTA] & emc->regs[REG_MIEN] & REG_MISTA_RXINTR) {
+        rx_desc.status_and_length |= RX_DESC_STATUS_RXINTR;
+    }
+    if (long_frame) {
+        rx_desc.status_and_length |= RX_DESC_STATUS_PTLE;
+    }
+
+    emc_set_next_rx_descriptor(emc, &rx_desc, desc_addr);
+    emc_update_rx_irq(emc);
+    trace_npcm7xx_emc_rx_done(emc->regs[REG_CRXDSA]);
+    return len;
+}
+
+static void emc_try_receive_next_packet(NPCM7xxEMCState *emc)
+{
+    if (emc_can_receive(qemu_get_queue(emc->nic))) {
+        qemu_flush_queued_packets(qemu_get_queue(emc->nic));
+    }
+}
+
+static uint64_t npcm7xx_emc_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NPCM7xxEMCState *emc = opaque;
+    uint32_t reg = offset / sizeof(uint32_t);
+    uint32_t result;
+
+    if (reg >= NPCM7XX_NUM_EMC_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    switch (reg) {
+    case REG_MIID:
+        /*
+         * We don't implement MII. For determinism, always return zero as
+         * writes record the last value written for debugging purposes.
+         */
+        qemu_log_mask(LOG_UNIMP, "%s: Read of MIID, returning 0\n", __func__);
+        result = 0;
+        break;
+    case REG_TSDR:
+    case REG_RSDR:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Read of write-only reg, %s/%d\n",
+                      __func__, emc_reg_name(reg), reg);
+        return 0;
+    default:
+        result = emc->regs[reg];
+        break;
+    }
+
+    trace_npcm7xx_emc_reg_read(emc->emc_num, result, emc_reg_name(reg), reg);
+    return result;
+}
+
+static void npcm7xx_emc_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size)
+{
+    NPCM7xxEMCState *emc = opaque;
+    uint32_t reg = offset / sizeof(uint32_t);
+    uint32_t value = v;
+
+    g_assert(size == sizeof(uint32_t));
+
+    if (reg >= NPCM7XX_NUM_EMC_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Invalid offset 0x%04" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    trace_npcm7xx_emc_reg_write(emc->emc_num, emc_reg_name(reg), reg, value);
+
+    switch (reg) {
+    case REG_CAMCMR:
+        emc->regs[reg] = value;
+        break;
+    case REG_CAMEN:
+        /* Only CAM0 is supported, don't pretend otherwise. */
+        if (value & ~1) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Only CAM0 is supported, cannot enable others"
+                          ": 0x%x\n",
+                          __func__, value);
+        }
+        emc->regs[reg] = value & 1;
+        break;
+    case REG_CAMM_BASE + 0:
+        emc->regs[reg] = value;
+        emc->conf.macaddr.a[0] = value >> 24;
+        emc->conf.macaddr.a[1] = value >> 16;
+        emc->conf.macaddr.a[2] = value >> 8;
+        emc->conf.macaddr.a[3] = value >> 0;
+        break;
+    case REG_CAML_BASE + 0:
+        emc->regs[reg] = value;
+        emc->conf.macaddr.a[4] = value >> 24;
+        emc->conf.macaddr.a[5] = value >> 16;
+        break;
+    case REG_MCMDR: {
+        uint32_t prev;
+        if (value & REG_MCMDR_SWR) {
+            emc_soft_reset(emc);
+            /* On h/w the reset happens over multiple cycles. For now KISS. */
+            break;
+        }
+        prev = emc->regs[reg];
+        emc->regs[reg] = value;
+        /* Update tx state. */
+        if (!(prev & REG_MCMDR_TXON) &&
+            (value & REG_MCMDR_TXON)) {
+            emc->regs[REG_CTXDSA] = emc->regs[REG_TXDLSA];
+            /*
+             * Linux kernel turns TX on with CPU still holding descriptor,
+             * which suggests we should wait for a write to TSDR before trying
+             * to send a packet: so we don't send one here.
+             */
+        } else if ((prev & REG_MCMDR_TXON) &&
+                   !(value & REG_MCMDR_TXON)) {
+            emc->regs[REG_MGSTA] |= REG_MGSTA_TXHA;
+        }
+        if (!(value & REG_MCMDR_TXON)) {
+            emc_halt_tx(emc, 0);
+        }
+        /* Update rx state. */
+        if (!(prev & REG_MCMDR_RXON) &&
+            (value & REG_MCMDR_RXON)) {
+            emc->regs[REG_CRXDSA] = emc->regs[REG_RXDLSA];
+        } else if ((prev & REG_MCMDR_RXON) &&
+                   !(value & REG_MCMDR_RXON)) {
+            emc->regs[REG_MGSTA] |= REG_MGSTA_RXHA;
+        }
+        if (!(value & REG_MCMDR_RXON)) {
+            emc_halt_rx(emc, 0);
+        }
+        break;
+    }
+    case REG_TXDLSA:
+    case REG_RXDLSA:
+    case REG_DMARFC:
+    case REG_MIID:
+        emc->regs[reg] = value;
+        break;
+    case REG_MIEN:
+        emc->regs[reg] = value;
+        emc_update_irq_from_reg_change(emc);
+        break;
+    case REG_MISTA:
+        /* Clear the bits that have 1 in "value". */
+        emc->regs[reg] &= ~value;
+        emc_update_irq_from_reg_change(emc);
+        break;
+    case REG_MGSTA:
+        /* Clear the bits that have 1 in "value". */
+        emc->regs[reg] &= ~value;
+        break;
+    case REG_TSDR:
+        if (emc->regs[REG_MCMDR] & REG_MCMDR_TXON) {
+            emc->tx_active = true;
+            /* Keep trying to send packets until we run out. */
+            while (emc->tx_active) {
+                emc_try_send_next_packet(emc);
+            }
+        }
+        break;
+    case REG_RSDR:
+        if (emc->regs[REG_MCMDR] & REG_MCMDR_RXON) {
+            emc->rx_active = true;
+            emc_try_receive_next_packet(emc);
+        }
+        break;
+    case REG_MIIDA:
+        emc->regs[reg] = value & ~REG_MIIDA_BUSY;
+        break;
+    case REG_MRPC:
+    case REG_MRPCC:
+    case REG_MREPC:
+    case REG_CTXDSA:
+    case REG_CTXBSA:
+    case REG_CRXDSA:
+    case REG_CRXBSA:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Write to read-only reg %s/%d\n",
+                      __func__, emc_reg_name(reg), reg);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: Write to unimplemented reg %s/%d\n",
+                      __func__, emc_reg_name(reg), reg);
+        break;
+    }
+}
+
+static const struct MemoryRegionOps npcm7xx_emc_ops = {
+    .read = npcm7xx_emc_read,
+    .write = npcm7xx_emc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void emc_cleanup(NetClientState *nc)
+{
+    /* Nothing to do yet. */
+}
+
+static NetClientInfo net_npcm7xx_emc_info = {
+    .type = NET_CLIENT_DRIVER_NIC,
+    .size = sizeof(NICState),
+    .can_receive = emc_can_receive,
+    .receive = emc_receive,
+    .cleanup = emc_cleanup,
+    .link_status_changed = emc_set_link,
+};
+
+static void npcm7xx_emc_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(emc);
+
+    memory_region_init_io(&emc->iomem, OBJECT(emc), &npcm7xx_emc_ops, emc,
+                          TYPE_NPCM7XX_EMC, 4 * KiB);
+    sysbus_init_mmio(sbd, &emc->iomem);
+    sysbus_init_irq(sbd, &emc->tx_irq);
+    sysbus_init_irq(sbd, &emc->rx_irq);
+
+    qemu_macaddr_default_if_unset(&emc->conf.macaddr);
+    emc->nic = qemu_new_nic(&net_npcm7xx_emc_info, &emc->conf,
+                            object_get_typename(OBJECT(dev)), dev->id, emc);
+    qemu_format_nic_info_str(qemu_get_queue(emc->nic), emc->conf.macaddr.a);
+}
+
+static void npcm7xx_emc_unrealize(DeviceState *dev)
+{
+    NPCM7xxEMCState *emc = NPCM7XX_EMC(dev);
+
+    qemu_del_nic(emc->nic);
+}
+
+static const VMStateDescription vmstate_npcm7xx_emc = {
+    .name = TYPE_NPCM7XX_EMC,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(emc_num, NPCM7xxEMCState),
+        VMSTATE_UINT32_ARRAY(regs, NPCM7xxEMCState, NPCM7XX_NUM_EMC_REGS),
+        VMSTATE_BOOL(tx_active, NPCM7xxEMCState),
+        VMSTATE_BOOL(rx_active, NPCM7xxEMCState),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static Property npcm7xx_emc_properties[] = {
+    DEFINE_NIC_PROPERTIES(NPCM7xxEMCState, conf),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void npcm7xx_emc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+    dc->desc = "NPCM7xx EMC Controller";
+    dc->realize = npcm7xx_emc_realize;
+    dc->unrealize = npcm7xx_emc_unrealize;
+    dc->reset = npcm7xx_emc_reset;
+    dc->vmsd = &vmstate_npcm7xx_emc;
+    device_class_set_props(dc, npcm7xx_emc_properties);
+}
+
+static const TypeInfo npcm7xx_emc_info = {
+    .name = TYPE_NPCM7XX_EMC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NPCM7xxEMCState),
+    .class_init = npcm7xx_emc_class_init,
+};
+
+static void npcm7xx_emc_register_type(void)
+{
+    type_register_static(&npcm7xx_emc_info);
+}
+
+type_init(npcm7xx_emc_register_type)
diff --git a/hw/net/meson.build b/hw/net/meson.build
index 4a7051b54a0..af0749c42bb 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -35,6 +35,7 @@ softmmu_ss.add(when: 'CONFIG_I82596_COMMON', if_true: files('i82596.c'))
 softmmu_ss.add(when: 'CONFIG_SUNHME', if_true: files('sunhme.c'))
 softmmu_ss.add(when: 'CONFIG_FTGMAC100', if_true: files('ftgmac100.c'))
 softmmu_ss.add(when: 'CONFIG_SUNGEM', if_true: files('sungem.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_emc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_eth.c'))
 softmmu_ss.add(when: 'CONFIG_COLDFIRE', if_true: files('mcf_fec.c'))
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 5db45456d92..baf25ffa7e7 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -429,3 +429,20 @@ imx_fec_receive_last(int last) "rx frame flags 0x%04x"
 imx_enet_receive(size_t size) "len %zu"
 imx_enet_receive_len(uint64_t addr, int len) "rx_bd 0x%"PRIx64" length %d"
 imx_enet_receive_last(int last) "rx frame flags 0x%04x"
+
+# npcm7xx_emc.c
+npcm7xx_emc_reset(int emc_num) "Resetting emc%d"
+npcm7xx_emc_update_tx_irq(int level) "Setting tx irq to %d"
+npcm7xx_emc_update_rx_irq(int level) "Setting rx irq to %d"
+npcm7xx_emc_set_mista(uint32_t flags) "ORing 0x%x into MISTA"
+npcm7xx_emc_cpu_owned_desc(uint32_t addr) "Can't process cpu-owned descriptor @0x%x"
+npcm7xx_emc_sent_packet(uint32_t len) "Sent %u byte packet"
+npcm7xx_emc_tx_done(uint32_t ctxdsa) "TX done, CTXDSA=0x%x"
+npcm7xx_emc_can_receive(int can_receive) "Can receive: %d"
+npcm7xx_emc_packet_filtered_out(const char* fail_reason) "Packet filtered out: %s"
+npcm7xx_emc_packet_dropped(uint32_t len) "%u byte packet dropped"
+npcm7xx_emc_receiving_packet(uint32_t len) "Receiving %u byte packet"
+npcm7xx_emc_received_packet(uint32_t len) "Received %u byte packet"
+npcm7xx_emc_rx_done(uint32_t crxdsa) "RX done, CRXDSA=0x%x"
+npcm7xx_emc_reg_read(int emc_num, uint32_t result, const char *name, int regno) "emc%d: 0x%x = reg[%s/%d]"
+npcm7xx_emc_reg_write(int emc_num, const char *name, int regno, uint32_t value) "emc%d: reg[%s/%d] = 0x%x"
-- 
2.20.1


