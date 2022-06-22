Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E7E55451E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:11:56 +0200 (CEST)
Received: from localhost ([::1]:60314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xL1-0002Fq-Cb
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5T-0005z3-RZ; Wed, 22 Jun 2022 05:55:51 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:40861
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5Q-0004n0-CJ; Wed, 22 Jun 2022 05:55:51 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSf013QLmz4xZg;
 Wed, 22 Jun 2022 19:55:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdzz30vBz4xD9;
 Wed, 22 Jun 2022 19:55:43 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 08/19] aspeed: i2c: Migrate to registerfields API
Date: Wed, 22 Jun 2022 11:55:09 +0200
Message-Id: <20220622095520.3683321-9-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

This cleans up some of the field accessing, setting, and clearing
bitwise operations, and wraps them in macros instead.

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: I33018d6325fa04376e7c29dc4a49ab389a8e333a
Message-Id: <20220331043248.2237838-4-komlodi@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/i2c/aspeed_i2c.c | 393 ++++++++++++++++++++++----------------------
 1 file changed, 196 insertions(+), 197 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 03a4f5a91010..63d35f874c99 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -28,70 +28,61 @@
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
+#include "hw/registerfields.h"
 #include "trace.h"
 
 /* I2C Global Register */
-
-#define I2C_CTRL_STATUS         0x00        /* Device Interrupt Status */
-#define I2C_CTRL_ASSIGN         0x08        /* Device Interrupt Target
-                                               Assignment */
-#define I2C_CTRL_GLOBAL         0x0C        /* Global Control Register */
-#define   I2C_CTRL_SRAM_EN                 BIT(0)
+REG32(I2C_CTRL_STATUS, 0x0) /* Device Interrupt Status */
+REG32(I2C_CTRL_ASSIGN, 0x8) /* Device Interrupt Target Assignment */
+REG32(I2C_CTRL_GLOBAL, 0xC) /* Global Control Register */
+    FIELD(I2C_CTRL_GLOBAL, SRAM_EN, 0, 1)
 
 /* I2C Device (Bus) Register */
