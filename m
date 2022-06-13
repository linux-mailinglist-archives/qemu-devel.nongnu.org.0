Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD7A548579
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:40:20 +0200 (CEST)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kIk-0002p0-Bq
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5r-0001BM-1E; Mon, 13 Jun 2022 09:26:59 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:58889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5m-0004i9-3j; Mon, 13 Jun 2022 09:26:57 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC5j0S7hz4xD9;
 Mon, 13 Jun 2022 23:26:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC5b5DPBz4yZB;
 Mon, 13 Jun 2022 23:26:43 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 09/17] aspeed: i2c: Use reg array instead of individual vars
Date: Mon, 13 Jun 2022 15:25:31 +0200
Message-Id: <20220613132539.2199772-10-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613132539.2199772-1-clg@kaod.org>
References: <20220613132539.2199772-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joe Komlodi <komlodi@google.com>

Using a register array will allow us to represent old-mode and new-mode
I2C registers by using the same underlying register array, instead of
adding an entire new set of variables to represent new mode.

As part of this, we also do additional cleanup to use ARRAY_FIELD_
macros instead of FIELD_ macros on registers.

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: Ib94996b17c361b8490c042b43c99d8abc69332e3
[ clg: use of memset in aspeed_i2c_bus_reset() ]
Message-Id: <20220331043248.2237838-5-komlodi@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h |  11 +-
 hw/i2c/aspeed_i2c.c         | 281 ++++++++++++++++--------------------
 2 files changed, 128 insertions(+), 164 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 4b9be09274c7..8abb013d219c 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -33,6 +33,7 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 
 #define ASPEED_I2C_NR_BUSSES 16
 #define ASPEED_I2C_MAX_POOL_SIZE 0x800
+#define ASPEED_I2C_OLD_NUM_REG 11
 
 struct AspeedI2CState;
 
@@ -49,15 +50,7 @@ struct AspeedI2CBus {
     uint8_t id;
     qemu_irq irq;
 
-    uint32_t ctrl;
-    uint32_t timing[2];
-    uint32_t intr_ctrl;
-    uint32_t intr_status;
-    uint32_t cmd;
-    uint32_t buf;
-    uint32_t pool_ctrl;
-    uint32_t dma_addr;
-    uint32_t dma_len;
+    uint32_t regs[ASPEED_I2C_OLD_NUM_REG];
 };
 
 struct AspeedI2CState {
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 63d35f874c99..d13866908451 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -133,30 +133,30 @@ REG32(I2CD_DMA_LEN, 0x28) /* DMA Transfer Length < 4KB */
 
 static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
 {
-    return FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL, MASTER_EN);
+    return ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL, MASTER_EN);
 }
 
 static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
 {
-    return FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL, MASTER_EN) ||
-           FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL, SLAVE_EN);
+    return ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL, MASTER_EN) ||
+           ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL, SLAVE_EN);
 }
 
 static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
 
-    trace_aspeed_i2c_bus_raise_interrupt(bus->intr_status,
-        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, TX_NAK) ? "nak|" : "",
-        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, TX_ACK) ? "ack|" : "",
-        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, RX_DONE) ? "done|" : "",
-        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, NORMAL_STOP) ? "normal|"
-                                                                 : "",
-        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, ABNORMAL) ? "abnormal"
-                                                              : "");
-
-    bus->intr_status &= bus->intr_ctrl;
-    if (bus->intr_status) {
+    trace_aspeed_i2c_bus_raise_interrupt(bus->regs[R_I2CD_INTR_STS],
+          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, TX_NAK) ? "nak|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, TX_ACK) ? "ack|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, RX_DONE) ? "done|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, NORMAL_STOP) ? "normal|"
+                                                                  : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, ABNORMAL) ? "abnormal"
+                                                               : "");
+
+    bus->regs[R_I2CD_INTR_STS] &= bus->regs[R_I2CD_INTR_CTRL];
+    if (bus->regs[R_I2CD_INTR_STS]) {
         bus->controller->intr_status |= 1 << bus->id;
         qemu_irq_raise(aic->bus_get_irq(bus));
     }
