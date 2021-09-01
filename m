Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376363FD86C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:06:57 +0200 (CEST)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLO52-0007Dd-9d
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcS-0007Am-O7
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:25 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcN-0005tY-I7
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:24 -0400
Received: by mail-wr1-x430.google.com with SMTP id q14so3763640wrp.3
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LskhgeDFxMSe9BFJVw4Kt1/jQ0fSUufDcVp7/+pC9/A=;
 b=lR0gZfpCyRpistYNqp66Nfu54FhSoq8ra5CyxWQBNRrKb2b6tvqIYVL43JZrOc962n
 jektqxfJoNHYsu0Xg8vTT+1pmxu8RvXXlHNJp4+VqOMaWs/+E2TGE8IIq5dAzqzmh9qV
 vFKrvcX44hFp5QfLpPdzokST4lGO147ERB+1yD4SKHHOmDwpWfZPkpY7MMaZdHLcJn2p
 43808ElyX/GFomOOuJO0R6eqdM51k267OPIe25XRXqiQG/wQJghhqh5QtUkgSlEVwxTg
 tS9ed6hWKQQdMyTSo1d8jBOwTcw8mVn7Ryp7jWvUTDaTG38/mPB/meN28A+4iaX6aDoe
 AIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LskhgeDFxMSe9BFJVw4Kt1/jQ0fSUufDcVp7/+pC9/A=;
 b=fGLJnnyfeIISFGidzRpyXsxcSE2BGcB6zJAgBBaymVSylUwsS0lPGXgBKLyH+vi8Wg
 EBcGpN6tQ/RhboZxvKIoLEKvE2RLh0EDuA3oPKouL/8Nn4sC9XgjMGScZ8LKLfp5DQQ8
 S0VPoGn6OBD91bTBx2HsxtQ788GIjaofsBr/JkacAZ1W/H4XSmR+++bbGiNPOnVMQe9O
 gnzb3zRACUtKF829IaRg0IRlYJv4Ml2hVqfUkfbEIfTpv9qPEa7vbgksFe9+hQOrNpTd
 P2FooNbbLpH2zE5EcZW2vhQanH0ZDophUiIPdO4bO5qm7J+2tTeU2xXvP2nT88n/5RCu
 87cw==
X-Gm-Message-State: AOAM531EWK0BC7S84sbPwPez+tJ2iVDjLJfHjmsCfH0/Vzhu1F/KCanw
 eoFKSBS87A+BcRq/qDsUBkZ5mWxF68q99Q==
X-Google-Smtp-Source: ABdhPJwiqOmTXJmryOtBGr/alf/cj56/nyaHFJXrggNd6NTpBoDk5tZs2zMXCguhERsRzZ00/rP8qw==
X-Received: by 2002:a5d:6149:: with SMTP id y9mr37430096wrt.162.1630492637401; 
 Wed, 01 Sep 2021 03:37:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/51] hw/arm/armv7m: Create input clocks
Date: Wed,  1 Sep 2021 11:36:34 +0100
Message-Id: <20210901103653.13435-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Create input clocks on the armv7m container object which pass through
to the systick timers, so that users of the armv7m object can specify
the clocks being used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-7-peter.maydell@linaro.org
---
 include/hw/arm/armv7m.h |  6 ++++++
 hw/arm/armv7m.c         | 23 +++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index fe8b248a6c6..b7ba0ff409c 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -15,6 +15,7 @@
 #include "hw/misc/armv7m_ras.h"
 #include "target/arm/idau.h"
 #include "qom/object.h"
+#include "hw/clock.h"
 
 #define TYPE_BITBAND "ARM-bitband-memory"
 OBJECT_DECLARE_SIMPLE_TYPE(BitBandState, BITBAND)
@@ -51,6 +52,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MState, ARMV7M)
  * + Property "vfp": enable VFP (forwarded to CPU object)
  * + Property "dsp": enable DSP (forwarded to CPU object)
  * + Property "enable-bitband": expose bitbanded IO
+ * + Clock input "refclk" is the external reference clock for the systick timers
+ * + Clock input "cpuclk" is the main CPU clock
  */
 struct ARMv7MState {
     /*< private >*/
@@ -82,6 +85,9 @@ struct ARMv7MState {
     /* MR providing default PPB behaviour */
     MemoryRegion defaultmem;
 
+    Clock *refclk;
+    Clock *cpuclk;
+
     /* Properties */
     char *cpu_type;
     /* MemoryRegion the board provides to us (with its devices, RAM, etc) */
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 899159f70b1..8d08db80be8 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -14,12 +14,14 @@
 #include "hw/arm/boot.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 #include "elf.h"
 #include "sysemu/reset.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
 #include "target/arm/idau.h"
+#include "migration/vmstate.h"
 
 /* Bitbanded IO.  Each word corresponds to a single bit.  */
 
@@ -265,6 +267,9 @@ static void armv7m_instance_init(Object *obj)
         object_initialize_child(obj, "bitband[*]", &s->bitband[i],
                                 TYPE_BITBAND);
     }
+
+    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
+    s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk", NULL, NULL, 0);
 }
 
 static void armv7m_realize(DeviceState *dev, Error **errp)
@@ -416,6 +421,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     }
 
     /* Create and map the systick devices */
+    qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "refclk", s->refclk);
+    qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "cpuclk", s->cpuclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
         return;
     }
@@ -431,6 +438,10 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
          */
         object_initialize_child(OBJECT(dev), "systick-reg-s",
                                 &s->systick[M_REG_S], TYPE_SYSTICK);
+        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "refclk",
+                              s->refclk);
+        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "cpuclk",
+                              s->cpuclk);
 
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_S]), errp)) {
             return;
@@ -504,11 +515,23 @@ static Property armv7m_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static const VMStateDescription vmstate_armv7m = {
+    .name = "armv7m",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(refclk, SysTickState),
+        VMSTATE_CLOCK(cpuclk, SysTickState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void armv7m_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = armv7m_realize;
+    dc->vmsd = &vmstate_armv7m;
     device_class_set_props(dc, armv7m_properties);
 }
 
-- 
2.20.1


