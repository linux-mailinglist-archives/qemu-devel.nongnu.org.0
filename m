Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6207753E592
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:49:12 +0200 (CEST)
Received: from localhost ([::1]:39416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEyc-00029E-Db
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyELC-0005K8-U3; Mon, 06 Jun 2022 11:08:28 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:44485
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEL8-0005zM-HH; Mon, 06 Jun 2022 11:08:26 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxh33Rf6z4xZD;
 Tue,  7 Jun 2022 01:08:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxgx6QLJz4xZB;
 Tue,  7 Jun 2022 01:08:13 +1000 (AEST)
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
Subject: [PATCH 05/21] aspeed: i2c: Add new mode support
Date: Mon,  6 Jun 2022 17:07:16 +0200
Message-Id: <20220606150732.2282041-6-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

On AST2600, I2C has a secondary mode, called "new mode", which changes
the layout of registers, adds some minor behavior changes, and
introduces a new way to transfer data called "packet mode".

Most of the bit positions of the fields are the same between old and new
mode, so we use SHARED_FIELD_XX macros to reuse most of the code between
the different modes.

For packet mode, most of the command behavior is the same compared to
other modes, but there are some minor changes to how interrupts are
handled compared to other modes.

Signed-off-by: Joe Komlodi <komlodi@google.com>
Change-Id: I072f8301964f623afc74af1fe50c12e5caef199e
Message-Id: <20220331043248.2237838-6-komlodi@google.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h |   4 +-
 hw/i2c/aspeed_i2c.c         | 844 +++++++++++++++++++++++++++---------
 2 files changed, 653 insertions(+), 195 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index e9f83a954096..86b18d6751ca 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -34,6 +34,7 @@ OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 #define ASPEED_I2C_NR_BUSSES 16
 #define ASPEED_I2C_MAX_POOL_SIZE 0x800
 #define ASPEED_I2C_OLD_NUM_REG 11
+#define ASPEED_I2C_NEW_NUM_REG 22
 
 struct AspeedI2CState;
 
@@ -50,7 +51,7 @@ struct AspeedI2CBus {
     uint8_t id;
     qemu_irq irq;
 
-    uint32_t regs[ASPEED_I2C_OLD_NUM_REG];
+    uint32_t regs[ASPEED_I2C_NEW_NUM_REG];
 };
 
 struct AspeedI2CState {
@@ -61,6 +62,7 @@ struct AspeedI2CState {
 
     uint32_t intr_status;
     uint32_t ctrl_global;
+    uint32_t new_clk_divider;
     MemoryRegion pool_iomem;
     uint8_t pool[ASPEED_I2C_MAX_POOL_SIZE];
 
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index e93805515082..948d8dc2bb11 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -31,141 +31,302 @@
 #include "hw/registerfields.h"
 #include "trace.h"
 
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
 /* I2C Global Register */
 REG32(I2C_CTRL_STATUS, 0x0) /* Device Interrupt Status */
 REG32(I2C_CTRL_ASSIGN, 0x8) /* Device Interrupt Target Assignment */
 REG32(I2C_CTRL_GLOBAL, 0xC) /* Global Control Register */
+    FIELD(I2C_CTRL_GLOBAL, REG_MODE, 2, 1)
     FIELD(I2C_CTRL_GLOBAL, SRAM_EN, 0, 1)
+REG32(I2C_CTRL_NEW_CLK_DIVIDER, 0x10) /* New mode clock divider */
 
-/* I2C Device (Bus) Register */
+/* I2C Old Mode Device (Bus) Register */
 REG32(I2CD_FUN_CTRL, 0x0) /* I2CD Function Control  */
     FIELD(I2CD_FUN_CTRL, POOL_PAGE_SEL, 20, 3) /* AST2400 */
-    FIELD(I2CD_FUN_CTRL, M_SDA_LOCK_EN, 16, 1)
-    FIELD(I2CD_FUN_CTRL, MULTI_MASTER_DIS, 15, 1)
-    FIELD(I2CD_FUN_CTRL, M_SCL_DRIVE_EN, 14, 1)
-    FIELD(I2CD_FUN_CTRL, MSB_STS, 9, 1)
-    FIELD(I2CD_FUN_CTRL, SDA_DRIVE_IT_EN, 8, 1)
-    FIELD(I2CD_FUN_CTRL, M_SDA_DRIVE_IT_EN, 7, 1)
-    FIELD(I2CD_FUN_CTRL, M_HIGH_SPEED_EN, 6, 1)
-    FIELD(I2CD_FUN_CTRL, DEF_ADDR_EN, 5, 1)
-    FIELD(I2CD_FUN_CTRL, DEF_ALERT_EN, 4, 1)
-    FIELD(I2CD_FUN_CTRL, DEF_ARP_EN, 3, 1)
-    FIELD(I2CD_FUN_CTRL, DEF_GCALL_EN, 2, 1)
-    FIELD(I2CD_FUN_CTRL, SLAVE_EN, 1, 1)
-    FIELD(I2CD_FUN_CTRL, MASTER_EN, 0, 1)
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
 REG32(I2CD_AC_TIMING1, 0x04) /* Clock and AC Timing Control #1 */
 REG32(I2CD_AC_TIMING2, 0x08) /* Clock and AC Timing Control #2 */
 REG32(I2CD_INTR_CTRL, 0x0C)  /* I2CD Interrupt Control */
 REG32(I2CD_INTR_STS, 0x10)   /* I2CD Interrupt Status */
-    FIELD(I2CD_INTR_STS, SLAVE_ADDR_MATCH, 31, 1)    /* 0: addr1 1: addr2 */
-    FIELD(I2CD_INTR_STS, SLAVE_ADDR_RX_PENDING, 29, 1)
-    FIELD(I2CD_INTR_STS, SLAVE_INACTIVE_TIMEOUT, 15, 1)
-    FIELD(I2CD_INTR_STS, SDA_DL_TIMEOUT, 14, 1)
-    FIELD(I2CD_INTR_STS, BUS_RECOVER_DONE, 13, 1)
-    FIELD(I2CD_INTR_STS, SMBUS_ALERT, 12, 1)            /* Bus [0-3] only */
+    SHARED_FIELD(SLAVE_ADDR_MATCH, 31, 1)    /* 0: addr1 1: addr2 */
+    SHARED_FIELD(SLAVE_ADDR_RX_PENDING, 29, 1)
+    SHARED_FIELD(SLAVE_INACTIVE_TIMEOUT, 15, 1)
+    SHARED_FIELD(SDA_DL_TIMEOUT, 14, 1)
+    SHARED_FIELD(BUS_RECOVER_DONE, 13, 1)
+    SHARED_FIELD(SMBUS_ALERT, 12, 1)                    /* Bus [0-3] only */
     FIELD(I2CD_INTR_STS, SMBUS_ARP_ADDR, 11, 1)         /* Removed */
     FIELD(I2CD_INTR_STS, SMBUS_DEV_ALERT_ADDR, 10, 1)   /* Removed */
     FIELD(I2CD_INTR_STS, SMBUS_DEF_ADDR, 9, 1)          /* Removed */
     FIELD(I2CD_INTR_STS, GCALL_ADDR, 8, 1)              /* Removed */
     FIELD(I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)     /* use RX_DONE */
-    FIELD(I2CD_INTR_STS, SCL_TIMEOUT, 6, 1)
-    FIELD(I2CD_INTR_STS, ABNORMAL, 5, 1)
-    FIELD(I2CD_INTR_STS, NORMAL_STOP, 4, 1)
-    FIELD(I2CD_INTR_STS, ARBIT_LOSS, 3, 1)
-    FIELD(I2CD_INTR_STS, RX_DONE, 2, 1)
-    FIELD(I2CD_INTR_STS, TX_NAK, 1, 1)
-    FIELD(I2CD_INTR_STS, TX_ACK, 0, 1)
+    SHARED_FIELD(SCL_TIMEOUT, 6, 1)
+    SHARED_FIELD(ABNORMAL, 5, 1)
+    SHARED_FIELD(NORMAL_STOP, 4, 1)
+    SHARED_FIELD(ARBIT_LOSS, 3, 1)
+    SHARED_FIELD(RX_DONE, 2, 1)
+    SHARED_FIELD(TX_NAK, 1, 1)
+    SHARED_FIELD(TX_ACK, 0, 1)
 REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
-    FIELD(I2CD_CMD, SDA_OE, 28, 1)
-    FIELD(I2CD_CMD, SDA_O, 27, 1)
-    FIELD(I2CD_CMD, SCL_OE, 26, 1)
-    FIELD(I2CD_CMD, SCL_O, 25, 1)
-    FIELD(I2CD_CMD, TX_TIMING, 23, 2)
-    FIELD(I2CD_CMD, TX_STATE, 19, 4)
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
-    FIELD(I2CD_CMD, SCL_LINE_STS, 18, 1)
-    FIELD(I2CD_CMD, SDA_LINE_STS, 17, 1)
-    FIELD(I2CD_CMD, BUS_BUSY_STS, 16, 1)
-    FIELD(I2CD_CMD, SDA_OE_OUT_DIR, 15, 1)
-    FIELD(I2CD_CMD, SDA_O_OUT_DIR, 14, 1)
-    FIELD(I2CD_CMD, SCL_OE_OUT_DIR, 13, 1)
-    FIELD(I2CD_CMD, SCL_O_OUT_DIR, 12, 1)
-    FIELD(I2CD_CMD, BUS_RECOVER_CMD_EN, 11, 1)
-    FIELD(I2CD_CMD, S_ALT_EN, 10, 1)
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
     /* Command Bits */
-    FIELD(I2CD_CMD, RX_DMA_EN, 9, 1)
-    FIELD(I2CD_CMD, TX_DMA_EN, 8, 1)
-    FIELD(I2CD_CMD, RX_BUFF_EN, 7, 1)
-    FIELD(I2CD_CMD, TX_BUFF_EN, 6, 1)
-    FIELD(I2CD_CMD, M_STOP_CMD, 5, 1)
-    FIELD(I2CD_CMD, M_S_RX_CMD_LAST, 4, 1)
-    FIELD(I2CD_CMD, M_RX_CMD, 3, 1)
-    FIELD(I2CD_CMD, S_TX_CMD, 2, 1)
-    FIELD(I2CD_CMD, M_TX_CMD, 1, 1)
-    FIELD(I2CD_CMD, M_START_CMD, 0, 1)
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
 REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
 REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
-    FIELD(I2CD_POOL_CTRL, RX_COUNT, 24, 5)
-    FIELD(I2CD_POOL_CTRL, RX_SIZE, 16, 5)
-    FIELD(I2CD_POOL_CTRL, TX_COUNT, 9, 5)
+    SHARED_FIELD(RX_COUNT, 24, 5)
+    SHARED_FIELD(RX_SIZE, 16, 5)
+    SHARED_FIELD(TX_COUNT, 9, 5)
     FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
 REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
-    FIELD(I2CD_BYTE_BUF, RX_BUF, 8, 8)
-    FIELD(I2CD_BYTE_BUF, TX_BUF, 0, 8)
+    SHARED_FIELD(RX_BUF, 8, 8)
+    SHARED_FIELD(TX_BUF, 0, 8)
 REG32(I2CD_DMA_ADDR, 0x24) /* DMA Buffer Address */
 REG32(I2CD_DMA_LEN, 0x28) /* DMA Transfer Length < 4KB */
 
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
 static inline bool aspeed_i2c_bus_is_master(AspeedI2CBus *bus)
 {
-    return ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL, MASTER_EN);
+    return SHARED_ARRAY_FIELD_EX32(bus->regs, aspeed_i2c_bus_ctrl_offset(bus),
+                                   MASTER_EN);
 }
 
 static inline bool aspeed_i2c_bus_is_enabled(AspeedI2CBus *bus)
 {
-    return ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL, MASTER_EN) ||
-           ARRAY_FIELD_EX32(bus->regs, I2CD_FUN_CTRL, SLAVE_EN);
+    uint32_t ctrl_reg = aspeed_i2c_bus_ctrl_offset(bus);
+    return SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, MASTER_EN) ||
+           SHARED_ARRAY_FIELD_EX32(bus->regs, ctrl_reg, SLAVE_EN);
 }
 
 static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
