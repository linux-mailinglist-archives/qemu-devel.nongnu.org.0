Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE4953D58B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:44:25 +0200 (CEST)
Received: from localhost ([::1]:50018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxLeC-0001ZY-4R
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3e-0000HL-Ml
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:38 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3b-0008Uy-Hc
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:38 -0400
Received: by mail-pj1-x1035.google.com with SMTP id j7so8692071pjn.4
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nHmctdTM0Wz3l6IJSRdIRxCF9GcdCYO2x/ZBvhVz9w=;
 b=aXzhVQg2ZbWi5Wa/x78NPnlODX6YRmwAY0o+sYCdKbe0jSoQes2+Vzb7EMEjL2ZbXV
 pUJnPG38N/s5nV2M8UFlx/TumEoRW6FoEunpnxg2StLCSHG7WRDFT1jytYngT1KeWe8o
 9QgZJIITsHWWDPoz0StwRtRRWT5Imw5/TkykHDY/nuqNHjnNsqDOBhE7Pb95+bgtVNj3
 Gf97v0k61Uwxs3RSgTgolKRtA/L/36dwcI/qXh2U3tcDqASAQTANMW2G3CSZUqPDIQ9D
 asuo/ipREjsh5V3OAzzb6avGicvukJHx5H+XcKtSJbY92EUEw8ZEbsXw5FTpT25EhQIM
 q8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nHmctdTM0Wz3l6IJSRdIRxCF9GcdCYO2x/ZBvhVz9w=;
 b=zKigIExxZoNr6EARxtFGJHt+Qn9+boYvuDUuWCmGtTqpI58O3lp07klPvGImdycdnR
 BibTEgknb0inWaIJlMRGjsp5lQyEVYHckZJdopaQELGNspiqMWTI3RVqzwCMxkTP/Jnl
 wIN4+/L/EBS0WZa66pqrquNui13wVllxDFRTUS38hnWny9uZbK/E8cVooMuAWOYWF+Ie
 8e0hpq5WP4LMlcvTG+vXJX06apZwa52X+VrK+wzY3OMcb1uO07VKdcpF70HmZwqMJ2ac
 pjdrBAYyNhGaK5HioKJJb/EHe1W7Q3+zlLXjJyWmyV4bvU9pcb6Y/C4JgMJDqgXrY9yg
 B/QA==
X-Gm-Message-State: AOAM533G5iuLWY7wA09rmSQKz4KY35V3kKlzQIcahBQQ5Vb7YhGlV0el
 cOTCludU3LXSYZEWpsKTZKlZmkiU3NVqXQ==
X-Google-Smtp-Source: ABdhPJwh0RRLcpPQ7dRRSA9eeuBF+KYu/a9l0FdOqjdAeepbnfNdvRzApuSTs22GrmDeAFQnPETqSg==
X-Received: by 2002:a17:902:7149:b0:166:4e68:5c41 with SMTP id
 u9-20020a170902714900b001664e685c41mr8837281plm.25.1654315594672; 
 Fri, 03 Jun 2022 21:06:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 28/28] target/arm: Pass CPUARMState to arm_ld[lq]_ptw
Date: Fri,  3 Jun 2022 21:06:07 -0700
Message-Id: <20220604040607.269301-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

The use of ARM_CPU to recover env from cs calls
object_class_dynamic_cast, which shows up on the profile.
This is pointless, because all callers already have env, and
the reverse operation, env_cpu, is only pointer arithmetic.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 49e9a1d108..4d97a24808 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -241,11 +241,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
+    CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
     MemTxResult result = MEMTX_OK;
     AddressSpace *as;
@@ -270,11 +269,10 @@ static uint32_t arm_ldl_ptw(CPUState *cs, hwaddr addr, bool is_secure,
     return 0;
 }
 
-static uint64_t arm_ldq_ptw(CPUState *cs, hwaddr addr, bool is_secure,
+static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
+    CPUState *cs = env_cpu(env);
     MemTxAttrs attrs = {};
     MemTxResult result = MEMTX_OK;
     AddressSpace *as;
@@ -409,7 +407,6 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              target_ulong *page_size,
                              ARMMMUFaultInfo *fi)
 {
-    CPUState *cs = env_cpu(env);
     int level = 1;
     uint32_t table;
     uint32_t desc;
@@ -427,7 +424,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
                        mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
@@ -466,7 +463,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
                            mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
@@ -531,7 +528,6 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
                              target_ulong *page_size, ARMMMUFaultInfo *fi)
 {
-    CPUState *cs = env_cpu(env);
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
     uint32_t table;
@@ -553,7 +549,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
                        mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
@@ -607,7 +603,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(cs, table, regime_is_secure(env, mmu_idx),
+        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
                            mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
@@ -973,7 +969,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                                ARMMMUFaultInfo *fi, ARMCacheAttrs *cacheattrs)
 {
     ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = CPU(cpu);
     /* Read an LPAE long-descriptor translation table. */
     ARMFaultType fault_type = ARMFault_Translation;
     uint32_t level;
@@ -1196,7 +1191,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         descaddr |= (address >> (stride * (4 - level))) & indexmask;
         descaddr &= ~7ULL;
         nstable = extract32(tableattrs, 4, 1);
-        descriptor = arm_ldq_ptw(cs, descaddr, !nstable, mmu_idx, fi);
+        descriptor = arm_ldq_ptw(env, descaddr, !nstable, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.34.1


