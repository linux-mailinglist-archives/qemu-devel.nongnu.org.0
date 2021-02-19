Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B26431FB7B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:58:22 +0100 (CET)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Eb-0007je-EW
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73H-00026k-WE
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:40 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD734-0003NF-Lg
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:39 -0500
Received: by mail-wm1-x336.google.com with SMTP id o24so7861507wmh.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PMexNJ719krfbbkXchv0cf2DQZcqXIeJxRfo8lnTfNc=;
 b=us72YYpzEQRypK7yqEvJPgWEnnysZXlTF/Cna4AotPKjvRwnVvNE3Gkq2lVbMc6lzl
 JPqoLbQkhcrc8oGg9WhIYzqTZGFLBowu9T8/lZlOdotAnTGpDxuoyjbaCqEtsqcITGBp
 ZDtrBXH72b7tXIog//kb+fJa1v5tEcbflYkTeE+FgRNK+i2t6PQkjPdyTqvb/jjbpp9Z
 m7DRyUJ4zVd4/U/4lBrf/3ypmVs2umVDbubibrGB8JBMKgwv6up0BEfI1ksNQ+9uafGn
 EN8cPPUpo4zQoAf7PMu6tZgdPk7fc3BZWqJneMpTjaauPvlJwXYVDM6d1bh45QVrVutw
 9INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PMexNJ719krfbbkXchv0cf2DQZcqXIeJxRfo8lnTfNc=;
 b=YaflgVb22HX9dBT21CamiiVgTyqtUP/31WDwaplyGf66PAngmA4Zc6fVd5O3kuz5cV
 O4lOESvxx/9SFEidJXW9xfDUic1toXvs0P0bUJfySt2NbSAoue4BoAlvXA/Pn7RFXRQs
 4dYjHeFGa1pgBQtrETInuBKsAmcbHFyTb625rMcDNw9eP+19bBI24Y0feK+d7FnSkaR2
 uNivqzM9ZMlqzwkVp4BsohKL3eWTLH+4YhogMqWFA7ciqSat5sPM5gOcrdxraoRTxopu
 eIRFXUwGDeT1Hz6OitSsZL2Y9ztH/rA26RbvycXdHtL2ZieZ0oKqBBV/OKAakolUgVZq
 LIzQ==
X-Gm-Message-State: AOAM530pc0oLjoeYJR4WP/cVYFC4xz5ORF26ZoR3ORZ1vVxGpcnJITDZ
 eQ3fEBIPWJrgNvOFkQPr8i8dfQ==
X-Google-Smtp-Source: ABdhPJyDhW6qmFOBERZxiiJj/OFhk8mGHYOeuBviVGeiTgMra+bLJJqKns+fDjOiUS38cRdJqED87Q==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr8378400wmb.128.1613745984131; 
 Fri, 19 Feb 2021 06:46:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/44] hw/arm/armsse: Introduce SSE subsystem version property
Date: Fri, 19 Feb 2021 14:45:38 +0000
Message-Id: <20210219144617.4782-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
---
I didn't use a full-on qdev/QOM 'enum' property here because that
requires messing with the QAPI schema, which seems like overkill for
this entirely-internal-to-the-implementation bit of information
passing.
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


