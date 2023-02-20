Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98B569D702
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYY-00041P-43; Mon, 20 Feb 2023 18:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYW-0003za-6Z
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:48 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYU-0000NW-IW
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:47 -0500
Received: by mail-pl1-x62e.google.com with SMTP id p1so1087511plg.7
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Gj4J+B5iGnKsOwsF9h/fX8hbpbRCBs9B/CdgKeQjUk=;
 b=fyUIuc71rFe6mvaGGhsFVhXHBMoqkDcb07bruBj7PkPGxVyMePN7RvurG38Z2WNCpR
 TT7GK3ds7K6Fh9x/n76Z7lCLaxrecWdQMff1KBUjYUefxAqUnfglNL2Je+Z3Ae6Jj1sG
 wmykFuXQGXqtdOZXEETNcbXS7fjcCs1yhp+wr2JBBplJ8y2uTtm+M7Q2bhhBh3xLTJfh
 /yduR+5rHfF+8Df7hv7DEhQlrzhKGWwVZBUxV6Zzj7zhtJyLggF0KuU8Cf6+yaPNcysO
 OQFIB2uDzwa20r6n8GSEbjr2fXKIi8Y445/mYU0EuPd6TFpAp8BhYVA+IhAfX5aQdI7Z
 rBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Gj4J+B5iGnKsOwsF9h/fX8hbpbRCBs9B/CdgKeQjUk=;
 b=frSBeeZwI7Z+JovoAkVTdMwnd/xDXSBdhlK3oOHxw2aS0oaN9qmM5jXJ1HY51PkSL2
 0NOtVVs/m86NLn55ooX7ZkhAqL13Uy/K6RE94BNmA/mQXb2dW+iASJUEI98vymmk7vuJ
 Hkk+b5vxlgWAGo5ul5sOSU7dkXr3gDQmNUFGY0+j8mum9gznkSOlUYJ+RqIdOUaDnlub
 C5P7kRL/dsnRcF6dzwdEyodox4wVsiIxcwBJaI3jepr6EHCsjBex4m5VOC8NtTdmjC29
 QUhCal+WfdFVlBwCqaV/o8bwnL+BsnajOzPQpJuCvd1aI21WorYoxC71NJWr+BfSqAv2
 QAbA==
X-Gm-Message-State: AO0yUKXrpMMSUpHlmUPxFhgieAXpZoj2+WwNwsEzg4isk/wxcLlCM+Ja
 VllMCpyOyk6vROsQxoMO/3x1MUo69Miei/XbJnQ=
X-Google-Smtp-Source: AK7set+9mwf5GRPMulaedM2hkyubiq0hjGl780yo/ctXz+J0kqn0p5HkJm/SoBkQuQcmZuElsdvbNQ==
X-Received: by 2002:a05:6a20:8f0d:b0:b8:71b7:b903 with SMTP id
 b13-20020a056a208f0d00b000b871b7b903mr3989221pzk.31.1676935605303; 
 Mon, 20 Feb 2023 15:26:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 09/21] target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
Date: Mon, 20 Feb 2023 13:26:14 -1000
Message-Id: <20230220232626.429947-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
index c9585390d4..4bafe8340e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2864,8 +2864,10 @@ typedef enum ARMMMUIdx {
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
@@ -2929,6 +2931,23 @@ typedef enum ARMASIdx {
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


