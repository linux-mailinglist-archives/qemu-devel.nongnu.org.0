Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CDF64DBE1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:02:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nhW-00078S-9P; Thu, 15 Dec 2022 07:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh9-0006qV-Ku
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:50 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5nh7-0004Af-On
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:50:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id bg10so13698366wmb.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RK1UPNBesBVFKDD7ufhJMalSW0NQP8K9iyGi9aR9dj4=;
 b=AswGKamNI6Sy+h70UsIN1JyikVi52Q7/uGDNZmZOohZv9eYJI6gGrErZGgBjtLnPhZ
 7pNll8ps6zgcJ89co3uWTFQf+ltrwepbOCnhRwsOnBaUNhh9W99z5DrSEEz+zOzmWMFB
 OVdy4mwvEFsiyNivQQKdFEXwQmR9ILUOxH6Me73q6Fb2ijxQIAJjvaPI3zRYOJqZzHX0
 Rv1lb5x5ikxXav25dYQyN+H2XsZmyoJ+PmrdgODgZ5Fq9wS9E0HuHYQHXCwZVQgwlFfz
 NScA8x5rnQeJsXMnXF3+hRe1E0jIwGahpbQvgXzjOyDJ4MMW293tqFVQNYS5ZnBn+7ws
 nBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RK1UPNBesBVFKDD7ufhJMalSW0NQP8K9iyGi9aR9dj4=;
 b=bQIpzUYqCE4Z0AgPFqJKBglXVzp5Px32cDh+AhdQk5Yw8QMwSgcSrDZ2nBDEWMB3Sl
 8XKh4FYNTGeGWL2IMiPXpLw/rxCveuxIptijzvCdohDMdeZp/guLOuBuT9Hl0zH5KKjG
 UTH5UsPb+Z2h3Fc8K5/vS87JT6TLg0ay1J8NpyFwCLMZjOaA81V99qwhDatOR5C64qPw
 FmpaoNGSGvV34u7yB1RxIAg2VMgHRwpl1BJdtwzRWGrjwJuCtjl5TgCSSNspz832voYt
 fU/czDhSk7aSNiM5Q+gby+5ZtsH3LTXfg4+Kj83p5E0pNXiP/Esthy2iEnOjL4mwb8pA
 iXng==
X-Gm-Message-State: ANoB5plkhL658sx2uFznJl0nHpmzWbhJwhoXf+PqZL4XFxbxTHVnLb0J
 DfHX3e8RqMFLvG+7R8+OJ0MAYKzOmGUvaMcO
X-Google-Smtp-Source: AA0mqf6gqxVIFDuLeZP1Q21h/n+5DJviHgQsp0PI21eIMr6seR55qybFy3RnV6vjmOJXS1AWVyKJDw==
X-Received: by 2002:a05:600c:1d83:b0:3d2:13c6:4740 with SMTP id
 p3-20020a05600c1d8300b003d213c64740mr24773548wms.39.1671108636272; 
 Thu, 15 Dec 2022 04:50:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a05600c354c00b003cfd64b6be1sm8388787wmq.27.2022.12.15.04.50.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 04:50:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/29] target/arm: align exposed ID registers with Linux
Date: Thu, 15 Dec 2022 12:50:07 +0000
Message-Id: <20221215125009.980128-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215125009.980128-1-peter.maydell@linaro.org>
References: <20221215125009.980128-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

From: Zhuojia Shen <chaosdefinition@hotmail.com>

In CPUID registers exposed to userspace, some registers were missing
and some fields were not exposed.  This patch aligns exposed ID
registers and their fields with what the upstream kernel currently
exposes.

Specifically, the following new ID registers/fields are exposed to
userspace:

ID_AA64PFR1_EL1.BT:       bits 3-0
ID_AA64PFR1_EL1.MTE:      bits 11-8
ID_AA64PFR1_EL1.SME:      bits 27-24

ID_AA64ZFR0_EL1.SVEver:   bits 3-0
ID_AA64ZFR0_EL1.AES:      bits 7-4
ID_AA64ZFR0_EL1.BitPerm:  bits 19-16
ID_AA64ZFR0_EL1.BF16:     bits 23-20
ID_AA64ZFR0_EL1.SHA3:     bits 35-32
ID_AA64ZFR0_EL1.SM4:      bits 43-40
ID_AA64ZFR0_EL1.I8MM:     bits 47-44
ID_AA64ZFR0_EL1.F32MM:    bits 55-52
ID_AA64ZFR0_EL1.F64MM:    bits 59-56