-
-    trace_aspeed_i2c_bus_raise_interrupt(bus->regs[R_I2CD_INTR_STS],
-          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, TX_NAK) ? "nak|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, TX_ACK) ? "ack|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, RX_DONE) ? "done|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, NORMAL_STOP) ? "normal|"
+    uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
+    uint32_t intr_ctrl_reg = aspeed_i2c_bus_intr_ctrl_offset(bus);
+    bool raise_irq;
+
+    trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts],
+        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK) ? "nak|" : "",
+        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK) ? "ack|" : "",
+        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ? "done|"
                                                                   : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, ABNORMAL) ? "abnormal"
-                                                               : "");
-
-    bus->regs[R_I2CD_INTR_STS] &= bus->regs[R_I2CD_INTR_CTRL];
-    if (bus->regs[R_I2CD_INTR_STS]) {
+        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
+                                                                "normal|" : "",
+        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ? "abnormal"
+                                                                   : "");
+    raise_irq = bus->regs[reg_intr_sts] & bus->regs[intr_ctrl_reg];
+    /* In packet mode we don't mask off INTR_STS */
+    if (!aspeed_i2c_bus_pkt_mode_en(bus)) {
+        bus->regs[reg_intr_sts] &= bus->regs[intr_ctrl_reg];
+    }
+    if (raise_irq) {
         bus->controller->intr_status |= 1 << bus->id;
         qemu_irq_raise(aic->bus_get_irq(bus));
     }
 }
 
