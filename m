Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F56E3055
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 13:26:51 +0200 (CEST)
Received: from localhost ([::1]:39838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNbGT-0004rr-Ml
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 07:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60299)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNaz7-0002hu-UN
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:08:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iNaz4-0007a3-G2
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:08:52 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50333 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iNaz4-00072J-4I
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:08:50 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id E321B1A1EA7;
 Thu, 24 Oct 2019 13:07:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id B31CB1A2196;
 Thu, 24 Oct 2019 13:07:44 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] target/mips: Clean up helper.c
Date: Thu, 24 Oct 2019 13:06:25 +0200
Message-Id: <1571915195-4381-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571915195-4381-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1571915195-4381-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Mostly fix errors and warnings reported by 'checkpatch.pl -f'.

Cc: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1571826227-10583-2-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/helper.c | 123 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 74 insertions(+), 49 deletions(-)

diff --git a/target/mips/helper.c b/target/mips/helper.c
index a2b6459..781930a 100644
--- a/target/mips/helper.c
+++ b/target/mips/helper.c
@@ -39,8 +39,8 @@ enum {
 #if !defined(CONFIG_USER_ONLY)
 
 /* no MMU emulation */
-int no_mmu_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
-                        target_ulong address, int rw, int access_type)
+int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
+                       target_ulong address, int rw, int access_type)
 {
     *physical = address;
     *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -48,26 +48,28 @@ int no_mmu_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
 }
 
 /* fixed mapping MMU emulation */
-int fixed_mmu_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
-                           target_ulong address, int rw, int access_type)
+int fixed_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
+                          target_ulong address, int rw, int access_type)
 {
     if (address <= (int32_t)0x7FFFFFFFUL) {
-        if (!(env->CP0_Status & (1 << CP0St_ERL)))
+        if (!(env->CP0_Status & (1 << CP0St_ERL))) {
             *physical = address + 0x40000000UL;
-        else
+        } else {
             *physical = address;
-    } else if (address <= (int32_t)0xBFFFFFFFUL)
+        }
+    } else if (address <= (int32_t)0xBFFFFFFFUL) {
         *physical = address & 0x1FFFFFFF;
-    else
+    } else {
         *physical = address;
+    }
 
     *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     return TLBRET_MATCH;
 }
 
 /* MIPS32/MIPS64 R4000-style MMU emulation */