ID_AA64SMFR0_EL1.F32F32:  bit 32
ID_AA64SMFR0_EL1.B16F32:  bit 34
ID_AA64SMFR0_EL1.F16F32:  bit 35
ID_AA64SMFR0_EL1.I8I32:   bits 39-36
ID_AA64SMFR0_EL1.F64F64:  bit 48
ID_AA64SMFR0_EL1.I16I64:  bits 55-52
ID_AA64SMFR0_EL1.FA64:    bit 63

ID_AA64MMFR0_EL1.ECV:     bits 63-60

ID_AA64MMFR1_EL1.AFP:     bits 47-44

ID_AA64MMFR2_EL1.AT:      bits 35-32

ID_AA64ISAR0_EL1.RNDR:    bits 63-60

ID_AA64ISAR1_EL1.FRINTTS: bits 35-32
ID_AA64ISAR1_EL1.BF16:    bits 47-44
ID_AA64ISAR1_EL1.DGH:     bits 51-48
ID_AA64ISAR1_EL1.I8MM:    bits 55-52

ID_AA64ISAR2_EL1.WFxT:    bits 3-0
ID_AA64ISAR2_EL1.RPRES:   bits 7-4
ID_AA64ISAR2_EL1.GPA3:    bits 11-8
ID_AA64ISAR2_EL1.APA3:    bits 15-12

