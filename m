Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C146059C369
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:52:36 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9j9-0008Mz-MD
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:52:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LH-0007EC-IP
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:55 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LB-0000fm-TP
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:55 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 s36-20020a17090a69a700b001faad0a7a34so14327471pjj.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=zEbgMdwXCpK6WyBM4XhPFitze2l2/MeuDPROktlGLLo=;
 b=MTv6aLesRwR7KrEwGg6YcO+t1fWBp7qBV9VcXvTyaOXEXBLC7RU4wEHVtb0jJpRU04
 +Jz/yRvfhtRASakAozDVO7BWWSom1lWO+yGN8BLt3pjE3aqJxsFlHemv1FPDuc5Fe0ob
 uPd43LxVJs78s1BSfMWLN7SWhNFfNARk5OJjH6XEMbRQV5xyljFvNBip3YH4JW6moyrX
 ArRZyNMUyUjbD5eP0htw7n7xem3ZcKku8e6s+PoMD7zf/rUy3tkd5OorvRevKjxdERUO
 y4bPURzNa2km+gRv6PXnQvwm9Vng0Hm402hIOAMpJpjd9TWppY4ZXwOXD5DXwRFw1PIO
 3dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=zEbgMdwXCpK6WyBM4XhPFitze2l2/MeuDPROktlGLLo=;
 b=NadShavKxED/xJVDmB1CVpontLkJKIGEhPvEoKrhjyOFEwHRLP8l2Se1m8D/7ykQBo
 dMaB5Q9GOFvL7hjNBT0K+vWenNV3Ji8yPF37VrnVMc6FVco8At+3pSwXyYEGVlv0gWxP
 +6oIHAkh0CYhWCFHk6JHnmj3MOQXq756K7Zriitt+mJevIQWc4plb5VBD/iLTcucEPxw
 jRTn+G26gNW8BwhJYPh2ZOQmCnvgEGgQh2OVGeSNoUBanH8diMgireSpTEQKT5e4JXhg
 tciJEtq8bUjQEnIjejNny3IbT9abAlZyrgyrakKGVrubr33cjqHDgEh6THswenIkCcXN
 5wiw==
X-Gm-Message-State: ACgBeo1S992s8CavYgyKaEBIroaSJ5WuS7sbaNmm/pvj5YhJ5DqCyskj
 Yzw54io7KL3FgbVUNnEp4vuoLc7TBPOnmA==
X-Google-Smtp-Source: AA6agR5AcwbTRda1HcedvI+ERt1B9o+XpW+6S++625IMucr2M/rD3LddsByj8DQkd8Oq5/fNhtZJ+Q==
X-Received: by 2002:a17:902:b697:b0:172:65f9:d681 with SMTP id
 c23-20020a170902b69700b0017265f9d681mr20458582pls.137.1661182066811; 
 Mon, 22 Aug 2022 08:27:46 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 05/66] target/arm: Use GetPhysAddrResult in get_phys_addr_v5
Date: Mon, 22 Aug 2022 08:26:40 -0700
Message-Id: <20220822152741.1617527-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4961bc2f9f..b006e87a63 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -414,9 +414,7 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             hwaddr *phys_ptr, int *prot,
-                             target_ulong *page_size,
-                             ARMMMUFaultInfo *fi)
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -464,7 +462,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         /* 1Mb section.  */
         phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
         ap = (desc >> 10) & 3;
-        *page_size = 1024 * 1024;
+        result->page_size = 1024 * 1024;
     } else {
         /* Lookup l2 entry.  */
         if (type == 1) {
@@ -486,12 +484,12 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
             ap = (desc >> (4 + ((address >> 13) & 6))) & 3;
-            *page_size = 0x10000;
+            result->page_size = 0x10000;
             break;
         case 2: /* 4k page.  */
             phys_addr = (desc & 0xfffff000) | (address & 0xfff);
             ap = (desc >> (4 + ((address >> 9) & 6))) & 3;
-            *page_size = 0x1000;
+            result->page_size = 0x1000;
             break;
         case 3: /* 1k page, or ARMv6/XScale "extended small (4k) page" */
             if (type == 1) {
@@ -499,7 +497,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 if (arm_feature(env, ARM_FEATURE_XSCALE)
                     || arm_feature(env, ARM_FEATURE_V6)) {
                     phys_addr = (desc & 0xfffff000) | (address & 0xfff);
-                    *page_size = 0x1000;
+                    result->page_size = 0x1000;
                 } else {
                     /*
                      * UNPREDICTABLE in ARMv5; we choose to take a
@@ -510,7 +508,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                 }
             } else {
                 phys_addr = (desc & 0xfffffc00) | (address & 0x3ff);
-                *page_size = 0x400;
+                result->page_size = 0x400;
             }
             ap = (desc >> 4) & 3;
             break;
@@ -519,14 +517,14 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             g_assert_not_reached();
         }
     }
-    *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
-    *prot |= *prot ? PAGE_EXEC : 0;
-    if (!(*prot & (1 << access_type))) {
+    result->prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+    result->prot |= result->prot ? PAGE_EXEC : 0;
+    if (!(result->prot & (1 << access_type))) {
         /* Access permission fault.  */
         fi->type = ARMFault_Permission;
         goto do_fault;
     }
-    *phys_ptr = phys_addr;
+    result->phys = phys_addr;
     return false;
 do_fault:
     fi->domain = domain;
@@ -2518,8 +2516,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                &result->phys, &result->prot,
-                                &result->page_size, fi);
+                                result, fi);
     }
 }
 
-- 
2.34.1


