Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AE330883B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:26:08 +0100 (CET)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Ruh-00041D-Tk
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:26:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWK-00052I-H2
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:56 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWC-00077E-HQ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:56 -0500
Received: by mail-wr1-x433.google.com with SMTP id s7so5398738wru.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RSDh1s4sSFCh+gnxQ/s51Xo8osmp4XAWuSEwUmDU5oQ=;
 b=APGvjMnzN200RLhTWMMWwRfp/V+G4o8hs3Rdu6eu80n8G+1TQbxNfcyEc7pS99xbXt
 WiDVaSkkRBEGfFe5zrMf9mVyA+FaLra7ChZsWqPJuVzVWS4Zpz+8VL2o2m2qDj6SdGjY
 iSM7WWerOBNcICUvsDhn+4la2mUMan4Y2l6yyo11bKt+giGrW5brjSMu/Bos+/ri8KJ+
 2oK7jZL4rzBQvnJc3LyBTg2f7d1I53N0kSksEeocZGLbn9/HjN9lTW04F425iL3J9OLt
 v+Oisu0gBKIcL/O1emq9oR+2cQJdeAYaBmBXyKKBcc54LlTwsdDAFhEPrwwinXYqMZC3
 F2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSDh1s4sSFCh+gnxQ/s51Xo8osmp4XAWuSEwUmDU5oQ=;
 b=rphZPYpnUbce0jkNDgfEjz+Csby9e4i8rYi2P/msOQHpwTLh8pa+0bvT7VSAESjft+
 WKBm40ubOwOkNiQBhymwjccrRukQAh27uzGCPIObfgl52gbUFpTO51gbkuc8k/9vG3gd
 uteuQYtWbDlBrys3nvg/H2sFxkxLB1xBmwpU0n8PTxJ4EtDqjeHHWZt0sF3jCQukrSy+
 nFJfh6dz9YZv7cJaEAp7Rc9AOb9qFZEJfIwCQEBXniYvnYX7M05eEi9WBMkWRz+B8919
 EI0q1+IWZ3X7/3Fib/vP/wYm4cUWOvwhvfZFcm/RWX2erCige5vkEk6DUb/mzLF1BOxL
 LDXA==
X-Gm-Message-State: AOAM531EAR3h7vdIr0CkA4XLHvYxQu3EF4vKLKNcSgO/e5UbtEd/5Rpn
 PtRQTitA3HfIki/9F1nfdhWlZiC/qT94Cw==
X-Google-Smtp-Source: ABdhPJylFr5y1nsBKgvY48SoCtKASw4BxLLeq/0q9KnZO0rNHSjX3pKfJ0CeTGi44D6mDi/fgxJMew==
X-Received: by 2002:adf:ee0d:: with SMTP id y13mr3958394wrn.228.1611918047235; 
 Fri, 29 Jan 2021 03:00:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/46] hw/arm/musca: Create and connect ARMSSE Clocks
Date: Fri, 29 Jan 2021 11:00:02 +0000
Message-Id: <20210129110012.8660-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Message-id: 20210128114145.20536-16-peter.maydell@linaro.org
Message-id: 20210121190622.22000-16-peter.maydell@linaro.org
---
 hw/arm/musca.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index d82bef11cf2..a9292482a06 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -33,6 +33,7 @@
 #include "hw/misc/tz-ppc.h"
 #include "hw/misc/unimp.h"
 #include "hw/rtc/pl031.h"
+#include "hw/qdev-clock.h"
 #include "qom/object.h"
 
 #define MUSCA_NUMIRQ_MAX 96
@@ -82,6 +83,8 @@ struct MuscaMachineState {
     UnimplementedDeviceState sdio;
     UnimplementedDeviceState gpio;
     UnimplementedDeviceState cryptoisland;
+    Clock *sysclk;
+    Clock *s32kclk;
 };
 
 #define TYPE_MUSCA_MACHINE "musca"
@@ -96,6 +99,8 @@ OBJECT_DECLARE_TYPE(MuscaMachineState, MuscaMachineClass, MUSCA_MACHINE)
  * don't model that in our SSE-200 model yet.
  */
 #define SYSCLK_FRQ 40000000
+/* Slow 32Khz S32KCLK frequency in Hz */
+#define S32KCLK_FRQ (32 * 1000)
 
 static qemu_irq get_sse_irq_in(MuscaMachineState *mms, int irqno)
 {
@@ -367,6 +372,11 @@ static void musca_init(MachineState *machine)
         exit(1);
     }
 
+    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+    mms->s32kclk = clock_new(OBJECT(machine), "S32KCLK");
+    clock_set_hz(mms->s32kclk, S32KCLK_FRQ);
+
     object_initialize_child(OBJECT(machine), "sse-200", &mms->sse,
                             TYPE_SSE200);
     ssedev = DEVICE(&mms->sse);
@@ -376,6 +386,8 @@ static void musca_init(MachineState *machine)
     qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
     qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
     qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
+    qdev_connect_clock_in(ssedev, "MAINCLK", mms->sysclk);
+    qdev_connect_clock_in(ssedev, "S32KCLK", mms->s32kclk);
     /*
      * Musca-A takes the default SSE-200 FPU/DSP settings (ie no for
      * CPU0 and yes for CPU1); Musca-B1 explicitly enables them for CPU0.
-- 
2.20.1


