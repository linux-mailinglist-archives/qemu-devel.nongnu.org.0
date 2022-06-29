Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7116A55F44D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 05:48:32 +0200 (CEST)
Received: from localhost ([::1]:56956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Ogo-0007JT-H7
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 23:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVR-0007fw-MN; Tue, 28 Jun 2022 23:36:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peterdelevoryas@gmail.com>)
 id 1o6OVP-0006dT-19; Tue, 28 Jun 2022 23:36:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id n10so12915380plp.0;
 Tue, 28 Jun 2022 20:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vb4Z8dCYcKJsQU+4wQnj8TmeB5G+rHH0WmkyQB2Y6Fc=;
 b=m4cD9T6dvMXGnHjHeuaGHJnxvRDVIzjims9IGkF4F0e1tBFhXrsie9rdhYpDoFd9LK
 7An3ZDw/nV/gArLhukkxf+JlDGTmIZRgtc5Ib6OsvA/juOfcNyBWW8X2rStgFBzdH5al
 vpUFuhDgsPk3YG3MdSNVI6Tt/wV2QUhcUbiDNOmF3HSCpPwSNu0SFBJr8jGnuCuP65xF
 2AY/Y/t6sDRWeBht6RM9By8Lky/Z99QEAMDjOJ7LTloXfonGlvPVETpotLocjKuXHFUw
 83UVcH2UBth7l1FoFzsXlUu0A5VIXf+k/gqIc5dgn38MCWNhJhvniz24ER1J/FVhT+te
 kp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vb4Z8dCYcKJsQU+4wQnj8TmeB5G+rHH0WmkyQB2Y6Fc=;
 b=1u+8X2BQylins7Dll+fJx/LdP/v9CSzVcscytjx1AnaDfA5GQ/8U1ZEQR89Oo0JKLs
 lQ3qeTHQ0pP4mQ4KlU0UTebRMwShf4B0FxXae+DyHlrwf+0EOchnZBAmHML2K0EjrVEn
 /swRYLzZrW+qNyn5X1MFlDGESlXr5PtvLv8ZbknPPXlHphp9I3TaqMstFJcU/ib1GV7C
 Yts638AYeIMESYrd8xvo8JbMVcJrdiic49dmXaeaT0mBOgqcGM0Sbl1TUSADVebykYF1
 EQalJsdtpKFLlLSCcxnIQi+XTj9DA5T5yTsOjaKL6/zQwQKZPx2Roz78jbiWnanqjCSU
 UybA==
X-Gm-Message-State: AJIora+FJzRy4wboSL+2sjouCj6RH/OrBZJLXxoyK/r9X7UzS4/2Mz/O
 TGJDzCrZEg17aCNi1F+VIx8=
X-Google-Smtp-Source: AGRyM1tWQoOXcGieoMa5MFTGV1ZsWNM92yyDT4lzaJxitBw6c7UqBRzzAgTzTgGFO21XOVz3hchvzw==
X-Received: by 2002:a17:90b:3b81:b0:1ed:3655:d0c8 with SMTP id
 pc1-20020a17090b3b8100b001ed3655d0c8mr3454520pjb.56.1656473801882; 
 Tue, 28 Jun 2022 20:36:41 -0700 (PDT)
Received: from localhost (fwdproxy-prn-003.fbsv.net.
 [2a03:2880:ff:3::face:b00c]) by smtp.gmail.com with ESMTPSA id
 8-20020aa79208000000b0050dc76281e0sm5913463pfo.186.2022.06.28.20.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 20:36:41 -0700 (PDT)
From: Peter Delevoryas <peterdelevoryas@gmail.com>
X-Google-Original-From: Peter Delevoryas <pdel@fb.com>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v2 07/13] hw/i2c/aspeed: Add new-registers DMA slave mode RX
 support
Date: Tue, 28 Jun 2022 20:36:28 -0700
Message-Id: <20220629033634.3850922-8-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629033634.3850922-1-pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peterdelevoryas@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This commit adds support for DMA RX in slave mode while using the new
register set in the AST2600 and AST1030. This patch also pretty much
assumes packet mode is enabled, I'm not sure if this will work in DMA
step mode.

