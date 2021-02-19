Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0231FBED
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:25:40 +0100 (CET)
Received: from localhost ([::1]:34306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7f1-0003oQ-5t
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD746-0002wO-2r
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:30 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73U-0003gj-3J
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:29 -0500
Received: by mail-wm1-x32a.google.com with SMTP id l17so7298303wmq.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LuIzTpv1K9soe7A7vEz88fSEr4MLHte1voPUCjxmGG8=;
 b=ttmgN8WXfodvQ2pdgMfpyYBtddWI9FGGr8+qqJK2H7KxvaumT0QrnkkT2HY1HXvrsc
 ryrFL+4IwCXI9ZjzL1D1n9Tn8QXZb6DxFEHd9Sl8nzHWmaIUx8YlmLbNSuXmAxsR0HJl
 aAziqUDE45D6Xo2Xx11EVQQyTo4GVpc6x8jdvekkXLeOO1saSvBDYfNAImBJ6G5Lmvmy
 y9rlHusp4L5OX2KuaH1SJIq2e913ATV23EHYmaX7X+leggyu+W1zPm1bhcDP8bgHhygI
 Hm35yEpNdPSZ6C4IaBNjy5TsXeo2ncVj5Vnj7IhU6/nVtEtX1li1PNjGB6W2t7mu+WDV
 LKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LuIzTpv1K9soe7A7vEz88fSEr4MLHte1voPUCjxmGG8=;
 b=Zf8Rjn16e5aSY6q0WVWL4e+nKaUeqC0ATlfMzOhjF36o7xuBZXxm/r2LVaDGtC4wM3
 /vQXNCk/l9HwIQEVdDR3VdrbwLgskq9uilC9ijYgGyy4xX1tHjYbdRke5dei2NnGmSne
 IAe/ck7CmZzOh4ThK6nTwRndNfeQcDdcpWj3n0drquqsFWqxKnTXpm3Kf0eP73B1CzEf
 xbuQQwbS6EjbmIp4eGhYOzPyemhAbpdnJO1LAqdNs7KWJR7QSUZAOKf1Dqi8qs5dLdR7
 0O0UzLEBa8idZIHR5veGUTC4CIJiPOdaqvXah+oGTB/MGoTSc8/X6j9vaS5452XYmvTW
 420Q==
X-Gm-Message-State: AOAM532OOj+f3gP2zPv5Vqyn7bpPbpDUN2Zo6wEZ8Mn4r/GZ7U6i16b7
 Y5dN2lbyY7ewxPnb/WHQO4xiLw==
X-Google-Smtp-Source: ABdhPJyOmz8gNiaUdqWoC9/o39wNleXHNQbIw326cBOYBsdlPP+RkVlo95I2FS6ogytTH0lsm3M69A==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr8438318wmr.179.1613746010665; 
 Fri, 19 Feb 2021 06:46:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 41/44] hw/arm/mps2-tz: Make initsvtor0 setting board-specific
Date: Fri, 19 Feb 2021 14:46:14 +0000
Message-Id: <20210219144617.4782-42-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
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

The AN547 configures the SSE-300 with a different initsvtor0
setting from its default; make this a board-specific setting.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 47215f1b97c..bb72f78fb55 100644
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
@@ -690,6 +691,7 @@ static void mps2tz_common_init(MachineState *machine)
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
+    qdev_prop_set_uint32(iotkitdev, "init-svtor", mmc->init_svtor);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
@@ -1043,6 +1045,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
+    mmc->init_svtor = 0x10000000;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
     mps2tz_set_default_ram_info(mmc);
@@ -1069,6 +1072,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
+    mmc->init_svtor = 0x10000000;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1095,6 +1099,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->fpgaio_has_dbgctrl = false;
     mmc->numirq = 95;
     mmc->uart_overflow_irq = 47;
+    mmc->init_svtor = 0x10000000;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
-- 
2.20.1


