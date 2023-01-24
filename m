Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0416B678C8D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:06:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kQ-0000Qy-DI; Mon, 23 Jan 2023 19:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kO-0000Ns-4R
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:08 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kL-0001uO-AA
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:07 -0500
Received: by mail-pg1-x52d.google.com with SMTP id d10so10220420pgm.13
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M9rvIn/r4gTk2g6Wh4QamIsNWYaqsyCXrvrErQwB2/A=;
 b=CdJI//h/XGjUavbRSiEhpoBZ9TOuVC/w0h1hXXeSuZjghGtZp/1p0hQsL+zJqL6Jmp
 wu8kuIQwrSkd0iK2ubUVV6B4++5MMs6IMYjbsz6Kc9f2HqxwRTuLJI5bC6vh+K0kiIFY
 q/uNQZxzl50ut+5lWf5SGNFHfr5/a5k2m7+kc7/dCcetp5MkGIC+Bquffta1OCOqZ2EU
 lDa0f+FKjylDipukxQ1iCWkyrNqQ+aF5Dl6lhUdQbmz63AhiN5+paXbkd1CTvMp8ea74
 cogrSo+pwh7C815EF+vRsK0Ej1EfAkcLztQ3Z3sZWM4DaamPv0Iedr17WnktAsU82PsT
 Av5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M9rvIn/r4gTk2g6Wh4QamIsNWYaqsyCXrvrErQwB2/A=;
 b=pphAy4OsrqG1cCY1B0C+sgogV8Uyk/kUDZK/WFnerEuudodT0dfPvAgV58oggFxfix
 bgMyzbLp5Arbo2yv85Yy/u3q6cl7k3ZiY4ZqbRXff5/11TmGRHGuqXeH7/TKYW4fcPnB
 WmZAL06XI5g4VztnjgBz+MyxZkpPOMiG+TnI/YtxoIsolYnK4P/BrdoaSBQrGYLAQEcw
 sI1wf46hlU34ZdrN2Gd064dTmXgfM0JNWZfD0dv98+WCy2y1jb6G8By/6Efm0MlRH+B7
 RiktpSlwyiEq2mPY4gPq9l6F8m/i6S7E+mz52VIiSnKG6iFFKhYQ79NPPXx38YHcu8Kt
 fpdg==
X-Gm-Message-State: AFqh2krMh/sXTAD3T89kwtTDfS/kCQWtCMH0Crcr7EUXPe/BNY7URFjo
 o4FL5I8WZsZ5mSpch7Gv+aoVwTvU4aqYzgu7
X-Google-Smtp-Source: AMrXdXs71EZv9CSKvk4hxMOi8A0tsl8H+YbmyZJo8itSVyej2GbXXnfeCqAhf/GwH2TETWfB6+DyZw==
X-Received: by 2002:aa7:9892:0:b0:583:4126:a09 with SMTP id
 r18-20020aa79892000000b0058341260a09mr26122410pfl.21.1674518463977; 
 Mon, 23 Jan 2023 16:01:03 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 10/22] target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
Date: Mon, 23 Jan 2023 14:00:15 -1000
Message-Id: <20230124000027.3565716-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h |  2 +-
 target/arm/cpu.h       | 17 +++++++++++++++--
 target/arm/ptw.c       | 10 ++++++++--
 3 files changed, 24 insertions(+), 5 deletions(-)

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
index 0114e1ed87..21b9afb773 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3067,8 +3067,10 @@ typedef enum ARMMMUIdx {
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
@@ -3132,6 +3134,17 @@ typedef enum ARMASIdx {
     ARMASIdx_TagS = 3,
 } ARMASIdx;
 
+static inline ARMMMUIdx arm_space_to_phys(ARMSecuritySpace space)
+{
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
index 59cf64d0a6..49b8895a4e 100644
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


