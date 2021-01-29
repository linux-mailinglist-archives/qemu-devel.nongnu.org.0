Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEE30883E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:27:50 +0100 (CET)
Received: from localhost ([::1]:60476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RwL-0006D6-Sx
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWK-00052l-Vr
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:57 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWB-000777-OL
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:56 -0500
Received: by mail-wr1-x429.google.com with SMTP id z6so8340420wrq.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CihYkdqAOfQwaocMGopB4Hac7Q9aRPC7UvcMr3MNgrY=;
 b=nEMnfzDnSh5bMnZ/bFq6ijVHflKOR2UyHnKSYZDh7aoIitgAqGuQFg6A3JevFJFd1h
 iC61HByDuwjDtUS0cplY/ca5hKoXi2wcZ5imZpCD5oJKUPtPYwZwB8euXLl7VHGrtRDm
 4FQbes0fQroiNRpsnNotnc/1BAszVbrHm2wZ4x05UeVH+jVtau8hzDzx/Eg5BnM5+m0N
 C+qv4aucXGI8EHuY9rfj1eAlHNGRHHndO/jnFecx7lZXpl8TjxTmXPm/J0pEUjeeNzjG
 QbOix6BTL3s58KPF31okKYSf185vul/5o217gONOqcmNU+m2O1ioP1Kbb/l4jU7suHY0
 fetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CihYkdqAOfQwaocMGopB4Hac7Q9aRPC7UvcMr3MNgrY=;
 b=Homh4ieQZZqBu8dzVx2nA4aqmmvcQryWvF+3kb4d82aAjB/cDejox/oh1K3OqxCAlK
 qPbRDE1s/WmYv7qB29T8idWlzA1tOVHwihZup/jW4Opj36AI+RTpszhrTkMqN9Ztd67M
 gOS8+/Bwwh7Oo3uuBhE6f8MsNosH+bwacdkfVs5sDf7iui8js8B4qlzA4reKOJcIJiYe
 Gxtu587k01UQrGGwDXVCJvLZlFMfVk/Nls9zAUw0uXvmlb6tJ8fQXJOYwAVpzWUnmyJ/
 Egx2OTyaK98D0xKMb1bWEmGuH7+07x5exIukfJ0DQLElmoDfUSszypcQrP5xC20uIoUp
 kPvQ==
X-Gm-Message-State: AOAM531s7LPGPKr5WNLYxEECsLGiXeVWA/+0ScLuoIgBKI5kGlALSdWb
 kqR3G7K9ZLtoeE9ZvAFMXuZewqF9Xwd5EQ==
X-Google-Smtp-Source: ABdhPJxXOLIUQgISM68fyEuho/uCeeNk20awd6rTg7o2qpO3aV8oRHzB2dXkyWuW5bTv5wVgb5hnVw==
X-Received: by 2002:adf:e80f:: with SMTP id o15mr3875134wrm.366.1611918046339; 
 Fri, 29 Jan 2021 03:00:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/46] hw/arm/mps2-tz: Create and connect ARMSSE Clocks
Date: Fri, 29 Jan 2021 11:00:01 +0000
Message-Id: <20210129110012.8660-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Create and connect the two clocks needed by the ARMSSE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-15-peter.maydell@linaro.org
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


