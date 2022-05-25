Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803D9534137
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:19:36 +0200 (CEST)
Received: from localhost ([::1]:33182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttjT-0004BC-Jk
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSf-000793-7C; Wed, 25 May 2022 12:02:13 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:44733
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Lufh=WB=kaod.org=clg@ozlabs.org>)
 id 1nttSb-0004AX-Ds; Wed, 25 May 2022 12:02:12 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4L7bRg0dqXz4ySr;
 Thu, 26 May 2022 02:02:07 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7bRd26T9z4xXj;
 Thu, 26 May 2022 02:02:05 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 10/15] hw: aspeed: Init all UART's with serial devices
Date: Wed, 25 May 2022 18:01:31 +0200
Message-Id: <20220525160136.556277-11-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525160136.556277-1-clg@kaod.org>
References: <20220525160136.556277-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Lufh=WB=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

From: Peter Delevoryas <pdel@fb.com>

Background:

AspeedMachineClass.uart_default specifies the serial console UART, which
usually corresponds to the "stdout-path" in the device tree.

The default value is UART5, since most boards use UART5 for this:

    amc->uart_default = ASPEED_DEV_UART5;

Users can override AspeedMachineClass.uart_default in their board's machine
class init to specify something besides UART5. For example, for fuji-bmc:

    amc->uart_default = ASPEED_DEV_UART1;

We only connect this one UART, of the 5 UART's on the AST2400 and AST2500
and the 13 UART's on the AST2600 and AST1030, to a serial device that QEMU
users can use. None of the other UART's are initialized, and the only way
to override this attribute is by creating a specialized board definition,
requiring QEMU source code changes and rebuilding.

The result of this is that if you want to get serial console output on a
board that uses UART3, you need to add a board definition. This was
encountered by Zev in OpenBMC. [1]

Changes:

This commit initializes all of the UART's present on each Aspeed chip with
serial devices and allows the QEMU user to connect as many or few as they
like to serial devices. For example, you can still run QEMU and just connect
stdout to the machine's default UART, without specifying any additional
serial devices:

    qemu-system-arm -machine fuji-bmc \
        -drive file=fuji.mtd,format=raw,if=mtd \
        -nographic

However, if you don't want to add a special machine definition, you can now
manually configure UART1 to connect to stdout and get serial console output,
even if the machine's default is UART5:

    qemu-system-arm -machine ast2600-evb \
        -drive file=fuji.mtd,format=raw,if=mtd \
        -serial null -serial mon:stdio -display none

In the example above, the first "-serial null" argument is connected to
UART5, and "-serial mon:stdio" is connected to UART1.

Another example: you can get serial console output from Wedge100, which uses
UART3, by reusing the palmetto AST2400 machine and rewiring the serial
device arguments:

    qemu-system-arm -machine palmetto-bmc \
        -drive file=wedge100.mtd,format=raw,if=mtd \
        -serial null -serial null -serial null \
        -serial mon:stdio -display none

There is a slight change in behavior introduced with this change: now, each
UART's memory-mapped IO region will have a serial device model connected to
it. Previously, all reads and writes to those regions would be ineffective
and return zero values, but now some values will be nonzero, even when the
user doesn't connect a serial device backend (like a socket, file, etc). For
example, the line status register might indicate that the transmit buffer is
empty now, whereas previously it might have always indicated it was full.

[1] https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net/
[2] https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
[3] https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd

Signed-off-by: Peter Delevoryas <pdel@fb.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220516062328.298336-6-pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 912798a9c92f..30574d4276ab 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -546,9 +546,18 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
 void aspeed_soc_uart_init(AspeedSoCState *s)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int i, uart;
 
     /* Attach an 8250 to the IO space as our UART */
     serial_mm_init(get_system_memory(), sc->memmap[s->uart_default], 2,
                    aspeed_soc_get_irq(s, s->uart_default), 38400,
                    serial_hd(0), DEVICE_LITTLE_ENDIAN);
+    for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+        if (uart == s->uart_default) {
+            uart++;
+        }
+        serial_mm_init(get_system_memory(), sc->memmap[uart], 2,
+                       aspeed_soc_get_irq(s, uart), 38400,
+                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
+    }
 }
-- 
2.35.3


