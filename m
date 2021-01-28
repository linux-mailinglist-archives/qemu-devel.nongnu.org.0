Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 186D0307535
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:53:02 +0100 (CET)
Received: from localhost ([::1]:36976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55rA-0007LW-Vb
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gg-0001WO-PB
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:12 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gZ-00069m-28
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:10 -0500
Received: by mail-wr1-x42f.google.com with SMTP id p15so5043445wrq.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O5f8WBqu2YhqzoSGVMquOcbgjjk1Qu9h4qYOyq13Wm8=;
 b=b7J5LXFKzrSQ8q0SFLTNwnCpT61vqHegyEGXdmPMzFYFIaAHWnFMikf8pd8GrRvDY/
 4txoeAtk/Gc8WD3QQV1mZstHhd4tcZZVhsVldeGFhr76I7yb/sfK+1nbCHGEZozoyPFm
 IGhCt9QgEgfRnULivLaW/QOtOf9bfUxgCtXFppc19CIVeE/S7i7whnvFoAUagKsGZhXR
 4mY/ypZq857oxXi6CJ5Asn79aD4H6qncMe4P1XrA8L7Pn6wLXD15dqHVF/x9nd0vBTg2
 kOIWz17ku8QRgTlAc0vdYvEs8YoHTgH8ztu9S/ZHc0rwZksh88lkA2ALmE6DmjmRGO/G
 G/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5f8WBqu2YhqzoSGVMquOcbgjjk1Qu9h4qYOyq13Wm8=;
 b=CcLHTfNN/N+QPBcwuUvp9cggITYfpnoqCzz1uPoLApkehqxiE1svvFBss6WMu6xRqn
 HzZ61jqtdfJG/rAMNXeMBEkTlLI/NK+n9NPt/mk4CaPHXXILw7m/X0p7uitsV7RXO+7S
 ZNU6JqH3Itn9IWo9ZSj0amYCQd2r6k4C92CfEr0+Z2KDe7R/TVMZKJGqMqNQYYznEJ2r
 pbsNFmTCwoOnptteCDplDiwR3CsDEr36CH3eshh/NnLfp42YomedtoUWJW0JPw0BZffP
 3CulmR1R3w/cED0a1Co/NOlzlBoXD+aK7/n5g+PsJLq9v14AxzqHUKhdB0DjXELerEle
 y3ag==
X-Gm-Message-State: AOAM531J0alQse0MiHXpJOm3Y627Dq4EST4AT+1MF9HgvhTg+lL4Jnce
 pEFaI901PN4eZIZEPXetFrr/UwB7c61g1Q==
X-Google-Smtp-Source: ABdhPJxuQYsXHTew1A+WhgrvfoSifSQ+yd/uvsMPSaEvxDk63vV6O6p+pplkBThTdav7f0pHn0Xg5A==
X-Received: by 2002:adf:f452:: with SMTP id f18mr15394981wrp.11.1611834121687; 
 Thu, 28 Jan 2021 03:42:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 14/25] hw/arm/mps2-tz: Create and connect ARMSSE Clocks
Date: Thu, 28 Jan 2021 11:41:34 +0000
Message-Id: <20210128114145.20536-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and connect the two clocks needed by the ARMSSE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-15-peter.maydell@linaro.org
---
 hw/arm/mps2-tz.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 6a9eed9022a..7acdf490f28 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -62,6 +62,7 @@
 #include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/core/split-irq.h"
+#include "hw/qdev-clock.h"
 #include "qom/object.h"
 
 #define MPS2TZ_NUMIRQ 92
@@ -100,6 +101,8 @@ struct MPS2TZMachineState {
     qemu_or_irq uart_irq_orgate;
     DeviceState *lan9118;
     SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ];
+    Clock *sysclk;
+    Clock *s32kclk;
 };
 
 #define TYPE_MPS2TZ_MACHINE "mps2tz"
@@ -110,6 +113,8 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 
 /* Main SYSCLK frequency in Hz */
 #define SYSCLK_FRQ 20000000
+/* Slow 32Khz S32KCLK frequency in Hz */
+#define S32KCLK_FRQ (32 * 1000)
 
 /* Create an alias of an entire original MemoryRegion @orig
  * located at @base in the memory map.
@@ -396,6 +401,12 @@ static void mps2tz_common_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
+    /* These clocks don't need migration because they are fixed-frequency */
+    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+    mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
+    clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
+
     object_initialize_child(OBJECT(machine), TYPE_IOTKIT, &mms->iotkit,
                             mmc->armsse_type);
     iotkitdev = DEVICE(&mms->iotkit);
@@ -403,6 +414,8 @@ static void mps2tz_common_init(MachineState *machine)
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
     qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
+    qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
+    qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
 
     /*
-- 
2.20.1