-
-#define I2CD_FUN_CTRL_REG       0x00       /* I2CD Function Control  */
-#define   I2CD_POOL_PAGE_SEL(x)            (((x) >> 20) & 0x7)  /* AST2400 */
-#define   I2CD_M_SDA_LOCK_EN               (0x1 << 16)
-#define   I2CD_MULTI_MASTER_DIS            (0x1 << 15)
-#define   I2CD_M_SCL_DRIVE_EN              (0x1 << 14)
-#define   I2CD_MSB_STS                     (0x1 << 9)
-#define   I2CD_SDA_DRIVE_1T_EN             (0x1 << 8)
-#define   I2CD_M_SDA_DRIVE_1T_EN           (0x1 << 7)
-#define   I2CD_M_HIGH_SPEED_EN             (0x1 << 6)
-#define   I2CD_DEF_ADDR_EN                 (0x1 << 5)
-#define   I2CD_DEF_ALERT_EN                (0x1 << 4)
-#define   I2CD_DEF_ARP_EN                  (0x1 << 3)
-#define   I2CD_DEF_GCALL_EN                (0x1 << 2)
-#define   I2CD_SLAVE_EN                    (0x1 << 1)
-#define   I2CD_MASTER_EN                   (0x1)
-
-#define I2CD_AC_TIMING_REG1     0x04       /* Clock and AC Timing Control #1 */
-#define I2CD_AC_TIMING_REG2     0x08       /* Clock and AC Timing Control #1 */
-#define I2CD_INTR_CTRL_REG      0x0c       /* I2CD Interrupt Control */
-#define I2CD_INTR_STS_REG       0x10       /* I2CD Interrupt Status */
-
-#define   I2CD_INTR_SLAVE_ADDR_MATCH       (0x1 << 31) /* 0: addr1 1: addr2 */
-#define   I2CD_INTR_SLAVE_ADDR_RX_PENDING  (0x1 << 30)
-/* bits[19-16] Reserved */
-
-/* All bits below are cleared by writing 1 */
-#define   I2CD_INTR_SLAVE_INACTIVE_TIMEOUT (0x1 << 15)
-#define   I2CD_INTR_SDA_DL_TIMEOUT         (0x1 << 14)
-#define   I2CD_INTR_BUS_RECOVER_DONE       (0x1 << 13)
-#define   I2CD_INTR_SMBUS_ALERT            (0x1 << 12) /* Bus [0-3] only */
-#define   I2CD_INTR_SMBUS_ARP_ADDR         (0x1 << 11) /* Removed */
-#define   I2CD_INTR_SMBUS_DEV_ALERT_ADDR   (0x1 << 10) /* Removed */
-#define   I2CD_INTR_SMBUS_DEF_ADDR         (0x1 << 9)  /* Removed */
-#define   I2CD_INTR_GCALL_ADDR             (0x1 << 8)  /* Removed */
-#define   I2CD_INTR_SLAVE_ADDR_RX_MATCH    (0x1 << 7)  /* use RX_DONE */
-#define   I2CD_INTR_SCL_TIMEOUT            (0x1 << 6)
-#define   I2CD_INTR_ABNORMAL               (0x1 << 5)
-#define   I2CD_INTR_NORMAL_STOP            (0x1 << 4)
-#define   I2CD_INTR_ARBIT_LOSS             (0x1 << 3)
-#define   I2CD_INTR_RX_DONE                (0x1 << 2)
-#define   I2CD_INTR_TX_NAK                 (0x1 << 1)
-#define   I2CD_INTR_TX_ACK                 (0x1 << 0)
-
-#define I2CD_CMD_REG            0x14       /* I2CD Command/Status */
-#define   I2CD_SDA_OE                      (0x1 << 28)
-#define   I2CD_SDA_O                       (0x1 << 27)
-#define   I2CD_SCL_OE                      (0x1 << 26)
-#define   I2CD_SCL_O                       (0x1 << 25)
-#define   I2CD_TX_TIMING                   (0x1 << 24)
-#define   I2CD_TX_STATUS                   (0x1 << 23)
-
-#define   I2CD_TX_STATE_SHIFT              19 /* Tx State Machine */
+REG32(I2CD_FUN_CTRL, 0x0) /* I2CD Function Control  */
+    FIELD(I2CD_FUN_CTRL, POOL_PAGE_SEL, 20, 3) /* AST2400 */
+    FIELD(I2CD_FUN_CTRL, M_SDA_LOCK_EN, 16, 1)
+    FIELD(I2CD_FUN_CTRL, MULTI_MASTER_DIS, 15, 1)
+    FIELD(I2CD_FUN_CTRL, M_SCL_DRIVE_EN, 14, 1)
+    FIELD(I2CD_FUN_CTRL, MSB_STS, 9, 1)
+    FIELD(I2CD_FUN_CTRL, SDA_DRIVE_IT_EN, 8, 1)
+    FIELD(I2CD_FUN_CTRL, M_SDA_DRIVE_IT_EN, 7, 1)
+    FIELD(I2CD_FUN_CTRL, M_HIGH_SPEED_EN, 6, 1)
+    FIELD(I2CD_FUN_CTRL, DEF_ADDR_EN, 5, 1)
+    FIELD(I2CD_FUN_CTRL, DEF_ALERT_EN, 4, 1)
+    FIELD(I2CD_FUN_CTRL, DEF_ARP_EN, 3, 1)
+    FIELD(I2CD_FUN_CTRL, DEF_GCALL_EN, 2, 1)
+    FIELD(I2CD_FUN_CTRL, SLAVE_EN, 1, 1)
+    FIELD(I2CD_FUN_CTRL, MASTER_EN, 0, 1)
+REG32(I2CD_AC_TIMING1, 0x04) /* Clock and AC Timing Control #1 */
+REG32(I2CD_AC_TIMING2, 0x08) /* Clock and AC Timing Control #2 */
+REG32(I2CD_INTR_CTRL, 0x0C)  /* I2CD Interrupt Control */
+REG32(I2CD_INTR_STS, 0x10)   /* I2CD Interrupt Status */
+    FIELD(I2CD_INTR_STS, SLAVE_ADDR_MATCH, 31, 1)    /* 0: addr1 1: addr2 */
+    FIELD(I2CD_INTR_STS, SLAVE_ADDR_RX_PENDING, 29, 1)
+    FIELD(I2CD_INTR_STS, SLAVE_INACTIVE_TIMEOUT, 15, 1)
+    FIELD(I2CD_INTR_STS, SDA_DL_TIMEOUT, 14, 1)
+    FIELD(I2CD_INTR_STS, BUS_RECOVER_DONE, 13, 1)
+    FIELD(I2CD_INTR_STS, SMBUS_ALERT, 12, 1)            /* Bus [0-3] only */
+    FIELD(I2CD_INTR_STS, SMBUS_ARP_ADDR, 11, 1)         /* Removed */
+    FIELD(I2CD_INTR_STS, SMBUS_DEV_ALERT_ADDR, 10, 1)   /* Removed */
+    FIELD(I2CD_INTR_STS, SMBUS_DEF_ADDR, 9, 1)          /* Removed */
+    FIELD(I2CD_INTR_STS, GCALL_ADDR, 8, 1)              /* Removed */
+    FIELD(I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)     /* use RX_DONE */
+    FIELD(I2CD_INTR_STS, SCL_TIMEOUT, 6, 1)
+    FIELD(I2CD_INTR_STS, ABNORMAL, 5, 1)
+    FIELD(I2CD_INTR_STS, NORMAL_STOP, 4, 1)
+    FIELD(I2CD_INTR_STS, ARBIT_LOSS, 3, 1)
+    FIELD(I2CD_INTR_STS, RX_DONE, 2, 1)
+    FIELD(I2CD_INTR_STS, TX_NAK, 1, 1)
+    FIELD(I2CD_INTR_STS, TX_ACK, 0, 1)
+REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
+    FIELD(I2CD_CMD, SDA_OE, 28, 1)
+    FIELD(I2CD_CMD, SDA_O, 27, 1)
+    FIELD(I2CD_CMD, SCL_OE, 26, 1)
+    FIELD(I2CD_CMD, SCL_O, 25, 1)
+    FIELD(I2CD_CMD, TX_TIMING, 23, 2)
+    FIELD(I2CD_CMD, TX_STATE, 19, 4)
+/* Tx State Machine */
 #define   I2CD_TX_STATE_MASK                  0xf
 #define     I2CD_IDLE                         0x0
 #define     I2CD_MACTIVE                      0x8
