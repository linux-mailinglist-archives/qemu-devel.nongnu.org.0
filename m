Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F025067ECE5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSx6-000112-FF; Fri, 27 Jan 2023 12:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSws-0000pq-4W
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:39 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-000621-KQ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m14so5215116wrg.13
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iF+XnzXxIdoIOVWUXm151S75FZ1U3b2WbRcq9mQFjz4=;
 b=tVZRmm2sOCW1xoedfHl6DreNyUxX7KcRRD5Mna9saMr4gd0TT+N8Bs0yZDqBae8r+7
 L35jnD8J8XcXgrB7vDnJwDe/to4ud2kdPCF4RG/+1bChh+rGbjnE8RGu034878dhg+Lh
 0ulsgOalqYXEFGu7sOwD5Udmz6NTrdbBSaUAVBPoPo+vka1cedxvf/4A15Qjao+EZNBL
 rBxX2IqG2tF+CXKV4YmQOhr//uukvfI1aHiPqmGJNYkYAWyYZYmAl7kc758eV+4z5gDU
 wmqmB3S8y+lQKYtGPHAyYYgvCf1IdRR3U5QAwln/WcXW4oge53QWy6wGdUj+E6of5OTv
 K51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iF+XnzXxIdoIOVWUXm151S75FZ1U3b2WbRcq9mQFjz4=;
 b=wVX/ePfyyBZxcWobrcTNZIhSQ0qyv+Qalrpsk7UwrT7/ku6t9M6kwtLec8gtqYHUIC
 +aNyP4GExwEHabXZ2KpkBcQHxnfFKns1heT801ot8LofxC+TzQbr8zqHDV4cfcPN1qQ/
 Wr8fYZu+D7jjL12D+AMJTcZf5lzwqLzhl4gf2pIRcEYtL8uBx+H8PFircesxHGUouJlS
 rAyiEQU5gzINFNln2w8b3HTWZJmWCk9XgZSrjvqvVYj8QLiKrgdX0n9NhDXZdw+dtCha
 ssjuLZgC2AqAcISAuETwoYWDsIpcoT5hvmAbu9hWw6MgQua+9oyCUTqWKkQkgoYZZCm8
 mnlQ==
X-Gm-Message-State: AO0yUKV56diHmiSLy0rry63hlqUHLWZXXG/w/O7mjRgdrIUGOzSYq1zP
 XGwpn5i9+h1yudQCXgAD26jV/ruCStwRYpGD
X-Google-Smtp-Source: AK7set/1pNv0cRM4nhAAh/SxAOakO186DXmd5Q9CSnnf7XpBfR4lOxr1lSBwOVqiFGfWwtBuVwSE0A==
X-Received: by 2002:adf:facb:0:b0:2bf:b746:6224 with SMTP id
 a11-20020adffacb000000b002bfb7466224mr9374845wrs.0.1674842123086; 
 Fri, 27 Jan 2023 09:55:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/23] target/arm: Mark up sysregs for HFGRTR bits 24..35
Date: Fri, 27 Jan 2023 17:54:56 +0000
Message-Id: <20230127175507.2895013-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