-static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
-                                    unsigned size)
+static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
+                                        unsigned size)
 {
-    AspeedI2CBus *bus = opaque;
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
     uint64_t value = bus->regs[offset / sizeof(*bus->regs)];
 
@@ -180,8 +341,7 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
         /* Value is already set, don't do anything. */
         break;
     case A_I2CD_CMD:
-        value = FIELD_DP32(value, I2CD_CMD, BUS_BUSY_STS,
-                           i2c_bus_busy(bus->bus));
+        value = SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bus->bus));
         break;
     case A_I2CD_DMA_ADDR:
         if (!aic->has_dma) {
@@ -207,31 +367,86 @@ static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
     return value;
 }
 
+static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
+                                        unsigned size)
+{
+    uint64_t value = bus->regs[offset / sizeof(*bus->regs)];
+
+    switch (offset) {
+    case A_I2CC_FUN_CTRL:
+    case A_I2CC_AC_TIMING:
+    case A_I2CC_POOL_CTRL:
+    case A_I2CM_INTR_CTRL:
+    case A_I2CM_INTR_STS:
+    case A_I2CC_MS_TXRX_BYTE_BUF:
+    case A_I2CM_DMA_LEN:
+    case A_I2CM_DMA_TX_ADDR:
+    case A_I2CM_DMA_RX_ADDR:
+    case A_I2CM_DMA_LEN_STS:
+    case A_I2CC_DMA_ADDR:
+    case A_I2CC_DMA_LEN:
+        /* Value is already set, don't do anything. */
+        break;
+    case A_I2CM_CMD:
+        value = SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bus->bus));
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, offset);
+        value = -1;
+        break;
+    }
+
+    trace_aspeed_i2c_bus_read(bus->id, offset, size, value);
+    return value;
+}
+
+static uint64_t aspeed_i2c_bus_read(void *opaque, hwaddr offset,
+                                    unsigned size)
+{
+    AspeedI2CBus *bus = opaque;
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return aspeed_i2c_bus_new_read(bus, offset, size);
+    }
+    return aspeed_i2c_bus_old_read(bus, offset, size);
+}
+
 static void aspeed_i2c_set_state(AspeedI2CBus *bus, uint8_t state)
 {
-    ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, TX_STATE, state);
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CC_MS_TXRX_BYTE_BUF, TX_STATE,
+                                state);
+    } else {
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CD_CMD, TX_STATE, state);
+    }
 }
 
 static uint8_t aspeed_i2c_get_state(AspeedI2CBus *bus)
 {
-    return ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_STATE);
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CC_MS_TXRX_BYTE_BUF,
+                                       TX_STATE);
+    }
+    return SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD, TX_STATE);
 }
 
 static int aspeed_i2c_dma_read(AspeedI2CBus *bus, uint8_t *data)
 {
     MemTxResult result;
     AspeedI2CState *s = bus->controller;
+    uint32_t reg_dma_addr = aspeed_i2c_bus_dma_addr_offset(bus);
+    uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
 
-    result = address_space_read(&s->dram_as, bus->regs[R_I2CD_DMA_ADDR],
+    result = address_space_read(&s->dram_as, bus->regs[reg_dma_addr],
                                 MEMTXATTRS_UNSPECIFIED, data, 1);
     if (result != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM read failed @%08x\n",
-                      __func__, bus->regs[R_I2CD_DMA_ADDR]);
+                      __func__, bus->regs[reg_dma_addr]);
         return -1;
     }
 
