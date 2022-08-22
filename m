Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4270459C2E5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:34:58 +0200 (CEST)
Received: from localhost ([::1]:53906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9S5-00079g-6h
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LB-000735-6z
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:49 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9L9-0000f0-Gy
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:48 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x23so10230618pll.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=J5SoQylTtJu5qfrohns44hEwW2yRQ/CAKj0/Q0ls+dE=;
 b=cNMGG2mVmMqt/RMikdzproCU901gaWsITpCQoomHArQanf0RtCOkGguhoPMyDRD/gA
 ckI5SeSGB4U96IC3oENNp2vPqkntLbknK8fIsXgWypcW6fslYDGRnRHSa4TrDTLZUBfh
 lTvZ71Fv8cNXyUNddYR8JuKIhfWrisIolr/uFnx1kWJcnabEXbmZPSJ7v8PbVUp5ukbw
 OQMElfz5Fj/4Q25VD4qupAhDrW5Xg4LaUJ2Mnn52Sw+cSnsfyRGqeC5PdGbfCOUHxQvG
 EUj7bwO/pcVDwh7NbllHwx+SawoUvurC0vWO7VSGJtUu2hjwvacFWH/7VojJlljskHxk
 M3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=J5SoQylTtJu5qfrohns44hEwW2yRQ/CAKj0/Q0ls+dE=;
 b=Phuy/27olRXQ8Pv7lmkDQJRXxaocPqzCWqfUMBso5fiWFahMyDwwmCW3u5eXRqvmNv
 sZpCoRZiWhZy2KsvuEXRkbGKpkhaCRF9OkDWOmsfLWp12YPmUyYXQ6ZwIRrwRB/DwMaN
 JvqoZhAVV197HTNU2PqwkuxuuAShtU6QCN4Ik0vzNMuGSoyMUiWB4pM9NKtPxrO0PjnR
 4GBMS5Cy3ffl8rqMepVXfa7w3K0tWE8FS1XBOxx1tPcM2EmO02+Svpah58LO7NQ2fJ72
 GJw4ZqrDLzscUfzG4d2C4RbO3SskrgTaVnVjs8tTsI41COhqGKMp5eT0wrpYV5o1yVir
 RPWQ==
X-Gm-Message-State: ACgBeo0niqSTHNz5qPSUcCn5cIg498JJnS295Cd5JCuOShnzRiiwIMfk
 J4fN2IwlfBt+s0x2Fs2scnwGzPR9G7vrqw==
X-Google-Smtp-Source: AA6agR7QATCr4gA9aiDpAeK6ljldBYtQbENUkANKfhhp+DNP3ecK6kXfreFeXS3HfOjw/fp354POWA==
X-Received: by 2002:a17:90b:4d8d:b0:1fb:2e53:5079 with SMTP id
 oj13-20020a17090b4d8d00b001fb2e535079mr6033723pjb.175.1661182065921; 
 Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 04/66] target/arm: Use GetPhysAddrResult in get_phys_addr_v6
Date: Mon, 22 Aug 2022 08:26:39 -0700
Message-Id: <20220822152741.1617527-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4f248f6266..4961bc2f9f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -536,8 +536,7 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                             target_ulong *page_size, ARMMMUFaultInfo *fi)
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -597,11 +596,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
             phys_addr = (desc & 0xff000000) | (address & 0x00ffffff);
             phys_addr |= (uint64_t)extract32(desc, 20, 4) << 32;
             phys_addr |= (uint64_t)extract32(desc, 5, 4) << 36;
-            *page_size = 0x1000000;
+            result->page_size = 0x1000000;
         } else {
             /* Section.  */
             phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
-            *page_size = 0x100000;
+            result->page_size = 0x100000;
         }
         ap = ((desc >> 10) & 3) | ((desc >> 13) & 4);
         xn = desc & (1 << 4);
@@ -627,12 +626,12 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
             xn = desc & (1 << 15);
-            *page_size = 0x10000;
+            result->page_size = 0x10000;
             break;
         case 2: case 3: /* 4k page.  */
             phys_addr = (desc & 0xfffff000) | (address & 0xfff);
             xn = desc & 1;
-            *page_size = 0x1000;
+            result->page_size = 0x1000;
             break;
         default:
             /* Never happens, but compiler isn't smart enough to tell.  */
@@ -640,7 +639,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         }
     }
     if (domain_prot == 3) {
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     } else {
         if (pxn && !regime_is_user(env, mmu_idx)) {
             xn = 1;
@@ -658,14 +657,14 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                 fi->type = ARMFault_AccessFlag;
                 goto do_fault;
             }
-            *prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
+            result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
         } else {
-            *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+            result->prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
         }
-        if (*prot && !xn) {
-            *prot |= PAGE_EXEC;
+        if (result->prot && !xn) {
+            result->prot |= PAGE_EXEC;
         }
-        if (!(*prot & (1 << access_type))) {
+        if (!(result->prot & (1 << access_type))) {
             /* Access permission fault.  */
             fi->type = ARMFault_Permission;
             goto do_fault;
@@ -676,9 +675,9 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
-        attrs->secure = false;
+        result->attrs.secure = false;
     }
-    *phys_ptr = phys_addr;
+    result->phys = phys_addr;
     return false;
 do_fault:
     fi->domain = domain;
@@ -2516,8 +2515,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                &result->phys, &result->attrs,
-                                &result->prot, &result->page_size, fi);
+                                result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
                                 &result->phys, &result->prot,
-- 
2.34.1