-int r4k_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
-                     target_ulong address, int rw, int access_type)
+int r4k_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
+                    target_ulong address, int rw, int access_type)
 {
     uint16_t ASID = env->CP0_EntryHi & env->CP0_EntryHi_ASID_mask;
     int i;
@@ -99,8 +101,9 @@ int r4k_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
             if (rw != MMU_DATA_STORE || (n ? tlb->D1 : tlb->D0)) {
                 *physical = tlb->PFN[n] | (address & (mask >> 1));
                 *prot = PAGE_READ;
-                if (n ? tlb->D1 : tlb->D0)
+                if (n ? tlb->D1 : tlb->D0) {
                     *prot |= PAGE_WRITE;
+                }
                 if (!(n ? tlb->XI1 : tlb->XI0)) {
                     *prot |= PAGE_EXEC;
                 }
@@ -130,7 +133,7 @@ static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
     int32_t adetlb_mask;
 
     switch (mmu_idx) {
-    case 3 /* ERL */:
+    case 3: /* ERL */
         /* If EU is set, always unmapped */
         if (eu) {
             return 0;
@@ -204,7 +207,7 @@ static int get_segctl_physical_address(CPUMIPSState *env, hwaddr *physical,
                                     pa & ~(hwaddr)segmask);
 }
 
-static int get_physical_address (CPUMIPSState *env, hwaddr *physical,
+static int get_physical_address(CPUMIPSState *env, hwaddr *physical,
                                 int *prot, target_ulong real_address,
                                 int rw, int access_type, int mmu_idx)
 {
@@ -252,14 +255,15 @@ static int get_physical_address (CPUMIPSState *env, hwaddr *physical,
         } else {
             segctl = env->CP0_SegCtl2 >> 16;
         }
-        ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
-                                          access_type, mmu_idx, segctl,
-                                          0x3FFFFFFF);
+        ret = get_segctl_physical_address(env, physical, prot,
+                                          real_address, rw, access_type,
+                                          mmu_idx, segctl, 0x3FFFFFFF);
 #if defined(TARGET_MIPS64)
     } else if (address < 0x4000000000000000ULL) {
         /* xuseg */
         if (UX && address <= (0x3FFFFFFFFFFFFFFFULL & env->SEGMask)) {
-            ret = env->tlb->map_address(env, physical, prot, real_address, rw, access_type);
+            ret = env->tlb->map_address(env, physical, prot,
+                                        real_address, rw, access_type);
         } else {
             ret = TLBRET_BADADDR;
         }
@@ -267,7 +271,8 @@ static int get_physical_address (CPUMIPSState *env, hwaddr *physical,
         /* xsseg */
         if ((supervisor_mode || kernel_mode) &&
             SX && address <= (0x7FFFFFFFFFFFFFFFULL & env->SEGMask)) {
-            ret = env->tlb->map_address(env, physical, prot, real_address, rw, access_type);
+            ret = env->tlb->map_address(env, physical, prot,
+                                        real_address, rw, access_type);
         } else {
             ret = TLBRET_BADADDR;
         }
@@ -307,7 +312,8 @@ static int get_physical_address (CPUMIPSState *env, hwaddr *physical,
         /* xkseg */
         if (kernel_mode && KX &&
             address <= (0xFFFFFFFF7FFFFFFFULL & env->SEGMask)) {
-            ret = env->tlb->map_address(env, physical, prot, real_address, rw, access_type);
+            ret = env->tlb->map_address(env, physical, prot,
+                                        real_address, rw, access_type);
         } else {
             ret = TLBRET_BADADDR;
         }
@@ -328,8 +334,10 @@ static int get_physical_address (CPUMIPSState *env, hwaddr *physical,
                                           access_type, mmu_idx,
                                           env->CP0_SegCtl0 >> 16, 0x1FFFFFFF);
     } else {
-        /* kseg3 */
-        /* XXX: debug segment is not emulated */
+        /*
+         * kseg3
+         * XXX: debug segment is not emulated
+         */
         ret = get_segctl_physical_address(env, physical, prot, real_address, rw,
                                           access_type, mmu_idx,
                                           env->CP0_SegCtl0, 0x1FFFFFFF);
@@ -515,9 +523,9 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
 #if defined(TARGET_MIPS64)
     env->CP0_EntryHi &= env->SEGMask;
     env->CP0_XContext =
-        /* PTEBase */   (env->CP0_XContext & ((~0ULL) << (env->SEGBITS - 7))) |
-        /* R */         (extract64(address, 62, 2) << (env->SEGBITS - 9)) |
-        /* BadVPN2 */   (extract64(address, 13, env->SEGBITS - 13) << 4);
+        (env->CP0_XContext & ((~0ULL) << (env->SEGBITS - 7))) | /* PTEBase */
+        (extract64(address, 62, 2) << (env->SEGBITS - 9)) |     /* R       */
+        (extract64(address, 13, env->SEGBITS - 13) << 4);       /* BadVPN2 */
 #endif
     cs->exception_index = exception;
     env->error_code = error_code;
@@ -945,7 +953,8 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 }
 
 #ifndef CONFIG_USER_ONLY
-hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address, int rw)
+hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
+                                  int rw)
 {
     hwaddr physical;
     int prot;
@@ -1005,7 +1014,7 @@ static const char * const excp_names[EXCP_LAST + 1] = {
 };
 #endif
 
-target_ulong exception_resume_pc (CPUMIPSState *env)
+target_ulong exception_resume_pc(CPUMIPSState *env)
 {
     target_ulong bad_pc;
     target_ulong isa_mode;
@@ -1013,8 +1022,10 @@ target_ulong exception_resume_pc (CPUMIPSState *env)
     isa_mode = !!(env->hflags & MIPS_HFLAG_M16);
     bad_pc = env->active_tc.PC | isa_mode;
     if (env->hflags & MIPS_HFLAG_BMASK) {
-        /* If the exception was raised from a delay slot, come back to
-           the jump.  */
+        /*
+         * If the exception was raised from a delay slot, come back to
+         * the jump.
+         */
         bad_pc -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
     }
 
@@ -1022,14 +1033,14 @@ target_ulong exception_resume_pc (CPUMIPSState *env)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-static void set_hflags_for_handler (CPUMIPSState *env)
+static void set_hflags_for_handler(CPUMIPSState *env)
 {
     /* Exception handlers are entered in 32-bit mode.  */
     env->hflags &= ~(MIPS_HFLAG_M16);
     /* ...except that microMIPS lets you choose.  */
     if (env->insn_flags & ASE_MICROMIPS) {
-        env->hflags |= (!!(env->CP0_Config3
-                           & (1 << CP0C3_ISA_ON_EXC))
+        env->hflags |= (!!(env->CP0_Config3 &
+                           (1 << CP0C3_ISA_ON_EXC))
                         << MIPS_HFLAG_M16_SHIFT);
     }
 }
@@ -1096,10 +1107,12 @@ void mips_cpu_do_interrupt(CPUState *cs)
     switch (cs->exception_index) {
     case EXCP_DSS:
         env->CP0_Debug |= 1 << CP0DB_DSS;
-        /* Debug single step cannot be raised inside a delay slot and
-           resume will always occur on the next instruction
-           (but we assume the pc has always been updated during
-           code translation). */
+        /*
+         * Debug single step cannot be raised inside a delay slot and
+         * resume will always occur on the next instruction
+         * (but we assume the pc has always been updated during
+         * code translation).
+         */
         env->CP0_DEPC = env->active_tc.PC | !!(env->hflags & MIPS_HFLAG_M16);
         goto enter_debug_mode;
     case EXCP_DINT:
@@ -1111,7 +1124,8 @@ void mips_cpu_do_interrupt(CPUState *cs)
     case EXCP_DBp:
         env->CP0_Debug |= 1 << CP0DB_DBp;
         /* Setup DExcCode - SDBBP instruction */
-        env->CP0_Debug = (env->CP0_Debug & ~(0x1fULL << CP0DB_DEC)) | 9 << CP0DB_DEC;
+        env->CP0_Debug = (env->CP0_Debug & ~(0x1fULL << CP0DB_DEC)) |
+                         (9 << CP0DB_DEC);
         goto set_DEPC;
     case EXCP_DDBS:
         env->CP0_Debug |= 1 << CP0DB_DDBS;
@@ -1132,8 +1146,9 @@ void mips_cpu_do_interrupt(CPUState *cs)
         env->hflags |= MIPS_HFLAG_DM | MIPS_HFLAG_CP0;
         env->hflags &= ~(MIPS_HFLAG_KSU);
         /* EJTAG probe trap enable is not implemented... */
-        if (!(env->CP0_Status & (1 << CP0St_EXL)))
+        if (!(env->CP0_Status & (1 << CP0St_EXL))) {
             env->CP0_Cause &= ~(1U << CP0Ca_BD);
+        }
         env->active_tc.PC = env->exception_base + 0x480;
         set_hflags_for_handler(env);
         break;
@@ -1159,8 +1174,9 @@ void mips_cpu_do_interrupt(CPUState *cs)
         }
         env->hflags |= MIPS_HFLAG_CP0;
         env->hflags &= ~(MIPS_HFLAG_KSU);
-        if (!(env->CP0_Status & (1 << CP0St_EXL)))
+        if (!(env->CP0_Status & (1 << CP0St_EXL))) {
             env->CP0_Cause &= ~(1U << CP0Ca_BD);
+        }
         env->active_tc.PC = env->exception_base;
         set_hflags_for_handler(env);
         break;
@@ -1176,12 +1192,16 @@ void mips_cpu_do_interrupt(CPUState *cs)
                 uint32_t pending = (env->CP0_Cause & CP0Ca_IP_mask) >> CP0Ca_IP;
 
                 if (env->CP0_Config3 & (1 << CP0C3_VEIC)) {
-                    /* For VEIC mode, the external interrupt controller feeds
-                     * the vector through the CP0Cause IP lines.  */
+                    /*
+                     * For VEIC mode, the external interrupt controller feeds
+                     * the vector through the CP0Cause IP lines.
+                     */
                     vector = pending;
                 } else {
-                    /* Vectored Interrupts
-                     * Mask with Status.IM7-IM0 to get enabled interrupts. */
+                    /*
+                     * Vectored Interrupts
+                     * Mask with Status.IM7-IM0 to get enabled interrupts.
+                     */
                     pending &= (env->CP0_Status >> CP0St_IM) & 0xff;
                     /* Find the highest-priority interrupt. */
                     while (pending >>= 1) {
@@ -1354,7 +1374,8 @@ void mips_cpu_do_interrupt(CPUState *cs)
 
         env->active_tc.PC += offset;
         set_hflags_for_handler(env);
-        env->CP0_Cause = (env->CP0_Cause & ~(0x1f << CP0Ca_EC)) | (cause << CP0Ca_EC);
+        env->CP0_Cause = (env->CP0_Cause & ~(0x1f << CP0Ca_EC)) |
+                         (cause << CP0Ca_EC);
         break;
     default:
         abort();
@@ -1390,7 +1411,7 @@ bool mips_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-void r4k_invalidate_tlb (CPUMIPSState *env, int idx, int use_extra)
+void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
 {
     CPUState *cs = env_cpu(env);
     r4k_tlb_t *tlb;
@@ -1400,16 +1421,20 @@ void r4k_invalidate_tlb (CPUMIPSState *env, int idx, int use_extra)
     target_ulong mask;
 
     tlb = &env->tlb->mmu.r4k.tlb[idx];
-    /* The qemu TLB is flushed when the ASID changes, so no need to
-       flush these entries again.  */
+    /*
+     * The qemu TLB is flushed when the ASID changes, so no need to
+     * flush these entries again.
+     */
     if (tlb->G == 0 && tlb->ASID != ASID) {
         return;
     }
 
     if (use_extra && env->tlb->tlb_in_use < MIPS_TLB_MAX) {
-        /* For tlbwr, we can shadow the discarded entry into
-           a new (fake) TLB entry, as long as the guest can not
-           tell that it's there.  */
+        /*
+         * For tlbwr, we can shadow the discarded entry into
+         * a new (fake) TLB entry, as long as the guest can not
+         * tell that it's there.
+         */
         env->tlb->mmu.r4k.tlb[env->tlb->tlb_in_use] = *tlb;
         env->tlb->tlb_in_use++;
         return;
-- 
2.7.4