@@ -108,51 +99,47 @@
 #define     I2CD_STXD                         0x6
 #define     I2CD_SRXACK                       0x7
 #define     I2CD_RECOVER                      0x3
-
-#define   I2CD_SCL_LINE_STS                (0x1 << 18)
-#define   I2CD_SDA_LINE_STS                (0x1 << 17)
-#define   I2CD_BUS_BUSY_STS                (0x1 << 16)
-#define   I2CD_SDA_OE_OUT_DIR              (0x1 << 15)
-#define   I2CD_SDA_O_OUT_DIR               (0x1 << 14)
-#define   I2CD_SCL_OE_OUT_DIR              (0x1 << 13)
-#define   I2CD_SCL_O_OUT_DIR               (0x1 << 12)
-#define   I2CD_BUS_RECOVER_CMD_EN          (0x1 << 11)
-#define   I2CD_S_ALT_EN                    (0x1 << 10)
-
-/* Command Bit */
-#define   I2CD_RX_DMA_ENABLE               (0x1 << 9)
-#define   I2CD_TX_DMA_ENABLE               (0x1 << 8)
-#define   I2CD_RX_BUFF_ENABLE              (0x1 << 7)
-#define   I2CD_TX_BUFF_ENABLE              (0x1 << 6)
-#define   I2CD_M_STOP_CMD                  (0x1 << 5)
-#define   I2CD_M_S_RX_CMD_LAST             (0x1 << 4)
-#define   I2CD_M_RX_CMD                    (0x1 << 3)
-#define   I2CD_S_TX_CMD                    (0x1 << 2)
-#define   I2CD_M_TX_CMD                    (0x1 << 1)
-#define   I2CD_M_START_CMD                 (0x1)
-
-#define I2CD_DEV_ADDR_REG       0x18       /* Slave Device Address */
-#define I2CD_POOL_CTRL_REG      0x1c       /* Pool Buffer Control */
-#define   I2CD_POOL_RX_COUNT(x)            (((x) >> 24) & 0xff)
-#define   I2CD_POOL_RX_SIZE(x)             ((((x) >> 16) & 0xff) + 1)
-#define   I2CD_POOL_TX_COUNT(x)            ((((x) >> 8) & 0xff) + 1)
-#define   I2CD_POOL_OFFSET(x)              (((x) & 0x3f) << 2)  /* AST2400 */
-#define I2CD_BYTE_BUF_REG       0x20       /* Transmit/Receive Byte Buffer */
-#define   I2CD_BYTE_BUF_TX_SHIFT           0
-#define   I2CD_BYTE_BUF_TX_MASK            0xff
-#define   I2CD_BYTE_BUF_RX_SHIFT           8
-#define   I2CD_BYTE_BUF_RX_MASK            0xff
-#define I2CD_DMA_ADDR           0x24       /* DMA Buffer Address */
-#define I2CD_DMA_LEN            0x28       /* DMA Transfer Length < 4KB */
+    FIELD(I2CD_CMD, SCL_LINE_STS, 18, 1)
+    FIELD(I2CD_CMD, SDA_LINE_STS, 17, 1)
+    FIELD(I2CD_CMD, BUS_BUSY_STS, 16, 1)
+    FIELD(I2CD_CMD, SDA_OE_OUT_DIR, 15, 1)
+    FIELD(I2CD_CMD, SDA_O_OUT_DIR, 14, 1)
+    FIELD(I2CD_CMD, SCL_OE_OUT_DIR, 13, 1)
+    FIELD(I2CD_CMD, SCL_O_OUT_DIR, 12, 1)
+    FIELD(I2CD_CMD, BUS_RECOVER_CMD_EN, 11, 1)
+    FIELD(I2CD_CMD, S_ALT_EN, 10, 1)
+    /* Command Bits */
+    FIELD(I2CD_CMD, RX_DMA_EN, 9, 1)
+    FIELD(I2CD_CMD, TX_DMA_EN, 8, 1)
+    FIELD(I2CD_CMD, RX_BUFF_EN, 7, 1)
+    FIELD(I2CD_CMD, TX_BUFF_EN, 6, 1)
+    FIELD(I2CD_CMD, M_STOP_CMD, 5, 1)
+    FIELD(I2CD_CMD, M_S_RX_CMD_LAST, 4, 1)
+    FIELD(I2CD_CMD, M_RX_CMD, 3, 1)
+    FIELD(I2CD_CMD, S_TX_CMD, 2, 1)
+    FIELD(I2CD_CMD, M_TX_CMD, 1, 1)
+    FIELD(I2CD_CMD, M_START_CMD, 0, 1)
+REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
+REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
+    FIELD(I2CD_POOL_CTRL, RX_COUNT, 24, 5)
+    FIELD(I2CD_POOL_CTRL, RX_SIZE, 16, 5)
+    FIELD(I2CD_POOL_CTRL, TX_COUNT, 9, 5)
+    FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
+REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
+    FIELD(I2CD_BYTE_BUF, RX_BUF, 8, 8)
+    FIELD(I2CD_BYTE_BUF, TX_BUF, 0, 8)
+REG32(I2CD_DMA_ADDR, 0x24) /* DMA Buffer Address */
+REG32(I2CD_DMA_LEN, 0x28) /* DMA Transfer Length < 4KB */
 
 static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
 {
-    return bus->ctrl & I2CD_MASTER_EN;
+    return FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL, MASTER_EN);
 }
 
 static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
 {
-    return bus->ctrl & (I2CD_MASTER_EN | I2CD_SLAVE_EN);
+    return FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL, MASTER_EN) ||
+           FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL, SLAVE_EN);
 }
 
 static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
