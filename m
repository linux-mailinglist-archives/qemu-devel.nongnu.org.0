Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513A475792
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:14:15 +0100 (CET)
Received: from localhost ([::1]:47580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSEg-0005Dm-Be
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:14:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRia-0006s3-M7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:04 -0500
Received: from [2a00:1450:4864:20::435] (port=34465
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiW-0008R7-O4
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:04 -0500
Received: by mail-wr1-x435.google.com with SMTP id s1so3230779wrg.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EbvaOheGHih9OZWQqKwYHdzxPCbAj4qvSl18sxhGpuI=;
 b=Se1jAZIVjSGoKMcURUBUghG8aaEDvTh4KjsjWxy3Yz3mJM+wi7VV0TqomkwIK7MFu1
 Cibj6QYEfUrNJ7JwU6SW2V6vJVe0n6tC6D2c/3ByF+1eIJeL5gMTSyAUp2xvSoSqtFgz
 l6XIwCQLhtn3fMWbILkhyyn3xqUPQb3jgxcOcpalF+YIshqtRdgztsKvxzhxWpXtIBNp
 BJK9qdspadUHUXbooxhPAxi+8O4X3GCebv9PA8npKlNBU9R9nSuLfzX1hMmOJzHwwaMW
 cbGVj0xewVfxoUokRCxmVwz1UCyikC3nkQvAYHwaAOee9dSrzIM/vBd8Fn5k4js7JmHE
 iHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EbvaOheGHih9OZWQqKwYHdzxPCbAj4qvSl18sxhGpuI=;
 b=TPIfK/jBTzFuM2V71KLPBa4U8guCbdYaeZTkz04f7cPhTEw5qxkPrP0ZAzT+2S5ttj
 XxSYpM/Dq816tQOeTF6wH1vKXUstfQI5AeZmo86hprI+eczmo+e84ZrMjoL7zDV3u82t
 dtIWGd4hk+ViKErx7PIAsvBEQRiYgFiZCGwLqvTzXMcToxj4Bc/4mj4GJLIatqWE5XFS
 Tqtf94C2w6LPcCh0n7iNhPcel2DY9hxJIaXS8c0Wi4SGEjB1aoQu9Cez1SGzoKeMCIJw
 YBzHguvJIhUAwCHwZBKECZzedUtD8/WxwvBPsNwN70yq+ozSHDQ73rt7q0wdU+SmmR2l
 4knQ==
X-Gm-Message-State: AOAM531Ljf/d4rJmyYiaCb/WGt95stAaunlHZwnGEa2CldUkguKIz8Ai
 OUt4IO2FMSm7/c8CQdpqHd6hbAHlJwC+Tg==
X-Google-Smtp-Source: ABdhPJzB37kmibb6LIWFTdUDXI9D+MT1FTw6k3N77nGoV/VwUmsNOv0hV1I4n6mOH45KDY5K17HtaQ==
X-Received: by 2002:adf:dc44:: with SMTP id m4mr3828848wrj.550.1639564858828; 
 Wed, 15 Dec 2021 02:40:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.40.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:40:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] target/arm: Split compute_fsr_fsc out of
 arm_deliver_fault
Date: Wed, 15 Dec 2021 10:40:30 +0000
Message-Id: <20211215104049.2030475-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We will reuse this section of arm_deliver_fault for
raising pc alignment faults.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tlb_helper.c | 45 +++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 12a934e9248..4cacb9658fb 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -49,25 +49,11 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
     return syn;
 }
 
-static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
-                                            MMUAccessType access_type,
-                                            int mmu_idx, ARMMMUFaultInfo *fi)
+static uint32_t compute_fsr_fsc(CPUARMState *env, ARMMMUFaultInfo *fi,
+                                int target_el, int mmu_idx, uint32_t *ret_fsc)
 {
-    CPUARMState *env = &cpu->env;
-    int target_el;
-    bool same_el;
-    uint32_t syn, exc, fsr, fsc;
     ARMMMUIdx arm_mmu_idx = core_to_arm_mmu_idx(env, mmu_idx);
-
-    target_el = exception_target_el(env);
-    if (fi->stage2) {
-        target_el = 2;
-        env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
-        if (arm_is_secure_below_el3(env) && fi->s1ns) {
-            env->cp15.hpfar_el2 |= HPFAR_NS;
-        }
-    }
-    same_el = (arm_current_el(env) == target_el);
+    uint32_t fsr, fsc;
 
     if (target_el == 2 || arm_el_is_aa64(env, target_el) ||
         arm_s1_regime_using_lpae_format(env, arm_mmu_idx)) {
@@ -88,6 +74,31 @@ static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
         fsc = 0x3f;
     }
 
+    *ret_fsc = fsc;
+    return fsr;
+}
+
+static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
+                                            MMUAccessType access_type,
+                                            int mmu_idx, ARMMMUFaultInfo *fi)
+{
+    CPUARMState *env = &cpu->env;
+    int target_el;
+    bool same_el;
+    uint32_t syn, exc, fsr, fsc;
+
+    target_el = exception_target_el(env);
+    if (fi->stage2) {
+        target_el = 2;
+        env->cp15.hpfar_el2 = extract64(fi->s2addr, 12, 47) << 4;
+        if (arm_is_secure_below_el3(env) && fi->s1ns) {
+            env->cp15.hpfar_el2 |= HPFAR_NS;
+        }
+    }
+    same_el = (arm_current_el(env) == target_el);
+
+    fsr = compute_fsr_fsc(env, fi, target_el, mmu_idx, &fsc);
+
     if (access_type == MMU_INST_FETCH) {
         syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
         exc = EXCP_PREFETCH_ABORT;
-- 
2.25.1


