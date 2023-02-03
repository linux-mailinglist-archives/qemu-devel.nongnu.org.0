Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8174689BBA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:32:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5R-0007mZ-F5; Fri, 03 Feb 2023 09:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4d-0006jU-L8
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:55 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4Y-00057V-CN
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:55 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso3985559wms.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0VoPlZhHUdfCku+qw/NzX2OrIbw7jq7vrZk3olaLM5Q=;
 b=ymnWa+5xocLrBnXKaVQcoVpW4/fShfrO4U9YRxRNaCq97lXhjc0wBuinAP7qhwxHiN
 eR/ziqrG7PvDr6ayBijVgSAxdhury9hoHg3a1pUhwP7jLjV3nn3wi1jzUBUlpwJoAeay
 4Z8Hwm9N/YljlgtMX3yxSc5XTSyezRdV0dAAxRVzoc8HPEkLMyP6uhMBxBPtxd3eL4ee
 sxzR5biJtnY/dmrRwJDxJgCUTuKXk8HV+5//jRVD7QQZ2kwQ7JsR7irsbEAteCYFtCXK
 yda5liy0RkW3L+8qV5jDPehCCyamAcqbzRzjTqCt4vLwWnYnOs8cOWc7q81QnjRhtAUG
 rhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0VoPlZhHUdfCku+qw/NzX2OrIbw7jq7vrZk3olaLM5Q=;
 b=R8+7SUOD8q7O1j1HBPvMSpFL0TuxJYD3E9tIfCr8BmRajAVST8JNrjP2P6CmSCIa41
 KTpaSMDJDD1y3RzWKlOrLVsvAW4+oCh+3MRg18caJmqy8Bp1BQxl03hHgVD/YH2nnYlr
 Fi9Aupc/oHuWpC1hqEGmzJcDY/0wqzAH559kPOK/U4I5XxJnyz03rNmVSqKdu8eOT+pv
 IU7KInu/ROM1apdgISibj/Y5tH/mhHDpN224uTXGZ2FkxNgGuXdTL9XEUsWJh6vgWO+w
 Zn9p7Gh5p1bVrcTxxwcR8TCeGz1Mzj8USFjRCyfIxrpjkTn2vPeggj2dZB+JVqm5lwmN
 2PCg==
X-Gm-Message-State: AO0yUKU/XFuwTT6S4pRmjNhsygebhGj5TA28gBPHndgoeEFsaTkC4Br+
 ZQN0m6HuRQw/2p+uU6jOmxN7CHqXm1vSHei1
X-Google-Smtp-Source: AK7set++BcBRaM/iGFPp6LlrkXj9Qz1+TiqqXh86w/4gK85ZD3f8Q5hiKrqpTjlz5UF6h3lUxgfkqg==
X-Received: by 2002:a05:600c:474f:b0:3df:e57d:f4d0 with SMTP id
 w15-20020a05600c474f00b003dfe57df4d0mr2941024wmo.26.1675434588601; 
 Fri, 03 Feb 2023 06:29:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/33] target/arm: Mark up sysregs for HFGRTR bits 36..63
Date: Fri,  3 Feb 2023 14:29:17 +0000
Message-Id: <20230203142927.834793-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
by HFGRTR/HFGWTR bits 36..63.

Of these, some correspond to RAS registers which we implement as
always-UNDEF: these don't need any extra handling for FGT because the
UNDEF-to-EL1 always takes priority over any theoretical
FGT-trap-to-EL2.