@@ -167,46 +167,33 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
 {
     AspeedI2CBus *bus = opaque;
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
-    uint64_t value = -1;
+    uint64_t value = bus->regs[offset / sizeof(*bus->regs)];
 
     switch (offset) {
     case A_I2CD_FUN_CTRL:
-        value = bus->ctrl;
-        break;
     case A_I2CD_AC_TIMING1:
-        value = bus->timing[0];
-        break;
     case A_I2CD_AC_TIMING2:
-        value = bus->timing[1];
-        break;
     case A_I2CD_INTR_CTRL:
-        value = bus->intr_ctrl;
-        break;
     case A_I2CD_INTR_STS:
-        value = bus->intr_status;
-        break;
     case A_I2CD_POOL_CTRL:
-        value = bus->pool_ctrl;
-        break;
     case A_I2CD_BYTE_BUF:
-        value = bus->buf;
+        /* Value is already set, don't do anything. */
         break;
     case A_I2CD_CMD:
-        value = bus->cmd | (i2c_bus_busy(bus->bus) << 16);
+        value = FIELD_DP32(value, I2CD_CMD, BUS_BUSY_STS,
+                           i2c_bus_busy(bus->bus));
         break;
     case A_I2CD_DMA_ADDR:
         if (!aic->has_dma) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
-            break;
+            value = -1;
         }
-        value = bus->dma_addr;
         break;
     case A_I2CD_DMA_LEN:
         if (!aic->has_dma) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
-            break;
+            value = -1;
         }
-        value = bus->dma_len;
         break;
 
     default:
@@ -222,12 +209,12 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
 
 static void aspeed_i2c_set_state(AspeedI2CBus *bus, uint8_t state)
 {
-    bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, TX_STATE, state);
+    ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, TX_STATE, state);
 }
 
 static uint8_t aspeed_i2c_get_state(AspeedI2CBus *bus)
 {
-    return FIELD_EX32(bus->cmd, I2CD_CMD, TX_STATE);
+    return ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_STATE);
 }
 
 static int aspeed_i2c_dma_read(AspeedI2CBus *bus, uint8_t *data)
@@ -235,16 +222,16 @@ static int aspeed_i2c_dma_read(AspeedI2CBus *bus, uint8_t *data)
     MemTxResult result;
     AspeedI2CState *s = bus->controller;
 
-    result = address_space_read(&s->dram_as, bus->dma_addr,
+    result = address_space_read(&s->dram_as, bus->regs[R_I2CD_DMA_ADDR],
                                 MEMTXATTRS_UNSPECIFIED, data, 1);
     if (result != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed @%08x\n",
-                      __func__, bus->dma_addr);
+                      __func__, bus->regs[R_I2CD_DMA_ADDR]);
         return -1;
     }
 
-    bus->dma_addr++;
-    bus->dma_len--;
+    bus->regs[R_I2CD_DMA_ADDR]++;
+    bus->regs[R_I2CD_DMA_LEN]--;
     return 0;
 }
 
@@ -253,9 +240,9 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
     int ret = -1;
     int i;
-    int pool_tx_count = FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, TX_COUNT);
+    int pool_tx_count = ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, TX_COUNT);
 
-    if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN)) {
+    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN)) {
         for (i = pool_start; i < pool_tx_count; i++) {
             uint8_t *pool_base = aic->bus_pool_base(bus);
 
@@ -266,21 +253,23 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
                 break;
             }
         }
-        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, TX_BUFF_EN, 0);
-    } else if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN)) {
-        while (bus->dma_len) {
+        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, TX_BUFF_EN, 0);
+    } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN)) {
+        while (bus->regs[R_I2CD_DMA_LEN]) {
             uint8_t data;
             aspeed_i2c_dma_read(bus, &data);
-            trace_aspeed_i2c_bus_send("DMA", bus->dma_len, bus->dma_len, data);
+            trace_aspeed_i2c_bus_send("DMA", bus->regs[R_I2CD_DMA_LEN],
+                                      bus->regs[R_I2CD_DMA_LEN], data);
             ret = i2c_send(bus->bus, data);
             if (ret) {
                 break;
             }
         }
-        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, TX_DMA_EN, 0);
+        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, TX_DMA_EN, 0);
     } else {
-        trace_aspeed_i2c_bus_send("BYTE", pool_start, 1, bus->buf);
-        ret = i2c_send(bus->bus, bus->buf);
+        trace_aspeed_i2c_bus_send("BYTE", pool_start, 1,
+                                  bus->regs[R_I2CD_BYTE_BUF]);
+        ret = i2c_send(bus->bus, bus->regs[R_I2CD_BYTE_BUF]);
     }
 
     return ret;