This is particularly useful for testing IPMB exchanges between Zephyr
and external devices, which requires multi-master I2C support and DMA in
the new register mode, because the Zephyr drivers from Aspeed use DMA in
the new mode by default. The Zephyr drivers are also using packet mode.

The typical sequence of events for receiving data in DMA slave + packet
mode is that the Zephyr firmware will configure the slave address
register with an address to receive on and configure the bus's function
control register to enable master mode and slave mode simultaneously at
startup, before any transfers are initiated.

RX DMA is enabled in the slave mode command register, and the slave RX
DMA buffer address and slave RX DMA buffer length are set. TX DMA is not
covered in this patch.

When the Aspeed I2C controller receives data from some other I2C master,
it will reset the I2CS_DMA_LEN RX_LEN value to zero, then buffer
incoming data in the RX DMA buffer while incrementing the I2CC_DMA_ADDR
address counter and decrementing the I2CC_DMA_LEN counter. It will also
update the I2CS_DMA_LEN RX_LEN value along the way.

Once all the data has been received, the bus controller will raise an
interrupt indicating a packet command was completed, the slave address
matched, a normal stop condition was seen, and the transfer was an RX
operation.

If the master sent a NACK instead of a normal stop condition, or the
transfer timed out, then a slightly different set of interrupt status
values would be set. Those conditions are not handled in this commit.

The Zephyr firmware then collects data from the RX DMA buffer and clears
the status register by writing the PKT_MODE_EN bit to the status
register. In packet mode, clearing the packet mode interrupt enable bit
also clears most of the other interrupt bits automatically (except for a
few bits above it).

Note: if the master transmit or receive functions were in use
simultaneously with the slave mode receive functionality, then the
master mode functions may have raised the interrupt line for the bus
before the DMA slave transfer is complete. It's important to have the
slave's interrupt status register clear throughout the receive
operation, and if the slave attempts to raise the interrupt before the
master interrupt status is cleared, then it needs to re-raise the
interrupt once the master interrupt status is cleared. (And vice-versa).
That's why in this commit, when the master interrupt status is cleared
and the interrupt line is lowered, we call the slave interrupt _raise_
function, to see if the interrupt was pending. (And again, vice-versa).

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c         | 133 ++++++++++++++++++++++++++++++++----
 include/hw/i2c/aspeed_i2c.h |   3 +
 2 files changed, 124 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 8a8514586f..fc8b6b62cf 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -78,6 +78,18 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
     }
 }
 
+static inline void aspeed_i2c_bus_raise_slave_interrupt(AspeedI2CBus *bus)
+{
+    AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
+
+    if (!bus->regs[R_I2CS_INTR_STS]) {
+        return;
+    }
+
+    bus->controller->intr_status |= 1 << bus->id;
+    qemu_irq_raise(aic->bus_get_irq(bus));
+}
+
 static uint64_t aspeed_i2c_bus_old_read(AspeedI2CBus *bus, hwaddr offset,
                                         unsigned size)
 {
@@ -140,8 +152,17 @@ static uint64_t aspeed_i2c_bus_new_read(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CM_DMA_LEN_STS:
     case A_I2CC_DMA_ADDR:
     case A_I2CC_DMA_LEN:
+
+    case A_I2CS_DEV_ADDR:
+    case A_I2CS_DMA_RX_ADDR:
+    case A_I2CS_DMA_LEN:
+    case A_I2CS_CMD:
+    case A_I2CS_INTR_CTRL:
+    case A_I2CS_DMA_LEN_STS:
         /* Value is already set, don't do anything. */
         break;
+    case A_I2CS_INTR_STS:
+        break;
     case A_I2CM_CMD:
         value = SHARED_FIELD_DP32(value, BUS_BUSY_STS, i2c_bus_busy(bus->bus));
         break;
@@ -547,12 +568,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
 
     switch (offset) {
     case A_I2CC_FUN_CTRL:
-        if (SHARED_FIELD_EX32(value, SLAVE_EN)) {
-            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
-                          __func__);
-            break;
-        }
-        bus->regs[R_I2CC_FUN_CTRL] = value & 0x007dc3ff;
+        bus->regs[R_I2CC_FUN_CTRL] = value;
         break;
     case A_I2CC_AC_TIMING:
         bus->regs[R_I2CC_AC_TIMING] = value & 0x1ffff0ff;
@@ -580,6 +596,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                 bus->controller->intr_status &= ~(1 << bus->id);
                 qemu_irq_lower(aic->bus_get_irq(bus));
             }
+            aspeed_i2c_bus_raise_slave_interrupt(bus);
             break;
         }
         bus->regs[R_I2CM_INTR_STS] &= ~(value & 0xf007f07f);
