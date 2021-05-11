Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F737A1F9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:29:19 +0200 (CEST)
Received: from localhost ([::1]:42348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNlW-0007qp-Vt
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNX9-00021f-0c
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWp-0000ns-D2
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Vw/VzC30kjnb1ykPijZA/QRPpGwSH0vKzTH0d4U67U=;
 b=KAvIY0iafpma437vTKwhCVCq9FYjucCOoVSuYFgFCOpQ2Mul/XYx8ix50fZkRj/pZtDjbF
 oPIJxl/h5GuoY81RBq1ai9L69kgz3H+LQ10W+5z1S5iB3E+WUe98mC+4tIWHDVytpLG85S
 jUj63hG0Oj8L9iGb6ZqyPz2PY0VgM1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-KfTasd_sPUK04JAsLczHuQ-1; Tue, 11 May 2021 04:14:04 -0400
X-MC-Unique: KfTasd_sPUK04JAsLczHuQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01511800FF0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C470D6E407
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/33] target/i386: allow customizing the next phase of the
 translation
Date: Tue, 11 May 2021 04:13:44 -0400
Message-Id: <20210511081350.419428-28-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 30 +++++++++++++++++-----------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 2b7baa0193..082ddbb911 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -260,7 +260,13 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
 
 #define PG_ERROR_OK (-1)
 
-static int mmu_translate(CPUState *cs, vaddr addr,
+typedef hwaddr (*MMUTranslateFunc)(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
+				int *prot);
+
+#define GET_HPHYS(cs, gpa, access_type, prot)  \
+	(get_hphys_func ? get_hphys_func(cs, gpa, access_type, prot) : gpa)
+
+static int mmu_translate(CPUState *cs, vaddr addr, MMUTranslateFunc get_hphys_func,
                          uint64_t cr3, int is_write1, int mmu_idx, int pg_mode,
                          vaddr *xlat, int *page_size, int *prot)
 {
@@ -296,7 +302,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
 
             /* test virtual address sign extension */
             sext = la57 ? (int64_t)addr >> 56 : (int64_t)addr >> 47;
-            if (sext != 0 && sext != -1) {
+            if (get_hphys_func && sext != 0 && sext != -1) {
                 env->error_code = 0;
                 cs->exception_index = EXCP0D_GPF;
                 return 1;
@@ -305,7 +311,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
             if (la57) {
                 pml5e_addr = ((cr3 & ~0xfff) +
                         (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
-                pml5e_addr = get_hphys(cs, pml5e_addr, MMU_DATA_STORE, NULL);
+                pml5e_addr = GET_HPHYS(cs, pml5e_addr, MMU_DATA_STORE, NULL);
                 pml5e = x86_ldq_phys(cs, pml5e_addr);
                 if (!(pml5e & PG_PRESENT_MASK)) {
                     goto do_fault;
@@ -325,7 +331,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
 
             pml4e_addr = ((pml5e & PG_ADDRESS_MASK) +
                     (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
-            pml4e_addr = get_hphys(cs, pml4e_addr, MMU_DATA_STORE, false);
+            pml4e_addr = GET_HPHYS(cs, pml4e_addr, MMU_DATA_STORE, NULL);
             pml4e = x86_ldq_phys(cs, pml4e_addr);
             if (!(pml4e & PG_PRESENT_MASK)) {
                 goto do_fault;
@@ -340,7 +346,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
             ptep &= pml4e ^ PG_NX_MASK;
             pdpe_addr = ((pml4e & PG_ADDRESS_MASK) + (((addr >> 30) & 0x1ff) << 3)) &
                 a20_mask;
-            pdpe_addr = get_hphys(cs, pdpe_addr, MMU_DATA_STORE, NULL);
+            pdpe_addr = GET_HPHYS(cs, pdpe_addr, MMU_DATA_STORE, NULL);
             pdpe = x86_ldq_phys(cs, pdpe_addr);
             if (!(pdpe & PG_PRESENT_MASK)) {
                 goto do_fault;
@@ -366,7 +372,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
             /* XXX: load them when cr3 is loaded ? */
             pdpe_addr = ((cr3 & ~0x1f) + ((addr >> 27) & 0x18)) &
                 a20_mask;
-            pdpe_addr = get_hphys(cs, pdpe_addr, MMU_DATA_STORE, false);
+            pdpe_addr = GET_HPHYS(cs, pdpe_addr, MMU_DATA_STORE, NULL);
             pdpe = x86_ldq_phys(cs, pdpe_addr);
             if (!(pdpe & PG_PRESENT_MASK)) {
                 goto do_fault;
@@ -380,7 +386,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
 
         pde_addr = ((pdpe & PG_ADDRESS_MASK) + (((addr >> 21) & 0x1ff) << 3)) &
             a20_mask;
-        pde_addr = get_hphys(cs, pde_addr, MMU_DATA_STORE, NULL);
+        pde_addr = GET_HPHYS(cs, pde_addr, MMU_DATA_STORE, NULL);
         pde = x86_ldq_phys(cs, pde_addr);
         if (!(pde & PG_PRESENT_MASK)) {
             goto do_fault;
@@ -403,7 +409,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
         }
         pte_addr = ((pde & PG_ADDRESS_MASK) + (((addr >> 12) & 0x1ff) << 3)) &
             a20_mask;
-        pte_addr = get_hphys(cs, pte_addr, MMU_DATA_STORE, NULL);
+        pte_addr = GET_HPHYS(cs, pte_addr, MMU_DATA_STORE, NULL);
         pte = x86_ldq_phys(cs, pte_addr);
         if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
@@ -420,7 +426,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
         /* page directory entry */
         pde_addr = ((cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) &
             a20_mask;
-        pde_addr = get_hphys(cs, pde_addr, MMU_DATA_STORE, NULL);
+        pde_addr = GET_HPHYS(cs, pde_addr, MMU_DATA_STORE, NULL);
         pde = x86_ldl_phys(cs, pde_addr);
         if (!(pde & PG_PRESENT_MASK)) {
             goto do_fault;
@@ -448,7 +454,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
         /* page directory entry */
         pte_addr = ((pde & ~0xfff) + ((addr >> 10) & 0xffc)) &
             a20_mask;
-        pte_addr = get_hphys(cs, pte_addr, MMU_DATA_STORE, NULL);
+        pte_addr = GET_HPHYS(cs, pte_addr, MMU_DATA_STORE, NULL);
         pte = x86_ldl_phys(cs, pte_addr);
         if (!(pte & PG_PRESENT_MASK)) {
             goto do_fault;
@@ -538,7 +544,7 @@ do_check_protect_pse36:
     /* align to page_size */
     pte &= PG_ADDRESS_MASK & ~(*page_size - 1);
     page_offset = addr & (*page_size - 1);
-    *xlat = get_hphys(cs, pte + page_offset, is_write1, prot);
+    *xlat = GET_HPHYS(cs, pte + page_offset, is_write1, prot);
     return PG_ERROR_OK;
 
  do_fault_rsvd:
@@ -588,7 +594,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         page_size = 4096;
     } else {
         pg_mode = get_pg_mode(env);
-        error_code = mmu_translate(cs, addr, env->cr[3], is_write1,
+        error_code = mmu_translate(cs, addr, get_hphys, env->cr[3], is_write1,
                                    mmu_idx, pg_mode,
                                    &paddr, &page_size, &prot);
     }
-- 
2.26.2



