Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D753722F9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:28:29 +0200 (CEST)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldh3E-0001Ug-IU
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpx-0005KE-Gm
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:45 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpv-0000Lb-Am
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080083; x=1651616083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RrNQyF4lIA138SsGfeYfYU4splrBTKmLMP1i5+POM1A=;
 b=mxNudcMZVteutOoKZdlslfeZoaBl8qdtZBkP3P9m2kkDAYpGlzCwelwX
 Sl6pLrj3Tw0Ldj49VjRzpf36aVc93BzUr06ckq6lVecYmxlOrR5usxJjQ
 7vM6iXSx1/FVv6yX9yEvvHGfLChZICoB3l+KqiasYEUxFfqo7GQ4P358O
 IVc5B0uhwW+5NMCepu9jSV30xvN/Bi9eWzKQk4rsG6vfP/gHZbrIuq5nJ
 oF3DwPHVdcnqdyoEF4DIhFL79TOZERAIn3AX4Y1SU5qXhLbNaq0mezGAE
 vK1j5KOriEbUOc1PSXohwL4ZvvmOR8nYxxgaF90SMDdSOatvqnuBNDueJ Q==;
IronPort-SDR: POBfZtFzglix48U/i+QQwKKdpvkSL9JTpSeL0MjYOfjeddTrHagjSid2iJroVyYj9IphTULBxe
 ztrpCWgNQhl0qRgq/ObJLv0TNtUBLoudEXHqbcPrYej25cRl0vCA27Z1+UvWR3yhwVC6bQ/AL8
 IJ6yLZADy38uiORzlu+PjW9zjMOyCx/gbpEXWN1MU4mmLr1UHKkyvrDr7dYcbmSQvkdptmGC6n
 OYqXYRK1gbsI943yOjYmHceLrlxf8HFr/gA2hbkLPLhuM0YRttg15sX44h4/urmoCAP/v2Bsar
 fas=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114643"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:30 +0800
IronPort-SDR: WoyawXFApqVMcv8/2t1cVxpWtqFoXLiyY7DW3YyzrkQM8ZpRoM4Rcj198ws+7+77/yx0atng6q
 +vFuf5jVNd57+svBinx1eNmlQopo8RTHu8A9pXdEbhm5iuZc9PKKtLtZVDwHcDNKkK+7LuxNRC
 9Qgb6YG7NeSUbIVwvdRXRMiRqWORgerrQbiwNfLCE8Db2wb+qr4YeFWdNuSdqLzHfeej4RugJD
 WiJ/zauSRACrrqnOHJpcwPCPsNCevyu8Wr0A4Q6PfWuOpZqyYSsreAIS3tp0jVJAnF8z4bNZGc
 N9G5nsSWUFhk3BkrnzXZQNRE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:41 -0700
IronPort-SDR: KhUFSCd/8wRxVYao9lIxqXRZnTYkdsQCL4GjBMsjaFM6/CiFGnNSnKzNu+tJKjYjQNv9bP8tay
 CxU/C5W52jMK7bztZvxgVutkXQ3MBth266QbmwY9weu6G6Ft7r/MTIA/VG+b5HgffWV9Hzhq7v
 vyB8x4dGuA+4e6XjVsnl2p1riXBEfjdqXnffHU6yUMns/rsG1mZNYLUxC4j5NJinRn46cgzwRD
 3nJ6gZyEIV5y6cHPZ1NVahWCe8HYVLEXJrPhG8c+vbR45q6nY6UkOjG+/mrG5kP4RXlzFCIAXO
 PRM=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:28 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 15/42] hw/opentitan: Update the interrupt layout