-    bus->regs[R_I2CD_DMA_ADDR]++;
-    bus->regs[R_I2CD_DMA_LEN]--;
+    bus->regs[reg_dma_addr]++;
+    bus->regs[reg_dma_len]--;
     return 0;
 }
 
@@ -240,9 +455,14 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
     int ret = -1;
     int i;
-    int pool_tx_count = ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, TX_COUNT);
-
-    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN)) {
+    uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
+    uint32_t reg_pool_ctrl = aspeed_i2c_bus_pool_ctrl_offset(bus);
+    uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
+    uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
+    int pool_tx_count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl,
+                                                TX_COUNT);
+
+    if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
         for (i = pool_start; i < pool_tx_count; i++) {
             uint8_t *pool_base = aic->bus_pool_base(bus);
 
@@ -253,23 +473,33 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
                 break;
             }
         }
-        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, TX_BUFF_EN, 0);
-    } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN)) {
-        while (bus->regs[R_I2CD_DMA_LEN]) {
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, TX_BUFF_EN, 0);
+    } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_DMA_EN)) {
+        /* In new mode, clear how many bytes we TXed */
+        if (aspeed_i2c_is_new_mode(bus->controller)) {
+            ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN_STS, TX_LEN, 0);
+        }
+        while (bus->regs[reg_dma_len]) {
             uint8_t data;
             aspeed_i2c_dma_read(bus, &data);
-            trace_aspeed_i2c_bus_send("DMA", bus->regs[R_I2CD_DMA_LEN],
-                                      bus->regs[R_I2CD_DMA_LEN], data);
+            trace_aspeed_i2c_bus_send("DMA", bus->regs[reg_dma_len],
+                                      bus->regs[reg_dma_len], data);
             ret = i2c_send(bus->bus, data);
             if (ret) {
                 break;
             }
+            /* In new mode, keep track of how many bytes we TXed */
+            if (aspeed_i2c_is_new_mode(bus->controller)) {
+                ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN_STS, TX_LEN,
+                                 ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN_STS,
+                                                  TX_LEN) + 1);
+            }
         }
-        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, TX_DMA_EN, 0);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, TX_DMA_EN, 0);
     } else {
         trace_aspeed_i2c_bus_send("BYTE", pool_start, 1,
-                                  bus->regs[R_I2CD_BYTE_BUF]);
-        ret = i2c_send(bus->bus, bus->regs[R_I2CD_BYTE_BUF]);
+                                  bus->regs[reg_byte_buf]);
+        ret = i2c_send(bus->bus, bus->regs[reg_byte_buf]);
     }
 
     return ret;
@@ -281,9 +511,15 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
     uint8_t data;
     int i;
-    int pool_rx_count = ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, RX_COUNT);
-
-    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_BUFF_EN)) {
+    uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
+    uint32_t reg_pool_ctrl = aspeed_i2c_bus_pool_ctrl_offset(bus);
+    uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
+    uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
+    uint32_t reg_dma_addr = aspeed_i2c_bus_dma_addr_offset(bus);
+    int pool_rx_count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl,
+                                                RX_COUNT);
+
+    if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN)) {
         uint8_t *pool_base = aic->bus_pool_base(bus);
 
         for (i = 0; i < pool_rx_count; i++) {
@@ -293,64 +529,82 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
         }
 
         /* Update RX count */
-        ARRAY_FIELD_DP32(bus->regs, I2CD_POOL_CTRL, RX_COUNT, i & 0xff);
-        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, RX_BUFF_EN, 0);
-    } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_DMA_EN)) {
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_pool_ctrl, RX_COUNT, i & 0xff);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, RX_BUFF_EN, 0);
+    } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_DMA_EN)) {
         uint8_t data;
+        /* In new mode, clear how many bytes we RXed */
+        if (aspeed_i2c_is_new_mode(bus->controller)) {
+            ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN_STS, RX_LEN, 0);
+        }
 
