Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95E3315A6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:15:56 +0100 (CET)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKQ7-0002iU-Am
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJl8-0007BJ-DQ
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:34 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJko-00077t-KO
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:34 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d15so12343436wrv.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tF0bxF/X/uhIISy4lNQFUIu4Sj26ElDb/tpwdKi0i00=;
 b=yGQz/CwUKlpTdFVYQKjKM7Ca67l5Ugod7/5d1fP+Rc1CzHO8ZmIIGsffTBV3NDiAls
 cGJFsdf2nXk0eCejxB2X7OrCR7geIEcLWVBILTxE3rxV6nmk4YyUNhSWE6Ib3O0p/qQc
 nKSO50GzpaBFHZv7aRyhQVnsKjipNb1276SuOVOs+FI0OOpSZ54Qt/e4j2mDLvZYEfH+
 fe5y1g2IPRKt1MvyHTs6mV4qyoUdSzM4hasOHRSgWXBohytF5mXi/vhdbW4OABEOM7LA
 n2Y8VlnycIyy2erIcMwkLGpZA407fU7MrlECoBvh5FlV9OBV1q+fPTfowPp+AQ2cvYXO
 O0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tF0bxF/X/uhIISy4lNQFUIu4Sj26ElDb/tpwdKi0i00=;
 b=DBF5mo02neZs+kWUf8QFqpQv83XFEvQsDbtBHlk/mIgbSyl5tZqtXpLXIgyzkQJYGE
 y/6jm5XGO+819kXeD+b1PavbAuPtkBwQTrbWaMdWnFR1JhDflc3Ih9lDY9/yR94DTn7Z
 8ubRx7Th873D7K9FTA9KZlvdY7Jms61gWJcSEfctqsACT303GNlH4vWH86GCM42TXrDY
 AsLI1nreDYnyzxzStiTLeILXvfOs/IbG1RIAkSTJvyfn2y6kFmz0jUOtg0pNqN7546rU
 WvKWBGpF9+5G0ozNjyC3gg4vrIxWiQbz0xbgMAe2dqXHDCYN4XhqmQyi6Dz4Vgmm0yF0
 mRHg==
X-Gm-Message-State: AOAM533f8q+dO/II0LmPCr5fnMldGV0NTNEthOqIZrfszGIhOliqC4Mg
 cKmusM8javBFmi0SxoRvjqDy0JoJDhnWPQ==
X-Google-Smtp-Source: ABdhPJy6wWf86GcVOpkHAYWbvKybobEbSQjds7jwPOgGrvsZ7aSLFMdRtZr9F+KolAUHcgjKcR3emg==
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr23922166wrn.20.1615224793285; 
 Mon, 08 Mar 2021 09:33:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/54] hw/arm/mps2-tz: Make UART overflow IRQ board-specific
Date: Mon,  8 Mar 2021 17:32:26 +0000
Message-Id: <20210308173244.20710-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
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

The AN547 puts the combined UART overflow IRQ at 48, not 47 like the
other images. Make this setting board-specific.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-37-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 72da8cb1a16..85e80c4d726 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -111,6 +111,7 @@ struct MPS2TZMachineClass {
     uint32_t fpgaio_num_leds; /* Number of LEDs in FPGAIO LED0 register */
     bool fpgaio_has_switches; /* Does FPGAIO have SWITCH register? */
     int numirq; /* Number of external interrupts */
+    int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     const RAMInfo *raminfo;
     const char *armsse_type;
 };
@@ -770,7 +771,7 @@ static void mps2tz_common_init(MachineState *machine)
                             &error_fatal);
     qdev_realize(DEVICE(&mms->uart_irq_orgate), NULL, &error_fatal);
     qdev_connect_gpio_out(DEVICE(&mms->uart_irq_orgate), 0,
-                          get_sse_irq_in(mms, 47));
+                          get_sse_irq_in(mms, mmc->uart_overflow_irq));
 
     /* Most of the devices in the FPGA are behind Peripheral Protection
      * Controllers. The required order for initializing things is:
@@ -1046,6 +1047,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->numirq = 92;
+    mmc->uart_overflow_irq = 47;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
     mps2tz_set_default_ram_info(mmc);
@@ -1069,6 +1071,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 2;
     mmc->fpgaio_has_switches = false;
     mmc->numirq = 92;
+    mmc->uart_overflow_irq = 47;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1092,6 +1095,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_num_leds = 10;
     mmc->fpgaio_has_switches = true;
     mmc->numirq = 95;
+    mmc->uart_overflow_irq = 47;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
-- 
2.20.1