@@ -668,15 +685,53 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
     case A_I2CC_DMA_LEN:
         /* RO */
         break;
-    case A_I2CS_DMA_LEN_STS:
-    case A_I2CS_DMA_TX_ADDR:
-    case A_I2CS_DMA_RX_ADDR:
     case A_I2CS_DEV_ADDR:
+        bus->regs[R_I2CS_DEV_ADDR] = value;
+        break;
+    case A_I2CS_DMA_RX_ADDR:
+        bus->regs[R_I2CS_DMA_RX_ADDR] = value;
+        break;
+    case A_I2CS_DMA_LEN:
+        assert(FIELD_EX32(value, I2CS_DMA_LEN, TX_BUF_LEN) == 0);
+        if (FIELD_EX32(value, I2CS_DMA_LEN, RX_BUF_LEN_W1T)) {
+            ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN, RX_BUF_LEN,
+                             FIELD_EX32(value, I2CS_DMA_LEN, RX_BUF_LEN));
+        } else {
+            bus->regs[R_I2CS_DMA_LEN] = value;
+        }
+        break;
+    case A_I2CS_CMD:
+        if (FIELD_EX32(value, I2CS_CMD, W1_CTRL)) {
+            bus->regs[R_I2CS_CMD] |= value;
+        } else {
+            bus->regs[R_I2CS_CMD] = value;
+        }
+        i2c_slave_set_address(bus->slave, bus->regs[R_I2CS_DEV_ADDR]);
+        break;
     case A_I2CS_INTR_CTRL:
+        bus->regs[R_I2CS_INTR_CTRL] = value;
+        break;
+
     case A_I2CS_INTR_STS:
-    case A_I2CS_CMD:
-    case A_I2CS_DMA_LEN:
-        qemu_log_mask(LOG_UNIMP, "%s: Slave mode is not implemented\n",
+        if (ARRAY_FIELD_EX32(bus->regs, I2CS_INTR_CTRL, PKT_CMD_DONE)) {
+            if (ARRAY_FIELD_EX32(bus->regs, I2CS_INTR_STS, PKT_CMD_DONE) &&
+                FIELD_EX32(value, I2CS_INTR_STS, PKT_CMD_DONE)) {
+                bus->regs[R_I2CS_INTR_STS] &= 0xfffc0000;
+            }
+        } else {
+            bus->regs[R_I2CS_INTR_STS] &= ~value;
+        }
+        if (!bus->regs[R_I2CS_INTR_STS]) {
+            bus->controller->intr_status &= ~(1 << bus->id);
+            qemu_irq_lower(aic->bus_get_irq(bus));
+        }
+        aspeed_i2c_bus_raise_interrupt(bus);
+        break;
+    case A_I2CS_DMA_LEN_STS:
+        bus->regs[R_I2CS_DMA_LEN_STS] = 0;
+        break;
+    case A_I2CS_DMA_TX_ADDR:
+        qemu_log_mask(LOG_UNIMP, "%s: Slave mode DMA TX is not implemented\n",
                       __func__);
         break;
     default:
@@ -1037,6 +1092,39 @@ static const TypeInfo aspeed_i2c_info = {
     .abstract   = true,
 };
 
+static int aspeed_i2c_bus_new_slave_event(AspeedI2CBus *bus,
+                                          enum i2c_event event)
+{
+    switch (event) {
+    case I2C_START_SEND_ASYNC:
+        if (!SHARED_ARRAY_FIELD_EX32(bus->regs, R_I2CS_CMD, RX_DMA_EN)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: Slave mode RX DMA is not enabled\n", __func__);
+            return -1;
+        }
+        ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN, 0);
+        bus->regs[R_I2CC_DMA_ADDR] =
+            ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_RX_ADDR, ADDR);
+        bus->regs[R_I2CC_DMA_LEN] =
+            ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN, RX_BUF_LEN) + 1;
+        i2c_ack(bus->bus);
+        break;
+    case I2C_FINISH:
+        ARRAY_FIELD_DP32(bus->regs, I2CS_INTR_STS, PKT_CMD_DONE, 1);
+        ARRAY_FIELD_DP32(bus->regs, I2CS_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CS_INTR_STS, NORMAL_STOP, 1);
+        SHARED_ARRAY_FIELD_DP32(bus->regs, R_I2CS_INTR_STS, RX_DONE, 1);
+        aspeed_i2c_bus_raise_slave_interrupt(bus);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: i2c event %d unimplemented\n",
+                      __func__, event);
+        return -1;
+    }
+
+    return 0;
+}
+
 static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
