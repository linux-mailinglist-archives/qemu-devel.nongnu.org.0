Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A031FBDB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:20:08 +0100 (CET)
Received: from localhost ([::1]:43446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Zf-0003g0-Ou
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73s-0002lk-LI
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:16 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73P-0003db-Il
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:16 -0500
Received: by mail-wr1-x42d.google.com with SMTP id n4so8912910wrx.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y0IkltMwkMmsntCXmla7YgVCExbHqoOzjdETdOI28dg=;
 b=wseSwm5R1EC+ycCHupY24rZDlUnOWnFgK8okczW+Z6g+zgVYmKYu1l2KWd+MK1Lh90
 R9QZTwMAe7pRkQCqCfSPW5TPQV6Q4WqH0oVz3m6z1LaNWvJHqOYENoxCjBP6ZoKpbg5C
 LvCk3ygzlyUDG7ZwnIQcaLbwo3uYkAH6B/pcL4RGlgePf+RLU5few3NPaNLf9Ai3g6Cg
 q8QSCG9+Jzaxv3zbXFFvMASuh0iOjodPFiZbp9qiyF3ZKwXqS/nryvwDmkrIhPCHCfG1
 9jv7K8z55xgOrmrPmldERFhkAXsu2Sc5suiRaAiN8o8W7L+46zSoQ7kkarMVRvSX2zSL
 uImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0IkltMwkMmsntCXmla7YgVCExbHqoOzjdETdOI28dg=;
 b=HlWNWztOVpCNpWWvLoGotiOMYEsHUTFMHIyH40OhmtYIgwzLFy12tEjlymvDA8lnNT
 XuLiF92MohJU/HesKUt70c2DjFYKw76u7cKegpbr10Uj6KVT9p4JefrFkfDSgseIz+R/
 Ho3eLyBOkMIyckVDXP2Rv29bw3I3xhBpiSMQfHVDbjSOM1y8yFb/x0Ec/XZPO8ZKgotV
 crhzauHLRW8JEqTe/quamzapCmoQq+2CHD5Upwkf8YsdjJ7l5Y7dkJtV/aO/XwW7sqC2
 4m4Oe9DmkLqhgtWOfZR2jDyAOboDRK28KyEsnq0egHkrV/w7cDnPFoWEhudKw+EC+lfA
 i1yg==
X-Gm-Message-State: AOAM532aEaBpJwO/q9zqBYujhkUf3FFfcW7J2XOvGAYKcis2lh7UGigg
 jvF3pYfzvof9Pn4IET64df5wKg==
X-Google-Smtp-Source: ABdhPJxk562T7pjJ74OIbrgk9pUWBpaRW9mqfoU5pbFGB4fPZw3pTvkzc98R9KNO2qwv1K1NpWTNyg==
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr9486027wry.398.1613746006201; 
 Fri, 19 Feb 2021 06:46:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 35/44] hw/arm/armsse: Add SSE-300 support
Date: Fri, 19 Feb 2021 14:46:08 +0000
Message-Id: <20210219144617.4782-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Now we have sufficiently parameterised the code, we can add SSE-300
support by adding a new entry to the armsse_variants[] array.

Note that the main watchdog (unlike the s32k watchdog) in the SSE-300
is a different device from the CMSDK watchdog; we don't have a model
of it so we leave it as a TYPE_UNIMPLEMENTED_DEVICE stub.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h |   1 +
 hw/arm/armsse.c         | 152 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 153 insertions(+)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 21d239c381c..36592be62c5 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -123,6 +123,7 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
  */
 #define TYPE_IOTKIT "iotkit"
 #define TYPE_SSE200 "sse-200"
