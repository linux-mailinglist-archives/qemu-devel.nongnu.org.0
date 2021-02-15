Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2851B31C541
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:07:02 +0100 (CET)
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBplU-0003tF-JI
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lBn5x-00036V-Qp
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:15:57 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.221]:33317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lBn5v-0004qU-M5
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 18:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1613430950;
 s=strato-dkim-0002; d=ulal.de;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=mP6vnzx1bOnH5ayVmsm6Y4XavvCKI64f/p4yWr3MDxA=;
 b=axTG2tVHz+zlnDzaVmQux6ObTpsi5NYCmXdCUP+tqTxYGUR/xu7glIZB7IZRTe7CHj
 gI5j+Wfosk939yQnTkzyEBKQEHsxL+IKNJcHgTf2DVhgt/gGnIlNS/IkhHXRlQOF/ppm
 F5vbZYF7/oTyJGnkzJ4D479YiX+k/XdZJg0J58QUAWfUQSmOLda1iIlHcoqt2A/M7MzA
 GJ8i5E/8Kv0UGstl8/P506T9LmT4jZ7NcZDpSkhCLBV+r14u2IrqmHMRotrVFoNfible
 o9+ZrWQIu/C3mtoFFFe/Ujb35MFQHZVhkzmcMbkJm7Kl1fxOKgx8jyV8uPYIGyq3gZ3E
 Vjaw==
X-RZG-AUTH: ":LWABbUGmf/p3d3fx281mbpk9zOkHG9L8L9MnY9md4b2JTjr0xj1uUQtYCbJnQW9aY+KkeQGMenXp3aVVIrQH1y0no9Td6RznSK+7tpWsnlYtAiaE"
X-RZG-CLASS-ID: mo00
Received: from alwagner-T470s.fritz.box by smtp.strato.de (RZmta 47.18.0 AUTH)
 with ESMTPSA id i0935ax1FNFk1eG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 Feb 2021 00:15:46 +0100 (CET)
From: Alexander Wagner <alexander.wagner@ulal.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/char: disable ibex uart receive if the buffer is full
Date: Tue, 16 Feb 2021 00:15:28 +0100
Message-Id: <20210215231528.2718086-1-alexander.wagner@ulal.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=81.169.146.221;
 envelope-from=alexander.wagner@ulal.de; helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Feb 2021 21:06:05 -0500
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
Cc: marcandre.lureau@redhat.com, Alistair.Francis@wdc.com,
 Alexander Wagner <alexander.wagner@ulal.de>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not disabling the UART leads to QEMU overwriting the UART receive buffer with
the newest received byte. The rx_level variable is added to allow the use of
the existing OpenTitan driver libraries.

Signed-off-by: Alexander Wagner <alexander.wagner@ulal.de>
---
 hw/char/ibex_uart.c         | 20 +++++++++++++++-----
 include/hw/char/ibex_uart.h |  4 ++++
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index 89f1182c9b..dac09d53d6 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -66,7 +66,8 @@ static int ibex_uart_can_receive(void *opaque)
 {
     IbexUartState *s = opaque;
 
-    if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
+    if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK)
+           && !(s->uart_status & R_STATUS_RXFULL_MASK)) {
         return 1;
     }
 
@@ -83,6 +84,8 @@ static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)
 
     s->uart_status &= ~R_STATUS_RXIDLE_MASK;
     s->uart_status &= ~R_STATUS_RXEMPTY_MASK;
+    s->uart_status |= R_STATUS_RXFULL_MASK;
+    s->rx_level += 1;
 
     if (size > rx_fifo_level) {
         s->uart_intr_state |= R_INTR_STATE_RX_WATERMARK_MASK;
@@ -199,6 +202,7 @@ static void ibex_uart_reset(DeviceState *dev)
     s->uart_timeout_ctrl = 0x00000000;
 
     s->tx_level = 0;
+    s->rx_level = 0;
 
     s->char_tx_time = (NANOSECONDS_PER_SECOND / 230400) * 10;
 
@@ -243,11 +247,15 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
 
     case R_RDATA:
         retvalue = s->uart_rdata;
-        if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
+        if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) && (s->rx_level > 0)) {
             qemu_chr_fe_accept_input(&s->chr);
 
-            s->uart_status |= R_STATUS_RXIDLE_MASK;
-            s->uart_status |= R_STATUS_RXEMPTY_MASK;
+            s->rx_level -= 1;
+            s->uart_status &= ~R_STATUS_RXFULL_MASK;
+            if (s->rx_level == 0) {
+                s->uart_status |= R_STATUS_RXIDLE_MASK;
+                s->uart_status |= R_STATUS_RXEMPTY_MASK;
+            }
         }
         break;
     case R_WDATA:
@@ -261,7 +269,8 @@ static uint64_t ibex_uart_read(void *opaque, hwaddr addr,
     case R_FIFO_STATUS:
         retvalue = s->uart_fifo_status;
 
-        retvalue |= s->tx_level & 0x1F;
+        retvalue |= (s->rx_level & 0x1F) << R_FIFO_STATUS_RXLVL_SHIFT;
+        retvalue |= (s->tx_level & 0x1F) << R_FIFO_STATUS_TXLVL_SHIFT;
 
         qemu_log_mask(LOG_UNIMP,
                       "%s: RX fifos are not supported\n", __func__);
@@ -364,6 +373,7 @@ static void ibex_uart_write(void *opaque, hwaddr addr,
         s->uart_fifo_ctrl = value;
 
         if (value & R_FIFO_CTRL_RXRST_MASK) {
+            s->rx_level = 0;
             qemu_log_mask(LOG_UNIMP,
                           "%s: RX fifos are not supported\n", __func__);
         }
diff --git a/include/hw/char/ibex_uart.h b/include/hw/char/ibex_uart.h
index 03d19e3f6f..546f958eb8 100644
--- a/include/hw/char/ibex_uart.h
+++ b/include/hw/char/ibex_uart.h
@@ -62,6 +62,8 @@ REG32(FIFO_CTRL, 0x1c)
     FIELD(FIFO_CTRL, RXILVL, 2, 3)
     FIELD(FIFO_CTRL, TXILVL, 5, 2)
 REG32(FIFO_STATUS, 0x20)
+    FIELD(FIFO_STATUS, TXLVL, 0, 5)
+    FIELD(FIFO_STATUS, RXLVL, 16, 5)
 REG32(OVRD, 0x24)
 REG32(VAL, 0x28)
 REG32(TIMEOUT_CTRL, 0x2c)
@@ -82,6 +84,8 @@ struct IbexUartState {
     uint8_t tx_fifo[IBEX_UART_TX_FIFO_SIZE];
     uint32_t tx_level;
 
+    uint32_t rx_level;
+
     QEMUTimer *fifo_trigger_handle;
     uint64_t char_tx_time;
 
-- 
2.25.1