Mark up the sysreg definitions for the registers trapped
by HFGRTR/HFGWTR bits 24..35.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h | 12 ++++++++++++
 target/arm/helper.c | 14 ++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 67d87ae8bf5..1b219242d5d 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -603,6 +603,18 @@ typedef enum FGTBit {
     DO_BIT(HFGRTR, LORID_EL1),
     DO_BIT(HFGRTR, LORN_EL1),
     DO_BIT(HFGRTR, LORSA_EL1),
+    DO_BIT(HFGRTR, MAIR_EL1),
+    DO_BIT(HFGRTR, MIDR_EL1),
+    DO_BIT(HFGRTR, MPIDR_EL1),
+    DO_BIT(HFGRTR, PAR_EL1),
+    DO_BIT(HFGRTR, REVIDR_EL1),
+    DO_BIT(HFGRTR, SCTLR_EL1),
+    DO_BIT(HFGRTR, SCXTNUM_EL1),
+    DO_BIT(HFGRTR, SCXTNUM_EL0),
+    DO_BIT(HFGRTR, TCR_EL1),
+    DO_BIT(HFGRTR, TPIDR_EL1),
+    DO_BIT(HFGRTR, TPIDRRO_EL0),
+    DO_BIT(HFGRTR, TPIDR_EL0),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c059935d0e6..9f6d9e2a3c9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2206,6 +2206,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "MAIR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 10, .crm = 2, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_MAIR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.mair_el[1]),
       .resetvalue = 0 },
     { .name = "MAIR_EL3", .state = ARM_CP_STATE_AA64,
@@ -2349,25 +2350,30 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
     { .name = "TPIDR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 2, .crn = 13, .crm = 0,
       .access = PL0_RW,
+      .fgt = FGT_TPIDR_EL0,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[0]), .resetvalue = 0 },
     { .name = "TPIDRURW", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 2,
       .access = PL0_RW,
+      .fgt = FGT_TPIDR_EL0,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidrurw_s),
                              offsetoflow32(CPUARMState, cp15.tpidrurw_ns) },
       .resetfn = arm_cp_reset_ignore },
     { .name = "TPIDRRO_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 3, .crn = 13, .crm = 0,
       .access = PL0_R | PL1_W,
+      .fgt = FGT_TPIDRRO_EL0,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidrro_el[0]),
       .resetvalue = 0},
     { .name = "TPIDRURO", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 3,
       .access = PL0_R | PL1_W,
+      .fgt = FGT_TPIDRRO_EL0,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidruro_s),
                              offsetoflow32(CPUARMState, cp15.tpidruro_ns) },
       .resetfn = arm_cp_reset_ignore },
     { .name = "TPIDR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .opc2 = 4, .crn = 13, .crm = 0,
       .access = PL1_RW,
+      .fgt = FGT_TPIDR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[1]), .resetvalue = 0 },
     { .name = "TPIDRPRW", .opc1 = 0, .cp = 15, .crn = 13, .crm = 0, .opc2 = 4,
       .access = PL1_RW,
@@ -4164,6 +4170,7 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     { .name = "TCR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .crn = 2, .crm = 0, .opc1 = 0, .opc2 = 2,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_TCR_EL1,
       .writefn = vmsa_tcr_el12_write,
       .raw_writefn = raw_write,
       .resetvalue = 0,
@@ -5399,6 +5406,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .type = ARM_CP_ALIAS,
       .opc0 = 3, .opc1 = 0, .crn = 7, .crm = 4, .opc2 = 0,
       .access = PL1_RW, .resetvalue = 0,
+      .fgt = FGT_PAR_EL1,
       .fieldoffset = offsetof(CPUARMState, cp15.par_el[1]),
       .writefn = par_write },
 #endif
@@ -7562,10 +7570,12 @@ static const ARMCPRegInfo scxtnum_reginfo[] = {
     { .name = "SCXTNUM_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 7,
       .access = PL0_RW, .accessfn = access_scxtnum,
+      .fgt = FGT_SCXTNUM_EL0,
       .fieldoffset = offsetof(CPUARMState, scxtnum_el[0]) },
     { .name = "SCXTNUM_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 7,
       .access = PL1_RW, .accessfn = access_scxtnum,
+      .fgt = FGT_SCXTNUM_EL1,
       .fieldoffset = offsetof(CPUARMState, scxtnum_el[1]) },
     { .name = "SCXTNUM_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 7,
@@ -8604,6 +8614,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "MIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_NO_RAW, .resetvalue = cpu->midr,
+              .fgt = FGT_MIDR_EL1,
               .fieldoffset = offsetof(CPUARMState, cp15.c0_cpuid),
               .readfn = midr_read },
             /* crn = 0 op1 = 0 crm = 0 op2 = 7 : AArch32 aliases of MIDR */
@@ -8614,6 +8625,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 6,
               .access = PL1_R,
               .accessfn = access_aa64_tid1,
+              .fgt = FGT_REVIDR_EL1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
         ARMCPRegInfo id_v8_midr_alias_cp_reginfo = {
@@ -8785,6 +8797,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo mpidr_cp_reginfo[] = {
             { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
+              .fgt = FGT_MPIDR_EL1,
               .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
@@ -8884,6 +8897,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .name = "SCTLR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 0,
             .access = PL1_RW, .accessfn = access_tvm_trvm,
+            .fgt = FGT_SCTLR_EL1,
             .bank_fieldoffsets = { offsetof(CPUARMState, cp15.sctlr_s),
                                    offsetof(CPUARMState, cp15.sctlr_ns) },
             .writefn = sctlr_write, .resetvalue = cpu->reset_sctlr,
-- 
2.34.1