+#define TYPE_SSE300 "sse-300"
 
 /* We have an IRQ splitter and an OR gate input for each external PPC
  * and the 2 internal PPCs
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2366c49376d..e5aeb9e485f 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -337,6 +337,128 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
     }
 };
 
+static const ARMSSEDeviceInfo sse300_devices[] = {
+    {
+        .name = "timer0",
+        .type = TYPE_SSE_TIMER,
+        .index = 0,
+        .addr = 0x48000000,
+        .ppc = 0,
+        .ppc_port = 0,
+        .irq = 3,
+    },
+    {
+        .name = "timer1",
+        .type = TYPE_SSE_TIMER,
+        .index = 1,
+        .addr = 0x48001000,
+        .ppc = 0,
+        .ppc_port = 1,
+        .irq = 4,
+    },
+    {
+        .name = "timer2",
+        .type = TYPE_SSE_TIMER,
+        .index = 2,
+        .addr = 0x48002000,
+        .ppc = 0,
+        .ppc_port = 2,
+        .irq = 5,
+    },
+    {
+        .name = "timer3",
+        .type = TYPE_SSE_TIMER,
+        .index = 3,
+        .addr = 0x48003000,
+        .ppc = 0,
+        .ppc_port = 5,
+        .irq = 27,
+    },
+    {
+        .name = "s32ktimer",
+        .type = TYPE_CMSDK_APB_TIMER,
+        .index = 0,
+        .addr = 0x4802f000,
+        .ppc = 1,
+        .ppc_port = 0,
+        .irq = 2,
+        .slowclk = true,
+    },
+    {
+        .name = "s32kwatchdog",
+        .type = TYPE_CMSDK_APB_WATCHDOG,
+        .index = 0,
+        .addr = 0x4802e000,
+        .ppc = NO_PPC,
+        .irq = NMI_0,
+        .slowclk = true,
+    },
+    {
+        .name = "watchdog",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 0,
+        .addr = 0x48040000,
+        .size = 0x2000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "armsse-sysinfo",
+        .type = TYPE_IOTKIT_SYSINFO,
+        .index = 0,
+        .addr = 0x48020000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "armsse-sysctl",
+        .type = TYPE_IOTKIT_SYSCTL,
+        .index = 0,
+        .addr = 0x58021000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "SYS_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 1,
+        .addr = 0x58022000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "CPU0CORE_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 2,
+        .addr = 0x50023000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "MGMT_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 3,
+        .addr = 0x50028000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = "DEBUG_PPU",
+        .type = TYPE_UNIMPLEMENTED_DEVICE,
+        .index = 4,
+        .addr = 0x50029000,
+        .size = 0x1000,
+        .ppc = NO_PPC,
+        .irq = NO_IRQ,
+    },
+    {
+        .name = NULL,
+    }
+};
+
 /* Is internal IRQ n shared between CPUs in a multi-core SSE ? */
 static const bool sse200_irq_is_common[32] = {
     [0 ... 5] = true,
@@ -352,6 +474,18 @@ static const bool sse200_irq_is_common[32] = {
     /* 30, 31: reserved */
 };
 
+static const bool sse300_irq_is_common[32] = {
+    [0 ... 5] = true,
+    /* 6, 7: per-CPU MHU interrupts */
+    [8 ... 12] = true,
+    /* 13: reserved */
+    [14 ... 16] = true,
+    /* 17-25: reserved */
+    [26 ... 27] = true,
+    /* 28, 29: per-CPU CTI interrupts */
+    /* 30, 31: reserved */
+};
+
 static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
@@ -389,6 +523,24 @@ static const ARMSSEInfo armsse_variants[] = {
         .devinfo = sse200_devices,
         .irq_is_common = sse200_irq_is_common,
     },
+    {
+        .name = TYPE_SSE300,
+        .sse_version = ARMSSE_SSE300,
+        .sram_banks = 2,
+        .num_cpus = 1,
+        .sys_version = 0x7e00043b,
+        .iidr = 0x74a0043b,
+        .cpuwait_rst = 0,
+        .has_mhus = false,
+        .has_cachectrl = false,
+        .has_cpusecctrl = true,
+        .has_cpuid = true,
+        .has_cpu_pwrctrl = true,
+        .has_sse_counter = true,
+        .props = armsse_properties,
+        .devinfo = sse300_devices,
+        .irq_is_common = sse300_irq_is_common,
+    },
 };
 
 static uint32_t armsse_sys_config_value(ARMSSE *s, const ARMSSEInfo *info)
-- 
2.20.1


