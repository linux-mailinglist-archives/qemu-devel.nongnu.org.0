Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F752D59D0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 12:56:45 +0100 (CET)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKYu-000087-DK
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 06:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQm-0001M7-O1
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:22 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knKQb-00070E-1e
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:48:20 -0500
Received: by mail-wm1-x336.google.com with SMTP id d3so4379571wmb.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 03:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pxyeVdBMn1RtIRNelqoqiHzeaVL19d3HeWFjF4ofw4A=;
 b=oDnfCRToJlhpebEZYC2xhvVZyXvYZKHlsSwPXE5DhVayLKZ4FPW1xtTHA18jxiKAgV
 8h4Ku87l6k1uKT6eKKpB0tKJl3d+1Kqxyby4E1J5c7fCuPPP5wz807+ePwFNrNQiIVsH
 dqDJnAOyReL7rCEyAisCUPoma4aUKSuuwjRBlwf+uLwo0dRBw7XFuHF2bDLEeUWHtw3A
 aH8TY/VX5bEoAIBYgzq5dCkNE6a6wedXnr2+YgxJ5woZu5ZMelp2hDU6GRIh7q/ssLvE
 mwirZy4/EqFeyTG/0+6UyZZBtBtCHEojNRs7Qsrcj81jQg91PEyy/5CQrQfr+UZwFpPS
 8MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pxyeVdBMn1RtIRNelqoqiHzeaVL19d3HeWFjF4ofw4A=;
 b=eo92Wb/8pHg+uBgpLai4I9XQkIOET75VdoXMSwKFnN47KGCHzLWfjTj+paB4w/SGef
 HtMuULVf/lV6HM13t86lUA966tJa6JqMfpclmW8VuLqEGzyO+BquLfK9ey0DuTG10OGU
 mGxYuNZhvHACp5jKxNp/9+zr7+qVnK2XsA/X9uBhgwPf1jOZu0u3BlN39bs1hUD7DBvr
 KGRvi8UL7nLIFSPYv71h2KJS4I7eBxY1Fju2PF2wBhv1uRLoHwvQ4WTnuJ+eMeVQP1a5
 0rfvG3tDeRdb09OiNpRoPoSxnNGtRprq8z/JuAVxYMkSYa5B+9XUh8eJuA0Gvo+mrmyx
 Tkfw==
X-Gm-Message-State: AOAM532BXMzUoAeLJHPtwnYw3tx6zCrpXJknVIv1eHjxoJdJQd1jTa4Z
 t49cPCLmz4SGAaSYQ6J6MOx2UVFaGANpMw==
X-Google-Smtp-Source: ABdhPJxmmPy2YIWCBS4pIyzKK5ikie/qQevts4WtGABqo7WgZ1J+CcfVeo4cHJlVNmY86gL6+qchAw==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr7766467wmi.179.1607600886559; 
 Thu, 10 Dec 2020 03:48:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g192sm9304725wme.48.2020.12.10.03.48.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 03:48:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/36] sbsa-ref: allow to use Cortex-A53/57/72 cpus
Date: Thu, 10 Dec 2020 11:47:26 +0000
Message-Id: <20201210114756.16501-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210114756.16501-1-peter.maydell@linaro.org>
References: <20201210114756.16501-1-peter.maydell@linaro.org>
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

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Trusted Firmware now supports A72 on sbsa-ref by default [1] so enable
it for QEMU as well. A53 was already enabled there.

1. https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7117

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201120141705.246690-1-marcin.juszkiewicz@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 7d9e180c0db..4a5ea42938a 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -143,6 +143,24 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_GWDT] = 16,
 };
 
+static const char * const valid_cpus[] = {
+    ARM_CPU_TYPE_NAME("cortex-a53"),
+    ARM_CPU_TYPE_NAME("cortex-a57"),
+    ARM_CPU_TYPE_NAME("cortex-a72"),
+};
+
+static bool cpu_type_valid(const char *cpu)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
+        if (strcmp(cpu, valid_cpus[i]) == 0) {
+            return true;
+        }
+    }
+    return false;
+}
+
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
 {
     uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
@@ -649,9 +667,8 @@ static void sbsa_ref_init(MachineState *machine)
     const CPUArchIdList *possible_cpus;
     int n, sbsa_max_cpus;
 
-    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
-        error_report("sbsa-ref: CPU type other than the built-in "
-                     "cortex-a57 not supported");
+    if (!cpu_type_valid(machine->cpu_type)) {
+        error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
         exit(1);
     }
 
-- 
2.20.1


