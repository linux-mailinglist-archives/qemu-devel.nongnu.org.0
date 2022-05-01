Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707F516216
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 07:56:37 +0200 (CEST)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2ZQ-0001gH-2s
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 01:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Td-0006m7-7M
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:37 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tb-0001Eb-GQ
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:36 -0400
Received: by mail-pg1-x532.google.com with SMTP id 7so5618131pga.12
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iax7WDyltN6Kt3t+wmKMWbwwcMdu+ckfkULh3ecB8vc=;
 b=YrtapjsuJeas+ekHLlJWwJINwFiVI15EUFWgNMzabGC+yHM4oIKKc4hjDK6BL8Lpjl
 sWLzntig6CCRKwjyZrhWkNUmF5vfAaTsvE5qCjC/1lc39FNET8k+lqmwnARvCw4ULcau
 ueYW6vk1GOCkV4tjBijkSl/tJWwT9kjzniWv1HA04KaGYu/fov5/gFpqPSmtqbrE8hnA
 kH4/SziGeggoyFKKUWS0Rkb8Ge4TFsDsZ4DvY4N73xrJiTCfBbDaNi0LeFRG2CsMbTE5
 DKEc0EaNOG5/eZe7cKKzX7UyUAD9AiFrdlpD5LCRqYNn6v2K48NKpsKDnSE8TqEAbCXD
 ebOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iax7WDyltN6Kt3t+wmKMWbwwcMdu+ckfkULh3ecB8vc=;
 b=O9V8dbaZCBqIok+hzbwxIozMeqEVkca/rhCvIEWNUqDkIvzmpvZqqmQYzd5M2sYnAX
 6/z9I+PYd0XjG+FzYqVTSB/6t8iLKcxEXmkzl/06UKmElHxX+c3M00e8+CGIgiJrXSxy
 z7GzWM+ZYjsLrrff15jvj8/wRcNI56XWRhKvjPIsmyc5SHUWCBY1HPuRyyLkFzs8wxm6
 bAV1Ish2Pgsw8i8HBSHmrHThoBb9/eyalOUOtYGcQtGJRuYLE+qw2v2bViuuptNSxNCT
 OiCV68RNn4/FqSuRiDqeshlexoMBSlswmjZPNjrpqW2mdre25JPjwydVqS665JFMNDsH
 LaBg==
X-Gm-Message-State: AOAM531SjfP9mQTSAIg9617U9j1y0g0WVSY8bk7gvJ/nsb69KAJ7VeiQ
 UoAREy8nRmPWxiAm4kd6Q+0v6jHQyPPscw==
X-Google-Smtp-Source: ABdhPJz0o/2t9nSylklg/pKgLMeS5fWHKXn8SiAyJzfxYUg4AhDKFnA4birVYKGOp7/fyExJInF36w==
X-Received: by 2002:aa7:9852:0:b0:50d:6d10:2094 with SMTP id
 n18-20020aa79852000000b0050d6d102094mr6014190pfq.4.1651384234090; 
 Sat, 30 Apr 2022 22:50:34 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/45] target/arm: Make some more cpreg data static const
Date: Sat, 30 Apr 2022 22:49:46 -0700
Message-Id: <20220501055028.646596-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These particular data structures are not modified at runtime.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a68f14fe8e..ca6ba9bd82 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7860,7 +7860,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .resetvalue = cpu->pmceid1 },
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo v8_user_idregs[] = {
+        static const ARMCPRegUserSpaceInfo v8_user_idregs[] = {
             { .name = "ID_AA64PFR0_EL1",
               .exported_bits = 0x000f000f00ff0000,
               .fixed_bits    = 0x0000000000000011 },
@@ -8000,7 +8000,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
      */
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR", .type = ARM_CP_CONST,
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL1_RW, .accessfn = nsacr_access,
@@ -8008,7 +8008,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             };
             define_one_arm_cp_reg(cpu, &nsacr);
         } else {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR",
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL3_RW | PL1_R,
@@ -8019,7 +8019,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     } else {
         if (arm_feature(env, ARM_FEATURE_V8)) {
-            ARMCPRegInfo nsacr = {
+            static const ARMCPRegInfo nsacr = {
                 .name = "NSACR", .type = ARM_CP_CONST,
                 .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
                 .access = PL1_R,
@@ -8172,13 +8172,13 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -8223,7 +8223,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
         };
 #ifdef CONFIG_USER_ONLY
-        ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
+        static const ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
             { .name = "MPIDR_EL1",
               .fixed_bits = 0x0000000080000000 },
         };
@@ -8302,7 +8302,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (arm_feature(env, ARM_FEATURE_VBAR)) {
-        ARMCPRegInfo vbar_cp_reginfo[] = {
+        static const ARMCPRegInfo vbar_cp_reginfo[] = {
             { .name = "VBAR", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .crn = 12, .crm = 0, .opc1 = 0, .opc2 = 0,
               .access = PL1_RW, .writefn = vbar_write,
-- 
2.34.1


