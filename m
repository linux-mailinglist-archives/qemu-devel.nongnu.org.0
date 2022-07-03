Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A580564609
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:53:10 +0200 (CEST)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7vLp-0008Ff-4k
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvR-0008R8-JA
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:53 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uvP-00068p-To
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:53 -0400
Received: by mail-pl1-x634.google.com with SMTP id l6so6001679plg.11
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HoZLv2+HUiSgRn8yhxEf96NQZLTisYlzO31dNJIvCns=;
 b=F3xXxFbSkfqe1hxOLk3LUcYR/RR44tqnVAH5Ot5sr4R+iiKg7xdXdIOMPxOgXNcThC
 OWSjmyScf4UQBVp/BWF0c8AfoF3yz1IzgzGtuXZJnrnlBGNncfGRn6bNsSP8LZ6/CB60
 TCUXvEDRKu4FDmg+yZBECMowZ7QELYw6EaMb0/Scj6JY8EurTnAYvBX3Vuem13pyowpf
 FZBHusbMw4tq2qbFKjRzRMMrhlgwDTbHbTQGnNwYl3diI6YuODx3+fZ6iWlTSxPAMVJG
 Ij1ot5uo1YlKaynDcrniKnPjeJ0VEsaVOb9HUNEDTEmcbtxzVbZooXEEC2OorvSqaPIR
 utdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HoZLv2+HUiSgRn8yhxEf96NQZLTisYlzO31dNJIvCns=;
 b=Ezflh0dPlxRgFrna6B1BsT0uBAl2n1fg7IUEaaVGIzntJ9sp+yWMoMOPUi0YZD+IBO
 OPSa/rF06olSKEVWTOrSI1Cvlp8rfTBKLUL4KPWxGerVAYGKIONOh7/bRy3cut2zBx6P
 V0Un7qzml39yczZhaBO711Zf9VnJjfBresapKSCoIW5L0466gBZNfw12SJlBYSGJn5hZ
 lhBdNuhq1LNP+k99rSem4gDEj3FBJp46oEuM5f+LwopvNjLCKE+nNc+A5Dj/raL52/te
 fwOd76q4dDhMH2paI8bM+Mvlk56FEANT0nanjfvrU7gJzIYaxyRAE+poBjyS7I/SbQYA
 uWaw==
X-Gm-Message-State: AJIora8l1T0aQPI/1NvHawCKnqnzqlKu6Y+8BoHyS+AQIUw2lJIPWVJv
 jshuDFBL02RL1NQRUAew8X8kV4LQx4sqWb6X
X-Google-Smtp-Source: AGRyM1vhNwJIhVNsdevKpfHGf1YRZmeDz96vptyG1XjcTpMFw02m4ktNJV4QnyMN2UOTw/A/oHSulw==
X-Received: by 2002:a17:90a:4f0f:b0:1ee:f746:eca7 with SMTP id
 p15-20020a17090a4f0f00b001eef746eca7mr28693718pjh.122.1656836751140; 
 Sun, 03 Jul 2022 01:25:51 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 28/62] target/arm: Split out get_phys_addr_with_secure
Date: Sun,  3 Jul 2022 13:53:45 +0530
Message-Id: <20220703082419.770989-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Retain the existing get_phys_addr interface using
the security state derived from mmu_idx.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  6 ++++++
 target/arm/ptw.c       | 21 +++++++++++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index f75ac2e1b7..81c386ee15 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1136,6 +1136,12 @@ typedef struct GetPhysAddrResult {
     ARMCacheAttrs cacheattrs;
 } GetPhysAddrResult;
 
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type,
+                               ARMMMUIdx mmu_idx, bool is_secure,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+    __attribute__((nonnull));
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 340f73997a..b25e3a8c87 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2279,12 +2279,12 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
  */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
-    bool is_secure = regime_is_secure(env, mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2300,8 +2300,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
 
-            ret = get_phys_addr(env, address, access_type, s1_mmu_idx,
-                                result, fi);
+            ret = get_phys_addr_with_secure(env, address, access_type,
+                                            s1_mmu_idx, is_secure, result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
@@ -2511,6 +2511,15 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 }
 
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+{
+    return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
+                                     regime_is_secure(env, mmu_idx),
+                                     result, fi);
+}
+
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
-- 
2.34.1


