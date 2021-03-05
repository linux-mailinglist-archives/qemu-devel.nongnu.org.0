Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DFE32F266
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:23:53 +0100 (CET)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIF7A-0000Wl-8o
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3c-0007HY-24
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:08 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3E-0007go-7n
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:07 -0500
Received: by mail-wr1-x429.google.com with SMTP id v15so2901294wrx.4
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oP3CT04XKlwuVPV4fYKY0Y2dePdSjtQgxbmpYLn2vtI=;
 b=ztAE/8kHPoiQ8dgvohn1PvAxWFO2VSa7mFUCg/ozzcYl9pd16245uZcuuYbcqS9eoM
 YlUWdxlgYyT8QCCS6IEOvKf0vpnlHHIUshTNkVvZLwWxh8khIipwAioURngNJvhDKOmE
 j8oj+aD/8pb22FcHrf2KkORQctgL+EJgSMG0BKb84Pv/S/Lr2eDy8pEpPh7j9uMPI3yQ
 5BMJbmmostXtyWLI4eXG06MU+S0I3otRnLoydwXnwlp/73oFUpTNRB2t9MVWQJxxq1a0
 l8uts3vsfDK51y7/60Rh097Kao2VQWzCafpOstlbRTTOm+TKhKvi9z9yPQY++ox1j4Ow
 Llmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oP3CT04XKlwuVPV4fYKY0Y2dePdSjtQgxbmpYLn2vtI=;
 b=WPN22g1AnQjuIBgnS6a1f6fJ2EpNDE1eWiHjiVcXEUDA8LO+1qyhWyRVX8bcxtGVlx
 lQW3va2F00ocCgfz6ZYhwBxtXTLvTNeJATp9dJV3whxF2tBBv9iiikhBmNEFznHi1ujO
 Fs0Cw/0SO7u3i+f4yaLHQ6hWJ3IYNC/QUYRHCKgoM0r1ceQDn/zMhrYxiPsdxvqPhUHn
 5dojIHczJcaKWPeWNdtVG3agJAqL0mgZYa16ZJM21357zw5ozHt0yvAnvJAFoH06uS6u
 orJ4QlIq0bDJdWT+FLnxmI/Hh7q51gHMDBTet5NN7cBfq6VXAAl+E4bQJ93FZ/DvQIwa
 oQkQ==
X-Gm-Message-State: AOAM531g/9piLRqdcyxa4BLFWPou1jitXOvosGM/mQJu2KCq153wxa/u
 NgFjSfzF4JpOx0U1ytzKINOuwmakLXLiMg==
X-Google-Smtp-Source: ABdhPJwkoaID6b23spHASNQHMuk654AbNhkHJmDZvJSoomLW/+HIGOHMJu3Od3T9IPL/X5+ibBb1Dg==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr10026060wrs.43.1614964541212; 
 Fri, 05 Mar 2021 09:15:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/49] hw/arm/mps2-tz: Make number of IRQs board-specific
Date: Fri,  5 Mar 2021 17:15:00 +0000
Message-Id: <20210305171515.1038-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The AN524 has more interrupt lines than the AN505 and AN521; make
numirq board-specific rather than a compile-time constant.

Since the difference is small (92 on the current boards and 95 on the
new one) we don't dynamically allocate the cpu_irq_splitter[] array
but leave it as a fixed length array whose size is the maximum needed
for any of the boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-10-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index bfda944000e..eea9a71ddc0 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -65,7 +65,7 @@
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
 
-#define MPS2TZ_NUMIRQ 92
+#define MPS2TZ_NUMIRQ_MAX 92
 
 typedef enum MPS2TZFPGAType {
     FPGA_AN505,
@@ -81,6 +81,7 @@ struct MPS2TZMachineClass {
     const uint32_t *oscclk;
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
+    int numirq; /* Number of external interrupts */
     const char *armsse_type;
 };
 
@@ -105,7 +106,7 @@ struct MPS2TZMachineState {
     SplitIRQ sec_resp_splitter;
     qemu_or_irq uart_irq_orgate;
     DeviceState *lan9118;
-    SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ];
+    SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ_MAX];
     Clock *sysclk;
     Clock *s32kclk;
 };
@@ -140,8 +141,9 @@ static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
 {
     /* Return a qemu_irq which will signal IRQ n to all CPUs in the SSE. */
     MachineClass *mc = MACHINE_GET_CLASS(mms);
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
 
-    assert(irqno < MPS2TZ_NUMIRQ);
+    assert(irqno < mmc->numirq);
 
     if (mc->max_cpus > 1) {
         return qdev_get_gpio_in(DEVICE(&mms->cpu_irq_splitter[irqno]), 0);
@@ -428,7 +430,7 @@ static void mps2tz_common_init(MachineState *machine)
     iotkitdev = DEVICE(&mms->iotkit);
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
-    qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
+    qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
@@ -439,8 +441,9 @@ static void mps2tz_common_init(MachineState *machine)
      * board. If there is only one CPU, we can just wire the device IRQ
      * directly to the SSE's IRQ input.
      */
+    assert(mmc->numirq <= MPS2TZ_NUMIRQ_MAX);
     if (mc->max_cpus > 1) {
-        for (i = 0; i < MPS2TZ_NUMIRQ; i++) {
+        for (i = 0; i < mmc->numirq; i++) {
             char *name = g_strdup_printf("mps2-irq-splitter%d", i);
             SplitIRQ *splitter = &mms->cpu_irq_splitter[i];
 
@@ -693,6 +696,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
+    mmc->numirq = 92;
     mmc->armsse_type = TYPE_IOTKIT;
 }
 
@@ -713,6 +717,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
+    mmc->numirq = 92;
     mmc->armsse_type = TYPE_SSE200;
 }
 
-- 
2.20.1