@@ -160,11 +147,13 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
 
     trace_aspeed_i2c_bus_raise_interrupt(bus->intr_status,
-          bus->intr_status & I2CD_INTR_TX_NAK ? "nak|" : "",
-          bus->intr_status & I2CD_INTR_TX_ACK ? "ack|" : "",
-          bus->intr_status & I2CD_INTR_RX_DONE ? "done|" : "",
-          bus->intr_status & I2CD_INTR_NORMAL_STOP ? "normal|" : "",
-          bus->intr_status & I2CD_INTR_ABNORMAL ? "abnormal" : "");
+        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, TX_NAK) ? "nak|" : "",
+        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, TX_ACK) ? "ack|" : "",
+        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, RX_DONE) ? "done|" : "",
+        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, NORMAL_STOP) ? "normal|"
+                                                                 : "",
+        FIELD_EX32(bus->intr_status, I2CD_INTR_STS, ABNORMAL) ? "abnormal"
+                                                              : "");
 
     bus->intr_status &= bus->intr_ctrl;
     if (bus->intr_status) {
@@ -181,38 +170,38 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
     uint64_t value = -1;
 
     switch (offset) {
-    case I2CD_FUN_CTRL_REG:
+    case A_I2CD_FUN_CTRL:
         value = bus->ctrl;
         break;
-    case I2CD_AC_TIMING_REG1:
+    case A_I2CD_AC_TIMING1:
         value = bus->timing[0];
         break;
-    case I2CD_AC_TIMING_REG2:
+    case A_I2CD_AC_TIMING2:
         value = bus->timing[1];
         break;
-    case I2CD_INTR_CTRL_REG:
+    case A_I2CD_INTR_CTRL:
         value = bus->intr_ctrl;
         break;
-    case I2CD_INTR_STS_REG:
+    case A_I2CD_INTR_STS:
         value = bus->intr_status;
         break;
-    case I2CD_POOL_CTRL_REG:
+    case A_I2CD_POOL_CTRL:
         value = bus->pool_ctrl;
         break;
-    case I2CD_BYTE_BUF_REG:
+    case A_I2CD_BYTE_BUF:
         value = bus->buf;
         break;
-    case I2CD_CMD_REG:
+    case A_I2CD_CMD:
         value = bus->cmd | (i2c_bus_busy(bus->bus) << 16);
         break;
-    case I2CD_DMA_ADDR:
+    case A_I2CD_DMA_ADDR:
         if (!aic->has_dma) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
             break;
         }
         value = bus->dma_addr;
         break;
-    case I2CD_DMA_LEN:
+    case A_I2CD_DMA_LEN:
         if (!aic->has_dma) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
             break;
@@ -233,13 +222,12 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
 
 static void aspeed_i2c_set_state(AspeedI2CBus *bus, uint8_t state)
 {
-    bus->cmd &= ~(I2CD_TX_STATE_MASK << I2CD_TX_STATE_SHIFT);
-    bus->cmd |= (state & I2CD_TX_STATE_MASK) << I2CD_TX_STATE_SHIFT;
+    bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, TX_STATE, state);
 }
 
 static uint8_t aspeed_i2c_get_state(AspeedI2CBus *bus)
 {
-    return (bus->cmd >> I2CD_TX_STATE_SHIFT) & I2CD_TX_STATE_MASK;
+    return FIELD_EX32(bus->cmd, I2CD_CMD, TX_STATE);
 }
 
 static int aspeed_i2c_dma_read(AspeedI2CBus *bus, uint8_t *data)
