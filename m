Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26F32F20C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:02:42 +0100 (CET)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEmg-0005IU-0g
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3f-0007Hx-3t
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:11 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3E-0007gv-7Z
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id e23so2101842wmh.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=U8N1K0rhPi91fNFYln0vQGfgl17HDLok4M7UyLBVV0w=;
 b=fLN0m3mcFhvftLTyGMw3A3k5sP88wrcfwv7EmOBoqf8v2ExH5RIbFHD5fZ/deB1asD
 T8uHe/yBBTzdDdSEAdcFQqvgesJqtNon5rEEcJ2TedyzRQJooLX032KF1BJZ92Oq3XEX
 o5uOuldC/i1LZS6iX/osUAbxnTjODxg/jg2ET2n2w6rCzqR6u/LV0/HOXcBZtbBoh72d
 Njkfk7eI+zbo2dK1Kv35d+Ui8FvxL9MJJGXNKxhmwRnT5joq2ZAGK5gmWDVC4vTG6DkE
 K/08siLPEaTRt6kuugxqPfDjmlM2IiI2xHw9+k98OJkdxAoaKvYGEAsgbgnFmnW5iYZA
 ZmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8N1K0rhPi91fNFYln0vQGfgl17HDLok4M7UyLBVV0w=;
 b=W7YBwXSGXS5PyISBh/oKdqmb0Xc14CAPh38z98QnTOZolOeTmfSyQ0QSEBwKA8/7oB
 FcyxocDzq+Qzxr/xZO6O53h0IDXh7OJAyV2xkSo0DdiqUzNDl09Tjz2LBypkmh/36VHl
 Fv7R2uTysGNNaq4yqbeYya/5DO+d/Ll4WyOFSRVLas/VITVhQHChw1NovgNG3oEXM6lt
 DVh7CKGIAYQf9af6BTK3L5Sly+eX4v7cdxr2eLfE19hreF4WV6INn5E9kVPBuWo/1uvz
 NGyF4EWmff5G2JQdWAkVmSIF/qqAArWm36rBOyRA69qo+I/C0v63IcP9XrvG8MVQmnjV
 Rt6A==
X-Gm-Message-State: AOAM533CwQFTl3bMxHW3jg7GxIGALKum253fnQgysg+yu17nFpJ7kT8q
 EFvQjSR9q+IqXnrkDT2gBezUJbdVxLG3yg==
X-Google-Smtp-Source: ABdhPJx8/9wePSU1SFGCc2EqWZeHDeXfAflq9NT4//NeDOSd6YqeW438VdifGvKJfvkPUmRefGAY7Q==
X-Received: by 2002:a1c:17:: with SMTP id 23mr9985151wma.6.1614964542544;
 Fri, 05 Mar 2021 09:15:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/49] hw/arm/mps2-tz: Correct wrong interrupt numbers for DMA
 and SPI
Date: Fri,  5 Mar 2021 17:15:02 +0000
Message-Id: <20210305171515.1038-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-12-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index eea9a71ddc0..b9b1351fa74 100644
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


