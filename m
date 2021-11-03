Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 268D8443C21
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 05:11:26 +0100 (CET)
Received: from localhost ([::1]:60880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7cT-0004Ur-AL
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 00:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VL-0005FU-QZ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:05 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:42687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7VG-0000ul-U6
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 00:04:02 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id b17so1481663qvl.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 21:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ML6fKNTEkgsDPbAJVxy09+sBxdECZjbfdFlmno/fZac=;
 b=Xcg/YGsm08ZEMuXvNc00sTULLbwxqvhKV38+Fbbr6CM67bzKPqOePfI3jQj17EFE6Q
 6SkbAHsFjMdhaXHlzOjEXJ4MxAgBdSpOwJWsIh3IEl2mR+LF+s3ljeXshn7YX9Yh7yu9
 1CAGjiVaHk/lHBmjwjtgTBJLtc/sm8XrSExZ7HyiNPwHlC2LgT+dM7/q861TGSjW+86O
 MhxE5P7S81Jp0gdAUvYX4eNL8LLRiCzfGSQiD/mioeFbQ9IZ3IumrtaVE0mWMBDqW8Bg
 IXeBIndqPoOQA+bbKB3+liaTuMOjX0sddO0aN/+rS2bI7hK/+6S0hiGx2DgO6S69/AkH
 ynWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ML6fKNTEkgsDPbAJVxy09+sBxdECZjbfdFlmno/fZac=;
 b=VQTYmlnXJmLUwhk4642CE4/yEkxj6keTwdj+1jvbd6MAmgrHhN0QV9nqbA/a+P7iOb
 dgpu0kMb8PH2P1klwwNY8W5qdKwpimIZmlqcpPhzwS5CMCPk7/EGk5jTYb492hNeY3VX
 MMU6o5PJtwprnWVSpVgYWcQGY+n1f7S44mDW+OY/Becrg8r2oD/yht2wkWwv4ntgR6U9
 V0e86ryHJQMiu1+9nYBhr4w/WNMJvTcu9QUDTi9+7xlPOTtbbRT0QLEDYdmELOywR8qk
 eckcr+TJgHWlku0kOxrGEcJTqew4Ql2kMZCj5hkWj1o6uQ5YkuZTzQsbEYaxT6Ubqj6+
 7LmQ==
X-Gm-Message-State: AOAM533MCdeG1q4xbF1dpB8+Id8abDDCx4ocB+lBKALx02N53FbBpYU5
 TnqkcRiQ8Bmmo8o6vlOZjhUJIgrEOZv/vg==
X-Google-Smtp-Source: ABdhPJxD2AbZNG790Od1xx9ql5eGyF+oBy6LSDSaRI/vvM1rqrYr12P4L/eEJhp0LNjZ5MfV4j2pWA==
X-Received: by 2002:a0c:fec7:: with SMTP id z7mr27995512qvs.16.1635912237981; 
 Tue, 02 Nov 2021 21:03:57 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id br20sm730408qkb.104.2021.11.02.21.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 21:03:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/10] target/arm: Split compute_fsr_fsc out of
 arm_deliver_fault
Date: Wed,  3 Nov 2021 00:03:48 -0400
Message-Id: <20211103040352.373688-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103040352.373688-1-richard.henderson@linaro.org>
References: <20211103040352.373688-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will reuse this section of arm_deliver_fault for
raising pc alignment faults.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tlb_helper.c | 45 +++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 12a934e924..4cacb9658f 100644
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


