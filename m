Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9527D55235B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:58:34 +0200 (CEST)
Received: from localhost ([::1]:55380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LfV-00069d-Ke
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZp-0005QH-M9
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:41 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:39489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZn-0001KZ-9V
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:41 -0400
Received: by mail-pf1-x42c.google.com with SMTP id p14so5192638pfh.6
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=viKLoyqhEy5uuARWIFm/MLLiPrBCa2bHnN3PYLnlpNM=;
 b=ntM9aoU+H9gscRilksmOPIALY4nehLFcZnJZ3P2COLMv7IcW7aiFe/5cZbEqE+ESDk
 YPKgSJFgV+ZwSrK93Iv0sVym5zdY/klSfYPTJXC1bWA1fK/RZ3CkfF8FvswZtKa4vpML
 KahqRlT9B0pptatVQ3u8OZr3RovqcRbq5/etbOrdvRRda0PmPRFjPgTFGynaOZboRsdB
 pxDHgAfpb+rteDHSlFRoPOcwdKZzNMOgoAhUNDaAIBjfHxGcNyMnVDFBid/dSLVL9rA6
 yyJqngtoriKtIdkGBwwCSESvVr+cvP/ll5qVeKkOM5eHR7U5rE2IL9I+ih1dItsPynxT
 8Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=viKLoyqhEy5uuARWIFm/MLLiPrBCa2bHnN3PYLnlpNM=;
 b=xcBnobDVW/BcSGV/F2JBKZXY5xxVVK0guY/ewZsh+ChwEoOI7G1wISHRUPAZoG/aTz
 lYGIYwBZ70F6fF9JXXP1T69wB49I/O8WYBjoBovRuNbP98Xr+o3WnnVux61+76VmWaCh
 2EjdRYiJ+sAoO6z3sG25NHAFqIJlLYhxMGsTvzHiLu3Jmk5iV63p7e26qAfNVmitcr3T
 f7gDOjTkEHoDNrI6nZBaodhJFeGtycmWXYIhk3Jf7AIZCPklPtMMCpS2IR2I7MsWEZF8
 XzF/B2iWdtHwpb9pY2+kfwr/FMa9ZIuVxNuiBExBsIdj2DddsBFZW0Tcvc1wwFQXJs6D
 uZAA==
X-Gm-Message-State: AJIora+cx+MpC5SMd2Agx1Nt8IDQSdH3YyYGHDRqpknHo68cfRXbwpAR
 1RE3BLbiYZp4n5JlzBunpDNcC42mcCf/Rg==
X-Google-Smtp-Source: AGRyM1tvJO1/n/z2jRGLbG2LlcOoWZ5EKgGXpSSu4+WPe+VPl8GUYLlqfVXsSAuwOH9axYONjDXnZA==
X-Received: by 2002:a63:f944:0:b0:3fd:4f29:67e9 with SMTP id
 q4-20020a63f944000000b003fd4f2967e9mr22228777pgk.593.1655747557916; 
 Mon, 20 Jun 2022 10:52:37 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 01/51] target/arm: Implement TPIDR2_EL0
Date: Mon, 20 Jun 2022 10:51:45 -0700
Message-Id: <20220620175235.60881-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This register is part of SME, but isn't closely related to the
rest of the extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index df677b2d5d..05d1e2e8dd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -474,6 +474,7 @@ typedef struct CPUArchState {
             };
             uint64_t tpidr_el[4];
         };
+        uint64_t tpidr2_el0;
         /* The secure banks of these registers don't map anywhere */
         uint64_t tpidrurw_s;
         uint64_t tpidrprw_s;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6457e6301c..d21ba7ab83 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6279,6 +6279,35 @@ static const ARMCPRegInfo zcr_reginfo[] = {
       .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
+#ifdef TARGET_AARCH64
+static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el == 0) {
+        uint64_t sctlr = arm_sctlr(env, el);
+        if (!(sctlr & SCTLR_EnTP2)) {
+            return CP_ACCESS_TRAP;
+        }
+    }
+    /* TODO: FEAT_FGT */
+    if (el < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ENTP2)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo sme_reginfo[] = {
+    { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
+      .access = PL0_RW, .accessfn = access_tpidr2,
+      .fieldoffset = offsetof(CPUARMState, cp15.tpidr2_el0) },
+};
+#endif /* TARGET_AARCH64 */
+
 void hw_watchpoint_update(ARMCPU *cpu, int n)
 {
     CPUARMState *env = &cpu->env;
@@ -8440,6 +8469,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
 #ifdef TARGET_AARCH64
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        define_arm_cp_regs(cpu, sme_reginfo);
+    }
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         define_arm_cp_regs(cpu, pauth_reginfo);
     }
-- 
2.34.1


