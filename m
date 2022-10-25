Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD4260D1D1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:46:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMz4-0006k1-QG; Tue, 25 Oct 2022 12:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyg-0006D4-4S
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyN-0001cV-Pf
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:25 -0400
Received: by mail-wr1-x42a.google.com with SMTP id y16so11623928wrt.12
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2fAexE0Wap1xOoTyj0oQWz/3m3axw41tbUCxvv4K5m4=;
 b=vWUPlOmZJosDoBa7oe1cHVoMGwnIQYtr+/5yy1rJnWCY1KDilvwLItHGIcMto92ECp
 WyX2md2tTb82sfFMBHxBNJC1x4BJca4okG74FwJKYSCRIOhm6lLjE0n+dnf2tVTHZsPg
 fsE//2FHHIWsu/orRbafjVAJCO11GeS2WyybwvzMffaGVyaSh9/nQsKwE4ucnyISliYF
 rthXFCayMj2Mi+qwbMRb2SGWTpaOm702JmyGFafDtsj/Qf+d0k0jRkK3fif8at3kVe9j
 IkdW4JsUqvTHUUCeL0c4N4ep5nbjc4l5ZOa+paqPxQ9LnOpXWqAYBKAYXa/GsGiUkWXW
 462g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2fAexE0Wap1xOoTyj0oQWz/3m3axw41tbUCxvv4K5m4=;
 b=PvEZ7qKE1FcK2AjcL6c0LILdcXwtMbPT5q0dHh4UdzrkyInLiv/GAwnqAMiYW5VnlO
 8+Kgtugh85km0n3/zDx5RC77kI7pahDRvO1+ddinRFp0cG8PbTrVxW15+QO37SWSvzd6
 1MQULSqnSdN5JTYYBvcjp6zB9rbvaPeqhE156t9mm+OGE8VDeXikGUvNBzlkgIR7m9q2
 u2h94Ol+lKB2ZeT10qXq4iRj31aKVML6HecqnKHGKG+1G9D2/4mzhTe4kbk2+0WQubpZ
 DnRtcpMudTequ4dhtZBq0yBEs+wki8YzU3zZX81o1GJldGFH2bICsAzL/EEXgtR4fgPi
 gP1Q==
X-Gm-Message-State: ACrzQf3fMoQ0MaZpSNr64dY5IjA1jeA4sLESVvKpsR7SmScddoyvL4XS
 rR6Q+7XfU3C8au9hNFt6aAWNlZfAu8alGQ==
X-Google-Smtp-Source: AMsMyM6QONnDfi9uWCId4bC5H7UHuJaDuixwwRBQFF7D6sn/QbXLNci2iieFauCfoYySqjEbtHo/gg==
X-Received: by 2002:a05:6000:1548:b0:22e:3469:b726 with SMTP id
 8-20020a056000154800b0022e3469b726mr25787235wry.10.1666716003037; 
 Tue, 25 Oct 2022 09:40:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/30] target/arm: Introduce regime_is_stage2
Date: Tue, 25 Oct 2022 17:39:29 +0100
Message-Id: <20221025163952.4131046-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Reduce the amount of typing required for this check.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221024051851.3074715-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h |  5 +++++
 target/arm/helper.c    | 14 +++++---------
 target/arm/ptw.c       | 14 ++++++--------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c8c5ca7b934..abfb32d77c2 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -673,6 +673,11 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
+{
+    return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
+}
+
 /* Return the exception level which controls this address translation regime */
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 252651a8d19..47afaec6b44 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10352,7 +10352,7 @@ int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 37, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    } else if (regime_is_stage2(mmu_idx)) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBI bit so we always have 2 bits.  */
@@ -10364,7 +10364,7 @@ int aa64_va_parameter_tbid(uint64_t tcr, ARMMMUIdx mmu_idx)
 {
     if (regime_has_2_ranges(mmu_idx)) {
         return extract64(tcr, 51, 2);
-    } else if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    } else if (regime_is_stage2(mmu_idx)) {
         return 0; /* VTCR_EL2 */
     } else {
         /* Replicate the single TBID bit so we always have 2 bits.  */
@@ -10474,7 +10474,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
-    bool stage2 = mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
+    bool stage2 = regime_is_stage2(mmu_idx);
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -10541,22 +10541,18 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         }
         ds = false;
     } else if (ds) {
-        switch (mmu_idx) {
-        case ARMMMUIdx_Stage2:
-        case ARMMMUIdx_Stage2_S:
+        if (regime_is_stage2(mmu_idx)) {
             if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_2_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_2_lpa2, cpu);
             }
-            break;
-        default:
+        } else {
             if (gran == Gran16K) {
                 ds = cpu_isar_feature(aa64_tgran16_lpa2, cpu);
             } else {
                 ds = cpu_isar_feature(aa64_tgran4_lpa2, cpu);
             }
-            break;
         }
         if (ds) {
             min_tsz = 12;
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index aed6f92d6f6..32d64125865 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -823,8 +823,7 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     bool have_wxn;
     int wxn = 0;
 
-    assert(mmu_idx != ARMMMUIdx_Stage2);
-    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+    assert(!regime_is_stage2(mmu_idx));
 
     user_rw = simple_ap_to_rw_prot_is_user(ap, true);
     if (is_user) {
@@ -1152,7 +1151,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         goto do_fault;
     }
 
-    if (mmu_idx != ARMMMUIdx_Stage2 && mmu_idx != ARMMMUIdx_Stage2_S) {
+    if (!regime_is_stage2(mmu_idx)) {
         /*
          * The starting level depends on the virtual address size (which can
          * be up to 48 bits) and the translation granule size. It indicates
@@ -1323,7 +1322,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         attrs = extract64(descriptor, 2, 10)
             | (extract64(descriptor, 52, 12) << 10);
 
-        if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        if (regime_is_stage2(mmu_idx)) {
             /* Stage 2 table descriptors do not include any attribute fields */
             break;
         }
@@ -1355,7 +1354,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     ap = extract32(attrs, 4, 2);
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    if (regime_is_stage2(mmu_idx)) {
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract32(attrs, 11, 2);
         result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
@@ -1385,7 +1384,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         result->f.guarded = guarded;
     }
 
-    if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+    if (regime_is_stage2(mmu_idx)) {
         result->cacheattrs.is_s2_format = true;
         result->cacheattrs.attrs = extract32(attrs, 0, 4);
     } else {
@@ -1416,8 +1415,7 @@ do_fault:
     fi->type = fault_type;
     fi->level = level;
     /* Tag the error as S2 for failed S1 PTW at S2 or ordinary S2.  */
-    fi->stage2 = fi->s1ptw || (mmu_idx == ARMMMUIdx_Stage2 ||
-                               mmu_idx == ARMMMUIdx_Stage2_S);
+    fi->stage2 = fi->s1ptw || regime_is_stage2(mmu_idx);
     fi->s1ns = mmu_idx == ARMMMUIdx_Stage2;
     return true;
 }
-- 
2.25.1


