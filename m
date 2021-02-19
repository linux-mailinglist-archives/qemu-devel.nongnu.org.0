Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74E131FBB2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:10:39 +0100 (CET)
Received: from localhost ([::1]:38504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7QU-00066Y-MS
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73p-0002fN-NL
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:13 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73N-0003cT-9N
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:13 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t15so8823981wrx.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZJZFHHRnw+bIexNpw6ym+fjTBPuLscNy2u0S4pBqSr0=;
 b=NTMsojNWO++Z1h/0Jg4GPljy1CAJQSlt9ggWk1MIBvQY4mzxnXsbiNNRFFjeUfTp00
 qgrkQiy0rlpgkziaZMshbe7ZGm64jhuCEfiWrwY8GDKLJnCreGj3kR2LwEuTW/3/VjYX
 YvSSTEWUXLFPpzeG35ENF2BqILTQZThELvIbHqLUKdhcEq2SzYPwf3qGLQMzl/7kVO/K
 O6D1pPbbI+YD7PH2hQ2aYa4nNDkfqO7vgEgzO/DeO6aKOkLLRiTxQdhldaohSVgBN818
 CD+6BAlJ6F5FZ54MAnSuWyfAaR5KM1RekQoFJiBbf8OrysPSUsy1DbEEg0A1Z5/5VAoC
 iYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZJZFHHRnw+bIexNpw6ym+fjTBPuLscNy2u0S4pBqSr0=;
 b=TJy4RbFx34DREXSDasVAnZZOYpsh0/3zP3oT0dDv/i06vamA6/wAQ2zr9EakLaWJRd
 cNIsQIfuTL7UsmMY+dVonIIqSYcRRXrWmb5lsPF4ks1gOW8A0bGGPC7mu90L5a3nQz7p
 gX/1bPO7j9SXng8N5+NEAkGD6Xs8WPkiZWrUkGi6zpvOwO3b1OLW6UQkKzmE+fmkPdY2
 /hO7c+2lqQBDQMkepw5/+dZ8bZX9pGFo1pCKohp9kmAVCIXVg4lSsqRh3/TODZUID5WX
 G09iaSP4EI3gTVQzpsdCde7WiBbjcsmouGB08L/b9bMypJPmk++iXLGKGSQU2gvGhf/N
 nQMg==
X-Gm-Message-State: AOAM532NchKbY1hGTeFQC92t8ljJWe5gLwxIdBeOAuIvQbd+68LVFn5M
 LmoimZcyEOzJX/GNMgRSTT3Og+Gabj0Duw==
X-Google-Smtp-Source: ABdhPJwynZ44fXK6672WEzILcp7zqzlL/wazNWYqdjhjWgO1IoUeFfHBNLDQbKVT2OoH1pRz+odisQ==
X-Received: by 2002:a5d:5109:: with SMTP id s9mr8160882wrt.325.1613746004089; 
 Fri, 19 Feb 2021 06:46:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 32/44] hw/arm/armsse: Add support for SSE variants with a
 system counter
Date: Fri, 19 Feb 2021 14:46:05 +0000
Message-Id: <20210219144617.4782-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SSE-300 has a system counter device; add support for SSE
variants having this device.

As with the existing devices like the cache control block, CPUID
block, etc, we don't try to make the MMIO addresses configurable.  We
can do that if and when we need to model a future SSE variant which
has the counter in a different location.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |  3 +++
 hw/arm/armsse.c         | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 104ba8d26ec..149f17dfc88 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -97,6 +97,7 @@
 #include "hw/misc/tz-mpc.h"
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "hw/timer/cmsdk-apb-dualtimer.h"
+#include "hw/timer/sse-counter.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "hw/misc/iotkit-sysctl.h"
 #include "hw/misc/iotkit-sysinfo.h"
@@ -164,6 +165,8 @@ struct ARMSSE {
 
     CMSDKAPBWatchdog cmsdk_watchdog[3];
 
+    SSECounter sse_counter;
+
     IoTKitSysCtl sysctl;
     IoTKitSysCtl sysinfo;
 
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index b316fe69571..4387e98376c 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -66,6 +66,7 @@ struct ARMSSEInfo {
     bool has_cachectrl;
     bool has_cpusecctrl;
     bool has_cpuid;
+    bool has_sse_counter;
     Property *props;
     const ARMSSEDeviceInfo *devinfo;
     const bool *irq_is_common;
@@ -363,6 +364,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cachectrl = false,
         .has_cpusecctrl = false,
         .has_cpuid = false,
+        .has_sse_counter = false,
         .props = iotkit_properties,
         .devinfo = iotkit_devices,
         .irq_is_common = sse200_irq_is_common,
@@ -379,6 +381,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cachectrl = true,
         .has_cpusecctrl = true,
         .has_cpuid = true,
+        .has_sse_counter = false,
         .props = armsse_properties,
         .devinfo = sse200_devices,
         .irq_is_common = sse200_irq_is_common,
@@ -652,6 +655,11 @@ static void armsse_init(Object *obj)
             g_free(name);
         }
     }
+    if (info->has_sse_counter) {
+        object_initialize_child(obj, "sse-counter", &s->sse_counter,
+                                TYPE_SSE_COUNTER);
+    }
+
     object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate, TYPE_OR_IRQ);
     object_initialize_child(obj, "ppc-irq-orgate", &s->ppc_irq_orgate,
                             TYPE_OR_IRQ);
@@ -1000,6 +1008,25 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out(DEVICE(&s->nmi_orgate), 0,
                           qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
 
+    /* The SSE-300 has a System Counter / System Timestamp Generator */
+    if (info->has_sse_counter) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sse_counter);
+
+        qdev_connect_clock_in(DEVICE(sbd), "CLK", s->mainclk);
+        if (!sysbus_realize(sbd, errp)) {
+            return;
+        }
+        /*
+         * The control frame is only in the Secure region;
+         * the status frame is in the NS region (and visible in the
+         * S region via the alias mapping).
+         */
+        memory_region_add_subregion(&s->container, 0x58100000,
+                                    sysbus_mmio_get_region(sbd, 0));
+        memory_region_add_subregion(&s->container, 0x48101000,
+                                    sysbus_mmio_get_region(sbd, 1));
+    }
+
     /* Devices behind APB PPC0:
      *   0x40000000: timer0
      *   0x40001000: timer1
-- 
2.20.1