@@ -292,9 +281,9 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
     uint8_t data;
     int i;
-    int pool_rx_count = FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, RX_COUNT);
+    int pool_rx_count = ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, RX_COUNT);
 
-    if (FIELD_EX32(bus->cmd, I2CD_CMD, RX_BUFF_EN)) {
+    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_BUFF_EN)) {
         uint8_t *pool_base = aic->bus_pool_base(bus);
 
         for (i = 0; i < pool_rx_count; i++) {
@@ -304,32 +293,33 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
         }
 
         /* Update RX count */
-        bus->pool_ctrl = FIELD_DP32(bus->pool_ctrl, I2CD_POOL_CTRL, RX_COUNT,
-                                    i & 0xff);
-        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, RX_BUFF_EN, 0);
-    } else if (FIELD_EX32(bus->cmd, I2CD_CMD, RX_DMA_EN)) {
+        ARRAY_FIELD_DP32(bus->regs, I2CD_POOL_CTRL, RX_COUNT, i & 0xff);
+        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, RX_BUFF_EN, 0);
+    } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_DMA_EN)) {
         uint8_t data;
 
-        while (bus->dma_len) {
+        while (bus->regs[R_I2CD_DMA_LEN]) {
             MemTxResult result;
 
             data = i2c_recv(bus->bus);
-            trace_aspeed_i2c_bus_recv("DMA", bus->dma_len, bus->dma_len, data);
-            result = address_space_write(&s->dram_as, bus->dma_addr,
+            trace_aspeed_i2c_bus_recv("DMA", bus->regs[R_I2CD_DMA_LEN],
+                                      bus->regs[R_I2CD_DMA_LEN], data);
+            result = address_space_write(&s->dram_as,
+                                         bus->regs[R_I2CD_DMA_ADDR],
                                          MEMTXATTRS_UNSPECIFIED, &data, 1);
             if (result != MEMTX_OK) {
                 qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM write failed @%08x\n",
-                              __func__, bus->dma_addr);
+                              __func__, bus->regs[R_I2CD_DMA_ADDR]);
                 return;
             }
-            bus->dma_addr++;
-            bus->dma_len--;
+            bus->regs[R_I2CD_DMA_ADDR]++;
+            bus->regs[R_I2CD_DMA_LEN]--;
         }
-        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, RX_DMA_EN, 0);
+        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, RX_DMA_EN, 0);
     } else {
         data = i2c_recv(bus->bus);
-        trace_aspeed_i2c_bus_recv("BYTE", 1, 1, bus->buf);
-        bus->buf = FIELD_DP32(bus->buf, I2CD_BYTE_BUF, RX_BUF, data);
+        trace_aspeed_i2c_bus_recv("BYTE", 1, 1, bus->regs[R_I2CD_BYTE_BUF]);
+        ARRAY_FIELD_DP32(bus->regs, I2CD_BYTE_BUF, RX_BUF, data);
     }
 }
 
@@ -337,12 +327,12 @@ static void aspeed_i2c_handle_rx_cmd(AspeedI2CBus *bus)
 {
     aspeed_i2c_set_state(bus, I2CD_MRXD);
     aspeed_i2c_bus_recv(bus);
-    bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS, RX_DONE, 1);
-    if (FIELD_EX32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST)) {
+    ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, RX_DONE, 1);
+    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST)) {
         i2c_nack(bus->bus);
     }
-    bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_RX_CMD, 0);
-    bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST, 0);
+    ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_RX_CMD, 0);
+    ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST, 0);
     aspeed_i2c_set_state(bus, I2CD_MACTIVE);
 }
 
@@ -350,17 +340,17 @@ static uint8_t aspeed_i2c_get_addr(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
 
-    if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN)) {
+    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN)) {
         uint8_t *pool_base = aic->bus_pool_base(bus);
 
         return pool_base[0];
-    } else if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN)) {
+    } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN)) {
         uint8_t data;
 
         aspeed_i2c_dma_read(bus, &data);
         return data;
     } else {
-        return bus->buf;
+        return bus->regs[R_I2CD_BYTE_BUF];
     }
 }
 
