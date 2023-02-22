Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4109669ECE1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexR-0007cE-MY; Tue, 21 Feb 2023 21:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexC-0007Me-U8
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:59 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexB-0001bU-9I
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:58 -0500
Received: by mail-pj1-x102a.google.com with SMTP id pt11so7907002pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ManreqguuHsU2H8Z3wJmlF43bUQxuUikBGpUaE6IsMg=;
 b=AocALbKhIYvuNsOUP/0nu8WLrw99RivhRd9ADiuobvqEf0OQjBBfObn4Hb9advEU/x
 LNau8XUsMhF4LjZRz/ojZajfEJY+LjTY3YPZbu3jtZl4tY4CkzHQqZ5F41JPx0rnnaEi
 1AchgoEsD+vF7gWzmlhnUJuSFinUFTTcdY0Ql6VqVl4PavafqwHZzlXFVHzl86cc7Ugj
 bzNF40XFXXVJgEG7eKsYfGEEIWGQo79fxJiQaEFDE3d2gAlx5eIYuVUche3s07sgHKEO
 DxP+uvdxAt+oLleOjyQ9bBIyHH0VAY1MiMKoI6hNBh98JwncSbD0/zMqhhhbNKNc2GwL
 KO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ManreqguuHsU2H8Z3wJmlF43bUQxuUikBGpUaE6IsMg=;
 b=XRpskHfhoghz9QiK5ffDTFW3EzdyKGnn8qZ0+8LTWhkR7KlC4EO33HhtUiQQszuQ0A
 zsGoimsBUkhOcJ6p+tcBj25XXMhEFt0dk/GG5jZIJiwkXuFvorfyNn/VFiSegoaMZGhu
 06gZ2EjjG9Tn45x9pbR4acWXCZa6+Tib+T6qVV8ekeB44DcrVpEyR/HFm3osNEqYjZdZ
 2o+ZP1HLvoWn02hGqNoGSWaZtKTQHyXrpXuC+DIMv+fdYj1QWY9jDwLJo3VmBQOppUbY
 w5T91RTR/vuPmi9soDt+ehCJ6LmxxF3zr4HNk/rX4LaZpP3KmvfVLDOImO8fEulyhcFy
 s11g==
X-Gm-Message-State: AO0yUKUF/CXJdHMcr7N/mIveofQNZ+DwT2yozPc/FZNdHMMfrxEgrtLW
 hd7yRGj3BauvrQfnJ94kmx0iY+tKwDBgFsWw0eU=
X-Google-Smtp-Source: AK7set+l1Uqb/Uf/5/A88P/27LddBEYW5lHHnsdB/x8DigOqf5x4pPwmSE5JR96+Qd1x85xtP49Qzw==
X-Received: by 2002:a17:902:e80f:b0:19b:afb:b92e with SMTP id
 u15-20020a170902e80f00b0019b0afbb92emr11077986plg.40.1677033236537; 
 Tue, 21 Feb 2023 18:33:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 12/25] target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
Date: Tue, 21 Feb 2023 16:33:23 -1000
Message-Id: <20230222023336.915045-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

With FEAT_RME, there are four physical address spaces.
For now, just define the symbols, and mention them in
the same spots as the other Phys indexes in ptw.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       | 23 +++++++++++++++++++++--
 target/arm/ptw.c       | 10 ++++++++--
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 53cac9c89b..8dfd7a0bb6 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -47,6 +47,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 12
+#define NB_MMU_MODES 14
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c5fc475cf8..05fd6e61aa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2865,8 +2865,10 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
 
     /* TLBs with 1-1 mapping to the physical address spaces. */
-    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_S     = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_NS    = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_Root  = 12 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_Realm = 13 | ARM_MMU_IDX_A,
 
     /*
      * These are not allocated TLBs and are used only for AT system
@@ -2930,6 +2932,23 @@ typedef enum ARMASIdx {
     ARMASIdx_TagS = 3,
 } ARMASIdx;
 
+static inline ARMMMUIdx arm_space_to_phys(ARMSecuritySpace space)
+{
+    /* Assert the relative order of the physical mmu indexes. */
+    QEMU_BUILD_BUG_ON(ARMSS_Secure != 0);
+    QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS != ARMMMUIdx_Phys_S + ARMSS_NonSecure);
+    QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_Root != ARMMMUIdx_Phys_S + ARMSS_Root);
+    QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_Realm != ARMMMUIdx_Phys_S + ARMSS_Realm);
+
+    return ARMMMUIdx_Phys_S + space;
+}
+
+static inline ARMSecuritySpace arm_phys_to_space(ARMMMUIdx idx)
+{
+    assert(idx >= ARMMMUIdx_Phys_S && idx <= ARMMMUIdx_Phys_Realm);
+    return idx - ARMMMUIdx_Phys_S;
+}
+
 static inline bool arm_v7m_csselr_razwi(ARMCPU *cpu)
 {
     /* If all the CLIDR.Ctypem bits are 0 there are no caches, and
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5ed5bb5039..5a0c5edc88 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -182,8 +182,10 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E3:
         break;
 
-    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_Root:
+    case ARMMMUIdx_Phys_Realm:
         /* No translation for physical address spaces. */
         return true;
 
@@ -2632,8 +2634,10 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_Stage2_S:
-    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_Root:
+    case ARMMMUIdx_Phys_Realm:
         break;
 
     default:
@@ -2830,6 +2834,8 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_Root:
+    case ARMMMUIdx_Phys_Realm:
         /* Checking Phys early avoids special casing later vs regime_el. */
         return get_phys_addr_disabled(env, address, access_type, mmu_idx,
                                       is_secure, result, fi);
-- 
2.34.1


