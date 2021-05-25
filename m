Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6175F390534
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 17:23:01 +0200 (CEST)
Received: from localhost ([::1]:58328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYtX-0003jZ-Qx
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 11:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYb1-0002LQ-4Z
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:51 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llYay-0004E0-0E
 for qemu-devel@nongnu.org; Tue, 25 May 2021 11:03:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id x8so32601461wrq.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8q6HuLDwiBPYqvjP1CtfYs3DR8dqNLzRhvp3X/wuZ3M=;
 b=CneihwJrNn0sOFVNRy7W+ZGqQpXwus43Q9hEcl5nIg4ID5mnJSfNOpVIl7Y19VVx14
 hFIrDxcjbffpFiRPYmBU+9dgtMQC9wdPwwESar1DeZHaOPClhOJoIaIK5nxQa/nQc463
 2SNXRCQMY5bZX8WKPLuLlCp18LoyPavJQ9dYJ3e2nlGi1Nfk4fFxcYFhK5TwME41EJBb
 5GZl3QC/9oG3IV0takVbrnwxINHNIG30GBtmcV8qCo8KiNMfy3tr5XrndswdA7xjMbR8
 GoEaA5MLmhjVkQbBUxI6KmSmgr534Y7XtpNVaG+XOfRTyP4MlY7P2gDvpHcOyopNP+0x
 89ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8q6HuLDwiBPYqvjP1CtfYs3DR8dqNLzRhvp3X/wuZ3M=;
 b=c8ISsArSpx8VpKuiZ3eFBmQxvi2x4KNBHaKeO0F2Zpf8mFU6PzRjYcn2wQ6QIIzrRC
 6n5OYwlEcKai61KUuWSsVwEP0arDBEE6trPiGomWs5zPqmD0riw4HLf5+jAePusEP9K9
 fqvMCeUo+ho28m1+fIvKUhWgDr674lm9hugn7H7E1r6vaSHTna5g7tdTRHyjBnHtXfOj
 x+y3BWqoCtrBJEX8L+WViDLY5cjfU/85Xg0ZwBRufPUagbsbQzHTlDws1jbXP7tTrz/e
 D4BnhFO4OewRISnCj9wb7jJu9TadCog4m9WKofrzPCsD3x8QE7QJOG+iD84lu0jbTkX5
 iDgw==
X-Gm-Message-State: AOAM531xChrTM12G2HX2FnHTClczZnaPneWl3aTeaK2ooA3qNUa5HsHd
 9GXIQgnLAniCBHopRes7ff/q6OJ6n8sBw6f3
X-Google-Smtp-Source: ABdhPJyczcL8SPlmWKN2aYKRvF6hC0iLXSs+Wrv71qWQFfKUcNBganjzFE4qlQUmlvhDMBnz5zo57A==
X-Received: by 2002:adf:e109:: with SMTP id t9mr2947162wrz.372.1621955026632; 
 Tue, 25 May 2021 08:03:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q62sm11710284wma.42.2021.05.25.08.03.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 08:03:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 020/114] target/arm: Add support for FEAT_TLBIOS
Date: Tue, 25 May 2021 16:01:50 +0100
Message-Id: <20210525150324.32370-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525150324.32370-1-peter.maydell@linaro.org>
References: <20210525150324.32370-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Rebecca Cran <rebecca@nuviainc.com>

ARMv8.4 adds the mandatory FEAT_TLBIOS. It provides TLBI
maintenance instructions that extend to the Outer Shareable domain.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210512182337.18563-3-rebecca@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5802798c306..7986a217acd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4076,6 +4076,11 @@ static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
 }
 
+static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) != 0;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4adb017f81a..59e9847133a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7198,6 +7198,46 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+static const ARMCPRegInfo tlbios_reginfo[] = {
+    { .name = "TLBI_VMALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_ASIDE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 8, .crm = 1, .opc2 = 2,
+      .access = PL1_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_vmalle1is_write },
+    { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle2is_write },
+   { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
+      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle1is_write },
+    { .name = "TLBI_IPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 0,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2E1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 3,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_IPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 4,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_RIPAS2LE1OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 7,
+      .access = PL2_W, .type = ARM_CP_NOP },
+    { .name = "TLBI_ALLE3OS", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 1, .opc2 = 0,
+      .access = PL3_W, .type = ARM_CP_NO_RAW,
+      .writefn = tlbi_aa64_alle3is_write },
+    REGINFO_SENTINEL
+};
+
 static uint64_t rndr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     Error *err = NULL;
@@ -8570,6 +8610,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_tlbirange, cpu)) {
         define_arm_cp_regs(cpu, tlbirange_reginfo);
     }
+    if (cpu_isar_feature(aa64_tlbios, cpu)) {
+        define_arm_cp_regs(cpu, tlbios_reginfo);
+    }
 #ifndef CONFIG_USER_ONLY
     /* Data Cache clean instructions up to PoP */
     if (cpu_isar_feature(aa64_dcpop, cpu)) {
-- 
2.20.1


