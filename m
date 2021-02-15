Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09431B899
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:03:38 +0100 (CET)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcbJ-0004lA-F8
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQQ-0007LB-09
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQM-0003wA-AZ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:52:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v7so8454659wrr.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 03:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SKNE8HC09qZegLpjoVlF4jaNo0rqYYfYydVh0a/tGNg=;
 b=ItvzkFszLoSbG0DF64GJ/LUAgzbrGCYSy/c30EJVyn90bIwZeajLSYtPJyVZkuwtCi
 S7qBcu/si6MbtAijXdaXJamj/iEP/I5uCeJ7JVq3goxbsLIh1d64Va+6sfCajivGs/02
 i9Vq0Naaz4J0eSEzWA2aOBvwaAr30g/De/9XxHRqGYwJKaPI8y3AYhAfInNKhYfT3mTA
 CkPEzlrOTuCtEPCeRIYOTZ0Ykr1cYjMmW2D5m/+Y9it0sgxtLUApYi9CDYpWkaXqG2vt
 E7JfYWREfTj26Prx5J+M5Luv1DdJ+k7BQGBD0b+zMuoxt/Bws4vd3tnQ1z85k7HCThIb
 /rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SKNE8HC09qZegLpjoVlF4jaNo0rqYYfYydVh0a/tGNg=;
 b=Sle3KcZcv3aaQpZVB6Jg6vNm3E6hoUkWPwld9iqYi4YDr+QPa5KriuMwykYYsxRPyo
 vTfT9yVILWpyyidg7m2Msf6d2Qbz3Z8BwbPMxmWtohRqLlnGb4noWAlDYru4zpq2HzlF
 cu+8/jQg0Hw0ICV45/m5ogjvD+B4hk2T4OopOQcTDM7gQ9jToxSHb7iA05KGO6ko8Fan
 4zQqV2nf2FYUnTJ/7mBEUJKNOuxT+cTigaoizHgwETRSPLtaRKEO66O0sX9C05FCUKP7
 m2+kg/fvkzVhIwb490Kj2spQEcnjJnFK2+3eqp3Mh5Ns/AudE4Jj6xk8yuMxRmSnqJTA
 Pc6w==
X-Gm-Message-State: AOAM5329EOipwa1jX87/ub0TRrI2dUXgKj7+Mfn+8ajADYShZtLlR6UY
 1X5J6d/0lB1sIwPv1RATSikQKg==
X-Google-Smtp-Source: ABdhPJxoJCbBXYMDKUyLqA5J+sWR72g/ANqiOeit4P4KjLC+LUUCcMCd/rwHv66fCl0T7T07RMchEg==
X-Received: by 2002:adf:f54c:: with SMTP id j12mr18144770wrp.175.1613389936989; 
 Mon, 15 Feb 2021 03:52:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/24] hw/arm/mps2-tz: Condition IRQ splitting on number of
 CPUs, not board type
Date: Mon, 15 Feb 2021 11:51:22 +0000
Message-Id: <20210215115138.20465-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In the mps2-tz board code, we handle devices whose interrupt lines
must be wired to all CPUs by creating IRQ splitter devices for the
AN521, because it has 2 CPUs, but wiring the device IRQ directly to
the SSE/IoTKit input for the AN505, which has only 1 CPU.

We can avoid making an explicit check on the board type constant by
instead creating and using the IRQ splitters for any board with more
than 1 CPU.  This avoids having to add extra cases to the
conditionals every time we add new boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This removes the only current user of mmc->fpga_type, but we're
going to want it again later in the series.
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/mps2-tz.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 6e345cf1f09..5561c30b126 100644
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


