Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E6554538
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:18:51 +0200 (CEST)
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xRi-0003ZT-SM
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5c-0006N3-GS; Wed, 22 Jun 2022 05:56:00 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:39259
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5Y-0004nb-VO; Wed, 22 Jun 2022 05:56:00 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSf0C6wxFz4xZg;
 Wed, 22 Jun 2022 19:55:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSf096ffTz4xD9;
 Wed, 22 Jun 2022 19:55:53 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joe Komlodi <komlodi@google.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 12/19] aspeed: i2c: Move regs and helpers to header file
Date: Wed, 22 Jun 2022 11:55:13 +0200
Message-Id: <20220622095520.3683321-13-clg@kaod.org>
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
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

Moves register definitions and short commonly used inlined functiosn to
the header file to help tidy up the implementation file.

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: I34dff7485b6bbe3c9482715ccd94dbd65dc5f324
Message-Id: <20220331043248.2237838-8-komlodi@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h | 267 ++++++++++++++++++++++++++++++++++++
 hw/i2c/aspeed_i2c.c         | 266 -----------------------------------
 2 files changed, 267 insertions(+), 266 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 8297b190a9d2..8ea9f6671ec8 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -23,6 +23,7 @@
 
 #include "hw/i2c/i2c.h"
 #include "hw/sysbus.h"
+#include "hw/registerfields.h"
 #include "qom/object.h"
 
 #define TYPE_ASPEED_I2C "aspeed.i2c"
@@ -36,6 +37,182 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 #define ASPEED_I2C_OLD_NUM_REG 11
 #define ASPEED_I2C_NEW_NUM_REG 22
 