-        while (bus->regs[R_I2CD_DMA_LEN]) {
+        while (bus->regs[reg_dma_len]) {
             MemTxResult result;
 
             data = i2c_recv(bus->bus);
-            trace_aspeed_i2c_bus_recv("DMA", bus->regs[R_I2CD_DMA_LEN],
-                                      bus->regs[R_I2CD_DMA_LEN], data);
-            result = address_space_write(&s->dram_as,
-                                         bus->regs[R_I2CD_DMA_ADDR],
+            trace_aspeed_i2c_bus_recv("DMA", bus->regs[reg_dma_len],
+                                      bus->regs[reg_dma_len], data);
+            result = address_space_write(&s->dram_as, bus->regs[reg_dma_addr],
                                          MEMTXATTRS_UNSPECIFIED, &data, 1);
             if (result != MEMTX_OK) {
                 qemu_log_mask(LOG_GUEST_ERROR, "%s: DRAM write failed @%08x\n",
-                              __func__, bus->regs[R_I2CD_DMA_ADDR]);
+                              __func__, bus->regs[reg_dma_addr]);
                 return;
             }
-            bus->regs[R_I2CD_DMA_ADDR]++;
-            bus->regs[R_I2CD_DMA_LEN]--;
+            bus->regs[reg_dma_addr]++;
+            bus->regs[reg_dma_len]--;
+            /* In new mode, keep track of how many bytes we RXed */
+            if (aspeed_i2c_is_new_mode(bus->controller)) {
+                ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN_STS, RX_LEN,
+                                 ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN_STS,
+                                                  RX_LEN) + 1);
+            }
         }
-        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, RX_DMA_EN, 0);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, RX_DMA_EN, 0);
     } else {
         data = i2c_recv(bus->bus);
-        trace_aspeed_i2c_bus_recv("BYTE", 1, 1, bus->regs[R_I2CD_BYTE_BUF]);
-        ARRAY_FIELD_DP32(bus->regs, I2CD_BYTE_BUF, RX_BUF, data);
+        trace_aspeed_i2c_bus_recv("BYTE", 1, 1, bus->regs[reg_byte_buf]);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, data);
     }
 }
 
 static void aspeed_i2c_handle_rx_cmd(AspeedI2CBus *bus)
 {
+    uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
+    uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
+
     aspeed_i2c_set_state(bus, I2CD_MRXD);
     aspeed_i2c_bus_recv(bus);
-    ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, RX_DONE, 1);
-    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST)) {
+    SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
+    if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_S_RX_CMD_LAST)) {
         i2c_nack(bus->bus);
     }
-    ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_RX_CMD, 0);
-    ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST, 0);
+    SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_RX_CMD, 0);
+    SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_S_RX_CMD_LAST, 0);
     aspeed_i2c_set_state(bus, I2CD_MACTIVE);
 }
 
 static uint8_t aspeed_i2c_get_addr(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
+    uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
+    uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
 
-    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN)) {
+    if (aspeed_i2c_bus_pkt_mode_en(bus)) {
+        return (ARRAY_FIELD_EX32(bus->regs, I2CM_CMD, PKT_DEV_ADDR) << 1) |
+                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_RX_CMD);
+    }
+    if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
         uint8_t *pool_base = aic->bus_pool_base(bus);
 
         return pool_base[0];
-    } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN)) {
+    } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_DMA_EN)) {
         uint8_t data;
 
         aspeed_i2c_dma_read(bus, &data);
         return data;
     } else {
-        return bus->regs[R_I2CD_BYTE_BUF];
+        return bus->regs[reg_byte_buf];
     }
 }
 
@@ -358,10 +612,11 @@ static bool aspeed_i2c_check_sram(AspeedI2CBus *bus)
 {
     AspeedI2CState *s = bus->controller;
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(s);
-    bool dma_en = ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_DMA_EN)  ||
-                  ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN)  ||
-                  ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_BUFF_EN) ||
-                  ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN);
+    uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
+    bool dma_en = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_DMA_EN)  ||
+                  SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_DMA_EN)  ||
+                  SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN) ||
+                  SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN);
     if (!aic->check_sram) {
         return true;
     }
@@ -382,27 +637,31 @@ static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
 {
     g_autofree char *cmd_flags = NULL;
     uint32_t count;
-    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_BUFF_EN)) {
-        count = ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, TX_COUNT);
-    } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_DMA_EN)) {
-        count = bus->regs[R_I2CD_DMA_LEN];
+    uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
+    uint32_t reg_pool_ctrl = aspeed_i2c_bus_pool_ctrl_offset(bus);
+    uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
+    uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
+    if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN)) {
+        count = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, TX_COUNT);
+    } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_DMA_EN)) {
+        count = bus->regs[reg_dma_len];
     } else { /* BYTE mode */
         count = 1;
     }
 
     cmd_flags = g_strdup_printf("%s%s%s%s%s%s%s%s%s",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_START_CMD) ? "start|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_DMA_EN) ? "rxdma|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN) ? "txdma|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, RX_BUFF_EN) ? "rxbuf|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN) ? "txbuf|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_TX_CMD) ? "tx|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_RX_CMD) ? "rx|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST) ? "last|" : "",
