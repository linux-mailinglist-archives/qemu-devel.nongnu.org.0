Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3891A6E8F1C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:06:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAG-0000ej-TX; Thu, 20 Apr 2023 06:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAC-0000bq-TR
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:16 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA6-0003s2-V8
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:16 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-2f625d52275so443106f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985107; x=1684577107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=voz5szJvZiVSo8m5NzDOi1MHXMGYIWpvcJhNz8W52IE=;
 b=VSojBVv43AvqQHm7tNBYgxHL0kyWMt2+f0Sd/1xYRoMbtK7wTZOHpVsMr5Klrts6Dv
 oD92ZlUkVmI9sM3OhWSMk97VFOxHi0Byl7UCiwnURdbSN1pHI6H9BqNnFA/zv180hkv7
 inms4NI0JOySoQGh7AZ83aFp+7bLMnjDbqYyiXALwH4SQwlerDT1QIPFetg6SEQxHrI3
 mCm/1YuS80IL9FnuQvKelAij6OC29aNbEujuOyuowYum4EzRjVeRWAj/kIWRQbKCxIII
 onSD/yMZm5TPq9NHcc04ni2qszUFYyCX1xI+bnqJsy3H6blKlEKHKlvhNZqhxXAtKgYZ
 Ws4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985107; x=1684577107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=voz5szJvZiVSo8m5NzDOi1MHXMGYIWpvcJhNz8W52IE=;
 b=LxTVKvWXd3esFwfHtBNl+zB2KHEYtlQqSHhL0s5pzaTLCfxf4CKbDLe0iZqGHQ/9A8
 3QgEaX7VPvR9vXeyavQHv/gNyqRgJJud/C91fM7jxjUYDi3u3vNA10JgBAtCHQBBuccs
 tEAuUT5tV+zRuIorFNm//DDBfZV5pJZ6ufGP6Yvw5Ybo1LkKRhXp/Sbdlxec6qa+oIzG
 o/5CCS8H5kxG6oepkN+Xy/mNZb2OFN1cLHYpGzWUXIw6Kej+07QW6BxROA1u56KHLhaQ
 78zsJk78Z0r59G5RZCFETkqGoffj/fs0p5lFAoereVVigwqTMfKxeYvk/NWQkFdJjlGN
 9dWA==
X-Gm-Message-State: AAQBX9cnmcc/Zq0FJyJU1K6Wr0pk+WrQ8uQHA2NImS+mmD6A4AfLmVKj
 8+HgNwbCk+2nlYeG/Cf/lus+X8xk1NCwJT2/w8Y=
X-Google-Smtp-Source: AKy350ZOeapDdXq4/plhglRjiStdhnapziv4G9nyNM6ZEkeD6mX2102Cwa3BCy3Q72IQbqRo5/THnw==
X-Received: by 2002:adf:de91:0:b0:2f6:a7a:1ded with SMTP id
 w17-20020adfde91000000b002f60a7a1dedmr938376wrl.30.1681985107124; 
 Thu, 20 Apr 2023 03:05:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] target/arm: Implement FEAT_PAN3
Date: Thu, 20 Apr 2023 11:04:49 +0100
Message-Id: <20230420100456.944969-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

FEAT_PAN3 adds an EPAN bit to SCTLR_EL1 and SCTLR_EL2, which allows
the PAN bit to make memory non-privileged-read/write if it is
user-executable as well as if it is user-read/write.

Implement this feature and enable it in the AArch64 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230331145045.2584941-4-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  5 +++++
 target/arm/cpu64.c            |  2 +-
 target/arm/ptw.c              | 14 +++++++++++++-
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 2062d712610..73389878755 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -56,6 +56,7 @@ the following architecture extensions:
 - FEAT_MTE3 (MTE Asymmetric Fault Handling)
 - FEAT_PAN (Privileged access never)
 - FEAT_PAN2 (AT S1E1R and AT S1E1W instruction variants affected by PSTATE.PAN)
+- FEAT_PAN3 (Support for SCTLR_ELx.EPAN)
 - FEAT_PAuth (Pointer authentication)
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c097cae9882..d469a2637b3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3823,6 +3823,11 @@ static inline bool isar_feature_aa64_ats1e1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, PAN) >= 2;
 }
 
+static inline bool isar_feature_aa64_pan3(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, PAN) >= 3;
+}
+
 static inline bool isar_feature_aa64_hcx(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HCX) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0fb07cc7b6d..735ca541634 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1302,7 +1302,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
     t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
-    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2);      /* FEAT_PAN2 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 3);      /* FEAT_PAN3 */
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
     t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 1);      /* FEAT_ETS */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6d72950a795..bd75da8dbcf 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -947,6 +947,7 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
 static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
                       int ap, int ns, int xn, int pxn)
 {
+    ARMCPU *cpu = env_archcpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
     int prot_rw, user_rw;
     bool have_wxn;
@@ -958,8 +959,19 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     if (is_user) {
         prot_rw = user_rw;
     } else {
+        /*
+         * PAN controls can forbid data accesses but don't affect insn fetch.
+         * Plain PAN forbids data accesses if EL0 has data permissions;
+         * PAN3 forbids data accesses if EL0 has either data or exec perms.
+         * Note that for AArch64 the 'user can exec' case is exactly !xn.
+         * We make the IMPDEF choices that SCR_EL3.SIF and Realm EL2&0
+         * do not affect EPAN.
+         */
         if (user_rw && regime_is_pan(env, mmu_idx)) {
-            /* PAN forbids data accesses but doesn't affect insn fetch */
+            prot_rw = 0;
+        } else if (cpu_isar_feature(aa64_pan3, cpu) && is_aa64 &&
+                   regime_is_pan(env, mmu_idx) &&
+                   (regime_sctlr(env, mmu_idx) & SCTLR_EPAN) && !xn) {
             prot_rw = 0;
         } else {
             prot_rw = simple_ap_to_rw_prot_is_user(ap, false);
-- 
2.34.1


