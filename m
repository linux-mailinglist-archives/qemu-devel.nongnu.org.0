Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC8B307545
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:54:32 +0100 (CET)
Received: from localhost ([::1]:42458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55sd-0001FG-VI
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:54:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gp-0001c5-0h
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:19 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gZ-0006Au-RM
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:17 -0500
Received: by mail-wm1-x32e.google.com with SMTP id m2so4050556wmm.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bzo+HlCWYd6RpRkmDCS86OIn4z0/YeV5nKkyTCJsudM=;
 b=jd1XBWvnfZt/mY8Al2ItoON0bBxtRfeonyw5CKEuAiwL8D5ZuaVumNIUedDdWRLikU
 l0pYMyoi9FB97cVyxwoTblG24pruA5jOsCQxTpUKx28v13MoVzW+KV7FOSjkgbugpdZO
 wOSlyvL8kIJ2c7OFWoiJFDDUZuEn5fIy2SJ9zhIzsthxOL2a0QZyEi6q8tWOasAcSWtd
 rxcGAFKblE/02I1azeDVcoKu9LzbRqwxbu9AmxCLj/YhqWsfddzrHzFqM7uEN0Uk8w7j
 NhHXWqKIwU79wJq7aAG/tzfJH+lLLImJPa5+6I48ONKX1cQU6sGbAscryf3dhVlx4X6K
 tEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bzo+HlCWYd6RpRkmDCS86OIn4z0/YeV5nKkyTCJsudM=;
 b=ZmzNUkPGNd/ShnS73X89Tq8o0fNRhZrspPZ6BhsTxG3Vb3gNLTKQzueVRjAefQOzO5
 isQOh9cXUaEFwKhyvB3aEUEbd1XFPqt9UyUKBR8VdV7jG2wQXpZYw4xTd/d4J9q9UJ44
 S2OmaW0xzHCmwQqDQFalFe2GShMeX+Yce1zgsYWNh98T/odBoVemlGtSLwhm1MstC4b6
 Zpbfg9Gz9gdWtX6+9W/oT/ny7WyIscjRPXxPJwTkTPX/iQg98DICpMF9KjrIIK/J2EDN
 lqI6uM1c2jaLzKts7FGoBq+D5X9X00AdsS76LF8nmohK4lCeFMl/vCruf9Sd3DqTpb+v
 adHA==
X-Gm-Message-State: AOAM530xyMQbw4Nqx5bnGpXK+YyaoQeE8PSzkvZDK/sv4AftRVlsaK1i
 GD8mtuOLWlnRE24Rzl3VXhJSogMPJlf2jw==
X-Google-Smtp-Source: ABdhPJwivJx+QO2EjJCZqgLoHqQ8shgdau+HaSqkvFEZeiRG6Q4L2O7pL1yKbyY5bNkQmMdqnACuyA==
X-Received: by 2002:a1c:9d08:: with SMTP id g8mr8280761wme.112.1611834122533; 
 Thu, 28 Jan 2021 03:42:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/25] hw/arm/musca: Create and connect ARMSSE Clocks
Date: Thu, 28 Jan 2021 11:41:35 +0000
Message-Id: <20210128114145.20536-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and connect the two clocks needed by the ARMSSE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
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


