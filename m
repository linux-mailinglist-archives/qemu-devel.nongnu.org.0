Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20052167F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 11:45:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRZQs-0007XN-Vs
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 05:45:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hRZM1-0004IQ-0Y
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:40:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hRZLz-00022Y-NA
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:40:40 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:55346
	helo=mail.default.ilande.uk0.bigv.io)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hRZLz-0001xo-F0
	for qemu-devel@nongnu.org; Fri, 17 May 2019 05:40:39 -0400
Received: from host109-146-247-8.range109-146.btcentralplus.com
	([109.146.247.8] helo=kentang.home)
	by mail.default.ilande.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hRZLD-00018L-7T; Fri, 17 May 2019 10:39:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Date: Fri, 17 May 2019 10:40:22 +0100
Message-Id: <20190517094029.7667-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190517094029.7667-1-mark.cave-ayland@ilande.co.uk>
References: <20190517094029.7667-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.247.8
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PULL 1/8] hw/char/escc: Lower irq when transmit
 buffer is filled
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stephen Checkoway <stephen.checkoway@oberlin.edu>

The SCC/ESCC will briefly stop asserting an interrupt when the
transmit FIFO is filled.

This code doesn't model the transmit FIFO/shift register so the
pending transmit interrupt is never deasserted which means that an
edge-triggered interrupt controller will never see the low-to-high
transition it needs to raise another interrupt. The practical
consequence of this is that guest firmware with an interrupt service
routine for the ESCC that does not send all of the data it has
immediately will stop sending data if the following sequence of
events occurs:
1. Disable processor interrupts
2. Write a character to the ESCC
3. Add additional characters to a buffer which is drained by the ISR
4. Enable processor interrupts

In this case, the first character will be sent, the interrupt will
fire and the ISR will output the second character. Since the pending
transmit interrupt remains asserted, no additional interrupts will
ever fire.

This behavior was triggered by firmware for an embedded system with a
Z85C30 which necessitated this patch.

This patch fixes that situation by explicitly lowering the IRQ when a
character is written to the buffer and no other interrupts are currently
pending.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/char/escc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 628f5f81f7..c5b05a63f1 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -509,6 +509,13 @@ static void escc_mem_write(void *opaque, hwaddr addr,
         break;
     case SERIAL_DATA:
         trace_escc_mem_writeb_data(CHN_C(s), val);
+        /*
+         * Lower the irq when data is written to the Tx buffer and no other
+         * interrupts are currently pending. The irq will be raised again once
+         * the Tx buffer becomes empty below.
+         */
+        s->txint = 0;
+        escc_update_irq(s);
         s->tx = val;
         if (s->wregs[W_TXCTRL2] & TXCTRL2_TXEN) { // tx enabled
             if (qemu_chr_fe_backend_connected(&s->chr)) {
-- 
2.11.0


