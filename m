Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E068190E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:27:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqO-0001B2-Tl; Mon, 30 Jan 2023 13:25:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqI-00014x-GM
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:22 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqB-0008O3-4f
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t18so12010763wro.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uE1+7b7gus+hNDmeHdUGfNEuDyGv3C2iBvjQ8HFmN3M=;
 b=uhf5Rof4IxtTqsfdvUIRiVRRRk2K2j77EYOBa1xh2gchWP5FYp7UGaKk1tMr5swKeD
 SCOYTYn6eP5XM++d/Bav4bcgpAVkt1V4f0B18JP27xhz8qcoT5umkjiE74kM2g3FVp2G
 my6ueZ2wkdM+BV2zntJp2q+gJnpBy5nJqu2eytmVeHOPSPJX3uSDWVQIHKsiJuV0fHzv
 k+3UaKMoay4uEsE8ykSXN8JHBNIGVeY1Vh2uGmka68JOoT5S/Oti4hm5MtRPbimWY5+E
 VfbH1u8op0SnfSuCncqgTcB3sKL29JE4P9BgKD3wc+/nmaGqUZ4m9edUm0iOwf2nUbzE
 ziNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uE1+7b7gus+hNDmeHdUGfNEuDyGv3C2iBvjQ8HFmN3M=;
 b=dlkq0kvb850MA8qFMCivMpC9lWtZ5RCLRCHxxnseQBfIlWjD9/jefYm90n/Ipbvx/F
 KnpVl0zOa54awWovH+BNxuDYKwRLOMdXhl/sMeOiljBEgxU7Jb23sDSWGAcubCW71v9b
 X7bTr/ABdUHqIMiQ4vgwv3M9sCjjRFIghzzbCIYd1F9PkuNgihuLt7Zcm+BEDywuNnom
 ckuOcbFcDUV71WNCeZT2H25OAlT6k5BD92tkHsrXYBJ2EtfC2FEtU5vGcvm8q7nVwToc
 KLbzufuXF1W8xPeUds24mO9ps2H+P5dWZYWPrhosOFHptvIpkiCRcANjkLVrkFj4XJHJ
 HOsQ==
X-Gm-Message-State: AFqh2kqLJie68nylirvQLTIriQsqPk+ZXEQpSc+s3jLgdVd2K9pKHSjh
 FJEOefh6Ani2D/gCufKNSvbJjBiwsd7hfjMK
X-Google-Smtp-Source: AMrXdXsa07wUeNFiMV5ArHfohJS9piJWFbGXJ7c6up9Rm0Ht1XuI6igAltzP6P+geU4Qhqowo+ZnkQ==
X-Received: by 2002:a05:6000:38a:b0:2be:4c32:a7df with SMTP id
 u10-20020a056000038a00b002be4c32a7dfmr39515156wrf.63.1675103114414; 
 Mon, 30 Jan 2023 10:25:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/23] target/arm: Mark up sysregs for HFGRTR bits 36..63
Date: Mon, 30 Jan 2023 18:24:49 +0000
Message-Id: <20230130182459.3309057-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
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
by HFGRTR/HFGWTR bits 36..63.

Of these, some correspond to RAS registers which we implement as
always-UNDEF: these don't need any extra handling for FGT because the
UNDEF-to-EL1 always takes priority over any theoretical
FGT-trap-to-EL2.

Bit 50 (NACCDATA_EL1) is for the ACCDATA_EL1 register which is part
of the FEAT_LS64_ACCDATA feature which we don't yet implement.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index b17b29288c7..6a3ca482fff 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2376,6 +2376,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 6,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
       .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .fgt = FGT_ICC_IGRPENN_EL1,
       .readfn = icc_igrpen_read,
       .writefn = icc_igrpen_write,
     },
@@ -2384,6 +2385,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
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


