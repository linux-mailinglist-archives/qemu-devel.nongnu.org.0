Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154F237A4B9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:39:27 +0200 (CEST)
Received: from localhost ([::1]:47980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPnS-0006h8-4m
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVs-0000bX-SG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:16 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPVp-0006TG-7g
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728471; x=1652264471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CCgwUukf0mol48E+b6OjDya1sHpuv6iWQ9PgPgArBlM=;
 b=BMZ0DY93+XW3tJtTjIgVXNEXkkuSaKC5YQZfPOJ8EFqwxAyOXXcVpL5s
 y3gsYnDtT+XnPV6uB8oEnkGydDIsNUU9PubHDA/M7KWf6h6W+dH1fqph4
 +5WODTXvjSSeuMamQSLeMO2gN3QivG1FFbLUwHRxiotd6J7wchNjVYIIq
 jHb3WAuLJvW0KsxqUMpRoYaKN7rD9r1a+TOniMuyXEipeGZewWs+TV84a
 B1TcVCVZoQt2hgNrhmpsfeuetrUApPQkBN8n9psJhjb9okO9JGmoQRMMQ
 J3I4+yL9r86nphaEuq3OiIuy/aqMs2Yy/di9oTOUvVdKI/bMEX3gfwK2k w==;
IronPort-SDR: jiSxbDcKxRJIKOX1yhObLjGDcQKUl6Dd1XfGBJsPkD0y1p/oPd/fONSo/Ord1Dt+vD+kIhtylg
 pixsoern8lFHqZTZOjZx6gO8lnGtDch0DO/5crDMYWPEZHAoWjGY4kJqYLQ43bVVjieH/sj7AS
 iezQHQ/hJH+LPU3USFf3txxEppXGnAQefqEa7xGtH8fE4piPfFmVlwwSLpfO20widm4hChFIPn
 b5ADPSBC8UAcm3JazVUObjzf3VGZZwL9KsEWIsVk7OY+joqN1UeI6EJwYlg6vQYkjanaIVDQRw
 VbU=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735391"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:20:51 +0800
IronPort-SDR: EmWgKZbXIzRUpXldkuIk9bgKMKCyVX3YkH/MwcGJyEHtcOnyHl1SCr3rGLot1XCtkgdhGbk+fX
 LamhhuY8/fGUwpGHMWD9UBuj2CiZOqygSOpgtEgEfGLoDBRUnPxDP451RTWtuo0/J2or6iaHoc
 NvbgJ/x4okfzIgrov32KJboYJO0WOx8Z+3ZByVbpNyP3uqN6cpV6GpWOryCgZtP3yVQFOxrI2C
 tGJNEhANW1NgjU0dXRB1ASds6XFeIf1tygxWVxobxWE0Z84zrhb18k4YWwRDaEjkBWzPafN7ZJ
 UBCKwKOAAvs/M8skb+WEnK6h
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:00:50 -0700
IronPort-SDR: xOpD93eXPHWFqOOtioJlAYWyaaB1ItWKj0OISja7oWhkGw3y2DLD53wCw5lREmI7tGC7ukLTZi
 Pqk+9v4gu1X0ajTdfFxOF/uX33uKVYMqrQH2sTlwJNRSa8A8b70+pEQYnjvhIJsv4W46Rqkgi1
 qEc4C1ZZ51dguLzT0OZdPsd0Zxxd4JqNELvQY0n5aKeD5DwPfRs4dCFbtZNz9NTY0XUAMjWa1x
 0VqLPkQIgETtAUVKJSZCmyHsRT1QTMWeDT+VovekAja9b8BSTnHw5xHyohZWT15amIh6/CymJV
 5Bk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:20:49 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 15/42] hw/opentitan: Update the interrupt layout
Date: Tue, 11 May 2021 20:19:24 +1000
Message-Id: <20210511101951.165287-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
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
index dc9dea117e..557d73726b 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -148,16 +148,16 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
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


