Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B74517AE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:38:39 +0100 (CET)
Received: from localhost ([::1]:60870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkcX-0003yS-NZ
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:38:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkaT-0002G5-S7
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:36:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkaS-0002iT-9F
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:36:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637015787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gClzPd0+2kP2htrjZGgkgP6tGqZUPw4g8JDuUbcWpc=;
 b=SeJ0MPIQmQmeTlLZ26fw9dxOfutjge3Z2aKrxCe134X7uKEZfVVmBJppRGtUlTM2Zi/yvf
 uIIAZa5yYhYi06nAQQf47zXPNgv2HbXP8VbSRbZT3fMy6LaX9NhQWAd5laxuzfl75ysJH6
 pl+NsVQY6d7UsOOY6zz6EVFrKT4oNdY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-4tinQVeQPHO9T-LUv2-YoQ-1; Mon, 15 Nov 2021 17:36:26 -0500
X-MC-Unique: 4tinQVeQPHO9T-LUv2-YoQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so6523835wmg.9
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8gClzPd0+2kP2htrjZGgkgP6tGqZUPw4g8JDuUbcWpc=;
 b=RrA+2955JEs4WpVF1LIx5NIXt6WvZkIGdCm8JdTT595IZEtWZeVZMy59u+WRzA0HkO
 zrwPNezQb5gFU5UHYYoerqnEzhC4RCYe7/6snTPkznKe78I46e/+3xqHl8xnXMpD6Wjp
 /fP7FTJBrqw47Bab/j+U6bcmdJNQyuIqnuQ+WzPRrC0N+KgzA6WLE6naLkpGv4v6exNy
 cEPOtJkT6jlr84UYcrFVAlwf/bGyO8lngq2iou5MrrXbfMu0QJ42WGBzhiRQhRl4fj98
 ClsN9+p+41ywQEnVZnG6HnHRCX0Afou/JVI0p9uuq3dSR3Vnc1AIFQGqsNtqlMpZkQjp
 QYxw==
X-Gm-Message-State: AOAM533vn4DXowstwkPb3YrAp2jJYVjGaTEXLLhwLk97p8zN47B8L/3l
 LNRWlDJuTVwlwi4UznOqkDZ/nCb8QjhM+5gl8eQBGEdzR5K3FvBOqWleSNI9NTrJAITTDagoLKu
 EGa6zp3bpsd0gyvD0alhIPIniXm5gK7yO3BDb+mYvIAcwYBVvgJG+biufLn8btO4f
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr3282868wrp.226.1637015785282; 
 Mon, 15 Nov 2021 14:36:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDQIYc/IGwQr0byDchmqjf8igCIi9btwewQONhyppRXWu9+RZ8Zt4xfMghp3GPhppLuQaHAw==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr3282843wrp.226.1637015785054; 
 Mon, 15 Nov 2021 14:36:25 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 b197sm539935wmb.24.2021.11.15.14.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:36:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? 1/2] hw/intc/arm_gicv3: Extract gicv3_set_gicv3state
 from arm_gicv3_cpuif.c
Date: Mon, 15 Nov 2021 23:36:18 +0100
Message-Id: <20211115223619.2599282-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211115223619.2599282-1-philmd@redhat.com>
References: <20211115223619.2599282-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gicv3_set_gicv3state() is used by arm_gicv3_common.c in
arm_gicv3_common_realize(). Since we want to restrict
arm_gicv3_cpuif.c to TCG, extract gicv3_set_gicv3state()
to a new file. Add this file to the meson 'specific'
source set, since it needs access to "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/intc/arm_gicv3_cpuif.c        | 10 +---------
 hw/intc/arm_gicv3_cpuif_common.c | 22 ++++++++++++++++++++++
 hw/intc/meson.build              |  1 +
 3 files changed, 24 insertions(+), 9 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_cpuif_common.c

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 3fe5de8ad7d..5e539e3b5ef 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1,5 +1,5 @@
 /*
- * ARM Generic Interrupt Controller v3
+ * ARM Generic Interrupt Controller v3 (emulation)
  *
  * Copyright (c) 2016 Linaro Limited
  * Written by Peter Maydell
@@ -21,14 +21,6 @@
 #include "hw/irq.h"
 #include "cpu.h"
 
-void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s)
-{
-    ARMCPU *arm_cpu = ARM_CPU(cpu);
-    CPUARMState *env = &arm_cpu->env;
-
-    env->gicv3state = (void *)s;
-};
-
 static GICv3CPUState *icc_cs_from_env(CPUARMState *env)
 {
     return env->gicv3state;
diff --git a/hw/intc/arm_gicv3_cpuif_common.c b/hw/intc/arm_gicv3_cpuif_common.c
new file mode 100644
index 00000000000..ff1239f65db
--- /dev/null
+++ b/hw/intc/arm_gicv3_cpuif_common.c
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * ARM Generic Interrupt Controller v3
+ *
+ * Copyright (c) 2016 Linaro Limited
+ * Written by Peter Maydell
+ *
+ * This code is licensed under the GPL, version 2 or (at your option)
+ * any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "gicv3_internal.h"
+#include "cpu.h"
+
+void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+
+    env->gicv3state = (void *)s;
+};
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index c89d2ca180e..11352806db2 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -25,6 +25,7 @@
 
 specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
+specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
-- 
2.31.1


