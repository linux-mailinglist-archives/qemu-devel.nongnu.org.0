Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364A5E6AD9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:25:40 +0200 (CEST)
Received: from localhost ([::1]:37934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obQtH-00039u-0d
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAw-0002AM-Gs
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPAt-0005OU-L1
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:35:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id e18so7138556wmq.3
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=C+doTJSJOl2nd6rP7/lJYWFoQI5eFRk8b87lknsYPRs=;
 b=uVPYNtCdvijZvx0PZIRbJ08oHw6MDi/KwhcUbsnfPg/+7WcbasInA55kaklCq8vjiz
 6b3CD1ue5DW17T0QeZIASAR7AWS3FOzqno8lkUnTkaSRMEX18w6PFl/XD7SXQ6Z2yqvN
 sqMr8+6/YgoP6NW18vpQeovjM6MgiI3Mdm1mh7hEjO+kJFdLqVpZvytvBDObUCvaDY6a
 x/v29ATv9InWI6Kx9FnNLd620mvT1889rxKAkCaaJWet9XIG4qVFGh7tRAdUYJNqTkLf
 +RpTpFFgrD5wtQWpJ0NHAJFLlbL2KKVXU9uECuB2knWnu2024jEm5YzhyJgkj+aWYKgm
 5gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=C+doTJSJOl2nd6rP7/lJYWFoQI5eFRk8b87lknsYPRs=;
 b=cdLgRjyrxkIKEKfCVhKA9L/gD/OxtLdSJQTQuPSTILNhNsULJdBvEUgLQdT6fs5jGr
 Lrwi43Vj+fC6k7Bb6v8uhxXIxg+KcUM+b+0YcHXxdKvUrguBJR9ORVjAuPullB202nhl
 BJNG2XcKa+S7k9bN6U5Qt/e6dz77J6PQZmNg7oMXhb06gsNYYrK3v9Hvpth3mbg2YDRh
 qlew9hLnqpStoy8o4HLoM+KqEOLkD1j05kEHXJ78GswlrBoGr9CsM1KpLPUybUlq45Pd
 w5V/w2ca4ZxvwMP4o7oOaAzAv5683zMuso8O4IMKpOqiQyS6SNexlArS3ef4YVcR4ppm
 jq1w==
X-Gm-Message-State: ACrzQf07nSKCcJ44rH0nj8jrT/RiZRdl1r2zfJ5xUGij0SqVXxlR2nVH
 L5jfX3YUNQneZ/i2cZOSfkzn88s1ZNEHpQ==
X-Google-Smtp-Source: AMsMyM5kWLUiUef3p68G8+f20jmnAZ6Trpcc0Em5jZih7K6o73Hejpbpe+ei5XXwJOhRiLP3YIKexw==
X-Received: by 2002:a05:600c:4352:b0:3b4:84c0:2006 with SMTP id
 r18-20020a05600c435200b003b484c02006mr3064717wme.205.1663864541979; 
 Thu, 22 Sep 2022 09:35:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/39] target/arm: Use GetPhysAddrResult in get_phys_addr_v6
Date: Thu, 22 Sep 2022 17:35:02 +0100
Message-Id: <20220922163536.1096175-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220822152741.1617527-5-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e8d3f88628e..600d9e6650d 100644
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
@@ -2518,8 +2517,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
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
2.25.1


