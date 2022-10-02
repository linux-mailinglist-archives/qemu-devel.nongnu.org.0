Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677C15F244A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:34:23 +0200 (CEST)
Received: from localhost ([::1]:46056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of2r8-0001I0-Gn
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2na-0005Su-N7
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nY-0006Dx-Ke
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:42 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so13381615pjq.3
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VyGbb/0J0vMK6bF+G0mq3pXbWvnyBKF6qVOQJ948d5w=;
 b=OcVHO8gYbcZyTJueMVSMFHDFYDsVbHbhmW0nDfnF2c+sVjZqQo49hWDBcuPNs98jeI
 D85EDZPn4K+HqfW2TtA+9dS2ITrymJf3IIF8dH0HEEi4KrUvhC4QwIyWscXysTQjolGX
 A7/x58/wbXgp/bmmlSZQPvcGz0j+HbD0GCWbHRYQ709K3qz04PNUhdha3ZiC2n8v6Jwe
 6HzXbYbcmzqySQ/SMU8upMVw1ZiB50PIwIwBqAudkmhG8eRiOVzr6rZNycV0UZmy173e
 6kXbiNsSViPPUJZCKk35bXNLITLWW/t3Y49BUQa8UyWcqRt2/mnECGcMJiRah2kz9AHY
 m1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VyGbb/0J0vMK6bF+G0mq3pXbWvnyBKF6qVOQJ948d5w=;
 b=IuN+IxiZcBC0hcNy8tcaSziqSnivl7/hZ4nqlSOBP763aidT7Mxjz+my/mam8/hSV+
 M33ApQstEWY5qm6zIx2ak4JHo9NgtbxkhuiCSKa+araPyildEYnlYzRW/v/N8CIgHk3E
 toIrbdlIlGtw9OGUvPGHkK/7N6+plQyDe4UUyupeC4/NuV+sVCzEpHGf20m+5X/D5fB/
 jRuZ3pl4KevpZbDYdg0UAaNv+JlcrLtLAYWHNWcZ9zGHiDHXcigCDukT61kog69KQ/De
 wbZWMG0iCiDmrT1sFLb3YD1Cs2cmdbXWtRZvU260lMSrnwioMD9+4T2KvvQJoPFQuOah
 PdFA==
X-Gm-Message-State: ACrzQf3YEAOT2HOZGcww0gg9LDm67nDqTCl+vf2d7rHnWso7gzjvres7
 jahfNL9peEsKS0Iw4gYdjc+ZA+K8z4zNnQ==
X-Google-Smtp-Source: AMsMyM6IqDcWUCBD7I7zgFOA28krWoXBkMq1JpuZuMOmFq7E+SLqxKnGEWdD+H4SOjVq/V8eFU06Mg==
X-Received: by 2002:a17:90b:3b47:b0:202:d9d4:23f7 with SMTP id
 ot7-20020a17090b3b4700b00202d9d423f7mr8376560pjb.56.1664731839214; 
 Sun, 02 Oct 2022 10:30:39 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8002:3cad:72cd:dd96:98f6:c3cf])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62168d000000b0056025ccc3bbsm2749783pfw.146.2022.10.02.10.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 10:30:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 7/9] target/i386: Combine 5 sets of variables in
 mmu_translate
Date: Sun,  2 Oct 2022 10:29:54 -0700
Message-Id: <20221002172956.265735-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221002172956.265735-1-richard.henderson@linaro.org>
References: <20221002172956.265735-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

We don't need one variable set per translation level,
which requires copying into pte/pte_addr for huge pages.
Standardize on pte/pte_addr for all levels.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 178 ++++++++++++++-------------
 1 file changed, 91 insertions(+), 87 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 86b3014196..d6b7de6eea 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -82,7 +82,7 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
     const bool is_user = (in->mmu_idx == MMU_USER_IDX);
     const MMUAccessType access_type = in->access_type;
     uint64_t ptep, pte;
-    hwaddr pde_addr, pte_addr;
+    hwaddr pte_addr;
     uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
     uint32_t pkr;
     int page_size;
