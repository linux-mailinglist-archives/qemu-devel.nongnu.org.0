Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6895037A239
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:34:57 +0200 (CEST)
Received: from localhost ([::1]:53530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNqx-00077l-Ss
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNX8-00020y-EA
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWo-0000my-1n
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JWFBMOz0Xdabfb3AJFFA6lf7d3nmXmCEcRhTb0gh8kk=;
 b=iX3jhy/p5X2+EqntOtD8bGnKwKqpV5tK2+xSS331MqTeWpa04655W/x4NXMhrV0YGOuCVA
 XVOo3dnFTOrgzDrkjQO9ztgji8TgKqVrrGyObuzJiZiaXhg0y/5mT5BctYwrvnqmnllZw4
 G1xAQ2yC0cjh23Iz+aBJb+ZgLpUc+yE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-JEWQ6pGCP6KSnpXaRcwVCA-1; Tue, 11 May 2021 04:14:03 -0400
X-MC-Unique: JEWQ6pGCP6KSnpXaRcwVCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 129106D241
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4C226E51B
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/33] target/i386: extract mmu_translate
Date: Tue, 11 May 2021 04:13:41 -0400
Message-Id: <20210511081350.419428-25-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Extract the page table lookup out of handle_mmu_fault, which only has
to invoke mmu_translate and either fill the TLB or deliver the page
fault.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 151 +++++++++++++++------------
 1 file changed, 86 insertions(+), 65 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index e616ac6f13..f1103db64f 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -243,13 +243,11 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
     cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, env->retaddr);
 }
 
-/* return value:
- * -1 = cannot handle fault
- * 0  = nothing more to do
- * 1  = generate PF fault
- */
-static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
-                            int is_write1, int mmu_idx)
+#define PG_ERROR_OK (-1)
+
+static int mmu_translate(CPUState *cs, vaddr addr,
+                         int is_write1, int mmu_idx,
+                         vaddr *xlat, int *page_size, int *prot)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
@@ -257,33 +255,14 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
     int32_t a20_mask;
     target_ulong pde_addr, pte_addr;
     int error_code = 0;
-    int is_dirty, prot, page_size, is_write, is_user;
-    hwaddr paddr;
+    int is_dirty, is_write, is_user;
     uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
     uint32_t page_offset;
-    target_ulong vaddr;
     uint32_t pkr;
 
-    is_user = mmu_idx == MMU_USER_IDX;
-#if defined(DEBUG_MMU)
-    printf("MMU fault: addr=%" VADDR_PRIx " w=%d u=%d eip=" TARGET_FMT_lx "\n",
-           addr, is_write1, is_user, env->eip);
-#endif
+    is_user = (mmu_idx == MMU_USER_IDX);
     is_write = is_write1 & 1;
-
     a20_mask = x86_get_a20_mask(env);
-    if (!(env->cr[0] & CR0_PG_MASK)) {
-        pte = addr;
-#ifdef TARGET_X86_64
-        if (!(env->hflags & HF_LMA_MASK)) {
-            /* Without long mode we can only address 32bits in real mode */
-            pte = (uint32_t)pte;
-        }
-#endif
-        prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-        page_size = 4096;
-        goto do_mapping;
-    }
 
     if (!(env->efer & MSR_EFER_NXE)) {
         rsvd_mask |= PG_NX_MASK;
@@ -361,7 +340,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
             }
             if (pdpe & PG_PSE_MASK) {
                 /* 1 GB page */
-                page_size = 1024 * 1024 * 1024;
+                *page_size = 1024 * 1024 * 1024;
                 pte_addr = pdpe_addr;
                 pte = pdpe;
                 goto do_check_protect;
@@ -397,7 +376,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         ptep &= pde ^ PG_NX_MASK;
         if (pde & PG_PSE_MASK) {
             /* 2 MB page */
-            page_size = 2048 * 1024;
+            *page_size = 2048 * 1024;
             pte_addr = pde_addr;
             pte = pde;
             goto do_check_protect;
@@ -419,7 +398,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         }
         /* combine pde and pte nx, user and rw protections */
         ptep &= pte ^ PG_NX_MASK;
-        page_size = 4096;
+        *page_size = 4096;
     } else {
         uint32_t pde;
 
@@ -435,7 +414,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
 
         /* if PSE bit is set, then we use a 4MB page */
         if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
-            page_size = 4096 * 1024;
+            *page_size = 4096 * 1024;
             pte_addr = pde_addr;
 
             /* Bits 20-13 provide bits 39-32 of the address, bit 21 is reserved.
@@ -461,12 +440,12 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         }
         /* combine pde and pte user and rw protections */
         ptep &= pte | PG_NX_MASK;
-        page_size = 4096;
+        *page_size = 4096;
         rsvd_mask = 0;
     }
 
 do_check_protect:
-    rsvd_mask |= (page_size - 1) & PG_ADDRESS_MASK & ~PG_PSE_PAT_MASK;
+    rsvd_mask |= (*page_size - 1) & PG_ADDRESS_MASK & ~PG_PSE_PAT_MASK;
 do_check_protect_pse36:
     if (pte & rsvd_mask) {
         goto do_fault_rsvd;
@@ -478,17 +457,17 @@ do_check_protect_pse36:
         goto do_fault_protect;
     }
 
