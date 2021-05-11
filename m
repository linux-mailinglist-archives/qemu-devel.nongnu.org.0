Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA037A24D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:38:48 +0200 (CEST)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNuh-0005Es-MO
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNXE-00025Y-AW
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWp-0000nt-Co
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVPONghybhZwrtXyYEZP/I6uUOgbQ6SHhO0hHMchL8M=;
 b=FiUgZ3Fbuo7kbGx/HXGZvnuyXN26KU4kVTUCrLHcqLtQg/q11EWeDw5dtkvf5y6mwGkOfj
 HEjipbrwudrEl444iCj5Gvv/vU3IWyqpzcedIlq1xpHIPpLkOv/gJ0uu468aRYF1LkPgns
 ZlVKVGWstXmvsieQACGL9NFRZI1/y8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-Ycgn4t9ZM2OTl0NjhAbp_A-1; Tue, 11 May 2021 04:14:04 -0400
X-MC-Unique: Ycgn4t9ZM2OTl0NjhAbp_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA8D41006C81
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7884F6E407
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/33] target/i386: extend pg_mode to more CR0 and CR4 bits
Date: Tue, 11 May 2021 04:13:43 -0400
Message-Id: <20210511081350.419428-27-pbonzini@redhat.com>
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

In order to unify the two stages of page table lookup, we need
mmu_translate to use either the host CR0/EFER/CR4 or the guest's.
To do so, make mmu_translate use the same pg_mode constants that
were used for the NPT lookup.

