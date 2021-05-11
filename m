Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D92637A230
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:33:26 +0200 (CEST)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNpV-0005I8-3R
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNXA-00023l-Ua
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWo-0000nk-KK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v+tSY7a1bqyki/soI9/AQvIdlPS1JSOISduuQctF7k4=;
 b=RYNBj+CfKwlO1HqWAFniBtgK4amJlCn+KcVP6Dw5ZPDaofmHukARwdF6KtE79Fe/oKiUIu
 x0hhWjXkJU71gtYGkxpW2+a03y+1f1a9bCXOKKtqTnJLgx0eG3Q4Hh5soLWSbqI4BF0vv+
 xNvJlojJe1BQKJscG+vyN9AigDyWxSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-AwLza7RKPTOIEQ5dDVwVJg-1; Tue, 11 May 2021 04:14:04 -0400
X-MC-Unique: AwLza7RKPTOIEQ5dDVwVJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E2EE6D246
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CBA06E407
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/33] target/i386: pass cr3 to mmu_translate
Date: Tue, 11 May 2021 04:13:42 -0400
Message-Id: <20210511081350.419428-26-pbonzini@redhat.com>
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

First step in unifying the nested and regular page table walk.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index f1103db64f..4cf04f4e96 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -246,7 +246,7 @@ static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
 #define PG_ERROR_OK (-1)
 
 static int mmu_translate(CPUState *cs, vaddr addr,
-                         int is_write1, int mmu_idx,
+                         uint64_t cr3, int is_write1, int mmu_idx,
                          vaddr *xlat, int *page_size, int *prot)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -288,7 +288,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
             }
 
             if (la57) {
-                pml5e_addr = ((env->cr[3] & ~0xfff) +
+                pml5e_addr = ((cr3 & ~0xfff) +
                         (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
                 pml5e_addr = get_hphys(cs, pml5e_addr, MMU_DATA_STORE, NULL);
                 pml5e = x86_ldq_phys(cs, pml5e_addr);
@@ -304,7 +304,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
                 }
                 ptep = pml5e ^ PG_NX_MASK;
             } else {
-                pml5e = env->cr[3];
+                pml5e = cr3;
                 ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
             }
 
@@ -349,7 +349,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
 #endif
         {
             /* XXX: load them when cr3 is loaded ? */
-            pdpe_addr = ((env->cr[3] & ~0x1f) + ((addr >> 27) & 0x18)) &
+            pdpe_addr = ((cr3 & ~0x1f) + ((addr >> 27) & 0x18)) &
                 a20_mask;
             pdpe_addr = get_hphys(cs, pdpe_addr, MMU_DATA_STORE, false);
             pdpe = x86_ldq_phys(cs, pdpe_addr);
@@ -403,7 +403,7 @@ static int mmu_translate(CPUState *cs, vaddr addr,
         uint32_t pde;
 
         /* page directory entry */
-        pde_addr = ((env->cr[3] & ~0xfff) + ((addr >> 20) & 0xffc)) &
+        pde_addr = ((cr3 & ~0xfff) + ((addr >> 20) & 0xffc)) &
             a20_mask;
         pde_addr = get_hphys(cs, pde_addr, MMU_DATA_STORE, NULL);
         pde = x86_ldl_phys(cs, pde_addr);
@@ -573,7 +573,7 @@ static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
         prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         page_size = 4096;
     } else {
-        error_code = mmu_translate(cs, addr, is_write1,
+        error_code = mmu_translate(cs, addr, env->cr[3], is_write1,
                                    mmu_idx,
                                    &paddr, &page_size, &prot);
     }
-- 
2.26.2



