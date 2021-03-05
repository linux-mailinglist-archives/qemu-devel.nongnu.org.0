Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE7A32F15D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:37:26 +0100 (CET)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIEOD-0005uz-Mr
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE3F-0006nS-CG
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:45 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIE2y-0007Uf-Qn
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:15:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id d11so2892244wrj.7
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XnCiRihLFPgzorHTXQSOLQQgG3ArJOGpdaT1dNvEzEk=;
 b=dDJX8SbgStvTTpdUTbgqZLRrK5uJvhz9OGTysagzTmc7+DsShLjfq20m1vSH1x+4zH
 GDufI0ozW2mAtCxwzf3C5suwKaVG8phrTGUpIQ4fZPAIEZOAf/YgWCIjwbhshbE8Ofny
 RgeyGmz+xNI/U4cQ2ol7BgSyRovceT+0QB9iYXWaBoVgGzTJkWXS2QnVOytgIoHupeNm
 XPw7NoNwpZDZeqBxQc64wAEEo0I59FUdS+y6z6AypRIB+C3DBiHoG/LEEcVLZNufkf2m
 BUshvpZZv1VvWZTx/gaNkW03j/pP/Nit85xg82ahjzrkM5uCjc8h3aictXnk82rsiJxQ
 bKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XnCiRihLFPgzorHTXQSOLQQgG3ArJOGpdaT1dNvEzEk=;
 b=rCRATbRkqJbiuCwsyelyw/ZnwPkYsLzW5E/tWYHFGscrrkzc+S+ljpS6FGofKJLAUR
 69X1WQQGf1GSXhg5YihuBX02gmArIDjlUTONa50ai8GwE0usy8deDwbGsfnY5K414n2D
 9JBW7NcxqgiDEWJGLVLx7mXqqsn0idplcaNe6uOp6GTqq3MP438nzlVIXohrvIRML2oW
 JSfMlQ+CPNwybV6wosxuw2ZAFRwQmzKk21Sdc/bPCxd8QeUFZS/M4n0s0ZwgpeCAjhCC
 mUDiPxA2YB64UF8KrvxdkgpDjIUYd0fHNPvYUZkOIxmPZrt/0gLyUP0Vk88w/8Cwv5uV
 heOw==
X-Gm-Message-State: AOAM532YOBuO1I12jq68oyAjo8jdyRw/ZuF1v+G7t7qNjabu5ta+i6as
 gIWTj7Hzo27X0tq7mmznYwO4fBIqsTlR1g==
X-Google-Smtp-Source: ABdhPJyIaTh+e2KnI79MDQ3+TyIhXuuHznc9Df3VTZWSpeVKILjJCYWgKRIGWrKCfOwu6Zl6BEOc5A==
X-Received: by 2002:adf:ab52:: with SMTP id r18mr10432940wrc.65.1614964527442; 
 Fri, 05 Mar 2021 09:15:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm5942357wmf.45.2021.03.05.09.15.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:15:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/49] target/arm: Use TCF0 and TFSRE0 for unprivileged tag
 checks
Date: Fri,  5 Mar 2021 17:14:39 +0000
Message-Id: <20210305171515.1038-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305171515.1038-1-peter.maydell@linaro.org>
References: <20210305171515.1038-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Peter Collingbourne <pcc@google.com>

Section D6.7 of the ARM ARM states:

For the purpose of determining Tag Check Fault handling, unprivileged
load and store instructions are treated as if executed at EL0 when
executed at either:
- EL1, when the Effective value of PSTATE.UAO is 0.
- EL2, when both the Effective value of HCR_EL2.{E2H, TGE} is {1, 1}
  and the Effective value of PSTATE.UAO is 0.

ARM has confirmed a defect in the pseudocode function
AArch64.TagCheckFault that makes it inconsistent with the above
wording. The remedy is to adjust references to PSTATE.EL in that
function to instead refer to AArch64.AccessUsesEL(acctype), so
that unprivileged instructions use SCTLR_EL1.TCF0 and TFSRE0_EL1.
The exception type for synchronous tag check faults remains unchanged.

This patch implements the described change by partially reverting
commits 50244cc76abc and cc97b0019bb5.

Signed-off-by: Peter Collingbourne <pcc@google.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210219201820.2672077-1-pcc@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c     |  2 +-
 target/arm/mte_helper.c | 13 +++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index fedcf2e739e..904b0927cd2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13170,7 +13170,7 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         if (FIELD_EX32(flags, TBFLAG_A64, UNPRIV)
             && tbid
             && !(env->pstate & PSTATE_TCO)
-            && (sctlr & SCTLR_TCF)
+            && (sctlr & SCTLR_TCF0)
             && allocation_tag_access_enabled(env, 0, sctlr)) {
             flags = FIELD_DP32(flags, TBFLAG_A64, MTE0_ACTIVE, 1);
         }
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 1c569336eae..0bbb9ec3463 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -550,10 +550,14 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
     reg_el = regime_el(env, arm_mmu_idx);
     sctlr = env->cp15.sctlr_el[reg_el];
 
-    el = arm_current_el(env);
-    if (el == 0) {
+    switch (arm_mmu_idx) {
+    case ARMMMUIdx_E10_0:
+    case ARMMMUIdx_E20_0:
+        el = 0;
         tcf = extract64(sctlr, 38, 2);
-    } else {
+        break;
+    default:
+        el = reg_el;
         tcf = extract64(sctlr, 40, 2);
     }
 
@@ -570,7 +574,8 @@ static void mte_check_fail(CPUARMState *env, uint32_t desc,
         env->exception.vaddress = dirty_ptr;
 
         is_write = FIELD_EX32(desc, MTEDESC, WRITE);
-        syn = syn_data_abort_no_iss(el != 0, 0, 0, 0, 0, is_write, 0x11);
+        syn = syn_data_abort_no_iss(arm_current_el(env) != 0, 0, 0, 0, 0,
+                                    is_write, 0x11);
         raise_exception(env, EXCP_DATA_ABORT, syn, exception_target_el(env));
         /* noreturn, but fall through to the assert anyway */
 
-- 
2.20.1


