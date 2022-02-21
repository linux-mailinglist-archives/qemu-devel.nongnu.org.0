Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AFE4BD897
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:38:43 +0100 (CET)
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM59W-0008GE-OL
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:38:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zJ-0007wG-Uy
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:09 -0500
Received: from [2a00:1450:4864:20::334] (port=53769
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zG-0000zJ-SN
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:09 -0500
Received: by mail-wm1-x334.google.com with SMTP id n8so9111554wms.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TBtemdBkPo64I0n22RSwP5PjcdlU1O1SUJPKco0jPDg=;
 b=mq2RP9QDsyV20XWZ3VldAxUqmxJg4IWFTmVrR1/q9VtwFNwXYHCKjQvwBsL7PHycZ9
 xKhlufx09DtnEy1vi3GmXL12waUr1ACr/VBu0lMNKOu80kOK8aNah98EYIx768KyWUY6
 zGjvPDUoCyrZ1qz3WNosbV7FoJqfUs3a0U9wTE/BF7G/ls57ePFq5aa//djpKdAXt3pC
 5mwibDIIh7tvLzxEBJX4kyStLmBJGtB4asr2iO5aMTBIRkgEaGdnj0EQ+CREb7uV1T1u
 tmKhtuuskVrWdydos3zL2qgCB7DEo+e6d4JPhWWAFxJkbhYgt37thsEwYiL4F0Ltzb0J
 rwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TBtemdBkPo64I0n22RSwP5PjcdlU1O1SUJPKco0jPDg=;
 b=UWEOFrJJryU38+JZm/y4eP1BxKVp9Sa/at2V6pZhEFfKf48pYyg1gA7Bj6ePl5Xa3l
 9M6AJNpxMsD8hxd+vTPkFFWjruH/l4EacKy2/JNJbamzJtNc6PpeiF2XhpzY1mn7ZuhE
 KJ87uQONEZR0tmLk4aIYZz6MCeEpdEYeMYo2Wtjd5fsO3lD84e9FV43YES+CTX75IbZ/
 ABY0CczlNnSA1vM+E2zVu7AiPMTD+u7qeFswVMdmPcmsI9scB3WPrw3nyGc7JEFkeEis
 zcW09rUC2uznRvn45RlO1TlDL3xlUbMdt9zdpAIsIWaM1XnwsPV5dsXB12sE01W7upEu
 Vwsg==
X-Gm-Message-State: AOAM532FJl7ilMvdRXyAnocVksPgTD570PwCK8sIRpCC8H1G74S28HsR
 BizkbN+zgSLAI1tF0ukVg+DUev9xI4uXkA==
X-Google-Smtp-Source: ABdhPJxitTK1yrmjtH0S/yOhoaeXFOxOyDDeF8pyHP+l46TGn4lbh0ERkAhgM1Iq5lgCFOPitYk7qw==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr20889659wmq.139.1645435685088; 
 Mon, 21 Feb 2022 01:28:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/26] hvf: arm: Use macros for sysreg shift/masking
Date: Mon, 21 Feb 2022 09:27:37 +0000
Message-Id: <20220221092800.404870-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Alexander Graf <agraf@csgraf.de>

We are parsing the syndrome field for sysregs in multiple places across
the hvf code, but repeat shift/mask operations with hard coded constants
every time. This is an error prone approach and makes it harder to reason
about the correctness of these operations.

Let's introduce macros that allow us to unify the constants used as well
as create new helpers to extract fields from the sysreg value.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Cameron Esfahani <dirty@apple.com <mailto:dirty@apple.com>>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220209124135.69183-1-agraf@csgraf.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/hvf/hvf.c | 69 ++++++++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 22 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0dc96560d34..808c96da8cc 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -35,9 +35,34 @@
         ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
 #define PL1_WRITE_MASK 0x4
 
