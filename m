Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D0411796
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 16:51:38 +0200 (CEST)
Received: from localhost ([::1]:60908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSKdt-0000jY-2o
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 10:51:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9U-0002jn-CT
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSK9F-0000na-0Q
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 10:20:11 -0400
Received: by mail-wr1-x432.google.com with SMTP id g16so30209229wrb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 07:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ElpkO5lvR+fOZJJ49bbotftILklqiS7p06HuORoOP0w=;
 b=YtyZ8FqrH/JAWdvPdtq3pClCqdIv6TwmHl23w/x2IOHnU+7sxSv0W+eG87gglazcZW
 cYltuEpO36IWRtnNop1n45tWkKWQGr15fcQPXHNXQtL4IA03dGByJxmvbXCZKAFe3l+u
 /E420YM8r2w8qaZr8ei42QenqSYJPpzK8hCq7lrtmeYzzo6b6gTcoYwJ2m7yQfDCsTXh
 XzrGsmKMbB5QPQgz1qs0v6L64J/x8QdMDUHEQ3lBItX1rf5iPXwdA6m3j6S8Zpqf8k1i
 FZPMWb2hvV/UuFDsez3Qwnj+MFu4gL9ZvLQWolLcf4pT/8eoTRb8rHPRa+6fvu+XqOed
 sxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ElpkO5lvR+fOZJJ49bbotftILklqiS7p06HuORoOP0w=;
 b=oeii1XBxXCx9tTqphElMRXxtqt8bcd9gXTP8uNoHSK4HD9LZjsBpnf082rk/AEGhLg
 jAUye4HKjQ28MNeOTAmhIsIK18zZCZ8PXcWrT+m/k0DUienVccREnhg/yrqmkqqCphCm
 LF+06oofj/Ktby+xp+kfwDfb9vSO5kaAtu/W2cUkUFsyniksYc6wy4MtB6j3s2ynLUeU
 fdvpLLguckXkETjCaDpySbFcrt37MzOHJSN0+X23xjbHyQHmjFSS4CXNjimw70I8ut+l
 kD9G7xQZcwTj36Cx03AZ7DdE/aX9batP/pOAqmU6JMlKvJBTMgzw48MoS/McGwrrQukm
 Pv8g==
X-Gm-Message-State: AOAM533g01Mqhs/+muwvVCnwjrcpB7CacZUFkZz4wgME3nP85yoWUhAB
 UnFNT+fydZEzRqm/BfXqGBUI7i0f1ALc0g==
X-Google-Smtp-Source: ABdhPJwB/fjFmKsYAxbsVUM4xjGbTQTPb3FreOtGrV5F3JI3SivWhVocAKtUr9KluQTTmDYHG3Yjow==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr29510275wmr.157.1632147594375; 
 Mon, 20 Sep 2021 07:19:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n17sm16229693wrp.17.2021.09.20.07.19.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:19:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/27] arm: Move PMC register definitions to internals.h
Date: Mon, 20 Sep 2021 15:19:27 +0100
Message-Id: <20210920141947.5537-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920141947.5537-1-peter.maydell@linaro.org>
References: <20210920141947.5537-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

From: Alexander Graf <agraf@csgraf.de>

We will need PMC register definitions in accel specific code later.
Move all constant definitions to common arm headers so we can reuse
them.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210916155404.86958-2-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 44 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper.c    | 44 ------------------------------------------
 2 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index cd2ea8a3883..777f9687648 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1226,4 +1226,48 @@ enum MVEECIState {
     /* All other values reserved */
 };
 
+/* Definitions for the PMU registers */
+#define PMCRN_MASK  0xf800
+#define PMCRN_SHIFT 11
+#define PMCRLC  0x40
+#define PMCRDP  0x20
+#define PMCRX   0x10
+#define PMCRD   0x8
+#define PMCRC   0x4
+#define PMCRP   0x2
+#define PMCRE   0x1
+/*
+ * Mask of PMCR bits writeable by guest (not including WO bits like C, P,
+ * which can be written as 1 to trigger behaviour but which stay RAZ).
+ */
+#define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
+
+#define PMXEVTYPER_P          0x80000000
+#define PMXEVTYPER_U          0x40000000
+#define PMXEVTYPER_NSK        0x20000000
+#define PMXEVTYPER_NSU        0x10000000
+#define PMXEVTYPER_NSH        0x08000000
+#define PMXEVTYPER_M          0x04000000
+#define PMXEVTYPER_MT         0x02000000
+#define PMXEVTYPER_EVTCOUNT   0x0000ffff
+#define PMXEVTYPER_MASK       (PMXEVTYPER_P | PMXEVTYPER_U | PMXEVTYPER_NSK | \
+                               PMXEVTYPER_NSU | PMXEVTYPER_NSH | \
+                               PMXEVTYPER_M | PMXEVTYPER_MT | \
+                               PMXEVTYPER_EVTCOUNT)
+
+#define PMCCFILTR             0xf8000000
+#define PMCCFILTR_M           PMXEVTYPER_M
+#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
+
+static inline uint32_t pmu_num_counters(CPUARMState *env)
+{
+  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
+}
+
+/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
+static inline uint64_t pmu_counter_mask(CPUARMState *env)
+{
+  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
+}
+
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b210da2bc26..21ee94ec2e7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1114,50 +1114,6 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
-/* Definitions for the PMU registers */
-#define PMCRN_MASK  0xf800
-#define PMCRN_SHIFT 11
-#define PMCRLC  0x40
-#define PMCRDP  0x20
-#define PMCRX   0x10
-#define PMCRD   0x8
-#define PMCRC   0x4
-#define PMCRP   0x2
-#define PMCRE   0x1
-/*
- * Mask of PMCR bits writeable by guest (not including WO bits like C, P,
- * which can be written as 1 to trigger behaviour but which stay RAZ).
- */
-#define PMCR_WRITEABLE_MASK (PMCRLC | PMCRDP | PMCRX | PMCRD | PMCRE)
-
-#define PMXEVTYPER_P          0x80000000
-#define PMXEVTYPER_U          0x40000000
-#define PMXEVTYPER_NSK        0x20000000
-#define PMXEVTYPER_NSU        0x10000000
-#define PMXEVTYPER_NSH        0x08000000
-#define PMXEVTYPER_M          0x04000000
-#define PMXEVTYPER_MT         0x02000000
-#define PMXEVTYPER_EVTCOUNT   0x0000ffff
-#define PMXEVTYPER_MASK       (PMXEVTYPER_P | PMXEVTYPER_U | PMXEVTYPER_NSK | \
-                               PMXEVTYPER_NSU | PMXEVTYPER_NSH | \
-                               PMXEVTYPER_M | PMXEVTYPER_MT | \
-                               PMXEVTYPER_EVTCOUNT)
-
-#define PMCCFILTR             0xf8000000
-#define PMCCFILTR_M           PMXEVTYPER_M
-#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
-
-static inline uint32_t pmu_num_counters(CPUARMState *env)
-{
-  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
-}
-
-/* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
-static inline uint64_t pmu_counter_mask(CPUARMState *env)
-{
-  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
-}
-
 typedef struct pm_event {
     uint16_t number; /* PMEVTYPER.evtCount is 16 bits wide */
     /* If the event is supported on this CPU (used to generate PMCEID[01]) */
-- 
2.20.1


