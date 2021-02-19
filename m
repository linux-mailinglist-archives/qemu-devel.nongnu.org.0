Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DDE31FB8F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:02:18 +0100 (CET)
Received: from localhost ([::1]:41554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7IP-0002vK-H6
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73c-0002Ss-Pq
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:01 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73G-0003Xh-Ay
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:00 -0500
Received: by mail-wm1-x32c.google.com with SMTP id x4so7881888wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=B93kEzuBtL1t+F0ap6ZkJU+6zXhaZkvFeOMgU9Fv5ag=;
 b=xb5RXO32LLtcLp2ZEaEbv/H84UjoXc+9YGP8Wg4Boe7sysDABcpWkBcaxFxavQNHa8
 9W/z+Cx8krcm+CYAlkw3kCBKw/P08a3gMipD2IP2rHG/ryHIwJZm3gXlJN4KXKYMMKjm
 7G9SURptTyPW70FgZrRZIuHyDcg0zQ6AUuK4gikR1V1ileJfGMdvkrUtEaYP3SMadS8o
 KAFeEM367pKOJJRfSXAb96HbSQyem9sl7xr6EE1+b24OjRJgdAwlZ6awGPVImVqL0ehV
 VoHUPB6hYEC0SCsYIhDD5J0Ar1YrFHHS2DOLZpBbdrNabJ6MQc/YlUWVCMKvFzko8wZy
 Bn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B93kEzuBtL1t+F0ap6ZkJU+6zXhaZkvFeOMgU9Fv5ag=;
 b=gku88wyzSk4bD/3fYYyRT46JvmIdDRr0hg9zbAvL0gAR12a2rHaf1cFtpnlOq9vyfc
 xWqfzfLDQVQCNZ2RhwDaSIUvph5YXld3pOGQMGpNyTu9PGA0CRpqwbb6paL36buI1MDx
 oJnvQlRbOmERD38Dehs4YdUA7tQpv0Zi77vmFQjzeuH8yragUpNfJXmfBg6IoBUoC7oD
 p7C+h2RasZUu5kdd6gxegubezEj/g7ss7NqLcb9MJ+pzHaOmx0XqIIb5OgIbGERyI36t
 WnThJdfvQUnLzSqtmKUISDNiw3ga7hpkytkuIzrxAnqlmtK5xGT82Tfr4ZC+DrRAiHRB
 7Hdw==
X-Gm-Message-State: AOAM532tnVToYeowsdTzYP6gevXjpisXlCFm41euOPM8gQTECdqHtjU5
 9ExtEZzA8sFHX4N+5Lvbat5agg==
X-Google-Smtp-Source: ABdhPJzkgr2kNg7zD+cSuygfAulozV3frunF55BSVsM5mL0wI6n39r3i9cOjD/QMDBunMQvE4ZL4dA==
X-Received: by 2002:a1c:41d6:: with SMTP id o205mr8230867wma.80.1613745996892; 
 Fri, 19 Feb 2021 06:46:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 22/44] hw/arm/armsse: Add a define for number of IRQs used by
 the SSE itself
Date: Fri, 19 Feb 2021 14:45:55 +0000
Message-Id: <20210219144617.4782-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
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

The SSE uses 32 interrupts for its own devices, and then passes through
its expansion IRQ inputs to the CPU's interrupts 33 and upward.
Add a define for the number of IRQs the SSE uses for itself, instead
of hardcoding 32.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h | 5 ++++-
 hw/arm/armsse.c         | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 771150b0a94..e34263fed8b 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -145,6 +145,9 @@ OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
 #define RAM3_PPU 6
 #define NUM_PPUS 7
 
+/* Number of CPU IRQs used by the SSE itself */
+#define NUM_SSE_IRQS 32
+
 struct ARMSSE {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -165,7 +168,7 @@ struct ARMSSE {
     qemu_or_irq mpc_irq_orgate;
     qemu_or_irq nmi_orgate;
 
-    SplitIRQ cpu_irq_splitter[32];
+    SplitIRQ cpu_irq_splitter[NUM_SSE_IRQS];
 
     CMSDKAPBDualTimer dualtimer;
 
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 2b25fca1ca2..5ae6ce344ee 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -531,7 +531,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         int j;
         char *gpioname;
 
-        qdev_prop_set_uint32(cpudev, "num-irq", s->exp_numirq + 32);
+        qdev_prop_set_uint32(cpudev, "num-irq", s->exp_numirq + NUM_SSE_IRQS);
         /*
          * In real hardware the initial Secure VTOR is set from the INITSVTOR*
          * registers in the IoT Kit System Control Register block. In QEMU
@@ -602,7 +602,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         /* Connect EXP_IRQ/EXP_CPUn_IRQ GPIOs to the NVIC's lines 32 and up */
         s->exp_irqs[i] = g_new(qemu_irq, s->exp_numirq);
         for (j = 0; j < s->exp_numirq; j++) {
-            s->exp_irqs[i][j] = qdev_get_gpio_in(cpudev, j + 32);
+            s->exp_irqs[i][j] = qdev_get_gpio_in(cpudev, j + NUM_SSE_IRQS);
         }
         if (i == 0) {
             gpioname = g_strdup("EXP_IRQ");
-- 
2.20.1


