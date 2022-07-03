Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9025645EE
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:49:58 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vIj-0001Cy-Vs
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvA-00081j-Rh
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:37 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:50989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv9-0006AV-Av
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:36 -0400
Received: by mail-pj1-x1029.google.com with SMTP id go6so6629472pjb.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMzc8ik2WaalfDjtAiTiJK+N4oOIk3ZEdYeq0p1CiQs=;
 b=pJZzEUNhu6evPQEA1E/wOE2O9oGgNa/7QzzT0LKPZVcs1zoLgfBwT8/gwYO/GWkxrd
 zXeFd5NLCPx6St5HUOMq13N0XBqo5pAFHQ0ZBSqDcVeGJEibvosPG+skA0r+0VxR5I0N
 hUy/KRJ8bhYMDShS8Xw1OoDeumR+/kfQpToQT5aOZ6S/8hnXdSAccOGKNkua0a3Lb7nK
 eZLyvI/r8oG2vJ3TkqOIPCtgt7S0K8Op5W3aLpj4+8oPyTuLLnRoNuiTIklMqL3kmoiY
 Q4pnz5sQgwcKUTLDN4RDZ1wgnchwo58Xx1Z8rcEeu/Nqw4/OXHRlqgBjGJdegN/sYP74
 jT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMzc8ik2WaalfDjtAiTiJK+N4oOIk3ZEdYeq0p1CiQs=;
 b=6CUcc8hq5Il19wHtRd5ED2LQ/ixyqw2jofwP3xaj51H1AAcI/Z43AM7XY4hJAzwA22
 dQhQ6Om840ozjbYfhQy5tM1Jn9kYxayfixGBJfFWOMbHfTVmcilBRAA76MRJWpwg8ag6
 TFLk1trD0bD3INHOY8X3W2za6u9QTODUytsRU1dQXSlHfENSu3jN76f490vaicUJeaKY
 kPf/xP4Uo9vV/r7wyl2nBnwlBAIM2nRCNhE+NBLvr+Jyd3RKBqE6Bcp5OiDX8ln5QEmP
 W4xATauEWxY3YSu+C2ammmbJqSLOD8CVenPNb4i72txaLp/fDUKL+BfCbKR4iPtqI0lH
 8miA==
X-Gm-Message-State: AJIora8KYd4kRPVVNCPaMfYjrl3aM3iHK1MNo7X4bfrNkMuct5mu9MGb
 ZrH+DFMoHvCat3D8Z69ZcS9MF2WPWmkFYG6G
X-Google-Smtp-Source: AGRyM1vRse0YxqBvGx1Y6HJ9jq3pWjJb59o9MSOh2uYhARFpCScKdsGn/w5wvMjk3qmGiwUjo/2nLA==
X-Received: by 2002:a17:90b:3b4a:b0:1ed:38a0:d45f with SMTP id
 ot10-20020a17090b3b4a00b001ed38a0d45fmr29549330pjb.87.1656836733988; 
 Sun, 03 Jul 2022 01:25:33 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 22/62] target/arm: Add secure parameter to get_phys_addr_pmsav8
Date: Sun,  3 Jul 2022 13:53:39 +0530
Message-Id: <20220703082419.770989-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the use of regime_is_secure from get_phys_addr_pmsav8.
Since we already had a local variable named secure, use that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index d424dec729..f7892a0c48 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1960,10 +1960,9 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
-    uint32_t secure = regime_is_secure(env, mmu_idx);
     V8M_SAttributes sattrs = {};
     bool ret;
 
@@ -2408,7 +2407,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.34.1