+#define SYSREG_OP0_SHIFT      20
+#define SYSREG_OP0_MASK       0x3
+#define SYSREG_OP0(sysreg)    ((sysreg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK)
+#define SYSREG_OP1_SHIFT      14
+#define SYSREG_OP1_MASK       0x7
+#define SYSREG_OP1(sysreg)    ((sysreg >> SYSREG_OP1_SHIFT) & SYSREG_OP1_MASK)
+#define SYSREG_CRN_SHIFT      10
+#define SYSREG_CRN_MASK       0xf
+#define SYSREG_CRN(sysreg)    ((sysreg >> SYSREG_CRN_SHIFT) & SYSREG_CRN_MASK)
+#define SYSREG_CRM_SHIFT      1
+#define SYSREG_CRM_MASK       0xf
+#define SYSREG_CRM(sysreg)    ((sysreg >> SYSREG_CRM_SHIFT) & SYSREG_CRM_MASK)
+#define SYSREG_OP2_SHIFT      17
+#define SYSREG_OP2_MASK       0x7
+#define SYSREG_OP2(sysreg)    ((sysreg >> SYSREG_OP2_SHIFT) & SYSREG_OP2_MASK)
+
 #define SYSREG(op0, op1, crn, crm, op2) \
-    ((op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (crm << 1))
-#define SYSREG_MASK           SYSREG(0x3, 0x7, 0xf, 0xf, 0x7)
+    ((op0 << SYSREG_OP0_SHIFT) | \
+     (op1 << SYSREG_OP1_SHIFT) | \
+     (crn << SYSREG_CRN_SHIFT) | \
+     (crm << SYSREG_CRM_SHIFT) | \
+     (op2 << SYSREG_OP2_SHIFT))
+#define SYSREG_MASK \
+    SYSREG(SYSREG_OP0_MASK, \
+           SYSREG_OP1_MASK, \
+           SYSREG_CRN_MASK, \
+           SYSREG_CRM_MASK, \
+           SYSREG_OP2_MASK)
 #define SYSREG_OSLAR_EL1      SYSREG(2, 0, 1, 0, 4)
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
@@ -783,21 +808,21 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_read(env->pc, reg,
-                                        (reg >> 20) & 0x3,
-                                        (reg >> 14) & 0x7,
-                                        (reg >> 10) & 0xf,
-                                        (reg >> 1) & 0xf,
-                                        (reg >> 17) & 0x7);
+                                        SYSREG_OP0(reg),
+                                        SYSREG_OP1(reg),
+                                        SYSREG_CRN(reg),
+                                        SYSREG_CRM(reg),
+                                        SYSREG_OP2(reg));
         hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
         return 1;
     }
 
     trace_hvf_sysreg_read(reg,
-                          (reg >> 20) & 0x3,
-                          (reg >> 14) & 0x7,
-                          (reg >> 10) & 0xf,
-                          (reg >> 1) & 0xf,
-                          (reg >> 17) & 0x7,
+                          SYSREG_OP0(reg),
+                          SYSREG_OP1(reg),
+                          SYSREG_CRN(reg),
+                          SYSREG_CRM(reg),
+                          SYSREG_OP2(reg),
                           val);
     hvf_set_reg(cpu, rt, val);
 
@@ -886,11 +911,11 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     CPUARMState *env = &arm_cpu->env;
 
     trace_hvf_sysreg_write(reg,
-                           (reg >> 20) & 0x3,
-                           (reg >> 14) & 0x7,
-                           (reg >> 10) & 0xf,
-                           (reg >> 1) & 0xf,
-                           (reg >> 17) & 0x7,
+                           SYSREG_OP0(reg),
+                           SYSREG_OP1(reg),
+                           SYSREG_CRN(reg),
+                           SYSREG_CRM(reg),
+                           SYSREG_OP2(reg),
                            val);
 
     switch (reg) {
@@ -960,11 +985,11 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_write(env->pc, reg,
-                                         (reg >> 20) & 0x3,
-                                         (reg >> 14) & 0x7,
-                                         (reg >> 10) & 0xf,
-                                         (reg >> 1) & 0xf,
-                                         (reg >> 17) & 0x7);
+                                         SYSREG_OP0(reg),
+                                         SYSREG_OP1(reg),
+                                         SYSREG_CRN(reg),
+                                         SYSREG_CRM(reg),
+                                         SYSREG_OP2(reg));
         hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
         return 1;
     }
-- 
2.25.1


