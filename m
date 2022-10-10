Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775CD5FA076
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:50:16 +0200 (CEST)
Received: from localhost ([::1]:34470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohu6g-0000rm-6m
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkz-0006M0-0Z
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:49 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohtkx-0005Z2-AK
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:27:48 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so3428373wma.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2Cbe2RL9yMwjYDxnJ88DM/XvOfa2sAnKZm5Pr+E4U18=;
 b=I8AO2BQlGi0OFo2JbvQC05h1uDBvy1KJkfrLsqU61mW9L8CfUsboHqtDEUTDWtFYAY
 5UZdOZU0jkixWiW2CmOnYjkAnC8RcixZJVQY/VVlgVvsqE+iJQLQY356MHDauGDz0Vp/
 XSKkUU8ntXKUezIM911+uhVusEXxxs/76Eo6vwtRHTI4t9htPt5r8wTHlF7AH5zCBomy
 hd/3LiSFg3AEopbnBGT600GN34IEwYdLMBMMbjU7ulEfrlxr72b1Dtnvavm9Ju3k7t04
 r/v6yPaS5/5AGvuGHxXakrwjrCh5+kqbSwkO5tEQc5TTXq0ecifsqwYwU0XgNuLYCYPW
 Q74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Cbe2RL9yMwjYDxnJ88DM/XvOfa2sAnKZm5Pr+E4U18=;
 b=at8o/sNQg3GfYXYkj1vbp2pmf1lQNW+JfCN+4PE0b1IdazWQC+KQep9Io2DZ3QDknh
 SqPM4QXklguEbFn8EGkfbMqynArvnDVyCTyuwpmyG5tzLEYS5rS3Fs7wCh5rHu12Fykp
 xicsh4eo5yb13swpM+EpZ4XxOEyix83cp5U2EdaDFPHxUIPKdbkHwwosAJh8pNscda2X
 WjkUYoxRA2TXwbKMF9bM04WQRGLtLgGpFmCVqxLGt7DTnehuup7CUvSiOizgEqBUj0Sq
 sL0fUoVN/KZ3+vRAnBWLK7EwRN7NLITzvctlw55RHsORqtf4i7bYhX9OauBSxLJ4pgAM
 WOTw==
X-Gm-Message-State: ACrzQf0QKPm63DWeMU9woS6m7eJ6yFeEGoVrV1T1ghn+sTd0aaQcZZAA
 5A99jKTbUvEyI13lLV2Z10OO7qsTL9ExNg==
X-Google-Smtp-Source: AMsMyM542VePV3X48R53planE2U2xEg/uUkw9Gb/L0dcvpNlddFace0jNlz72pCeiBK67CsNt58hEQ==
X-Received: by 2002:a7b:c455:0:b0:3c6:bd0e:f9b0 with SMTP id
 l21-20020a7bc455000000b003c6bd0ef9b0mr2272212wmi.21.1665412066330; 
 Mon, 10 Oct 2022 07:27:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u6-20020adfed46000000b0022e04bfa661sm9037054wro.59.2022.10.10.07.27.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 07:27:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/28] target/arm: Add is_secure parameter to do_ats_write
Date: Mon, 10 Oct 2022 15:27:15 +0100
Message-Id: <20221010142730.502083-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010142730.502083-1-peter.maydell@linaro.org>
References: <20221010142730.502083-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Use get_phys_addr_with_secure directly.  For a-profile, this is the
one place where the value of is_secure may not equal arm_is_secure(env).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221001162318.153420-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8d82c147623..fd4663a9467 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3191,7 +3191,8 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #ifdef CONFIG_TCG
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx)
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             bool is_secure)
 {
     bool ret;
     uint64_t par64;
@@ -3199,7 +3200,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
 
-    ret = get_phys_addr(env, value, access_type, mmu_idx, &res, &fi);
+    ret = get_phys_addr_with_secure(env, value, access_type, mmu_idx,
+                                    is_secure, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
@@ -3371,6 +3373,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_SE3;
+            secure = true;
             break;
         case 2:
             g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
@@ -3392,6 +3395,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_SE10_0;
+            secure = true;
             break;
         case 2:
             g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
@@ -3407,16 +3411,18 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     case 4:
         /* stage 1+2 NonSecure PL1: ATS12NSOPR, ATS12NSOPW */
         mmu_idx = ARMMMUIdx_E10_1;
+        secure = false;
         break;
     case 6:
         /* stage 1+2 NonSecure PL0: ATS12NSOUR, ATS12NSOUW */
         mmu_idx = ARMMMUIdx_E10_0;
+        secure = false;
         break;
     default:
         g_assert_not_reached();
     }
 
-    par64 = do_ats_write(env, value, access_type, mmu_idx);
+    par64 = do_ats_write(env, value, access_type, mmu_idx, secure);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 #else
@@ -3432,7 +3438,8 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     uint64_t par64;
 
-    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2);
+    /* There is no SecureEL2 for AArch32. */
+    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2, false);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 #else
@@ -3475,6 +3482,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_SE3;
+            secure = true;
             break;
         default:
             g_assert_not_reached();
@@ -3493,7 +3501,8 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         g_assert_not_reached();
     }
 
-    env->cp15.par_el[1] = do_ats_write(env, value, access_type, mmu_idx);
+    env->cp15.par_el[1] = do_ats_write(env, value, access_type,
+                                       mmu_idx, secure);
 #else
     /* Handled by hardware accelerator. */
     g_assert_not_reached();
-- 
2.25.1


