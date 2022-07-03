Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3425A564666
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 11:22:37 +0200 (CEST)
Received: from localhost ([::1]:58900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7voK-0003ES-AU
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 05:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzh-0001cG-Ri
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:17 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzf-0006pA-8b
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:30:17 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so2177619pjm.2
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EdP66MHMryaQaJvVD3+svd3zvQ53nAmBQ9v9hny/93Y=;
 b=IWlIMf0Sei8CaQrDB69wVfNB8V+/QcKjiIThPjsGm2spNV7nGK7cr+MLfGCsZV61Eg
 dvmrDu7lGUjmGlnd4dOckNmJgndK9JBM3KjP2OaYYcBA3NnPFYZOcP6IIKetSzNXVLPB
 FTK+MJB1J0HIzOWkNlXBzOiyVzlikME8QrgcSaVZRzn/xGSDmYzmIZSY1dy78WSe9PN0
 BR+I6tVB+jbtIHLMEOBE0jI3QtVjRBN8WFSfkJtS9gpgIcIyiItjPJqsXCia8KdNWpaB
 yxRddIXMeqi9l6NAGRDxsWARta0uj+t33unBEzUwLU95xdAhEmjnnbUBYf4RyeyF6mp4
 Yu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdP66MHMryaQaJvVD3+svd3zvQ53nAmBQ9v9hny/93Y=;
 b=XxVlXSPiBU/d34mhvvDpM3ueMEO1c1h2JdKK0zJNacl6Au/BQoso/uZ5PgEBTuyx+N
 5BGHkxRsAWA3BTCrNCNRq0PJm99yaYkvr/EIzeF/dnjabXxRQxvipiWzdgPBFMB0TdFR
 37Lr6h5asj973+lUS3gT5udlK9ViCYtkJm6AMs+JgDB1nziw2IcsGmD0HS9QluhW31av
 r0XFzAsBVLRNgCC5IR+QCAO2ZwbGrU/0gm6HCHv2ttaD+dsZ0hbevwJQwBYkKZKUvf8f
 GUqZI+0cN5FaNnHTWeuXU6GOxcj1SVfMP0de8t5HNMgf4qYZFz61jzV0SHcjxBHA1GJB
 g9yA==
X-Gm-Message-State: AJIora9lyJCcgEVd+NM/IczVM384OmgVMhIEvlggc3JeCRLZtE3MLqqI
 sflTLekVcH2sPHvSyLWoBC7osUNFLgjsjJG6
X-Google-Smtp-Source: AGRyM1vm4GVNW24wJH11eVhFR4TuEjZQV81DHMXTPahqZcXWT4r2HC235QEeyRS6p7tZ0RrgePMV+w==
X-Received: by 2002:a17:90b:4b0e:b0:1ec:df4b:33e0 with SMTP id
 lx14-20020a17090b4b0e00b001ecdf4b33e0mr30736076pjb.73.1656837014086; 
 Sun, 03 Jul 2022 01:30:14 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:30:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 55/62] target/arm: Move be test for regime into
 S1TranslateResult
Date: Sun,  3 Jul 2022 13:54:12 +0530
Message-Id: <20220703082419.770989-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hoist this test out of arm_ld[lq]_ptw into S1_ptw_translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 32937ec7db..b5105a2e92 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -192,6 +192,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 typedef struct {
     bool is_secure;
+    bool be;
     void *hphys;
     hwaddr gphys;
 } S1TranslateResult;
@@ -261,6 +262,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                         ? env->cp15.vstcr_el2.raw_tcr & VSTCR_SW
                         : env->cp15.vtcr_el2.raw_tcr & VTCR_NSW));
 
+    res->be = regime_translation_big_endian(env, mmu_idx);
     res->gphys = extra.x & R_PAGEENTRYEXTRA_PA_MASK;
     return true;
 }
@@ -273,7 +275,6 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint32_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
@@ -281,10 +282,9 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         return 0;
     }
 
-    be = regime_translation_big_endian(env, mmu_idx);
     if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (be) {
+        if (s1.be) {
             data = ldl_be_p(s1.hphys);
         } else {
             data = ldl_le_p(s1.hphys);
@@ -295,7 +295,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldl_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldl_le(as, s1.gphys, attrs, &result);
@@ -316,7 +316,6 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint64_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
@@ -324,10 +323,9 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         return 0;
     }
 
-    be = regime_translation_big_endian(env, mmu_idx);
     if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (be) {
+        if (s1.be) {
             data = ldq_be_p(s1.hphys);
         } else {
             data = ldq_le_p(s1.hphys);
@@ -338,7 +336,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldq_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldq_le(as, s1.gphys, attrs, &result);
-- 
2.34.1