@@ -265,21 +253,21 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
     int ret = -1;
     int i;
+    int pool_tx_count = FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, TX_COUNT);
 
-    if (bus->cmd & I2CD_TX_BUFF_ENABLE) {
-        for (i = pool_start; i < I2CD_POOL_TX_COUNT(bus->pool_ctrl); i++) {
+    if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN)) {
+        for (i = pool_start; i < pool_tx_count; i++) {
             uint8_t *pool_base = aic->bus_pool_base(bus);
 
-            trace_aspeed_i2c_bus_send("BUF", i + 1,
-                                      I2CD_POOL_TX_COUNT(bus->pool_ctrl),
+            trace_aspeed_i2c_bus_send("BUF", i + 1, pool_tx_count,
                                       pool_base[i]);
             ret = i2c_send(bus->bus, pool_base[i]);
             if (ret) {
                 break;
             }
         }
-        bus->cmd &= ~I2CD_TX_BUFF_ENABLE;
-    } else if (bus->cmd & I2CD_TX_DMA_ENABLE) {
+        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, TX_BUFF_EN, 0);
+    } else if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN)) {
         while (bus->dma_len) {
             uint8_t data;
             aspeed_i2c_dma_read(bus, &data);
@@ -289,7 +277,7 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
                 break;
             }
         }
-        bus->cmd &= ~I2CD_TX_DMA_ENABLE;
+        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, TX_DMA_EN, 0);
     } else {
         trace_aspeed_i2c_bus_send("BYTE", pool_start, 1, bus->buf);
         ret = i2c_send(bus->bus, bus->buf);
@@ -304,22 +292,22 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
     uint8_t data;
     int i;
+    int pool_rx_count = FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, RX_COUNT);
 
-    if (bus->cmd & I2CD_RX_BUFF_ENABLE) {
+    if (FIELD_EX32(bus->cmd, I2CD_CMD, RX_BUFF_EN)) {
         uint8_t *pool_base = aic->bus_pool_base(bus);
 
-        for (i = 0; i < I2CD_POOL_RX_SIZE(bus->pool_ctrl); i++) {
+        for (i = 0; i < pool_rx_count; i++) {
             pool_base[i] = i2c_recv(bus->bus);
-            trace_aspeed_i2c_bus_recv("BUF", i + 1,
-                                      I2CD_POOL_RX_SIZE(bus->pool_ctrl),
+            trace_aspeed_i2c_bus_recv("BUF", i + 1, pool_rx_count,
                                       pool_base[i]);
         }
 
         /* Update RX count */
-        bus->pool_ctrl &= ~(0xff << 24);
-        bus->pool_ctrl |= (i & 0xff) << 24;
-        bus->cmd &= ~I2CD_RX_BUFF_ENABLE;
-    } else if (bus->cmd & I2CD_RX_DMA_ENABLE) {
+        bus->pool_ctrl = FIELD_DP32(bus->pool_ctrl, I2CD_POOL_CTRL, RX_COUNT,
+                                    i & 0xff);
+        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, RX_BUFF_EN, 0);
+    } else if (FIELD_EX32(bus->cmd, I2CD_CMD, RX_DMA_EN)) {
         uint8_t data;
 
         while (bus->dma_len) {
@@ -337,11 +325,11 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
             bus->dma_addr++;
             bus->dma_len--;
         }
-        bus->cmd &= ~I2CD_RX_DMA_ENABLE;
+        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, RX_DMA_EN, 0);
     } else {
         data = i2c_recv(bus->bus);
         trace_aspeed_i2c_bus_recv("BYTE", 1, 1, bus->buf);
-        bus->buf = (data & I2CD_BYTE_BUF_RX_MASK) << I2CD_BYTE_BUF_RX_SHIFT;
+        bus->buf = FIELD_DP32(bus->buf, I2CD_BYTE_BUF, RX_BUF, data);
     }
 }
 
@@ -349,11 +337,12 @@ static void aspeed_i2c_handle_rx_cmd(AspeedI2CBus *bus)
 {
     aspeed_i2c_set_state(bus, I2CD_MRXD);
     aspeed_i2c_bus_recv(bus);
-    bus->intr_status |= I2CD_INTR_RX_DONE;
-    if (bus->cmd & I2CD_M_S_RX_CMD_LAST) {
+    bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS, RX_DONE, 1);
+    if (FIELD_EX32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST)) {
         i2c_nack(bus->bus);
     }
-    bus->cmd &= ~(I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST);
+    bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_RX_CMD, 0);
+    bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST, 0);
     aspeed_i2c_set_state(bus, I2CD_MACTIVE);
 }
 
