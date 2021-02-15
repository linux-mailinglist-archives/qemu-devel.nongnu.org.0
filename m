Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7CD31B8C4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:10:13 +0100 (CET)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBchg-0003hW-QB
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQY-0007hc-R2
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:30 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQX-000415-3D
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id v7so8455379wrr.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ok51mWFe/EHn9mJ70RUpKX9SuyFsEZZOYsJcbxrhCtM=;
 b=MWrc0AdmkdABWEbP2TLy1p4KVEBQRu5S9EoM5KOj7yuStRi8WBRv1lHgVE6nZYdGDW
 0KoycWMpLjOBd2lF0aVPyOau+OlVaeKi+U7RlcRbDGFrFRQgvUCD8zHYhx9xxFsLpLwc
 TIRXQsLc0R5CNfOAEbJbjJsIJwlU/litP9jK26CNJyumaVviN6SkxFmV/9bDmaRSq5Tp
 aoI6Y1p5Smum6V3tw30EU2O7Z2+ZiIRHJ3u+WuUB/n99JVMWrckYJsl3cVSxQbGbLdm2
 6ZgyyULFAFst2U+kG/QQ6MkPG9N1gPWyOH9eUA/LjduSpzjjKzVN6Cdcv/K20wKqnbDn
 +Urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ok51mWFe/EHn9mJ70RUpKX9SuyFsEZZOYsJcbxrhCtM=;
 b=FpAomon8pwjASRrWAY+1goKajSop7EK/v1ID5aKEHKct9kiL2SSsj48caTAx8ghZy8
 b4b9nJp8jrQLtRJ+ox5vxjfBKDMK+V04/QywDL3tY+WVN/9WaEAYxE6YK8dLeuOHQ+GD
 ujt0pU9ehaXdIoc8w81OqpbGMKixbW9Ox798U/J+us50tlj5QjgzEJYBrOKyvzhCzD5I
 RHAWuDASRicdIDoSdawm8Ku+9VeQ5nOSEVO9LtfGE/RUswvWEHVuX2W3oMK+0bt3bK2L
 ME+DWpnRuds6lXbOibc05/bny50Kmo7/CVqoHRsXOpgBN7uMWPC5iAz8SlppdQg4hJUt
 HUqA==
X-Gm-Message-State: AOAM530OWllDFbmL0+drHaFkcGasThHertJcojE4+SdojfD93yj84omD
 i0dSPAVx0DO+PTnpvTdnyPO3mQ==
X-Google-Smtp-Source: ABdhPJyy0u6L1qTrOY2Uu/VHz/avD5zg6jKgMFuI26LQs9SYJxwrfidrXKhxz/ZFz2RwkCm8yvqlYw==
X-Received: by 2002:a05:6000:1cc:: with SMTP id
 t12mr17719201wrx.142.1613389947866; 
 Mon, 15 Feb 2021 03:52:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/24] hw/arm/mps2-tz: Correct wrong interrupt numbers for
 DMA and SPI
Date: Mon, 15 Feb 2021 11:51:25 +0000
Message-Id: <20210215115138.20465-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
index 6362652e617..ff8b7e5f1ae 100644
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


