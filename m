Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A5E331590
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:12:38 +0100 (CET)
Received: from localhost ([::1]:58186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKMv-0007Z1-Jo
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJl1-000744-E4
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:28 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkf-00075c-FX
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:27 -0500
Received: by mail-wr1-x431.google.com with SMTP id l11so8934171wrp.7
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HxD8fhdwI5EWLnRxldyHFahFN0HnsrlK2jQE3T7tBOs=;
 b=SyVvmpSukfv5ifdAl8vJI7aY+cxu8Jz/O7ouKlfPfoahX0A1U/Jv5oAUwznURYSWrz
 Osx79Mjk9vsmRZYBdAINfIO++j906bn+AqlA+t5v6Qllbh6k7uryIYJIEVWBR5LApEnJ
 5hq8y9aBRgZyLXj35YxirP/OOHFsHxQztrWO+SbFDsN17P4PUFTZllSeRZ2zpKK0TWfh
 0/HpEd5pBf1Iq8Sfj/ZkS8PnfND52p6I8SstB52QCaFLuCt5GMGwmKEo6OnnQLK3D0zB
 +gVPrqcWoc0JDDTEcnPURlakKJWyIQV69J8vWjdENT0pOPoTjX5+qw3VgKA2IKKbxf8I
 YMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HxD8fhdwI5EWLnRxldyHFahFN0HnsrlK2jQE3T7tBOs=;
 b=oH1Wg2We0cnbCbOEvrHssjviro1JORXsLAld/x00AScXKjgkygw7fjlqfrSm5vqHZm
 4/HAcYtPYlwYXtjrBPLwBVd9tM1HJaN8HSRp6RLtkAfsbcIrd7WoLHrr0Cwq+QYm6tW9
 PZbFEUwVCgfwRHnRM3XsQ1n9nmIrFhZTkKY47MZv9X+kFPtH8Soa0MYf2na2MovcFnCC
 mkHxLmkiLOU0yaalmV26N4n98FwnfCRxRH47xCp5qf/JLWd4c/RSPPZtyi/vZF9tEuPH
 lKWIsA8bhQNmHt15wvMYvzbTSIBcv4VqjXWnv0hKbY1EcjZLrxVWNtpogYViFPfk/7nM
 dmGg==
X-Gm-Message-State: AOAM5332974Jot3BEDZIaPh1LQca2y78xRkQV/+1+m0iMCtK8w1fVs19
 ZPBqPH9VUsnnINIOqXSKq7d0Jw90NfxaJg==
X-Google-Smtp-Source: ABdhPJz8vQm9S/52d+jxzj9lh95PcszSg/7p3+IRW8fV+R0YWOmZ1edY4BK8u/IhfNS84nEJvTFG6g==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr23877807wrt.133.1615224783058; 
 Mon, 08 Mar 2021 09:33:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/54] hw/arm/armsse: Add a define for number of IRQs used by
 the SSE itself
Date: Mon,  8 Mar 2021 17:32:12 +0000
Message-Id: <20210308173244.20710-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

The SSE uses 32 interrupts for its own devices, and then passes through
its expansion IRQ inputs to the CPU's interrupts 33 and upward.
Add a define for the number of IRQs the SSE uses for itself, instead
of hardcoding 32.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-23-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h | 5 ++++-
 hw/arm/armsse.c         | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 771150b0a94..e34263fed8b 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -145,6 +145,9 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
 #define RAM3_PPU 6
 #define NUM_PPUS 7
 
+/* Number of CPU IRQs used by the SSE itself */
+#define NUM_SSE_IRQS 32
+
 struct ARMSSE {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -165,7 +168,7 @@ struct ARMSSE {
     qemu_or_irq mpc_irq_orgate;
     qemu_or_irq nmi_orgate;
 
-    SplitIRQ cpu_irq_splitter[32];
+    SplitIRQ cpu_irq_splitter[NUM_SSE_IRQS];
 
     CMSDKAPBDualTimer dualtimer;
 
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2b25fca1ca2..5ae6ce344ee 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -531,7 +531,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         int j;
         char *gpioname;
 
-        qdev_prop_set_uint32(cpudev, "num-irq", s->exp_numirq + 32);
+        qdev_prop_set_uint32(cpudev, "num-irq", s->exp_numirq + NUM_SSE_IRQS);
         /*
          * In real hardware the initial Secure VTOR is set from the INITSVTOR*
          * registers in the IoT Kit System Control Register block. In QEMU
@@ -602,7 +602,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         /* Connect EXP_IRQ/EXP_CPUn_IRQ GPIOs to the NVIC's lines 32 and up */
         s->exp_irqs[i] = g_new(qemu_irq, s->exp_numirq);
         for (j = 0; j < s->exp_numirq; j++) {
-            s->exp_irqs[i][j] = qdev_get_gpio_in(cpudev, j + 32);
+            s->exp_irqs[i][j] = qdev_get_gpio_in(cpudev, j + NUM_SSE_IRQS);
         }
         if (i == 0) {
             gpioname = g_strdup("EXP_IRQ");
-- 
2.20.1