@@ -361,11 +350,11 @@ static uint8_t aspeed_i2c_get_addr(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
 
-    if (bus->cmd & I2CD_TX_BUFF_ENABLE) {
+    if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN)) {
         uint8_t *pool_base = aic->bus_pool_base(bus);
 
         return pool_base[0];
-    } else if (bus->cmd & I2CD_TX_DMA_ENABLE) {
+    } else if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN)) {
         uint8_t data;
 
         aspeed_i2c_dma_read(bus, &data);
@@ -379,7 +368,10 @@ static bool aspeed_i2c_check_sram(AspeedI2CBus *bus)
 {
     AspeedI2CState *s = bus->controller;
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
-
+    bool dma_en = FIELD_EX32(bus->cmd, I2CD_CMD, RX_DMA_EN)  ||
+                  FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN)  ||
+                  FIELD_EX32(bus->cmd, I2CD_CMD, RX_BUFF_EN) ||
+                  FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN);
     if (!aic->check_sram) {
         return true;
     }
@@ -388,9 +380,7 @@ static bool aspeed_i2c_check_sram(AspeedI2CBus *bus)
      * AST2500: SRAM must be enabled before using the Buffer Pool or
      * DMA mode.
      */
-    if (!(s->ctrl_global & I2C_CTRL_SRAM_EN) &&
-        (bus->cmd & (I2CD_RX_DMA_ENABLE | I2CD_TX_DMA_ENABLE |
-                     I2CD_RX_BUFF_ENABLE | I2CD_TX_BUFF_ENABLE))) {
+    if (!FIELD_EX32(s->ctrl_global, I2C_CTRL_GLOBAL, SRAM_EN) && dma_en) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: SRAM is not enabled\n", __func__);
         return false;
     }
@@ -402,25 +392,24 @@ static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
 {
     g_autofree char *cmd_flags = NULL;
     uint32_t count;
-
-    if (bus->cmd & (I2CD_RX_BUFF_ENABLE | I2CD_RX_BUFF_ENABLE)) {
-        count = I2CD_POOL_TX_COUNT(bus->pool_ctrl);
-    } else if (bus->cmd & (I2CD_RX_DMA_ENABLE | I2CD_RX_DMA_ENABLE)) {
+    if (FIELD_EX32(bus->cmd, I2CD_CMD, RX_BUFF_EN)) {
+        count = FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, TX_COUNT);
+    } else if (FIELD_EX32(bus->cmd, I2CD_CMD, RX_DMA_EN)) {
         count = bus->dma_len;
     } else { /* BYTE mode */
         count = 1;
     }
 
     cmd_flags = g_strdup_printf("%s%s%s%s%s%s%s%s%s",
-                                bus->cmd & I2CD_M_START_CMD ? "start|" : "",
-                                bus->cmd & I2CD_RX_DMA_ENABLE ? "rxdma|" : "",
-                                bus->cmd & I2CD_TX_DMA_ENABLE ? "txdma|" : "",
-                                bus->cmd & I2CD_RX_BUFF_ENABLE ? "rxbuf|" : "",
-                                bus->cmd & I2CD_TX_BUFF_ENABLE ? "txbuf|" : "",
-                                bus->cmd & I2CD_M_TX_CMD ? "tx|" : "",
-                                bus->cmd & I2CD_M_RX_CMD ? "rx|" : "",
-                                bus->cmd & I2CD_M_S_RX_CMD_LAST ? "last|" : "",
-                                bus->cmd & I2CD_M_STOP_CMD ? "stop" : "");
+             FIELD_EX32(bus->cmd, I2CD_CMD, M_START_CMD) ? "start|" : "",
+             FIELD_EX32(bus->cmd, I2CD_CMD, RX_DMA_EN) ? "rxdma|" : "",
+             FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN) ? "txdma|" : "",
+             FIELD_EX32(bus->cmd, I2CD_CMD, RX_BUFF_EN) ? "rxbuf|" : "",
+             FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN) ? "txbuf|" : "",
+             FIELD_EX32(bus->cmd, I2CD_CMD, M_TX_CMD) ? "tx|" : "",
+             FIELD_EX32(bus->cmd, I2CD_CMD, M_RX_CMD) ? "rx|" : "",
+             FIELD_EX32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST) ? "last|" : "",
+             FIELD_EX32(bus->cmd, I2CD_CMD, M_STOP_CMD) ? "stop" : "");
 
     trace_aspeed_i2c_bus_cmd(bus->cmd, cmd_flags, count, bus->intr_status);
 }
@@ -444,7 +433,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
         aspeed_i2c_bus_cmd_dump(bus);
     }
 
