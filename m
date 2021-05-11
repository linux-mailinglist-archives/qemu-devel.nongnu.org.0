Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0F37A1C8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:27:06 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNjN-0002EH-KG
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNX7-00020i-0e
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWp-0000oc-Ci
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Wu75g9nPBBOm6Lz0fk+PoYu34g1+EO7X5++owBwfEU=;
 b=VdFAoSHuw470beuBTcm8hrSVFjbF9/dCugxf1qB+/V/skAJuMdKC9zr2uiSTx77sOdW938
 CcSaOSvfEaupPlgG2sQsexhQ8whRbJh36lq0Ro429Gd3b7sqX8if0OjzLxC5p8OTNdVM6q
 R895wvA692Di55txc9dTddJP11GrtvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-AcfbCWluM3G86z26pPUllw-1; Tue, 11 May 2021 04:14:05 -0400
X-MC-Unique: AcfbCWluM3G86z26pPUllw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50A1A801817
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BBD76E407
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/33] target/i386: use mmu_translate for NPT walk
Date: Tue, 11 May 2021 04:13:45 -0400
Message-Id: <20210511081350.419428-29-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Unify the duplicate code between get_hphys and mmu_translate, by simply
making get_hphys call mmu_translate.  This also fixes the support for
5-level nested page tables.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 243 ++++-----------------------
 1 file changed, 36 insertions(+), 207 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 082ddbb911..b6d940e04e 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -54,210 +54,6 @@ int get_pg_mode(CPUX86State *env)
     return pg_mode;
 }
 
