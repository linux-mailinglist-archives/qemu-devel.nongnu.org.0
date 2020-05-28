Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF1D1E6F16
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 00:32:36 +0200 (CEST)
Received: from localhost ([::1]:35814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeR4l-0006xy-CE
	for lists+qemu-devel@lfdr.de; Thu, 28 May 2020 18:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4104b2603=alistair.francis@wdc.com>)
 id 1jeQvy-0003TS-Mw; Thu, 28 May 2020 18:23:30 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:15473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4104b2603=alistair.francis@wdc.com>)
 id 1jeQvx-00064j-6Y; Thu, 28 May 2020 18:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1590704609; x=1622240609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9/aKzwRUwMelxdl0MSf660AguaNfWJ19QIoTXawk/pg=;
 b=YQE+pMuC9fj38qr+4gknPYv3oUF9ZRYzX2IDmwHob4nUm35Dcq1ML/1m
 UWI1kTYTn6UPoK6LNxPd5PEoI6N/JgeaWxERz71ckZUZawvQTfu3cptaA
 Uceos9SleZsIAr6PQD8yGYWAmrFWsWSbmpmubKmxqae8TgSaeQnfm1mKy
 V3blZZdwQUC+a6z0bkNhinDiRl8W7YIOfJQ/PZ0eg218CXVfqCyHVtKAR
 q4v6hH+8ZPouXZ6NKPcys/JWSqWl+Hb0vv4dgJKUkl5nTCyYBypSNxdY4
 YSTzJE60iMxCme8kkjxSl6JvL9VB+Y9xdurFUwSIOHxk/VKsCCAzq37GO Q==;
IronPort-SDR: 3a3iSXxj0DOTwzIYPQEIIbSFKybgLG8iZIzoYqpWU+1cbIfLaVPtY6T043fHEpQrBwdTKoSx4B
 yj/+B2XanvQ3BY7PfYKN9TwjhvZqWpD8PgwlseSKfS5/NHddI2jxtZmHtPN2RwfhzGruAaviMH
 3Ovx/CLl393Y9PZK2OhFIzeZhnnZVt3S25uLZqIYbez/Ao2f23DDjyiAq99/k+EX6+5lvmY6iM
 Frn4qD3JdnOof4tarots/w4eqqgUX++w/0JmWSNJjXLet25EnBFdtkYGNM29JCD/rdtJFTaJpy
 /CM=
X-IronPort-AV: E=Sophos;i="5.73,446,1583164800"; d="scan'208";a="143076008"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 May 2020 06:23:10 +0800
IronPort-SDR: lRNrPPgnzo7mnxvMceSZmexPxOgI9QW0aBOYQ+4zX9W1JEf4L+4PjsTZSplHp+kcOaRwfgLtLo
 VEn1qA5v0hZpAECIrbWVGajd/yROPTbDs=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 15:12:25 -0700
IronPort-SDR: SYH6gAcPbZrIHSKVGl/IeqPD1G3wPEUYr3NUKthp4N8QFTKaQGL2jkwrcO+PPNqshAC4KYFhXE
 Uux3mGV45fVA==
WDCIronportException: Internal
Received: from 6xf7cg2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.57.123])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 May 2020 15:23:10 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 10/11] riscv/opentitan: Connect the UART device
Date: Thu, 28 May 2020 15:14:34 -0700
Message-Id: <5e3af7bd29be725113bf7f55d5026ff446673e05.1590704015.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590704015.git.alistair.francis@wdc.com>
References: <cover.1590704015.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=4104b2603=alistair.francis@wdc.com;
 helo=esa3.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/28 18:23:00
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/riscv/opentitan.h | 13 +++++++++++++
 hw/riscv/opentitan.c         | 24 ++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 76f72905a8..8f29b9cbbf 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -21,6 +21,7 @@
 
 #include "hw/riscv/riscv_hart.h"
 #include "hw/intc/ibex_plic.h"
+#include "hw/char/ibex_uart.h"
 
 #define TYPE_RISCV_IBEX_SOC "riscv.lowrisc.ibex.soc"
 #define RISCV_IBEX_SOC(obj) \
@@ -33,6 +34,7 @@ typedef struct LowRISCIbexSoCState {
     /*< public >*/
     RISCVHartArrayState cpus;
     IbexPlicState plic;
+    IbexUartState uart;
 
     MemoryRegion flash_mem;
     MemoryRegion rom;
@@ -68,4 +70,15 @@ enum {
     IBEX_PADCTRL,
 };
 
+enum {
+    IBEX_UART_RX_PARITY_ERR_IRQ = 0x28,
+    IBEX_UART_RX_TIMEOUT_IRQ = 0x27,
+    IBEX_UART_RX_BREAK_ERR_IRQ = 0x26,
+    IBEX_UART_RX_FRAME_ERR_IRQ = 0x25,
+    IBEX_UART_RX_OVERFLOW_IRQ = 0x24,
+    IBEX_UART_TX_EMPTY_IRQ = 0x23,
+    IBEX_UART_RX_WATERMARK_IRQ = 0x22,
+    IBEX_UART_TX_WATERMARK_IRQ = 0x21,
+};
+
 #endif
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 46a3a93c5e..a8844a870b 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -101,6 +101,9 @@ static void riscv_lowrisc_ibex_soc_init(Object *obj)
 
     sysbus_init_child_obj(obj, "plic", &s->plic,
                           sizeof(s->plic), TYPE_IBEX_PLIC);
+
+    sysbus_init_child_obj(obj, "uart", &s->uart,
+                          sizeof(s->uart), TYPE_IBEX_UART);
 }
 
 static void riscv_lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -142,8 +145,25 @@ static void riscv_lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_mmio_map(busdev, 0, memmap[IBEX_PLIC].base);
 
-    create_unimplemented_device("riscv.lowrisc.ibex.uart",
-        memmap[IBEX_UART].base, memmap[IBEX_UART].size);
+    /* UART */
+    dev = DEVICE(&(s->uart));
+    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
+    object_property_set_bool(OBJECT(&s->uart), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, memmap[IBEX_UART].base);
+    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_UART_TX_WATERMARK_IRQ));
+    sysbus_connect_irq(busdev, 1, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_UART_RX_WATERMARK_IRQ));
+    sysbus_connect_irq(busdev, 2, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_UART_TX_EMPTY_IRQ));
+    sysbus_connect_irq(busdev, 3, qdev_get_gpio_in(DEVICE(&s->plic),
+                       IBEX_UART_RX_OVERFLOW_IRQ));
+
     create_unimplemented_device("riscv.lowrisc.ibex.gpio",
         memmap[IBEX_GPIO].base, memmap[IBEX_GPIO].size);
     create_unimplemented_device("riscv.lowrisc.ibex.spi",
-- 
2.26.2


