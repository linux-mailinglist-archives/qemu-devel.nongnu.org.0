Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5446649E2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:26:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHjt-0003xA-LA; Tue, 10 Jan 2023 11:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjs-0003wl-8U
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:40 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjq-00067h-Hj
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:40 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ja17so9272979wmb.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KPo282/uew3iuzImHfNxHuSGZYMfkFiyRCBHN2R+reg=;
 b=qrhy6Iw759H6bZICrx9tRM8mKmb8jMMnw3X84KMracRcoxgvKt+z+wJpSbexd1bLqU
 pLPDnLcFB93U4GKltHY5i2okbajMQhHKW1p3HrfHeyy87gl0zpI/TTn9NNHqZP/9DqgO
 Pul9nhnEEps5gNTZ34JSVxeo6q4Tas6hazG9DPuNGSAwQ5l0FnYsd8UTqg8exB6E4qzR
 KZxrX1nKP3jJS5mnI5oB1PiW27r7/h0KY61vneSxKMdR6QjOzcHmIN2sOe7FkTeRfvkX
 QVQm/hFCbEa+PoUBPXrZe3DJD06aMslLARl1dDIRCyPOgMRHEulXla+0PpQs4XgcwxR0
 y7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KPo282/uew3iuzImHfNxHuSGZYMfkFiyRCBHN2R+reg=;
 b=JxXD28Kw1aPoWIrWs1VTp6frH4dW0JkhZX/FClk3ZDIA44zTH3MqXOIm8NdQY/1cCQ
 QebJtI2y9Lw3KgZ5TQm5rFxsE7n1IQaI/YLUjQ5jtGweNC9Hn6Diz6gM9/Fc6M0PpT7L
 uJ46DhXwgO1ZZGd71IJPoBYxdJww+hUZF07sV2zPd6dTHMDD9PkVP/O6q8qCSsxz58i1
 ezeud9dxKd1yV4D8Lq80g3bMW9qalynBC2JpGkbHElCmA52ZFHl230ZEJxBn+YzMKj8o
 9aV2E4GINooLnZ6w7NpPR4X5z88xVvHnZwRkkZK3KPg9stoZ8yfWUl3DM2w3IBdlVpPL
 keMQ==
X-Gm-Message-State: AFqh2krCpfM+9BrCwJUYU83JiZIHIvwr4Nn0Hfv1e7qgKz1QE0nTnHp0
 TSqPlLKoRtpNKwhIHj4LyEcsNP9sE4e78Ecx
X-Google-Smtp-Source: AMrXdXt8S3GJKiZmzYyQyopJp1IgN21n6HZEifW+v2c7deRR5IBMdGg9bQebV+JCGVDr3lEV1HWbYg==
X-Received: by 2002:a05:600c:1f11:b0:3d0:57ea:319c with SMTP id
 bd17-20020a05600c1f1100b003d057ea319cmr49741887wmb.13.1673369077657; 
 Tue, 10 Jan 2023 08:44:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm26960870wmq.18.2023.01.10.08.44.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:44:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 05/18] target/arm: Move CPU QOM type definitions to
 "hw/arm/cpu.h"
Date: Tue, 10 Jan 2023 17:43:53 +0100
Message-Id: <20230110164406.94366-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Units including "target/arm/cpu.h" can't be built once via meson's
softmmu_ss[] source set. Since this header depends on specific
definitions such the word size (32 or 64-bit), for ARM such units
must go to the per-target arm_ss[].

We want to expose few architectural definitions to hardware models.

Start by exposing the ARM CPU QOM types to files under hw/
via the new "hw/arm/cpu.h" header. Doing so, less HW models
will require access to "target/arm/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/cpu.h | 28 ++++++++++++++++++++++++++++
 target/arm/cpu-qom.h | 13 +------------
 target/arm/cpu.h     |  8 ++++----
 3 files changed, 33 insertions(+), 16 deletions(-)
 create mode 100644 include/hw/arm/cpu.h

diff --git a/include/hw/arm/cpu.h b/include/hw/arm/cpu.h
new file mode 100644
index 0000000000..0c5d6ca2a8
--- /dev/null
+++ b/include/hw/arm/cpu.h
@@ -0,0 +1,28 @@
+/*
+ * ARM / Aarch64 CPU definitions
+ *
+ * This file contains architectural definitions consumed by hardware models
+ * implementations (files under hw/).
+ * Definitions not required to be exposed to hardware has to go in the
+ * architecture specific "target/arm/cpu.h" header.
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+#ifndef HW_ARM_CPU_H
+#define HW_ARM_CPU_H
+
+#include "hw/core/cpu.h"
+
+#define TYPE_ARM_CPU "arm-cpu"
+OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
+
+#define TYPE_AARCH64_CPU "aarch64-cpu"
+typedef struct AArch64CPUClass AArch64CPUClass;
+DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU, TYPE_AARCH64_CPU)
+
+#define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
+#define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
+
+#endif
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 514c22ced9..b98904b6bc 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -21,16 +21,11 @@
 #define QEMU_ARM_CPU_QOM_H
 
 #include "hw/core/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 struct arm_boot_info;
 
-#define TYPE_ARM_CPU "arm-cpu"
-
-OBJECT_DECLARE_CPU_TYPE(ARMCPU, ARMCPUClass, ARM_CPU)
-
-#define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
-
 typedef struct ARMCPUInfo {
     const char *name;
     void (*initfn)(Object *obj);
@@ -57,12 +52,6 @@ struct ARMCPUClass {
     ResettablePhases parent_phases;
 };
 
-
-#define TYPE_AARCH64_CPU "aarch64-cpu"
-typedef struct AArch64CPUClass AArch64CPUClass;
-DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU,
-                       TYPE_AARCH64_CPU)
-
 struct AArch64CPUClass {
     /*< private >*/
     ARMCPUClass parent_class;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..52ac99cad3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -17,8 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef ARM_CPU_H
-#define ARM_CPU_H
+#ifndef TARGET_ARM_CPU_H
+#define TARGET_ARM_CPU_H
 
 #include "kvm-consts.h"
 #include "qemu/cpu-float.h"
@@ -26,6 +26,7 @@
 #include "cpu-qom.h"
 #include "exec/cpu-defs.h"
 #include "qapi/qapi-types-common.h"
+#include "hw/arm/cpu.h"
 
 /* ARM processors have a weak memory model */
 #define TCG_GUEST_DEFAULT_MO      (0)
@@ -2853,11 +2854,10 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool kvm_sync);
 #define ARM_CPUID_TI915T      0x54029152
 #define ARM_CPUID_TI925T      0x54029252
 
-#define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
-#define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
 #define CPU_RESOLVING_TYPE TYPE_ARM_CPU
 
 #define TYPE_ARM_HOST_CPU "host-" TYPE_ARM_CPU
+#define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
 
 #define cpu_list arm_cpu_list
 
-- 
2.38.1


