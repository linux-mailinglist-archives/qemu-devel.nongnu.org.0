Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA315784F9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:12:21 +0200 (CEST)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRTw-0005Jc-VL
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHZ-000278-Vr
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHW-0003AM-2C
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id h17so17240268wrx.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WkWJRj26wPeTo9qIJ3RW2bntJqHKbO7FETgRMM6GtVw=;
 b=rrgHgSfhHZ8me/+lLXDe91BUPvEL+IDcZmMOj0LH2aFeVlI3E7RDLYlmsLBj7+4sEI
 qBoTSGnofzKvH3PSoGNx2EBmSDOmOuBvkUafhjB/zteVvXqz0p2ZUAPa6vigOz3No6na
 3uZja5RgfhM4JqSTRpcA+2iXZWvngvk4mXQtasZGcFhfXartQS+c/sGJK1vN/dNtfP4o
 Jm6JxYyF88SLVIhreJm3Rq3kN07YreENkbBmv6XBL/ABfG91XyFFVGoP/fDZW1eeX/jp
 B107PJ8x6NNCdZ8vA1JpYRF6MlFInk0ese8k4E53lcEv5yS3vsx2DgwJ1kLvM0BbSscd
 K2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WkWJRj26wPeTo9qIJ3RW2bntJqHKbO7FETgRMM6GtVw=;
 b=kQBNkHX4bVmUzWbxrgcmBWF8UEZ4lzVNyKmWrCOtJGhYFZe9JfIRHRkFKrITWLx7+/
 HhLpET8AnAL1dVmkMr328i9q6rhiVYs8SrE1BlT9aIGxobZYXOuZa/9lbl5E7H9MrboK
 O+lyA3mht62yL5H0nNHRBzbOBzC03SNWh01FAccEWcZlWsCYYJ52Do7Igo5u4vxuRcB2
 XkG4bSprnvgeuklvV5/VucDYbqusFoDHRVRI/ZpDwWEcvhOI1gCRvBmJ2Ckw5/n7pCjn
 DsC8EKmU+cKbVV7Qv1W+8grB01HNPLIzFDCZf6q7YZX+Cy9F29EFSX/TSkbXm7+idDrt
 lUeQ==
X-Gm-Message-State: AJIora8lg90LTleu+k2VwGYp284Ith8p0DM3I+YDgx29+JU3qByi8LwC
 DynGNmRnwRm8oYR/HwMgNRgHuX+9T55OZA==
X-Google-Smtp-Source: AGRyM1sMgo3rNH51Z12JoAQwbjyrOO5JReJC2I+Rf28TWihXsRVSGrQDFJLznrbw+nAP46Dvi7Bjfw==
X-Received: by 2002:a05:6000:90c:b0:21e:1565:8179 with SMTP id
 bz12-20020a056000090c00b0021e15658179mr4579680wrb.717.1658152767707; 
 Mon, 18 Jul 2022 06:59:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] target/arm: Define and use new regime_tcr_value()
 function
Date: Mon, 18 Jul 2022 14:59:10 +0100
Message-Id: <20220718135920.13667-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The regime_tcr() function returns a pointer to a struct TCR
corresponding to the TCR controlling a translation regime.  The
struct TCR has the raw value of the register, plus two fields mask
and base_mask which are used as a small optimization in the case of
32-bit short-descriptor lookups.  Almost all callers of regime_tcr()
only want the raw register value.  Define and use a new
regime_tcr_value() function which returns only the raw 64-bit
register value.

This is a preliminary to removing the 32-bit short descriptor
optimization -- it only saves a handful of bit operations, which is
tiny compared to the overhead of doing a page table walk at all, and
the TCR struct is awkward and makes fixing
https://gitlab.com/qemu-project/qemu/-/issues/1103 unnecessarily
difficult.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220714132303.1287193-2-peter.maydell@linaro.org
---
 target/arm/internals.h  | 6 ++++++
 target/arm/helper.c     | 6 +++---
 target/arm/ptw.c        | 8 ++++----
 target/arm/tlb_helper.c | 2 +-
 4 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 00e2e710f6c..fa046124fa8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -793,6 +793,12 @@ static inline TCR *regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
     return &env->cp15.tcr_el[regime_el(env, mmu_idx)];
 }
 
+/* Return the raw value of the TCR controlling this translation regime */
+static inline uint64_t regime_tcr_value(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    return regime_tcr(env, mmu_idx)->raw_tcr;
+}
+
 /**
  * arm_num_brps: Return number of implemented breakpoints.
  * Note that the ID register BRPS field is "number of bps - 1",
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 24c45a9bf31..c245922bb5d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4216,7 +4216,7 @@ static int vae1_tlbmask(CPUARMState *env)
 static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
                               uint64_t addr)
 {
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     int tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
     int select = extract64(addr, 55, 1);
 
@@ -10158,7 +10158,7 @@ static int aa64_va_parameter_tcma(uint64_t tcr, ARMMMUIdx mmu_idx)
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     bool epd, hpd, using16k, using64k, tsz_oob, ds;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMCPU *cpu = env_archcpu(env);
@@ -10849,7 +10849,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 {
     CPUARMTBFlags flags = {};
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     uint64_t sctlr;
     int tbii, tbid;
 
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e71fc1f4293..0d7e8ffa41b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -820,7 +820,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
 static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
                                           ARMMMUIdx mmu_idx)
 {
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     uint32_t el = regime_el(env, mmu_idx);
     int select, tsz;
     bool epd, hpd;
@@ -994,7 +994,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     uint32_t attrs;
     int32_t stride;
     int addrsize, inputsize, outputsize;
-    TCR *tcr = regime_tcr(env, mmu_idx);
+    uint64_t tcr = regime_tcr_value(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
@@ -1112,8 +1112,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * For stage 2 translations the starting level is specified by the
          * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
          */
-        uint32_t sl0 = extract32(tcr->raw_tcr, 6, 2);
-        uint32_t sl2 = extract64(tcr->raw_tcr, 33, 1);
+        uint32_t sl0 = extract32(tcr, 6, 2);
+        uint32_t sl2 = extract64(tcr, 33, 1);
         uint32_t startlevel;
         bool ok;
 
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 7d8a86b3c45..a2f87a5042d 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -20,7 +20,7 @@ bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     }
     if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
+        && (regime_tcr_value(env, mmu_idx) & TTBCR_EAE)) {
         return true;
     }
     return false;
-- 
2.25.1


