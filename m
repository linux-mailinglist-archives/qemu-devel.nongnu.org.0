Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C38331564
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:01:06 +0100 (CET)
Received: from localhost ([::1]:58998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKBl-0004Kf-Qz
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkW-0006Sv-A0
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:57 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkR-00071I-Ut
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:32:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id e23so6233wmh.3
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nDyP9ypF8wYRQxpw03et3ZMsoMq+NJUfwHj4BlPENf0=;
 b=xnegTKWwFa8Zd5CR7v3g5QQV/U9f3dlgw0SO0XKyTyyGva1a9KgRpfiEC4wK58U+pc
 Dmg7X8jisqs0kDYHVcxyIzqSaLrie3n4E631rOpBQNBH8GSEcSxxyCYSEobiWJwD03Ft
 OCN+7iW+uhFLTsMC9N4LQegpAWAdJ2Drpvl+NDtUlcptuBiJWgxCbekRxuNmKp3BMqiN
 9T0o3W/RzXD1xOlaWOihtR+EtkKc99NFuHuSmc3QT8hFzNsmqv6zX7bwSTcj0UpsUy6V
 DRfVYNUguoGitQp7n1rIM9EwdRqd9fR4tXmWNOCSA45IPrbwZTuyx83qu5upmA7/6I1R
 5qZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nDyP9ypF8wYRQxpw03et3ZMsoMq+NJUfwHj4BlPENf0=;
 b=nxtkbAhe4Ensa/O52oX/gTJd19o/cTwkt8TBp47iuoxIWtRPfLi/zcAAoMfuLEztOS
 dNmSWAd5ISPTFEV6DK2E9O3k7p2IN8p40R48JU426+ATyC+OKZnGgERUm/BkYvvekF+R
 MPKBUidgl4WBs3Hl6PEsyPmhpTKHkkbPFXEK8kn92BTXK82VtTN34BTRjBrw/V17Gp9N
 f72BLiO4XzpIQ4QErFRql/WgyNI8oxWbs0+PzxB1U0iUbf0z2T8vdkChYhtZMVbnc+8O
 KMcIyvVHFvOLBjowRO85DYp1TeoCBMbUX3wSbTUILMUcPucGRxmlL7LEeSszFIto2Obh
 NwTA==
X-Gm-Message-State: AOAM532M2kq2zBmdwSgWme/Ne2GPMwETQ/m/TrKkYMw/751Uf4ypY9Ap
 fjOyiho7zSV+J8eAiPZ/H9tkU+3x7Vp3Bg==
X-Google-Smtp-Source: ABdhPJwTJu/Id24HGFFmnM7URWge1MhLkq/Figd4oPZ1l3LII21FV6qe2CikKL6nUwd/pMd1+DMeeg==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr7601318wmj.122.1615224770439; 
 Mon, 08 Mar 2021 09:32:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.32.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:32:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/54] hw/arm/armsse: Introduce SSE subsystem version property
Date: Mon,  8 Mar 2021 17:31:55 +0000
Message-Id: <20210308173244.20710-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

We model Arm "Subsystems for Embedded" SoC subsystems using generic
code which is split into various sub-devices which are configurable
by QOM properties to handle the behaviour differences between the SSE
subsystems we implement.  Currently the only sub-device which needs
to change is the IOTKIT_SYSCTL device, and we do this with a mix of
properties that directly specify divergent behaviours (eg
CPUWAIT_RST) and passing it the SYS_VERSION register value as a way
for it to distinguish IoTKit from SSE-200.

The "pass SYS_VERSION" approach is already a bit hacky, since the
IOTKIT_SYSCTL device has to know that the different part of the
register value happens to be bits [31:28].  For SSE-300 this register
is renamed SOC_IDENTITY and has a different format entirely, all of
whose fields can be configured by the SoC integrator when they
integrate the SSE into their SoC, and so "pass SYS_VERSION" breaks
down completely.

Switch to using a simple integer property representing an
internal-to-QEMU enumeration of the SSE flavour.  For the moment we
only need this in IOTKIT_SYSCTL, but as we add SSE-300 support a few
of the other devices will also need to know.

We define and permit a value for the SSE-300 so we can start using
it in subsequent commits which add SSE-300 support.

The now-redundant is_sse200 flag in IoTKitSysCtl will be removed
in the following commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-6-peter.maydell@linaro.org
---
 include/hw/arm/armsse-version.h | 42 +++++++++++++++++++++++++++++++++
 include/hw/misc/iotkit-sysctl.h |  7 +++---
 hw/arm/armsse.c                 |  8 +++++--
 hw/misc/iotkit-sysctl.c         | 11 +++++----
 4 files changed, 58 insertions(+), 10 deletions(-)
 create mode 100644 include/hw/arm/armsse-version.h

