Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D47B316A53
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:36:16 +0100 (CET)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rXL-0003ay-Cw
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQX-0003rU-GA
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:54578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQS-0008WE-Ev
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FC3BB0F2;
 Wed, 10 Feb 2021 15:29:06 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v17 09/14] i386: split tcg excp_helper into softmmu and user
 parts
Date: Wed, 10 Feb 2021 16:28:54 +0100
Message-Id: <20210210152859.25920-10-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210152859.25920-1-cfontana@suse.de>
References: <20210210152859.25920-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/tcg/excp_helper.c                 | 572 ------------------
 target/i386/tcg/softmmu/excp_helper_softmmu.c | 566 +++++++++++++++++
 target/i386/tcg/user/excp_helper_user.c       |  42 ++
 target/i386/tcg/softmmu/meson.build           |   1 +
 target/i386/tcg/user/meson.build              |   1 +
 5 files changed, 610 insertions(+), 572 deletions(-)
 create mode 100644 target/i386/tcg/softmmu/excp_helper_softmmu.c
 create mode 100644 target/i386/tcg/user/excp_helper_user.c

diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c
index b7d6259e4a..0183f3932e 100644
--- a/target/i386/tcg/excp_helper.c
+++ b/target/i386/tcg/excp_helper.c
@@ -137,575 +137,3 @@ void raise_exception_ra(CPUX86State *env, int exception_index, uintptr_t retaddr
 {
     raise_interrupt2(env, exception_index, 0, 0, 0, retaddr);
 }
-
-#if !defined(CONFIG_USER_ONLY)
-static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
-                        int *prot)
-{
-    CPUX86State *env = &X86_CPU(cs)->env;
-    uint64_t rsvd_mask = PG_HI_RSVD_MASK;
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
-    uint64_t rsvd_mask = PG_HI_RSVD_MASK;
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
diff --git a/target/i386/tcg/softmmu/excp_helper_softmmu.c b/target/i386/tcg/softmmu/excp_helper_softmmu.c
new file mode 100644
index 0000000000..e254f018e6
--- /dev/null
+++ b/target/i386/tcg/softmmu/excp_helper_softmmu.c
@@ -0,0 +1,566 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "qemu/log.h"
+#include "sysemu/runstate.h"
+#include "exec/helper-proto.h"
+#include "tcg/helper-tcg.h"
+
+static hwaddr get_hphys(CPUState *cs, hwaddr gphys, MMUAccessType access_type,
+                        int *prot)
+{
+    CPUX86State *env = &X86_CPU(cs)->env;
+    uint64_t rsvd_mask = PG_HI_RSVD_MASK;
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
+    uint64_t rsvd_mask = PG_HI_RSVD_MASK;
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
diff --git a/target/i386/tcg/user/excp_helper_user.c b/target/i386/tcg/user/excp_helper_user.c
new file mode 100644
index 0000000000..8bf21bdd46
--- /dev/null
+++ b/target/i386/tcg/user/excp_helper_user.c
@@ -0,0 +1,42 @@
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
+#include "qemu/log.h"
+#include "sysemu/runstate.h"
+#include "exec/helper-proto.h"
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
diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softmmu/meson.build
index cc29893758..e1ab2e4b43 100644
--- a/target/i386/tcg/softmmu/meson.build
+++ b/target/i386/tcg/softmmu/meson.build
@@ -1,4 +1,5 @@
 i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'tcg-cpu-softmmu.c',
   'smm_helper.c',
+  'excp_helper_softmmu.c',
 ))
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index 976415e35f..e1eddd19bb 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -1,4 +1,5 @@
 i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'tcg-cpu-user.c',
   'smm_helper_user.c',
+  'excp_helper_user.c',
 ))
-- 
2.26.2