Date: Tue,  4 May 2021 08:13:00 +1000
Message-Id: <20210503221327.3068768-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the OpenTitan interrupt layout to match the latest OpenTitan
bitstreams. This involves changing the Ibex PLIC memory layout and the
UART interrupts.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: e92b696f1809c9fa4410da2e9f23c414db5a6960.1617202791.git.alistair.francis@wdc.com
---
 include/hw/riscv/opentitan.h | 16 ++++++++--------
 hw/intc/ibex_plic.c          | 20 ++++++++++----------
 hw/riscv/opentitan.c         |  8 ++++----
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index a5ea3a5e4e..aab9bc9245 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -82,14 +82,14 @@ enum {
 };
 
 enum {
-    IBEX_UART_RX_PARITY_ERR_IRQ = 0x28,
-    IBEX_UART_RX_TIMEOUT_IRQ = 0x27,
-    IBEX_UART_RX_BREAK_ERR_IRQ = 0x26,
-    IBEX_UART_RX_FRAME_ERR_IRQ = 0x25,
-    IBEX_UART_RX_OVERFLOW_IRQ = 0x24,
-    IBEX_UART_TX_EMPTY_IRQ = 0x23,
-    IBEX_UART_RX_WATERMARK_IRQ = 0x22,
-    IBEX_UART_TX_WATERMARK_IRQ = 0x21,
+    IBEX_UART0_RX_PARITY_ERR_IRQ = 8,
+    IBEX_UART0_RX_TIMEOUT_IRQ = 7,
+    IBEX_UART0_RX_BREAK_ERR_IRQ = 6,
+    IBEX_UART0_RX_FRAME_ERR_IRQ = 5,
+    IBEX_UART0_RX_OVERFLOW_IRQ = 4,
+    IBEX_UART0_TX_EMPTY_IRQ = 3,
+    IBEX_UART0_RX_WATERMARK_IRQ = 2,
+    IBEX_UART0_TX_WATERMARK_IRQ = 1,
 };
 
 #endif
diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index c1b72fcab0..edf76e4f61 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -225,23 +225,23 @@ static void ibex_plic_irq_request(void *opaque, int irq, int level)
 
 static Property ibex_plic_properties[] = {
     DEFINE_PROP_UINT32("num-cpus", IbexPlicState, num_cpus, 1),
-    DEFINE_PROP_UINT32("num-sources", IbexPlicState, num_sources, 80),
+    DEFINE_PROP_UINT32("num-sources", IbexPlicState, num_sources, 176),
 
     DEFINE_PROP_UINT32("pending-base", IbexPlicState, pending_base, 0),
-    DEFINE_PROP_UINT32("pending-num", IbexPlicState, pending_num, 3),
+    DEFINE_PROP_UINT32("pending-num", IbexPlicState, pending_num, 6),
 
-    DEFINE_PROP_UINT32("source-base", IbexPlicState, source_base, 0x0c),
-    DEFINE_PROP_UINT32("source-num", IbexPlicState, source_num, 3),
+    DEFINE_PROP_UINT32("source-base", IbexPlicState, source_base, 0x18),
+    DEFINE_PROP_UINT32("source-num", IbexPlicState, source_num, 6),
 
-    DEFINE_PROP_UINT32("priority-base", IbexPlicState, priority_base, 0x18),
-    DEFINE_PROP_UINT32("priority-num", IbexPlicState, priority_num, 80),
+    DEFINE_PROP_UINT32("priority-base", IbexPlicState, priority_base, 0x30),
+    DEFINE_PROP_UINT32("priority-num", IbexPlicState, priority_num, 177),
 
-    DEFINE_PROP_UINT32("enable-base", IbexPlicState, enable_base, 0x200),
-    DEFINE_PROP_UINT32("enable-num", IbexPlicState, enable_num, 3),
+    DEFINE_PROP_UINT32("enable-base", IbexPlicState, enable_base, 0x300),
+    DEFINE_PROP_UINT32("enable-num", IbexPlicState, enable_num, 6),
 
-    DEFINE_PROP_UINT32("threshold-base", IbexPlicState, threshold_base, 0x20c),
+    DEFINE_PROP_UINT32("threshold-base", IbexPlicState, threshold_base, 0x318),
 
-    DEFINE_PROP_UINT32("claim-base", IbexPlicState, claim_base, 0x210),
+    DEFINE_PROP_UINT32("claim-base", IbexPlicState, claim_base, 0x31c),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index e168bffe69..30dca1ee91 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -149,16 +149,16 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart), 0, memmap[IBEX_DEV_UART].base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        0, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_TX_WATERMARK_IRQ));
+                       IBEX_UART0_TX_WATERMARK_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        1, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_RX_WATERMARK_IRQ));
+                       IBEX_UART0_RX_WATERMARK_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        2, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_TX_EMPTY_IRQ));
+                       IBEX_UART0_TX_EMPTY_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart),
                        3, qdev_get_gpio_in(DEVICE(&s->plic),
-                       IBEX_UART_RX_OVERFLOW_IRQ));
+                       IBEX_UART0_RX_OVERFLOW_IRQ));
 
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_DEV_GPIO].base, memmap[IBEX_DEV_GPIO].size);
-- 
2.31.1


