Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7C031FBEB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:24:16 +0100 (CET)
Received: from localhost ([::1]:57378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7df-0001Fr-Ak
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD740-0002qg-Ph
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:24 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73T-0003fo-Ag
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:20 -0500
Received: by mail-wr1-x434.google.com with SMTP id v15so8902662wrx.4
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i7J3nfprRkZYSN+DG8dR9uLCK+arEP02h3GtQa9f38U=;
 b=KN+GuYvbSVfjKtJ59vt/QUmxJzcvbYYkvhX6ODBeZlARXSfS1GHsRVbfy9G7lIqlml
 GdGYjIXIdZdxwVsQWMpzwmTReQ/dOD2/c/aXVolIqQeBpY53KT63S4+oiKANEyofpHnp
 oWIT5K5xUobV3r+Q0W2qFjd5GoQ/6ro7O5TCklw7nXm9zAkREAtdSftsT6U0xnMBi903
 WvOPSLsB+Y8feyK0ZuMOXCKo3SBpZRa/RfWMbEOI7RSHj6LX1/JpZDSihFzQugAXuL4R
 qmGOkkrI/oZspSEKjiNa1+uGQtFl7ME7LzQL2D1qg4wuMlLqAxWxysblgtlHxayKUKNb
 MhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7J3nfprRkZYSN+DG8dR9uLCK+arEP02h3GtQa9f38U=;
 b=hamkWYW1wDIo4K2u/90vZJSfYAiawhgqHAB2TFOyechNmA7FYr7iXg6fqLjGOViJxp
 HZH4f+fMAxcjLvUcVZ+2AwZl2Srethu/jY47gltZ2sYA6jOVMz7tp0fhE1jxlRFZExw1
 9F45KtFvbo2L+ht8MyAT2Lrj6dKyGfMjrxEuLhRuZA6PQeFaGNRAuzAaDZRz8AkwMKYK
 pGlwqtJKuccTAmzUPY4ikbqZgo48il3Ill0bMb6cy4MYk6NyZredVsk+c8t4dIAbAEaD
 nYHmxvYYK+aHIuS2+15nHB3st2+2BbrepjmqQ6NybcY1qrevScAmDGT3SRjd7SM3gyeH
 0FiQ==
X-Gm-Message-State: AOAM531zlh7dfA6TvzA79AdiU5G66fsGRF3MSua1YDl+2HLcswCPwbRA
 aOK2PzNZWjATG2hJt4NXITKlUcDg+1MJuw==
X-Google-Smtp-Source: ABdhPJz7ERyBoNjWmZcFmITkwyQcmz6ztIyAu2LPVksYnNQznWWM/B0w/s5Nf/eWeELBcDZYd3MCpA==
X-Received: by 2002:a5d:5109:: with SMTP id s9mr8161240wrt.325.1613746009958; 
 Fri, 19 Feb 2021 06:46:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 40/44] hw/arm/mps2-tz: Support running APB peripherals on
 different clock
Date: Fri, 19 Feb 2021 14:46:13 +0000
Message-Id: <20210219144617.4782-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN547 runs the APB peripherals outside the SSE-300 on a different
and slightly slower clock than it runs the SSE-300 with.  Support
making the APB peripheral clock frequency board-specific.  (For our
implementation only the UARTs actually take a clock.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index fe324e86b3d..47215f1b97c 100644
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
@@ -369,7 +370,7 @@ static MemoryRegion *make_uart(MPS2TZMachineState *mms, void *opaque,
 
     object_initialize_child(OBJECT(mms), name, uart, TYPE_CMSDK_APB_UART);
     qdev_prop_set_chr(DEVICE(uart), "chardev", serial_hd(i));
-    qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->sysclk_frq);
+    qdev_prop_set_uint32(DEVICE(uart), "pclk-frq", mmc->apb_periph_frq);
     sysbus_realize(SYS_BUS_DEVICE(uart), &error_fatal);
     s = SYS_BUS_DEVICE(uart);
     sysbus_connect_irq(s, 0, get_sse_irq_in(mms, irqs[0]));
@@ -1034,6 +1035,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045050;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
+    mmc->apb_periph_frq = mmc->sysclk_frq;
     mmc->oscclk = an505_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
@@ -1059,6 +1061,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045210;
     mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
+    mmc->apb_periph_frq = mmc->sysclk_frq;
     mmc->oscclk = an505_oscclk; /* AN521 is the same as AN505 here */
     mmc->len_oscclk = ARRAY_SIZE(an505_oscclk);
     mmc->fpgaio_num_leds = 2;
@@ -1084,6 +1087,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
     mmc->scc_id = 0x41045240;
     mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
+    mmc->apb_periph_frq = mmc->sysclk_frq;
     mmc->oscclk = an524_oscclk;
     mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
     mmc->fpgaio_num_leds = 10;
-- 
2.20.1