diff --git a/include/hw/arm/armsse-version.h b/include/hw/arm/armsse-version.h
new file mode 100644
index 00000000000..60780fa9843
--- /dev/null
+++ b/include/hw/arm/armsse-version.h
@@ -0,0 +1,42 @@
+/*
+ * ARM SSE (Subsystems for Embedded): IoTKit, SSE-200
+ *
+ * Copyright (c) 2020 Linaro Limited
+ * Written by Peter Maydell
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+#ifndef ARMSSE_VERSION_H
+#define ARMSSE_VERSION_H
+
+
+/*
+ * Define an enumeration of the possible values of the sse-version
+ * property implemented by various sub-devices of the SSE, and
+ * a validation function that checks that a valid value has been passed.
+ * These are arbitrary QEMU-internal values (nobody should be creating
+ * the sub-devices of the SSE except for the SSE object itself), but
+ * we pick obvious numbers for the benefit of people debugging with gdb.
+ */
+enum {
+    ARMSSE_IOTKIT = 0,
+    ARMSSE_SSE200 = 200,
+    ARMSSE_SSE300 = 300,
+};
+
+static inline bool armsse_version_valid(uint32_t sse_version)
+{
+    switch (sse_version) {
+    case ARMSSE_IOTKIT:
+    case ARMSSE_SSE200:
+    case ARMSSE_SSE300:
+        return true;
+    default:
+        return false;
+    }
+}
+
+#endif
diff --git a/include/hw/misc/iotkit-sysctl.h b/include/hw/misc/iotkit-sysctl.h
index 2bc391138db..7cdafea3e25 100644
--- a/include/hw/misc/iotkit-sysctl.h
+++ b/include/hw/misc/iotkit-sysctl.h
@@ -17,9 +17,8 @@
  * "system control register" blocks.
  *
  * QEMU interface:
- *  + QOM property "SYS_VERSION": value of the SYS_VERSION register of the
- *    system information block of the SSE
- *    (used to identify whether to provide SSE-200-only registers)
+ *  + QOM property "sse-version": indicates which SSE version this is part of
+ *    (used to identify whether to provide SSE-200-only registers, etc)
  *  + sysbus MMIO region 0: the system information register bank
  *  + sysbus MMIO region 1: the system control register bank
  */
@@ -61,7 +60,7 @@ struct IoTKitSysCtl {
     uint32_t pdcm_pd_sram3_sense;
 
     /* Properties */
-    uint32_t sys_version;
+    uint32_t sse_version;
     uint32_t cpuwait_rst;
     uint32_t initsvtor0_rst;
     uint32_t initsvtor1_rst;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index fa155b72022..f509f59d4a8 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -19,6 +19,7 @@
 #include "migration/vmstate.h"
 #include "hw/registerfields.h"
 #include "hw/arm/armsse.h"
+#include "hw/arm/armsse-version.h"
 #include "hw/arm/boot.h"
 #include "hw/irq.h"
 #include "hw/qdev-clock.h"
@@ -31,6 +32,7 @@ typedef enum SysConfigFormat {
 
 struct ARMSSEInfo {
     const char *name;
+    uint32_t sse_version;
     int sram_banks;
     int num_cpus;
     uint32_t sys_version;
@@ -71,6 +73,7 @@ static Property armsse_properties[] = {
 static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
+        .sse_version = ARMSSE_IOTKIT,
         .sram_banks = 1,
         .num_cpus = 1,
         .sys_version = 0x41743,
@@ -85,6 +88,7 @@ static const ARMSSEInfo armsse_variants[] = {
     },
     {
         .name = TYPE_SSE200,
+        .sse_version = ARMSSE_SSE200,
         .sram_banks = 4,
         .num_cpus = 2,
         .sys_version = 0x22041743,
@@ -951,8 +955,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     /* System information registers */
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysinfo), 0, 0x40020000);
     /* System control registers */
-    object_property_set_int(OBJECT(&s->sysctl), "SYS_VERSION",
-                            info->sys_version, &error_abort);
+    object_property_set_int(OBJECT(&s->sysctl), "sse-version",
+                            info->sse_version, &error_abort);
     object_property_set_int(OBJECT(&s->sysctl), "CPUWAIT_RST",
                             info->cpuwait_rst, &error_abort);
     object_property_set_int(OBJECT(&s->sysctl), "INITSVTOR0_RST",
diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 222511c4b04..34b37fe8824 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -28,6 +28,7 @@
 #include "hw/registerfields.h"
 #include "hw/misc/iotkit-sysctl.h"
 #include "hw/qdev-properties.h"
+#include "hw/arm/armsse-version.h"
 #include "target/arm/arm-powerctl.h"
 #include "target/arm/cpu.h"
 
@@ -438,10 +439,12 @@ static void iotkit_sysctl_realize(DeviceState *dev, Error **errp)
 {
     IoTKitSysCtl *s = IOTKIT_SYSCTL(dev);
 
-    /* The top 4 bits of the SYS_VERSION register tell us if we're an SSE-200 */
-    if (extract32(s->sys_version, 28, 4) == 2) {
-        s->is_sse200 = true;
+    if (!armsse_version_valid(s->sse_version)) {
+        error_setg(errp, "invalid sse-version value %d", s->sse_version);
+        return;
     }
+
+    s->is_sse200 = s->sse_version == ARMSSE_SSE200;
 }
 
 static bool sse200_needed(void *opaque)
@@ -493,7 +496,7 @@ static const VMStateDescription iotkit_sysctl_vmstate = {
 };
 
 static Property iotkit_sysctl_props[] = {
-    DEFINE_PROP_UINT32("SYS_VERSION", IoTKitSysCtl, sys_version, 0),
+    DEFINE_PROP_UINT32("sse-version", IoTKitSysCtl, sse_version, 0),
     DEFINE_PROP_UINT32("CPUWAIT_RST", IoTKitSysCtl, cpuwait_rst, 0),
     DEFINE_PROP_UINT32("INITSVTOR0_RST", IoTKitSysCtl, initsvtor0_rst,
                        0x10000000),
-- 
2.20.1


