Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8353315F4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:25:49 +0100 (CET)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKZg-0008Lr-QW
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlA-0007Dn-Td
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:36 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkr-00078H-AD
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:36 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w11so12318948wrr.10
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=U8UGUugCMwNeE6QQeFqGtQvt/qkY4ktwLe8O/xcGOz0=;
 b=ocvqQDAda7KhkxUIZaST96UfKSDLZJ9vNK+xWmTGQw/brDfSZJvUzNUZveQB6RKfVC
 WzS5yHrY2r6I2zMlIvaiH17J7CUm3pI5Rkx1Llq6qDfN7mH2U4NtLVSCxtf0s1hdSbuq
 wKbOy+0dRvEG/4h5leDByiXIXu8PgJBLPUoHIRgWaTfyPNyKNtW2JSe22y2K+cMbMFCG
 oS+afcneAg+bjcRbP36CeoazkGzcK6Axte5utWW34tM8AZDvQBgCzzdvR40xAiHMkm6V
 e6mD21w8HxzRB05KaXdKy651NywPidcaY3sQyReEaDv2eIgH4et97fCu3g+AjXO1ME4q
 82Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8UGUugCMwNeE6QQeFqGtQvt/qkY4ktwLe8O/xcGOz0=;
 b=UGkjVxmsT3fhi8AM0zFSTI5xSMXLQX797o4mKQ4DONNJzqBVx358Vo444os5Mu0t6i
 BFquCZjqMLEFltF7bIThnoJWywvpIjvDsGnlSGiaH+d1wF1d0B3hw6oYzCjaSz5o7otQ
 JdC6K+xqUQCcz2Y6gZ7dCfafJS9Q83ppDeTS/7taY+WQYW/HiD8O2c4BcxBDhvi5MTpu
 1rHkD5ZvtSetqlqqNWO1TCKwfmj9CZb/mF1pGpaplh8vYxjszP+2stVz8nQV27Uman0f
 GI+Zg89S8cusHWhW4YRydKHU+Hm6G8m9MtXd+2mibzAui+8JPJzd8HiKaxROjTcWdNx1
 Rpng==
X-Gm-Message-State: AOAM531sS03WLU7WLJxj5lXZOTLHkwrbX4csidvyArTSiSVmzVkvXIKS
 xZhetFMaLWOG1+S34LlsoqEDiKCOu9uOKQ==
X-Google-Smtp-Source: ABdhPJztxJHkqAs8QOK0Ec3SlC2PQhGXRHUMOroevFxwL5xHveW/J6xHw1Zi9XY0xni64B2mbMm7vQ==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr13402855wrt.294.1615224795900; 
 Mon, 08 Mar 2021 09:33:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 40/54] hw/arm/mps2-tz: Support running APB peripherals on
 different clock
Date: Mon,  8 Mar 2021 17:32:30 +0000
Message-Id: <20210308173244.20710-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

The AN547 runs the APB peripherals outside the SSE-300 on a different
and slightly slower clock than it runs the SSE-300 with.  Support
making the APB peripheral clock frequency board-specific.  (For our
implementation only the UARTs actually take a clock.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-41-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 79a076ce693..f25a4ac0929 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -106,6 +106,7 @@ struct MPS2TZMachineClass {
     MPS2TZFPGAType fpga_type;
     uint32_t scc_id;
     uint32_t sysclk_frq; /* Main SYSCLK frequency in Hz */
+    uint32_t apb_periph_frq; /* APB peripheral frequency in Hz */
     uint32_t len_oscclk;
     const uint32_t *oscclk;
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
@@ -379,7 +380,7 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
 
     object_initialize_child(OBJECT(mms), name, uart, TYPE_CMSDK_APB_UART);
     qdev_prop_set_chr(DEVICE(uart), "chardev", serial_hd(i));
-    qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->sysclk_frq);
+    qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->apb_periph_frq);
     sysbus_realize(SYS_BUS_DEVICE(uart), &error_fatal);
     s = SYS_BUS_DEVICE(uart);
     sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
@@ -1044,6 +1045,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045050;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
+    mmc->apb_periph_frq = mmc->sysclk_frq;
     mmc->oscclk = an505_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
@@ -1069,6 +1071,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045210;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
+    mmc->apb_periph_frq = mmc->sysclk_frq;
     mmc->oscclk = an505_oscclk; /* AN521 is the same as AN505 here */
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
@@ -1094,6 +1097,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045240;
     mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
+    mmc->apb_periph_frq = mmc->sysclk_frq;
     mmc->oscclk = an524_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
     mmc->fpgaio_num_leds = 10;
-- 
2.20.1