Bit 50 (NACCDATA_EL1) is for the ACCDATA_EL1 register which is part
of the FEAT_LS64_ACCDATA feature which we don't yet implement.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-14-peter.maydell@linaro.org
Message-id: 20230127175507.2895013-14-peter.maydell@linaro.org
---
 target/arm/cpregs.h       |  7 +++++++
 hw/intc/arm_gicv3_cpuif.c |  2 ++
 target/arm/helper.c       | 10 ++++++++++
 3 files changed, 19 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 1b219242d5d..fef8ad08acc 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -615,6 +615,13 @@ typedef enum FGTBit {
     DO_BIT(HFGRTR, TPIDR_EL1),
     DO_BIT(HFGRTR, TPIDRRO_EL0),
     DO_BIT(HFGRTR, TPIDR_EL0),
+    DO_BIT(HFGRTR, TTBR0_EL1),
+    DO_BIT(HFGRTR, TTBR1_EL1),
+    DO_BIT(HFGRTR, VBAR_EL1),
+    DO_BIT(HFGRTR, ICC_IGRPENN_EL1),
+    DO_BIT(HFGRTR, ERRIDR_EL1),
+    DO_REV_BIT(HFGRTR, NSMPRI_EL1),
+    DO_REV_BIT(HFGRTR, NTPIDR2_EL0),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 9a7fc190994..d07b13eb270 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2378,6 +2378,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 6,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .fgt = FGT_ICC_IGRPENN_EL1,
       .readfn = icc_igrpen_read,
       .writefn = icc_igrpen_write,
     },
@@ -2386,6 +2387,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 7,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .fgt = FGT_ICC_IGRPENN_EL1,
       .readfn = icc_igrpen_read,
       .writefn = icc_igrpen_write,
     },
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9f6d9e2a3c9..a48b022def6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4158,12 +4158,14 @@ static const ARMCPRegInfo vmsa_cp_reginfo[] = {
     { .name = "TTBR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 0,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_TTBR0_EL1,
       .writefn = vmsa_ttbr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr0_s),
                              offsetof(CPUARMState, cp15.ttbr0_ns) } },
     { .name = "TTBR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 2, .crm = 0, .opc2 = 1,
       .access = PL1_RW, .accessfn = access_tvm_trvm,
+      .fgt = FGT_TTBR1_EL1,
       .writefn = vmsa_ttbr_write, .resetvalue = 0,
       .bank_fieldoffsets = { offsetof(CPUARMState, cp15.ttbr1_s),
                              offsetof(CPUARMState, cp15.ttbr1_ns) } },
@@ -6488,6 +6490,10 @@ static void disr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t val)
  *   ERRSELR_EL1
  * may generate UNDEFINED, which is the effect we get by not
  * listing them at all.
+ *
+ * These registers have fine-grained trap bits, but UNDEF-to-EL1
+ * is higher priority than FGT-to-EL2 so we do not need to list them
+ * in order to check for an FGT.
  */
 static const ARMCPRegInfo minimal_ras_reginfo[] = {
     { .name = "DISR_EL1", .state = ARM_CP_STATE_BOTH,
@@ -6497,6 +6503,7 @@ static const ARMCPRegInfo minimal_ras_reginfo[] = {
     { .name = "ERRIDR_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 0,
       .access = PL1_R, .accessfn = access_terr,
+      .fgt = FGT_ERRIDR_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 1,
@@ -6819,6 +6826,7 @@ static const ARMCPRegInfo sme_reginfo[] = {
     { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
       .access = PL0_RW, .accessfn = access_tpidr2,
+      .fgt = FGT_NTPIDR2_EL0,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr2_el0) },
     { .name = "SVCR", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 2,
@@ -6856,6 +6864,7 @@ static const ARMCPRegInfo sme_reginfo[] = {
     { .name = "SMPRI_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 4,
       .access = PL1_RW, .accessfn = access_esm,
+      .fgt = FGT_NSMPRI_EL1,
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
@@ -8884,6 +8893,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "VBAR", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 0,
               .access = PL1_RW, .writefn = vbar_write,
+              .fgt = FGT_VBAR_EL1,
               .bank_fieldoffsets = { offsetof(CPUARMState, cp15.vbar_s),
                                      offsetof(CPUARMState, cp15.vbar_ns) },
               .resetvalue = 0 },
-- 
2.34.1


