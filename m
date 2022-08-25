Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE5B5A0CE6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 11:43:56 +0200 (CEST)
Received: from localhost ([::1]:52774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR9P0-0006v5-TB
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 05:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RIc8=Y5=kaod.org=clg@ozlabs.org>)
 id 1oR8g9-0002aL-Lr; Thu, 25 Aug 2022 04:57:33 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:59775
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=RIc8=Y5=kaod.org=clg@ozlabs.org>)
 id 1oR8g7-0003Ek-En; Thu, 25 Aug 2022 04:57:33 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MCxg66prfz4xV3;
 Thu, 25 Aug 2022 18:57:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MCxg363LBz4x1G;
 Thu, 25 Aug 2022 18:57:19 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL for-7.1 1/1] hw/i2c/aspeed: Fix old reg slave receive
Date: Thu, 25 Aug 2022 10:57:10 +0200
Message-Id: <20220825085710.34800-2-clg@kaod.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825085710.34800-1-clg@kaod.org>
References: <20220825085710.34800-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=RIc8=Y5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Peter Delevoryas <peter@pjd.dev>

I think when Klaus ported his slave mode changes from the original patch
series to the rewritten I2C module, he changed the behavior of the first
byte that is received by the slave device.

What's supposed to happen is that the AspeedI2CBus's slave device's
i2c_event callback should run, and if the event is "send_async", then it
should populate the byte buffer with the 8-bit I2C address that is being
sent to. Since we only support "send_async", the lowest bit should
always be 0 (indicating that the master is requesting to send data).

This is the code Klaus had previously, for reference. [1]

    switch (event) {
    case I2C_START_SEND:
        bus->buf = bus->dev_addr << 1;

        bus->buf &= I2CD_BYTE_BUF_RX_MASK;
        bus->buf <<= I2CD_BYTE_BUF_RX_SHIFT;

        bus->intr_status |= (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_RX_DONE);
        aspeed_i2c_set_state(bus, I2CD_STXD);

        break;

[1]: https://lore.kernel.org/qemu-devel/20220331165737.1073520-4-its@irrelevant.dk/

Fixes: a8d48f59cd021b25 ("hw/i2c/aspeed: add slave device in old register mode")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h | 1 +
 hw/i2c/aspeed_i2c.c         | 8 +++++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 300a89b34301..adc904d6c1f8 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -130,6 +130,7 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
     SHARED_FIELD(M_TX_CMD, 1, 1)
     SHARED_FIELD(M_START_CMD, 0, 1)
 REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
+    SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
 REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
     SHARED_FIELD(RX_COUNT, 24, 5)
     SHARED_FIELD(RX_SIZE, 16, 5)
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 42c6d69b82f0..c166fd20fa11 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1131,7 +1131,9 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
     AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
-    uint32_t value;
+    uint32_t reg_dev_addr = aspeed_i2c_bus_dev_addr_offset(bus);
+    uint32_t dev_addr = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_dev_addr,
+                                                SLAVE_DEV_ADDR1);
 
     if (aspeed_i2c_is_new_mode(bus->controller)) {
         return aspeed_i2c_bus_new_slave_event(bus, event);
@@ -1139,8 +1141,8 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
 
     switch (event) {
     case I2C_START_SEND_ASYNC:
-        value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
-        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value << 1);
+        /* Bit[0] == 0 indicates "send". */
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, dev_addr << 1);
 
         ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
-- 
2.37.1