@@ -92,116 +92,122 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
     }
 
     if (pg_mode & PG_MODE_PAE) {
-        uint64_t pde, pdpe;
-        target_ulong pdpe_addr;
-
 #ifdef TARGET_X86_64
         if (pg_mode & PG_MODE_LMA) {
-            bool la57 = pg_mode & PG_MODE_LA57;
-            uint64_t pml5e_addr, pml5e;
-            uint64_t pml4e_addr, pml4e;
-
-            if (la57) {
-                pml5e_addr = ((in->cr3 & ~0xfff) +
-                        (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
-                PTE_HPHYS(pml5e_addr);
-                pml5e = x86_ldq_phys(cs, pml5e_addr);
-                if (!(pml5e & PG_PRESENT_MASK)) {
+            if (pg_mode & PG_MODE_LA57) {
+                /*
+                 * Page table level 5
+                 */
+                pte_addr = ((in->cr3 & ~0xfff) +
+                            (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
+                PTE_HPHYS(pte_addr);
+                pte = x86_ldq_phys(cs, pte_addr);
+                if (!(pte & PG_PRESENT_MASK)) {
                     goto do_fault;
                 }
-                if (pml5e & (rsvd_mask | PG_PSE_MASK)) {
+                if (pte & (rsvd_mask | PG_PSE_MASK)) {
                     goto do_fault_rsvd;
                 }
-                if (!(pml5e & PG_ACCESSED_MASK)) {
-                    pml5e |= PG_ACCESSED_MASK;
-                    x86_stl_phys_notdirty(cs, pml5e_addr, pml5e);
+                if (!(pte & PG_ACCESSED_MASK)) {
+                    pte |= PG_ACCESSED_MASK;
+                    x86_stl_phys_notdirty(cs, pte_addr, pte);
                 }
-                ptep = pml5e ^ PG_NX_MASK;
+                ptep = pte ^ PG_NX_MASK;
             } else {
-                pml5e = in->cr3;
+                pte = in->cr3;
                 ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
             }
 
-            pml4e_addr = ((pml5e & PG_ADDRESS_MASK) +
-                    (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
-            PTE_HPHYS(pml4e_addr);
-            pml4e = x86_ldq_phys(cs, pml4e_addr);
-            if (!(pml4e & PG_PRESENT_MASK)) {
+            /*
+             * Page table level 4
+             */
+            pte_addr = ((pte & PG_ADDRESS_MASK) +
+                        (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
+            PTE_HPHYS(pte_addr);
+            pte = x86_ldq_phys(cs, pte_addr);
+            if (!(pte & PG_PRESENT_MASK)) {
                 goto do_fault;
             }
-            if (pml4e & (rsvd_mask | PG_PSE_MASK)) {
+            if (pte & (rsvd_mask | PG_PSE_MASK)) {
                 goto do_fault_rsvd;
             }
-            if (!(pml4e & PG_ACCESSED_MASK)) {
-                pml4e |= PG_ACCESSED_MASK;
-                x86_stl_phys_notdirty(cs, pml4e_addr, pml4e);
+            if (!(pte & PG_ACCESSED_MASK)) {
+                pte |= PG_ACCESSED_MASK;
+                x86_stl_phys_notdirty(cs, pte_addr, pte);
             }
-            ptep &= pml4e ^ PG_NX_MASK;
-            pdpe_addr = ((pml4e & PG_ADDRESS_MASK) + (((addr >> 30) & 0x1ff) << 3)) &
-                a20_mask;
-            PTE_HPHYS(pdpe_addr);
-            pdpe = x86_ldq_phys(cs, pdpe_addr);
-            if (!(pdpe & PG_PRESENT_MASK)) {
+            ptep &= pte ^ PG_NX_MASK;
+
+            /*
+             * Page table level 3
+             */
+            pte_addr = ((pte & PG_ADDRESS_MASK) +
+                        (((addr >> 30) & 0x1ff) << 3)) & a20_mask;
+            PTE_HPHYS(pte_addr);
+            pte = x86_ldq_phys(cs, pte_addr);
+            if (!(pte & PG_PRESENT_MASK)) {
                 goto do_fault;
             }
-            if (pdpe & rsvd_mask) {
+            if (pte & rsvd_mask) {
                 goto do_fault_rsvd;
             }
-            ptep &= pdpe ^ PG_NX_MASK;
-            if (!(pdpe & PG_ACCESSED_MASK)) {
-                pdpe |= PG_ACCESSED_MASK;
-                x86_stl_phys_notdirty(cs, pdpe_addr, pdpe);
+            ptep &= pte ^ PG_NX_MASK;
+            if (!(pte & PG_ACCESSED_MASK)) {
+                pte |= PG_ACCESSED_MASK;
+                x86_stl_phys_notdirty(cs, pte_addr, pte);
             }
-            if (pdpe & PG_PSE_MASK) {
+            if (pte & PG_PSE_MASK) {
                 /* 1 GB page */
                 page_size = 1024 * 1024 * 1024;
-                pte_addr = pdpe_addr;
-                pte = pdpe;
                 goto do_check_protect;
             }
         } else
 #endif
         {
-            /* XXX: load them when cr3 is loaded ? */
-            pdpe_addr = ((in->cr3 & ~0x1f) + ((addr >> 27) & 0x18)) &
-                a20_mask;
-            PTE_HPHYS(pdpe_addr);
-            pdpe = x86_ldq_phys(cs, pdpe_addr);
-            if (!(pdpe & PG_PRESENT_MASK)) {
+            /*
+             * Page table level 3
+             */
+            pte_addr = ((in->cr3 & ~0x1f) + ((addr >> 27) & 0x18)) & a20_mask;
+            PTE_HPHYS(pte_addr);
+            pte = x86_ldq_phys(cs, pte_addr);
+            if (!(pte & PG_PRESENT_MASK)) {
                 goto do_fault;
             }
             rsvd_mask |= PG_HI_USER_MASK;
-            if (pdpe & (rsvd_mask | PG_NX_MASK)) {
+            if (pte & (rsvd_mask | PG_NX_MASK)) {
                 goto do_fault_rsvd;
             }
             ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
         }
 
-        pde_addr = ((pdpe & PG_ADDRESS_MASK) + (((addr >> 21) & 0x1ff) << 3)) &
-            a20_mask;
-        PTE_HPHYS(pde_addr);
-        pde = x86_ldq_phys(cs, pde_addr);
-        if (!(pde & PG_PRESENT_MASK)) {
+        /*
+         * Page table level 2
+         */
+        pte_addr = ((pte & PG_ADDRESS_MASK) +
+                    (((addr >> 21) & 0x1ff) << 3)) & a20_mask;
+        PTE_HPHYS(pte_addr);
+        pte = x86_ldq_phys(cs, pte_addr);
+        if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
         }
-        if (pde & rsvd_mask) {
+        if (pte & rsvd_mask) {
             goto do_fault_rsvd;
         }
-        ptep &= pde ^ PG_NX_MASK;
-        if (pde & PG_PSE_MASK) {
+        ptep &= pte ^ PG_NX_MASK;
+        if (pte & PG_PSE_MASK) {
             /* 2 MB page */
             page_size = 2048 * 1024;
-            pte_addr = pde_addr;
-            pte = pde;
             goto do_check_protect;
         }
-        /* 4 KB page */
-        if (!(pde & PG_ACCESSED_MASK)) {
-            pde |= PG_ACCESSED_MASK;
-            x86_stl_phys_notdirty(cs, pde_addr, pde);
+        if (!(pte & PG_ACCESSED_MASK)) {
+            pte |= PG_ACCESSED_MASK;
+            x86_stl_phys_notdirty(cs, pte_addr, pte);
         }
-        pte_addr = ((pde & PG_ADDRESS_MASK) + (((addr >> 12) & 0x1ff) << 3)) &
-            a20_mask;
+
+        /*
+         * Page table level 1
+         */
+        pte_addr = ((pte & PG_ADDRESS_MASK) +
+                    (((addr >> 12) & 0x1ff) << 3)) & a20_mask;
         PTE_HPHYS(pte_addr);
         pte = x86_ldq_phys(cs, pte_addr);
         if (!(pte & PG_PRESENT_MASK)) {
@@ -214,39 +220,37 @@ static bool mmu_translate(CPUX86State *env, const TranslateParams *in,
         ptep &= pte ^ PG_NX_MASK;
         page_size = 4096;
     } else {
-        uint32_t pde;
-
-        /* page directory entry */
-        pde_addr = ((in->cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) &
-            a20_mask;
-        PTE_HPHYS(pde_addr);
-        pde = x86_ldl_phys(cs, pde_addr);
-        if (!(pde & PG_PRESENT_MASK)) {
+        /*
+         * Page table level 2
+         */
+        pte_addr = ((in->cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) & a20_mask;
+        PTE_HPHYS(pte_addr);
+        pte = x86_ldl_phys(cs, pte_addr);
+        if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
         }
-        ptep = pde | PG_NX_MASK;
+        ptep = pte | PG_NX_MASK;
 
         /* if PSE bit is set, then we use a 4MB page */
-        if ((pde & PG_PSE_MASK) && (pg_mode & PG_MODE_PSE)) {
+        if ((pte & PG_PSE_MASK) && (pg_mode & PG_MODE_PSE)) {
             page_size = 4096 * 1024;
-            pte_addr = pde_addr;
-
-            /* Bits 20-13 provide bits 39-32 of the address, bit 21 is reserved.
+            /*
+             * Bits 20-13 provide bits 39-32 of the address, bit 21 is reserved.
              * Leave bits 20-13 in place for setting accessed/dirty bits below.
              */
-            pte = pde | ((pde & 0x1fe000LL) << (32 - 13));
+            pte = (uint32_t)pte | ((pte & 0x1fe000LL) << (32 - 13));
             rsvd_mask = 0x200000;
             goto do_check_protect_pse36;
         }
-
-        if (!(pde & PG_ACCESSED_MASK)) {
-            pde |= PG_ACCESSED_MASK;
-            x86_stl_phys_notdirty(cs, pde_addr, pde);
+        if (!(pte & PG_ACCESSED_MASK)) {
+            pte |= PG_ACCESSED_MASK;
+            x86_stl_phys_notdirty(cs, pte_addr, pte);
         }
 
-        /* page directory entry */
-        pte_addr = ((pde & ~0xfff) + ((addr >> 10) & 0xffc)) &
-            a20_mask;
+        /*
+         * Page table level 1
+         */
+        pte_addr = ((pte & ~0xfffu) + ((addr >> 10) & 0xffc)) & a20_mask;
         PTE_HPHYS(pte_addr);
         pte = x86_ldl_phys(cs, pte_addr);
         if (!(pte & PG_PRESENT_MASK)) {
-- 
2.34.1


