Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D273541941
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:21:43 +0200 (CEST)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygdy-0003dx-9I
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftd-0000Kb-Du
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:49 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftU-0007L8-RQ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:49 -0400
Received: by mail-pg1-x52d.google.com with SMTP id g186so8075803pgc.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Im5u11D8yrAC4qQJy1JnWa+rWzoOJ65BBH7IOoUdIyQ=;
 b=J7y0v9iGUlDOPRh03zbC+4A23pTa9EYfociFC23p5YJ2Us9UuFs90ppQkFkKc9NXGJ
 USavmNA6PahvKQ6So04V1eHIUv6RT0yqWqbkzlG9o6Lus7PpienJh9MNj231macFiVyC
 hAzXIb3IHxgYSTzJ/8BTcthPfuAX5apARy4k9NcQRtWD5TD96OpLyLqh3+SXZzRi5d4d
 g4+JrSrenyecs087twarVewtPduCgVb0/73iLLAAYUa7t+akuUMXTr02dlvCiepmiQUG
 66lViN87wmMx2Y0OopVSipGO24er1RaujcJ2h+jss683ZgeNPQf63wRLmXQAgGgWFWUF
 /REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Im5u11D8yrAC4qQJy1JnWa+rWzoOJ65BBH7IOoUdIyQ=;
 b=1Jueo+yLfyVG6FERdW02VEg1uAwbwGI9CENE9nBWw1UM4uE8O9baEi5Dt3l3em0YCm
 AAMI0c/mlIg7BDmF3teCIwDSWQhf/mnZU+ea3m2m6gcrjs+eBRSy1JYEC8HgNODvSRjh
 eiH/oeDj1m6R5jmYCLtW9vZMaqqikghOIjA6di8m4Q4M1PFXg9oG9Jmg3fTBJrTyVNpL
 tdc5C1IfKEmT+4AU4TnVMtJ9Qjx4/wczSACkGsFRFarwVKNmgwrK7Uh80rUr5+dLdQ8k
 3OZ4ihD77jPBR09kOdCzrQNMoeknUtYyyKIS7BfAprwcgQJXK/Oa1xxOVOLg1PyajRsj
 bgtQ==
X-Gm-Message-State: AOAM532cUvZie8pfcpRQCrCeeQZx7hc4DPHDjck7iGtEegI8XATEfYL/
 61m7qg/O7+Q/TNdxRf2Nnep6Su9RBYCKXA==
X-Google-Smtp-Source: ABdhPJztOTWuxigdF6S82pW04d73OUGOO+/htgbPeJ2571ErGkqzHGkr3CQII9XXiGt8yB1XQMyiDg==
X-Received: by 2002:a05:6a00:1a87:b0:51c:29f1:13a0 with SMTP id
 e7-20020a056a001a8700b0051c29f113a0mr9000697pfv.13.1654634019983; 
 Tue, 07 Jun 2022 13:33:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 35/71] target/arm: Move arm_cpu_*_finalize to internals.h
Date: Tue,  7 Jun 2022 13:32:30 -0700
Message-Id: <20220607203306.657998-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

Drop the aa32-only inline fallbacks,
and just use a couple of ifdefs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 6 ------
 target/arm/internals.h | 3 +++
 target/arm/cpu.c       | 2 ++
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4e86d143c8..25a77ec676 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -205,14 +205,8 @@ typedef struct {
 
 #ifdef TARGET_AARCH64
 # define ARM_MAX_VQ    16
-void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
-void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
-static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
-static inline void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 8bac570475..756301b536 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1309,6 +1309,9 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg);
 int arm_gdb_set_svereg(CPUARMState *env, uint8_t *buf, int reg);
 int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg);
 int aarch64_fpu_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg);
+void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #endif
 
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b5d535788..b5276fa944 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1421,6 +1421,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err = NULL;
 
+#ifdef TARGET_AARCH64
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         arm_cpu_sve_finalize(cpu, &local_err);
         if (local_err != NULL) {
@@ -1440,6 +1441,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
     }
+#endif
 
     if (kvm_enabled()) {
         kvm_arm_steal_time_finalize(cpu, &local_err);
-- 
2.34.1


