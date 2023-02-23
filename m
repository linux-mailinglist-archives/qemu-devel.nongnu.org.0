Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB886A116E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:46:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRe-0002pa-Eh; Thu, 23 Feb 2023 15:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRc-0002oj-8g
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:00 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRa-0007Ro-NB
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:44:00 -0500
Received: by mail-pj1-x1034.google.com with SMTP id l1so3997451pjt.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgeja5IA7DWdfWMaQJS17wRQUp+VgamC4WOakECeEuY=;
 b=ir9tHoG4bsr+QA+SyzdOL6EpVyYOzyabKXIYOwVIjI+DLC1zDMGmBvcVFICgy1dMPC
 OzT7anpVeng+qdQ16ZWbBoR11q3BURhdZOx9Bxel2EAc7hKSVi1KF3ZpwBGhyFZk+egH
 DZOFlzPbhCXc+dREWssE+sXJrZIp4qsjHLiItw0JsGhxMwQxfwPKi+oRXF2wzWLpsYiR
 w4gwUpME0YtbHrvX7lIOoioQIdgfG6eaqHaqv8aTJlj1wSG0NyGiA4wDZf9mL3VgbkgR
 7jSUmqil0NeSwfijuTMyZA8wIBuSjSsinzi3cb1Zj/mHUTKqwbhxLEiEJtUQk1SMZvBi
 MxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgeja5IA7DWdfWMaQJS17wRQUp+VgamC4WOakECeEuY=;
 b=fU/+kTNv3hTfBFGrlkpulIJ0N2PjNd/2QAqpfk8laaBTtmgMrS2P5uUKZTjyYBGu0f
 EX6QKM88a0eRYRvtwwBCnQg5Pu3zX8s7D8T6yH+XECX0K9PVy/ROkOtIUyOxcf9R0MSP
 1Yw+b5QSaqhcetcGoXKtjpDeRtwkpM0eLCmjjT2D5/50p4QAusx+Cv/WAidPDMPIRqbT
 IjHivT6TIMSOSXpY13GXtARx24JOmdF74Mv9m+R2kB0xmPBJHBWgOObhCZFd4kVtdGs8
 COOGiOGzuxBsyjQwXzLmSSbdfCf1NkVv887TTm4XjUYKhTlHQVuSKmxpnJWz3TKYGqGm
 pW5w==
X-Gm-Message-State: AO0yUKWGR5/+40FualJGDymzIDgKSYXv7wk4PWuX49nH4W8OoN9Snl0b
 N4hvzjPMovKaitipq5q5BeGTVlPzKDAtXzv6J68=
X-Google-Smtp-Source: AK7set+SE06g4w/5GsRPAi3PPr3wa4Cm7AylXnZ9HyxqNK9qNKJ+g64D23lpm/imRg7BKiIRSZMDJQ==
X-Received: by 2002:a05:6a20:3d81:b0:cc:32aa:8570 with SMTP id
 s1-20020a056a203d8100b000cc32aa8570mr2804404pzi.14.1677185037488; 
 Thu, 23 Feb 2023 12:43:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/13] accel/tcg: Trigger watchpoints from atomic_mmu_lookup
Date: Thu, 23 Feb 2023 10:43:35 -1000
Message-Id: <20230223204342.1093632-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Fixes a bug in that we weren't reporting these changes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 74ad8e0876..e0765c8c10 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1908,6 +1908,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     CPUTLBEntry *tlbe;
     target_ulong tlb_addr;
     void *hostaddr;
+    CPUTLBEntryFull *full;
 
     tcg_debug_assert(mmu_idx < NB_MMU_MODES);
 
@@ -1947,17 +1948,26 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
             tlb_addr = tlb_addr_write(tlbe) & ~TLB_INVALID_MASK;
         }
 
-        /* Let the guest notice RMW on a write-only page.  */
-        if ((prot & PAGE_READ) &&
-            unlikely(tlbe->addr_read != (tlb_addr & ~TLB_NOTDIRTY))) {
-            tlb_fill(env_cpu(env), addr, size,
-                     MMU_DATA_LOAD, mmu_idx, retaddr);
+        if (prot & PAGE_READ) {
             /*
-             * Since we don't support reads and writes to different addresses,
-             * and we do have the proper page loaded for write, this shouldn't
-             * ever return.  But just in case, handle via stop-the-world.
+             * Let the guest notice RMW on a write-only page.
+             * We have just verified that the page is writable.
+             * Subpage lookups may have left TLB_INVALID_MASK set,
+             * but addr_read will only be -1 if PAGE_READ was unset.
              */
-            goto stop_the_world;
+            if (unlikely(tlbe->addr_read == -1)) {
+                tlb_fill(env_cpu(env), addr, size,
+                         MMU_DATA_LOAD, mmu_idx, retaddr);
+                /*
+                 * Since we don't support reads and writes to different
+                 * addresses, and we do have the proper page loaded for
+                 * write, this shouldn't ever return.  But just in case,
+                 * handle via stop-the-world.
+                 */
+                goto stop_the_world;
+            }
+            /* Collect TLB_WATCHPOINT for read. */
+            tlb_addr |= tlbe->addr_read;
         }
     } else /* if (prot & PAGE_READ) */ {
         tlb_addr = tlbe->addr_read;
@@ -1981,10 +1991,18 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     }
 
     hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
+    full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
 
     if (unlikely(tlb_addr & TLB_NOTDIRTY)) {
-        notdirty_write(env_cpu(env), addr, size,
-                       &env_tlb(env)->d[mmu_idx].fulltlb[index], retaddr);
+        notdirty_write(env_cpu(env), addr, size, full, retaddr);
+    }
+
+    if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
+        QEMU_BUILD_BUG_ON(PAGE_READ != BP_MEM_READ);
+        QEMU_BUILD_BUG_ON(PAGE_WRITE != BP_MEM_WRITE);
+        /* therefore prot == watchpoint bits */
+        cpu_check_watchpoint(env_cpu(env), addr, size,
+                             full->attrs, prot, retaddr);
     }
 
     return hostaddr;
-- 
2.34.1


