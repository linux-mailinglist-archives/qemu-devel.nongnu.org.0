Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632765048CC
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:10:59 +0200 (CEST)
Received: from localhost ([::1]:33884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng9MP-0001bT-LU
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xG-0001AD-Sc
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:58 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:39659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xC-0003NM-WE
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:58 -0400
Received: by mail-pl1-x62a.google.com with SMTP id c12so10741230plr.6
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXryGBC0mqaWtLXkO2uZG/YEkw1cD0lQU+28RrwCGRA=;
 b=TweJb6J6wLAoDBG5UGnAOmIKBdjETERRYBwSOQ/kwAwgA5S4bsW792/otcOkCTN7Dv
 +1KCKqFc5PwrNcWjGvdqlotlZqQreufp6RLV36OWTRhA0F/Cl3Oe/qzuIwfbyVUB0PAq
 uCxUOna2NzRGMl8mKvApGw/ylIZ8KmG4cUtbaCXt33Qc2pMB/F6mqEQcV/byNVJ+vzcH
 gQkH/ILdNHebvoOzTIHn0W5vTg/wFU8JnsduZCaf2aR4K/MX2q4+EQ7s8Bl2we4CLTXn
 cPbBspqyeIUgyyekaotD0grQOHDmSlgBCxOiz0dVlnRcAx3yzP1ypl3LFJLyOIxe24qz
 X6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXryGBC0mqaWtLXkO2uZG/YEkw1cD0lQU+28RrwCGRA=;
 b=P8CW9v/Tu90v9JM+wskOqzJN2Mn/CVa+GZtUj1Q4LhnWZmv29TYZLYezR85PlfpNki
 K0Xcw0VhDUyMTmbDc+fsIN8ja0juwvKMwoXWSsikBBb6m63iadXHgkxvqmLof2IZdlLR
 GLPZmv6qFiyvn5jqOM3NCVRM8BmRDQRaLTf1k2ZrCiTxjHEgO+yRUY6ToyD8N8denN6+
 sScbIAPTLnS5EoRuWzHM6H7ukngzQQWGZtZWey1rqjVSOWS+dToy8NRzVHXt3MPUKFjj
 GL10yEJ/qOvymyw90zVrwu8GK/9B7ODRDNtGnbE5cnfSRDxw06ld3v4yctuZa0lRmn9r
 wffQ==
X-Gm-Message-State: AOAM531Yi+9ZipYrlALwEdf016t6rPBV0ZwDU0aCW8N5QvCFZDhmq05y
 XQxlwAmw4fd430J1O95WIDNUOouVVE06aA==
X-Google-Smtp-Source: ABdhPJz1EMIP+8BTk8wa3PlNLjV2Pq+yuizfYtvjz+aTqCMrQV6fRNM9yuTwaDdERxrsgCsOkbNybQ==
X-Received: by 2002:a17:902:c412:b0:158:72da:6fdd with SMTP id
 k18-20020a170902c41200b0015872da6fddmr7673772plk.165.1650217493597; 
 Sun, 17 Apr 2022 10:44:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/60] target/arm: Make some more cpreg data static const
Date: Sun, 17 Apr 2022 10:43:53 -0700
Message-Id: <20220417174426.711829-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These particular data structures are not modified at runtime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d6c34c7826..94b41c7e88 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7861,7 +7861,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .resetvalue = cpu->pmceid1 },
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo v8_user_idregs[] = {
+        static const ARMCPRegUserSpaceInfo v8_user_idregs[] = {
             { .name = "ID_AA64PFR0_EL1",
               .exported_bits = 0x000f000f00ff0000,
               .fixed_bits    = 0x0000000000000011 },
@@ -8001,7 +8001,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
      */
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR", .type = ARM_CP_CONST,
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL1_RW, .accessfn = nsacr_access,
@@ -8009,7 +8009,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             };
             define_one_arm_cp_reg(cpu, &nsacr);
         } else {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR",
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL3_RW | PL1_R,
@@ -8020,7 +8020,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     } else {
         if (arm_feature(env, ARM_FEATURE_V8)) {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR", .type = ARM_CP_CONST,
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL1_R,
@@ -8173,13 +8173,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .resetvalue = cpu->pmsav7_dregion << 8
         };
-        ARMCPRegInfo crn0_wi_reginfo = {
+        static const ARMCPRegInfo crn0_wi_reginfo = {
             .name = "CRN0_WI", .cp = 15, .crn = 0, .crm = CP_ANY,
             .opc1 = CP_ANY, .opc2 = CP_ANY, .access = PL1_W,
             .type = ARM_CP_NOP | ARM_CP_OVERRIDE
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo id_v8_user_midr_cp_reginfo[] = {
+        static const ARMCPRegUserSpaceInfo id_v8_user_midr_cp_reginfo[] = {
             { .name = "MIDR_EL1",
               .exported_bits = 0x00000000ffffffff },
             { .name = "REVIDR_EL1"                },
@@ -8224,7 +8224,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
+        static const ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
             { .name = "MPIDR_EL1",
               .fixed_bits = 0x0000000080000000 },
         };
@@ -8303,7 +8303,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (arm_feature(env, ARM_FEATURE_VBAR)) {
-        ARMCPRegInfo vbar_cp_reginfo[] = {
+        static const ARMCPRegInfo vbar_cp_reginfo[] = {
             { .name = "VBAR", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 0,
               .access = PL1_RW, .writefn = vbar_write,
-- 
2.25.1


