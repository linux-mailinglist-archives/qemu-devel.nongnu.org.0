Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6E82B51C9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:01:46 +0100 (CET)
Received: from localhost ([::1]:47070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekh7-0003eR-IR
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:01:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tpecar95@gmail.com>)
 id 1kekdu-0001i9-If; Mon, 16 Nov 2020 14:58:26 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:39988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tpecar95@gmail.com>)
 id 1kekds-000277-7f; Mon, 16 Nov 2020 14:58:26 -0500
Received: by mail-ej1-x644.google.com with SMTP id oq3so26152052ejb.7;
 Mon, 16 Nov 2020 11:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=95YF1DxmKlplDDA5UXKop65ahMRsDSa1DY6KTPS4nLA=;
 b=hHifFsCKxq2d7jKMptchS/hbtT8nccLATaByuDF8r1VBMDQXQ4xzewn0isWNfckh+9
 Ar7cFSh4JhMoEq1Jh5BnyIDCWq+yaKRoNIl+iGCdfKzC3qOkquw8VzQWVu9nsyvvslZ9
 HgHv376617nIp+nt+kZre96NHAB6aWSOUi7XULMrTXBJIoGnFMDrkNlUh10Ldnn7yEIo
 N2ZbemUHPn+SBATIpsAIcIh1gRnCF/GmcNQte/V0ZvOcjf5dnPmNld9CRhgf7PX9Xg/H
 PTSDtduVr6EHlCHL8ACf8bxLXD4j8HSsEpODzUVjF6I5S9zd+JrjvJyh5zJ18Dr+FY6Y
 PvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=95YF1DxmKlplDDA5UXKop65ahMRsDSa1DY6KTPS4nLA=;
 b=RjK2FrEobe+uLjvzkD1do//kJ7qxL1N9CGyROqxNNfEQfijFKyqPlDxAOFq/rxuZpa
 QwvCyW14LFNjLNdyFfe+gYBmxRzEPFHRtIxPgYbaTUJgfEIavIoaEPE+MQLl/FgNu4Zk
 ovLhDed6Navf1LDkOwVoA8uOtPi0YIPaFxPFZsm0HORMXaNu5F8i0TVmEQHjHGMr8NWA
 ZxSmK/A4Js2Ipgd9P3R1r8wSmos6p3BMGyx5wOBtarH5302gWhb7ttL6aGcACz97gu3A
 rgsyFPiRpxnrWhMAIhyw/j0m25nUOIROnlYzY8LkyTx1sk3wWhnI4VH5fBDBXuzUon40
 yTug==
X-Gm-Message-State: AOAM532GuWdP63O7LCPuMxPAxEKkB88YUFfVhcnbzW67bNh+iPX6q9vA
 Byr1DDI4mXm449yr/RWsix8=
X-Google-Smtp-Source: ABdhPJyDJIBZNQ/7mO0swgsitEKXpKJZXMWOVhOTjkngROnieghJ0s4h2q2/BzBTHP01x0IFQOuoug==
X-Received: by 2002:a17:906:4dd4:: with SMTP id
 f20mr16024952ejw.94.1605556700280; 
 Mon, 16 Nov 2020 11:58:20 -0800 (PST)
Received: from [192.168.0.16] ([77.73.106.198])
 by smtp.gmail.com with ESMTPSA id cn8sm10948619edb.18.2020.11.16.11.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 11:58:19 -0800 (PST)
From: =?UTF-8?Q?Tadej_Pe=c4=8dar?= <tpecar95@gmail.com>
Subject: [PATCH v2] hw/char/cmsdk-apb-uart: Fix rx interrupt handling
To: qemu-devel@nongnu.org
Message-ID: <107912fb-4570-2e61-c6ff-7b8df1ec5cac@gmail.com>
Date: Mon, 16 Nov 2020 20:58:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=tpecar95@gmail.com; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously, the RX interrupt got missed if:
- the character backend provided next character before
   the RX IRQ Handler managed to clear the currently served interrupt.
- the character backend provided next character while the RX interrupt
   was disabled. Enabling the interrupt did not trigger the interrupt
   even if the RXFULL status bit was set.

These bugs become apparent when the terminal emulator buffers the line
before sending it to qemu stdin (Eclipse IDE console does this).

