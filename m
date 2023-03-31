Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B16D2307
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:52:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piG5i-0000b3-Bx; Fri, 31 Mar 2023 10:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5d-0000a7-4i
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:50:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1piG5Z-0000bl-9O
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:50:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e18so22690624wra.9
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aMsJpOiutF8EzuYcJAT/HhM6ChC4opwqxSHP+TBtq/M=;
 b=nwn8Qs8JNNLY3nGW4c4MGpvxPMJJO3q7h9TngWbPGG1PUcpVET5Zry4Xz1TcEA4RmR
 AHu5tP6X1XcPQcZJ6Zs8sO/htvUGIEpl9+03+6ixRiYDcpJAbbuKIFwEz6RSb6pjJ4Bh
 7/rYw7nB3VA8EWq4f7S3slaKaP39hL02SQnWmO0OMh+VBy+69gOaAbRs46LMjW1R2AVr
 CxXAOcYvSCbcAURTXRr1B/cSVEQXsXY8O3Wdxcww2P8f3q4rTfH+rHG3bXHCdWkDsbb5
 QjX/qGZzlPznbIumCha+sqzQUNNYIe3UNbZOXxhH6DjmJ/5xjg+N0ZtgRWg85ZiMqBxI
 F30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMsJpOiutF8EzuYcJAT/HhM6ChC4opwqxSHP+TBtq/M=;
 b=sSbDHuLpTfaKhZJFVGqJB9uzJiBhICSX0Z2mjNssP70QUYXG/EiHOyXwk+CHpCYgNi
 6CvF26dr6kbi0BfFNw5Ea9eDusF2PFpzcif0e602kD54ftn9CYTO6/bcSxsVde4ahytO
 psywcAyVExiqjXIY3omGVKZ9jPr51jBADdKVvosQ/74PblyHkRKhRS/Ugdi/ufY5RsPj
 ow5JF5DNtdUHUO0/XNL/WZJZSlcV7a6yIdX98e9fruPXpiYg1ay0TIyoK/ci2ljgaddZ
 IzY6Iju4Zbx7WAfEr5PuXdKI5EA6C+s4Zs89jry92z/cV5mEuFsmqWOriIJKzduQVv0r
 S2qA==
X-Gm-Message-State: AAQBX9f5XRDMuEzRUF1h/wvgb2UXACBvWWxFFgLYdFvbqHH4rX9tPpnN
 fCMvOaIPTkypV9/EVfd93ddLgNgRyASpZo56v/k=
X-Google-Smtp-Source: AKy350Zgn14Ne3CUi7Ioc2ov4GVW7QBnYTcisGS4pnjmJx9RGgVHvpqnWN64W/75UEqCeESeHaRasA==
X-Received: by 2002:a5d:440e:0:b0:2e5:6441:2d16 with SMTP id
 z14-20020a5d440e000000b002e564412d16mr2610695wrq.42.1680274248009; 
 Fri, 31 Mar 2023 07:50:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b002cfe685bfd6sm2339831wrv.108.2023.03.31.07.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 07:50:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Implement FEAT_PAN3
Date: Fri, 31 Mar 2023 15:50:45 +0100
Message-Id: <20230331145045.2584941-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331145045.2584941-1-peter.maydell@linaro.org>
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

FEAT_PAN3 adds an EPAN bit to SCTLR_EL1 and SCTLR_EL2, which allows
the PAN bit to make memory non-privileged-read/write if it is
user-executable as well as if it is user-read/write.

Implement this feature and enable it in the AArch64 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index ec3f51782aa..499308fcb07 100644
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


