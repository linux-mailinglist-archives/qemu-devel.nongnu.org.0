Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E047579F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:18:52 +0100 (CET)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSJ9-0006qS-1B
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:18:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiY-0006k6-5d
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:02 -0500
Received: from [2a00:1450:4864:20::42a] (port=43843
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiS-0008Q1-6y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:01 -0500
Received: by mail-wr1-x42a.google.com with SMTP id v11so37332326wrw.10
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=fqhgJq2CB3BEUpVjd/zJhy6cguqz09ikl8mo+0Dzrp4=;
 b=Fgtm/atD6qWBuwLPO9HOW6ZV+SugxwkDRv3s+AEj3RPo3jZ6SUTPr92CVuP5hacDlJ
 1N1PCu+/5+BQ/rI6V2LpwQj6KMG4cF6KNcOc0qTHs5QTiskw9IhZvNvc8VtW9AZvWS97
 PPQ25hpk4PM42inmFKhWPVrdoeYGhDxgxlYd8Q5ydDnK397LaPQQctU9uZQlB6PLtcAS
 3Bc6xwGtaYE9r9zkrnB3nsizzidJ4gGCAn6JaSXQpgffMA9xnL8Pg6l0N0HM6b2VVpkW
 9fl+Wg2NoEKnGXigMCO0zDkWB8zD41oA+aZWNJrHKI2Dk8Dch8yQNYESF+JkkEQqK77x
 clIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fqhgJq2CB3BEUpVjd/zJhy6cguqz09ikl8mo+0Dzrp4=;
 b=mx17ElXoWfRH28uH2Jaz5JR89k9KEGmLzptts5628y2WLiP6JFileRFkMjpRSUmrAv
 0lJYa75nUbfqYKvAxsdmTG9G0brnSSBgJqYz2CN9x7kggu04gw0J+Kuoo9ysmb3ThaDr
 uGYlhDyAfZACMmQ4WhUBBYHcVaibXphBBLyNe0RvgW5WNc6oxTgIuFxF5cKFseXYv2TZ
 4QAaFTm+wV93Slq5ME1NjKdfwX2aflbhQ5WQV3us4gJ+T6YZBy1IQw7yNIx0OIRXMDZF
 rFCLSMb8NpN88xvA4U9FGCXQORd8CiQDjbW5l3m07jPblDqyp5qA3q2aIwUAc55sxxRf
 IPSA==
X-Gm-Message-State: AOAM531RRfHoQukoigHZTMwrXbV+EcEyQQ87F/QsbwJ7g2Mp+V0SK52C
 MvqI5KVUhBXdYgD47NQyXnSMd3JoSRibcw==
X-Google-Smtp-Source: ABdhPJyjuzyh4crAkuE2Trwa+PtZQTSInV8OLaYoJcF5azibFV5f/uD9E1Rguw/nOGoWUF124Ohsfg==
X-Received: by 2002:a5d:52c3:: with SMTP id r3mr3898222wrv.115.1639564854908; 
 Wed, 15 Dec 2021 02:40:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/33] hw/intc/arm_gicv3: Extract gicv3_set_gicv3state from
 arm_gicv3_cpuif.c
Date: Wed, 15 Dec 2021 10:40:23 +0000
Message-Id: <20211215104049.2030475-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

gicv3_set_gicv3state() is used by arm_gicv3_common.c in
arm_gicv3_common_realize(). Since we want to restrict
arm_gicv3_cpuif.c to TCG, extract gicv3_set_gicv3state()
to a new file. Add this file to the meson 'specific'
source set, since it needs access to "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20211115223619.2599282-2-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c        | 10 +---------
 hw/intc/arm_gicv3_cpuif_common.c | 22 ++++++++++++++++++++++
 hw/intc/meson.build              |  1 +
 3 files changed, 24 insertions(+), 9 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_cpuif_common.c

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 85fc369e550..d7e03d0cab8 100644
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
@@ -25,6 +25,7 @@ softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-in
 
 specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
+specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
-- 
2.25.1