@@ -368,10 +358,10 @@ static bool aspeed_i2c_check_sram(AspeedI2CBus *bus)
 {
     AspeedI2CState *s = bus->controller;
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
-    bool dma_en = FIELD_EX32(bus->cmd, I2CD_CMD, RX_DMA_EN)  ||
-                  FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN)  ||
-                  FIELD_EX32(bus->cmd, I2CD_CMD, RX_BUFF_EN) ||
-                  FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN);
+    bool dma_en = ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_DMA_EN)  ||
+                  ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN)  ||
+                  ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_BUFF_EN) ||
+                  ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN);
     if (!aic->check_sram) {
         return true;
     }
@@ -392,26 +382,27 @@ static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
 {
     g_autofree char *cmd_flags = NULL;
     uint32_t count;
-    if (FIELD_EX32(bus->cmd, I2CD_CMD, RX_BUFF_EN)) {
-        count = FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, TX_COUNT);
-    } else if (FIELD_EX32(bus->cmd, I2CD_CMD, RX_DMA_EN)) {
-        count = bus->dma_len;
+    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_BUFF_EN)) {
+        count = ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, TX_COUNT);
+    } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_DMA_EN)) {
+        count = bus->regs[R_I2CD_DMA_LEN];
     } else { /* BYTE mode */
         count = 1;
     }
 
     cmd_flags = g_strdup_printf("%s%s%s%s%s%s%s%s%s",
-             FIELD_EX32(bus->cmd, I2CD_CMD, M_START_CMD) ? "start|" : "",
-             FIELD_EX32(bus->cmd, I2CD_CMD, RX_DMA_EN) ? "rxdma|" : "",
-             FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN) ? "txdma|" : "",
-             FIELD_EX32(bus->cmd, I2CD_CMD, RX_BUFF_EN) ? "rxbuf|" : "",
-             FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN) ? "txbuf|" : "",
-             FIELD_EX32(bus->cmd, I2CD_CMD, M_TX_CMD) ? "tx|" : "",
-             FIELD_EX32(bus->cmd, I2CD_CMD, M_RX_CMD) ? "rx|" : "",
-             FIELD_EX32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST) ? "last|" : "",
-             FIELD_EX32(bus->cmd, I2CD_CMD, M_STOP_CMD) ? "stop" : "");
-
-    trace_aspeed_i2c_bus_cmd(bus->cmd, cmd_flags, count, bus->intr_status);
+          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_START_CMD) ? "start|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_DMA_EN) ? "rxdma|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN) ? "txdma|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_BUFF_EN) ? "rxbuf|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN) ? "txbuf|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_TX_CMD) ? "tx|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_RX_CMD) ? "rx|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST) ? "last|" : "",
+          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_STOP_CMD) ? "stop" : "");
+
+    trace_aspeed_i2c_bus_cmd(bus->regs[R_I2CD_CMD], cmd_flags, count,
+                             bus->regs[R_I2CD_INTR_STS]);
 }
 
 /*
@@ -422,8 +413,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 {
     uint8_t pool_start = 0;
 
-    bus->cmd &= ~0xFFFF;
-    bus->cmd |= value & 0xFFFF;
+    bus->regs[R_I2CD_CMD] &= ~0xFFFF;
+    bus->regs[R_I2CD_CMD] |= value & 0xFFFF;
 
     if (!aspeed_i2c_check_sram(bus)) {
         return;
@@ -433,7 +424,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
         aspeed_i2c_bus_cmd_dump(bus);
     }
 
-    if (FIELD_EX32(bus->cmd, I2CD_CMD, M_START_CMD)) {
+    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_START_CMD)) {
         uint8_t state = aspeed_i2c_get_state(bus) & I2CD_MACTIVE ?
             I2CD_MSTARTR : I2CD_MSTART;
         uint8_t addr;
@@ -444,23 +435,21 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 
         if (i2c_start_transfer(bus->bus, extract32(addr, 1, 7),
                                extract32(addr, 0, 1))) {
-            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
-                                          TX_NAK, 1);
+            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, TX_NAK, 1);
         } else {
-            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
-                                          TX_ACK, 1);
+            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, TX_ACK, 1);
         }
 
-        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_START_CMD, 0);
+        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_START_CMD, 0);
 
         /*
          * The START command is also a TX command, as the slave
          * address is sent on the bus. Drop the TX flag if nothing
          * else needs to be sent in this sequence.
          */
