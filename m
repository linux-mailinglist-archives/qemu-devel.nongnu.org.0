Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A108B3EA230
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:39:26 +0200 (CEST)
Received: from localhost ([::1]:36190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7BN-0003y6-Lx
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76J-0005BJ-Iw
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:11 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76E-0007os-85
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so4043923wmb.5
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ylx+ciRLSX1VOp2PZHd/2EZv1BHv9jNlhqLtZX6B8Y0=;
 b=MGkLFDtNFqsalT3ezMKfPwRD55To5J7yqy0f9sNNcZYGd3EgXGShnvNdcVXCvOGq+c
 KP+yaU0gn8Sz4WYNhBH9ROfTW9rlGPqPt870pdFSRP9v8N6NaWLANyweKwfhQpN1qul0
 DNvx9n1WK8+F4OCZUBjLk45DdPOytRnpmyb8ZuG+U0V1foh86TSM5UTPvbSy8Mdy2+NR
 YY/Z09gdeOlLXZrjHJWdEXtIHmnLLFRm6GiSAmzvON2Yrpp1P7RN5UezYBbmOgqWTJyk
 hFKglV7MXEUwzqzgVn8v0OQYJBrbqgDwRFg9PF0pxvEeM9lLOi1sKYYtOWcMA0h9yk6X
 x9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ylx+ciRLSX1VOp2PZHd/2EZv1BHv9jNlhqLtZX6B8Y0=;
 b=sTKOfyx3Y2RIZQEfdmZtgRds6ccqIp0mCGVstjewwxP1ee7IBfru/CzuL5wx1t++o0
 gfewv8+e0uQ5XtN8l+mkENH3SxJRf/3K1k8bcRu/j/e5HJcTJbIVsKuHDus+iKIlbmks
 JNmvS1m0e+YSOQEHCO/vxho0Byh5iRvOi8ZR2VRmATnAm5QOB/A9LC2F644hsl/ouGxq
 PXaGJDB/tSf5ZuTh73FunAU8npGUzKuoZ9mvwZwo5eqPq4/rsL6JGrh0LeOl4rJuGqtT
 alcMVcSgGCM1khfTUMQVI9bUSmm2JpGWHhFERfIdU8geEn1egrSFr4hpyzY1n5DEB/3p
 yMvA==
X-Gm-Message-State: AOAM533UtZ9Lb+MemrvxksMKrqMc9pHMaTfE2aQ/BkdwVy+QxNxNavoJ
 7wz6wEXKx5NGjxRv87FYWxU7Bw==
X-Google-Smtp-Source: ABdhPJzgLUqI3i06ZMr43ipk+QVjSX/6ndn/hes1KsJjGVFeljwL5vv9fr5Gmo3glKu9Zz0vHw1diQ==
X-Received: by 2002:a7b:c083:: with SMTP id r3mr3023821wmh.65.1628760844921;
 Thu, 12 Aug 2021 02:34:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 06/25] hw/arm/armv7m: Create input clocks
Date: Thu, 12 Aug 2021 10:33:37 +0100
Message-Id: <20210812093356.1946-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create input clocks on the armv7m container object which pass through
to the systick timers, so that users of the armv7m object can specify
the clocks being used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index 7e7fb7a3ad3..db1bfa98df0 100644
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


