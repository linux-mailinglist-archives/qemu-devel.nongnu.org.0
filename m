Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EF55FAB32
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:31:07 +0200 (CEST)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi5z0-0005Z5-Tf
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nx-0002Rq-AD
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:41 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nu-00033r-L0
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:41 -0400
Received: by mail-pl1-x62c.google.com with SMTP id 10so12090016pli.0
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n9Z+kZUU1DH+gId3ANvvv1sspQkR6K8eMCHwpMHk7cU=;
 b=rqhjFnVWtZoo9ZEIi2g/V+/xLiXbQjbvZTSIwOY5Q5Jov3LPxEiGZ4JeYTf0PvYIvp
 rbu6mX0iU3L0Q2bSq+loPSQ2A0x3OWXzKAgh+/FppLPzcrURF80DC8TeJkru+KVM1pw8
 rKKqonjzyZ+l8qhI9TP/sLmecnmtrZpKvACKnXQx2StpRofNdF1dGZ5gauNm+J2SCN5T
 EpZYpeIpT2MXkVPDhYJAFu/y4NKShNDQ36IAMgKEE1GxqId5FVUz5XPke9ikvZ1D+PAS
 GgajYQkR3hCUZXfxjVfVh+a8xJ/cOy3/1IEAEJLSyuYUnaMg3oFbWpDWb7j/85iNYhzq
 JF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9Z+kZUU1DH+gId3ANvvv1sspQkR6K8eMCHwpMHk7cU=;
 b=aywjPPccVel0Ct58JNufssf5d1rBJ+thPTWKnX4ZexYlaKNQk1R8G9NMNKdyfmrRlq
 bVoSQXra7PzXOubySrYNgFnv2DBvkb9Ksj2bRC/JEQZEq87rMXd0u4clI9aGx5amNj3B
 KQ9xwZciwmHK0Itihc1OfcjPZkopGwrYF3ThZVlVTD668E0QMhYD6Eov5/+fNpnwSqsS
 Ph2bHOlvAM/6aFzpeEumf53N+irJDmMIpSOX7pTTjbz6cK6JWSl8tAdbtSCSuInTkcpm
 Eo3cgKsKHEBIjj9SKnUX+r4kTXCmcaLAwezAylquBS8Tgu4QVdoapOFEOmQ/0eeo5i3O
 KE4w==
X-Gm-Message-State: ACrzQf1pS/+5N2DsaHolti52rPGUXSSWdxu5BA80iujR09ArmX5jK7GX
 BIMQiLnJfpwrTImw72v2h1zd146tvsvoaA==
X-Google-Smtp-Source: AMsMyM7S0/flc1QzRDsr0VikZAFZwYY+aZIy6oYpF7IsHeGmk6Q8PeLw/aIqFx3nP+a7MrfFMoWiiw==
X-Received: by 2002:a17:902:ce12:b0:17a:3e76:8568 with SMTP id
 k18-20020a170902ce1200b0017a3e768568mr22405431plg.11.1665458377307; 
 Mon, 10 Oct 2022 20:19:37 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 13/24] target/arm: Add ptw_idx to S1Translate
Date: Mon, 10 Oct 2022 20:19:00 -0700
Message-Id: <20221011031911.2408754-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Hoist the computation of the mmu_idx for the ptw up to
get_phys_addr_with_struct and get_phys_addr_twostage.
This removes the duplicate check for stage2 disabled
from the middle of the walk, performing it only once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 53 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 42 insertions(+), 11 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a10..b2bfcfde9a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,6 +17,7 @@
 
 typedef struct S1Translate {
     ARMMMUIdx in_mmu_idx;
+    ARMMMUIdx in_ptw_idx;
     bool in_secure;
     bool in_debug;
     bool out_secure;
@@ -233,17 +234,12 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 {
     bool is_secure = ptw->in_secure;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-    bool s2_phys = false;
+    ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
+    bool s2_phys = s2_mmu_idx == ARMMMUIdx_Phys_S ||
+                   s2_mmu_idx == ARMMMUIdx_Phys_NS;
     uint8_t pte_attrs;
     bool pte_secure;
 
-    if (!arm_mmu_idx_is_stage1_of_2(mmu_idx)
-        || regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
-        s2_mmu_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
-        s2_phys = true;
-    }
-
     if (unlikely(ptw->in_debug)) {
         /*
          * From gdbstub, do not use softmmu so that we don't modify the
@@ -256,10 +252,12 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         } else {
             S1Translate s2ptw = {
                 .in_mmu_idx = s2_mmu_idx,
+                .in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS,
                 .in_secure = is_secure,
                 .in_debug = true,
             };
             GetPhysAddrResult s2 = { };
+
             if (!get_phys_addr_lpae(env, &s2ptw, addr, MMU_DATA_LOAD,
                                     false, &s2, fi)) {
                 goto fail;
@@ -1283,7 +1281,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        ptw->in_secure = !nstable;
+        if (!nstable) {
+            /* Stage2_S -> Stage2 or Phys_S -> Phys_NS */
+            ptw->in_ptw_idx &= ~1;
+            ptw->in_secure = false;
+        }
         descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
@@ -2470,6 +2472,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    ptw->in_ptw_idx = s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
     ptw->in_secure = s2walk_secure;
 
     /*
@@ -2529,10 +2532,32 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
                                       ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
     bool is_secure = ptw->in_secure;
+    ARMMMUIdx s1_mmu_idx;
 
-    if (mmu_idx != s1_mmu_idx) {
+    switch (mmu_idx) {
+    case ARMMMUIdx_Phys_S:
+    case ARMMMUIdx_Phys_NS:
+        /* Checking Phys early avoids special casing later vs regime_el. */
+        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
+                                      is_secure, result, fi);
+
+    case ARMMMUIdx_Stage1_E0:
+    case ARMMMUIdx_Stage1_E1:
+    case ARMMMUIdx_Stage1_E1_PAN:
+        /* First stage lookup uses second stage for ptw. */
+        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+        break;
+
+    case ARMMMUIdx_E10_0:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E0;
+        goto do_twostage;
+    case ARMMMUIdx_E10_1:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E1;
+        goto do_twostage;
+    case ARMMMUIdx_E10_1_PAN:
+        s1_mmu_idx = ARMMMUIdx_Stage1_E1_PAN;
+    do_twostage:
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
          * translations if mmu_idx is a two-stage regime, and EL2 present.
@@ -2543,6 +2568,12 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
             return get_phys_addr_twostage(env, ptw, address, access_type,
                                           result, fi);
         }
+        /* fall through */
+
+    default:
+        /* Single stage and second stage uses physical for ptw. */
+        ptw->in_ptw_idx = is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
+        break;
     }
 
     /*
-- 
2.34.1