-          ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_STOP_CMD) ? "stop" : "");
-
-    trace_aspeed_i2c_bus_cmd(bus->regs[R_I2CD_CMD], cmd_flags, count,
-                             bus->regs[R_I2CD_INTR_STS]);
+    SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_START_CMD) ? "start|" : "",
+    SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_DMA_EN) ? "rxdma|" : "",
+    SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_DMA_EN) ? "txdma|" : "",
+    SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN) ? "rxbuf|" : "",
+    SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN) ? "txbuf|" : "",
+    SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_TX_CMD) ? "tx|" : "",
+    SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_RX_CMD) ? "rx|" : "",
+    SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_S_RX_CMD_LAST) ? "last|" : "",
+    SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_STOP_CMD) ? "stop|" : "");
+
+    trace_aspeed_i2c_bus_cmd(bus->regs[reg_cmd], cmd_flags, count,
+                             bus->regs[reg_intr_sts]);
 }
 
 /*
@@ -412,9 +671,10 @@ static void aspeed_i2c_bus_cmd_dump(AspeedI2CBus *bus)
 static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
 {
     uint8_t pool_start = 0;
-
-    bus->regs[R_I2CD_CMD] &= ~0xFFFF;
-    bus->regs[R_I2CD_CMD] |= value & 0xFFFF;
+    uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
+    uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
+    uint32_t reg_pool_ctrl = aspeed_i2c_bus_pool_ctrl_offset(bus);
+    uint32_t reg_dma_len = aspeed_i2c_bus_dma_len_offset(bus);
 
     if (!aspeed_i2c_check_sram(bus)) {
         return;
@@ -424,7 +684,7 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
         aspeed_i2c_bus_cmd_dump(bus);
     }
 
-    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_START_CMD)) {
+    if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_START_CMD)) {
         uint8_t state = aspeed_i2c_get_state(bus) & I2CD_MACTIVE ?
             I2CD_MSTARTR : I2CD_MSTART;
         uint8_t addr;
@@ -432,24 +692,30 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
         aspeed_i2c_set_state(bus, state);
 
         addr = aspeed_i2c_get_addr(bus);
-
         if (i2c_start_transfer(bus->bus, extract32(addr, 1, 7),
                                extract32(addr, 0, 1))) {
-            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, TX_NAK, 1);
+            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, TX_NAK, 1);
+            if (aspeed_i2c_bus_pkt_mode_en(bus)) {
+                ARRAY_FIELD_DP32(bus->regs, I2CM_INTR_STS, PKT_CMD_FAIL, 1);
+            }
         } else {
-            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, TX_ACK, 1);
+            /* START doesn't set TX_ACK in packet mode */
+            if (!aspeed_i2c_bus_pkt_mode_en(bus)) {
+                SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, TX_ACK, 1);
+            }
         }
 
-        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_START_CMD, 0);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_START_CMD, 0);
 
         /*
          * The START command is also a TX command, as the slave
          * address is sent on the bus. Drop the TX flag if nothing
          * else needs to be sent in this sequence.
          */
-        if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_BUFF_EN)) {
-            if (ARRAY_FIELD_EX32(bus->regs, I2CD_POOL_CTRL, TX_COUNT) == 1) {
-                ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_TX_CMD, 0);
+        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
+            if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl, TX_COUNT)
+                == 1) {
+                SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
             } else {
                 /*
                  * Increase the start index in the TX pool buffer to
@@ -457,57 +723,216 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
                  */
                 pool_start++;
             }
-        } else if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, TX_DMA_EN)) {
-            if (bus->regs[R_I2CD_DMA_LEN] == 0) {
-                ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_TX_CMD, 0);
+        } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_DMA_EN)) {
+            if (bus->regs[reg_dma_len] == 0) {
+                SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
             }
         } else {
-            ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_TX_CMD, 0);
+            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
         }
 
         /* No slave found */
         if (!i2c_bus_busy(bus->bus)) {
+            if (aspeed_i2c_bus_pkt_mode_en(bus)) {
+                ARRAY_FIELD_DP32(bus->regs, I2CM_INTR_STS, PKT_CMD_FAIL, 1);
+                ARRAY_FIELD_DP32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+            }
             return;
         }
         aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
 
-    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_TX_CMD)) {
+    if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_TX_CMD)) {
         aspeed_i2c_set_state(bus, I2CD_MTXD);
         if (aspeed_i2c_bus_send(bus, pool_start)) {
-            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, TX_NAK, 1);
+            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, TX_NAK, 1);
             i2c_end_transfer(bus->bus);
         } else {
-            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, TX_ACK, 1);
+            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, TX_ACK, 1);
         }
-        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_TX_CMD, 0);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_TX_CMD, 0);
         aspeed_i2c_set_state(bus, I2CD_MACTIVE);
     }
 
-    if ((ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_RX_CMD) ||
-         ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST)) &&
-        !ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, RX_DONE)) {
+    if ((SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_RX_CMD) ||
+         SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_S_RX_CMD_LAST)) &&
+        !SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE)) {
         aspeed_i2c_handle_rx_cmd(bus);
     }
 
-    if (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_STOP_CMD)) {
+    if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, M_STOP_CMD)) {
         if (!(aspeed_i2c_get_state(bus) & I2CD_MACTIVE)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: abnormal stop\n", __func__);
-            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, ABNORMAL, 1);
+            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, ABNORMAL, 1);
+            if (aspeed_i2c_bus_pkt_mode_en(bus)) {
+                ARRAY_FIELD_DP32(bus->regs, I2CM_INTR_STS, PKT_CMD_FAIL, 1);
+            }
         } else {
             aspeed_i2c_set_state(bus, I2CD_MSTOP);
             i2c_end_transfer(bus->bus);
-            ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, NORMAL_STOP, 1);
+            SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, NORMAL_STOP, 1);
         }
-        ARRAY_FIELD_DP32(bus->regs, I2CD_CMD, M_STOP_CMD, 0);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
         aspeed_i2c_set_state(bus, I2CD_IDLE);
     }
+
+    if (aspeed_i2c_bus_pkt_mode_en(bus)) {
+        ARRAY_FIELD_DP32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE, 1);
+    }
 }
 
