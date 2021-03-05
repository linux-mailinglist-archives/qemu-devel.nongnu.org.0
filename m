Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C932F20B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:02:09 +0100 (CET)
Received: from localhost ([::1]:58054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEm8-0004AY-C5
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:02:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3V-0007Em-TS
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:07 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3E-0007gk-7b
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:16:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id b18so2899134wrn.6
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=odnFnvFATXhoBTl+xewJBMMPG98LsTMI0yC98xqMSes=;
 b=nVSLp0pz/0P9aSP6BMl+H2YPpRyp6f/k2sgflOsXBZoeZPcgchYLwCYW4ryjP85r45
 KzwZldVj2B07XUNlbbju76rJorxVRoZ1iwk3dxjd74IgmUBDsglN/lCvMYR0TKXDDcNe
 Ry/NwV69z/xLKodRneJD3OfCmIyi4Tr1/MU2ofZauIEPmxrJu9H1bJMifRQUAv75uw/r
 kazY/c5Sy5akMb2Pkd7jSPFBGgd7papOfHSFLxxd1QV5y8NYn0ps23WNxQNzYJtsBnLe
 zk2aZFZ1zU+MHcEP3M085xv3dTglQF5BFUVsM0tbf26v6XT7Y22OsRWkI4aTIJokO5Bk
 +LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=odnFnvFATXhoBTl+xewJBMMPG98LsTMI0yC98xqMSes=;
 b=nZxxcPT7tnX+Q+4ATWGsMfvUE6ckJytLjdqsHXWiO9ZWrMAhqdQLICnQQ5qcXaHlst
 u/tzTl6uwr4riTmblm2/5+T3m+/BZUDH8hrkMPLcyfM/90OqK3XHmTkwvOV5LeL/n6nK
 Tzndfg9e7T8UugMWPggLeVR3aYvp4w1BqkoHmtDl5lXfUXZVXBs932dPcU/8Ln9akDpP
 /a4MCAk9WNRMGIG3pbFqQC+31gKsTh3Z73hc284Xh7ZjWWVuu4o9ZbR4acJ5vjBHHU40
 7CFBLrSA5WjswGv6iiONxXOTDFwIgDiQDdr8o7JGBrBZKFl8g4FKmZjWiCtGdBeGgGJd
 3tkQ==
X-Gm-Message-State: AOAM532gdHlQuA7o8FFlQsmGAZ0cota52kfK+DeXYc1A+6mzkh+BxlsH
 E/yASL9vtcLoXe7r+WbwZGcuNghAGTHf2g==
X-Google-Smtp-Source: ABdhPJwvgfXkXh6fI7oUOmQdg9z6NcWa++KYPJTUGSV3eE5oDnS4MS/w+rbQ0/HSnMdu4VSkVJ9qZw==
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr10279747wry.398.1614964540537; 
 Fri, 05 Mar 2021 09:15:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/49] hw/arm/mps2-tz: Condition IRQ splitting on number of
 CPUs, not board type
Date: Fri,  5 Mar 2021 17:14:59 +0000
Message-Id: <20210305171515.1038-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the mps2-tz board code, we handle devices whose interrupt lines
must be wired to all CPUs by creating IRQ splitter devices for the
AN521, because it has 2 CPUs, but wiring the device IRQ directly to
the SSE/IoTKit input for the AN505, which has only 1 CPU.

We can avoid making an explicit check on the board type constant by
instead creating and using the IRQ splitters for any board with more
than 1 CPU.  This avoids having to add extra cases to the
conditionals every time we add new boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210215115138.20465-9-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 87a05d2c19d..bfda944000e 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -139,17 +139,14 @@ static void make_ram_alias(MemoryRegion *mr, const char *name,
 static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
 {
     /* Return a qemu_irq which will signal IRQ n to all CPUs in the SSE. */
-    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
+    MachineClass *mc = MACHINE_GET_CLASS(mms);
 
     assert(irqno < MPS2TZ_NUMIRQ);
 
-    switch (mmc->fpga_type) {
-    case FPGA_AN505:
-        return qdev_get_gpio_in_named(DEVICE(&mms->iotkit), "EXP_IRQ", irqno);
-    case FPGA_AN521:
+    if (mc->max_cpus > 1) {
         return qdev_get_gpio_in(DEVICE(&mms->cpu_irq_splitter[irqno]), 0);
-    default:
-        g_assert_not_reached();
+    } else {
+        return qdev_get_gpio_in_named(DEVICE(&mms->iotkit), "EXP_IRQ", irqno);
     }
 }
 
@@ -437,10 +434,12 @@ static void mps2tz_common_init(MachineState *machine)
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
 
     /*
-     * The AN521 needs us to create splitters to feed the IRQ inputs
-     * for each CPU in the SSE-200 from each device in the board.
+     * If this board has more than one CPU, then we need to create splitters
+     * to feed the IRQ inputs for each CPU in the SSE from each device in the
+     * board. If there is only one CPU, we can just wire the device IRQ
+     * directly to the SSE's IRQ input.
      */
-    if (mmc->fpga_type == FPGA_AN521) {
+    if (mc->max_cpus > 1) {
         for (i = 0; i < MPS2TZ_NUMIRQ; i++) {
             char *name = g_strdup_printf("mps2-irq-splitter%d", i);
             SplitIRQ *splitter = &mms->cpu_irq_splitter[i];
-- 
2.20.1