+/* Tx State Machine */
+#define   I2CD_TX_STATE_MASK                  0xf
+#define     I2CD_IDLE                         0x0
+#define     I2CD_MACTIVE                      0x8
+#define     I2CD_MSTART                       0x9
+#define     I2CD_MSTARTR                      0xa
+#define     I2CD_MSTOP                        0xb
+#define     I2CD_MTXD                         0xc
+#define     I2CD_MRXACK                       0xd
+#define     I2CD_MRXD                         0xe
+#define     I2CD_MTXACK                       0xf
+#define     I2CD_SWAIT                        0x1
+#define     I2CD_SRXD                         0x4
+#define     I2CD_STXACK                       0x5
+#define     I2CD_STXD                         0x6
+#define     I2CD_SRXACK                       0x7
+#define     I2CD_RECOVER                      0x3
+
+/* I2C Global Register */
+REG32(I2C_CTRL_STATUS, 0x0) /* Device Interrupt Status */
+REG32(I2C_CTRL_ASSIGN, 0x8) /* Device Interrupt Target Assignment */
+REG32(I2C_CTRL_GLOBAL, 0xC) /* Global Control Register */
+    FIELD(I2C_CTRL_GLOBAL, REG_MODE, 2, 1)
+    FIELD(I2C_CTRL_GLOBAL, SRAM_EN, 0, 1)
+REG32(I2C_CTRL_NEW_CLK_DIVIDER, 0x10) /* New mode clock divider */
+
+/* I2C Old Mode Device (Bus) Register */
+REG32(I2CD_FUN_CTRL, 0x0) /* I2CD Function Control  */
+    FIELD(I2CD_FUN_CTRL, POOL_PAGE_SEL, 20, 3) /* AST2400 */
+    SHARED_FIELD(M_SDA_LOCK_EN, 16, 1)
+    SHARED_FIELD(MULTI_MASTER_DIS, 15, 1)
+    SHARED_FIELD(M_SCL_DRIVE_EN, 14, 1)
+    SHARED_FIELD(MSB_STS, 9, 1)
+    SHARED_FIELD(SDA_DRIVE_IT_EN, 8, 1)
+    SHARED_FIELD(M_SDA_DRIVE_IT_EN, 7, 1)
+    SHARED_FIELD(M_HIGH_SPEED_EN, 6, 1)
+    SHARED_FIELD(DEF_ADDR_EN, 5, 1)
+    SHARED_FIELD(DEF_ALERT_EN, 4, 1)
+    SHARED_FIELD(DEF_ARP_EN, 3, 1)
+    SHARED_FIELD(DEF_GCALL_EN, 2, 1)
+    SHARED_FIELD(SLAVE_EN, 1, 1)
+    SHARED_FIELD(MASTER_EN, 0, 1)
+REG32(I2CD_AC_TIMING1, 0x04) /* Clock and AC Timing Control #1 */
+REG32(I2CD_AC_TIMING2, 0x08) /* Clock and AC Timing Control #2 */
+REG32(I2CD_INTR_CTRL, 0x0C)  /* I2CD Interrupt Control */
+REG32(I2CD_INTR_STS, 0x10)   /* I2CD Interrupt Status */
+    SHARED_FIELD(SLAVE_ADDR_MATCH, 31, 1)    /* 0: addr1 1: addr2 */
+    SHARED_FIELD(SLAVE_ADDR_RX_PENDING, 29, 1)
+    SHARED_FIELD(SLAVE_INACTIVE_TIMEOUT, 15, 1)
+    SHARED_FIELD(SDA_DL_TIMEOUT, 14, 1)
+    SHARED_FIELD(BUS_RECOVER_DONE, 13, 1)
+    SHARED_FIELD(SMBUS_ALERT, 12, 1)                    /* Bus [0-3] only */
+    FIELD(I2CD_INTR_STS, SMBUS_ARP_ADDR, 11, 1)         /* Removed */
+    FIELD(I2CD_INTR_STS, SMBUS_DEV_ALERT_ADDR, 10, 1)   /* Removed */
+    FIELD(I2CD_INTR_STS, SMBUS_DEF_ADDR, 9, 1)          /* Removed */
+    FIELD(I2CD_INTR_STS, GCALL_ADDR, 8, 1)              /* Removed */
+    FIELD(I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)     /* use RX_DONE */
+    SHARED_FIELD(SCL_TIMEOUT, 6, 1)
+    SHARED_FIELD(ABNORMAL, 5, 1)
+    SHARED_FIELD(NORMAL_STOP, 4, 1)
+    SHARED_FIELD(ARBIT_LOSS, 3, 1)
+    SHARED_FIELD(RX_DONE, 2, 1)
+    SHARED_FIELD(TX_NAK, 1, 1)
+    SHARED_FIELD(TX_ACK, 0, 1)
+REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
+    SHARED_FIELD(SDA_OE, 28, 1)
+    SHARED_FIELD(SDA_O, 27, 1)
+    SHARED_FIELD(SCL_OE, 26, 1)
+    SHARED_FIELD(SCL_O, 25, 1)
+    SHARED_FIELD(TX_TIMING, 23, 2)
+    SHARED_FIELD(TX_STATE, 19, 4)
+    SHARED_FIELD(SCL_LINE_STS, 18, 1)
+    SHARED_FIELD(SDA_LINE_STS, 17, 1)
+    SHARED_FIELD(BUS_BUSY_STS, 16, 1)
+    SHARED_FIELD(SDA_OE_OUT_DIR, 15, 1)
+    SHARED_FIELD(SDA_O_OUT_DIR, 14, 1)
+    SHARED_FIELD(SCL_OE_OUT_DIR, 13, 1)
+    SHARED_FIELD(SCL_O_OUT_DIR, 12, 1)
+    SHARED_FIELD(BUS_RECOVER_CMD_EN, 11, 1)
+    SHARED_FIELD(S_ALT_EN, 10, 1)
+    /* Command Bits */
+    SHARED_FIELD(RX_DMA_EN, 9, 1)
+    SHARED_FIELD(TX_DMA_EN, 8, 1)
+    SHARED_FIELD(RX_BUFF_EN, 7, 1)
+    SHARED_FIELD(TX_BUFF_EN, 6, 1)
+    SHARED_FIELD(M_STOP_CMD, 5, 1)
+    SHARED_FIELD(M_S_RX_CMD_LAST, 4, 1)
+    SHARED_FIELD(M_RX_CMD, 3, 1)
+    SHARED_FIELD(S_TX_CMD, 2, 1)
+    SHARED_FIELD(M_TX_CMD, 1, 1)
+    SHARED_FIELD(M_START_CMD, 0, 1)
+REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
+REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
+    SHARED_FIELD(RX_COUNT, 24, 5)
+    SHARED_FIELD(RX_SIZE, 16, 5)
+    SHARED_FIELD(TX_COUNT, 9, 5)
+    FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
+REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
+    SHARED_FIELD(RX_BUF, 8, 8)
+    SHARED_FIELD(TX_BUF, 0, 8)
+REG32(I2CD_DMA_ADDR, 0x24) /* DMA Buffer Address */
+REG32(I2CD_DMA_LEN, 0x28) /* DMA Transfer Length < 4KB */
+
+/* I2C New Mode Device (Bus) Register */
+REG32(I2CC_FUN_CTRL, 0x0)
+    FIELD(I2CC_FUN_CTRL, RB_EARLY_DONE_EN, 22, 1)
+    FIELD(I2CC_FUN_CTRL, DMA_DIS_AUTO_RECOVER, 21, 1)
+    FIELD(I2CC_FUN_CTRL, S_SAVE_ADDR, 20, 1)
+    FIELD(I2CC_FUN_CTRL, M_PKT_RETRY_CNT, 18, 2)
+    /* 17:0 shared with I2CD_FUN_CTRL[17:0] */
+REG32(I2CC_AC_TIMING, 0x04)
+REG32(I2CC_MS_TXRX_BYTE_BUF, 0x08)
+    /* 31:16 shared with I2CD_CMD[31:16] */
+    /* 15:0  shared with I2CD_BYTE_BUF[15:0] */
+REG32(I2CC_POOL_CTRL, 0x0c)
+    /* 31:0 shared with I2CD_POOL_CTRL[31:0] */
+REG32(I2CM_INTR_CTRL, 0x10)
+REG32(I2CM_INTR_STS, 0x14)
+    FIELD(I2CM_INTR_STS, PKT_STATE, 28, 4)
+    FIELD(I2CM_INTR_STS, PKT_CMD_TIMEOUT, 18, 1)
+    FIELD(I2CM_INTR_STS, PKT_CMD_FAIL, 17, 1)
+    FIELD(I2CM_INTR_STS, PKT_CMD_DONE, 16, 1)
+    FIELD(I2CM_INTR_STS, BUS_RECOVER_FAIL, 15, 1)
+    /* 14:0 shared with I2CD_INTR_STS[14:0] */
+REG32(I2CM_CMD, 0x18)
+    FIELD(I2CM_CMD, W1_CTRL, 31, 1)
+    FIELD(I2CM_CMD, PKT_DEV_ADDR, 24, 7)
+    FIELD(I2CM_CMD, HS_MASTER_MODE_LSB, 17, 3)
+    FIELD(I2CM_CMD, PKT_OP_EN, 16, 1)
+    /* 15:0 shared with I2CD_CMD[15:0] */
+REG32(I2CM_DMA_LEN, 0x1c)
+    FIELD(I2CM_DMA_LEN, RX_BUF_LEN_W1T, 31, 1)
+    FIELD(I2CM_DMA_LEN, RX_BUF_LEN, 16, 11)
+    FIELD(I2CM_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
+    FIELD(I2CM_DMA_LEN, TX_BUF_LEN, 0, 11)
+REG32(I2CS_INTR_CTRL, 0x20)
+REG32(I2CS_INTR_STS, 0x24)
+    /* 31:29 shared with I2CD_INTR_STS[31:29] */
+    FIELD(I2CS_INTR_STS, SLAVE_PARKING_STS, 24, 2)
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR3_NAK, 22, 1)
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR2_NAK, 21, 1)
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR1_NAK, 20, 1)
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR_INDICATOR, 18, 2)
+    FIELD(I2CS_INTR_STS, PKT_CMD_FAIL, 17, 1)
+    FIELD(I2CS_INTR_STS, PKT_CMD_DONE, 16, 1)
+    /* 14:0 shared with I2CD_INTR_STS[14:0] */
+REG32(I2CS_CMD, 0x28)
+    FIELD(I2CS_CMD, W1_CTRL, 31, 1)
+    FIELD(I2CS_CMD, PKT_MODE_ACTIVE_ADDR, 17, 2)
+    FIELD(I2CS_CMD, PKT_MODE_EN, 16, 1)
+    FIELD(I2CS_CMD, AUTO_NAK_INACTIVE_ADDR, 15, 1)
+    FIELD(I2CS_CMD, AUTO_NAK_ACTIVE_ADDR, 14, 1)
+    /* 13:0 shared with I2CD_CMD[13:0] */
+REG32(I2CS_DMA_LEN, 0x2c)
+    FIELD(I2CS_DMA_LEN, RX_BUF_LEN_W1T, 31, 1)
+    FIELD(I2CS_DMA_LEN, RX_BUF_LEN, 16, 11)
+    FIELD(I2CS_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
+    FIELD(I2CS_DMA_LEN, TX_BUF_LEN, 0, 11)
+REG32(I2CM_DMA_TX_ADDR, 0x30)
+    FIELD(I2CM_DMA_TX_ADDR, ADDR, 0, 31)
+REG32(I2CM_DMA_RX_ADDR, 0x34)
+    FIELD(I2CM_DMA_RX_ADDR, ADDR, 0, 31)
+REG32(I2CS_DMA_TX_ADDR, 0x38)
+    FIELD(I2CS_DMA_TX_ADDR, ADDR, 0, 31)
+REG32(I2CS_DMA_RX_ADDR, 0x3c)
+    FIELD(I2CS_DMA_RX_ADDR, ADDR, 0, 31)
+REG32(I2CS_DEV_ADDR, 0x40)
+REG32(I2CM_DMA_LEN_STS, 0x48)
+    FIELD(I2CM_DMA_LEN_STS, RX_LEN, 16, 13)
+    FIELD(I2CM_DMA_LEN_STS, TX_LEN, 0, 13)
+REG32(I2CS_DMA_LEN_STS, 0x4c)
+    FIELD(I2CS_DMA_LEN_STS, RX_LEN, 16, 13)
+    FIELD(I2CS_DMA_LEN_STS, TX_LEN, 0, 13)
+REG32(I2CC_DMA_ADDR, 0x50)
+REG32(I2CC_DMA_LEN, 0x54)
+
 struct AspeedI2CState;
 
 #define TYPE_ASPEED_I2C_BUS "aspeed.i2c.bus"
@@ -88,6 +265,96 @@ struct AspeedI2CClass {
 
 };
 
+static inline bool aspeed_i2c_is_new_mode(AspeedI2CState *s)
+{
+    return FIELD_EX32(s->ctrl_global, I2C_CTRL_GLOBAL, REG_MODE);
+}
+
+static inline bool aspeed_i2c_bus_pkt_mode_en(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return ARRAY_FIELD_EX32(bus->regs, I2CM_CMD, PKT_OP_EN);
+    }
+    return false;
+}
+
+static inline uint32_t aspeed_i2c_bus_ctrl_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_FUN_CTRL;
+    }
+    return R_I2CD_FUN_CTRL;
+}
+
+static inline uint32_t aspeed_i2c_bus_cmd_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CM_CMD;
+    }
+    return R_I2CD_CMD;
+}
+
+static inline uint32_t aspeed_i2c_bus_intr_ctrl_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CM_INTR_CTRL;
+    }
+    return R_I2CD_INTR_CTRL;
+}
+
+static inline uint32_t aspeed_i2c_bus_intr_sts_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CM_INTR_STS;
+    }
+    return R_I2CD_INTR_STS;
+}
+
+static inline uint32_t aspeed_i2c_bus_pool_ctrl_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_POOL_CTRL;
+    }
+    return R_I2CD_POOL_CTRL;
+}
+
+static inline uint32_t aspeed_i2c_bus_byte_buf_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_MS_TXRX_BYTE_BUF;
+    }
+    return R_I2CD_BYTE_BUF;
+}
+
+static inline uint32_t aspeed_i2c_bus_dma_len_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_DMA_LEN;
+    }
+    return R_I2CD_DMA_LEN;
+}
+
+static inline uint32_t aspeed_i2c_bus_dma_addr_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CC_DMA_ADDR;
+    }
+    return R_I2CD_DMA_ADDR;
+}
+
+static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
+{
+    return SHARED_ARRAY_FIELD_EX32(bus->regs, aspeed_i2c_bus_ctrl_offset(bus),
+                                   MASTER_EN);
+}
+
+static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
+{
+    uint32_t ctrl_reg = aspeed_i2c_bus_ctrl_offset(bus);
+    return SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, MASTER_EN) ||
+           SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, SLAVE_EN);
+}
+
 I2CBus *aspeed_i2c_get_bus(AspeedI2CState *s, int busnr);
 
 #endif /* ASPEED_I2C_H */
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 0e0cd5bec8d8..1556b2da995b 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -31,272 +31,6 @@
 #include "hw/registerfields.h"
 #include "trace.h"
 