-    prot = 0;
+    *prot = 0;
     if (mmu_idx != MMU_KSMAP_IDX || !(ptep & PG_USER_MASK)) {
-        prot |= PAGE_READ;
+        *prot |= PAGE_READ;
         if ((ptep & PG_RW_MASK) || (!is_user && !(env->cr[0] & CR0_WP_MASK))) {
-            prot |= PAGE_WRITE;
+            *prot |= PAGE_WRITE;
         }
     }
     if (!(ptep & PG_NX_MASK) &&
         (mmu_idx == MMU_USER_IDX ||
          !((env->cr[4] & CR4_SMEP_MASK) && (ptep & PG_USER_MASK)))) {
-        prot |= PAGE_EXEC;
+        *prot |= PAGE_EXEC;
     }
 
     if (!(env->hflags & HF_LMA_MASK)) {
@@ -510,7 +489,7 @@ do_check_protect_pse36:
             pkr_prot &= ~PAGE_WRITE;
         }
 
-        prot &= pkr_prot;
+        *prot &= pkr_prot;
         if ((pkr_prot & (1 << is_write1)) == 0) {
             assert(is_write1 != 2);
             error_code |= PG_ERROR_PK_MASK;
@@ -518,7 +497,7 @@ do_check_protect_pse36:
         }
     }
 
-    if ((prot & (1 << is_write1)) == 0) {
+    if ((*prot & (1 << is_write1)) == 0) {
         goto do_fault_protect;
     }
 
@@ -536,26 +515,17 @@ do_check_protect_pse36:
         /* only set write access if already dirty... otherwise wait
            for dirty access */
         assert(!is_write);
-        prot &= ~PAGE_WRITE;
+        *prot &= ~PAGE_WRITE;
     }
 
- do_mapping:
     pte = pte & a20_mask;
 
     /* align to page_size */
-    pte &= PG_ADDRESS_MASK & ~(page_size - 1);
-    page_offset = addr & (page_size - 1);
-    paddr = get_hphys(cs, pte + page_offset, is_write1, &prot);
-
-    /* Even if 4MB pages, we map only one 4KB page in the cache to
-       avoid filling it too fast */
-    vaddr = addr & TARGET_PAGE_MASK;
-    paddr &= TARGET_PAGE_MASK;
-
-    assert(prot & (1 << is_write1));
-    tlb_set_page_with_attrs(cs, vaddr, paddr, cpu_get_mem_attrs(env),
-                            prot, mmu_idx, page_size);
-    return 0;
+    pte &= PG_ADDRESS_MASK & ~(*page_size - 1);
+    page_offset = addr & (*page_size - 1);
+    *xlat = get_hphys(cs, pte + page_offset, is_write1, prot);
+    return PG_ERROR_OK;
+
  do_fault_rsvd:
     error_code |= PG_ERROR_RSVD_MASK;
  do_fault_protect:
@@ -566,20 +536,71 @@ do_check_protect_pse36:
         error_code |= PG_ERROR_U_MASK;
     if (is_write1 == 2 &&
         (((env->efer & MSR_EFER_NXE) &&
-          (env->cr[4] & CR4_PAE_MASK)) ||
+	  (env->cr[4] & CR4_PAE_MASK)) ||
          (env->cr[4] & CR4_SMEP_MASK)))
         error_code |= PG_ERROR_I_D_MASK;
-    if (env->intercept_exceptions & (1 << EXCP0E_PAGE)) {
-        /* cr2 is not modified in case of exceptions */
-        x86_stq_phys(cs,
-                 env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
-                 addr);
+    return error_code;
+}
+
+/* return value:
+ * -1 = cannot handle fault
+ * 0  = nothing more to do
+ * 1  = generate PF fault
+ */
+static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
+                            int is_write1, int mmu_idx)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    int error_code = PG_ERROR_OK;
+    int prot, page_size;
+    hwaddr paddr;
+    target_ulong vaddr;
+
+#if defined(DEBUG_MMU)
+    printf("MMU fault: addr=%" VADDR_PRIx " w=%d mmu=%d eip=" TARGET_FMT_lx "\n",
+           addr, is_write1, mmu_idx, env->eip);
+#endif
+
+    if (!(env->cr[0] & CR0_PG_MASK)) {
+        paddr = addr;
+#ifdef TARGET_X86_64
+        if (!(env->hflags & HF_LMA_MASK)) {
+            /* Without long mode we can only address 32bits in real mode */
+            paddr = (uint32_t)paddr;
+        }
+#endif
+        prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        page_size = 4096;
     } else {
-        env->cr[2] = addr;
+        error_code = mmu_translate(cs, addr, is_write1,
+                                   mmu_idx,
+                                   &paddr, &page_size, &prot);
+    }
+
+    if (error_code == PG_ERROR_OK) {
+        /* Even if 4MB pages, we map only one 4KB page in the cache to
+           avoid filling it too fast */
+        vaddr = addr & TARGET_PAGE_MASK;
+        paddr &= TARGET_PAGE_MASK;
+
+        assert(prot & (1 << is_write1));
+        tlb_set_page_with_attrs(cs, vaddr, paddr, cpu_get_mem_attrs(env),
+                                prot, mmu_idx, page_size);
+        return 0;
+    } else {
+        if (env->intercept_exceptions & (1 << EXCP0E_PAGE)) {
+            /* cr2 is not modified in case of exceptions */
+            x86_stq_phys(cs,
+                     env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
+                     addr);
+        } else {
+            env->cr[2] = addr;
+        }
+        env->error_code = error_code;
+        cs->exception_index = EXCP0E_PAGE;
+        return 1;
     }
-    env->error_code = error_code;
-    cs->exception_index = EXCP0E_PAGE;
-    return 1;
 }
 
 bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-- 
2.26.2