@@ -1045,6 +1133,10 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
     uint32_t value;
 
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return aspeed_i2c_bus_new_slave_event(bus, event);
+    }
+
     switch (event) {
     case I2C_START_SEND_ASYNC:
         value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
@@ -1073,6 +1165,19 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
     return 0;
 }
 
+static void aspeed_i2c_bus_new_slave_send_async(AspeedI2CBus *bus, uint8_t data)
+{
+    assert(address_space_write(&bus->controller->dram_as,
+                               bus->regs[R_I2CC_DMA_ADDR],
+                               MEMTXATTRS_UNSPECIFIED, &data, 1) == MEMTX_OK);
+
+    bus->regs[R_I2CC_DMA_ADDR]++;
+    bus->regs[R_I2CC_DMA_LEN]--;
+    ARRAY_FIELD_DP32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN,
+                     ARRAY_FIELD_EX32(bus->regs, I2CS_DMA_LEN_STS, RX_LEN) + 1);
+    i2c_ack(bus->bus);
+}
+
 static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t data)
 {
     BusState *qbus = qdev_get_parent_bus(DEVICE(slave));
@@ -1080,6 +1185,10 @@ static void aspeed_i2c_bus_slave_send_async(I2CSlave *slave, uint8_t data)
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
 
+    if (aspeed_i2c_is_new_mode(bus->controller)) {
+        return aspeed_i2c_bus_new_slave_send_async(bus, data);
+    }
+
     SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, data);
     SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
 
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index ba148b2f6d..300a89b343 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -174,6 +174,8 @@ REG32(I2CM_DMA_LEN, 0x1c)
     FIELD(I2CM_DMA_LEN, TX_BUF_LEN_W1T, 15, 1)
     FIELD(I2CM_DMA_LEN, TX_BUF_LEN, 0, 11)
 REG32(I2CS_INTR_CTRL, 0x20)
+    FIELD(I2CS_INTR_CTRL, PKT_CMD_FAIL, 17, 1)
+    FIELD(I2CS_INTR_CTRL, PKT_CMD_DONE, 16, 1)
 REG32(I2CS_INTR_STS, 0x24)
     /* 31:29 shared with I2CD_INTR_STS[31:29] */
     FIELD(I2CS_INTR_STS, SLAVE_PARKING_STS, 24, 2)
@@ -184,6 +186,7 @@ REG32(I2CS_INTR_STS, 0x24)
     FIELD(I2CS_INTR_STS, PKT_CMD_FAIL, 17, 1)
     FIELD(I2CS_INTR_STS, PKT_CMD_DONE, 16, 1)
     /* 14:0 shared with I2CD_INTR_STS[14:0] */
+    FIELD(I2CS_INTR_STS, SLAVE_ADDR_RX_MATCH, 7, 1)
 REG32(I2CS_CMD, 0x28)
     FIELD(I2CS_CMD, W1_CTRL, 31, 1)
     FIELD(I2CS_CMD, PKT_MODE_ACTIVE_ADDR, 17, 2)
-- 
2.30.2