-    if (bus->cmd & I2CD_M_START_CMD) {
+    if (FIELD_EX32(bus->cmd, I2CD_CMD, M_START_CMD)) {
         uint8_t state = aspeed_i2c_get_state(bus) & I2CD_MACTIVE ?
             I2CD_MSTARTR : I2CD_MSTART;
         uint8_t addr;
@@ -455,21 +444,23 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 
         if (i2c_start_transfer(bus->bus, extract32(addr, 1, 7),
                                extract32(addr, 0, 1))) {
-            bus->intr_status |= I2CD_INTR_TX_NAK;
+            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
+                                          TX_NAK, 1);
         } else {
-            bus->intr_status |= I2CD_INTR_TX_ACK;
+            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
+                                          TX_ACK, 1);
         }
 
-        bus->cmd &= ~I2CD_M_START_CMD;
+        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_START_CMD, 0);
 
         /*
          * The START command is also a TX command, as the slave
          * address is sent on the bus. Drop the TX flag if nothing
          * else needs to be sent in this sequence.
          */
-        if (bus->cmd & I2CD_TX_BUFF_ENABLE) {
-            if (I2CD_POOL_TX_COUNT(bus->pool_ctrl) == 1) {
-                bus->cmd &= ~I2CD_M_TX_CMD;
+        if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_BUFF_EN)) {
+            if (FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, TX_COUNT) == 1) {
+                bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_TX_CMD, 0);
             } else {
                 /*
                  * Increase the start index in the TX pool buffer to
@@ -477,12 +468,12 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
                  */
                 pool_start++;
             }
-        } else if (bus->cmd & I2CD_TX_DMA_ENABLE) {
+        } else if (FIELD_EX32(bus->cmd, I2CD_CMD, TX_DMA_EN)) {
             if (bus->dma_len == 0) {
-                bus->cmd &= ~I2CD_M_TX_CMD;
+                bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_TX_CMD, 0);
             }
         } else {
-            bus->cmd &= ~I2CD_M_TX_CMD;
+            bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_TX_CMD, 0);
         }
 
         /* No slave found */
@@ -492,33 +483,38 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
         aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
 
-    if (bus->cmd & I2CD_M_TX_CMD) {
+    if (FIELD_EX32(bus->cmd, I2CD_CMD, M_TX_CMD)) {
         aspeed_i2c_set_state(bus, I2CD_MTXD);
         if (aspeed_i2c_bus_send(bus, pool_start)) {
-            bus->intr_status |= (I2CD_INTR_TX_NAK);
+            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
+                                          TX_NAK, 1);
             i2c_end_transfer(bus->bus);
         } else {
-            bus->intr_status |= I2CD_INTR_TX_ACK;
+            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
+                                          TX_ACK, 1);
         }
-        bus->cmd &= ~I2CD_M_TX_CMD;
+        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_TX_CMD, 0);
         aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
 
-    if ((bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST)) &&
-        !(bus->intr_status & I2CD_INTR_RX_DONE)) {
+    if ((FIELD_EX32(bus->cmd, I2CD_CMD, M_RX_CMD) ||
+         FIELD_EX32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST)) &&
+        !FIELD_EX32(bus->intr_status, I2CD_INTR_STS, RX_DONE)) {
         aspeed_i2c_handle_rx_cmd(bus);
     }
 
-    if (bus->cmd & I2CD_M_STOP_CMD) {
+    if (FIELD_EX32(bus->cmd, I2CD_CMD, M_STOP_CMD)) {
         if (!(aspeed_i2c_get_state(bus) & I2CD_MACTIVE)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: abnormal stop\n", __func__);
-            bus->intr_status |= I2CD_INTR_ABNORMAL;
+            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
+                                          ABNORMAL, 1);
         } else {
             aspeed_i2c_set_state(bus, I2CD_MSTOP);
             i2c_end_transfer(bus->bus);
-            bus->intr_status |= I2CD_INTR_NORMAL_STOP;
+            bus->intr_status = FIELD_DP32(bus->intr_status, I2CD_INTR_STS,
+                                          NORMAL_STOP, 1);
         }
-        bus->cmd &= ~I2CD_M_STOP_CMD;
+        bus->cmd = FIELD_DP32(bus->cmd, I2CD_CMD, M_STOP_CMD, 0);
         aspeed_i2c_set_state(bus, I2CD_IDLE);
     }
 }