-static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-                        int *prot)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-    uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
-    uint64_t ptep, pte;
-    uint64_t exit_info_1 = 0;
-    target_ulong pde_addr, pte_addr;
-    uint32_t page_offset;
-    int page_size;
-
-    if (likely(!(env->hflags2 & HF2_NPT_MASK))) {
-        return gphys;
-    }
-
-    if (!(env->nested_pg_mode & PG_MODE_NXE)) {
-        rsvd_mask |= PG_NX_MASK;
-    }
-
-    if (env->nested_pg_mode & PG_MODE_PAE) {
-        uint64_t pde, pdpe;
-        target_ulong pdpe_addr;
-
-#ifdef TARGET_X86_64
-        if (env->nested_pg_mode & PG_MODE_LMA) {
-            uint64_t pml5e;
-            uint64_t pml4e_addr, pml4e;
-
-            pml5e = env->nested_cr3;
-            ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
-
-            pml4e_addr = (pml5e & PG_ADDRESS_MASK) +
-                    (((gphys >> 39) & 0x1ff) << 3);
-            pml4e = x86_ldq_phys(cs, pml4e_addr);
-            if (!(pml4e & PG_PRESENT_MASK)) {
-                goto do_fault;
-            }
-            if (pml4e & (rsvd_mask | PG_PSE_MASK)) {
-                goto do_fault_rsvd;
-            }
-            if (!(pml4e & PG_ACCESSED_MASK)) {
-                pml4e |= PG_ACCESSED_MASK;
-                x86_stl_phys_notdirty(cs, pml4e_addr, pml4e);
-            }
-            ptep &= pml4e ^ PG_NX_MASK;
-            pdpe_addr = (pml4e & PG_ADDRESS_MASK) +
-                    (((gphys >> 30) & 0x1ff) << 3);
-            pdpe = x86_ldq_phys(cs, pdpe_addr);
-            if (!(pdpe & PG_PRESENT_MASK)) {
-                goto do_fault;
-            }
-            if (pdpe & rsvd_mask) {
-                goto do_fault_rsvd;
-            }
-            ptep &= pdpe ^ PG_NX_MASK;
-            if (!(pdpe & PG_ACCESSED_MASK)) {
-                pdpe |= PG_ACCESSED_MASK;
-                x86_stl_phys_notdirty(cs, pdpe_addr, pdpe);
-            }
-            if (pdpe & PG_PSE_MASK) {
-                /* 1 GB page */
-                page_size = 1024 * 1024 * 1024;
-                pte_addr = pdpe_addr;
-                pte = pdpe;
-                goto do_check_protect;
-            }
-        } else
-#endif
-        {
-            pdpe_addr = (env->nested_cr3 & ~0x1f) + ((gphys >> 27) & 0x18);
-            pdpe = x86_ldq_phys(cs, pdpe_addr);
-            if (!(pdpe & PG_PRESENT_MASK)) {
-                goto do_fault;
-            }
-            rsvd_mask |= PG_HI_USER_MASK;
-            if (pdpe & (rsvd_mask | PG_NX_MASK)) {
-                goto do_fault_rsvd;
-            }
-            ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
-        }
-
-        pde_addr = (pdpe & PG_ADDRESS_MASK) + (((gphys >> 21) & 0x1ff) << 3);
-        pde = x86_ldq_phys(cs, pde_addr);
-        if (!(pde & PG_PRESENT_MASK)) {
-            goto do_fault;
-        }
-        if (pde & rsvd_mask) {
-            goto do_fault_rsvd;
-        }
-        ptep &= pde ^ PG_NX_MASK;
-        if (pde & PG_PSE_MASK) {
-            /* 2 MB page */
-            page_size = 2048 * 1024;
-            pte_addr = pde_addr;
-            pte = pde;
-            goto do_check_protect;
-        }
-        /* 4 KB page */
-        if (!(pde & PG_ACCESSED_MASK)) {
-            pde |= PG_ACCESSED_MASK;
-            x86_stl_phys_notdirty(cs, pde_addr, pde);
-        }
-        pte_addr = (pde & PG_ADDRESS_MASK) + (((gphys >> 12) & 0x1ff) << 3);
-        pte = x86_ldq_phys(cs, pte_addr);
-        if (!(pte & PG_PRESENT_MASK)) {
-            goto do_fault;
-        }
-        if (pte & rsvd_mask) {
-            goto do_fault_rsvd;
-        }
-        /* combine pde and pte nx, user and rw protections */
-        ptep &= pte ^ PG_NX_MASK;
-        page_size = 4096;
-    } else {
-        uint32_t pde;
-
-        /* page directory entry */
-        pde_addr = (env->nested_cr3 & ~0xfff) + ((gphys >> 20) & 0xffc);
-        pde = x86_ldl_phys(cs, pde_addr);
-        if (!(pde & PG_PRESENT_MASK)) {
-            goto do_fault;
-        }
-        ptep = pde | PG_NX_MASK;
-
-        /* if host cr4 PSE bit is set, then we use a 4MB page */
-        if ((pde & PG_PSE_MASK) && (env->nested_pg_mode & PG_MODE_PSE)) {
-            page_size = 4096 * 1024;
-            pte_addr = pde_addr;
-
-            /* Bits 20-13 provide bits 39-32 of the address, bit 21 is reserved.
-             * Leave bits 20-13 in place for setting accessed/dirty bits below.
-             */
-            pte = pde | ((pde & 0x1fe000LL) << (32 - 13));
-            rsvd_mask = 0x200000;
-            goto do_check_protect_pse36;
-        }
-
-        if (!(pde & PG_ACCESSED_MASK)) {
-            pde |= PG_ACCESSED_MASK;
-            x86_stl_phys_notdirty(cs, pde_addr, pde);
-        }
-
-        /* page directory entry */
-        pte_addr = (pde & ~0xfff) + ((gphys >> 10) & 0xffc);
-        pte = x86_ldl_phys(cs, pte_addr);
-        if (!(pte & PG_PRESENT_MASK)) {
-            goto do_fault;
-        }
-        /* combine pde and pte user and rw protections */
-        ptep &= pte | PG_NX_MASK;
-        page_size = 4096;
-        rsvd_mask = 0;
-    }
-
- do_check_protect:
-    rsvd_mask |= (page_size - 1) & PG_ADDRESS_MASK & ~PG_PSE_PAT_MASK;
- do_check_protect_pse36:
-    if (pte & rsvd_mask) {
-        goto do_fault_rsvd;
-    }
-    ptep ^= PG_NX_MASK;
-
-    if (!(ptep & PG_USER_MASK)) {
-        goto do_fault_protect;
-    }
-    if (ptep & PG_NX_MASK) {
-        if (access_type == MMU_INST_FETCH) {
-            goto do_fault_protect;
-        }
-        *prot &= ~PAGE_EXEC;
-    }
-    if (!(ptep & PG_RW_MASK)) {
-        if (access_type == MMU_DATA_STORE) {
-            goto do_fault_protect;
-        }
-        *prot &= ~PAGE_WRITE;
-    }
-
-    pte &= PG_ADDRESS_MASK & ~(page_size - 1);
-    page_offset = gphys & (page_size - 1);
-    return pte + page_offset;
-
- do_fault_rsvd:
-    exit_info_1 |= PG_ERROR_RSVD_MASK;
- do_fault_protect:
-    exit_info_1 |= PG_ERROR_P_MASK;
- do_fault:
-    x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
-                 gphys);
-    exit_info_1 |= PG_ERROR_U_MASK;
-    if (access_type == MMU_DATA_STORE) {
-        exit_info_1 |= PG_ERROR_W_MASK;
-    } else if (access_type == MMU_INST_FETCH) {
-        exit_info_1 |= PG_ERROR_I_D_MASK;
-    }
-    if (prot) {
-        exit_info_1 |= SVM_NPTEXIT_GPA;
-    } else { /* page table access */
-        exit_info_1 |= SVM_NPTEXIT_GPT;
-    }
-    cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, env->retaddr);
-}
-
 #define PG_ERROR_OK (-1)
 
 typedef hwaddr (*MMUTranslateFunc)(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
@@ -266,9 +62,9 @@ typedef hwaddr (*MMUTranslateFunc)(CPUState *cs, hwaddr gphys, MMUAccessType acc
 #define GET_HPHYS(cs, gpa, access_type, prot)  \
 	(get_hphys_func ? get_hphys_func(cs, gpa, access_type, prot) : gpa)
 
-static int mmu_translate(CPUState *cs, vaddr addr, MMUTranslateFunc get_hphys_func,
+static int mmu_translate(CPUState *cs, hwaddr addr, MMUTranslateFunc get_hphys_func,
                          uint64_t cr3, int is_write1, int mmu_idx, int pg_mode,
-                         vaddr *xlat, int *page_size, int *prot)
+                         hwaddr *xlat, int *page_size, int *prot)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -562,6 +358,39 @@ do_check_protect_pse36:
     return error_code;
 }
 
+static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
+                        int *prot)
+{
+    CPUX86State *env = &X86_CPU(cs)->env;
+    uint64_t exit_info_1;
+    int page_size;
+    int next_prot;
+    hwaddr hphys;
+
+    if (likely(!(env->hflags2 & HF2_NPT_MASK))) {
+        return gphys;
+    }
+
+    exit_info_1 = mmu_translate(cs, gphys, NULL, env->nested_cr3,
+                               access_type, MMU_USER_IDX, env->nested_pg_mode,
+                               &hphys, &page_size, &next_prot);
+    if (exit_info_1 == PG_ERROR_OK) {
+        if (prot) {
+            *prot &= next_prot;
+        }
+        return hphys;
+    }
+
+    x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
+                 gphys);
+    if (prot) {
+        exit_info_1 |= SVM_NPTEXIT_GPA;
+    } else { /* page table access */
+        exit_info_1 |= SVM_NPTEXIT_GPT;
+    }
+    cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, env->retaddr);
+}
+
 /* return value:
  * -1 = cannot handle fault
  * 0  = nothing more to do
@@ -575,7 +404,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
     int error_code = PG_ERROR_OK;
     int pg_mode, prot, page_size;
     hwaddr paddr;
-    target_ulong vaddr;
+    hwaddr vaddr;
 
 #if defined(DEBUG_MMU)
     printf("MMU fault: addr=%" VADDR_PRIx " w=%d mmu=%d eip=" TARGET_FMT_lx "\n",
-- 
2.26.2



