Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC4331618
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:30:59 +0100 (CET)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKeg-0005mw-MP
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:30:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlE-0007If-2D
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:40 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkr-00078N-Tg
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so4319542wmi.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ax29HcI5hrZXe+6jiA9kzZeYfYhdVsIS/p6X0UUOR3U=;
 b=yjqqEh3EbLZ/N9IRG4K5iUX6TopaAHH18RGGESZ8yeVgCVijF9shOeC5O61PfdQ0lE
 BOiyOMcnHWvTU9L1mFobKqb18+Gx0cS9jORC+XlNwgt1Ad0LSP/qzEIlWLxmWEuMU9ab
 vtN4N7FiIwr6V6AiDxD9Grhk1WaLcweN1vJxesxrM8TcheAyQdZeGBfnD8vndoBeDfAB
 ZPkJERzE39JV2JzY0DL2XkY2jL+3IAEUJmpk/pgr8V0bGTnqLXBXkBizh+zmkEA5Wlib
 noaKg5W+xk17UCuomAkNLWOPzPTrgXKKaVjewqFGPpzpSYbPiihiI2TTjtkyOr1L4so8
 wtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ax29HcI5hrZXe+6jiA9kzZeYfYhdVsIS/p6X0UUOR3U=;
 b=CURW6FmbPpL9K6RGRqkf+Nsac7D4L8eXVrwlFcui0Ngep9TVlSn+TLOXi6m+waSTxM
 JIZyzTQp0bjczJakzIf9zinmNRZv+rhJ63ONw6EFj49adJ7+0ytHkWMHl+WYLbQpTeMk
 GXKgsw5HP4XbpPjVwlTlkCXLEaTIHvX2L4m0WcB5IFYMd71CZWos64FbpHqM6Y3g3d1n
 8K+d49uAoQiQX+IniQ57WdakIXFh8znX8zabsqhNeoQzEUiiGOD10PmHsYVWBPJfYnxJ
 SPRYUZZo2kdIHdR1YMr3u5C3lIGNNokMmsNpyhBpI9NijLu1BQMguH53ce8xoqvFKCPA
 TQOw==
X-Gm-Message-State: AOAM532gSvpwmhJ0XMKcTuD3yh2nHjC7DUo3dwEvA90cVFG7GA9iXJk2
 R5ANzQ+rZgPtfx/RPXV9ZbnsMaJHCRiAYQ==
X-Google-Smtp-Source: ABdhPJyiffT51KVqCXEUal6vfYZQm8KABsZxV8kgj6xjqaQSqiyn0hIY3a8EfHlSttMhDT+8+hPiTQ==
X-Received: by 2002:a1c:a791:: with SMTP id q139mr22674659wme.20.1615224796512; 
 Mon, 08 Mar 2021 09:33:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/54] hw/arm/mps2-tz: Make initsvtor0 setting board-specific
Date: Mon,  8 Mar 2021 17:32:31 +0000
Message-Id: <20210308173244.20710-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

The AN547 configures the SSE-300 with a different initsvtor0
setting from its default; make this a board-specific setting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-42-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f25a4ac0929..0a1e6c20c21 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -114,6 +114,7 @@ struct MPS2TZMachineClass {
     bool fpgaio_has_dbgctrl; /* Does FPGAIO have DBGCTRL register? */
     int numirq; /* Number of external interrupts */
     int uart_overflow_irq; /* number of the combined UART overflow IRQ */
+    uint32_t init_svtor; /* init-svtor setting for SSE */
     const RAMInfo *raminfo;
     const char *armsse_type;
 };
@@ -700,6 +701,7 @@ static void mps2tz_common_init(MachineState *machine)
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
+    qdev_prop_set_uint32(iotkitdev, "init-svtor", mmc->init_svtor);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
@@ -1053,6 +1055,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
+    mmc->init_svtor = 0x10000000;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
     mps2tz_set_default_ram_info(mmc);
@@ -1079,6 +1082,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
+    mmc->init_svtor = 0x10000000;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1105,6 +1109,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 95;
     mmc->uart_overflow_irq = 47;
+    mmc->init_svtor = 0x10000000;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
-- 
2.20.1


