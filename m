Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D59D5F1DAB
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:36:21 +0200 (CEST)
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefTQ-00082d-EQ
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHO-0006jh-Jn
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:58 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:38907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHF-0006GK-92
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:23:48 -0400
Received: by mail-qt1-x835.google.com with SMTP id y2so4343993qtv.5
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9SScwWFtisnAsN/gqU42XTsbKaa8LapqZEtG7W5lUds=;
 b=WDhhg8CYqKrrfbcDfM2mbSd2sZbhjaHTU5eyEx09ElS/0wx/B+LfvPdjEzm0gSc3fa
 u+GBoMNK6f/Tj1UNroYzbnTK1XrXgUrtYnKvdW2Lgmdjzrx/Pvg5gE6qM80hs4DCR6KU
 NmwrvJl2Kow1b9Pn1qwVRva6qj+lpuH7yYMZIHzbS03FrIfN9PfxGLfXV2v8Idltio+H
 vLA6xZns1LFYXBnNw5soaQbfkVSICGluWQebkbt9RVMIZWVUA9acrEYzPmN3AUWCyhK/
 HR9Id9DIGEMwQwLqHCFzUOUyqEzJAE/t59CsMTGVkOsOM9x1KRQDBpcUDqcawvFUNdt0
 B0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9SScwWFtisnAsN/gqU42XTsbKaa8LapqZEtG7W5lUds=;
 b=Iok1VAuVXSOL3p9MvRQuhwI57JsKnewO1lKpfI9dr+SNWc7DU9JofH3PixbNUY320h
 OncuzBrk1EQbaqvzL7Bjmw0Ejh6j/kUoqPzrulMjKg+QbIJig2A7HVVRD4GPPH17xQtu
 tUyB1YCw4pt1WBPJZJv86Zq0n43Kkjzr+uYyAhlSw/zy04DK9tyJHdGqbtz18Wf/iMVh
 hSxDYisP2f+EO35DRjFUCJK626FNQr+V2X9KOPXPI4i6q59yO9NMJM8Ih8ObHmS0bu6m
 Xs7eY2N5M0RFEyku8aabvuH6xAgh1yM0dLs+37I77dQfBon7RUaNJSjEJz5FZH3AnLO8
 4o+w==
X-Gm-Message-State: ACrzQf1qqgeTMOfNRDY2m/yahRL5u1c88nhT2aGY+U7UEex7i6zZZbjk
 awzjZcFdi+DCjNZSt8pkAXDvdiouZibfNQ==
X-Google-Smtp-Source: AMsMyM7xRw5t6uLkNoUSHtBD/6ofNKsW72eY+PU2GtmvtIuyNAt/UpuKDlVdlKAAUWmrlnJxifbTZw==
X-Received: by 2002:ac8:5790:0:b0:35b:fd92:6fb8 with SMTP id
 v16-20020ac85790000000b0035bfd926fb8mr10742059qta.53.1664641424338; 
 Sat, 01 Oct 2022 09:23:44 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 09/42] target/arm: Add is_secure parameter to do_ats_write
Date: Sat,  1 Oct 2022 09:22:45 -0700
Message-Id: <20221001162318.153420-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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

Use get_phys_addr_with_secure directly.  For a-profile, this is the
one place where the value of is_secure may not equal arm_is_secure(env).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 772218f0d2..3adeb4cab4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3188,7 +3188,8 @@ static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
 
 #ifdef CONFIG_TCG
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
-                             MMUAccessType access_type, ARMMMUIdx mmu_idx)
+                             MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                             bool is_secure)
 {
     bool ret;
     uint64_t par64;
@@ -3196,7 +3197,8 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
     ARMMMUFaultInfo fi = {};
     GetPhysAddrResult res = {};
 
-    ret = get_phys_addr(env, value, access_type, mmu_idx, &res, &fi);
+    ret = get_phys_addr_with_secure(env, value, access_type, mmu_idx,
+                                    is_secure, &res, &fi);
 
     /*
      * ATS operations only do S1 or S1+S2 translations, so we never
@@ -3368,6 +3370,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_SE3;
+            secure = true;
             break;
         case 2:
             g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
@@ -3389,6 +3392,7 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         switch (el) {
         case 3:
             mmu_idx = ARMMMUIdx_SE10_0;
+            secure = true;
             break;
         case 2:
             g_assert(!secure);  /* ARMv8.4-SecEL2 is 64-bit only */
@@ -3404,16 +3408,18 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
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
@@ -3429,7 +3435,8 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
     MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
     uint64_t par64;
 
-    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2);
+    /* There is no SecureEL2 for AArch32. */
+    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_E2, false);
 
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
 #else
@@ -3472,6 +3479,7 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
             break;
         case 6: /* AT S1E3R, AT S1E3W */
             mmu_idx = ARMMMUIdx_SE3;
+            secure = true;
             break;
         default:
             g_assert_not_reached();
@@ -3490,7 +3498,8 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
         g_assert_not_reached();
     }
 
-    env->cp15.par_el[1] = do_ats_write(env, value, access_type, mmu_idx);
+    env->cp15.par_el[1] = do_ats_write(env, value, access_type,
+                                       mmu_idx, secure);
 #else
     /* Handled by hardware accelerator. */
     g_assert_not_reached();
-- 
2.34.1