This also prepares for adding 5-level NPT support, which however does
not work yet.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h                    |  8 +++++
 target/i386/tcg/sysemu/excp_helper.c | 45 ++++++++++++++++++----------
 target/i386/tcg/sysemu/svm_helper.c  |  2 +-
 3 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index dbebd67f98..324ef92beb 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -307,6 +307,14 @@ typedef enum X86Seg {
 #define PG_MODE_LMA      (1 << 1)
 #define PG_MODE_NXE      (1 << 2)
 #define PG_MODE_PSE      (1 << 3)
+#define PG_MODE_LA57     (1 << 4)
+#define PG_MODE_SVM_MASK MAKE_64BIT_MASK(0, 15)
+
+/* Bits of CR4 that do not affect the NPT page format.  */
+#define PG_MODE_WP       (1 << 16)
+#define PG_MODE_PKE      (1 << 17)
+#define PG_MODE_PKS      (1 << 18)
+#define PG_MODE_SMEP     (1 << 19)
 
 #define MCG_CTL_P       (1ULL<<8)   /* MCG_CAP register available */
 #define MCG_SER_P       (1ULL<<24) /* MCA recovery/new status bits */
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 4cf04f4e96..2b7baa0193 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -24,12 +24,27 @@
 int get_pg_mode(CPUX86State *env)
 {
     int pg_mode = 0;
+    if (env->cr[0] & CR0_WP_MASK) {
+        pg_mode |= PG_MODE_WP;
+    }
     if (env->cr[4] & CR4_PAE_MASK) {
         pg_mode |= PG_MODE_PAE;
     }
     if (env->cr[4] & CR4_PSE_MASK) {
         pg_mode |= PG_MODE_PSE;
     }
+    if (env->cr[4] & CR4_PKE_MASK) {
+        pg_mode |= PG_MODE_PKE;
+    }
+    if (env->cr[4] & CR4_PKS_MASK) {
+        pg_mode |= PG_MODE_PKS;
+    }
+    if (env->cr[4] & CR4_SMEP_MASK) {
+        pg_mode |= PG_MODE_SMEP;
+    }
+    if (env->cr[4] & CR4_LA57_MASK) {
+        pg_mode |= PG_MODE_LA57;
+    }
     if (env->hflags & HF_LMA_MASK) {
         pg_mode |= PG_MODE_LMA;
     }
@@ -246,7 +261,7 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
 #define PG_ERROR_OK (-1)
 
 static int mmu_translate(CPUState *cs, vaddr addr,
-                         uint64_t cr3, int is_write1, int mmu_idx,
+                         uint64_t cr3, int is_write1, int mmu_idx, int pg_mode,
                          vaddr *xlat, int *page_size, int *prot)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -264,17 +279,17 @@ static int mmu_translate(CPUState *cs, vaddr addr,
     is_write = is_write1 & 1;
     a20_mask = x86_get_a20_mask(env);
 
-    if (!(env->efer & MSR_EFER_NXE)) {
+    if (!(pg_mode & PG_MODE_NXE)) {
         rsvd_mask |= PG_NX_MASK;
     }
 
-    if (env->cr[4] & CR4_PAE_MASK) {
+    if (pg_mode & PG_MODE_PAE) {
         uint64_t pde, pdpe;
         target_ulong pdpe_addr;
 
 #ifdef TARGET_X86_64
         if (env->hflags & HF_LMA_MASK) {
-            bool la57 = env->cr[4] & CR4_LA57_MASK;
+            bool la57 = pg_mode & PG_MODE_LA57;
             uint64_t pml5e_addr, pml5e;
             uint64_t pml4e_addr, pml4e;
             int32_t sext;
@@ -413,7 +428,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
         ptep = pde | PG_NX_MASK;
 
         /* if PSE bit is set, then we use a 4MB page */
-        if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
+        if ((pde & PG_PSE_MASK) && (pg_mode & PG_MODE_PSE)) {
             *page_size = 4096 * 1024;
             pte_addr = pde_addr;
 
@@ -460,22 +475,22 @@ do_check_protect_pse36:
     *prot = 0;
     if (mmu_idx != MMU_KSMAP_IDX || !(ptep & PG_USER_MASK)) {
         *prot |= PAGE_READ;
-        if ((ptep & PG_RW_MASK) || (!is_user && !(env->cr[0] & CR0_WP_MASK))) {
+        if ((ptep & PG_RW_MASK) || !(is_user || (pg_mode & PG_MODE_WP))) {
             *prot |= PAGE_WRITE;
         }
     }
     if (!(ptep & PG_NX_MASK) &&
         (mmu_idx == MMU_USER_IDX ||
-         !((env->cr[4] & CR4_SMEP_MASK) && (ptep & PG_USER_MASK)))) {
+         !((pg_mode & PG_MODE_SMEP) && (ptep & PG_USER_MASK)))) {
         *prot |= PAGE_EXEC;
     }
 
     if (!(env->hflags & HF_LMA_MASK)) {
         pkr = 0;
     } else if (ptep & PG_USER_MASK) {
-        pkr = env->cr[4] & CR4_PKE_MASK ? env->pkru : 0;
+        pkr = pg_mode & PG_MODE_PKE ? env->pkru : 0;
     } else {
-        pkr = env->cr[4] & CR4_PKS_MASK ? env->pkrs : 0;
+        pkr = pg_mode & PG_MODE_PKS ? env->pkrs : 0;
     }
     if (pkr) {
         uint32_t pk = (pte & PG_PKRU_MASK) >> PG_PKRU_BIT;
@@ -485,7 +500,7 @@ do_check_protect_pse36:
 
         if (pkr_ad) {
             pkr_prot &= ~(PAGE_READ | PAGE_WRITE);
-        } else if (pkr_wd && (is_user || env->cr[0] & CR0_WP_MASK)) {
+        } else if (pkr_wd && (is_user || (pg_mode & PG_MODE_WP))) {
             pkr_prot &= ~PAGE_WRITE;
         }
 
@@ -535,9 +550,8 @@ do_check_protect_pse36:
     if (is_user)
         error_code |= PG_ERROR_U_MASK;
     if (is_write1 == 2 &&
-        (((env->efer & MSR_EFER_NXE) &&
-	  (env->cr[4] & CR4_PAE_MASK)) ||
-         (env->cr[4] & CR4_SMEP_MASK)))
+        (((pg_mode & PG_MODE_NXE) && (pg_mode & PG_MODE_PAE)) ||
+         (pg_mode & PG_MODE_SMEP)))
         error_code |= PG_ERROR_I_D_MASK;
     return error_code;
 }
@@ -553,7 +567,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
     int error_code = PG_ERROR_OK;
-    int prot, page_size;
+    int pg_mode, prot, page_size;
     hwaddr paddr;
     target_ulong vaddr;
 
@@ -573,8 +587,9 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         page_size = 4096;
     } else {
+        pg_mode = get_pg_mode(env);
         error_code = mmu_translate(cs, addr, env->cr[3], is_write1,
-                                   mmu_idx,
+                                   mmu_idx, pg_mode,
                                    &paddr, &page_size, &prot);
     }
 
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 4d81d341b8..c4e8e717a9 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -163,7 +163,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
                                                         control.nested_cr3));
         env->hflags2 |= HF2_NPT_MASK;
 
-        env->nested_pg_mode = get_pg_mode(env);
+        env->nested_pg_mode = get_pg_mode(env) & PG_MODE_SVM_MASK;
     }
 
     /* enable intercepts */
-- 
2.26.2



