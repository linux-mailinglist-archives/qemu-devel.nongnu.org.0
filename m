Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF40F609A67
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:19:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompsf-00071a-5e; Mon, 24 Oct 2022 01:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprq-0006ap-4L
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprc-0002Jk-Hs
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:16 -0400
Received: by mail-pg1-x533.google.com with SMTP id r18so7791041pgr.12
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TugH2ukoL/GP7ZN02ws3Cq0+tk08ipGAjprVUPkbIZQ=;
 b=lrW4Kubth2Hwb9Z0wiJ0K6rEYWrzBKu9qhcst5WTDbdD33E+HlfDfZOguU1cIvdWuB
 LDyFC6d2jvP1sU9rZOG8c5XOBjN/qVuO6e+rGavg17mHND8Zo1tkip7LX+WivJe8oVpU
 p2U92sig1iMncxHTQ4sqfB50AJh6yAY+/DQW7kFL1QFf+RB9fOTcBRzjMvIyvksfK6L2
 6CY4cKM7Qj9okPo/0+fsM+ZJCe/ulB6bTPgKxxmHB40NK2ubW/sN+El3ViSdPP02BIEG
 +cR8/dJpiB4IK1VJagPMCsc5/ckGPjLqKm36QglJaQDxvjzeMpDBMeH/d836yeu+yiJF
 Ub/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TugH2ukoL/GP7ZN02ws3Cq0+tk08ipGAjprVUPkbIZQ=;
 b=1YSdQShnaECWsN44upIIRCS/jdGlJlTrIW/+ECZ+jjc2ykh25tGyOjN1B8e5gGJLxp
 f7aUmtDPpo6h36Qmo30m1Oe4A+EAttKd+Oq1zdBwdE4nUP6ZrnQqfAi0Prj/FxMt+HoB
 H0SnIP8iatE42gUw9GuYpasqhz6aKobmj0TOtbcdq6+oKZ3EQ5HN8Ib/bKq1cKvXn8RS
 IzX7myv5ZzQWT1Xy7UBokUe2eYWn7hmZ6O2OLzrAa6LpjB+eFgOrKAb0aht3b47nK3A3
 kho8iU7HTSdEpMRZ/ZvIALb4PqUUFVWqjyDuXqj5ee17ZJ6SI2Y1Tb9shb6o20vkqmKT
 BRYA==
X-Gm-Message-State: ACrzQf0LIExL/jeVHrIqlnTioO7oGvjcdAaPnNGiyvIV+IEJTgQT46Xs
 hx8/uRT68ihXHR8IhyFP6IyYamQoVwOfacYV
X-Google-Smtp-Source: AMsMyM6hdYB2evnzD+qK8QBYQ1x1O2D5dQbz3JPclZX4UrKd0Ju3TIuXMcqIC6u+Vwu+F7g32gNlMQ==
X-Received: by 2002:a63:f07:0:b0:440:5c6e:5833 with SMTP id
 e7-20020a630f07000000b004405c6e5833mr27534717pgl.375.1666588742664; 
 Sun, 23 Oct 2022 22:19:02 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 02/14] target/arm: Add ptw_idx to S1Translate
Date: Mon, 24 Oct 2022 15:18:39 +1000
Message-Id: <20221024051851.3074715-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Hoist the computation of the mmu_idx for the ptw up to
get_phys_addr_with_struct and get_phys_addr_twostage.
This removes the duplicate check for stage2 disabled
from the middle of the walk, performing it only once.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 71 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 004375e02b..161b7922e3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -17,6 +17,7 @@
 
 typedef struct S1Translate {
     ARMMMUIdx in_mmu_idx;
+    ARMMMUIdx in_ptw_idx;
     bool in_secure;
     bool in_debug;
     bool out_secure;
@@ -233,33 +234,24 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 {
     bool is_secure = ptw->in_secure;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
-    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
-    bool s2_phys = false;
+    ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
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
          * state of the cpu at all, including softmmu tlb contents.
          */
-        if (s2_phys) {
-            ptw->out_phys = addr;
-            pte_attrs = 0;
-            pte_secure = is_secure;
-        } else {
+        if (regime_is_stage2(s2_mmu_idx)) {
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
@@ -267,6 +259,11 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
             ptw->out_phys = s2.f.phys_addr;
             pte_attrs = s2.cacheattrs.attrs;
             pte_secure = s2.f.attrs.secure;
+        } else {
+            /* Regime is physical. */
+            ptw->out_phys = addr;
+            pte_attrs = 0;
+            pte_secure = is_secure;
         }
         ptw->out_host = NULL;
     } else {
@@ -287,7 +284,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         pte_secure = full->attrs.secure;
     }
 
-    if (!s2_phys) {
+    if (regime_is_stage2(s2_mmu_idx)) {
         uint64_t hcr = arm_hcr_el2_eff_secstate(env, is_secure);
 
         if ((hcr & HCR_PTW) && S2_attrs_are_device(hcr, pte_attrs)) {
@@ -1282,7 +1279,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        ptw->in_secure = !nstable;
+        if (!nstable) {
+            /*
+             * Stage2_S -> Stage2 or Phys_S -> Phys_NS
+             * Assert that the non-secure idx are even, and relative order.
+             */
+            QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
+            QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
+            QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
+            QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
+            ptw->in_ptw_idx &= ~1;
+            ptw->in_secure = false;
+        }
         descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
@@ -2468,6 +2476,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
     is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    ptw->in_ptw_idx = s2walk_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phys_NS;
     ptw->in_secure = s2walk_secure;
 
     /*
@@ -2527,10 +2536,32 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
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
@@ -2541,6 +2572,12 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
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


