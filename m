Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44E43315A5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:15:43 +0100 (CET)
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKPu-0002SF-NL
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJl0-00072t-Rm
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:26 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkl-00076Z-00
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:26 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i9so16402wml.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DDSbQDL/L3ru6cleh08/WLnDS9XnQiEkjmymXTHld8I=;
 b=tE+K7KRb/EQ57M4tZApqj7CI2hdrMHQeTsrXChPmjdrQ0mvtMlIopzzfm8aaHWIK2q
 b9Hvg6KU9OT210j6wIpc0Qtx1aEbfkJtWR0s/+g33bBbuDHLEo1YTpzaPBye1LqPVTnv
 3Xs15gJYT6DfOheHbmIa4G3uAsbaCxeyxB9yDQKdfQ4/wj8vqn172dEG/K5cfC5/oGoP
 4E6M17mgkiNh1DDHTIO0Kc+slnAGSmzMQ05BLLHPKvV8imPRIojLlT9p970QeMssAPsX
 KNQstXsZnmQ+6keTiFOsyPnv8tkiKKVf8WX8SOBPhJtctanFM8e2ZB/d+hHYvi8W9tDg
 Ry0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DDSbQDL/L3ru6cleh08/WLnDS9XnQiEkjmymXTHld8I=;
 b=CAMpXFrCwM6+R13azM1cxvuBZmoi62ge4bYHX0/ovftW+76q2G8KCDtkQTyWZna58O
 eeJyofos1q4kPNcGzAc+5wU+bo4cTOER6Oe8uDZsuRJHhM/NUZkWczK1UtiJm4s1M+e2
 k0/kxpDAuhvcGyCk7V9jYcdoKiuGo70YW6rIaCacpYqCpelWwNeJjOZa9RUKESz7hrfV
 CAggrZSmU5+twxWWKqJ/x1M3I84w60OiboxXQ7o3ndohyyQQrohOPBoPtByuBqO7FhDq
 JW1cyCYKneA6JhcwkPtshiN2y39dXrBj8fkRBZ4txDMJnOQOE5LmorEQhqueT/AKIsOe
 3Vcg==
X-Gm-Message-State: AOAM532Rv8TkKTms2OJYhCX3deJcW8AR6bvQYuVIikTdBpBA6a5gyzv2
 hmkxqQoNKc/KcvRVKGb0LPuzC8tEQhA8XQ==
X-Google-Smtp-Source: ABdhPJwnQEu56ZnmWaE8jBTSAiYtJpcw9zYgAhLzqrLVGBlYbm+xDdA0JzHMDXyH04+pNvHyvUVydA==
X-Received: by 2002:a1c:a958:: with SMTP id s85mr22558126wme.138.1615224789677; 
 Mon, 08 Mar 2021 09:33:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/54] hw/arm/armsse: Indirect irq_is_common[] through
 ARMSSEInfo
Date: Mon,  8 Mar 2021 17:32:21 +0000
Message-Id: <20210308173244.20710-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219144617.4782-32-peter.maydell@linaro.org
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