-/* Tx State Machine */
-#define   I2CD_TX_STATE_MASK                  0xf
-#define     I2CD_IDLE                         0x0
-#define     I2CD_MACTIVE                      0x8
-#define     I2CD_MSTART                       0x9
-#define     I2CD_MSTARTR                      0xa
-#define     I2CD_MSTOP                        0xb
-#define     I2CD_MTXD                         0xc
-#define     I2CD_MRXACK                       0xd
-#define     I2CD_MRXD                         0xe
-#define     I2CD_MTXACK                       0xf
-#define     I2CD_SWAIT                        0x1
-#define     I2CD_SRXD                         0x4
-#define     I2CD_STXACK                       0x5
-#define     I2CD_STXD                         0x6
-#define     I2CD_SRXACK                       0x7
-#define     I2CD_RECOVER                      0x3
-
-/* I2C Global Register */
-REG32(I2C_CTRL_STATUS, 0x0) /* Device Interrupt Status */
-REG32(I2C_CTRL_ASSIGN, 0x8) /* Device Interrupt Target Assignment */
-REG32(I2C_CTRL_GLOBAL, 0xC) /* Global Control Register */
-    FIELD(I2C_CTRL_GLOBAL, REG_MODE, 2, 1)
-    FIELD(I2C_CTRL_GLOBAL, SRAM_EN, 0, 1)
-REG32(I2C_CTRL_NEW_CLK_DIVIDER, 0x10) /* New mode clock divider */
-
-/* I2C Old Mode Device (Bus) Register */
-REG32(I2CD_FUN_CTRL, 0x0) /* I2CD Function Control  */
-    FIELD(I2CD_FUN_CTRL, POOL_PAGE_SEL, 20, 3) /* AST2400 */
-    SHARED_FIELD(M_SDA_LOCK_EN, 16, 1)
-    SHARED_FIELD(MULTI_MASTER_DIS, 15, 1)
-    SHARED_FIELD(M_SCL_DRIVE_EN, 14, 1)
-    SHARED_FIELD(MSB_STS, 9, 1)
-    SHARED_FIELD(SDA_DRIVE_IT_EN, 8, 1)
-    SHARED_FIELD(M_SDA_DRIVE_IT_EN, 7, 1)
-    SHARED_FIELD(M_HIGH_SPEED_EN, 6, 1)
-    SHARED_FIELD(DEF_ADDR_EN, 5, 1)
-    SHARED_FIELD(DEF_ALERT_EN, 4, 1)
-    SHARED_FIELD(DEF_ARP_EN, 3, 1)
-    SHARED_FIELD(DEF_GCALL_EN, 2, 1)
-    SHARED_FIELD(SLAVE_EN, 1, 1)
-    SHARED_FIELD(MASTER_EN, 0, 1)
-REG32(I2CD_AC_TIMING1, 0x04) /* Clock and AC Timing Control #1 */
-REG32(I2CD_AC_TIMING2, 0x08) /* Clock and AC Timing Control #2 */
-REG32(I2CD_INTR_CTRL, 0x0C)  /* I2CD Interrupt Control */
-REG32(I2CD_INTR_STS, 0x10)   /* I2CD Interrupt Status */
-    SHARED_FIELD(SLAVE_ADDR_MATCH, 31, 1)    /* 0: addr1 1: addr2 */
-    SHARED_FIELD(SLAVE_ADDR_RX_PENDING, 29, 1)
-    SHARED_FIELD(SLAVE_INACTIVE_TIMEOUT, 15, 1)
-    SHARED_FIELD(SDA_DL_TIMEOUT, 14, 1)
-    SHARED_FIELD(BUS_RECOVER_DONE, 13, 1)
-    SHARED_FIELD(SMBUS_ALERT, 12, 1)                    /* Bus [0-3] only */
-    FIELD(I2CD_INTR_STS, SMBUS_ARP_ADDR, 11, 1)         /* Removed */
-    FIELD(I2CD_INTR_STS, SMBUS_DEV_ALERT_ADDR, 10, 1)   /* Removed */
-    FIELD(I2CD_INTR_STS, SMBUS_DEF_ADDR, 9, 1)          /* Removed */
-    FIELD(I2CD_INTR_STS, GCALL_ADDR, 8, 1)              /* Removed */
-    FIELD(I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)     /* use RX_DONE */
-    SHARED_FIELD(SCL_TIMEOUT, 6, 1)
-    SHARED_FIELD(ABNORMAL, 5, 1)
-    SHARED_FIELD(NORMAL_STOP, 4, 1)
-    SHARED_FIELD(ARBIT_LOSS, 3, 1)
-    SHARED_FIELD(RX_DONE, 2, 1)
-    SHARED_FIELD(TX_NAK, 1, 1)
-    SHARED_FIELD(TX_ACK, 0, 1)
-REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
-    SHARED_FIELD(SDA_OE, 28, 1)
-    SHARED_FIELD(SDA_O, 27, 1)
-    SHARED_FIELD(SCL_OE, 26, 1)
-    SHARED_FIELD(SCL_O, 25, 1)
-    SHARED_FIELD(TX_TIMING, 23, 2)
-    SHARED_FIELD(TX_STATE, 19, 4)
-    SHARED_FIELD(SCL_LINE_STS, 18, 1)
-    SHARED_FIELD(SDA_LINE_STS, 17, 1)
-    SHARED_FIELD(BUS_BUSY_STS, 16, 1)
-    SHARED_FIELD(SDA_OE_OUT_DIR, 15, 1)
-    SHARED_FIELD(SDA_O_OUT_DIR, 14, 1)
-    SHARED_FIELD(SCL_OE_OUT_DIR, 13, 1)
-    SHARED_FIELD(SCL_O_OUT_DIR, 12, 1)
-    SHARED_FIELD(BUS_RECOVER_CMD_EN, 11, 1)
-    SHARED_FIELD(S_ALT_EN, 10, 1)
-    /* Command Bits */
-    SHARED_FIELD(RX_DMA_EN, 9, 1)
-    SHARED_FIELD(TX_DMA_EN, 8, 1)
-    SHARED_FIELD(RX_BUFF_EN, 7, 1)
-    SHARED_FIELD(TX_BUFF_EN, 6, 1)
-    SHARED_FIELD(M_STOP_CMD, 5, 1)
-    SHARED_FIELD(M_S_RX_CMD_LAST, 4, 1)
-    SHARED_FIELD(M_RX_CMD, 3, 1)
-    SHARED_FIELD(S_TX_CMD, 2, 1)
-    SHARED_FIELD(M_TX_CMD, 1, 1)
-    SHARED_FIELD(M_START_CMD, 0, 1)
-REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
-REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
-    SHARED_FIELD(RX_COUNT, 24, 5)
-    SHARED_FIELD(RX_SIZE, 16, 5)
-    SHARED_FIELD(TX_COUNT, 9, 5)
-    FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
-REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
-    SHARED_FIELD(RX_BUF, 8, 8)
-    SHARED_FIELD(TX_BUF, 0, 8)
-REG32(I2CD_DMA_ADDR, 0x24) /* DMA Buffer Address */
-REG32(I2CD_DMA_LEN, 0x28) /* DMA Transfer Length < 4KB */
-
-/* I2C New Mode Device (Bus) Register */
-REG32(I2CC_FUN_CTRL, 0x0)
-    FIELD(I2CC_FUN_CTRL, RB_EARLY_DONE_EN, 22, 1)
-    FIELD(I2CC_FUN_CTRL, DMA_DIS_AUTO_RECOVER, 21, 1)
-    FIELD(I2CC_FUN_CTRL, S_SAVE_ADDR, 20, 1)
-    FIELD(I2CC_FUN_CTRL, M_PKT_RETRY_CNT, 18, 2)
-    /* 17:0 shared with I2CD_FUN_CTRL[17:0] */
-REG32(I2CC_AC_TIMING, 0x04)
-REG32(I2CC_MS_TXRX_BYTE_BUF, 0x08)
-    /* 31:16 shared with I2CD_CMD[31:16] */
-    /* 15:0  shared with I2CD_BYTE_BUF[15:0] */
-REG32(I2CC_POOL_CTRL, 0x0c)
-    /* 31:0 shared with I2CD_POOL_CTRL[31:0] */
-REG32(I2CM_INTR_CTRL, 0x10)
-REG32(I2CM_INTR_STS, 0x14)
-    FIELD(I2CM_INTR_STS, PKT_STATE, 28, 4)
-    FIELD(I2CM_INTR_STS, PKT_CMD_TIMEOUT, 18, 1)
-    FIELD(I2CM_INTR_STS, PKT_CMD_FAIL, 17, 1)
-    FIELD(I2CM_INTR_STS, PKT_CMD_DONE, 16, 1)
-    FIELD(I2CM_INTR_STS, BUS_RECOVER_FAIL, 15, 1)
-    /* 14:0 shared with I2CD_INTR_STS[14:0] */
-REG32(I2CM_CMD, 0x18)
-    FIELD(I2CM_CMD, W1_CTRL, 31, 1)
-    FIELD(I2CM_CMD, PKT_DEV_ADDR, 24, 7)
-    FIELD(I2CM_CMD, HS_MASTER_MODE_LSB, 17, 3)
-    FIELD(I2CM_CMD, PKT_OP_EN, 16, 1)
-    /* 15:0 shared with I2CD_CMD[15:0] */
-REG32(I2CM_DMA_LEN, 0x1c)
-    FIELD(I2CM_DMA_LEN, RX_BUF_LEN_W1T, 31, 1)
-    FIELD(I2CM_DMA_LEN, RX_BUF_LEN, 16, 11)
-    FIELD(I2CM_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
-    FIELD(I2CM_DMA_LEN, TX_BUF_LEN, 0, 11)
-REG32(I2CS_INTR_CTRL, 0x20)
-REG32(I2CS_INTR_STS, 0x24)
-    /* 31:29 shared with I2CD_INTR_STS[31:29] */
-    FIELD(I2CS_INTR_STS, SLAVE_PARKING_STS, 24, 2)
-    FIELD(I2CS_INTR_STS, SLAVE_ADDR3_NAK, 22, 1)
-    FIELD(I2CS_INTR_STS, SLAVE_ADDR2_NAK, 21, 1)
-    FIELD(I2CS_INTR_STS, SLAVE_ADDR1_NAK, 20, 1)
-    FIELD(I2CS_INTR_STS, SLAVE_ADDR_INDICATOR, 18, 2)
-    FIELD(I2CS_INTR_STS, PKT_CMD_FAIL, 17, 1)
-    FIELD(I2CS_INTR_STS, PKT_CMD_DONE, 16, 1)
-    /* 14:0 shared with I2CD_INTR_STS[14:0] */
-REG32(I2CS_CMD, 0x28)
-    FIELD(I2CS_CMD, W1_CTRL, 31, 1)
-    FIELD(I2CS_CMD, PKT_MODE_ACTIVE_ADDR, 17, 2)
-    FIELD(I2CS_CMD, PKT_MODE_EN, 16, 1)
-    FIELD(I2CS_CMD, AUTO_NAK_INACTIVE_ADDR, 15, 1)
-    FIELD(I2CS_CMD, AUTO_NAK_ACTIVE_ADDR, 14, 1)
-    /* 13:0 shared with I2CD_CMD[13:0] */
-REG32(I2CS_DMA_LEN, 0x2c)
-    FIELD(I2CS_DMA_LEN, RX_BUF_LEN_W1T, 31, 1)
-    FIELD(I2CS_DMA_LEN, RX_BUF_LEN, 16, 11)
-    FIELD(I2CS_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
-    FIELD(I2CS_DMA_LEN, TX_BUF_LEN, 0, 11)
-REG32(I2CM_DMA_TX_ADDR, 0x30)
-    FIELD(I2CM_DMA_TX_ADDR, ADDR, 0, 31)
-REG32(I2CM_DMA_RX_ADDR, 0x34)
-    FIELD(I2CM_DMA_RX_ADDR, ADDR, 0, 31)
-REG32(I2CS_DMA_TX_ADDR, 0x38)
-    FIELD(I2CS_DMA_TX_ADDR, ADDR, 0, 31)
-REG32(I2CS_DMA_RX_ADDR, 0x3c)
-    FIELD(I2CS_DMA_RX_ADDR, ADDR, 0, 31)
-REG32(I2CS_DEV_ADDR, 0x40)
-REG32(I2CM_DMA_LEN_STS, 0x48)
-    FIELD(I2CM_DMA_LEN_STS, RX_LEN, 16, 13)
-    FIELD(I2CM_DMA_LEN_STS, TX_LEN, 0, 13)
-REG32(I2CS_DMA_LEN_STS, 0x4c)
-    FIELD(I2CS_DMA_LEN_STS, RX_LEN, 16, 13)
-    FIELD(I2CS_DMA_LEN_STS, TX_LEN, 0, 13)
-REG32(I2CC_DMA_ADDR, 0x50)
-REG32(I2CC_DMA_LEN, 0x54)
-
-static inline bool aspeed_i2c_is_new_mode(AspeedI2CState *s)
-{
-    return FIELD_EX32(s->ctrl_global, I2C_CTRL_GLOBAL, REG_MODE);
-}
-
-static inline bool aspeed_i2c_bus_pkt_mode_en(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return ARRAY_FIELD_EX32(bus->regs, I2CM_CMD, PKT_OP_EN);
-    }
-    return false;
-}
-
-static inline uint32_t aspeed_i2c_bus_ctrl_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_FUN_CTRL;
-    }
-    return R_I2CD_FUN_CTRL;
-}
-
-static inline uint32_t aspeed_i2c_bus_cmd_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CM_CMD;
-    }
-    return R_I2CD_CMD;
-}
-
-static inline uint32_t aspeed_i2c_bus_intr_ctrl_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CM_INTR_CTRL;
-    }
-    return R_I2CD_INTR_CTRL;
-}
-
-static inline uint32_t aspeed_i2c_bus_intr_sts_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CM_INTR_STS;
-    }
-    return R_I2CD_INTR_STS;
-}
-
-static inline uint32_t aspeed_i2c_bus_pool_ctrl_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_POOL_CTRL;
-    }
-    return R_I2CD_POOL_CTRL;
-}
-
-static inline uint32_t aspeed_i2c_bus_byte_buf_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_MS_TXRX_BYTE_BUF;
-    }
-    return R_I2CD_BYTE_BUF;
-}
-
-static inline uint32_t aspeed_i2c_bus_dma_len_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_DMA_LEN;
-    }
-    return R_I2CD_DMA_LEN;
-}
-
-static inline uint32_t aspeed_i2c_bus_dma_addr_offset(AspeedI2CBus *bus)
-{
-    if (aspeed_i2c_is_new_mode(bus->controller)) {
-        return R_I2CC_DMA_ADDR;
-    }
-    return R_I2CD_DMA_ADDR;
-}
-
-static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
-{
-    return SHARED_ARRAY_FIELD_EX32(bus->regs, aspeed_i2c_bus_ctrl_offset(bus),
-                                   MASTER_EN);
-}
-
-static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
-{
-    uint32_t ctrl_reg = aspeed_i2c_bus_ctrl_offset(bus);
-    return SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, MASTER_EN) ||
-           SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, SLAVE_EN);
-}
-
 static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
-- 
2.35.3