-        if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN)) {
-            if (FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, TX_COUNT) == 1) {
-                bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_TX_CMD, 0);
+        if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN)) {
+            if (ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, TX_COUNT) == 1) {
+                ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_TX_CMD, 0);
             } else {
                 /*
                  * Increase the start index in the TX pool buffer to
@@ -468,12 +457,12 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
                  */
                 pool_start++;
             }
-        } else if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN)) {
-            if (bus->dma_len == 0) {
-                bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_TX_CMD, 0);
+        } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN)) {
+            if (bus->regs[R_I2CD_DMA_LEN] == 0) {
+                ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_TX_CMD, 0);
             }
         } else {
-            bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_TX_CMD, 0);
+            ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_TX_CMD, 0);
         }
 
         /* No slave found */
@@ -483,38 +472,34 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
         aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
 
-    if (FIELD_EX32(bus->cmd, I2CD_CMD, M_TX_CMD)) {
+    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_TX_CMD)) {
         aspeed_i2c_set_state(bus, I2CD_MTXD);
         if (aspeed_i2c_bus_send(bus, pool_start)) {
-            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
-                                          TX_NAK, 1);
+            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, TX_NAK, 1);
             i2c_end_transfer(bus->bus);
         } else {
-            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
-                                          TX_ACK, 1);
+            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, TX_ACK, 1);
         }
-        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_TX_CMD, 0);
+        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_TX_CMD, 0);
         aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
 
-    if ((FIELD_EX32(bus->cmd, I2CD_CMD, M_RX_CMD) ||
-         FIELD_EX32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST)) &&
-        !FIELD_EX32(bus->intr_status, I2CD_INTR_STS, RX_DONE)) {
+    if ((ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_RX_CMD) ||
+         ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST)) &&
+        !ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, RX_DONE)) {
         aspeed_i2c_handle_rx_cmd(bus);
     }
 
-    if (FIELD_EX32(bus->cmd, I2CD_CMD, M_STOP_CMD)) {
+    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_STOP_CMD)) {
         if (!(aspeed_i2c_get_state(bus) & I2CD_MACTIVE)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: abnormal stop\n", __func__);
-            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
-                                          ABNORMAL, 1);
+            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, ABNORMAL, 1);
         } else {
             aspeed_i2c_set_state(bus, I2CD_MSTOP);
             i2c_end_transfer(bus->bus);
-            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
-                                          NORMAL_STOP, 1);
+            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, NORMAL_STOP, 1);
         }
-        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_STOP_CMD, 0);
+        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_STOP_CMD, 0);
         aspeed_i2c_set_state(bus, I2CD_IDLE);
     }
 }
@@ -535,27 +520,27 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
                           __func__);
             break;
         }
-        bus->ctrl = value & 0x0071C3FF;
+        bus->regs[R_I2CD_FUN_CTRL] = value & 0x0071C3FF;
         break;
     case A_I2CD_AC_TIMING1:
-        bus->timing[0] = value & 0xFFFFF0F;
+        bus->regs[R_I2CD_AC_TIMING1] = value & 0xFFFFF0F;
         break;
     case A_I2CD_AC_TIMING2:
-        bus->timing[1] = value & 0x7;
+        bus->regs[R_I2CD_AC_TIMING2] = value & 0x7;
         break;
     case A_I2CD_INTR_CTRL:
-        bus->intr_ctrl = value & 0x7FFF;
+        bus->regs[R_I2CD_INTR_CTRL] = value & 0x7FFF;
         break;
     case A_I2CD_INTR_STS:
-        handle_rx = FIELD_EX32(bus->intr_status, I2CD_INTR_STS, RX_DONE) &&
+        handle_rx = ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, RX_DONE) &&
                     FIELD_EX32(value, I2CD_INTR_STS, RX_DONE);
-        bus->intr_status &= ~(value & 0x7FFF);
-        if (!bus->intr_status) {
+        bus->regs[R_I2CD_INTR_STS] &= ~(value & 0x7FFF);
+        if (!bus->regs[R_I2CD_INTR_STS]) {
             bus->controller->intr_status &= ~(1 << bus->id);
             qemu_irq_lower(aic->bus_get_irq(bus));
         }
-        if (handle_rx && (FIELD_EX32(bus->cmd, I2CD_CMD, M_RX_CMD) ||
-                         FIELD_EX32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST))) {
+        if (handle_rx && (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_RX_CMD) ||
+                      ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST))) {
             aspeed_i2c_handle_rx_cmd(bus);
             aspeed_i2c_bus_raise_interrupt(bus);
         }