The code is also refactored to use symbolic names for ID register fields
for better readability and maintainability.

Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
Message-id: DS7PR12MB6309BC9133877BCC6FC419FEAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 96 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 79 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bac2ea62c44..6efc632b20d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7864,31 +7864,89 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo v8_user_idregs[] = {
             { .name = "ID_AA64PFR0_EL1",
-              .exported_bits = 0x000f000f00ff0000,
-              .fixed_bits    = 0x0000000000000011 },
+              .exported_bits = R_ID_AA64PFR0_FP_MASK |
+                               R_ID_AA64PFR0_ADVSIMD_MASK |
+                               R_ID_AA64PFR0_SVE_MASK |
+                               R_ID_AA64PFR0_DIT_MASK,
+              .fixed_bits = (0x1 << R_ID_AA64PFR0_EL0_SHIFT) |
+                            (0x1 << R_ID_AA64PFR0_EL1_SHIFT) },
             { .name = "ID_AA64PFR1_EL1",
-              .exported_bits = 0x00000000000000f0 },
+              .exported_bits = R_ID_AA64PFR1_BT_MASK |
+                               R_ID_AA64PFR1_SSBS_MASK |
+                               R_ID_AA64PFR1_MTE_MASK |
+                               R_ID_AA64PFR1_SME_MASK },
             { .name = "ID_AA64PFR*_EL1_RESERVED",
-              .is_glob = true                     },
-            { .name = "ID_AA64ZFR0_EL1"           },
+              .is_glob = true },
+            { .name = "ID_AA64ZFR0_EL1",
+              .exported_bits = R_ID_AA64ZFR0_SVEVER_MASK |
+                               R_ID_AA64ZFR0_AES_MASK |
+                               R_ID_AA64ZFR0_BITPERM_MASK |
+                               R_ID_AA64ZFR0_BFLOAT16_MASK |
+                               R_ID_AA64ZFR0_SHA3_MASK |
+                               R_ID_AA64ZFR0_SM4_MASK |
+                               R_ID_AA64ZFR0_I8MM_MASK |
+                               R_ID_AA64ZFR0_F32MM_MASK |
+                               R_ID_AA64ZFR0_F64MM_MASK },
+            { .name = "ID_AA64SMFR0_EL1",
+              .exported_bits = R_ID_AA64SMFR0_F32F32_MASK |
+                               R_ID_AA64SMFR0_B16F32_MASK |
+                               R_ID_AA64SMFR0_F16F32_MASK |
+                               R_ID_AA64SMFR0_I8I32_MASK |
+                               R_ID_AA64SMFR0_F64F64_MASK |
+                               R_ID_AA64SMFR0_I16I64_MASK |
+                               R_ID_AA64SMFR0_FA64_MASK },
             { .name = "ID_AA64MMFR0_EL1",
-              .fixed_bits    = 0x00000000ff000000 },
-            { .name = "ID_AA64MMFR1_EL1"          },
+              .exported_bits = R_ID_AA64MMFR0_ECV_MASK,
+              .fixed_bits = (0xf << R_ID_AA64MMFR0_TGRAN64_SHIFT) |
+                            (0xf << R_ID_AA64MMFR0_TGRAN4_SHIFT) },
+            { .name = "ID_AA64MMFR1_EL1",
+              .exported_bits = R_ID_AA64MMFR1_AFP_MASK },
+            { .name = "ID_AA64MMFR2_EL1",
+              .exported_bits = R_ID_AA64MMFR2_AT_MASK },
             { .name = "ID_AA64MMFR*_EL1_RESERVED",
-              .is_glob = true                     },
+              .is_glob = true },
             { .name = "ID_AA64DFR0_EL1",
-              .fixed_bits    = 0x0000000000000006 },
-            { .name = "ID_AA64DFR1_EL1"           },
+              .fixed_bits = (0x6 << R_ID_AA64DFR0_DEBUGVER_SHIFT) },
+            { .name = "ID_AA64DFR1_EL1" },
             { .name = "ID_AA64DFR*_EL1_RESERVED",
-              .is_glob = true                     },
+              .is_glob = true },
             { .name = "ID_AA64AFR*",
-              .is_glob = true                     },
+              .is_glob = true },
             { .name = "ID_AA64ISAR0_EL1",
-              .exported_bits = 0x00fffffff0fffff0 },
+              .exported_bits = R_ID_AA64ISAR0_AES_MASK |
+                               R_ID_AA64ISAR0_SHA1_MASK |
+                               R_ID_AA64ISAR0_SHA2_MASK |
+                               R_ID_AA64ISAR0_CRC32_MASK |
+                               R_ID_AA64ISAR0_ATOMIC_MASK |
+                               R_ID_AA64ISAR0_RDM_MASK |
+                               R_ID_AA64ISAR0_SHA3_MASK |
+                               R_ID_AA64ISAR0_SM3_MASK |
+                               R_ID_AA64ISAR0_SM4_MASK |
+                               R_ID_AA64ISAR0_DP_MASK |
+                               R_ID_AA64ISAR0_FHM_MASK |
+                               R_ID_AA64ISAR0_TS_MASK |
+                               R_ID_AA64ISAR0_RNDR_MASK },
             { .name = "ID_AA64ISAR1_EL1",
-              .exported_bits = 0x000000f0ffffffff },
+              .exported_bits = R_ID_AA64ISAR1_DPB_MASK |
+                               R_ID_AA64ISAR1_APA_MASK |
+                               R_ID_AA64ISAR1_API_MASK |
+                               R_ID_AA64ISAR1_JSCVT_MASK |
+                               R_ID_AA64ISAR1_FCMA_MASK |
+                               R_ID_AA64ISAR1_LRCPC_MASK |
+                               R_ID_AA64ISAR1_GPA_MASK |
+                               R_ID_AA64ISAR1_GPI_MASK |
+                               R_ID_AA64ISAR1_FRINTTS_MASK |
+                               R_ID_AA64ISAR1_SB_MASK |
+                               R_ID_AA64ISAR1_BF16_MASK |
+                               R_ID_AA64ISAR1_DGH_MASK |
+                               R_ID_AA64ISAR1_I8MM_MASK },
+            { .name = "ID_AA64ISAR2_EL1",
+              .exported_bits = R_ID_AA64ISAR2_WFXT_MASK |
+                               R_ID_AA64ISAR2_RPRES_MASK |
+                               R_ID_AA64ISAR2_GPA3_MASK |
+                               R_ID_AA64ISAR2_APA3_MASK },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
-              .is_glob = true                     },
+              .is_glob = true },
         };
         modify_arm_cp_regs(v8_idregs, v8_user_idregs);
 #endif
@@ -8206,8 +8264,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo id_v8_user_midr_cp_reginfo[] = {
             { .name = "MIDR_EL1",
-              .exported_bits = 0x00000000ffffffff },
-            { .name = "REVIDR_EL1"                },
+              .exported_bits = R_MIDR_EL1_REVISION_MASK |
+                               R_MIDR_EL1_PARTNUM_MASK |
+                               R_MIDR_EL1_ARCHITECTURE_MASK |
+                               R_MIDR_EL1_VARIANT_MASK |
+                               R_MIDR_EL1_IMPLEMENTER_MASK },
+            { .name = "REVIDR_EL1" },
         };
         modify_arm_cp_regs(id_v8_midr_cp_reginfo, id_v8_user_midr_cp_reginfo);
 #endif
-- 
2.25.1


