Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C765F1DDB
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:50:43 +0200 (CEST)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefhK-00046K-GM
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHb-0006lK-FL
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:07 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:37498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHZ-0006Gt-ST
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:07 -0400
Received: by mail-qk1-x72b.google.com with SMTP id s9so4542409qkg.4
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LeO8wVc8x9qKMAPYpXMUEdsFvPVUI/smjTgJR5ckIew=;
 b=cBXj6+j56XUXm/Eq9UNrfPJ/f3BwV/G1hLpwcIJi3cmGGiyKeYE86AoWug+/XYxm6K
 eW2pwWcswEIFtfQzl9ZQSSrZkMla8IkQIbFkkloplC3rKRcBZSN7834pQ356HiTO3M/F
 GosCzdvOWPtXXR2Ha4veEKWOOQBSaEStMXVdckBSbEAc5aHGn4EVDUm55wvXvbcgiXeU
 GolRxoRSjcN6dlB/ApKp8QV7VFX5GfbuK1IalcxlfQaYVfeeuBylifeAfPbFn4IFadJ1
 1r2FL28jmydKDLfOOq6SwaBM+ft6dgw7/DkyYdh4JFuXbvPreRkFE96MMnRlQoleeIdF
 MQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LeO8wVc8x9qKMAPYpXMUEdsFvPVUI/smjTgJR5ckIew=;
 b=8ONUa66nVLHEOzzaz4srbXxrDM2yMNBZ5NxMz21InLmFG2fMiXh4SzzsAiobkGztDP
 gzWqcnx1m7GX2hFro0iFFgRAK/bEhiOXvxx33ciw7An5qwCll7iZgruudcymizXiSEeB
 IM0liIT5SnfvE36f2jMdJV95OHPnUC3hIyNErfcBVB9uh2VrRVYacAxqGhM7ISztuVU8
 1DG0MRdGnol/mOVh4nNl3nkcYh4IpT0cdQ3FWPcrMR7sY5qNbqIEjq3wC4Z36GEyyNU8
 b/LsM6BFyiRyD5StdD/Q6PItyZ2REMwF0LSL0rhlJ/+WNS12RMT/onZLCoMUwRdpigRw
 EVDQ==
X-Gm-Message-State: ACrzQf2bR5hMAOSC9SvdWcceTEMf7cW9nCYjBGrUIWY1s18pU8brDoa8
 /h9gGlPPHYUACl9o9XShe8o51Hzkkswv9Q==
X-Google-Smtp-Source: AMsMyM7AIs5S4FEhSvCCCNWmiWY3uESiBemXe4qpxyZJnxyvv/WZMBObXDXoLw8POhw8e3dj028Hyw==
X-Received: by 2002:a05:620a:2406:b0:6cf:38fd:654b with SMTP id
 d6-20020a05620a240600b006cf38fd654bmr9842558qkn.417.1664641444770; 
 Sat, 01 Oct 2022 09:24:04 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 17/42] target/arm: Fix ATS12NSO* from S PL1
Date: Sat,  1 Oct 2022 09:22:53 -0700
Message-Id: <20221001162318.153420-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use arm_hcr_el2_eff_secstate instead of arm_hcr_el2_eff, so
that we use is_secure instead of the current security state.
These AT* operations have been broken since arm_hcr_el2_eff
gained a check for "el2 enabled" for Secure EL2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a0dce9c313..7bf79779da 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -146,7 +146,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    hcr_el2 = arm_hcr_el2_eff(env);
+    hcr_el2 = arm_hcr_el2_eff_secstate(env, is_secure);
 
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
@@ -230,7 +230,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
 
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
@@ -2341,7 +2341,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            hcr = arm_hcr_el2_eff(env);
+            hcr = arm_hcr_el2_eff_secstate(env, is_secure);
             if (hcr & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
@@ -2474,7 +2474,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
         result->page_size = TARGET_PAGE_SIZE;
 
         /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         result->cacheattrs.shareability = 0;
         result->cacheattrs.is_s2_format = false;
         if (hcr & HCR_DC) {
-- 
2.34.1


