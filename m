Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3942FF451
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:26:26 +0100 (CET)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fb7-0002p5-KM
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIN-0002Nt-33
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:36223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0005qK-2g
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:02 -0500
Received: by mail-wm1-x332.google.com with SMTP id v184so2445481wma.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z/cipOte9qBYkDz6GvPRQ6o8HFNldLG8VuXdickyLI0=;
 b=oWQf5mXQjxxvNIvb4Vaxap6AVWNDVlMKT+WWVO2mo9tc1gY0eby3GoYw3X8XfVN74Y
 nQ6fuO4uAV7UsGcYnXNLQposNWFbqizkA9je55Eq/4hNS0qukhUp7XjGxqP/adIK5yhQ
 4zYpvbQ1jPkqV73THeoIkWrMVM6O0ab7hADHX8zeHgZrFHCtZqQ83np4KlnpvEthekil
 IZ5P3/xlhHZN2WxKhJQCs0Veh7dgu1HLg4SNq0U4Iy9WTYNl1CSxnEACe0HFGTNHSG5O
 1H+mp0Mj5e6T5Wg5h0fpJv7D5pUuNyUhRU1TRrs0MSNv3LWbZsL0toT4/0acnWtY7r/l
 Pypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/cipOte9qBYkDz6GvPRQ6o8HFNldLG8VuXdickyLI0=;
 b=uDQ0WZkxkyyxQ3R+3IE9PhQTsCN+v5PY02UA1IifRbYSEC9NSFYOCb9nUbwJNI8png
 7rXAG1xlvRuUEmMPu1Nx+ZPN9zoo3SkuPtcSIT72vQu65XTfGN7M5s3fzL3833vtCvEU
 cjqV+fTTW1HqLWr5VMfu81UR2sn2f4TmV8h6edy5URdHb3kSHJDuP+1arlT3DHNAvQ1g
 g8rHkrAHLMDd7mZXxAnYE4LPHpnF2PKNYo7RRTRsw8m7psVOWD3XypsGhVEm26oQpcwJ
 Oc3nsODjtmLbQ2wjfIV75Am6OGNWsaDRp85m8f1Zsq84CsRfjWV3vvbACwlkKXFgKwmA
 snpw==
X-Gm-Message-State: AOAM530fR23yz4BBvyABhIcZnzX+WMX+AJ+4r+86WNkNk/9mmxr47VHJ
 xtq2ouOfQWRDiL2cuQEzTI+odw==
X-Google-Smtp-Source: ABdhPJz3akt48jtK3aT1obs1Uz17ludihQAskpWYXUKtsAqAHJ+DXwhQ/gJK45l+rKifRVgTBvlKxw==
X-Received: by 2002:a1c:de09:: with SMTP id v9mr790569wmg.0.1611255998800;
 Thu, 21 Jan 2021 11:06:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/25] hw/arm/mps2-tz: Create and connect ARMSSE Clocks
Date: Thu, 21 Jan 2021 19:06:11 +0000
Message-Id: <20210121190622.22000-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and connect the two clocks needed by the ARMSSE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


