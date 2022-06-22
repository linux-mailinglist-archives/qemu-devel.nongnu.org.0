Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1061B554542
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:24:21 +0200 (CEST)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xX2-0001xC-4x
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5o-0006ux-9e; Wed, 22 Jun 2022 05:56:15 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5m-0004qP-Gw; Wed, 22 Jun 2022 05:56:11 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSf0S00ySz4xZg;
 Wed, 22 Jun 2022 19:56:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSf0P6dGtz4xD9;
 Wed, 22 Jun 2022 19:56:05 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 16/19] hw/i2c/aspeed: add DEV_ADDR in old register mode
Date: Wed, 22 Jun 2022 11:55:17 +0200
Message-Id: <20220622095520.3683321-17-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Klaus Jensen <k.jensen@samsung.com>

Add support for writing and reading the device address register in old
register mode.

On the AST2400 (only 1 slave address)

  * no upper bits

On the AST2500 (2 possible slave addresses),

  * bit[31] : Slave Address match indicator
  * bit[30] : Slave Address Receiving pending

On the AST2600 (3 possible slave addresses),

  * bit[31-30] : Slave Address match indicator
  * bit[29] : Slave Address Receiving pending

The model could be more precise to take into account all fields but
since the Linux driver is masking the register value being set, it
should be fine. See commit 3fb2e2aeafb2 ("i2c: aspeed: disable
additional device addresses on ast2[56]xx") from Zeiv. This can be
addressed later.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
[ clg: add details to commit log ]
Message-Id: <20220601210831.67259-3-its@irrelevant.dk>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h | 8 ++++++++
 hw/i2c/aspeed_i2c.c         | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 0cd245a00963..1398befc104d 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -295,6 +295,14 @@ static inline uint32_t aspeed_i2c_bus_cmd_offset(AspeedI2CBus *bus)
     return R_I2CD_CMD;
 }
 
+static inline uint32_t aspeed_i2c_bus_dev_addr_offset(AspeedI2CBus *bus)
+{
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return R_I2CS_DEV_ADDR;
+    }
+    return R_I2CD_DEV_ADDR;
+}
+
 static inline uint32_t aspeed_i2c_bus_intr_ctrl_offset(AspeedI2CBus *bus)
 {
     if (aspeed_i2c_is_new_mode(bus->controller)) {
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 43ac9491ec36..f9fce0d84b89 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -83,6 +83,7 @@ static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CD_AC_TIMING2:
     case A_I2CD_INTR_CTRL:
     case A_I2CD_INTR_STS:
+    case A_I2CD_DEV_ADDR:
     case A_I2CD_POOL_CTRL:
     case A_I2CD_BYTE_BUF:
         /* Value is already set, don't do anything. */
@@ -720,8 +721,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
         }
         break;
     case A_I2CD_DEV_ADDR:
-        qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                      __func__);
+        bus->regs[R_I2CD_DEV_ADDR] = value;
         break;
     case A_I2CD_POOL_CTRL:
         bus->regs[R_I2CD_POOL_CTRL] &= ~0xffffff;
-- 
2.35.3


