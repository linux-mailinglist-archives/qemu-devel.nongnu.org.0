Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E469737A1B0
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:24:55 +0200 (CEST)
Received: from localhost ([::1]:53524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNhG-0004li-Tu
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWq-0001nh-Oj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWj-0000jX-Ev
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dAiuG8uPw+lGULoyeFmCQFNTqdTySFk77fT9wxbc7U=;
 b=PJS5RP7RmlqmzfUsFiVTeaQAnfjn4V7fUBK24OqembLBDfJ0jRQuCkCTfTUGnkGZEOR8Ms
 LO8Xk8V/A7kgSvBnEYkwQwyhnPNqXzQhMhU2k2dG6GPJkVaMPQHzKiJpIlJf5YEQe3gxlR
 LQxsLCb9eb9kyhqj9LJmPE2jkQDz7Js=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-X9OxZSc-MGGx4ycYWFo5pw-1; Tue, 11 May 2021 04:13:58 -0400
X-MC-Unique: X9OxZSc-MGGx4ycYWFo5pw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E0908189C3;
 Tue, 11 May 2021 08:13:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9251419D9D;
 Tue, 11 May 2021 08:13:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/33] i386: split tcg excp_helper into sysemu and user parts
Date: Tue, 11 May 2021 04:13:27 -0400
Message-Id: <20210511081350.419428-11-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

[claudio]:
Rebased on commit b8184135 ("target/i386: allow modifying TCG phys-addr-bits")

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210322132800.7470-13-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/excp_helper.c        | 573 --------------------------
 target/i386/tcg/sysemu/excp_helper.c | 582 +++++++++++++++++++++++++++
 target/i386/tcg/sysemu/meson.build   |   1 +
 target/i386/tcg/user/excp_helper.c   |  39 ++
 target/i386/tcg/user/meson.build     |   1 +
 5 files changed, 623 insertions(+), 573 deletions(-)
 create mode 100644 target/i386/tcg/sysemu/excp_helper.c
 create mode 100644 target/i386/tcg/user/excp_helper.c

diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index 1e71e44510..0183f3932e 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -137,576 +137,3 @@ void raise_exception_ra(CPUX86State *env, int exception_index, uintptr_t retaddr
 {
     raise_interrupt2(env, exception_index, 0, 0, 0, retaddr);
 }
-
-#if !defined(CONFIG_USER_ONLY)
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
-    if (!(env->nested_pg_mode & SVM_NPT_NXE)) {
-        rsvd_mask |= PG_NX_MASK;
-    }
-
-    if (env->nested_pg_mode & SVM_NPT_PAE) {
-        uint64_t pde, pdpe;
-        target_ulong pdpe_addr;
-
-#ifdef TARGET_X86_64
-        if (env->nested_pg_mode & SVM_NPT_LMA) {
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
-        if ((pde & PG_PSE_MASK) && (env->nested_pg_mode & SVM_NPT_PSE)) {
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
-    exit_info_1 |= SVM_NPTEXIT_RSVD;
- do_fault_protect:
-    exit_info_1 |= SVM_NPTEXIT_P;
- do_fault:
-    x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
-                 gphys);
-    exit_info_1 |= SVM_NPTEXIT_US;
-    if (access_type == MMU_DATA_STORE) {
-        exit_info_1 |= SVM_NPTEXIT_RW;
-    } else if (access_type == MMU_INST_FETCH) {
-        exit_info_1 |= SVM_NPTEXIT_ID;
-    }
-    if (prot) {
-        exit_info_1 |= SVM_NPTEXIT_GPA;
-    } else { /* page table access */
-        exit_info_1 |= SVM_NPTEXIT_GPT;
-    }
-    cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, env->retaddr);
-}
-
-/* return value:
- * -1 = cannot handle fault
- * 0  = nothing more to do
- * 1  = generate PF fault
- */
-static int handle_mmu_fault(CPUState *cs, vaddr addr, int size,
-                            int is_write1, int mmu_idx)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-    uint64_t ptep, pte;
-    int32_t a20_mask;
-    target_ulong pde_addr, pte_addr;
-    int error_code = 0;
-    int is_dirty, prot, page_size, is_write, is_user;
-    hwaddr paddr;
-    uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
-    uint32_t page_offset;
-    target_ulong vaddr;
-    uint32_t pkr;
-
-    is_user = mmu_idx == MMU_USER_IDX;
-#if defined(DEBUG_MMU)
-    printf("MMU fault: addr=%" VADDR_PRIx " w=%d u=%d eip=" TARGET_FMT_lx "\n",
-           addr, is_write1, is_user, env->eip);
-#endif
-    is_write = is_write1 & 1;
-
-    a20_mask = x86_get_a20_mask(env);
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
-
-    if (!(env->efer & MSR_EFER_NXE)) {
-        rsvd_mask |= PG_NX_MASK;
-    }
-
-    if (env->cr[4] & CR4_PAE_MASK) {
-        uint64_t pde, pdpe;
-        target_ulong pdpe_addr;
-
-#ifdef TARGET_X86_64
-        if (env->hflags & HF_LMA_MASK) {
-            bool la57 = env->cr[4] & CR4_LA57_MASK;
-            uint64_t pml5e_addr, pml5e;
-            uint64_t pml4e_addr, pml4e;
-            int32_t sext;
-
-            /* test virtual address sign extension */
-            sext = la57 ? (int64_t)addr >> 56 : (int64_t)addr >> 47;
-            if (sext != 0 && sext != -1) {
-                env->error_code = 0;
-                cs->exception_index = EXCP0D_GPF;
-                return 1;
-            }
-
-            if (la57) {
-                pml5e_addr = ((env->cr[3] & ~0xfff) +
-                        (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
-                pml5e_addr = get_hphys(cs, pml5e_addr, MMU_DATA_STORE, NULL);
-                pml5e = x86_ldq_phys(cs, pml5e_addr);
-                if (!(pml5e & PG_PRESENT_MASK)) {
-                    goto do_fault;
-                }
-                if (pml5e & (rsvd_mask | PG_PSE_MASK)) {
-                    goto do_fault_rsvd;
-                }
-                if (!(pml5e & PG_ACCESSED_MASK)) {
-                    pml5e |= PG_ACCESSED_MASK;
-                    x86_stl_phys_notdirty(cs, pml5e_addr, pml5e);
-                }
-                ptep = pml5e ^ PG_NX_MASK;
-            } else {
-                pml5e = env->cr[3];
-                ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
-            }
-
-            pml4e_addr = ((pml5e & PG_ADDRESS_MASK) +
-                    (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
-            pml4e_addr = get_hphys(cs, pml4e_addr, MMU_DATA_STORE, false);
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
-            pdpe_addr = ((pml4e & PG_ADDRESS_MASK) + (((addr >> 30) & 0x1ff) << 3)) &
-                a20_mask;
-            pdpe_addr = get_hphys(cs, pdpe_addr, MMU_DATA_STORE, NULL);
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
-            /* XXX: load them when cr3 is loaded ? */
-            pdpe_addr = ((env->cr[3] & ~0x1f) + ((addr >> 27) & 0x18)) &
-                a20_mask;
-            pdpe_addr = get_hphys(cs, pdpe_addr, MMU_DATA_STORE, false);
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
-        pde_addr = ((pdpe & PG_ADDRESS_MASK) + (((addr >> 21) & 0x1ff) << 3)) &
-            a20_mask;
-        pde_addr = get_hphys(cs, pde_addr, MMU_DATA_STORE, NULL);
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
-        pte_addr = ((pde & PG_ADDRESS_MASK) + (((addr >> 12) & 0x1ff) << 3)) &
-            a20_mask;
-        pte_addr = get_hphys(cs, pte_addr, MMU_DATA_STORE, NULL);
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
-        pde_addr = ((env->cr[3] & ~0xfff) + ((addr >> 20) & 0xffc)) &
-            a20_mask;
-        pde_addr = get_hphys(cs, pde_addr, MMU_DATA_STORE, NULL);
-        pde = x86_ldl_phys(cs, pde_addr);
-        if (!(pde & PG_PRESENT_MASK)) {
-            goto do_fault;
-        }
-        ptep = pde | PG_NX_MASK;
-
-        /* if PSE bit is set, then we use a 4MB page */
-        if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
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
-        pte_addr = ((pde & ~0xfff) + ((addr >> 10) & 0xffc)) &
-            a20_mask;
-        pte_addr = get_hphys(cs, pte_addr, MMU_DATA_STORE, NULL);
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
-do_check_protect:
-    rsvd_mask |= (page_size - 1) & PG_ADDRESS_MASK & ~PG_PSE_PAT_MASK;
-do_check_protect_pse36:
-    if (pte & rsvd_mask) {
-        goto do_fault_rsvd;
-    }
-    ptep ^= PG_NX_MASK;
-
-    /* can the page can be put in the TLB?  prot will tell us */
-    if (is_user && !(ptep & PG_USER_MASK)) {
-        goto do_fault_protect;
-    }
-
-    prot = 0;
-    if (mmu_idx != MMU_KSMAP_IDX || !(ptep & PG_USER_MASK)) {
-        prot |= PAGE_READ;
-        if ((ptep & PG_RW_MASK) || (!is_user && !(env->cr[0] & CR0_WP_MASK))) {
-            prot |= PAGE_WRITE;
-        }
-    }
-    if (!(ptep & PG_NX_MASK) &&
-        (mmu_idx == MMU_USER_IDX ||
-         !((env->cr[4] & CR4_SMEP_MASK) && (ptep & PG_USER_MASK)))) {
-        prot |= PAGE_EXEC;
-    }
-
-    if (!(env->hflags & HF_LMA_MASK)) {
-        pkr = 0;
-    } else if (ptep & PG_USER_MASK) {
-        pkr = env->cr[4] & CR4_PKE_MASK ? env->pkru : 0;
-    } else {
-        pkr = env->cr[4] & CR4_PKS_MASK ? env->pkrs : 0;
-    }
-    if (pkr) {
-        uint32_t pk = (pte & PG_PKRU_MASK) >> PG_PKRU_BIT;
-        uint32_t pkr_ad = (pkr >> pk * 2) & 1;
-        uint32_t pkr_wd = (pkr >> pk * 2) & 2;
-        uint32_t pkr_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
-
-        if (pkr_ad) {
-            pkr_prot &= ~(PAGE_READ | PAGE_WRITE);
-        } else if (pkr_wd && (is_user || env->cr[0] & CR0_WP_MASK)) {
-            pkr_prot &= ~PAGE_WRITE;
-        }
-
-        prot &= pkr_prot;
-        if ((pkr_prot & (1 << is_write1)) == 0) {
-            assert(is_write1 != 2);
-            error_code |= PG_ERROR_PK_MASK;
-            goto do_fault_protect;
-        }
-    }
-
-    if ((prot & (1 << is_write1)) == 0) {
-        goto do_fault_protect;
-    }
-
-    /* yes, it can! */
-    is_dirty = is_write && !(pte & PG_DIRTY_MASK);
-    if (!(pte & PG_ACCESSED_MASK) || is_dirty) {
-        pte |= PG_ACCESSED_MASK;
-        if (is_dirty) {
-            pte |= PG_DIRTY_MASK;
-        }
-        x86_stl_phys_notdirty(cs, pte_addr, pte);
-    }
-
-    if (!(pte & PG_DIRTY_MASK)) {
-        /* only set write access if already dirty... otherwise wait
-           for dirty access */
-        assert(!is_write);
-        prot &= ~PAGE_WRITE;
-    }
-
- do_mapping:
-    pte = pte & a20_mask;
-
-    /* align to page_size */
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
- do_fault_rsvd:
-    error_code |= PG_ERROR_RSVD_MASK;
- do_fault_protect:
-    error_code |= PG_ERROR_P_MASK;
- do_fault:
-    error_code |= (is_write << PG_ERROR_W_BIT);
-    if (is_user)
-        error_code |= PG_ERROR_U_MASK;
-    if (is_write1 == 2 &&
-        (((env->efer & MSR_EFER_NXE) &&
-          (env->cr[4] & CR4_PAE_MASK)) ||
-         (env->cr[4] & CR4_SMEP_MASK)))
-        error_code |= PG_ERROR_I_D_MASK;
-    if (env->intercept_exceptions & (1 << EXCP0E_PAGE)) {
-        /* cr2 is not modified in case of exceptions */
-        x86_stq_phys(cs,
-                 env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
-                 addr);
-    } else {
-        env->cr[2] = addr;
-    }
-    env->error_code = error_code;
-    cs->exception_index = EXCP0E_PAGE;
-    return 1;
-}
-#endif
-
-bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
-{
-    X86CPU *cpu = X86_CPU(cs);
-    CPUX86State *env = &cpu->env;
-
-#ifdef CONFIG_USER_ONLY
-    /* user mode only emulation */
-    env->cr[2] = addr;
-    env->error_code = (access_type == MMU_DATA_STORE) << PG_ERROR_W_BIT;
-    env->error_code |= PG_ERROR_U_MASK;
-    cs->exception_index = EXCP0E_PAGE;
-    env->exception_is_int = 0;
-    env->exception_next_eip = -1;
-    cpu_loop_exit_restore(cs, retaddr);
-#else
-    env->retaddr = retaddr;
-    if (handle_mmu_fault(cs, addr, size, access_type, mmu_idx)) {
-        /* FIXME: On error in get_hphys we have already jumped out.  */
-        g_assert(!probe);
-        raise_exception_err_ra(env, cs->exception_index,
-                               env->error_code, retaddr);
-    }
-    return true;
-#endif
-}
diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
new file mode 100644
index 0000000000..1fcac51a32
--- /dev/null
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -0,0 +1,582 @@
+/*
+ *  x86 exception helpers - sysemu code
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "tcg/helper-tcg.h"
+
+static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
+                        int *prot)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
+    uint64_t ptep, pte;
+    uint64_t exit_info_1 = 0;
+    target_ulong pde_addr, pte_addr;
+    uint32_t page_offset;
+    int page_size;
+
+    if (likely(!(env->hflags2 & HF2_NPT_MASK))) {
+        return gphys;
+    }
+
+    if (!(env->nested_pg_mode & SVM_NPT_NXE)) {
+        rsvd_mask |= PG_NX_MASK;
+    }
+
+    if (env->nested_pg_mode & SVM_NPT_PAE) {
+        uint64_t pde, pdpe;
+        target_ulong pdpe_addr;
+
+#ifdef TARGET_X86_64
+        if (env->nested_pg_mode & SVM_NPT_LMA) {
+            uint64_t pml5e;
+            uint64_t pml4e_addr, pml4e;
+
+            pml5e = env->nested_cr3;
+            ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
+
+            pml4e_addr = (pml5e & PG_ADDRESS_MASK) +
+                    (((gphys >> 39) & 0x1ff) << 3);
+            pml4e = x86_ldq_phys(cs, pml4e_addr);
+            if (!(pml4e & PG_PRESENT_MASK)) {
+                goto do_fault;
+            }
+            if (pml4e & (rsvd_mask | PG_PSE_MASK)) {
+                goto do_fault_rsvd;
+            }
+            if (!(pml4e & PG_ACCESSED_MASK)) {
+                pml4e |= PG_ACCESSED_MASK;
+                x86_stl_phys_notdirty(cs, pml4e_addr, pml4e);
+            }
+            ptep &= pml4e ^ PG_NX_MASK;
+            pdpe_addr = (pml4e & PG_ADDRESS_MASK) +
+                    (((gphys >> 30) & 0x1ff) << 3);
+            pdpe = x86_ldq_phys(cs, pdpe_addr);
+            if (!(pdpe & PG_PRESENT_MASK)) {
+                goto do_fault;
+            }
+            if (pdpe & rsvd_mask) {
+                goto do_fault_rsvd;
+            }
+            ptep &= pdpe ^ PG_NX_MASK;
+            if (!(pdpe & PG_ACCESSED_MASK)) {
+                pdpe |= PG_ACCESSED_MASK;
+                x86_stl_phys_notdirty(cs, pdpe_addr, pdpe);
+            }
+            if (pdpe & PG_PSE_MASK) {
+                /* 1 GB page */
+                page_size = 1024 * 1024 * 1024;
+                pte_addr = pdpe_addr;
+                pte = pdpe;
+                goto do_check_protect;
+            }
+        } else
+#endif
+        {
+            pdpe_addr = (env->nested_cr3 & ~0x1f) + ((gphys >> 27) & 0x18);
+            pdpe = x86_ldq_phys(cs, pdpe_addr);
+            if (!(pdpe & PG_PRESENT_MASK)) {
+                goto do_fault;
+            }
+            rsvd_mask |= PG_HI_USER_MASK;
+            if (pdpe & (rsvd_mask | PG_NX_MASK)) {
+                goto do_fault_rsvd;
+            }
+            ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
+        }
+
+        pde_addr = (pdpe & PG_ADDRESS_MASK) + (((gphys >> 21) & 0x1ff) << 3);
+        pde = x86_ldq_phys(cs, pde_addr);
+        if (!(pde & PG_PRESENT_MASK)) {
+            goto do_fault;
+        }
+        if (pde & rsvd_mask) {
+            goto do_fault_rsvd;
+        }
+        ptep &= pde ^ PG_NX_MASK;
+        if (pde & PG_PSE_MASK) {
+            /* 2 MB page */
+            page_size = 2048 * 1024;
+            pte_addr = pde_addr;
+            pte = pde;
+            goto do_check_protect;
+        }
+        /* 4 KB page */
+        if (!(pde & PG_ACCESSED_MASK)) {
+            pde |= PG_ACCESSED_MASK;
+            x86_stl_phys_notdirty(cs, pde_addr, pde);
+        }
+        pte_addr = (pde & PG_ADDRESS_MASK) + (((gphys >> 12) & 0x1ff) << 3);
+        pte = x86_ldq_phys(cs, pte_addr);
+        if (!(pte & PG_PRESENT_MASK)) {
+            goto do_fault;
+        }
+        if (pte & rsvd_mask) {
+            goto do_fault_rsvd;
+        }
+        /* combine pde and pte nx, user and rw protections */
+        ptep &= pte ^ PG_NX_MASK;
+        page_size = 4096;
+    } else {
+        uint32_t pde;
+
+        /* page directory entry */
+        pde_addr = (env->nested_cr3 & ~0xfff) + ((gphys >> 20) & 0xffc);
+        pde = x86_ldl_phys(cs, pde_addr);
+        if (!(pde & PG_PRESENT_MASK)) {
+            goto do_fault;
+        }
+        ptep = pde | PG_NX_MASK;
+
+        /* if host cr4 PSE bit is set, then we use a 4MB page */
+        if ((pde & PG_PSE_MASK) && (env->nested_pg_mode & SVM_NPT_PSE)) {
+            page_size = 4096 * 1024;
+            pte_addr = pde_addr;
+
+            /* Bits 20-13 provide bits 39-32 of the address, bit 21 is reserved.
+             * Leave bits 20-13 in place for setting accessed/dirty bits below.
+             */
+            pte = pde | ((pde & 0x1fe000LL) << (32 - 13));
+            rsvd_mask = 0x200000;
+            goto do_check_protect_pse36;
+        }
+
+        if (!(pde & PG_ACCESSED_MASK)) {
+            pde |= PG_ACCESSED_MASK;
+            x86_stl_phys_notdirty(cs, pde_addr, pde);
+        }
+
+        /* page directory entry */
+        pte_addr = (pde & ~0xfff) + ((gphys >> 10) & 0xffc);
+        pte = x86_ldl_phys(cs, pte_addr);
+        if (!(pte & PG_PRESENT_MASK)) {
+            goto do_fault;
+        }
+        /* combine pde and pte user and rw protections */
+        ptep &= pte | PG_NX_MASK;
+        page_size = 4096;
+        rsvd_mask = 0;
+    }
+
+ do_check_protect:
+    rsvd_mask |= (page_size - 1) & PG_ADDRESS_MASK & ~PG_PSE_PAT_MASK;
+ do_check_protect_pse36:
+    if (pte & rsvd_mask) {
+        goto do_fault_rsvd;
+    }
+    ptep ^= PG_NX_MASK;
+
+    if (!(ptep & PG_USER_MASK)) {
+        goto do_fault_protect;
+    }
+    if (ptep & PG_NX_MASK) {
+        if (access_type == MMU_INST_FETCH) {
+            goto do_fault_protect;
+        }
+        *prot &= ~PAGE_EXEC;
+    }
+    if (!(ptep & PG_RW_MASK)) {
+        if (access_type == MMU_DATA_STORE) {
+            goto do_fault_protect;
+        }
+        *prot &= ~PAGE_WRITE;
+    }
+
+    pte &= PG_ADDRESS_MASK & ~(page_size - 1);
+    page_offset = gphys & (page_size - 1);
+    return pte + page_offset;
+
+ do_fault_rsvd:
+    exit_info_1 |= SVM_NPTEXIT_RSVD;
+ do_fault_protect:
+    exit_info_1 |= SVM_NPTEXIT_P;
+ do_fault:
+    x86_stq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
+                 gphys);
+    exit_info_1 |= SVM_NPTEXIT_US;
+    if (access_type == MMU_DATA_STORE) {
+        exit_info_1 |= SVM_NPTEXIT_RW;
+    } else if (access_type == MMU_INST_FETCH) {
+        exit_info_1 |= SVM_NPTEXIT_ID;
+    }
+    if (prot) {
+        exit_info_1 |= SVM_NPTEXIT_GPA;
+    } else { /* page table access */
+        exit_info_1 |= SVM_NPTEXIT_GPT;
+    }
+    cpu_vmexit(env, SVM_EXIT_NPF, exit_info_1, env->retaddr);
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
+    uint64_t ptep, pte;
+    int32_t a20_mask;
+    target_ulong pde_addr, pte_addr;
+    int error_code = 0;
+    int is_dirty, prot, page_size, is_write, is_user;
+    hwaddr paddr;
+    uint64_t rsvd_mask = PG_ADDRESS_MASK & ~MAKE_64BIT_MASK(0, cpu->phys_bits);
+    uint32_t page_offset;
+    target_ulong vaddr;
+    uint32_t pkr;
+
+    is_user = mmu_idx == MMU_USER_IDX;
+#if defined(DEBUG_MMU)
+    printf("MMU fault: addr=%" VADDR_PRIx " w=%d u=%d eip=" TARGET_FMT_lx "\n",
+           addr, is_write1, is_user, env->eip);
+#endif
+    is_write = is_write1 & 1;
+
+    a20_mask = x86_get_a20_mask(env);
+    if (!(env->cr[0] & CR0_PG_MASK)) {
+        pte = addr;
+#ifdef TARGET_X86_64
+        if (!(env->hflags & HF_LMA_MASK)) {
+            /* Without long mode we can only address 32bits in real mode */
+            pte = (uint32_t)pte;
+        }
+#endif
+        prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        page_size = 4096;
+        goto do_mapping;
+    }
+
+    if (!(env->efer & MSR_EFER_NXE)) {
+        rsvd_mask |= PG_NX_MASK;
+    }
+
+    if (env->cr[4] & CR4_PAE_MASK) {
+        uint64_t pde, pdpe;
+        target_ulong pdpe_addr;
+
+#ifdef TARGET_X86_64
+        if (env->hflags & HF_LMA_MASK) {
+            bool la57 = env->cr[4] & CR4_LA57_MASK;
+            uint64_t pml5e_addr, pml5e;
+            uint64_t pml4e_addr, pml4e;
+            int32_t sext;
+
+            /* test virtual address sign extension */
+            sext = la57 ? (int64_t)addr >> 56 : (int64_t)addr >> 47;
+            if (sext != 0 && sext != -1) {
+                env->error_code = 0;
+                cs->exception_index = EXCP0D_GPF;
+                return 1;
+            }
+
+            if (la57) {
+                pml5e_addr = ((env->cr[3] & ~0xfff) +
+                        (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
+                pml5e_addr = get_hphys(cs, pml5e_addr, MMU_DATA_STORE, NULL);
+                pml5e = x86_ldq_phys(cs, pml5e_addr);
+                if (!(pml5e & PG_PRESENT_MASK)) {
+                    goto do_fault;
+                }
+                if (pml5e & (rsvd_mask | PG_PSE_MASK)) {
+                    goto do_fault_rsvd;
+                }
+                if (!(pml5e & PG_ACCESSED_MASK)) {
+                    pml5e |= PG_ACCESSED_MASK;
+                    x86_stl_phys_notdirty(cs, pml5e_addr, pml5e);
+                }
+                ptep = pml5e ^ PG_NX_MASK;
+            } else {
+                pml5e = env->cr[3];
+                ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
+            }
+
+            pml4e_addr = ((pml5e & PG_ADDRESS_MASK) +
+                    (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
+            pml4e_addr = get_hphys(cs, pml4e_addr, MMU_DATA_STORE, false);
+            pml4e = x86_ldq_phys(cs, pml4e_addr);
+            if (!(pml4e & PG_PRESENT_MASK)) {
+                goto do_fault;
+            }
+            if (pml4e & (rsvd_mask | PG_PSE_MASK)) {
+                goto do_fault_rsvd;
+            }
+            if (!(pml4e & PG_ACCESSED_MASK)) {
+                pml4e |= PG_ACCESSED_MASK;
+                x86_stl_phys_notdirty(cs, pml4e_addr, pml4e);
+            }
+            ptep &= pml4e ^ PG_NX_MASK;
+            pdpe_addr = ((pml4e & PG_ADDRESS_MASK) + (((addr >> 30) & 0x1ff) << 3)) &
+                a20_mask;
+            pdpe_addr = get_hphys(cs, pdpe_addr, MMU_DATA_STORE, NULL);
+            pdpe = x86_ldq_phys(cs, pdpe_addr);
+            if (!(pdpe & PG_PRESENT_MASK)) {
+                goto do_fault;
+            }
+            if (pdpe & rsvd_mask) {
+                goto do_fault_rsvd;
+            }
+            ptep &= pdpe ^ PG_NX_MASK;
+            if (!(pdpe & PG_ACCESSED_MASK)) {
+                pdpe |= PG_ACCESSED_MASK;
+                x86_stl_phys_notdirty(cs, pdpe_addr, pdpe);
+            }
+            if (pdpe & PG_PSE_MASK) {
+                /* 1 GB page */
+                page_size = 1024 * 1024 * 1024;
+                pte_addr = pdpe_addr;
+                pte = pdpe;
+                goto do_check_protect;
+            }
+        } else
+#endif
+        {
+            /* XXX: load them when cr3 is loaded ? */
+            pdpe_addr = ((env->cr[3] & ~0x1f) + ((addr >> 27) & 0x18)) &
+                a20_mask;
+            pdpe_addr = get_hphys(cs, pdpe_addr, MMU_DATA_STORE, false);
+            pdpe = x86_ldq_phys(cs, pdpe_addr);
+            if (!(pdpe & PG_PRESENT_MASK)) {
+                goto do_fault;
+            }
+            rsvd_mask |= PG_HI_USER_MASK;
+            if (pdpe & (rsvd_mask | PG_NX_MASK)) {
+                goto do_fault_rsvd;
+            }
+            ptep = PG_NX_MASK | PG_USER_MASK | PG_RW_MASK;
+        }
+
+        pde_addr = ((pdpe & PG_ADDRESS_MASK) + (((addr >> 21) & 0x1ff) << 3)) &
+            a20_mask;
+        pde_addr = get_hphys(cs, pde_addr, MMU_DATA_STORE, NULL);
+        pde = x86_ldq_phys(cs, pde_addr);
+        if (!(pde & PG_PRESENT_MASK)) {
+            goto do_fault;
+        }
+        if (pde & rsvd_mask) {
+            goto do_fault_rsvd;
+        }
+        ptep &= pde ^ PG_NX_MASK;
+        if (pde & PG_PSE_MASK) {
+            /* 2 MB page */
+            page_size = 2048 * 1024;
+            pte_addr = pde_addr;
+            pte = pde;
+            goto do_check_protect;
+        }
+        /* 4 KB page */
+        if (!(pde & PG_ACCESSED_MASK)) {
+            pde |= PG_ACCESSED_MASK;
+            x86_stl_phys_notdirty(cs, pde_addr, pde);
+        }
+        pte_addr = ((pde & PG_ADDRESS_MASK) + (((addr >> 12) & 0x1ff) << 3)) &
+            a20_mask;
+        pte_addr = get_hphys(cs, pte_addr, MMU_DATA_STORE, NULL);
+        pte = x86_ldq_phys(cs, pte_addr);
+        if (!(pte & PG_PRESENT_MASK)) {
+            goto do_fault;
+        }
+        if (pte & rsvd_mask) {
+            goto do_fault_rsvd;
+        }
+        /* combine pde and pte nx, user and rw protections */
+        ptep &= pte ^ PG_NX_MASK;
+        page_size = 4096;
+    } else {
+        uint32_t pde;
+
+        /* page directory entry */
+        pde_addr = ((env->cr[3] & ~0xfff) + ((addr >> 20) & 0xffc)) &
+            a20_mask;
+        pde_addr = get_hphys(cs, pde_addr, MMU_DATA_STORE, NULL);
+        pde = x86_ldl_phys(cs, pde_addr);
+        if (!(pde & PG_PRESENT_MASK)) {
+            goto do_fault;
+        }
+        ptep = pde | PG_NX_MASK;
+
+        /* if PSE bit is set, then we use a 4MB page */
+        if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
+            page_size = 4096 * 1024;
+            pte_addr = pde_addr;
+
+            /* Bits 20-13 provide bits 39-32 of the address, bit 21 is reserved.
+             * Leave bits 20-13 in place for setting accessed/dirty bits below.
+             */
+            pte = pde | ((pde & 0x1fe000LL) << (32 - 13));
+            rsvd_mask = 0x200000;
+            goto do_check_protect_pse36;
+        }
+
+        if (!(pde & PG_ACCESSED_MASK)) {
+            pde |= PG_ACCESSED_MASK;
+            x86_stl_phys_notdirty(cs, pde_addr, pde);
+        }
+
+        /* page directory entry */
+        pte_addr = ((pde & ~0xfff) + ((addr >> 10) & 0xffc)) &
+            a20_mask;
+        pte_addr = get_hphys(cs, pte_addr, MMU_DATA_STORE, NULL);
+        pte = x86_ldl_phys(cs, pte_addr);
+        if (!(pte & PG_PRESENT_MASK)) {
+            goto do_fault;
+        }
+        /* combine pde and pte user and rw protections */
+        ptep &= pte | PG_NX_MASK;
+        page_size = 4096;
+        rsvd_mask = 0;
+    }
+
+do_check_protect:
+    rsvd_mask |= (page_size - 1) & PG_ADDRESS_MASK & ~PG_PSE_PAT_MASK;
+do_check_protect_pse36:
+    if (pte & rsvd_mask) {
+        goto do_fault_rsvd;
+    }
+    ptep ^= PG_NX_MASK;
+
+    /* can the page can be put in the TLB?  prot will tell us */
+    if (is_user && !(ptep & PG_USER_MASK)) {
+        goto do_fault_protect;
+    }
+
+    prot = 0;
+    if (mmu_idx != MMU_KSMAP_IDX || !(ptep & PG_USER_MASK)) {
+        prot |= PAGE_READ;
+        if ((ptep & PG_RW_MASK) || (!is_user && !(env->cr[0] & CR0_WP_MASK))) {
+            prot |= PAGE_WRITE;
+        }
+    }
+    if (!(ptep & PG_NX_MASK) &&
+        (mmu_idx == MMU_USER_IDX ||
+         !((env->cr[4] & CR4_SMEP_MASK) && (ptep & PG_USER_MASK)))) {
+        prot |= PAGE_EXEC;
+    }
+
+    if (!(env->hflags & HF_LMA_MASK)) {
+        pkr = 0;
+    } else if (ptep & PG_USER_MASK) {
+        pkr = env->cr[4] & CR4_PKE_MASK ? env->pkru : 0;
+    } else {
+        pkr = env->cr[4] & CR4_PKS_MASK ? env->pkrs : 0;
+    }
+    if (pkr) {
+        uint32_t pk = (pte & PG_PKRU_MASK) >> PG_PKRU_BIT;
+        uint32_t pkr_ad = (pkr >> pk * 2) & 1;
+        uint32_t pkr_wd = (pkr >> pk * 2) & 2;
+        uint32_t pkr_prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+
+        if (pkr_ad) {
+            pkr_prot &= ~(PAGE_READ | PAGE_WRITE);
+        } else if (pkr_wd && (is_user || env->cr[0] & CR0_WP_MASK)) {
+            pkr_prot &= ~PAGE_WRITE;
+        }
+
+        prot &= pkr_prot;
+        if ((pkr_prot & (1 << is_write1)) == 0) {
+            assert(is_write1 != 2);
+            error_code |= PG_ERROR_PK_MASK;
+            goto do_fault_protect;
+        }
+    }
+
+    if ((prot & (1 << is_write1)) == 0) {
+        goto do_fault_protect;
+    }
+
+    /* yes, it can! */
+    is_dirty = is_write && !(pte & PG_DIRTY_MASK);
+    if (!(pte & PG_ACCESSED_MASK) || is_dirty) {
+        pte |= PG_ACCESSED_MASK;
+        if (is_dirty) {
+            pte |= PG_DIRTY_MASK;
+        }
+        x86_stl_phys_notdirty(cs, pte_addr, pte);
+    }
+
+    if (!(pte & PG_DIRTY_MASK)) {
+        /* only set write access if already dirty... otherwise wait
+           for dirty access */
+        assert(!is_write);
+        prot &= ~PAGE_WRITE;
+    }
+
+ do_mapping:
+    pte = pte & a20_mask;
+
+    /* align to page_size */
+    pte &= PG_ADDRESS_MASK & ~(page_size - 1);
+    page_offset = addr & (page_size - 1);
+    paddr = get_hphys(cs, pte + page_offset, is_write1, &prot);
+
+    /* Even if 4MB pages, we map only one 4KB page in the cache to
+       avoid filling it too fast */
+    vaddr = addr & TARGET_PAGE_MASK;
+    paddr &= TARGET_PAGE_MASK;
+
+    assert(prot & (1 << is_write1));
+    tlb_set_page_with_attrs(cs, vaddr, paddr, cpu_get_mem_attrs(env),
+                            prot, mmu_idx, page_size);
+    return 0;
+ do_fault_rsvd:
+    error_code |= PG_ERROR_RSVD_MASK;
+ do_fault_protect:
+    error_code |= PG_ERROR_P_MASK;
+ do_fault:
+    error_code |= (is_write << PG_ERROR_W_BIT);
+    if (is_user)
+        error_code |= PG_ERROR_U_MASK;
+    if (is_write1 == 2 &&
+        (((env->efer & MSR_EFER_NXE) &&
+          (env->cr[4] & CR4_PAE_MASK)) ||
+         (env->cr[4] & CR4_SMEP_MASK)))
+        error_code |= PG_ERROR_I_D_MASK;
+    if (env->intercept_exceptions & (1 << EXCP0E_PAGE)) {
+        /* cr2 is not modified in case of exceptions */
+        x86_stq_phys(cs,
+                 env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2),
+                 addr);
+    } else {
+        env->cr[2] = addr;
+    }
+    env->error_code = error_code;
+    cs->exception_index = EXCP0E_PAGE;
+    return 1;
+}
+
+bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->retaddr = retaddr;
+    if (handle_mmu_fault(cs, addr, size, access_type, mmu_idx)) {
+        /* FIXME: On error in get_hphys we have already jumped out.  */
+        g_assert(!probe);
+        raise_exception_err_ra(env, cs->exception_index,
+                               env->error_code, retaddr);
+    }
+    return true;
+}
diff --git a/target/i386/tcg/sysemu/meson.build b/target/i386/tcg/sysemu/meson.build
index 35ba16dc3d..6d0a0a0fee 100644
--- a/target/i386/tcg/sysemu/meson.build
+++ b/target/i386/tcg/sysemu/meson.build
@@ -1,4 +1,5 @@
 i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'tcg-cpu.c',
   'smm_helper.c',
+  'excp_helper.c',
 ))
diff --git a/target/i386/tcg/user/excp_helper.c b/target/i386/tcg/user/excp_helper.c
new file mode 100644
index 0000000000..a89b5228fd
--- /dev/null
+++ b/target/i386/tcg/user/excp_helper.c
@@ -0,0 +1,39 @@
+/*
+ *  x86 exception helpers - user-mode specific code
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "tcg/helper-tcg.h"
+
+bool x86_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    env->cr[2] = addr;
+    env->error_code = (access_type == MMU_DATA_STORE) << PG_ERROR_W_BIT;
+    env->error_code |= PG_ERROR_U_MASK;
+    cs->exception_index = EXCP0E_PAGE;
+    env->exception_is_int = 0;
+    env->exception_next_eip = -1;
+    cpu_loop_exit_restore(cs, retaddr);
+}
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index 7aecc53155..e0ef0f02e2 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -1,2 +1,3 @@
 i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
+  'excp_helper.c',
 ))
-- 
2.26.2