-static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
-                                 uint64_t value, unsigned size)
+static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
+                                     uint64_t value, unsigned size)
+{
+    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
+    bool handle_rx;
+    bool w1t;
+
+    trace_aspeed_i2c_bus_write(bus->id, offset, size, value);
+
+    switch (offset) {
+    case A_I2CC_FUN_CTRL:
+        if (SHARED_FIELD_EX32(value, SLAVE_EN)) {
+            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
+                          __func__);
+            break;
+        }
+        bus->regs[R_I2CD_FUN_CTRL] = value & 0x007dc3ff;
+        break;
+    case A_I2CC_AC_TIMING:
+        bus->regs[R_I2CC_AC_TIMING] = value & 0x1ffff0ff;
+        break;
+    case A_I2CC_MS_TXRX_BYTE_BUF:
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CC_MS_TXRX_BYTE_BUF, TX_BUF,
+                                value);
+        break;
+    case A_I2CC_POOL_CTRL:
+        bus->regs[R_I2CC_POOL_CTRL] &= ~0xffffff;
+        bus->regs[R_I2CC_POOL_CTRL] |= (value & 0xffffff);
+        break;
+    case A_I2CM_INTR_CTRL:
+        bus->regs[R_I2CM_INTR_CTRL] = value & 0x0007f07f;
+        break;
+    case A_I2CM_INTR_STS:
+        handle_rx = SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CM_INTR_STS, RX_DONE)
+                    && SHARED_FIELD_EX32(value, RX_DONE);
+
+        /* In packet mode, clearing PKT_CMD_DONE clears other interrupts. */
+        if (aspeed_i2c_bus_pkt_mode_en(bus) &&
+           FIELD_EX32(value, I2CM_INTR_STS, PKT_CMD_DONE)) {
+            bus->regs[R_I2CM_INTR_STS] &= 0xf0001000;
+            if (!bus->regs[R_I2CM_INTR_STS]) {
+                bus->controller->intr_status &= ~(1 << bus->id);
+                qemu_irq_lower(aic->bus_get_irq(bus));
+            }
+            break;
+        }
+        bus->regs[R_I2CM_INTR_STS] &= ~(value & 0xf007f07f);
+        if (!bus->regs[R_I2CM_INTR_STS]) {
+            bus->controller->intr_status &= ~(1 << bus->id);
+            qemu_irq_lower(aic->bus_get_irq(bus));
+        }
+        if (handle_rx && (SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CM_CMD,
+                                                  M_RX_CMD) ||
+                          SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CM_CMD,
+                                                  M_S_RX_CMD_LAST))) {
+            aspeed_i2c_handle_rx_cmd(bus);
+            aspeed_i2c_bus_raise_interrupt(bus);
+        }
+        break;
+    case A_I2CM_CMD:
+        if (!aspeed_i2c_bus_is_enabled(bus)) {
+            break;
+        }
+
+        if (!aspeed_i2c_bus_is_master(bus)) {
+            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
+                          __func__);
+            break;
+        }
+
+        if (!aic->has_dma &&
+            (SHARED_FIELD_EX32(value, RX_DMA_EN) ||
+             SHARED_FIELD_EX32(value, TX_DMA_EN))) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
+            break;
+        }
+
+        if (bus->regs[R_I2CM_INTR_STS] & 0xffff0000) {
+            qemu_log_mask(LOG_UNIMP, "%s: Packet mode is not implemented\n",
+                          __func__);
+            break;
+        }
+
+        value &= 0xff0ffbfb;
+        if (ARRAY_FIELD_EX32(bus->regs, I2CM_CMD, W1_CTRL)) {
+            bus->regs[R_I2CM_CMD] |= value;
+        } else {
+            bus->regs[R_I2CM_CMD] = value;
+        }
+
+        aspeed_i2c_bus_handle_cmd(bus, value);
+        aspeed_i2c_bus_raise_interrupt(bus);
+        break;
+    case A_I2CM_DMA_TX_ADDR:
+        bus->regs[R_I2CM_DMA_TX_ADDR] = FIELD_EX32(value, I2CM_DMA_TX_ADDR,
+                                                   ADDR);
+        bus->regs[R_I2CC_DMA_ADDR] = FIELD_EX32(value, I2CM_DMA_TX_ADDR, ADDR);
+        bus->regs[R_I2CC_DMA_LEN] = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN,
+                                                     TX_BUF_LEN) + 1;
+        break;
+    case A_I2CM_DMA_RX_ADDR:
+        bus->regs[R_I2CM_DMA_RX_ADDR] = FIELD_EX32(value, I2CM_DMA_RX_ADDR,
+                                                   ADDR);
+        bus->regs[R_I2CC_DMA_ADDR] = FIELD_EX32(value, I2CM_DMA_RX_ADDR, ADDR);
+        bus->regs[R_I2CC_DMA_LEN] = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN,
+                                                     RX_BUF_LEN) + 1;
+        break;
+    case A_I2CM_DMA_LEN:
+        w1t = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
+                   ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
+        /* If none of the w1t bits are set, just write to the reg as normal. */
+        if (!w1t) {
+            bus->regs[R_I2CM_DMA_LEN] = value;
+            break;
+        }
+        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
+            ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN,
+                             FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN));
+        }
+        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
+            ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN,
+                             FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN));
+        }
+        break;
+    case A_I2CM_DMA_LEN_STS:
+        /* Writes clear to 0 */
+        bus->regs[R_I2CM_DMA_LEN_STS] = 0;
+        break;
+    case A_I2CC_DMA_ADDR:
+    case A_I2CC_DMA_LEN:
+        /* RO */
+        break;
+    case A_I2CS_DMA_LEN_STS:
+    case A_I2CS_DMA_TX_ADDR:
+    case A_I2CS_DMA_RX_ADDR:
+    case A_I2CS_DEV_ADDR:
+    case A_I2CS_INTR_CTRL:
+    case A_I2CS_INTR_STS:
+    case A_I2CS_CMD:
+    case A_I2CS_DMA_LEN:
+        qemu_log_mask(LOG_UNIMP, "%s: Slave mode is not implemented\n",
+                      __func__);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+    }
+}
+
+static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
+                                     uint64_t value, unsigned size)
 {
-    AspeedI2CBus *bus = opaque;
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
     bool handle_rx;
 
@@ -515,7 +940,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
 
     switch (offset) {
     case A_I2CD_FUN_CTRL:
-        if (FIELD_EX32(value, I2CD_FUN_CTRL, SLAVE_EN)) {
+        if (SHARED_FIELD_EX32(value, SLAVE_EN)) {
             qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
                           __func__);
             break;
@@ -532,15 +957,17 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
         bus->regs[R_I2CD_INTR_CTRL] = value & 0x7FFF;
         break;
     case A_I2CD_INTR_STS:
-        handle_rx = ARRAY_FIELD_EX32(bus->regs, I2CD_INTR_STS, RX_DONE) &&
-                    FIELD_EX32(value, I2CD_INTR_STS, RX_DONE);
+        handle_rx = SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_INTR_STS, RX_DONE)
+                    && SHARED_FIELD_EX32(value, RX_DONE);
         bus->regs[R_I2CD_INTR_STS] &= ~(value & 0x7FFF);
         if (!bus->regs[R_I2CD_INTR_STS]) {
             bus->controller->intr_status &= ~(1 << bus->id);
             qemu_irq_lower(aic->bus_get_irq(bus));
         }
-        if (handle_rx && (ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_RX_CMD) ||
-                      ARRAY_FIELD_EX32(bus->regs, I2CD_CMD, M_S_RX_CMD_LAST))) {
+        if (handle_rx && (SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
+                                                  M_RX_CMD) ||
+                      SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CD_CMD,
+                                              M_S_RX_CMD_LAST))) {
             aspeed_i2c_handle_rx_cmd(bus);
             aspeed_i2c_bus_raise_interrupt(bus);
         }