@@ -533,49 +529,50 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
     trace_aspeed_i2c_bus_write(bus->id, offset, size, value);
 
     switch (offset) {
-    case I2CD_FUN_CTRL_REG:
-        if (value & I2CD_SLAVE_EN) {
+    case A_I2CD_FUN_CTRL:
+        if (FIELD_EX32(value, I2CD_FUN_CTRL, SLAVE_EN)) {
             qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
                           __func__);
             break;
         }
         bus->ctrl = value & 0x0071C3FF;
         break;
-    case I2CD_AC_TIMING_REG1:
+    case A_I2CD_AC_TIMING1:
         bus->timing[0] = value & 0xFFFFF0F;
         break;
-    case I2CD_AC_TIMING_REG2:
+    case A_I2CD_AC_TIMING2:
         bus->timing[1] = value & 0x7;
         break;
-    case I2CD_INTR_CTRL_REG:
+    case A_I2CD_INTR_CTRL:
         bus->intr_ctrl = value & 0x7FFF;
         break;
-    case I2CD_INTR_STS_REG:
-        handle_rx = (bus->intr_status & I2CD_INTR_RX_DONE) &&
-                (value & I2CD_INTR_RX_DONE);
+    case A_I2CD_INTR_STS:
+        handle_rx = FIELD_EX32(bus->intr_status, I2CD_INTR_STS, RX_DONE) &&
+                    FIELD_EX32(value, I2CD_INTR_STS, RX_DONE);
         bus->intr_status &= ~(value & 0x7FFF);
         if (!bus->intr_status) {
             bus->controller->intr_status &= ~(1 << bus->id);
             qemu_irq_lower(aic->bus_get_irq(bus));
         }
-        if (handle_rx && (bus->cmd & (I2CD_M_RX_CMD | I2CD_M_S_RX_CMD_LAST))) {
+        if (handle_rx && (FIELD_EX32(bus->cmd, I2CD_CMD, M_RX_CMD) ||
+                         FIELD_EX32(bus->cmd, I2CD_CMD, M_S_RX_CMD_LAST))) {
             aspeed_i2c_handle_rx_cmd(bus);
             aspeed_i2c_bus_raise_interrupt(bus);
         }
         break;
-    case I2CD_DEV_ADDR_REG:
+    case A_I2CD_DEV_ADDR:
         qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
                       __func__);
         break;
-    case I2CD_POOL_CTRL_REG:
+    case A_I2CD_POOL_CTRL:
         bus->pool_ctrl &= ~0xffffff;
         bus->pool_ctrl |= (value & 0xffffff);
         break;
 
-    case I2CD_BYTE_BUF_REG:
-        bus->buf = (value & I2CD_BYTE_BUF_TX_MASK) << I2CD_BYTE_BUF_TX_SHIFT;
+    case A_I2CD_BYTE_BUF:
+        bus->buf = FIELD_DP32(bus->buf, I2CD_BYTE_BUF, TX_BUF, value);
         break;
-    case I2CD_CMD_REG:
+    case A_I2CD_CMD:
         if (!aspeed_i2c_bus_is_enabled(bus)) {
             break;
         }
@@ -587,7 +584,8 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
         }
 
         if (!aic->has_dma &&
-            value & (I2CD_RX_DMA_ENABLE | I2CD_TX_DMA_ENABLE)) {
+            (FIELD_EX32(value, I2CD_CMD, RX_DMA_EN) ||
+             FIELD_EX32(value, I2CD_CMD, TX_DMA_EN))) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
             break;
         }
@@ -595,7 +593,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
         aspeed_i2c_bus_handle_cmd(bus, value);
         aspeed_i2c_bus_raise_interrupt(bus);
         break;
-    case I2CD_DMA_ADDR:
+    case A_I2CD_DMA_ADDR:
         if (!aic->has_dma) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
             break;
@@ -604,7 +602,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
         bus->dma_addr = value & 0x3ffffffc;
         break;
 
-    case I2CD_DMA_LEN:
+    case A_I2CD_DMA_LEN:
         if (!aic->has_dma) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
             break;
@@ -628,9 +626,9 @@ static uint64_t aspeed_i2c_ctrl_read(void *opaque, hwaddr offset,
     AspeedI2CState *s = opaque;
 
     switch (offset) {
-    case I2C_CTRL_STATUS:
+    case A_I2C_CTRL_STATUS:
         return s->intr_status;
-    case I2C_CTRL_GLOBAL:
+    case A_I2C_CTRL_GLOBAL:
         return s->ctrl_global;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
@@ -647,10 +645,10 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwaddr offset,
     AspeedI2CState *s = opaque;
 
     switch (offset) {
-    case I2C_CTRL_GLOBAL:
+    case A_I2C_CTRL_GLOBAL:
         s->ctrl_global = value;
         break;
-    case I2C_CTRL_STATUS:
+    case A_I2C_CTRL_STATUS:
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -919,9 +917,10 @@ static qemu_irq aspeed_2400_i2c_bus_get_irq(AspeedI2CBus *bus)
 static uint8_t *aspeed_2400_i2c_bus_pool_base(AspeedI2CBus *bus)
 {
     uint8_t *pool_page =
-        &bus->controller->pool[I2CD_POOL_PAGE_SEL(bus->ctrl) * 0x100];
+        &bus->controller->pool[FIELD_EX32(bus->ctrl, I2CD_FUN_CTRL,
+                                          POOL_PAGE_SEL) * 0x100];
 
-    return &pool_page[I2CD_POOL_OFFSET(bus->pool_ctrl)];
+    return &pool_page[FIELD_EX32(bus->pool_ctrl, I2CD_POOL_CTRL, OFFSET)];
 }
 
 static void aspeed_2400_i2c_class_init(ObjectClass *klass, void *data)
-- 
2.35.3


