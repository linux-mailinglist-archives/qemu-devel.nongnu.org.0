Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874901FC75E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 09:28:27 +0200 (CEST)
Received: from localhost ([::1]:33464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlSUk-0008DZ-I8
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 03:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSSK-0004oD-Da; Wed, 17 Jun 2020 03:25:56 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSSI-0002bg-M3; Wed, 17 Jun 2020 03:25:56 -0400
Received: by mail-wm1-x343.google.com with SMTP id t194so839695wmt.4;
 Wed, 17 Jun 2020 00:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I3W9cifnD7DOZZ455FCgCr8VTTmTQL8v0YMmJYG05f0=;
 b=YlurqRMeJYrE+IrRZLl1SHxuiKjMJpMEh0rek+C3uYlyD21IsZ1kpLW1edrgqU9Rrz
 2HKjeYw9Hug9FTAKNV+hB2uOlHA27rHZ4eGkxzsUpfu+4Sg5WhpEJXSYWiHFfBxxFZz4
 hTgv8kHWcusRxGyo1ILt3CN6z4KMbA2oZLyFiNtzwEsForxdsJ3ZouTEDwbRcwDYh9RY
 hqoc4TFVoofXzqrRbw1D/LdbqHYAlOT0J4W9YcLXAz5OKcslMbN/tpHJIeVfONO/mUWL
 HvE4ydVJ3ay2n59U1B07WKoo0GvHcPC1DjpWfkw1vvkHuFEgKfcg6IGvzRQUtnNS2mWP
 rHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=I3W9cifnD7DOZZ455FCgCr8VTTmTQL8v0YMmJYG05f0=;
 b=Xk2L2ruT4JEWyHlXNB4zoe9irdK/EHFFqFaaFRTsJ+QsOL5bJKOMZ7ji6pC5Q3giGu
 Bz3tgEgclxRoBNXJg9WjU7S+Ps7nmLByu9lX41UFaHff1w7S9jggK4UzqtdxOv/p9i9P
 Q2lnhQVoLEN1/+lSJg52/s18iBuzBIs5lfH+GTJlbwqM0tLMSEkspsNzlIQ6hvAEtiv8
 hyQJ3kv4PYmiS7NvTUjouKrCOc8RaJADq5Xxw4o1BHAIWvChDviJHyTO0EW3khL+sOKg
 E/34q1BEI05N4NENkDbWFUZhsq9imzOOWpUHpHXxykLmwXUJh4ohrh/OaGd5OvCzyJEc
 iP5g==
X-Gm-Message-State: AOAM531XNRyKgBtEC6P4bvjFY99w7/YAMatM5QCa8xZPoEyuGupvoK5L
 Q4r5hTTPo3E4EzU54CH8XSxrMtsA
X-Google-Smtp-Source: ABdhPJwK5Rnpu2WUBwpQph3AQjiurd5sJ2Or78Tpz4DcXfO8Sww/WQkbQ0y6mH+vcXqkXYO3xEvoCg==
X-Received: by 2002:a05:600c:2313:: with SMTP id
 19mr7433245wmo.51.1592378752782; 
 Wed, 17 Jun 2020 00:25:52 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id j5sm32894781wrq.39.2020.06.17.00.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 00:25:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/14] hw/arm/mps2: Map the FPGA I/O block
Date: Wed, 17 Jun 2020 09:25:35 +0200
Message-Id: <20200617072539.32686-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617072539.32686-1-f4bug@amsat.org>
References: <20200617072539.32686-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: 25MHz prescale-clk property
---
 hw/arm/mps2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index c66c595d4a..e106123225 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -38,8 +38,10 @@
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
 #include "hw/misc/mps2-scc.h"
+#include "hw/misc/mps2-fpgaio.h"
 #include "hw/net/lan9118.h"
 #include "net/net.h"
+#include "hw/watchdog/cmsdk-apb-watchdog.h"
 
 typedef enum MPS2FPGAType {
     FPGA_AN385,
@@ -67,8 +69,10 @@ typedef struct {
     MemoryRegion sram;
     /* FPGA APB subsystem */
     MPS2SCC scc;
+    MPS2FPGAIO fpgaio;
     /* CMSDK APB subsystem */
     CMSDKAPBDualTimer dualtimer;
+    CMSDKAPBWatchdog watchdog;
 } MPS2MachineState;
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -332,6 +336,11 @@ static void mps2_common_init(MachineState *machine)
     qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
     sysbus_realize(SYS_BUS_DEVICE(&mms->scc), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
+    object_initialize_child(OBJECT(mms), "fpgaio",
+                            &mms->fpgaio, TYPE_MPS2_FPGAIO);
+    qdev_prop_set_uint32(DEVICE(&mms->fpgaio), "prescale-clk", 25000000);
+    sysbus_realize(SYS_BUS_DEVICE(&mms->fpgaio), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&mms->fpgaio), 0, 0x40028000);
 
     /* In hardware this is a LAN9220; the LAN9118 is software compatible
      * except that it doesn't support the checksum-offload feature.
-- 
2.21.3