@@ -555,7 +982,7 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
         break;
 
     case A_I2CD_BYTE_BUF:
-        ARRAY_FIELD_DP32(bus->regs, I2CD_BYTE_BUF, TX_BUF, value);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CD_BYTE_BUF, TX_BUF, value);
         break;
     case A_I2CD_CMD:
         if (!aspeed_i2c_bus_is_enabled(bus)) {
@@ -569,12 +996,15 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
         }
 
         if (!aic->has_dma &&
-            (FIELD_EX32(value, I2CD_CMD, RX_DMA_EN) ||
-             FIELD_EX32(value, I2CD_CMD, TX_DMA_EN))) {
+            (SHARED_FIELD_EX32(value, RX_DMA_EN) ||
+             SHARED_FIELD_EX32(value, TX_DMA_EN))) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: No DMA support\n",  __func__);
             break;
         }
 
+        bus->regs[R_I2CD_CMD] &= ~0xFFFF;
+        bus->regs[R_I2CD_CMD] |= value & 0xFFFF;
+
         aspeed_i2c_bus_handle_cmd(bus, value);
         aspeed_i2c_bus_raise_interrupt(bus);
         break;
@@ -605,6 +1035,17 @@ static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
     }
 }
 
+static void aspeed_i2c_bus_write(void *opaque, hwaddr offset,
+                                     uint64_t value, unsigned size)
+{
+    AspeedI2CBus *bus = opaque;
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        aspeed_i2c_bus_new_write(bus, offset, value, size);
+    } else {
+        aspeed_i2c_bus_old_write(bus, offset, value, size);
+    }
+}
+
 static uint64_t aspeed_i2c_ctrl_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
@@ -615,6 +1056,13 @@ static uint64_t aspeed_i2c_ctrl_read(void *opaque, hwaddr offset,
         return s->intr_status;
     case A_I2C_CTRL_GLOBAL:
         return s->ctrl_global;
+    case A_I2C_CTRL_NEW_CLK_DIVIDER:
+        if (aspeed_i2c_is_new_mode(s)) {
+            return s->new_clk_divider;
+        }
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -634,6 +1082,14 @@ static void aspeed_i2c_ctrl_write(void *opaque, hwaddr offset,
         value &= ~s->ctrl_global_rsvd;
         s->ctrl_global = value;
         break;
+    case A_I2C_CTRL_NEW_CLK_DIVIDER:
+        if (aspeed_i2c_is_new_mode(s)) {
+            s->new_clk_divider = value;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx
+                          "\n", __func__, offset);
+        }
+        break;
     case A_I2C_CTRL_STATUS:
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIx "\n",
@@ -691,10 +1147,10 @@ static const MemoryRegionOps aspeed_i2c_pool_ops = {
 
 static const VMStateDescription aspeed_i2c_bus_vmstate = {
     .name = TYPE_ASPEED_I2C,
-    .version_id = 4,
-    .minimum_version_id = 4,
+    .version_id = 5,
+    .minimum_version_id = 5,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32_ARRAY(regs, AspeedI2CBus, ASPEED_I2C_OLD_NUM_REG),
+        VMSTATE_UINT32_ARRAY(regs, AspeedI2CBus, ASPEED_I2C_NEW_NUM_REG),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.35.3