---
Patch was tested on the mps2-an500 machine with
  - a baremetal application using a USART_V2M-MPS2.c driver,
    sourced from Keil.V2M-MPS2_CMx_BSP.1.7.0.pack
    (available at https://www.keil.com/dd2/Pack/),
    which invoked the aforementioned bugs.

    The following command line was used
      qemu-system-arm -M mps2-an500 -serial stdio -display none -device loader,file=baremetal-app.elf

  - uClinux system, built with the following instructions
    https://community.arm.com/developer/tools-software/oss-platforms/w/docs/578/running-uclinux-on-the-arm-mps2-platform

    The linux "mps2-uart" driver works and seems unaffected by this patch.

    The following command line was used
      qemu-system-arm -M mps2-an500 -serial stdio -display none -kernel boot.axf -device loader,file=linux.axf

---
Changes:
- original patch -> v2:
     Removed unnecessary check in uart_write, since this is sufficiently
     handled in cmsdk_apb_uart_update

     Better formatting, documentation.


Signed-off-by: Tadej Pecar <tpecar95@gmail.com>
---
  hw/char/cmsdk-apb-uart.c | 47 +++++++++++++++++++++++++++-------------
  hw/char/trace-events     |  1 +
  2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
index 626b68f2ec..d76ca76e01 100644
--- a/hw/char/cmsdk-apb-uart.c
+++ b/hw/char/cmsdk-apb-uart.c
@@ -96,19 +96,34 @@ static void uart_update_parameters(CMSDKAPBUART *s)
  
  static void cmsdk_apb_uart_update(CMSDKAPBUART *s)
  {
-    /* update outbound irqs, including handling the way the rxo and txo
-     * interrupt status bits are just logical AND of the overrun bit in
-     * STATE and the overrun interrupt enable bit in CTRL.
+    /*
+     * update outbound irqs
+     * (
+     *     state     [rxo,  txo,  rxbf, txbf ] at bit [3, 2, 1, 0]
+     *   | intstatus [rxo,  txo,  rx,   tx   ] at bit [3, 2, 1, 0]
+     * )
+     * & ctrl        [rxoe, txoe, rxe,  txe  ] at bit [5, 4, 3, 2]
+     * = masked_intstatus
+     *
+     * state: status register
+     * intstatus: pending interrupts and is sticky (has to be cleared by sw)
+     * masked_intstatus: masked (by ctrl) pending interrupts
+     *
+     * intstatus [rxo, txo, rx] bits are set here
+     * intstatus [tx] is managed in uart_transmit
       */
-    uint32_t omask = (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK);
-    s->intstatus &= ~omask;
-    s->intstatus |= (s->state & (s->ctrl >> 2) & omask);
-
-    qemu_set_irq(s->txint, !!(s->intstatus & R_INTSTATUS_TX_MASK));
-    qemu_set_irq(s->rxint, !!(s->intstatus & R_INTSTATUS_RX_MASK));
-    qemu_set_irq(s->txovrint, !!(s->intstatus & R_INTSTATUS_TXO_MASK));
-    qemu_set_irq(s->rxovrint, !!(s->intstatus & R_INTSTATUS_RXO_MASK));
-    qemu_set_irq(s->uartint, !!(s->intstatus));
+    s->intstatus |= s->state &
+        (R_INTSTATUS_RXO_MASK | R_INTSTATUS_TXO_MASK | R_INTSTATUS_RX_MASK);
+
+    uint32_t masked_intstatus = s->intstatus & (s->ctrl >> 2);
+
+    trace_cmsdk_apb_uart_update(s->state, s->intstatus, masked_intstatus);
+
+    qemu_set_irq(s->txint,    !!(masked_intstatus & R_INTSTATUS_TX_MASK));
+    qemu_set_irq(s->rxint,    !!(masked_intstatus & R_INTSTATUS_RX_MASK));
+    qemu_set_irq(s->txovrint, !!(masked_intstatus & R_INTSTATUS_TXO_MASK));
+    qemu_set_irq(s->rxovrint, !!(masked_intstatus & R_INTSTATUS_RXO_MASK));
+    qemu_set_irq(s->uartint,  !!(masked_intstatus));
  }
  
  static int uart_can_receive(void *opaque)
@@ -144,9 +159,11 @@ static void uart_receive(void *opaque, const uint8_t *buf, int size)
  
      s->rxbuf = *buf;
      s->state |= R_STATE_RXFULL_MASK;
-    if (s->ctrl & R_CTRL_RX_INTEN_MASK) {
-        s->intstatus |= R_INTSTATUS_RX_MASK;
-    }
+
+    /*
+     * Handled in cmsdk_apb_uart_update, in order to properly handle
+     * pending rx interrupt when rxen gets enabled
+     */
      cmsdk_apb_uart_update(s);
  }
  
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 81026f6612..0821c8eb3a 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -68,6 +68,7 @@ pl011_put_fifo_full(void) "FIFO now full, RXFF set"
  pl011_baudrate_change(unsigned int baudrate, uint64_t clock, uint32_t ibrd, uint32_t fbrd) "new baudrate %u (clk: %" PRIu64 "hz, ibrd: %" PRIu32 ", fbrd: %" PRIu32 ")"
  
  # cmsdk-apb-uart.c
+cmsdk_apb_uart_update(uint32_t state, uint32_t intstatus, uint32_t masked_intstatus) "CMSDK APB UART update: state 0x%x intstatus 0x%x masked_intstatus 0x%x"
  cmsdk_apb_uart_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB UART read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
  cmsdk_apb_uart_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB UART write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
  cmsdk_apb_uart_reset(void) "CMSDK APB UART: reset"
-- 
2.29.2


