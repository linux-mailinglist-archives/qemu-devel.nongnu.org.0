Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F7631FBAA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:07:30 +0100 (CET)
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7NR-0001oC-Tp
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73m-0002Y6-MZ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:10 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73N-0003cK-2R
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:10 -0500
Received: by mail-wm1-x334.google.com with SMTP id v62so7870011wmg.4
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8JlFA4L9+WCjTt1Xqh1hA9XGzoAG7iZsCgd7Bz2ga0Q=;
 b=JzJqq7ZhHJs9jmyAQ2Ga8rYBwSr8v1qgCPtzT4jIBvILNBFuDU/fvXHE8aiAfqcEAK
 w1LFPD05ceA0DftPBf9cxt3iOeGJAs70JLa59KUPY8RXMg5Z7xAtX0YNqNGsdr+04L5C
 /MbCTJpId0EmSpQqWyNnbEM+jFQnDLGonvW6JCp0EIz38KUIKvSFpLl29OF9mBjB5XHj
 iIdGJf4RB1+F1McgZF1B7F4Q90kYbXE2Kopxc3QT6EGITx58l+gZiu5THjTvl6c0pmRn
 T+DSsUjJwtnROl8yIjpTozWOBWma+uPGJXcH68XaD3tbUVTHTjr/Bbgvb0awSz1DDvaD
 XZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8JlFA4L9+WCjTt1Xqh1hA9XGzoAG7iZsCgd7Bz2ga0Q=;
 b=lsqf1yF5m4H4WR4qCE7DwKIrKnLVUnN4avXbSXMhjO06d23p7/gxvnFIIlV+rV9h2n
 bDOlv8sUOyPkUiNnP0E5Vk0Rgif4WHg4bolRAd5/wnO0yrHHi5C7hBKaFRKaYzASeCgr
 As+U1zoq5cbBKFragddj4F7aGyXU74oOw8VM2xycKCnqgsdqrbQc7/lAprxd4sZvcWxq
 O2Q1puonAb9wp/tAHHvjmP4Xhab0wYyUjncXxYHcp2YSfCQwr0UqxxDO0AQpWmGuN642
 H0XKbNuxPlq7GYaUkNPtXCI9Lcb59qiguqIiB0fVhOCfJ7S98Nh7Jdt7D/nfxE694Lgr
 CNhw==
X-Gm-Message-State: AOAM533c7/dpo8Mlk/wh5FR95zBKT8R8NsSX3kVAL1HhXnX9l09f9BOU
 UgjlZXvZRbAqrCHO/c1g7u0FluNPxSO0qQ==
X-Google-Smtp-Source: ABdhPJxJwU3SH8kIniS4t3HdR2vlrMh/AnfrGqTAr8DjQJoGMDLOSbrb+SkNNx3aZD9xoCSYEgIhdQ==
X-Received: by 2002:a1c:80c6:: with SMTP id b189mr8658115wmd.21.1613746003394; 
 Fri, 19 Feb 2021 06:46:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 31/44] hw/arm/armsse: Indirect irq_is_common[] through
 ARMSSEInfo
Date: Fri, 19 Feb 2021 14:46:04 +0000
Message-Id: <20210219144617.4782-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The SSE-300 has a slightly different set of shared-per-CPU interrupts,
allow the irq_is_common[] array to be different per SSE variant.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index f43f0524e28..b316fe69571 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -68,6 +68,7 @@ struct ARMSSEInfo {
     bool has_cpuid;
     Property *props;
     const ARMSSEDeviceInfo *devinfo;
+    const bool *irq_is_common;
 };
 
 static Property iotkit_properties[] = {
@@ -334,6 +335,21 @@ static const ARMSSEDeviceInfo sse200_devices[] = {
     }
 };
 
+/* Is internal IRQ n shared between CPUs in a multi-core SSE ? */
+static const bool sse200_irq_is_common[32] = {
+    [0 ... 5] = true,
+    /* 6, 7: per-CPU MHU interrupts */
+    [8 ... 12] = true,
+    /* 13: per-CPU icache interrupt */
+    /* 14: reserved */
+    [15 ... 20] = true,
+    /* 21: reserved */
+    [22 ... 26] = true,
+    /* 27: reserved */
+    /* 28, 29: per-CPU CTI interrupts */
+    /* 30, 31: reserved */
+};
+
 static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
@@ -349,6 +365,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpuid = false,
         .props = iotkit_properties,
         .devinfo = iotkit_devices,
+        .irq_is_common = sse200_irq_is_common,
     },
     {
         .name = TYPE_SSE200,
@@ -364,6 +381,7 @@ static const ARMSSEInfo armsse_variants[] = {
         .has_cpuid = true,
         .props = armsse_properties,
         .devinfo = sse200_devices,
+        .irq_is_common = sse200_irq_is_common,
     },
 };
 
@@ -404,21 +422,6 @@ static uint32_t armsse_sys_config_value(ARMSSE *s, const ARMSSEInfo *info)
 /* Clock frequency in HZ of the 32KHz "slow clock" */
 #define S32KCLK (32 * 1000)
 
-/* Is internal IRQ n shared between CPUs in a multi-core SSE ? */
-static bool irq_is_common[32] = {
-    [0 ... 5] = true,
-    /* 6, 7: per-CPU MHU interrupts */
-    [8 ... 12] = true,
-    /* 13: per-CPU icache interrupt */
-    /* 14: reserved */
-    [15 ... 20] = true,
-    /* 21: reserved */
-    [22 ... 26] = true,
-    /* 27: reserved */
-    /* 28, 29: per-CPU CTI interrupts */
-    /* 30, 31: reserved */
-};
-
 /*
  * Create an alias region in @container of @size bytes starting at @base
  * which mirrors the memory starting at @orig.
@@ -663,7 +666,7 @@ static void armsse_init(Object *obj)
     }
     if (info->num_cpus > 1) {
         for (i = 0; i < ARRAY_SIZE(s->cpu_irq_splitter); i++) {
-            if (irq_is_common[i]) {
+            if (info->irq_is_common[i]) {
                 char *name = g_strdup_printf("cpu-irq-splitter%d", i);
                 SplitIRQ *splitter = &s->cpu_irq_splitter[i];
 
@@ -696,7 +699,7 @@ static qemu_irq armsse_get_common_irq_in(ARMSSE *s, int irqno)
     ARMSSEClass *asc = ARM_SSE_GET_CLASS(s);
     const ARMSSEInfo *info = asc->info;
 
-    assert(irq_is_common[irqno]);
+    assert(info->irq_is_common[irqno]);
 
     if (info->num_cpus == 1) {
         /* Only one CPU -- just connect directly to it */
@@ -878,7 +881,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     /* Wire up the splitters that connect common IRQs to all CPUs */
     if (info->num_cpus > 1) {
         for (i = 0; i < ARRAY_SIZE(s->cpu_irq_splitter); i++) {
-            if (irq_is_common[i]) {
+            if (info->irq_is_common[i]) {
                 Object *splitter = OBJECT(&s->cpu_irq_splitter[i]);
                 DeviceState *devs = DEVICE(splitter);
                 int cpunum;
-- 
2.20.1


