Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718DF59CD1E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:19:05 +0200 (CEST)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHdI-0001nh-56
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJE-0004Kn-9T
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:20 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:37487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJC-0002kq-Fq
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:20 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 x14-20020a17090a8a8e00b001fb61a71d99so395414pjn.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1WOj2RIpy/NMuzgGtfm/77hXAf37fWZV2SfkPXv9pXE=;
 b=Cvp07sYSSWvtQTGKbKncOyAa63NLefvqTKia1RxUU8uHdU8FIKUme41B2mGMplzjVX
 p94iLgZGAApmTS3UAAX3LXuBeCdbjp3+cKlAIggkql3sLwd87JafgF4VfiumURKp4ZJq
 AXGSFb3nIXky9K0EQGMcnu84UdrEQFz1fu9mvJj0GkHtGg+jpBrp7ChqFr4+Jz3fpjiy
 HJHcys8HD872ZZx3CUFyaYyGsvQJ+CeLHmCke0MssLuYUQ6mLeYuFdxvEKj0Ea7BchRx
 xhUF5aUffVqF1oKtWMpGnq7m+uTqHp683UKt4DDZyt7v3r38ECC34H+ozsXoVvMxcpYi
 QJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1WOj2RIpy/NMuzgGtfm/77hXAf37fWZV2SfkPXv9pXE=;
 b=A98/x4FEZnTBIRv4SJ3c+afnhT4Ctsnr0o+k+YUIEHS2iucXgOhQ/kCQPPc8OZtj1X
 keZXH2RMhl6h/1+SFQq/vQzSf3Q0JVN/P3H5TTI/Fx7Pb1h/sotovYaWzjIeYTEVHBaj
 Lj/VHuZ9m06FGJLpnNqNPD/hktj+gLHMJquffK3mOZY/H/4ZzOs6cW9TKgluDNgGPO5V
 miPP0tJT2saEtJfDZknjgyyMAYhRYZhrnkWVuwSNyiGXuufMd6oJlmML0Wm17yrtbTzX
 YbgQCthJm1WV5vJ9ipX2CHVynvFJUeOrtgkkHa1xLWdm/woqtiovP1YB/z2q3TzIZd45
 fGqg==
X-Gm-Message-State: ACgBeo3UN/hp/Ueyb8laWOJASqo9ABs8/AWwOcpKNaj/XCLKuEYyp5l+
 z6DYwpb5ZxgbwtJwS2JsnMdwgiOB7yw0hA==
X-Google-Smtp-Source: AA6agR7uSyLY5MDToCEkNW9Tqi4/e7d+JtXtYgTALuLxXXT4Of7VLeazBnXj4UgtneOo1kerxN2WKQ==
X-Received: by 2002:a17:90b:17c8:b0:1f5:4724:981f with SMTP id
 me8-20020a17090b17c800b001f54724981fmr691232pjb.205.1661212696017; 
 Mon, 22 Aug 2022 16:58:16 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 13/14] target/i386: Combine 5 sets of variables in
 mmu_translate
Date: Mon, 22 Aug 2022 16:58:02 -0700
Message-Id: <20220822235803.1729290-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

We don't need one variable set per translation level,
which requires copying into pte/pte_addr for huge pages.
Standardize on pte/pte_addr for all levels.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 178 ++++++++++++++-------------
 1 file changed, 91 insertions(+), 87 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 11f64e5965..e5d9ff138e 100644
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