@@ -565,12 +550,12 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
                       __func__);
         break;
     case A_I2CD_POOL_CTRL:
-        bus->pool_ctrl &= ~0xffffff;
-        bus->pool_ctrl |= (value & 0xffffff);
+        bus->regs[R_I2CD_POOL_CTRL] &= ~0xffffff;
+        bus->regs[R_I2CD_POOL_CTRL] |= (value & 0xffffff);
         break;
 
     case A_I2CD_BYTE_BUF:
-        bus->buf = FIELD_DP32(bus->buf, I2CD_BYTE_BUF, TX_BUF, value);
+        ARRAY_FIELD_DP32(bus->regs, I2CD_BYTE_BUF, TX_BUF, value);
         break;
     case A_I2CD_CMD:
         if (!aspeed_i2c_bus_is_enabled(bus)) {
@@ -599,7 +584,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
             break;
         }
 
-        bus->dma_addr = value & 0x3ffffffc;
+        bus->regs[R_I2CD_DMA_ADDR] = value & 0x3ffffffc;
         break;
 
     case A_I2CD_DMA_LEN:
@@ -608,8 +593,8 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
             break;
         }
 
-        bus->dma_len = value & 0xfff;
-        if (!bus->dma_len) {
+        bus->regs[R_I2CD_DMA_LEN] = value & 0xfff;
+        if (!bus->regs[R_I2CD_DMA_LEN]) {
             qemu_log_mask(LOG_UNIMP, "%s: invalid DMA length\n",  __func__);
         }
         break;
@@ -705,19 +690,10 @@ static const MemoryRegionOps aspeed_i2c_pool_ops = {
 
 static const VMStateDescription aspeed_i2c_bus_vmstate = {
     .name = TYPE_ASPEED_I2C,
-    .version_id = 3,
-    .minimum_version_id = 3,
+    .version_id = 4,
+    .minimum_version_id = 4,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(id, AspeedI2CBus),
-        VMSTATE_UINT32(ctrl, AspeedI2CBus),
-        VMSTATE_UINT32_ARRAY(timing, AspeedI2CBus, 2),
-        VMSTATE_UINT32(intr_ctrl, AspeedI2CBus),
-        VMSTATE_UINT32(intr_status, AspeedI2CBus),
-        VMSTATE_UINT32(cmd, AspeedI2CBus),
-        VMSTATE_UINT32(buf, AspeedI2CBus),
-        VMSTATE_UINT32(pool_ctrl, AspeedI2CBus),
-        VMSTATE_UINT32(dma_addr, AspeedI2CBus),
-        VMSTATE_UINT32(dma_len, AspeedI2CBus),
+        VMSTATE_UINT32_ARRAY(regs, AspeedI2CBus, ASPEED_I2C_OLD_NUM_REG),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -854,12 +830,7 @@ static void aspeed_i2c_bus_reset(DeviceState *dev)
 {
     AspeedI2CBus *s = ASPEED_I2C_BUS(dev);
 
-    s->intr_ctrl = 0;
-    s->intr_status = 0;
-    s->cmd = 0;
-    s->buf = 0;
-    s->dma_addr = 0;
-    s->dma_len = 0;
+    memset(s->regs, 0, sizeof(s->regs));
     i2c_end_transfer(s->bus);
 }
 
@@ -917,10 +888,10 @@ static qemu_irq aspeed_2400_i2c_bus_get_irq(AspeedI2CBus *bus)
 static uint8_t *aspeed_2400_i2c_bus_pool_base(AspeedI2CBus *bus)
 {
     uint8_t *pool_page =
-        &bus->controller->pool[FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL,
-                                          POOL_PAGE_SEL) * 0x100];
+        &bus->controller->pool[ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL,
+                                                POOL_PAGE_SEL) * 0x100];
 
-    return &pool_page[FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, OFFSET)];
+    return &pool_page[ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, OFFSET)];
 }
 
 static void aspeed_2400_i2c_class_init(ObjectClass *klass, void *data)
-- 
2.35.3


