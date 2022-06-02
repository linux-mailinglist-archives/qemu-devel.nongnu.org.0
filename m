Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D739B53C0A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:12:48 +0200 (CEST)
Received: from localhost ([::1]:40862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwt3f-0007Sl-T6
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgt-0004mS-NO
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:16 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgr-0008Vf-Gt
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:15 -0400
Received: by mail-pg1-x536.google.com with SMTP id u4so2827460pgk.11
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FoWoKSqjjh68VSQj0A5P4qFwMda5yvhWWmestbQu+sY=;
 b=K07nzk3fzt1RoU69tILYMc49hbNKsxvDIX6uWYKwRhtbi7XidF+KFHASCiq1hwRB8i
 Pcp1fi5i7qg7gFwxCDM7RIxo4MsoE/fgJIb8LslwIpFCXs42Jjt716eBgYku7Pj3LCyN
 FnVXLpoae8+JBW1zz2gbOc6mYJye+TqKY2lewxHbUTo9e7d4U6lX62eX6TtmboS4mt42
 yRLuLFe6xL1H6ILqfAWyWVGapgs9aqN2Wb3qfOuuLh0BIaDt9l9fOcVfrtjZbtHJ8ddU
 tjgScKaf15k3c0yLwlC8qOUWuGIeFv3oxY57qHM8+jIhKDE+NFjCtHfqtqTXCL+E6k5W
 d+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FoWoKSqjjh68VSQj0A5P4qFwMda5yvhWWmestbQu+sY=;
 b=x8rqwTcz5+puW+j7y/3kNqRQp9eOm6hUgvWcYUq8C7P2sSNZkXbQUqqHh96TaftaAP
 jALwKHpzfYO4rwdFINBc4QXSlz9P0BnYy/+iSB9pg+VtoLvRT37HOmL5L/Of+hkqpjxi
 z68W6zVm+jpUS/QtD6xq6umGn+8HRPfXvSw0gplIjflBSLOX5MvvEaXRSgpISFukfK6g
 g4NV58lP6IyO4wIvuHLrGOocr+b4gSurx+qSM3eXHqTHrdujnGByDdog+jAGAy19Zyfs
 nfF+ntb9FE40BPEfb0UqWRtKxmjBs8HK/PPP6mxEa3X/I9gmXNHRKAms8v5htqw+Olyz
 Jjcw==
X-Gm-Message-State: AOAM532+oPSYcrRBnVs/dfwzCONSyHDpKo4A/MUVZDHn6ZSkYRmDBlPL
 WATHHgVhkLBp4duUnDBvcHszC6KjAjIMnA==
X-Google-Smtp-Source: ABdhPJy0dMvA0BDpQkdlWJRaHvF0YvaN8IZi4aekeJfS/S9mwIxMaowxGbWkeRlXiUBKsXciONU5CQ==
X-Received: by 2002:a05:6a00:2403:b0:4fd:e84a:4563 with SMTP id
 z3-20020a056a00240300b004fde84a4563mr7201469pfh.60.1654206552747; 
 Thu, 02 Jun 2022 14:49:12 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 21/71] target/arm: Implement TPIDR2_EL0
Date: Thu,  2 Jun 2022 14:48:03 -0700
Message-Id: <20220602214853.496211-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  1 +
 target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 24c5266f35..245d144fa1 100644
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
index 48534db0bd..204c5cf849 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6283,6 +6283,35 @@ static const ARMCPRegInfo zcr_reginfo[] = {
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
+            uint64_t hcr = arm_hcr_el2_eff(env);
+            return hcr & HCR_TGE ? CP_ACCESS_TRAP_EL2 : CP_ACCESS_TRAP;
+        }
+    }
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
@@ -8444,6 +8473,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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


