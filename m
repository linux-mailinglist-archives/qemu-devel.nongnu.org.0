Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1E37977E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:13:10 +0200 (CEST)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBL3-0004LZ-4V
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGw-0000ZZ-PI
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:08:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGt-0004wu-7T
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:08:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id s82so9794297wmf.3
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0bAVgHwIjQtf8To6Si8JBYpO2wJiNylkQh5/jVI8Anc=;
 b=JP94KqFZS2ZSh87HU84b44SChHlEVfTxmFuy3QgBdfNvx6v/kCcK7BJJP0d6Yltc/8
 u/y5SjbN8L01LvHNyg83zqK7q5Zn9sKVi6GTaTH/eD7N18HJcgplOpCD/r04Y/F/nYv/
 +STKgoreCzEkHNmbZzgto8R9HaHf9dYDefp0EybeDc2zcMGCU6J+z3GHCGUMOiPE8HxU
 BzxB3flVPROC4roV5YLrsM/uDns7jYAh9eUqhWMcxejLyvvBPWs+rSC8vQEsywTm3kZw
 taOGUeO9/hWyAJyWpa++joZThfei6ajnlEtdYlyRVtAqlQ8kl1PCBDJ2lRgXkiCH5YTo
 /BaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0bAVgHwIjQtf8To6Si8JBYpO2wJiNylkQh5/jVI8Anc=;
 b=nah67enpYk3sxmV+8NIJfG4AivtxnHpEX5lg5CK6/bEEHgoAX11m/fo83P2Xz6xKWc
 OpeLGapMQiJed61h8NDbWYAmZKWYZP5U/gJHJzEc0MpIIEXLINvEHAqEsUm7x9nHkvBB
 eNsWuCTjH5Feh4chLjjUzsFiJsDEe0QLnKp53KeFs0PBRRpUYLcG03OO8imLRNZBJoG+
 NCT8ZEIOGmgDoBSPA+1JjJjqBh/6HaDMZUuee2lMAyaN7amTuv49vmo0Xl09JSdbhJ5t
 W+4+OFoTYu6VC2DyYEuHhMTxFe3r84ru0d5/FOsrBt7mZelEGNWRt3gHx82lDkjkbOxJ
 hT7A==
X-Gm-Message-State: AOAM530OWWSeeQ5CrM3Zx2yh4EKZSe6s2oxC5OdfmizH5S4guwXyjy81
 wcx4nT4KjRaNiyFzXuXaDEmhJA==
X-Google-Smtp-Source: ABdhPJwpcBmEBuXQURxJNidcptHrPXG5wP/iQe2dcjs4DCkbFp1e9aBDMO5q06iWPhsGVfYvUuXPzQ==
X-Received: by 2002:a1c:e446:: with SMTP id b67mr685801wmh.117.1620673729749; 
 Mon, 10 May 2021 12:08:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/arm/mps2-tz: Make SRAM_ADDR_WIDTH board-specific
Date: Mon, 10 May 2021 20:08:40 +0100
Message-Id: <20210510190844.17799-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
References: <20210510190844.17799-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AN547 sets the SRAM_ADDR_WIDTH for the SSE-300 to 21;
since this is not the default value for the SSE-300, model this
in mps2-tz.c as a per-board value.

Reported-by: Devaraj Ranganna <devaraj.ranganna@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 77ff83acb06..f2595b1c7f7 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -123,6 +123,7 @@ struct MPS2TZMachineClass {
     int numirq; /* Number of external interrupts */
     int uart_overflow_irq; /* number of the combined UART overflow IRQ */
     uint32_t init_svtor; /* init-svtor setting for SSE */
+    uint32_t sram_addr_width; /* SRAM_ADDR_WIDTH setting for SSE */
     const RAMInfo *raminfo;
     const char *armsse_type;
 };
@@ -806,6 +807,7 @@ static void mps2tz_common_init(MachineState *machine)
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", mmc->numirq);
     qdev_prop_set_uint32(iotkitdev, "init-svtor", mmc->init_svtor);
+    qdev_prop_set_uint32(iotkitdev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
@@ -1263,6 +1265,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo;
     mmc->armsse_type = TYPE_IOTKIT;
     mps2tz_set_default_ram_info(mmc);
@@ -1290,6 +1293,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 92;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 15;
     mmc->raminfo = an505_raminfo; /* AN521 is the same as AN505 here */
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1317,6 +1321,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 95;
     mmc->uart_overflow_irq = 47;
     mmc->init_svtor = 0x10000000;
+    mmc->sram_addr_width = 15;
     mmc->raminfo = an524_raminfo;
     mmc->armsse_type = TYPE_SSE200;
     mps2tz_set_default_ram_info(mmc);
@@ -1349,6 +1354,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
     mmc->numirq = 96;
     mmc->uart_overflow_irq = 48;
     mmc->init_svtor = 0x00000000;
+    mmc->sram_addr_width = 21;
     mmc->raminfo = an547_raminfo;
     mmc->armsse_type = TYPE_SSE300;
     mps2tz_set_default_ram_info(mmc);
-- 
2.20.1


