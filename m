Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E0310FA7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 19:14:34 +0100 (CET)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85cn-0004oJ-W1
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 13:14:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Tj-0006rP-JE
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:09 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84TG-000442-Bb
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 12:01:06 -0500
Received: by mail-wr1-x433.google.com with SMTP id a1so8458378wrq.6
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 09:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=z2Vyh+lBTQMBhsM4yGTc2A7bMPBGx/fyuKp+EIKhHX0=;
 b=eJHfa3q+jWJ5y5NK0pUi3jsKKRsfq4GBkqvwHJDraKeU1GgSeoKXlPdutpu0gPXnD9
 HCQPe/nOiD8f2aG8Ean57IQEe1wpku3pdUOuY01e/CqUG3iq0XYivuU0135RKSn+cA0R
 qnKCAmQ+/ucwHIMsI4C7aj0DGAdteZaCiz07W76/a1604S71rXw1oLUNPP7NRATnoRMd
 /t0iRI5VT8F/0tBGqmTtTxi4hJArjuf+40ftr4TnE5u7Yv3rrU7/qJaZ8dF0L0x63p6K
 fysz/OE3qQXkJ8nVl1WzppYqbHA6m3bmyOZ/QqqzympfXhwro48KlDvkZYxb61+OsJ6s
 ruSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z2Vyh+lBTQMBhsM4yGTc2A7bMPBGx/fyuKp+EIKhHX0=;
 b=BkEU5a7HPczWwfyHN0pIM0TH7LXxKLr+ZK5evVs5ISGx8/Bx864+YuGPmLZOglI4/s
 sh9jvIonw/qO8Yl1OX9QbOp2EUgJKsaoA6CvPh2rclgVi+ZIwNKg4bve20CaYSG6byom
 mRzUCDnR7G9Qk+jBBH+F0BHfotbvW1D6Shf4AZSsE/le4l3emi/PjowQuyriwdQPWmRI
 L5KoTTx4blxsLTo69lLpS0qjZT6/zDYyhLoHlyR/vdY8EYyqjp5lWXWljTAwYIpj8OuM
 2P3g35F+CybUNPCX5sSSloZbsBCFOQHbzgr96jpNFIOHcp7i6pqC7WTvMbvUBS9u/V+i
 amHw==
X-Gm-Message-State: AOAM530MisL0ZKPRuMXLVZdnoFcSekd6zrQomqqhh1SZ5K/ZBpBs7D4n
 +cMvNdV7YCK1Yy9xzJ6zzpHJzA==
X-Google-Smtp-Source: ABdhPJxg4955ettY9yKZGr1oxK+uy0EH8PSGQAd7fyM0Tw/FlcPyIPcQlZDPoX3lxfsY9Z7iSSPqKg==
X-Received: by 2002:a05:6000:1045:: with SMTP id
 c5mr6274932wrx.250.1612544430834; 
 Fri, 05 Feb 2021 09:00:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/24] hw/arm/mps2-tz: Correct wrong interrupt numbers for DMA
 and SPI
Date: Fri,  5 Feb 2021 17:00:06 +0000
Message-Id: <20210205170019.25319-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On the MPS2 boards, the first 32 interrupt lines are entirely
internal to the SSE; interrupt lines for devices outside the SSE
start at 32.  In the application notes that document each FPGA image,
the interrupt wiring is documented from the point of view of the CPU,
so '0' is the first of the SSE's interrupts and the devices in the
FPGA image itself are '32' and up: so the UART 0 Receive interrupt is
32, the SPI #0 interrupt is 51, and so on.

Within our implementation, because the external interrupts must be
connected to the EXP_IRQ[0...n] lines of the SSE object, we made the
get_sse_irq_in() function take an irqno whose values start at 0 for
the first FPGA device interrupt.  In this numbering scheme the UART 0
Receive interrupt is 0, the SPI #0 interrupt is 19, and so on.

The result of these two different numbering schemes has been that
half of the devices were wired up to the wrong IRQs: the UART IRQs
are wired up correctly, but the DMA and SPI devices were passing
start-at-32 values to get_sse_irq_in() and so being mis-connected.

Fix the bug by making get_sse_irq_in() take values specified with the
same scheme that the hardware manuals use, to avoid confusion.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 0f021676854..844092f4fd5 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -139,11 +139,21 @@ static void make_ram_alias(MemoryRegion *mr, const char *name,
 
 static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
 {
-    /* Return a qemu_irq which will signal IRQ n to all CPUs in the SSE. */
+    /*
+     * Return a qemu_irq which will signal IRQ n to all CPUs in the
+     * SSE.  The irqno should be as the CPU sees it, so the first
+     * external-to-the-SSE interrupt is 32.
+     */
     MachineClass *mc = MACHINE_GET_CLASS(mms);
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
-    assert(irqno < mmc->numirq);
+    assert(irqno >= 32 && irqno < (mmc->numirq + 32));
+
+    /*
+     * Convert from "CPU irq number" (as listed in the FPGA image
+     * documentation) to the SSE external-interrupt number.
+     */
+    irqno -= 32;
 
     if (mc->max_cpus > 1) {
         return qdev_get_gpio_in(DEVICE(&mms->cpu_irq_splitter[irqno]), 0);
@@ -197,9 +207,9 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
     CMSDKAPBUART *uart = opaque;
     int i = uart - &mms->uart[0];
-    int rxirqno = i * 2;
-    int txirqno = i * 2 + 1;
-    int combirqno = i + 10;
+    int rxirqno = i * 2 + 32;
+    int txirqno = i * 2 + 33;
+    int combirqno = i + 42;
     SysBusDevice *s;
     DeviceState *orgate_dev = DEVICE(&mms->uart_irq_orgate);
 
@@ -266,7 +276,7 @@ static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
 
     s = SYS_BUS_DEVICE(mms->lan9118);
     sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, 16));
+    sysbus_connect_irq(s, 0, get_sse_irq_in(mms, 48));
     return sysbus_mmio_get_region(s, 0);
 }
 
@@ -507,7 +517,7 @@ static void mps2tz_common_init(MachineState *machine)
                             &error_fatal);
     qdev_realize(DEVICE(&mms->uart_irq_orgate), NULL, &error_fatal);
     qdev_connect_gpio_out(DEVICE(&mms->uart_irq_orgate), 0,
-                          get_sse_irq_in(mms, 15));
+                          get_sse_irq_in(mms, 47));
 
     /* Most of the devices in the FPGA are behind Peripheral Protection
      * Controllers. The required order for initializing things is:
-- 
2.20.1


