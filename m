Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BFF564608
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:52:51 +0200 (CEST)
Received: from localhost ([::1]:47688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vLW-0007Ir-Ml
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvI-00086b-0C
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:44 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvG-00068N-Jn
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:43 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e132so6255407pgc.5
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TKxPLdADuP+9Wny++zRwM0SIOJMxWQvaLP+5vkpY9No=;
 b=b9pIIYQVgizkZFuPY7R9iz9m/b+NrgzmZ13vHVVS1TsFeblNOzZUnMY0ZDo6Yx11ZY
 +zawq54DqhU0UpYE7UJNEIX5qzT3OH3zUZChIOto8r67ocyLmd27UtWokh8Ly5eZytD/
 mGtr1ozqLKHRCbhNsZWdjroa8RrXH6cYoxClTAFktP6Wy4HjF9aZiEPAqW0O/FLR2uA0
 F2us+XTTpPpIp7Xl/iA9ITbNCAv6WFgWQFwrot6ffgefOfDpSvN5ulqAY1uHNBWCuYny
 Yb6g3fWRs3y2DzvL1w3R+K01GfCWpo0mDvO/WsClzv1j1r3juTqwSSisoLrbtpPopO8l
 W98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TKxPLdADuP+9Wny++zRwM0SIOJMxWQvaLP+5vkpY9No=;
 b=zqwvg5m2Qma23mDY6NOccuzM/0XMKbH0DAUIL6m5DeuEtAl8beRnyKRtpBakxcYbvP
 saNA8WBsMp5DzYrlrd+7XyzjZXWIONKLLtS3gOxstXudKFTpPY7ZygABjzxXpspHbJuH
 TBKk30Ki1bdyGb7uvfRgJr+2QuuhBJfmHp6N1AkwRN/RW7PelBo+x8/Bea1Roh5QoWOD
 7D4fgcqXlNiWEY2bNqfTTSZwhzMtLmgg7ugmMdnO+iiPPjEGn+mNmP+SU+wB84GxS+lH
 xdMwDRhF1EhQaQw8AKKv8TRhHHYrjjJPCDkAQ21puTT4M0ZcPt8zshQjzK2x/dDJqCPb
 I36Q==
X-Gm-Message-State: AJIora+S0gSjqWZ9kEBYwszOUP+WtaLutzpQVJdUpFUWOGqnQCQoDLbH
 oYfjyb38siRzDtdjgUw+2nXPJXngOwAnMPLM
X-Google-Smtp-Source: AGRyM1vf5kWnGtY+wHLgIs2SXgLAVXaURnUqf3ac3HSSbyxcsa4R1wo/HywHp7AR9lwlmvpb2zMvRA==
X-Received: by 2002:a63:4759:0:b0:412:434a:1192 with SMTP id
 w25-20020a634759000000b00412434a1192mr75732pgk.602.1656836741856; 
 Sun, 03 Jul 2022 01:25:41 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 25/62] target/arm: Add is_secure parameter to
 get_phys_addr_pmsav7
Date: Sun,  3 Jul 2022 13:53:42 +0530
Message-Id: <20220703082419.770989-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
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

Remove the use of regime_is_secure from get_phys_addr_pmsav7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b883826643..33fa8f094b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1506,12 +1506,11 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
 
 static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
-    bool secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     result->phys = address;
@@ -2411,7 +2410,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-- 
2.34.1


