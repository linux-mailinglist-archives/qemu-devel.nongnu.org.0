Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF64712B
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jun 2019 18:09:16 +0200 (CEST)
Received: from localhost ([::1]:33064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcBEx-0007wM-GN
	for lists+qemu-devel@lfdr.de; Sat, 15 Jun 2019 12:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37413)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAwP-00086q-0P
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAwB-000303-KC
 for qemu-devel@nongnu.org; Sat, 15 Jun 2019 11:50:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52198)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAqu-0000T2-1P; Sat, 15 Jun 2019 11:44:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A3013DE0F;
 Sat, 15 Jun 2019 15:44:23 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC1161001B05;
 Sat, 15 Jun 2019 15:44:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:41 +0200
Message-Id: <20190615154352.26824-13-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Sat, 15 Jun 2019 15:44:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 12/23] target/arm: Move v7m exception
 handling routines to v7m_helper
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Samuel Ortiz <sameo@linux.intel.com>

In preparation for supporting TCG disablement on ARM, we move the v7m
exception handling routines to v7m_helper.c
arm_v7m_cpu_do_interrupt pulls a large number of static functions
out of helper.c into m_helper.c because it is TCG dependent.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
[PMD: Patch rewritten]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/helper.c     | 1876 ---------------------------------------
 target/arm/v7m_helper.c | 1876 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 1876 insertions(+), 1876 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5d05db84d3..24d88eef17 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7611,1530 +7611,6 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, u=
int32_t excp_idx,
     return target_el;
 }
=20
-/*
- * What kind of stack write are we doing? This affects how exceptions
- * generated during the stacking are treated.
- */
-typedef enum StackingMode {
-    STACK_NORMAL,
-    STACK_IGNFAULTS,
-    STACK_LAZYFP,
-} StackingMode;
-
-static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
-                            ARMMMUIdx mmu_idx, StackingMode mode)
-{
-    CPUState *cs =3D CPU(cpu);
-    CPUARMState *env =3D &cpu->env;
-    MemTxAttrs attrs =3D {};
-    MemTxResult txres;
-    target_ulong page_size;
-    hwaddr physaddr;
-    int prot;
-    ARMMMUFaultInfo fi =3D {};
-    bool secure =3D mmu_idx & ARM_MMU_IDX_M_S;
-    int exc;
-    bool exc_secure;
-
-    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
-                      &attrs, &prot, &page_size, &fi, NULL)) {
-        /* MPU/SAU lookup failed */
-        if (fi.type =3D=3D ARMFault_QEMU_SFault) {
-            if (mode =3D=3D STACK_LAZYFP) {
-                qemu_log_mask(CPU_LOG_INT,
-                              "...SecureFault with SFSR.LSPERR "
-                              "during lazy stacking\n");
-                env->v7m.sfsr |=3D R_V7M_SFSR_LSPERR_MASK;
-            } else {
-                qemu_log_mask(CPU_LOG_INT,
-                              "...SecureFault with SFSR.AUVIOL "
-                              "during stacking\n");
-                env->v7m.sfsr |=3D R_V7M_SFSR_AUVIOL_MASK;
-            }
-            env->v7m.sfsr |=3D R_V7M_SFSR_SFARVALID_MASK;
-            env->v7m.sfar =3D addr;
-            exc =3D ARMV7M_EXCP_SECURE;
-            exc_secure =3D false;
-        } else {
-            if (mode =3D=3D STACK_LAZYFP) {
-                qemu_log_mask(CPU_LOG_INT,
-                              "...MemManageFault with CFSR.MLSPERR\n");
-                env->v7m.cfsr[secure] |=3D R_V7M_CFSR_MLSPERR_MASK;
-            } else {
-                qemu_log_mask(CPU_LOG_INT,
-                              "...MemManageFault with CFSR.MSTKERR\n");
-                env->v7m.cfsr[secure] |=3D R_V7M_CFSR_MSTKERR_MASK;
-            }
-            exc =3D ARMV7M_EXCP_MEM;
-            exc_secure =3D secure;
-        }
-        goto pend_fault;
-    }
-    address_space_stl_le(arm_addressspace(cs, attrs), physaddr, value,
-                         attrs, &txres);
-    if (txres !=3D MEMTX_OK) {
-        /* BusFault trying to write the data */
-        if (mode =3D=3D STACK_LAZYFP) {
-            qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.LSPERR\n")=
;
-            env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_LSPERR_MASK;
-        } else {
-            qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.STKERR\n")=
;
-            env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_STKERR_MASK;
-        }
-        exc =3D ARMV7M_EXCP_BUS;
-        exc_secure =3D false;
-        goto pend_fault;
-    }
-    return true;
-
-pend_fault:
-    /*
-     * By pending the exception at this point we are making
-     * the IMPDEF choice "overridden exceptions pended" (see the
-     * MergeExcInfo() pseudocode). The other choice would be to not
-     * pend them now and then make a choice about which to throw away
-     * later if we have two derived exceptions.
-     * The only case when we must not pend the exception but instead
-     * throw it away is if we are doing the push of the callee registers
-     * and we've already generated a derived exception (this is indicate=
d
-     * by the caller passing STACK_IGNFAULTS). Even in this case we will
-     * still update the fault status registers.
-     */
-    switch (mode) {
-    case STACK_NORMAL:
-        armv7m_nvic_set_pending_derived(env->nvic, exc, exc_secure);
-        break;
-    case STACK_LAZYFP:
-        armv7m_nvic_set_pending_lazyfp(env->nvic, exc, exc_secure);
-        break;
-    case STACK_IGNFAULTS:
-        break;
-    }
-    return false;
-}
-
-static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
-                           ARMMMUIdx mmu_idx)
-{
-    CPUState *cs =3D CPU(cpu);
-    CPUARMState *env =3D &cpu->env;
-    MemTxAttrs attrs =3D {};
-    MemTxResult txres;
-    target_ulong page_size;
-    hwaddr physaddr;
-    int prot;
-    ARMMMUFaultInfo fi =3D {};
-    bool secure =3D mmu_idx & ARM_MMU_IDX_M_S;
-    int exc;
-    bool exc_secure;
-    uint32_t value;
-
-    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
-                      &attrs, &prot, &page_size, &fi, NULL)) {
-        /* MPU/SAU lookup failed */
-        if (fi.type =3D=3D ARMFault_QEMU_SFault) {
-            qemu_log_mask(CPU_LOG_INT,
-                          "...SecureFault with SFSR.AUVIOL during unstac=
k\n");
-            env->v7m.sfsr |=3D R_V7M_SFSR_AUVIOL_MASK | R_V7M_SFSR_SFARV=
ALID_MASK;
-            env->v7m.sfar =3D addr;
-            exc =3D ARMV7M_EXCP_SECURE;
-            exc_secure =3D false;
-        } else {
-            qemu_log_mask(CPU_LOG_INT,
-                          "...MemManageFault with CFSR.MUNSTKERR\n");
-            env->v7m.cfsr[secure] |=3D R_V7M_CFSR_MUNSTKERR_MASK;
-            exc =3D ARMV7M_EXCP_MEM;
-            exc_secure =3D secure;
-        }
-        goto pend_fault;
-    }
-
-    value =3D address_space_ldl(arm_addressspace(cs, attrs), physaddr,
-                              attrs, &txres);
-    if (txres !=3D MEMTX_OK) {
-        /* BusFault trying to read the data */
-        qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.UNSTKERR\n");
-        env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_UNSTKERR_MASK;
-        exc =3D ARMV7M_EXCP_BUS;
-        exc_secure =3D false;
-        goto pend_fault;
-    }
-
-    *dest =3D value;
-    return true;
-
-pend_fault:
-    /*
-     * By pending the exception at this point we are making
-     * the IMPDEF choice "overridden exceptions pended" (see the
-     * MergeExcInfo() pseudocode). The other choice would be to not
-     * pend them now and then make a choice about which to throw away
-     * later if we have two derived exceptions.
-     */
-    armv7m_nvic_set_pending(env->nvic, exc, exc_secure);
-    return false;
-}
-
-void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
-{
-    /*
-     * Preserve FP state (because LSPACT was set and we are about
-     * to execute an FP instruction). This corresponds to the
-     * PreserveFPState() pseudocode.
-     * We may throw an exception if the stacking fails.
-     */
-    ARMCPU *cpu =3D env_archcpu(env);
-    bool is_secure =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
-    bool negpri =3D !(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_HFRDY_MASK);
-    bool is_priv =3D !(env->v7m.fpccr[is_secure] & R_V7M_FPCCR_USER_MASK=
);
-    bool splimviol =3D env->v7m.fpccr[is_secure] & R_V7M_FPCCR_SPLIMVIOL=
_MASK;
-    uint32_t fpcar =3D env->v7m.fpcar[is_secure];
-    bool stacked_ok =3D true;
-    bool ts =3D is_secure && (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_M=
ASK);
-    bool take_exception;
-
-    /* Take the iothread lock as we are going to touch the NVIC */
-    qemu_mutex_lock_iothread();
-
-    /* Check the background context had access to the FPU */
-    if (!v7m_cpacr_pass(env, is_secure, is_priv)) {
-        armv7m_nvic_set_pending_lazyfp(env->nvic, ARMV7M_EXCP_USAGE, is_=
secure);
-        env->v7m.cfsr[is_secure] |=3D R_V7M_CFSR_NOCP_MASK;
-        stacked_ok =3D false;
-    } else if (!is_secure && !extract32(env->v7m.nsacr, 10, 1)) {
-        armv7m_nvic_set_pending_lazyfp(env->nvic, ARMV7M_EXCP_USAGE, M_R=
EG_S);
-        env->v7m.cfsr[M_REG_S] |=3D R_V7M_CFSR_NOCP_MASK;
-        stacked_ok =3D false;
-    }
-
-    if (!splimviol && stacked_ok) {
-        /* We only stack if the stack limit wasn't violated */
-        int i;
-        ARMMMUIdx mmu_idx;
-
-        mmu_idx =3D arm_v7m_mmu_idx_all(env, is_secure, is_priv, negpri)=
;
-        for (i =3D 0; i < (ts ? 32 : 16); i +=3D 2) {
-            uint64_t dn =3D *aa32_vfp_dreg(env, i / 2);
-            uint32_t faddr =3D fpcar + 4 * i;
-            uint32_t slo =3D extract64(dn, 0, 32);
-            uint32_t shi =3D extract64(dn, 32, 32);
-
-            if (i >=3D 16) {
-                faddr +=3D 8; /* skip the slot for the FPSCR */
-            }
-            stacked_ok =3D stacked_ok &&
-                v7m_stack_write(cpu, faddr, slo, mmu_idx, STACK_LAZYFP) =
&&
-                v7m_stack_write(cpu, faddr + 4, shi, mmu_idx, STACK_LAZY=
FP);
-        }
-
-        stacked_ok =3D stacked_ok &&
-            v7m_stack_write(cpu, fpcar + 0x40,
-                            vfp_get_fpscr(env), mmu_idx, STACK_LAZYFP);
-    }
-
-    /*
-     * We definitely pended an exception, but it's possible that it
-     * might not be able to be taken now. If its priority permits us
-     * to take it now, then we must not update the LSPACT or FP regs,
-     * but instead jump out to take the exception immediately.
-     * If it's just pending and won't be taken until the current
-     * handler exits, then we do update LSPACT and the FP regs.
-     */
-    take_exception =3D !stacked_ok &&
-        armv7m_nvic_can_take_pending_exception(env->nvic);
-
-    qemu_mutex_unlock_iothread();
-
-    if (take_exception) {
-        raise_exception_ra(env, EXCP_LAZYFP, 0, 1, GETPC());
-    }
-
-    env->v7m.fpccr[is_secure] &=3D ~R_V7M_FPCCR_LSPACT_MASK;
-
-    if (ts) {
-        /* Clear s0 to s31 and the FPSCR */
-        int i;
-
-        for (i =3D 0; i < 32; i +=3D 2) {
-            *aa32_vfp_dreg(env, i / 2) =3D 0;
-        }
-        vfp_set_fpscr(env, 0);
-    }
-    /*
-     * Otherwise s0 to s15 and FPSCR are UNKNOWN; we choose to leave the=
m
-     * unchanged.
-     */
-}
-
-static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool thre=
admode,
-                                bool spsel)
-{
-    /*
-     * Return a pointer to the location where we currently store the
-     * stack pointer for the requested security state and thread mode.
-     * This pointer will become invalid if the CPU state is updated
-     * such that the stack pointers are switched around (eg changing
-     * the SPSEL control bit).
-     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
-     * Unlike that pseudocode, we require the caller to pass us in the
-     * SPSEL control bit value; this is because we also use this
-     * function in handling of pushing of the callee-saves registers
-     * part of the v8M stack frame (pseudocode PushCalleeStack()),
-     * and in the tailchain codepath the SPSEL bit comes from the except=
ion
-     * return magic LR value from the previous exception. The pseudocode
-     * opencodes the stack-selection in PushCalleeStack(), but we prefer
-     * to make this utility function generic enough to do the job.
-     */
-    bool want_psp =3D threadmode && spsel;
-
-    if (secure =3D=3D env->v7m.secure) {
-        if (want_psp =3D=3D v7m_using_psp(env)) {
-            return &env->regs[13];
-        } else {
-            return &env->v7m.other_sp;
-        }
-    } else {
-        if (want_psp) {
-            return &env->v7m.other_ss_psp;
-        } else {
-            return &env->v7m.other_ss_msp;
-        }
-    }
-}
-
-static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secur=
e,
-                                uint32_t *pvec)
-{
-    CPUState *cs =3D CPU(cpu);
-    CPUARMState *env =3D &cpu->env;
-    MemTxResult result;
-    uint32_t addr =3D env->v7m.vecbase[targets_secure] + exc * 4;
-    uint32_t vector_entry;
-    MemTxAttrs attrs =3D {};
-    ARMMMUIdx mmu_idx;
-    bool exc_secure;
-
-    mmu_idx =3D arm_v7m_mmu_idx_for_secstate_and_priv(env, targets_secur=
e, true);
-
-    /*
-     * We don't do a get_phys_addr() here because the rules for vector
-     * loads are special: they always use the default memory map, and
-     * the default memory map permits reads from all addresses.
-     * Since there's no easy way to pass through to pmsav8_mpu_lookup()
-     * that we want this special case which would always say "yes",
-     * we just do the SAU lookup here followed by a direct physical load=
.
-     */
-    attrs.secure =3D targets_secure;
-    attrs.user =3D false;
-
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        V8M_SAttributes sattrs =3D {};
-
-        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
-        if (sattrs.ns) {
-            attrs.secure =3D false;
-        } else if (!targets_secure) {
-            /* NS access to S memory */
-            goto load_fail;
-        }
-    }
-
-    vector_entry =3D address_space_ldl(arm_addressspace(cs, attrs), addr=
,
-                                     attrs, &result);
-    if (result !=3D MEMTX_OK) {
-        goto load_fail;
-    }
-    *pvec =3D vector_entry;
-    return true;
-
-load_fail:
-    /*
-     * All vector table fetch fails are reported as HardFault, with
-     * HFSR.VECTTBL and .FORCED set. (FORCED is set because
-     * technically the underlying exception is a MemManage or BusFault
-     * that is escalated to HardFault.) This is a terminal exception,
-     * so we will either take the HardFault immediately or else enter
-     * lockup (the latter case is handled in armv7m_nvic_set_pending_der=
ived()).
-     */
-    exc_secure =3D targets_secure ||
-        !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
-    env->v7m.hfsr |=3D R_V7M_HFSR_VECTTBL_MASK | R_V7M_HFSR_FORCED_MASK;
-    armv7m_nvic_set_pending_derived(env->nvic, ARMV7M_EXCP_HARD, exc_sec=
ure);
-    return false;
-}
-
-static uint32_t v7m_integrity_sig(CPUARMState *env, uint32_t lr)
-{
-    /*
-     * Return the integrity signature value for the callee-saves
-     * stack frame section. @lr is the exception return payload/LR value
-     * whose FType bit forms bit 0 of the signature if FP is present.
-     */
-    uint32_t sig =3D 0xfefa125a;
-
-    if (!arm_feature(env, ARM_FEATURE_VFP) || (lr & R_V7M_EXCRET_FTYPE_M=
ASK)) {
-        sig |=3D 1;
-    }
-    return sig;
-}
-
-static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailc=
hain,
-                                  bool ignore_faults)
-{
-    /*
-     * For v8M, push the callee-saves register part of the stack frame.
-     * Compare the v8M pseudocode PushCalleeStack().
-     * In the tailchaining case this may not be the current stack.
-     */
-    CPUARMState *env =3D &cpu->env;
-    uint32_t *frame_sp_p;
-    uint32_t frameptr;
-    ARMMMUIdx mmu_idx;
-    bool stacked_ok;
-    uint32_t limit;
-    bool want_psp;
-    uint32_t sig;
-    StackingMode smode =3D ignore_faults ? STACK_IGNFAULTS : STACK_NORMA=
L;
-
-    if (dotailchain) {
-        bool mode =3D lr & R_V7M_EXCRET_MODE_MASK;
-        bool priv =3D !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_NPRIV_=
MASK) ||
-            !mode;
-
-        mmu_idx =3D arm_v7m_mmu_idx_for_secstate_and_priv(env, M_REG_S, =
priv);
-        frame_sp_p =3D get_v7m_sp_ptr(env, M_REG_S, mode,
-                                    lr & R_V7M_EXCRET_SPSEL_MASK);
-        want_psp =3D mode && (lr & R_V7M_EXCRET_SPSEL_MASK);
-        if (want_psp) {
-            limit =3D env->v7m.psplim[M_REG_S];
-        } else {
-            limit =3D env->v7m.msplim[M_REG_S];
-        }
-    } else {
-        mmu_idx =3D arm_mmu_idx(env);
-        frame_sp_p =3D &env->regs[13];
-        limit =3D v7m_sp_limit(env);
-    }
-
-    frameptr =3D *frame_sp_p - 0x28;
-    if (frameptr < limit) {
-        /*
-         * Stack limit failure: set SP to the limit value, and generate
-         * STKOF UsageFault. Stack pushes below the limit must not be
-         * performed. It is IMPDEF whether pushes above the limit are
-         * performed; we choose not to.
-         */
-        qemu_log_mask(CPU_LOG_INT,
-                      "...STKOF during callee-saves register stacking\n"=
);
-        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_STKOF_MASK;
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
-                                env->v7m.secure);
-        *frame_sp_p =3D limit;
-        return true;
-    }
-
-    /*
-     * Write as much of the stack frame as we can. A write failure may
-     * cause us to pend a derived exception.
-     */
-    sig =3D v7m_integrity_sig(env, lr);
-    stacked_ok =3D
-        v7m_stack_write(cpu, frameptr, sig, mmu_idx, smode) &&
-        v7m_stack_write(cpu, frameptr + 0x8, env->regs[4], mmu_idx, smod=
e) &&
-        v7m_stack_write(cpu, frameptr + 0xc, env->regs[5], mmu_idx, smod=
e) &&
-        v7m_stack_write(cpu, frameptr + 0x10, env->regs[6], mmu_idx, smo=
de) &&
-        v7m_stack_write(cpu, frameptr + 0x14, env->regs[7], mmu_idx, smo=
de) &&
-        v7m_stack_write(cpu, frameptr + 0x18, env->regs[8], mmu_idx, smo=
de) &&
-        v7m_stack_write(cpu, frameptr + 0x1c, env->regs[9], mmu_idx, smo=
de) &&
-        v7m_stack_write(cpu, frameptr + 0x20, env->regs[10], mmu_idx, sm=
ode) &&
-        v7m_stack_write(cpu, frameptr + 0x24, env->regs[11], mmu_idx, sm=
ode);
-
-    /* Update SP regardless of whether any of the stack accesses failed.=
 */
-    *frame_sp_p =3D frameptr;
-
-    return !stacked_ok;
-}
-
-static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailcha=
in,
-                                bool ignore_stackfaults)
-{
-    /*
-     * Do the "take the exception" parts of exception entry,
-     * but not the pushing of state to the stack. This is
-     * similar to the pseudocode ExceptionTaken() function.
-     */
-    CPUARMState *env =3D &cpu->env;
-    uint32_t addr;
-    bool targets_secure;
-    int exc;
-    bool push_failed =3D false;
-
-    armv7m_nvic_get_pending_irq_info(env->nvic, &exc, &targets_secure);
-    qemu_log_mask(CPU_LOG_INT, "...taking pending %s exception %d\n",
-                  targets_secure ? "secure" : "nonsecure", exc);
-
-    if (dotailchain) {
-        /* Sanitize LR FType and PREFIX bits */
-        if (!arm_feature(env, ARM_FEATURE_VFP)) {
-            lr |=3D R_V7M_EXCRET_FTYPE_MASK;
-        }
-        lr =3D deposit32(lr, 24, 8, 0xff);
-    }
-
-    if (arm_feature(env, ARM_FEATURE_V8)) {
-        if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-            (lr & R_V7M_EXCRET_S_MASK)) {
-            /*
-             * The background code (the owner of the registers in the
-             * exception frame) is Secure. This means it may either alre=
ady
-             * have or now needs to push callee-saves registers.
-             */
-            if (targets_secure) {
-                if (dotailchain && !(lr & R_V7M_EXCRET_ES_MASK)) {
-                    /*
-                     * We took an exception from Secure to NonSecure
-                     * (which means the callee-saved registers got stack=
ed)
-                     * and are now tailchaining to a Secure exception.
-                     * Clear DCRS so eventual return from this Secure
-                     * exception unstacks the callee-saved registers.
-                     */
-                    lr &=3D ~R_V7M_EXCRET_DCRS_MASK;
-                }
-            } else {
-                /*
-                 * We're going to a non-secure exception; push the
-                 * callee-saves registers to the stack now, if they're
-                 * not already saved.
-                 */
-                if (lr & R_V7M_EXCRET_DCRS_MASK &&
-                    !(dotailchain && !(lr & R_V7M_EXCRET_ES_MASK))) {
-                    push_failed =3D v7m_push_callee_stack(cpu, lr, dotai=
lchain,
-                                                        ignore_stackfaul=
ts);
-                }
-                lr |=3D R_V7M_EXCRET_DCRS_MASK;
-            }
-        }
-
-        lr &=3D ~R_V7M_EXCRET_ES_MASK;
-        if (targets_secure || !arm_feature(env, ARM_FEATURE_M_SECURITY))=
 {
-            lr |=3D R_V7M_EXCRET_ES_MASK;
-        }
-        lr &=3D ~R_V7M_EXCRET_SPSEL_MASK;
-        if (env->v7m.control[targets_secure] & R_V7M_CONTROL_SPSEL_MASK)=
 {
-            lr |=3D R_V7M_EXCRET_SPSEL_MASK;
-        }
-
-        /*
-         * Clear registers if necessary to prevent non-secure exception
-         * code being able to see register values from secure code.
-         * Where register values become architecturally UNKNOWN we leave
-         * them with their previous values.
-         */
-        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            if (!targets_secure) {
-                /*
-                 * Always clear the caller-saved registers (they have be=
en
-                 * pushed to the stack earlier in v7m_push_stack()).
-                 * Clear callee-saved registers if the background code i=
s
-                 * Secure (in which case these regs were saved in
-                 * v7m_push_callee_stack()).
-                 */
-                int i;
-
-                for (i =3D 0; i < 13; i++) {
-                    /* r4..r11 are callee-saves, zero only if EXCRET.S =3D=
=3D 1 */
-                    if (i < 4 || i > 11 || (lr & R_V7M_EXCRET_S_MASK)) {
-                        env->regs[i] =3D 0;
-                    }
-                }
-                /* Clear EAPSR */
-                xpsr_write(env, 0, XPSR_NZCV | XPSR_Q | XPSR_GE | XPSR_I=
T);
-            }
-        }
-    }
-
-    if (push_failed && !ignore_stackfaults) {
-        /*
-         * Derived exception on callee-saves register stacking:
-         * we might now want to take a different exception which
-         * targets a different security state, so try again from the top=
.
-         */
-        qemu_log_mask(CPU_LOG_INT,
-                      "...derived exception on callee-saves register sta=
cking");
-        v7m_exception_taken(cpu, lr, true, true);
-        return;
-    }
-
-    if (!arm_v7m_load_vector(cpu, exc, targets_secure, &addr)) {
-        /* Vector load failed: derived exception */
-        qemu_log_mask(CPU_LOG_INT, "...derived exception on vector table=
 load");
-        v7m_exception_taken(cpu, lr, true, true);
-        return;
-    }
-
-    /*
-     * Now we've done everything that might cause a derived exception
-     * we can go ahead and activate whichever exception we're going to
-     * take (which might now be the derived exception).
-     */
-    armv7m_nvic_acknowledge_irq(env->nvic);
-
-    /* Switch to target security state -- must do this before writing SP=
SEL */
-    switch_v7m_security_state(env, targets_secure);
-    write_v7m_control_spsel(env, 0);
-    arm_clear_exclusive(env);
-    /* Clear SFPA and FPCA (has no effect if no FPU) */
-    env->v7m.control[M_REG_S] &=3D
-        ~(R_V7M_CONTROL_FPCA_MASK | R_V7M_CONTROL_SFPA_MASK);
-    /* Clear IT bits */
-    env->condexec_bits =3D 0;
-    env->regs[14] =3D lr;
-    env->regs[15] =3D addr & 0xfffffffe;
-    env->thumb =3D addr & 1;
-}
-
-static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
-                             bool apply_splim)
-{
-    /*
-     * Like the pseudocode UpdateFPCCR: save state in FPCAR and FPCCR
-     * that we will need later in order to do lazy FP reg stacking.
-     */
-    bool is_secure =3D env->v7m.secure;
-    void *nvic =3D env->nvic;
-    /*
-     * Some bits are unbanked and live always in fpccr[M_REG_S]; some bi=
ts
-     * are banked and we want to update the bit in the bank for the
-     * current security state; and in one case we want to specifically
-     * update the NS banked version of a bit even if we are secure.
-     */
-    uint32_t *fpccr_s =3D &env->v7m.fpccr[M_REG_S];
-    uint32_t *fpccr_ns =3D &env->v7m.fpccr[M_REG_NS];
-    uint32_t *fpccr =3D &env->v7m.fpccr[is_secure];
-    bool hfrdy, bfrdy, mmrdy, ns_ufrdy, s_ufrdy, sfrdy, monrdy;
-
-    env->v7m.fpcar[is_secure] =3D frameptr & ~0x7;
-
-    if (apply_splim && arm_feature(env, ARM_FEATURE_V8)) {
-        bool splimviol;
-        uint32_t splim =3D v7m_sp_limit(env);
-        bool ign =3D armv7m_nvic_neg_prio_requested(nvic, is_secure) &&
-            (env->v7m.ccr[is_secure] & R_V7M_CCR_STKOFHFNMIGN_MASK);
-
-        splimviol =3D !ign && frameptr < splim;
-        *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, SPLIMVIOL, splimviol);
-    }
-
-    *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, LSPACT, 1);
-
-    *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, S, is_secure);
-
-    *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, USER, arm_current_el(env) =3D=
=3D 0);
-
-    *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, THREAD,
-                        !arm_v7m_is_handler_mode(env));
-
-    hfrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_HARD, false=
);
-    *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, HFRDY, hfrdy);
-
-    bfrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_BUS, false)=
;
-    *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, BFRDY, bfrdy);
-
-    mmrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_MEM, is_sec=
ure);
-    *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, MMRDY, mmrdy);
-
-    ns_ufrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_USAGE, f=
alse);
-    *fpccr_ns =3D FIELD_DP32(*fpccr_ns, V7M_FPCCR, UFRDY, ns_ufrdy);
-
-    monrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_DEBUG, fal=
se);
-    *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, MONRDY, monrdy);
-
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        s_ufrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_USAGE=
, true);
-        *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, UFRDY, s_ufrdy);
-
-        sfrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_SECURE,=
 false);
-        *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, SFRDY, sfrdy);
-    }
-}
-
-void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
-{
-    /* fptr is the value of Rn, the frame pointer we store the FP regs t=
o */
-    bool s =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
-    bool lspact =3D env->v7m.fpccr[s] & R_V7M_FPCCR_LSPACT_MASK;
-
-    assert(env->v7m.secure);
-
-    if (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)) {
-        return;
-    }
-
-    /* Check access to the coprocessor is permitted */
-    if (!v7m_cpacr_pass(env, true, arm_current_el(env) !=3D 0)) {
-        raise_exception_ra(env, EXCP_NOCP, 0, 1, GETPC());
-    }
-
-    if (lspact) {
-        /* LSPACT should not be active when there is active FP state */
-        raise_exception_ra(env, EXCP_LSERR, 0, 1, GETPC());
-    }
-
-    if (fptr & 7) {
-        raise_exception_ra(env, EXCP_UNALIGNED, 0, 1, GETPC());
-    }
-
-    /*
-     * Note that we do not use v7m_stack_write() here, because the
-     * accesses should not set the FSR bits for stacking errors if they
-     * fail. (In pseudocode terms, they are AccType_NORMAL, not AccType_=
STACK
-     * or AccType_LAZYFP). Faults in cpu_stl_data() will throw exception=
s
-     * and longjmp out.
-     */
-    if (!(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPEN_MASK)) {
-        bool ts =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK;
-        int i;
-
-        for (i =3D 0; i < (ts ? 32 : 16); i +=3D 2) {
-            uint64_t dn =3D *aa32_vfp_dreg(env, i / 2);
-            uint32_t faddr =3D fptr + 4 * i;
-            uint32_t slo =3D extract64(dn, 0, 32);
-            uint32_t shi =3D extract64(dn, 32, 32);
-
-            if (i >=3D 16) {
-                faddr +=3D 8; /* skip the slot for the FPSCR */
-            }
-            cpu_stl_data(env, faddr, slo);
-            cpu_stl_data(env, faddr + 4, shi);
-        }
-        cpu_stl_data(env, fptr + 0x40, vfp_get_fpscr(env));
-
-        /*
-         * If TS is 0 then s0 to s15 and FPSCR are UNKNOWN; we choose to
-         * leave them unchanged, matching our choice in v7m_preserve_fp_=
state.
-         */
-        if (ts) {
-            for (i =3D 0; i < 32; i +=3D 2) {
-                *aa32_vfp_dreg(env, i / 2) =3D 0;
-            }
-            vfp_set_fpscr(env, 0);
-        }
-    } else {
-        v7m_update_fpccr(env, fptr, false);
-    }
-
-    env->v7m.control[M_REG_S] &=3D ~R_V7M_CONTROL_FPCA_MASK;
-}
-
-void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
-{
-    /* fptr is the value of Rn, the frame pointer we load the FP regs fr=
om */
-    assert(env->v7m.secure);
-
-    if (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)) {
-        return;
-    }
-
-    /* Check access to the coprocessor is permitted */
-    if (!v7m_cpacr_pass(env, true, arm_current_el(env) !=3D 0)) {
-        raise_exception_ra(env, EXCP_NOCP, 0, 1, GETPC());
-    }
-
-    if (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPACT_MASK) {
-        /* State in FP is still valid */
-        env->v7m.fpccr[M_REG_S] &=3D ~R_V7M_FPCCR_LSPACT_MASK;
-    } else {
-        bool ts =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK;
-        int i;
-        uint32_t fpscr;
-
-        if (fptr & 7) {
-            raise_exception_ra(env, EXCP_UNALIGNED, 0, 1, GETPC());
-        }
-
-        for (i =3D 0; i < (ts ? 32 : 16); i +=3D 2) {
-            uint32_t slo, shi;
-            uint64_t dn;
-            uint32_t faddr =3D fptr + 4 * i;
-
-            if (i >=3D 16) {
-                faddr +=3D 8; /* skip the slot for the FPSCR */
-            }
-
-            slo =3D cpu_ldl_data(env, faddr);
-            shi =3D cpu_ldl_data(env, faddr + 4);
-
-            dn =3D (uint64_t) shi << 32 | slo;
-            *aa32_vfp_dreg(env, i / 2) =3D dn;
-        }
-        fpscr =3D cpu_ldl_data(env, fptr + 0x40);
-        vfp_set_fpscr(env, fpscr);
-    }
-
-    env->v7m.control[M_REG_S] |=3D R_V7M_CONTROL_FPCA_MASK;
-}
-
-static bool v7m_push_stack(ARMCPU *cpu)
-{
-    /*
-     * Do the "set up stack frame" part of exception entry,
-     * similar to pseudocode PushStack().
-     * Return true if we generate a derived exception (and so
-     * should ignore further stack faults trying to process
-     * that derived exception.)
-     */
-    bool stacked_ok =3D true, limitviol =3D false;
-    CPUARMState *env =3D &cpu->env;
-    uint32_t xpsr =3D xpsr_read(env);
-    uint32_t frameptr =3D env->regs[13];
-    ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
-    uint32_t framesize;
-    bool nsacr_cp10 =3D extract32(env->v7m.nsacr, 10, 1);
-
-    if ((env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) &&
-        (env->v7m.secure || nsacr_cp10)) {
-        if (env->v7m.secure &&
-            env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK) {
-            framesize =3D 0xa8;
-        } else {
-            framesize =3D 0x68;
-        }
-    } else {
-        framesize =3D 0x20;
-    }
-
-    /* Align stack pointer if the guest wants that */
-    if ((frameptr & 4) &&
-        (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKALIGN_MASK)) {
-        frameptr -=3D 4;
-        xpsr |=3D XPSR_SPREALIGN;
-    }
-
-    xpsr &=3D ~XPSR_SFPA;
-    if (env->v7m.secure &&
-        (env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)) {
-        xpsr |=3D XPSR_SFPA;
-    }
-
-    frameptr -=3D framesize;
-
-    if (arm_feature(env, ARM_FEATURE_V8)) {
-        uint32_t limit =3D v7m_sp_limit(env);
-
-        if (frameptr < limit) {
-            /*
-             * Stack limit failure: set SP to the limit value, and gener=
ate
-             * STKOF UsageFault. Stack pushes below the limit must not b=
e
-             * performed. It is IMPDEF whether pushes above the limit ar=
e
-             * performed; we choose not to.
-             */
-            qemu_log_mask(CPU_LOG_INT,
-                          "...STKOF during stacking\n");
-            env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_STKOF_MASK;
-            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
-                                    env->v7m.secure);
-            env->regs[13] =3D limit;
-            /*
-             * We won't try to perform any further memory accesses but
-             * we must continue through the following code to check for
-             * permission faults during FPU state preservation, and we
-             * must update FPCCR if lazy stacking is enabled.
-             */
-            limitviol =3D true;
-            stacked_ok =3D false;
-        }
-    }
-
-    /*
-     * Write as much of the stack frame as we can. If we fail a stack
-     * write this will result in a derived exception being pended
-     * (which may be taken in preference to the one we started with
-     * if it has higher priority).
-     */
-    stacked_ok =3D stacked_ok &&
-        v7m_stack_write(cpu, frameptr, env->regs[0], mmu_idx, STACK_NORM=
AL) &&
-        v7m_stack_write(cpu, frameptr + 4, env->regs[1],
-                        mmu_idx, STACK_NORMAL) &&
-        v7m_stack_write(cpu, frameptr + 8, env->regs[2],
-                        mmu_idx, STACK_NORMAL) &&
-        v7m_stack_write(cpu, frameptr + 12, env->regs[3],
-                        mmu_idx, STACK_NORMAL) &&
-        v7m_stack_write(cpu, frameptr + 16, env->regs[12],
-                        mmu_idx, STACK_NORMAL) &&
-        v7m_stack_write(cpu, frameptr + 20, env->regs[14],
-                        mmu_idx, STACK_NORMAL) &&
-        v7m_stack_write(cpu, frameptr + 24, env->regs[15],
-                        mmu_idx, STACK_NORMAL) &&
-        v7m_stack_write(cpu, frameptr + 28, xpsr, mmu_idx, STACK_NORMAL)=
;
-
-    if (env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) {
-        /* FPU is active, try to save its registers */
-        bool fpccr_s =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
-        bool lspact =3D env->v7m.fpccr[fpccr_s] & R_V7M_FPCCR_LSPACT_MAS=
K;
-
-        if (lspact && arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            qemu_log_mask(CPU_LOG_INT,
-                          "...SecureFault because LSPACT and FPCA both s=
et\n");
-            env->v7m.sfsr |=3D R_V7M_SFSR_LSERR_MASK;
-            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false=
);
-        } else if (!env->v7m.secure && !nsacr_cp10) {
-            qemu_log_mask(CPU_LOG_INT,
-                          "...Secure UsageFault with CFSR.NOCP because "
-                          "NSACR.CP10 prevents stacking FP regs\n");
-            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, M_REG_=
S);
-            env->v7m.cfsr[M_REG_S] |=3D R_V7M_CFSR_NOCP_MASK;
-        } else {
-            if (!(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPEN_MASK)) {
-                /* Lazy stacking disabled, save registers now */
-                int i;
-                bool cpacr_pass =3D v7m_cpacr_pass(env, env->v7m.secure,
-                                                 arm_current_el(env) !=3D=
 0);
-
-                if (stacked_ok && !cpacr_pass) {
-                    /*
-                     * Take UsageFault if CPACR forbids access. The pseu=
docode
-                     * here does a full CheckCPEnabled() but we know the=
 NSACR
-                     * check can never fail as we have already handled t=
hat.
-                     */
-                    qemu_log_mask(CPU_LOG_INT,
-                                  "...UsageFault with CFSR.NOCP because =
"
-                                  "CPACR.CP10 prevents stacking FP regs\=
n");
-                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE=
,
-                                            env->v7m.secure);
-                    env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_NOCP_=
MASK;
-                    stacked_ok =3D false;
-                }
-
-                for (i =3D 0; i < ((framesize =3D=3D 0xa8) ? 32 : 16); i=
 +=3D 2) {
-                    uint64_t dn =3D *aa32_vfp_dreg(env, i / 2);
-                    uint32_t faddr =3D frameptr + 0x20 + 4 * i;
-                    uint32_t slo =3D extract64(dn, 0, 32);
-                    uint32_t shi =3D extract64(dn, 32, 32);
-
-                    if (i >=3D 16) {
-                        faddr +=3D 8; /* skip the slot for the FPSCR */
-                    }
-                    stacked_ok =3D stacked_ok &&
-                        v7m_stack_write(cpu, faddr, slo,
-                                        mmu_idx, STACK_NORMAL) &&
-                        v7m_stack_write(cpu, faddr + 4, shi,
-                                        mmu_idx, STACK_NORMAL);
-                }
-                stacked_ok =3D stacked_ok &&
-                    v7m_stack_write(cpu, frameptr + 0x60,
-                                    vfp_get_fpscr(env), mmu_idx, STACK_N=
ORMAL);
-                if (cpacr_pass) {
-                    for (i =3D 0; i < ((framesize =3D=3D 0xa8) ? 32 : 16=
); i +=3D 2) {
-                        *aa32_vfp_dreg(env, i / 2) =3D 0;
-                    }
-                    vfp_set_fpscr(env, 0);
-                }
-            } else {
-                /* Lazy stacking enabled, save necessary info to stack l=
ater */
-                v7m_update_fpccr(env, frameptr + 0x20, true);
-            }
-        }
-    }
-
-    /*
-     * If we broke a stack limit then SP was already updated earlier;
-     * otherwise we update SP regardless of whether any of the stack
-     * accesses failed or we took some other kind of fault.
-     */
-    if (!limitviol) {
-        env->regs[13] =3D frameptr;
-    }
-
-    return !stacked_ok;
-}
-
-static void do_v7m_exception_exit(ARMCPU *cpu)
-{
-    CPUARMState *env =3D &cpu->env;
-    uint32_t excret;
-    uint32_t xpsr, xpsr_mask;
-    bool ufault =3D false;
-    bool sfault =3D false;
-    bool return_to_sp_process;
-    bool return_to_handler;
-    bool rettobase =3D false;
-    bool exc_secure =3D false;
-    bool return_to_secure;
-    bool ftype;
-    bool restore_s16_s31;
-
-    /*
-     * If we're not in Handler mode then jumps to magic exception-exit
-     * addresses don't have magic behaviour. However for the v8M
-     * security extensions the magic secure-function-return has to
-     * work in thread mode too, so to avoid doing an extra check in
-     * the generated code we allow exception-exit magic to also cause th=
e
-     * internal exception and bring us here in thread mode. Correct code
-     * will never try to do this (the following insn fetch will always
-     * fault) so we the overhead of having taken an unnecessary exceptio=
n
-     * doesn't matter.
-     */
-    if (!arm_v7m_is_handler_mode(env)) {
-        return;
-    }
-
-    /*
-     * In the spec pseudocode ExceptionReturn() is called directly
-     * from BXWritePC() and gets the full target PC value including
-     * bit zero. In QEMU's implementation we treat it as a normal
-     * jump-to-register (which is then caught later on), and so split
-     * the target value up between env->regs[15] and env->thumb in
-     * gen_bx(). Reconstitute it.
-     */
-    excret =3D env->regs[15];
-    if (env->thumb) {
-        excret |=3D 1;
-    }
-
-    qemu_log_mask(CPU_LOG_INT, "Exception return: magic PC %" PRIx32
-                  " previous exception %d\n",
-                  excret, env->v7m.exception);
-
-    if ((excret & R_V7M_EXCRET_RES1_MASK) !=3D R_V7M_EXCRET_RES1_MASK) {
-        qemu_log_mask(LOG_GUEST_ERROR, "M profile: zero high bits in exc=
eption "
-                      "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n",
-                      excret);
-    }
-
-    ftype =3D excret & R_V7M_EXCRET_FTYPE_MASK;
-
-    if (!arm_feature(env, ARM_FEATURE_VFP) && !ftype) {
-        qemu_log_mask(LOG_GUEST_ERROR, "M profile: zero FTYPE in excepti=
on "
-                      "exit PC value 0x%" PRIx32 " is UNPREDICTABLE "
-                      "if FPU not present\n",
-                      excret);
-        ftype =3D true;
-    }
-
-    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-        /*
-         * EXC_RETURN.ES validation check (R_SMFL). We must do this befo=
re
-         * we pick which FAULTMASK to clear.
-         */
-        if (!env->v7m.secure &&
-            ((excret & R_V7M_EXCRET_ES_MASK) ||
-             !(excret & R_V7M_EXCRET_DCRS_MASK))) {
-            sfault =3D 1;
-            /* For all other purposes, treat ES as 0 (R_HXSR) */
-            excret &=3D ~R_V7M_EXCRET_ES_MASK;
-        }
-        exc_secure =3D excret & R_V7M_EXCRET_ES_MASK;
-    }
-
-    if (env->v7m.exception !=3D ARMV7M_EXCP_NMI) {
-        /*
-         * Auto-clear FAULTMASK on return from other than NMI.
-         * If the security extension is implemented then this only
-         * happens if the raw execution priority is >=3D 0; the
-         * value of the ES bit in the exception return value indicates
-         * which security state's faultmask to clear. (v8M ARM ARM R_KBN=
F.)
-         */
-        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            if (armv7m_nvic_raw_execution_priority(env->nvic) >=3D 0) {
-                env->v7m.faultmask[exc_secure] =3D 0;
-            }
-        } else {
-            env->v7m.faultmask[M_REG_NS] =3D 0;
-        }
-    }
-
-    switch (armv7m_nvic_complete_irq(env->nvic, env->v7m.exception,
-                                     exc_secure)) {
-    case -1:
-        /* attempt to exit an exception that isn't active */
-        ufault =3D true;
-        break;
-    case 0:
-        /* still an irq active now */
-        break;
-    case 1:
-        /*
-         * We returned to base exception level, no nesting.
-         * (In the pseudocode this is written using "NestedActivation !=3D=
 1"
-         * where we have 'rettobase =3D=3D false'.)
-         */
-        rettobase =3D true;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    return_to_handler =3D !(excret & R_V7M_EXCRET_MODE_MASK);
-    return_to_sp_process =3D excret & R_V7M_EXCRET_SPSEL_MASK;
-    return_to_secure =3D arm_feature(env, ARM_FEATURE_M_SECURITY) &&
-        (excret & R_V7M_EXCRET_S_MASK);
-
-    if (arm_feature(env, ARM_FEATURE_V8)) {
-        if (!arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-            /*
-             * UNPREDICTABLE if S =3D=3D 1 or DCRS =3D=3D 0 or ES =3D=3D=
 1 (R_XLCP);
-             * we choose to take the UsageFault.
-             */
-            if ((excret & R_V7M_EXCRET_S_MASK) ||
-                (excret & R_V7M_EXCRET_ES_MASK) ||
-                !(excret & R_V7M_EXCRET_DCRS_MASK)) {
-                ufault =3D true;
-            }
-        }
-        if (excret & R_V7M_EXCRET_RES0_MASK) {
-            ufault =3D true;
-        }
-    } else {
-        /* For v7M we only recognize certain combinations of the low bit=
s */
-        switch (excret & 0xf) {
-        case 1: /* Return to Handler */
-            break;
-        case 13: /* Return to Thread using Process stack */
-        case 9: /* Return to Thread using Main stack */
-            /*
-             * We only need to check NONBASETHRDENA for v7M, because in
-             * v8M this bit does not exist (it is RES1).
-             */
-            if (!rettobase &&
-                !(env->v7m.ccr[env->v7m.secure] &
-                  R_V7M_CCR_NONBASETHRDENA_MASK)) {
-                ufault =3D true;
-            }
-            break;
-        default:
-            ufault =3D true;
-        }
-    }
-
-    /*
-     * Set CONTROL.SPSEL from excret.SPSEL. Since we're still in
-     * Handler mode (and will be until we write the new XPSR.Interrupt
-     * field) this does not switch around the current stack pointer.
-     * We must do this before we do any kind of tailchaining, including
-     * for the derived exceptions on integrity check failures, or we wil=
l
-     * give the guest an incorrect EXCRET.SPSEL value on exception entry=
.
-     */
-    write_v7m_control_spsel_for_secstate(env, return_to_sp_process, exc_=
secure);
-
-    /*
-     * Clear scratch FP values left in caller saved registers; this
-     * must happen before any kind of tail chaining.
-     */
-    if ((env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_CLRONRET_MASK) &&
-        (env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK)) {
-        if (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPACT_MASK) {
-            env->v7m.sfsr |=3D R_V7M_SFSR_LSERR_MASK;
-            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false=
);
-            qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existin=
g "
-                          "stackframe: error during lazy state deactivat=
ion\n");
-            v7m_exception_taken(cpu, excret, true, false);
-            return;
-        } else {
-            /* Clear s0..s15 and FPSCR */
-            int i;
-
-            for (i =3D 0; i < 16; i +=3D 2) {
-                *aa32_vfp_dreg(env, i / 2) =3D 0;
-            }
-            vfp_set_fpscr(env, 0);
-        }
-    }
-
-    if (sfault) {
-        env->v7m.sfsr |=3D R_V7M_SFSR_INVER_MASK;
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-        qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
-                      "stackframe: failed EXC_RETURN.ES validity check\n=
");
-        v7m_exception_taken(cpu, excret, true, false);
-        return;
-    }
-
-    if (ufault) {
-        /*
-         * Bad exception return: instead of popping the exception
-         * stack, directly take a usage fault on the current stack.
-         */
-        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MASK;
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
-        qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
-                      "stackframe: failed exception return integrity che=
ck\n");
-        v7m_exception_taken(cpu, excret, true, false);
-        return;
-    }
-
-    /*
-     * Tailchaining: if there is currently a pending exception that
-     * is high enough priority to preempt execution at the level we're
-     * about to return to, then just directly take that exception now,
-     * avoiding an unstack-and-then-stack. Note that now we have
-     * deactivated the previous exception by calling armv7m_nvic_complet=
e_irq()
-     * our current execution priority is already the execution priority =
we are
-     * returning to -- none of the state we would unstack or set based o=
n
-     * the EXCRET value affects it.
-     */
-    if (armv7m_nvic_can_take_pending_exception(env->nvic)) {
-        qemu_log_mask(CPU_LOG_INT, "...tailchaining to pending exception=
\n");
-        v7m_exception_taken(cpu, excret, true, false);
-        return;
-    }
-
-    switch_v7m_security_state(env, return_to_secure);
-
-    {
-        /*
-         * The stack pointer we should be reading the exception frame fr=
om
-         * depends on bits in the magic exception return type value (and
-         * for v8M isn't necessarily the stack pointer we will eventuall=
y
-         * end up resuming execution with). Get a pointer to the locatio=
n
-         * in the CPU state struct where the SP we need is currently bei=
ng
-         * stored; we will use and modify it in place.
-         * We use this limited C variable scope so we don't accidentally
-         * use 'frame_sp_p' after we do something that makes it invalid.
-         */
-        uint32_t *frame_sp_p =3D get_v7m_sp_ptr(env,
-                                              return_to_secure,
-                                              !return_to_handler,
-                                              return_to_sp_process);
-        uint32_t frameptr =3D *frame_sp_p;
-        bool pop_ok =3D true;
-        ARMMMUIdx mmu_idx;
-        bool return_to_priv =3D return_to_handler ||
-            !(env->v7m.control[return_to_secure] & R_V7M_CONTROL_NPRIV_M=
ASK);
-
-        mmu_idx =3D arm_v7m_mmu_idx_for_secstate_and_priv(env, return_to=
_secure,
-                                                        return_to_priv);
-
-        if (!QEMU_IS_ALIGNED(frameptr, 8) &&
-            arm_feature(env, ARM_FEATURE_V8)) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "M profile exception return with non-8-aligned=
 SP "
-                          "for destination state is UNPREDICTABLE\n");
-        }
-
-        /* Do we need to pop callee-saved registers? */
-        if (return_to_secure &&
-            ((excret & R_V7M_EXCRET_ES_MASK) =3D=3D 0 ||
-             (excret & R_V7M_EXCRET_DCRS_MASK) =3D=3D 0)) {
-            uint32_t actual_sig;
-
-            pop_ok =3D v7m_stack_read(cpu, &actual_sig, frameptr, mmu_id=
x);
-
-            if (pop_ok && v7m_integrity_sig(env, excret) !=3D actual_sig=
) {
-                /* Take a SecureFault on the current stack */
-                env->v7m.sfsr |=3D R_V7M_SFSR_INVIS_MASK;
-                armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, f=
alse);
-                qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on exi=
sting "
-                              "stackframe: failed exception return integ=
rity "
-                              "signature check\n");
-                v7m_exception_taken(cpu, excret, true, false);
-                return;
-            }
-
-            pop_ok =3D pop_ok &&
-                v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_i=
dx) &&
-                v7m_stack_read(cpu, &env->regs[5], frameptr + 0xc, mmu_i=
dx) &&
-                v7m_stack_read(cpu, &env->regs[6], frameptr + 0x10, mmu_=
idx) &&
-                v7m_stack_read(cpu, &env->regs[7], frameptr + 0x14, mmu_=
idx) &&
-                v7m_stack_read(cpu, &env->regs[8], frameptr + 0x18, mmu_=
idx) &&
-                v7m_stack_read(cpu, &env->regs[9], frameptr + 0x1c, mmu_=
idx) &&
-                v7m_stack_read(cpu, &env->regs[10], frameptr + 0x20, mmu=
_idx) &&
-                v7m_stack_read(cpu, &env->regs[11], frameptr + 0x24, mmu=
_idx);
-
-            frameptr +=3D 0x28;
-        }
-
-        /* Pop registers */
-        pop_ok =3D pop_ok &&
-            v7m_stack_read(cpu, &env->regs[0], frameptr, mmu_idx) &&
-            v7m_stack_read(cpu, &env->regs[1], frameptr + 0x4, mmu_idx) =
&&
-            v7m_stack_read(cpu, &env->regs[2], frameptr + 0x8, mmu_idx) =
&&
-            v7m_stack_read(cpu, &env->regs[3], frameptr + 0xc, mmu_idx) =
&&
-            v7m_stack_read(cpu, &env->regs[12], frameptr + 0x10, mmu_idx=
) &&
-            v7m_stack_read(cpu, &env->regs[14], frameptr + 0x14, mmu_idx=
) &&
-            v7m_stack_read(cpu, &env->regs[15], frameptr + 0x18, mmu_idx=
) &&
-            v7m_stack_read(cpu, &xpsr, frameptr + 0x1c, mmu_idx);
-
-        if (!pop_ok) {
-            /*
-             * v7m_stack_read() pended a fault, so take it (as a tail
-             * chained exception on the same stack frame)
-             */
-            qemu_log_mask(CPU_LOG_INT, "...derived exception on unstacki=
ng\n");
-            v7m_exception_taken(cpu, excret, true, false);
-            return;
-        }
-
-        /*
-         * Returning from an exception with a PC with bit 0 set is defin=
ed
-         * behaviour on v8M (bit 0 is ignored), but for v7M it was speci=
fied
-         * to be UNPREDICTABLE. In practice actual v7M hardware seems to=
 ignore
-         * the lsbit, and there are several RTOSes out there which incor=
rectly
-         * assume the r15 in the stack frame should be a Thumb-style "ls=
bit
-         * indicates ARM/Thumb" value, so ignore the bit on v7M as well,=
 but
-         * complain about the badly behaved guest.
-         */
-        if (env->regs[15] & 1) {
-            env->regs[15] &=3D ~1U;
-            if (!arm_feature(env, ARM_FEATURE_V8)) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "M profile return from interrupt with misa=
ligned "
-                              "PC is UNPREDICTABLE on v7M\n");
-            }
-        }
-
-        if (arm_feature(env, ARM_FEATURE_V8)) {
-            /*
-             * For v8M we have to check whether the xPSR exception field
-             * matches the EXCRET value for return to handler/thread
-             * before we commit to changing the SP and xPSR.
-             */
-            bool will_be_handler =3D (xpsr & XPSR_EXCP) !=3D 0;
-            if (return_to_handler !=3D will_be_handler) {
-                /*
-                 * Take an INVPC UsageFault on the current stack.
-                 * By this point we will have switched to the security s=
tate
-                 * for the background state, so this UsageFault will tar=
get
-                 * that state.
-                 */
-                armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
-                                        env->v7m.secure);
-                env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MAS=
K;
-                qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on exis=
ting "
-                              "stackframe: failed exception return integ=
rity "
-                              "check\n");
-                v7m_exception_taken(cpu, excret, true, false);
-                return;
-            }
-        }
-
-        if (!ftype) {
-            /* FP present and we need to handle it */
-            if (!return_to_secure &&
-                (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPACT_MASK)) {
-                armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, f=
alse);
-                env->v7m.sfsr |=3D R_V7M_SFSR_LSERR_MASK;
-                qemu_log_mask(CPU_LOG_INT,
-                              "...taking SecureFault on existing stackfr=
ame: "
-                              "Secure LSPACT set but exception return is=
 "
-                              "not to secure state\n");
-                v7m_exception_taken(cpu, excret, true, false);
-                return;
-            }
-
-            restore_s16_s31 =3D return_to_secure &&
-                (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK);
-
-            if (env->v7m.fpccr[return_to_secure] & R_V7M_FPCCR_LSPACT_MA=
SK) {
-                /* State in FPU is still valid, just clear LSPACT */
-                env->v7m.fpccr[return_to_secure] &=3D ~R_V7M_FPCCR_LSPAC=
T_MASK;
-            } else {
-                int i;
-                uint32_t fpscr;
-                bool cpacr_pass, nsacr_pass;
-
-                cpacr_pass =3D v7m_cpacr_pass(env, return_to_secure,
-                                            return_to_priv);
-                nsacr_pass =3D return_to_secure ||
-                    extract32(env->v7m.nsacr, 10, 1);
-
-                if (!cpacr_pass) {
-                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE=
,
-                                            return_to_secure);
-                    env->v7m.cfsr[return_to_secure] |=3D R_V7M_CFSR_NOCP=
_MASK;
-                    qemu_log_mask(CPU_LOG_INT,
-                                  "...taking UsageFault on existing "
-                                  "stackframe: CPACR.CP10 prevents unsta=
cking "
-                                  "FP regs\n");
-                    v7m_exception_taken(cpu, excret, true, false);
-                    return;
-                } else if (!nsacr_pass) {
-                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE=
, true);
-                    env->v7m.cfsr[M_REG_S] |=3D R_V7M_CFSR_INVPC_MASK;
-                    qemu_log_mask(CPU_LOG_INT,
-                                  "...taking Secure UsageFault on existi=
ng "
-                                  "stackframe: NSACR.CP10 prevents unsta=
cking "
-                                  "FP regs\n");
-                    v7m_exception_taken(cpu, excret, true, false);
-                    return;
-                }
-
-                for (i =3D 0; i < (restore_s16_s31 ? 32 : 16); i +=3D 2)=
 {
-                    uint32_t slo, shi;
-                    uint64_t dn;
-                    uint32_t faddr =3D frameptr + 0x20 + 4 * i;
-
-                    if (i >=3D 16) {
-                        faddr +=3D 8; /* Skip the slot for the FPSCR */
-                    }
-
-                    pop_ok =3D pop_ok &&
-                        v7m_stack_read(cpu, &slo, faddr, mmu_idx) &&
-                        v7m_stack_read(cpu, &shi, faddr + 4, mmu_idx);
-
-                    if (!pop_ok) {
-                        break;
-                    }
-
-                    dn =3D (uint64_t)shi << 32 | slo;
-                    *aa32_vfp_dreg(env, i / 2) =3D dn;
-                }
-                pop_ok =3D pop_ok &&
-                    v7m_stack_read(cpu, &fpscr, frameptr + 0x60, mmu_idx=
);
-                if (pop_ok) {
-                    vfp_set_fpscr(env, fpscr);
-                }
-                if (!pop_ok) {
-                    /*
-                     * These regs are 0 if security extension present;
-                     * otherwise merely UNKNOWN. We zero always.
-                     */
-                    for (i =3D 0; i < (restore_s16_s31 ? 32 : 16); i +=3D=
 2) {
-                        *aa32_vfp_dreg(env, i / 2) =3D 0;
-                    }
-                    vfp_set_fpscr(env, 0);
-                }
-            }
-        }
-        env->v7m.control[M_REG_S] =3D FIELD_DP32(env->v7m.control[M_REG_=
S],
-                                               V7M_CONTROL, FPCA, !ftype=
);
-
-        /* Commit to consuming the stack frame */
-        frameptr +=3D 0x20;
-        if (!ftype) {
-            frameptr +=3D 0x48;
-            if (restore_s16_s31) {
-                frameptr +=3D 0x40;
-            }
-        }
-        /*
-         * Undo stack alignment (the SPREALIGN bit indicates that the or=
iginal
-         * pre-exception SP was not 8-aligned and we added a padding wor=
d to
-         * align it, so we undo this by ORing in the bit that increases =
it
-         * from the current 8-aligned value to the 8-unaligned value. (A=
dding 4
-         * would work too but a logical OR is how the pseudocode specifi=
es it.)
-         */
-        if (xpsr & XPSR_SPREALIGN) {
-            frameptr |=3D 4;
-        }
-        *frame_sp_p =3D frameptr;
-    }
-
-    xpsr_mask =3D ~(XPSR_SPREALIGN | XPSR_SFPA);
-    if (!arm_feature(env, ARM_FEATURE_THUMB_DSP)) {
-        xpsr_mask &=3D ~XPSR_GE;
-    }
-    /* This xpsr_write() will invalidate frame_sp_p as it may switch sta=
ck */
-    xpsr_write(env, xpsr, xpsr_mask);
-
-    if (env->v7m.secure) {
-        bool sfpa =3D xpsr & XPSR_SFPA;
-
-        env->v7m.control[M_REG_S] =3D FIELD_DP32(env->v7m.control[M_REG_=
S],
-                                               V7M_CONTROL, SFPA, sfpa);
-    }
-
-    /*
-     * The restored xPSR exception field will be zero if we're
-     * resuming in Thread mode. If that doesn't match what the
-     * exception return excret specified then this is a UsageFault.
-     * v7M requires we make this check here; v8M did it earlier.
-     */
-    if (return_to_handler !=3D arm_v7m_is_handler_mode(env)) {
-        /*
-         * Take an INVPC UsageFault by pushing the stack again;
-         * we know we're v7M so this is never a Secure UsageFault.
-         */
-        bool ignore_stackfaults;
-
-        assert(!arm_feature(env, ARM_FEATURE_V8));
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, false);
-        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MASK;
-        ignore_stackfaults =3D v7m_push_stack(cpu);
-        qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackfra=
me: "
-                      "failed exception return integrity check\n");
-        v7m_exception_taken(cpu, excret, false, ignore_stackfaults);
-        return;
-    }
-
-    /* Otherwise, we have a successful exception exit. */
-    arm_clear_exclusive(env);
-    qemu_log_mask(CPU_LOG_INT, "...successful exception return\n");
-}
-
-static bool do_v7m_function_return(ARMCPU *cpu)
-{
-    /*
-     * v8M security extensions magic function return.
-     * We may either:
-     *  (1) throw an exception (longjump)
-     *  (2) return true if we successfully handled the function return
-     *  (3) return false if we failed a consistency check and have
-     *      pended a UsageFault that needs to be taken now
-     *
-     * At this point the magic return value is split between env->regs[1=
5]
-     * and env->thumb. We don't bother to reconstitute it because we don=
't
-     * need it (all values are handled the same way).
-     */
-    CPUARMState *env =3D &cpu->env;
-    uint32_t newpc, newpsr, newpsr_exc;
-
-    qemu_log_mask(CPU_LOG_INT, "...really v7M secure function return\n")=
;
-
-    {
-        bool threadmode, spsel;
-        TCGMemOpIdx oi;
-        ARMMMUIdx mmu_idx;
-        uint32_t *frame_sp_p;
-        uint32_t frameptr;
-
-        /* Pull the return address and IPSR from the Secure stack */
-        threadmode =3D !arm_v7m_is_handler_mode(env);
-        spsel =3D env->v7m.control[M_REG_S] & R_V7M_CONTROL_SPSEL_MASK;
-
-        frame_sp_p =3D get_v7m_sp_ptr(env, true, threadmode, spsel);
-        frameptr =3D *frame_sp_p;
-
-        /*
-         * These loads may throw an exception (for MPU faults). We want =
to
-         * do them as secure, so work out what MMU index that is.
-         */
-        mmu_idx =3D arm_v7m_mmu_idx_for_secstate(env, true);
-        oi =3D make_memop_idx(MO_LE, arm_to_core_mmu_idx(mmu_idx));
-        newpc =3D helper_le_ldul_mmu(env, frameptr, oi, 0);
-        newpsr =3D helper_le_ldul_mmu(env, frameptr + 4, oi, 0);
-
-        /* Consistency checks on new IPSR */
-        newpsr_exc =3D newpsr & XPSR_EXCP;
-        if (!((env->v7m.exception =3D=3D 0 && newpsr_exc =3D=3D 0) ||
-              (env->v7m.exception =3D=3D 1 && newpsr_exc !=3D 0))) {
-            /* Pend the fault and tell our caller to take it */
-            env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MASK;
-            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
-                                    env->v7m.secure);
-            qemu_log_mask(CPU_LOG_INT,
-                          "...taking INVPC UsageFault: "
-                          "IPSR consistency check failed\n");
-            return false;
-        }
-
-        *frame_sp_p =3D frameptr + 8;
-    }
-
-    /* This invalidates frame_sp_p */
-    switch_v7m_security_state(env, true);
-    env->v7m.exception =3D newpsr_exc;
-    env->v7m.control[M_REG_S] &=3D ~R_V7M_CONTROL_SFPA_MASK;
-    if (newpsr & XPSR_SFPA) {
-        env->v7m.control[M_REG_S] |=3D R_V7M_CONTROL_SFPA_MASK;
-    }
-    xpsr_write(env, 0, XPSR_IT);
-    env->thumb =3D newpc & 1;
-    env->regs[15] =3D newpc & ~1;
-
-    qemu_log_mask(CPU_LOG_INT, "...function return successful\n");
-    return true;
-}
-
 void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
 {
     /*
@@ -9193,358 +7669,6 @@ void arm_log_exception(int idx)
     }
 }
=20
-static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
-                               uint32_t addr, uint16_t *insn)
-{
-    /*
-     * Load a 16-bit portion of a v7M instruction, returning true on suc=
cess,
-     * or false on failure (in which case we will have pended the approp=
riate
-     * exception).
-     * We need to do the instruction fetch's MPU and SAU checks
-     * like this because there is no MMU index that would allow
-     * doing the load with a single function call. Instead we must
-     * first check that the security attributes permit the load
-     * and that they don't mismatch on the two halves of the instruction=
,
-     * and then we do the load as a secure load (ie using the security
-     * attributes of the address, not the CPU, as architecturally requir=
ed).
-     */
-    CPUState *cs =3D CPU(cpu);
-    CPUARMState *env =3D &cpu->env;
-    V8M_SAttributes sattrs =3D {};
-    MemTxAttrs attrs =3D {};
-    ARMMMUFaultInfo fi =3D {};
-    MemTxResult txres;
-    target_ulong page_size;
-    hwaddr physaddr;
-    int prot;
-
-    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx, &sattrs);
-    if (!sattrs.nsc || sattrs.ns) {
-        /*
-         * This must be the second half of the insn, and it straddles a
-         * region boundary with the second half not being S&NSC.
-         */
-        env->v7m.sfsr |=3D R_V7M_SFSR_INVEP_MASK;
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-        qemu_log_mask(CPU_LOG_INT,
-                      "...really SecureFault with SFSR.INVEP\n");
-        return false;
-    }
-    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx,
-                      &physaddr, &attrs, &prot, &page_size, &fi, NULL)) =
{
-        /* the MPU lookup failed */
-        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_IACCVIOL_MASK;
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.sec=
ure);
-        qemu_log_mask(CPU_LOG_INT, "...really MemManage with CFSR.IACCVI=
OL\n");
-        return false;
-    }
-    *insn =3D address_space_lduw_le(arm_addressspace(cs, attrs), physadd=
r,
-                                 attrs, &txres);
-    if (txres !=3D MEMTX_OK) {
-        env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_IBUSERR_MASK;
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
-        qemu_log_mask(CPU_LOG_INT, "...really BusFault with CFSR.IBUSERR=
\n");
-        return false;
-    }
-    return true;
-}
-
-static bool v7m_handle_execute_nsc(ARMCPU *cpu)
-{
-    /*
-     * Check whether this attempt to execute code in a Secure & NS-Calla=
ble
-     * memory region is for an SG instruction; if so, then emulate the
-     * effect of the SG instruction and return true. Otherwise pend
-     * the correct kind of exception and return false.
-     */
-    CPUARMState *env =3D &cpu->env;
-    ARMMMUIdx mmu_idx;
-    uint16_t insn;
-
-    /*
-     * We should never get here unless get_phys_addr_pmsav8() caused
-     * an exception for NS executing in S&NSC memory.
-     */
-    assert(!env->v7m.secure);
-    assert(arm_feature(env, ARM_FEATURE_M_SECURITY));
-
-    /* We want to do the MPU lookup as secure; work out what mmu_idx tha=
t is */
-    mmu_idx =3D arm_v7m_mmu_idx_for_secstate(env, true);
-
-    if (!v7m_read_half_insn(cpu, mmu_idx, env->regs[15], &insn)) {
-        return false;
-    }
-
-    if (!env->thumb) {
-        goto gen_invep;
-    }
-
-    if (insn !=3D 0xe97f) {
-        /*
-         * Not an SG instruction first half (we choose the IMPDEF
-         * early-SG-check option).
-         */
-        goto gen_invep;
-    }
-
-    if (!v7m_read_half_insn(cpu, mmu_idx, env->regs[15] + 2, &insn)) {
-        return false;
-    }
-
-    if (insn !=3D 0xe97f) {
-        /*
-         * Not an SG instruction second half (yes, both halves of the SG
-         * insn have the same hex value)
-         */
-        goto gen_invep;
-    }
-
-    /*
-     * OK, we have confirmed that we really have an SG instruction.
-     * We know we're NS in S memory so don't need to repeat those checks=
.
-     */
-    qemu_log_mask(CPU_LOG_INT, "...really an SG instruction at 0x%08" PR=
Ix32
-                  ", executing it\n", env->regs[15]);
-    env->regs[14] &=3D ~1;
-    env->v7m.control[M_REG_S] &=3D ~R_V7M_CONTROL_SFPA_MASK;
-    switch_v7m_security_state(env, true);
-    xpsr_write(env, 0, XPSR_IT);
-    env->regs[15] +=3D 4;
-    return true;
-
-gen_invep:
-    env->v7m.sfsr |=3D R_V7M_SFSR_INVEP_MASK;
-    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-    qemu_log_mask(CPU_LOG_INT,
-                  "...really SecureFault with SFSR.INVEP\n");
-    return false;
-}
-
-void arm_v7m_cpu_do_interrupt(CPUState *cs)
-{
-    ARMCPU *cpu =3D ARM_CPU(cs);
-    CPUARMState *env =3D &cpu->env;
-    uint32_t lr;
-    bool ignore_stackfaults;
-
-    arm_log_exception(cs->exception_index);
-
-    /*
-     * For exceptions we just mark as pending on the NVIC, and let that
-     * handle it.
-     */
-    switch (cs->exception_index) {
-    case EXCP_UDEF:
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
-        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_UNDEFINSTR_MASK;
-        break;
-    case EXCP_NOCP:
-    {
-        /*
-         * NOCP might be directed to something other than the current
-         * security state if this fault is because of NSACR; we indicate
-         * the target security state using exception.target_el.
-         */
-        int target_secstate;
-
-        if (env->exception.target_el =3D=3D 3) {
-            target_secstate =3D M_REG_S;
-        } else {
-            target_secstate =3D env->v7m.secure;
-        }
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, target_sec=
state);
-        env->v7m.cfsr[target_secstate] |=3D R_V7M_CFSR_NOCP_MASK;
-        break;
-    }
-    case EXCP_INVSTATE:
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
-        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVSTATE_MASK;
-        break;
-    case EXCP_STKOF:
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
-        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_STKOF_MASK;
-        break;
-    case EXCP_LSERR:
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-        env->v7m.sfsr |=3D R_V7M_SFSR_LSERR_MASK;
-        break;
-    case EXCP_UNALIGNED:
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
-        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_UNALIGNED_MASK;
-        break;
-    case EXCP_SWI:
-        /* The PC already points to the next instruction.  */
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC, env->v7m.sec=
ure);
-        break;
-    case EXCP_PREFETCH_ABORT:
-    case EXCP_DATA_ABORT:
-        /*
-         * Note that for M profile we don't have a guest facing FSR, but
-         * the env->exception.fsr will be populated by the code that
-         * raises the fault, in the A profile short-descriptor format.
-         */
-        switch (env->exception.fsr & 0xf) {
-        case M_FAKE_FSR_NSC_EXEC:
-            /*
-             * Exception generated when we try to execute code at an add=
ress
-             * which is marked as Secure & Non-Secure Callable and the C=
PU
-             * is in the Non-Secure state. The only instruction which ca=
n
-             * be executed like this is SG (and that only if both halves=
 of
-             * the SG instruction have the same security attributes.)
-             * Everything else must generate an INVEP SecureFault, so we
-             * emulate the SG instruction here.
-             */
-            if (v7m_handle_execute_nsc(cpu)) {
-                return;
-            }
-            break;
-        case M_FAKE_FSR_SFAULT:
-            /*
-             * Various flavours of SecureFault for attempts to execute o=
r
-             * access data in the wrong security state.
-             */
-            switch (cs->exception_index) {
-            case EXCP_PREFETCH_ABORT:
-                if (env->v7m.secure) {
-                    env->v7m.sfsr |=3D R_V7M_SFSR_INVTRAN_MASK;
-                    qemu_log_mask(CPU_LOG_INT,
-                                  "...really SecureFault with SFSR.INVTR=
AN\n");
-                } else {
-                    env->v7m.sfsr |=3D R_V7M_SFSR_INVEP_MASK;
-                    qemu_log_mask(CPU_LOG_INT,
-                                  "...really SecureFault with SFSR.INVEP=
\n");
-                }
-                break;
-            case EXCP_DATA_ABORT:
-                /* This must be an NS access to S memory */
-                env->v7m.sfsr |=3D R_V7M_SFSR_AUVIOL_MASK;
-                qemu_log_mask(CPU_LOG_INT,
-                              "...really SecureFault with SFSR.AUVIOL\n"=
);
-                break;
-            }
-            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false=
);
-            break;
-        case 0x8: /* External Abort */
-            switch (cs->exception_index) {
-            case EXCP_PREFETCH_ABORT:
-                env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_IBUSERR_MASK;
-                qemu_log_mask(CPU_LOG_INT, "...with CFSR.IBUSERR\n");
-                break;
-            case EXCP_DATA_ABORT:
-                env->v7m.cfsr[M_REG_NS] |=3D
-                    (R_V7M_CFSR_PRECISERR_MASK | R_V7M_CFSR_BFARVALID_MA=
SK);
-                env->v7m.bfar =3D env->exception.vaddress;
-                qemu_log_mask(CPU_LOG_INT,
-                              "...with CFSR.PRECISERR and BFAR 0x%x\n",
-                              env->v7m.bfar);
-                break;
-            }
-            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
-            break;
-        default:
-            /*
-             * All other FSR values are either MPU faults or "can't happ=
en
-             * for M profile" cases.
-             */
-            switch (cs->exception_index) {
-            case EXCP_PREFETCH_ABORT:
-                env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_IACCVIOL_=
MASK;
-                qemu_log_mask(CPU_LOG_INT, "...with CFSR.IACCVIOL\n");
-                break;
-            case EXCP_DATA_ABORT:
-                env->v7m.cfsr[env->v7m.secure] |=3D
-                    (R_V7M_CFSR_DACCVIOL_MASK | R_V7M_CFSR_MMARVALID_MAS=
K);
-                env->v7m.mmfar[env->v7m.secure] =3D env->exception.vaddr=
ess;
-                qemu_log_mask(CPU_LOG_INT,
-                              "...with CFSR.DACCVIOL and MMFAR 0x%x\n",
-                              env->v7m.mmfar[env->v7m.secure]);
-                break;
-            }
-            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM,
-                                    env->v7m.secure);
-            break;
-        }
-        break;
-    case EXCP_BKPT:
-        if (semihosting_enabled()) {
-            int nr;
-            nr =3D arm_lduw_code(env, env->regs[15], arm_sctlr_b(env)) &=
 0xff;
-            if (nr =3D=3D 0xab) {
-                env->regs[15] +=3D 2;
-                qemu_log_mask(CPU_LOG_INT,
-                              "...handling as semihosting call 0x%x\n",
-                              env->regs[0]);
-                env->regs[0] =3D do_arm_semihosting(env);
-                return;
-            }
-        }
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG, false);
-        break;
-    case EXCP_IRQ:
-        break;
-    case EXCP_EXCEPTION_EXIT:
-        if (env->regs[15] < EXC_RETURN_MIN_MAGIC) {
-            /* Must be v8M security extension function return */
-            assert(env->regs[15] >=3D FNC_RETURN_MIN_MAGIC);
-            assert(arm_feature(env, ARM_FEATURE_M_SECURITY));
-            if (do_v7m_function_return(cpu)) {
-                return;
-            }
-        } else {
-            do_v7m_exception_exit(cpu);
-            return;
-        }
-        break;
-    case EXCP_LAZYFP:
-        /*
-         * We already pended the specific exception in the NVIC in the
-         * v7m_preserve_fp_state() helper function.
-         */
-        break;
-    default:
-        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index)=
;
-        return; /* Never happens.  Keep compiler happy.  */
-    }
-
-    if (arm_feature(env, ARM_FEATURE_V8)) {
-        lr =3D R_V7M_EXCRET_RES1_MASK |
-            R_V7M_EXCRET_DCRS_MASK;
-        /*
-         * The S bit indicates whether we should return to Secure
-         * or NonSecure (ie our current state).
-         * The ES bit indicates whether we're taking this exception
-         * to Secure or NonSecure (ie our target state). We set it
-         * later, in v7m_exception_taken().
-         * The SPSEL bit is also set in v7m_exception_taken() for v8M.
-         * This corresponds to the ARM ARM pseudocode for v8M setting
-         * some LR bits in PushStack() and some in ExceptionTaken();
-         * the distinction matters for the tailchain cases where we
-         * can take an exception without pushing the stack.
-         */
-        if (env->v7m.secure) {
-            lr |=3D R_V7M_EXCRET_S_MASK;
-        }
-        if (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK)) {
-            lr |=3D R_V7M_EXCRET_FTYPE_MASK;
-        }
-    } else {
-        lr =3D R_V7M_EXCRET_RES1_MASK |
-            R_V7M_EXCRET_S_MASK |
-            R_V7M_EXCRET_DCRS_MASK |
-            R_V7M_EXCRET_FTYPE_MASK |
-            R_V7M_EXCRET_ES_MASK;
-        if (env->v7m.control[M_REG_NS] & R_V7M_CONTROL_SPSEL_MASK) {
-            lr |=3D R_V7M_EXCRET_SPSEL_MASK;
-        }
-    }
-    if (!arm_v7m_is_handler_mode(env)) {
-        lr |=3D R_V7M_EXCRET_MODE_MASK;
-    }
-
-    ignore_stackfaults =3D v7m_push_stack(cpu);
-    v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
-}
-
 /* Function used to synchronize QEMU's AArch64 register set with AArch32
  * register set.  This is necessary when switching between AArch32 and A=
Arch64
  * execution state.
diff --git a/target/arm/v7m_helper.c b/target/arm/v7m_helper.c
index 558e143039..b50bb98e06 100644
--- a/target/arm/v7m_helper.c
+++ b/target/arm/v7m_helper.c
@@ -724,4 +724,1880 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t=
 addr, uint32_t op)
     return tt_resp;
 }
=20
+/*
+ * What kind of stack write are we doing? This affects how exceptions
+ * generated during the stacking are treated.
+ */
+typedef enum StackingMode {
+    STACK_NORMAL,
+    STACK_IGNFAULTS,
+    STACK_LAZYFP,
+} StackingMode;
+
+static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
+                            ARMMMUIdx mmu_idx, StackingMode mode)
+{
+    CPUState *cs =3D CPU(cpu);
+    CPUARMState *env =3D &cpu->env;
+    MemTxAttrs attrs =3D {};
+    MemTxResult txres;
+    target_ulong page_size;
+    hwaddr physaddr;
+    int prot;
+    ARMMMUFaultInfo fi =3D {};
+    bool secure =3D mmu_idx & ARM_MMU_IDX_M_S;
+    int exc;
+    bool exc_secure;
+
+    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
+                      &attrs, &prot, &page_size, &fi, NULL)) {
+        /* MPU/SAU lookup failed */
+        if (fi.type =3D=3D ARMFault_QEMU_SFault) {
+            if (mode =3D=3D STACK_LAZYFP) {
+                qemu_log_mask(CPU_LOG_INT,
+                              "...SecureFault with SFSR.LSPERR "
+                              "during lazy stacking\n");
+                env->v7m.sfsr |=3D R_V7M_SFSR_LSPERR_MASK;
+            } else {
+                qemu_log_mask(CPU_LOG_INT,
+                              "...SecureFault with SFSR.AUVIOL "
+                              "during stacking\n");
+                env->v7m.sfsr |=3D R_V7M_SFSR_AUVIOL_MASK;
+            }
+            env->v7m.sfsr |=3D R_V7M_SFSR_SFARVALID_MASK;
+            env->v7m.sfar =3D addr;
+            exc =3D ARMV7M_EXCP_SECURE;
+            exc_secure =3D false;
+        } else {
+            if (mode =3D=3D STACK_LAZYFP) {
+                qemu_log_mask(CPU_LOG_INT,
+                              "...MemManageFault with CFSR.MLSPERR\n");
+                env->v7m.cfsr[secure] |=3D R_V7M_CFSR_MLSPERR_MASK;
+            } else {
+                qemu_log_mask(CPU_LOG_INT,
+                              "...MemManageFault with CFSR.MSTKERR\n");
+                env->v7m.cfsr[secure] |=3D R_V7M_CFSR_MSTKERR_MASK;
+            }
+            exc =3D ARMV7M_EXCP_MEM;
+            exc_secure =3D secure;
+        }
+        goto pend_fault;
+    }
+    address_space_stl_le(arm_addressspace(cs, attrs), physaddr, value,
+                         attrs, &txres);
+    if (txres !=3D MEMTX_OK) {
+        /* BusFault trying to write the data */
+        if (mode =3D=3D STACK_LAZYFP) {
+            qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.LSPERR\n")=
;
+            env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_LSPERR_MASK;
+        } else {
+            qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.STKERR\n")=
;
+            env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_STKERR_MASK;
+        }
+        exc =3D ARMV7M_EXCP_BUS;
+        exc_secure =3D false;
+        goto pend_fault;
+    }
+    return true;
+
+pend_fault:
+    /*
+     * By pending the exception at this point we are making
+     * the IMPDEF choice "overridden exceptions pended" (see the
+     * MergeExcInfo() pseudocode). The other choice would be to not
+     * pend them now and then make a choice about which to throw away
+     * later if we have two derived exceptions.
+     * The only case when we must not pend the exception but instead
+     * throw it away is if we are doing the push of the callee registers
+     * and we've already generated a derived exception (this is indicate=
d
+     * by the caller passing STACK_IGNFAULTS). Even in this case we will
+     * still update the fault status registers.
+     */
+    switch (mode) {
+    case STACK_NORMAL:
+        armv7m_nvic_set_pending_derived(env->nvic, exc, exc_secure);
+        break;
+    case STACK_LAZYFP:
+        armv7m_nvic_set_pending_lazyfp(env->nvic, exc, exc_secure);
+        break;
+    case STACK_IGNFAULTS:
+        break;
+    }
+    return false;
+}
+
+static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
+                           ARMMMUIdx mmu_idx)
+{
+    CPUState *cs =3D CPU(cpu);
+    CPUARMState *env =3D &cpu->env;
+    MemTxAttrs attrs =3D {};
+    MemTxResult txres;
+    target_ulong page_size;
+    hwaddr physaddr;
+    int prot;
+    ARMMMUFaultInfo fi =3D {};
+    bool secure =3D mmu_idx & ARM_MMU_IDX_M_S;
+    int exc;
+    bool exc_secure;
+    uint32_t value;
+
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
+                      &attrs, &prot, &page_size, &fi, NULL)) {
+        /* MPU/SAU lookup failed */
+        if (fi.type =3D=3D ARMFault_QEMU_SFault) {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...SecureFault with SFSR.AUVIOL during unstac=
k\n");
+            env->v7m.sfsr |=3D R_V7M_SFSR_AUVIOL_MASK | R_V7M_SFSR_SFARV=
ALID_MASK;
+            env->v7m.sfar =3D addr;
+            exc =3D ARMV7M_EXCP_SECURE;
+            exc_secure =3D false;
+        } else {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...MemManageFault with CFSR.MUNSTKERR\n");
+            env->v7m.cfsr[secure] |=3D R_V7M_CFSR_MUNSTKERR_MASK;
+            exc =3D ARMV7M_EXCP_MEM;
+            exc_secure =3D secure;
+        }
+        goto pend_fault;
+    }
+
+    value =3D address_space_ldl(arm_addressspace(cs, attrs), physaddr,
+                              attrs, &txres);
+    if (txres !=3D MEMTX_OK) {
+        /* BusFault trying to read the data */
+        qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.UNSTKERR\n");
+        env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_UNSTKERR_MASK;
+        exc =3D ARMV7M_EXCP_BUS;
+        exc_secure =3D false;
+        goto pend_fault;
+    }
+
+    *dest =3D value;
+    return true;
+
+pend_fault:
+    /*
+     * By pending the exception at this point we are making
+     * the IMPDEF choice "overridden exceptions pended" (see the
+     * MergeExcInfo() pseudocode). The other choice would be to not
+     * pend them now and then make a choice about which to throw away
+     * later if we have two derived exceptions.
+     */
+    armv7m_nvic_set_pending(env->nvic, exc, exc_secure);
+    return false;
+}
+
+void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
+{
+    /*
+     * Preserve FP state (because LSPACT was set and we are about
+     * to execute an FP instruction). This corresponds to the
+     * PreserveFPState() pseudocode.
+     * We may throw an exception if the stacking fails.
+     */
+    ARMCPU *cpu =3D env_archcpu(env);
+    bool is_secure =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+    bool negpri =3D !(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_HFRDY_MASK);
+    bool is_priv =3D !(env->v7m.fpccr[is_secure] & R_V7M_FPCCR_USER_MASK=
);
+    bool splimviol =3D env->v7m.fpccr[is_secure] & R_V7M_FPCCR_SPLIMVIOL=
_MASK;
+    uint32_t fpcar =3D env->v7m.fpcar[is_secure];
+    bool stacked_ok =3D true;
+    bool ts =3D is_secure && (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_M=
ASK);
+    bool take_exception;
+
+    /* Take the iothread lock as we are going to touch the NVIC */
+    qemu_mutex_lock_iothread();
+
+    /* Check the background context had access to the FPU */
+    if (!v7m_cpacr_pass(env, is_secure, is_priv)) {
+        armv7m_nvic_set_pending_lazyfp(env->nvic, ARMV7M_EXCP_USAGE, is_=
secure);
+        env->v7m.cfsr[is_secure] |=3D R_V7M_CFSR_NOCP_MASK;
+        stacked_ok =3D false;
+    } else if (!is_secure && !extract32(env->v7m.nsacr, 10, 1)) {
+        armv7m_nvic_set_pending_lazyfp(env->nvic, ARMV7M_EXCP_USAGE, M_R=
EG_S);
+        env->v7m.cfsr[M_REG_S] |=3D R_V7M_CFSR_NOCP_MASK;
+        stacked_ok =3D false;
+    }
+
+    if (!splimviol && stacked_ok) {
+        /* We only stack if the stack limit wasn't violated */
+        int i;
+        ARMMMUIdx mmu_idx;
+
+        mmu_idx =3D arm_v7m_mmu_idx_all(env, is_secure, is_priv, negpri)=
;
+        for (i =3D 0; i < (ts ? 32 : 16); i +=3D 2) {
+            uint64_t dn =3D *aa32_vfp_dreg(env, i / 2);
+            uint32_t faddr =3D fpcar + 4 * i;
+            uint32_t slo =3D extract64(dn, 0, 32);
+            uint32_t shi =3D extract64(dn, 32, 32);
+
+            if (i >=3D 16) {
+                faddr +=3D 8; /* skip the slot for the FPSCR */
+            }
+            stacked_ok =3D stacked_ok &&
+                v7m_stack_write(cpu, faddr, slo, mmu_idx, STACK_LAZYFP) =
&&
+                v7m_stack_write(cpu, faddr + 4, shi, mmu_idx, STACK_LAZY=
FP);
+        }
+
+        stacked_ok =3D stacked_ok &&
+            v7m_stack_write(cpu, fpcar + 0x40,
+                            vfp_get_fpscr(env), mmu_idx, STACK_LAZYFP);
+    }
+
+    /*
+     * We definitely pended an exception, but it's possible that it
+     * might not be able to be taken now. If its priority permits us
+     * to take it now, then we must not update the LSPACT or FP regs,
+     * but instead jump out to take the exception immediately.
+     * If it's just pending and won't be taken until the current
+     * handler exits, then we do update LSPACT and the FP regs.
+     */
+    take_exception =3D !stacked_ok &&
+        armv7m_nvic_can_take_pending_exception(env->nvic);
+
+    qemu_mutex_unlock_iothread();
+
+    if (take_exception) {
+        raise_exception_ra(env, EXCP_LAZYFP, 0, 1, GETPC());
+    }
+
+    env->v7m.fpccr[is_secure] &=3D ~R_V7M_FPCCR_LSPACT_MASK;
+
+    if (ts) {
+        /* Clear s0 to s31 and the FPSCR */
+        int i;
+
+        for (i =3D 0; i < 32; i +=3D 2) {
+            *aa32_vfp_dreg(env, i / 2) =3D 0;
+        }
+        vfp_set_fpscr(env, 0);
+    }
+    /*
+     * Otherwise s0 to s15 and FPSCR are UNKNOWN; we choose to leave the=
m
+     * unchanged.
+     */
+}
+
+static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool thre=
admode,
+                                bool spsel)
+{
+    /*
+     * Return a pointer to the location where we currently store the
+     * stack pointer for the requested security state and thread mode.
+     * This pointer will become invalid if the CPU state is updated
+     * such that the stack pointers are switched around (eg changing
+     * the SPSEL control bit).
+     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
+     * Unlike that pseudocode, we require the caller to pass us in the
+     * SPSEL control bit value; this is because we also use this
+     * function in handling of pushing of the callee-saves registers
+     * part of the v8M stack frame (pseudocode PushCalleeStack()),
+     * and in the tailchain codepath the SPSEL bit comes from the except=
ion
+     * return magic LR value from the previous exception. The pseudocode
+     * opencodes the stack-selection in PushCalleeStack(), but we prefer
+     * to make this utility function generic enough to do the job.
+     */
+    bool want_psp =3D threadmode && spsel;
+
+    if (secure =3D=3D env->v7m.secure) {
+        if (want_psp =3D=3D v7m_using_psp(env)) {
+            return &env->regs[13];
+        } else {
+            return &env->v7m.other_sp;
+        }
+    } else {
+        if (want_psp) {
+            return &env->v7m.other_ss_psp;
+        } else {
+            return &env->v7m.other_ss_msp;
+        }
+    }
+}
+
+static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secur=
e,
+                                uint32_t *pvec)
+{
+    CPUState *cs =3D CPU(cpu);
+    CPUARMState *env =3D &cpu->env;
+    MemTxResult result;
+    uint32_t addr =3D env->v7m.vecbase[targets_secure] + exc * 4;
+    uint32_t vector_entry;
+    MemTxAttrs attrs =3D {};
+    ARMMMUIdx mmu_idx;
+    bool exc_secure;
+
+    mmu_idx =3D arm_v7m_mmu_idx_for_secstate_and_priv(env, targets_secur=
e, true);
+
+    /*
+     * We don't do a get_phys_addr() here because the rules for vector
+     * loads are special: they always use the default memory map, and
+     * the default memory map permits reads from all addresses.
+     * Since there's no easy way to pass through to pmsav8_mpu_lookup()
+     * that we want this special case which would always say "yes",
+     * we just do the SAU lookup here followed by a direct physical load=
.
+     */
+    attrs.secure =3D targets_secure;
+    attrs.user =3D false;
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        V8M_SAttributes sattrs =3D {};
+
+        v8m_security_lookup(env, addr, MMU_DATA_LOAD, mmu_idx, &sattrs);
+        if (sattrs.ns) {
+            attrs.secure =3D false;
+        } else if (!targets_secure) {
+            /* NS access to S memory */
+            goto load_fail;
+        }
+    }
+
+    vector_entry =3D address_space_ldl(arm_addressspace(cs, attrs), addr=
,
+                                     attrs, &result);
+    if (result !=3D MEMTX_OK) {
+        goto load_fail;
+    }
+    *pvec =3D vector_entry;
+    return true;
+
+load_fail:
+    /*
+     * All vector table fetch fails are reported as HardFault, with
+     * HFSR.VECTTBL and .FORCED set. (FORCED is set because
+     * technically the underlying exception is a MemManage or BusFault
+     * that is escalated to HardFault.) This is a terminal exception,
+     * so we will either take the HardFault immediately or else enter
+     * lockup (the latter case is handled in armv7m_nvic_set_pending_der=
ived()).
+     */
+    exc_secure =3D targets_secure ||
+        !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
+    env->v7m.hfsr |=3D R_V7M_HFSR_VECTTBL_MASK | R_V7M_HFSR_FORCED_MASK;
+    armv7m_nvic_set_pending_derived(env->nvic, ARMV7M_EXCP_HARD, exc_sec=
ure);
+    return false;
+}
+
+static uint32_t v7m_integrity_sig(CPUARMState *env, uint32_t lr)
+{
+    /*
+     * Return the integrity signature value for the callee-saves
+     * stack frame section. @lr is the exception return payload/LR value
+     * whose FType bit forms bit 0 of the signature if FP is present.
+     */
+    uint32_t sig =3D 0xfefa125a;
+
+    if (!arm_feature(env, ARM_FEATURE_VFP) || (lr & R_V7M_EXCRET_FTYPE_M=
ASK)) {
+        sig |=3D 1;
+    }
+    return sig;
+}
+
+static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailc=
hain,
+                                  bool ignore_faults)
+{
+    /*
+     * For v8M, push the callee-saves register part of the stack frame.
+     * Compare the v8M pseudocode PushCalleeStack().
+     * In the tailchaining case this may not be the current stack.
+     */
+    CPUARMState *env =3D &cpu->env;
+    uint32_t *frame_sp_p;
+    uint32_t frameptr;
+    ARMMMUIdx mmu_idx;
+    bool stacked_ok;
+    uint32_t limit;
+    bool want_psp;
+    uint32_t sig;
+    StackingMode smode =3D ignore_faults ? STACK_IGNFAULTS : STACK_NORMA=
L;
+
+    if (dotailchain) {
+        bool mode =3D lr & R_V7M_EXCRET_MODE_MASK;
+        bool priv =3D !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_NPRIV_=
MASK) ||
+            !mode;
+
+        mmu_idx =3D arm_v7m_mmu_idx_for_secstate_and_priv(env, M_REG_S, =
priv);
+        frame_sp_p =3D get_v7m_sp_ptr(env, M_REG_S, mode,
+                                    lr & R_V7M_EXCRET_SPSEL_MASK);
+        want_psp =3D mode && (lr & R_V7M_EXCRET_SPSEL_MASK);
+        if (want_psp) {
+            limit =3D env->v7m.psplim[M_REG_S];
+        } else {
+            limit =3D env->v7m.msplim[M_REG_S];
+        }
+    } else {
+        mmu_idx =3D arm_mmu_idx(env);
+        frame_sp_p =3D &env->regs[13];
+        limit =3D v7m_sp_limit(env);
+    }
+
+    frameptr =3D *frame_sp_p - 0x28;
+    if (frameptr < limit) {
+        /*
+         * Stack limit failure: set SP to the limit value, and generate
+         * STKOF UsageFault. Stack pushes below the limit must not be
+         * performed. It is IMPDEF whether pushes above the limit are
+         * performed; we choose not to.
+         */
+        qemu_log_mask(CPU_LOG_INT,
+                      "...STKOF during callee-saves register stacking\n"=
);
+        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_STKOF_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                env->v7m.secure);
+        *frame_sp_p =3D limit;
+        return true;
+    }
+
+    /*
+     * Write as much of the stack frame as we can. A write failure may
+     * cause us to pend a derived exception.
+     */
+    sig =3D v7m_integrity_sig(env, lr);
+    stacked_ok =3D
+        v7m_stack_write(cpu, frameptr, sig, mmu_idx, smode) &&
+        v7m_stack_write(cpu, frameptr + 0x8, env->regs[4], mmu_idx, smod=
e) &&
+        v7m_stack_write(cpu, frameptr + 0xc, env->regs[5], mmu_idx, smod=
e) &&
+        v7m_stack_write(cpu, frameptr + 0x10, env->regs[6], mmu_idx, smo=
de) &&
+        v7m_stack_write(cpu, frameptr + 0x14, env->regs[7], mmu_idx, smo=
de) &&
+        v7m_stack_write(cpu, frameptr + 0x18, env->regs[8], mmu_idx, smo=
de) &&
+        v7m_stack_write(cpu, frameptr + 0x1c, env->regs[9], mmu_idx, smo=
de) &&
+        v7m_stack_write(cpu, frameptr + 0x20, env->regs[10], mmu_idx, sm=
ode) &&
+        v7m_stack_write(cpu, frameptr + 0x24, env->regs[11], mmu_idx, sm=
ode);
+
+    /* Update SP regardless of whether any of the stack accesses failed.=
 */
+    *frame_sp_p =3D frameptr;
+
+    return !stacked_ok;
+}
+
+static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailcha=
in,
+                                bool ignore_stackfaults)
+{
+    /*
+     * Do the "take the exception" parts of exception entry,
+     * but not the pushing of state to the stack. This is
+     * similar to the pseudocode ExceptionTaken() function.
+     */
+    CPUARMState *env =3D &cpu->env;
+    uint32_t addr;
+    bool targets_secure;
+    int exc;
+    bool push_failed =3D false;
+
+    armv7m_nvic_get_pending_irq_info(env->nvic, &exc, &targets_secure);
+    qemu_log_mask(CPU_LOG_INT, "...taking pending %s exception %d\n",
+                  targets_secure ? "secure" : "nonsecure", exc);
+
+    if (dotailchain) {
+        /* Sanitize LR FType and PREFIX bits */
+        if (!arm_feature(env, ARM_FEATURE_VFP)) {
+            lr |=3D R_V7M_EXCRET_FTYPE_MASK;
+        }
+        lr =3D deposit32(lr, 24, 8, 0xff);
+    }
+
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+            (lr & R_V7M_EXCRET_S_MASK)) {
+            /*
+             * The background code (the owner of the registers in the
+             * exception frame) is Secure. This means it may either alre=
ady
+             * have or now needs to push callee-saves registers.
+             */
+            if (targets_secure) {
+                if (dotailchain && !(lr & R_V7M_EXCRET_ES_MASK)) {
+                    /*
+                     * We took an exception from Secure to NonSecure
+                     * (which means the callee-saved registers got stack=
ed)
+                     * and are now tailchaining to a Secure exception.
+                     * Clear DCRS so eventual return from this Secure
+                     * exception unstacks the callee-saved registers.
+                     */
+                    lr &=3D ~R_V7M_EXCRET_DCRS_MASK;
+                }
+            } else {
+                /*
+                 * We're going to a non-secure exception; push the
+                 * callee-saves registers to the stack now, if they're
+                 * not already saved.
+                 */
+                if (lr & R_V7M_EXCRET_DCRS_MASK &&
+                    !(dotailchain && !(lr & R_V7M_EXCRET_ES_MASK))) {
+                    push_failed =3D v7m_push_callee_stack(cpu, lr, dotai=
lchain,
+                                                        ignore_stackfaul=
ts);
+                }
+                lr |=3D R_V7M_EXCRET_DCRS_MASK;
+            }
+        }
+
+        lr &=3D ~R_V7M_EXCRET_ES_MASK;
+        if (targets_secure || !arm_feature(env, ARM_FEATURE_M_SECURITY))=
 {
+            lr |=3D R_V7M_EXCRET_ES_MASK;
+        }
+        lr &=3D ~R_V7M_EXCRET_SPSEL_MASK;
+        if (env->v7m.control[targets_secure] & R_V7M_CONTROL_SPSEL_MASK)=
 {
+            lr |=3D R_V7M_EXCRET_SPSEL_MASK;
+        }
+
+        /*
+         * Clear registers if necessary to prevent non-secure exception
+         * code being able to see register values from secure code.
+         * Where register values become architecturally UNKNOWN we leave
+         * them with their previous values.
+         */
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            if (!targets_secure) {
+                /*
+                 * Always clear the caller-saved registers (they have be=
en
+                 * pushed to the stack earlier in v7m_push_stack()).
+                 * Clear callee-saved registers if the background code i=
s
+                 * Secure (in which case these regs were saved in
+                 * v7m_push_callee_stack()).
+                 */
+                int i;
+
+                for (i =3D 0; i < 13; i++) {
+                    /* r4..r11 are callee-saves, zero only if EXCRET.S =3D=
=3D 1 */
+                    if (i < 4 || i > 11 || (lr & R_V7M_EXCRET_S_MASK)) {
+                        env->regs[i] =3D 0;
+                    }
+                }
+                /* Clear EAPSR */
+                xpsr_write(env, 0, XPSR_NZCV | XPSR_Q | XPSR_GE | XPSR_I=
T);
+            }
+        }
+    }
+
+    if (push_failed && !ignore_stackfaults) {
+        /*
+         * Derived exception on callee-saves register stacking:
+         * we might now want to take a different exception which
+         * targets a different security state, so try again from the top=
.
+         */
+        qemu_log_mask(CPU_LOG_INT,
+                      "...derived exception on callee-saves register sta=
cking");
+        v7m_exception_taken(cpu, lr, true, true);
+        return;
+    }
+
+    if (!arm_v7m_load_vector(cpu, exc, targets_secure, &addr)) {
+        /* Vector load failed: derived exception */
+        qemu_log_mask(CPU_LOG_INT, "...derived exception on vector table=
 load");
+        v7m_exception_taken(cpu, lr, true, true);
+        return;
+    }
+
+    /*
+     * Now we've done everything that might cause a derived exception
+     * we can go ahead and activate whichever exception we're going to
+     * take (which might now be the derived exception).
+     */
+    armv7m_nvic_acknowledge_irq(env->nvic);
+
+    /* Switch to target security state -- must do this before writing SP=
SEL */
+    switch_v7m_security_state(env, targets_secure);
+    write_v7m_control_spsel(env, 0);
+    arm_clear_exclusive(env);
+    /* Clear SFPA and FPCA (has no effect if no FPU) */
+    env->v7m.control[M_REG_S] &=3D
+        ~(R_V7M_CONTROL_FPCA_MASK | R_V7M_CONTROL_SFPA_MASK);
+    /* Clear IT bits */
+    env->condexec_bits =3D 0;
+    env->regs[14] =3D lr;
+    env->regs[15] =3D addr & 0xfffffffe;
+    env->thumb =3D addr & 1;
+}
+
+static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
+                             bool apply_splim)
+{
+    /*
+     * Like the pseudocode UpdateFPCCR: save state in FPCAR and FPCCR
+     * that we will need later in order to do lazy FP reg stacking.
+     */
+    bool is_secure =3D env->v7m.secure;
+    void *nvic =3D env->nvic;
+    /*
+     * Some bits are unbanked and live always in fpccr[M_REG_S]; some bi=
ts
+     * are banked and we want to update the bit in the bank for the
+     * current security state; and in one case we want to specifically
+     * update the NS banked version of a bit even if we are secure.
+     */
+    uint32_t *fpccr_s =3D &env->v7m.fpccr[M_REG_S];
+    uint32_t *fpccr_ns =3D &env->v7m.fpccr[M_REG_NS];
+    uint32_t *fpccr =3D &env->v7m.fpccr[is_secure];
+    bool hfrdy, bfrdy, mmrdy, ns_ufrdy, s_ufrdy, sfrdy, monrdy;
+
+    env->v7m.fpcar[is_secure] =3D frameptr & ~0x7;
+
+    if (apply_splim && arm_feature(env, ARM_FEATURE_V8)) {
+        bool splimviol;
+        uint32_t splim =3D v7m_sp_limit(env);
+        bool ign =3D armv7m_nvic_neg_prio_requested(nvic, is_secure) &&
+            (env->v7m.ccr[is_secure] & R_V7M_CCR_STKOFHFNMIGN_MASK);
+
+        splimviol =3D !ign && frameptr < splim;
+        *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, SPLIMVIOL, splimviol);
+    }
+
+    *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, LSPACT, 1);
+
+    *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, S, is_secure);
+
+    *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, USER, arm_current_el(env) =3D=
=3D 0);
+
+    *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, THREAD,
+                        !arm_v7m_is_handler_mode(env));
+
+    hfrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_HARD, false=
);
+    *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, HFRDY, hfrdy);
+
+    bfrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_BUS, false)=
;
+    *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, BFRDY, bfrdy);
+
+    mmrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_MEM, is_sec=
ure);
+    *fpccr =3D FIELD_DP32(*fpccr, V7M_FPCCR, MMRDY, mmrdy);
+
+    ns_ufrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_USAGE, f=
alse);
+    *fpccr_ns =3D FIELD_DP32(*fpccr_ns, V7M_FPCCR, UFRDY, ns_ufrdy);
+
+    monrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_DEBUG, fal=
se);
+    *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, MONRDY, monrdy);
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        s_ufrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_USAGE=
, true);
+        *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, UFRDY, s_ufrdy);
+
+        sfrdy =3D armv7m_nvic_get_ready_status(nvic, ARMV7M_EXCP_SECURE,=
 false);
+        *fpccr_s =3D FIELD_DP32(*fpccr_s, V7M_FPCCR, SFRDY, sfrdy);
+    }
+}
+
+void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
+{
+    /* fptr is the value of Rn, the frame pointer we store the FP regs t=
o */
+    bool s =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+    bool lspact =3D env->v7m.fpccr[s] & R_V7M_FPCCR_LSPACT_MASK;
+
+    assert(env->v7m.secure);
+
+    if (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)) {
+        return;
+    }
+
+    /* Check access to the coprocessor is permitted */
+    if (!v7m_cpacr_pass(env, true, arm_current_el(env) !=3D 0)) {
+        raise_exception_ra(env, EXCP_NOCP, 0, 1, GETPC());
+    }
+
+    if (lspact) {
+        /* LSPACT should not be active when there is active FP state */
+        raise_exception_ra(env, EXCP_LSERR, 0, 1, GETPC());
+    }
+
+    if (fptr & 7) {
+        raise_exception_ra(env, EXCP_UNALIGNED, 0, 1, GETPC());
+    }
+
+    /*
+     * Note that we do not use v7m_stack_write() here, because the
+     * accesses should not set the FSR bits for stacking errors if they
+     * fail. (In pseudocode terms, they are AccType_NORMAL, not AccType_=
STACK
+     * or AccType_LAZYFP). Faults in cpu_stl_data() will throw exception=
s
+     * and longjmp out.
+     */
+    if (!(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPEN_MASK)) {
+        bool ts =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK;
+        int i;
+
+        for (i =3D 0; i < (ts ? 32 : 16); i +=3D 2) {
+            uint64_t dn =3D *aa32_vfp_dreg(env, i / 2);
+            uint32_t faddr =3D fptr + 4 * i;
+            uint32_t slo =3D extract64(dn, 0, 32);
+            uint32_t shi =3D extract64(dn, 32, 32);
+
+            if (i >=3D 16) {
+                faddr +=3D 8; /* skip the slot for the FPSCR */
+            }
+            cpu_stl_data(env, faddr, slo);
+            cpu_stl_data(env, faddr + 4, shi);
+        }
+        cpu_stl_data(env, fptr + 0x40, vfp_get_fpscr(env));
+
+        /*
+         * If TS is 0 then s0 to s15 and FPSCR are UNKNOWN; we choose to
+         * leave them unchanged, matching our choice in v7m_preserve_fp_=
state.
+         */
+        if (ts) {
+            for (i =3D 0; i < 32; i +=3D 2) {
+                *aa32_vfp_dreg(env, i / 2) =3D 0;
+            }
+            vfp_set_fpscr(env, 0);
+        }
+    } else {
+        v7m_update_fpccr(env, fptr, false);
+    }
+
+    env->v7m.control[M_REG_S] &=3D ~R_V7M_CONTROL_FPCA_MASK;
+}
+
+void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
+{
+    /* fptr is the value of Rn, the frame pointer we load the FP regs fr=
om */
+    assert(env->v7m.secure);
+
+    if (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)) {
+        return;
+    }
+
+    /* Check access to the coprocessor is permitted */
+    if (!v7m_cpacr_pass(env, true, arm_current_el(env) !=3D 0)) {
+        raise_exception_ra(env, EXCP_NOCP, 0, 1, GETPC());
+    }
+
+    if (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPACT_MASK) {
+        /* State in FP is still valid */
+        env->v7m.fpccr[M_REG_S] &=3D ~R_V7M_FPCCR_LSPACT_MASK;
+    } else {
+        bool ts =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK;
+        int i;
+        uint32_t fpscr;
+
+        if (fptr & 7) {
+            raise_exception_ra(env, EXCP_UNALIGNED, 0, 1, GETPC());
+        }
+
+        for (i =3D 0; i < (ts ? 32 : 16); i +=3D 2) {
+            uint32_t slo, shi;
+            uint64_t dn;
+            uint32_t faddr =3D fptr + 4 * i;
+
+            if (i >=3D 16) {
+                faddr +=3D 8; /* skip the slot for the FPSCR */
+            }
+
+            slo =3D cpu_ldl_data(env, faddr);
+            shi =3D cpu_ldl_data(env, faddr + 4);
+
+            dn =3D (uint64_t) shi << 32 | slo;
+            *aa32_vfp_dreg(env, i / 2) =3D dn;
+        }
+        fpscr =3D cpu_ldl_data(env, fptr + 0x40);
+        vfp_set_fpscr(env, fpscr);
+    }
+
+    env->v7m.control[M_REG_S] |=3D R_V7M_CONTROL_FPCA_MASK;
+}
+
+static bool v7m_push_stack(ARMCPU *cpu)
+{
+    /*
+     * Do the "set up stack frame" part of exception entry,
+     * similar to pseudocode PushStack().
+     * Return true if we generate a derived exception (and so
+     * should ignore further stack faults trying to process
+     * that derived exception.)
+     */
+    bool stacked_ok =3D true, limitviol =3D false;
+    CPUARMState *env =3D &cpu->env;
+    uint32_t xpsr =3D xpsr_read(env);
+    uint32_t frameptr =3D env->regs[13];
+    ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
+    uint32_t framesize;
+    bool nsacr_cp10 =3D extract32(env->v7m.nsacr, 10, 1);
+
+    if ((env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) &&
+        (env->v7m.secure || nsacr_cp10)) {
+        if (env->v7m.secure &&
+            env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK) {
+            framesize =3D 0xa8;
+        } else {
+            framesize =3D 0x68;
+        }
+    } else {
+        framesize =3D 0x20;
+    }
+
+    /* Align stack pointer if the guest wants that */
+    if ((frameptr & 4) &&
+        (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKALIGN_MASK)) {
+        frameptr -=3D 4;
+        xpsr |=3D XPSR_SPREALIGN;
+    }
+
+    xpsr &=3D ~XPSR_SFPA;
+    if (env->v7m.secure &&
+        (env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)) {
+        xpsr |=3D XPSR_SFPA;
+    }
+
+    frameptr -=3D framesize;
+
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        uint32_t limit =3D v7m_sp_limit(env);
+
+        if (frameptr < limit) {
+            /*
+             * Stack limit failure: set SP to the limit value, and gener=
ate
+             * STKOF UsageFault. Stack pushes below the limit must not b=
e
+             * performed. It is IMPDEF whether pushes above the limit ar=
e
+             * performed; we choose not to.
+             */
+            qemu_log_mask(CPU_LOG_INT,
+                          "...STKOF during stacking\n");
+            env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_STKOF_MASK;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                    env->v7m.secure);
+            env->regs[13] =3D limit;
+            /*
+             * We won't try to perform any further memory accesses but
+             * we must continue through the following code to check for
+             * permission faults during FPU state preservation, and we
+             * must update FPCCR if lazy stacking is enabled.
+             */
+            limitviol =3D true;
+            stacked_ok =3D false;
+        }
+    }
+
+    /*
+     * Write as much of the stack frame as we can. If we fail a stack
+     * write this will result in a derived exception being pended
+     * (which may be taken in preference to the one we started with
+     * if it has higher priority).
+     */
+    stacked_ok =3D stacked_ok &&
+        v7m_stack_write(cpu, frameptr, env->regs[0], mmu_idx, STACK_NORM=
AL) &&
+        v7m_stack_write(cpu, frameptr + 4, env->regs[1],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 8, env->regs[2],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 12, env->regs[3],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 16, env->regs[12],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 20, env->regs[14],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 24, env->regs[15],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 28, xpsr, mmu_idx, STACK_NORMAL)=
;
+
+    if (env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) {
+        /* FPU is active, try to save its registers */
+        bool fpccr_s =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
+        bool lspact =3D env->v7m.fpccr[fpccr_s] & R_V7M_FPCCR_LSPACT_MAS=
K;
+
+        if (lspact && arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...SecureFault because LSPACT and FPCA both s=
et\n");
+            env->v7m.sfsr |=3D R_V7M_SFSR_LSERR_MASK;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false=
);
+        } else if (!env->v7m.secure && !nsacr_cp10) {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...Secure UsageFault with CFSR.NOCP because "
+                          "NSACR.CP10 prevents stacking FP regs\n");
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, M_REG_=
S);
+            env->v7m.cfsr[M_REG_S] |=3D R_V7M_CFSR_NOCP_MASK;
+        } else {
+            if (!(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPEN_MASK)) {
+                /* Lazy stacking disabled, save registers now */
+                int i;
+                bool cpacr_pass =3D v7m_cpacr_pass(env, env->v7m.secure,
+                                                 arm_current_el(env) !=3D=
 0);
+
+                if (stacked_ok && !cpacr_pass) {
+                    /*
+                     * Take UsageFault if CPACR forbids access. The pseu=
docode
+                     * here does a full CheckCPEnabled() but we know the=
 NSACR
+                     * check can never fail as we have already handled t=
hat.
+                     */
+                    qemu_log_mask(CPU_LOG_INT,
+                                  "...UsageFault with CFSR.NOCP because =
"
+                                  "CPACR.CP10 prevents stacking FP regs\=
n");
+                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE=
,
+                                            env->v7m.secure);
+                    env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_NOCP_=
MASK;
+                    stacked_ok =3D false;
+                }
+
+                for (i =3D 0; i < ((framesize =3D=3D 0xa8) ? 32 : 16); i=
 +=3D 2) {
+                    uint64_t dn =3D *aa32_vfp_dreg(env, i / 2);
+                    uint32_t faddr =3D frameptr + 0x20 + 4 * i;
+                    uint32_t slo =3D extract64(dn, 0, 32);
+                    uint32_t shi =3D extract64(dn, 32, 32);
+
+                    if (i >=3D 16) {
+                        faddr +=3D 8; /* skip the slot for the FPSCR */
+                    }
+                    stacked_ok =3D stacked_ok &&
+                        v7m_stack_write(cpu, faddr, slo,
+                                        mmu_idx, STACK_NORMAL) &&
+                        v7m_stack_write(cpu, faddr + 4, shi,
+                                        mmu_idx, STACK_NORMAL);
+                }
+                stacked_ok =3D stacked_ok &&
+                    v7m_stack_write(cpu, frameptr + 0x60,
+                                    vfp_get_fpscr(env), mmu_idx, STACK_N=
ORMAL);
+                if (cpacr_pass) {
+                    for (i =3D 0; i < ((framesize =3D=3D 0xa8) ? 32 : 16=
); i +=3D 2) {
+                        *aa32_vfp_dreg(env, i / 2) =3D 0;
+                    }
+                    vfp_set_fpscr(env, 0);
+                }
+            } else {
+                /* Lazy stacking enabled, save necessary info to stack l=
ater */
+                v7m_update_fpccr(env, frameptr + 0x20, true);
+            }
+        }
+    }
+
+    /*
+     * If we broke a stack limit then SP was already updated earlier;
+     * otherwise we update SP regardless of whether any of the stack
+     * accesses failed or we took some other kind of fault.
+     */
+    if (!limitviol) {
+        env->regs[13] =3D frameptr;
+    }
+
+    return !stacked_ok;
+}
+
+static void do_v7m_exception_exit(ARMCPU *cpu)
+{
+    CPUARMState *env =3D &cpu->env;
+    uint32_t excret;
+    uint32_t xpsr, xpsr_mask;
+    bool ufault =3D false;
+    bool sfault =3D false;
+    bool return_to_sp_process;
+    bool return_to_handler;
+    bool rettobase =3D false;
+    bool exc_secure =3D false;
+    bool return_to_secure;
+    bool ftype;
+    bool restore_s16_s31;
+
+    /*
+     * If we're not in Handler mode then jumps to magic exception-exit
+     * addresses don't have magic behaviour. However for the v8M
+     * security extensions the magic secure-function-return has to
+     * work in thread mode too, so to avoid doing an extra check in
+     * the generated code we allow exception-exit magic to also cause th=
e
+     * internal exception and bring us here in thread mode. Correct code
+     * will never try to do this (the following insn fetch will always
+     * fault) so we the overhead of having taken an unnecessary exceptio=
n
+     * doesn't matter.
+     */
+    if (!arm_v7m_is_handler_mode(env)) {
+        return;
+    }
+
+    /*
+     * In the spec pseudocode ExceptionReturn() is called directly
+     * from BXWritePC() and gets the full target PC value including
+     * bit zero. In QEMU's implementation we treat it as a normal
+     * jump-to-register (which is then caught later on), and so split
+     * the target value up between env->regs[15] and env->thumb in
+     * gen_bx(). Reconstitute it.
+     */
+    excret =3D env->regs[15];
+    if (env->thumb) {
+        excret |=3D 1;
+    }
+
+    qemu_log_mask(CPU_LOG_INT, "Exception return: magic PC %" PRIx32
+                  " previous exception %d\n",
+                  excret, env->v7m.exception);
+
+    if ((excret & R_V7M_EXCRET_RES1_MASK) !=3D R_V7M_EXCRET_RES1_MASK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "M profile: zero high bits in exc=
eption "
+                      "exit PC value 0x%" PRIx32 " are UNPREDICTABLE\n",
+                      excret);
+    }
+
+    ftype =3D excret & R_V7M_EXCRET_FTYPE_MASK;
+
+    if (!arm_feature(env, ARM_FEATURE_VFP) && !ftype) {
+        qemu_log_mask(LOG_GUEST_ERROR, "M profile: zero FTYPE in excepti=
on "
+                      "exit PC value 0x%" PRIx32 " is UNPREDICTABLE "
+                      "if FPU not present\n",
+                      excret);
+        ftype =3D true;
+    }
+
+    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+        /*
+         * EXC_RETURN.ES validation check (R_SMFL). We must do this befo=
re
+         * we pick which FAULTMASK to clear.
+         */
+        if (!env->v7m.secure &&
+            ((excret & R_V7M_EXCRET_ES_MASK) ||
+             !(excret & R_V7M_EXCRET_DCRS_MASK))) {
+            sfault =3D 1;
+            /* For all other purposes, treat ES as 0 (R_HXSR) */
+            excret &=3D ~R_V7M_EXCRET_ES_MASK;
+        }
+        exc_secure =3D excret & R_V7M_EXCRET_ES_MASK;
+    }
+
+    if (env->v7m.exception !=3D ARMV7M_EXCP_NMI) {
+        /*
+         * Auto-clear FAULTMASK on return from other than NMI.
+         * If the security extension is implemented then this only
+         * happens if the raw execution priority is >=3D 0; the
+         * value of the ES bit in the exception return value indicates
+         * which security state's faultmask to clear. (v8M ARM ARM R_KBN=
F.)
+         */
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            if (armv7m_nvic_raw_execution_priority(env->nvic) >=3D 0) {
+                env->v7m.faultmask[exc_secure] =3D 0;
+            }
+        } else {
+            env->v7m.faultmask[M_REG_NS] =3D 0;
+        }
+    }
+
+    switch (armv7m_nvic_complete_irq(env->nvic, env->v7m.exception,
+                                     exc_secure)) {
+    case -1:
+        /* attempt to exit an exception that isn't active */
+        ufault =3D true;
+        break;
+    case 0:
+        /* still an irq active now */
+        break;
+    case 1:
+        /*
+         * We returned to base exception level, no nesting.
+         * (In the pseudocode this is written using "NestedActivation !=3D=
 1"
+         * where we have 'rettobase =3D=3D false'.)
+         */
+        rettobase =3D true;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    return_to_handler =3D !(excret & R_V7M_EXCRET_MODE_MASK);
+    return_to_sp_process =3D excret & R_V7M_EXCRET_SPSEL_MASK;
+    return_to_secure =3D arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+        (excret & R_V7M_EXCRET_S_MASK);
+
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        if (!arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            /*
+             * UNPREDICTABLE if S =3D=3D 1 or DCRS =3D=3D 0 or ES =3D=3D=
 1 (R_XLCP);
+             * we choose to take the UsageFault.
+             */
+            if ((excret & R_V7M_EXCRET_S_MASK) ||
+                (excret & R_V7M_EXCRET_ES_MASK) ||
+                !(excret & R_V7M_EXCRET_DCRS_MASK)) {
+                ufault =3D true;
+            }
+        }
+        if (excret & R_V7M_EXCRET_RES0_MASK) {
+            ufault =3D true;
+        }
+    } else {
+        /* For v7M we only recognize certain combinations of the low bit=
s */
+        switch (excret & 0xf) {
+        case 1: /* Return to Handler */
+            break;
+        case 13: /* Return to Thread using Process stack */
+        case 9: /* Return to Thread using Main stack */
+            /*
+             * We only need to check NONBASETHRDENA for v7M, because in
+             * v8M this bit does not exist (it is RES1).
+             */
+            if (!rettobase &&
+                !(env->v7m.ccr[env->v7m.secure] &
+                  R_V7M_CCR_NONBASETHRDENA_MASK)) {
+                ufault =3D true;
+            }
+            break;
+        default:
+            ufault =3D true;
+        }
+    }
+
+    /*
+     * Set CONTROL.SPSEL from excret.SPSEL. Since we're still in
+     * Handler mode (and will be until we write the new XPSR.Interrupt
+     * field) this does not switch around the current stack pointer.
+     * We must do this before we do any kind of tailchaining, including
+     * for the derived exceptions on integrity check failures, or we wil=
l
+     * give the guest an incorrect EXCRET.SPSEL value on exception entry=
.
+     */
+    write_v7m_control_spsel_for_secstate(env, return_to_sp_process, exc_=
secure);
+
+    /*
+     * Clear scratch FP values left in caller saved registers; this
+     * must happen before any kind of tail chaining.
+     */
+    if ((env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_CLRONRET_MASK) &&
+        (env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK)) {
+        if (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPACT_MASK) {
+            env->v7m.sfsr |=3D R_V7M_SFSR_LSERR_MASK;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false=
);
+            qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existin=
g "
+                          "stackframe: error during lazy state deactivat=
ion\n");
+            v7m_exception_taken(cpu, excret, true, false);
+            return;
+        } else {
+            /* Clear s0..s15 and FPSCR */
+            int i;
+
+            for (i =3D 0; i < 16; i +=3D 2) {
+                *aa32_vfp_dreg(env, i / 2) =3D 0;
+            }
+            vfp_set_fpscr(env, 0);
+        }
+    }
+
+    if (sfault) {
+        env->v7m.sfsr |=3D R_V7M_SFSR_INVER_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+        qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
+                      "stackframe: failed EXC_RETURN.ES validity check\n=
");
+        v7m_exception_taken(cpu, excret, true, false);
+        return;
+    }
+
+    if (ufault) {
+        /*
+         * Bad exception return: instead of popping the exception
+         * stack, directly take a usage fault on the current stack.
+         */
+        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
+        qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
+                      "stackframe: failed exception return integrity che=
ck\n");
+        v7m_exception_taken(cpu, excret, true, false);
+        return;
+    }
+
+    /*
+     * Tailchaining: if there is currently a pending exception that
+     * is high enough priority to preempt execution at the level we're
+     * about to return to, then just directly take that exception now,
+     * avoiding an unstack-and-then-stack. Note that now we have
+     * deactivated the previous exception by calling armv7m_nvic_complet=
e_irq()
+     * our current execution priority is already the execution priority =
we are
+     * returning to -- none of the state we would unstack or set based o=
n
+     * the EXCRET value affects it.
+     */
+    if (armv7m_nvic_can_take_pending_exception(env->nvic)) {
+        qemu_log_mask(CPU_LOG_INT, "...tailchaining to pending exception=
\n");
+        v7m_exception_taken(cpu, excret, true, false);
+        return;
+    }
+
+    switch_v7m_security_state(env, return_to_secure);
+
+    {
+        /*
+         * The stack pointer we should be reading the exception frame fr=
om
+         * depends on bits in the magic exception return type value (and
+         * for v8M isn't necessarily the stack pointer we will eventuall=
y
+         * end up resuming execution with). Get a pointer to the locatio=
n
+         * in the CPU state struct where the SP we need is currently bei=
ng
+         * stored; we will use and modify it in place.
+         * We use this limited C variable scope so we don't accidentally
+         * use 'frame_sp_p' after we do something that makes it invalid.
+         */
+        uint32_t *frame_sp_p =3D get_v7m_sp_ptr(env,
+                                              return_to_secure,
+                                              !return_to_handler,
+                                              return_to_sp_process);
+        uint32_t frameptr =3D *frame_sp_p;
+        bool pop_ok =3D true;
+        ARMMMUIdx mmu_idx;
+        bool return_to_priv =3D return_to_handler ||
+            !(env->v7m.control[return_to_secure] & R_V7M_CONTROL_NPRIV_M=
ASK);
+
+        mmu_idx =3D arm_v7m_mmu_idx_for_secstate_and_priv(env, return_to=
_secure,
+                                                        return_to_priv);
+
+        if (!QEMU_IS_ALIGNED(frameptr, 8) &&
+            arm_feature(env, ARM_FEATURE_V8)) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "M profile exception return with non-8-aligned=
 SP "
+                          "for destination state is UNPREDICTABLE\n");
+        }
+
+        /* Do we need to pop callee-saved registers? */
+        if (return_to_secure &&
+            ((excret & R_V7M_EXCRET_ES_MASK) =3D=3D 0 ||
+             (excret & R_V7M_EXCRET_DCRS_MASK) =3D=3D 0)) {
+            uint32_t actual_sig;
+
+            pop_ok =3D v7m_stack_read(cpu, &actual_sig, frameptr, mmu_id=
x);
+
+            if (pop_ok && v7m_integrity_sig(env, excret) !=3D actual_sig=
) {
+                /* Take a SecureFault on the current stack */
+                env->v7m.sfsr |=3D R_V7M_SFSR_INVIS_MASK;
+                armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, f=
alse);
+                qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on exi=
sting "
+                              "stackframe: failed exception return integ=
rity "
+                              "signature check\n");
+                v7m_exception_taken(cpu, excret, true, false);
+                return;
+            }
+
+            pop_ok =3D pop_ok &&
+                v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_i=
dx) &&
+                v7m_stack_read(cpu, &env->regs[5], frameptr + 0xc, mmu_i=
dx) &&
+                v7m_stack_read(cpu, &env->regs[6], frameptr + 0x10, mmu_=
idx) &&
+                v7m_stack_read(cpu, &env->regs[7], frameptr + 0x14, mmu_=
idx) &&
+                v7m_stack_read(cpu, &env->regs[8], frameptr + 0x18, mmu_=
idx) &&
+                v7m_stack_read(cpu, &env->regs[9], frameptr + 0x1c, mmu_=
idx) &&
+                v7m_stack_read(cpu, &env->regs[10], frameptr + 0x20, mmu=
_idx) &&
+                v7m_stack_read(cpu, &env->regs[11], frameptr + 0x24, mmu=
_idx);
+
+            frameptr +=3D 0x28;
+        }
+
+        /* Pop registers */
+        pop_ok =3D pop_ok &&
+            v7m_stack_read(cpu, &env->regs[0], frameptr, mmu_idx) &&
+            v7m_stack_read(cpu, &env->regs[1], frameptr + 0x4, mmu_idx) =
&&
+            v7m_stack_read(cpu, &env->regs[2], frameptr + 0x8, mmu_idx) =
&&
+            v7m_stack_read(cpu, &env->regs[3], frameptr + 0xc, mmu_idx) =
&&
+            v7m_stack_read(cpu, &env->regs[12], frameptr + 0x10, mmu_idx=
) &&
+            v7m_stack_read(cpu, &env->regs[14], frameptr + 0x14, mmu_idx=
) &&
+            v7m_stack_read(cpu, &env->regs[15], frameptr + 0x18, mmu_idx=
) &&
+            v7m_stack_read(cpu, &xpsr, frameptr + 0x1c, mmu_idx);
+
+        if (!pop_ok) {
+            /*
+             * v7m_stack_read() pended a fault, so take it (as a tail
+             * chained exception on the same stack frame)
+             */
+            qemu_log_mask(CPU_LOG_INT, "...derived exception on unstacki=
ng\n");
+            v7m_exception_taken(cpu, excret, true, false);
+            return;
+        }
+
+        /*
+         * Returning from an exception with a PC with bit 0 set is defin=
ed
+         * behaviour on v8M (bit 0 is ignored), but for v7M it was speci=
fied
+         * to be UNPREDICTABLE. In practice actual v7M hardware seems to=
 ignore
+         * the lsbit, and there are several RTOSes out there which incor=
rectly
+         * assume the r15 in the stack frame should be a Thumb-style "ls=
bit
+         * indicates ARM/Thumb" value, so ignore the bit on v7M as well,=
 but
+         * complain about the badly behaved guest.
+         */
+        if (env->regs[15] & 1) {
+            env->regs[15] &=3D ~1U;
+            if (!arm_feature(env, ARM_FEATURE_V8)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "M profile return from interrupt with misa=
ligned "
+                              "PC is UNPREDICTABLE on v7M\n");
+            }
+        }
+
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            /*
+             * For v8M we have to check whether the xPSR exception field
+             * matches the EXCRET value for return to handler/thread
+             * before we commit to changing the SP and xPSR.
+             */
+            bool will_be_handler =3D (xpsr & XPSR_EXCP) !=3D 0;
+            if (return_to_handler !=3D will_be_handler) {
+                /*
+                 * Take an INVPC UsageFault on the current stack.
+                 * By this point we will have switched to the security s=
tate
+                 * for the background state, so this UsageFault will tar=
get
+                 * that state.
+                 */
+                armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                        env->v7m.secure);
+                env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MAS=
K;
+                qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on exis=
ting "
+                              "stackframe: failed exception return integ=
rity "
+                              "check\n");
+                v7m_exception_taken(cpu, excret, true, false);
+                return;
+            }
+        }
+
+        if (!ftype) {
+            /* FP present and we need to handle it */
+            if (!return_to_secure &&
+                (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPACT_MASK)) {
+                armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, f=
alse);
+                env->v7m.sfsr |=3D R_V7M_SFSR_LSERR_MASK;
+                qemu_log_mask(CPU_LOG_INT,
+                              "...taking SecureFault on existing stackfr=
ame: "
+                              "Secure LSPACT set but exception return is=
 "
+                              "not to secure state\n");
+                v7m_exception_taken(cpu, excret, true, false);
+                return;
+            }
+
+            restore_s16_s31 =3D return_to_secure &&
+                (env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_TS_MASK);
+
+            if (env->v7m.fpccr[return_to_secure] & R_V7M_FPCCR_LSPACT_MA=
SK) {
+                /* State in FPU is still valid, just clear LSPACT */
+                env->v7m.fpccr[return_to_secure] &=3D ~R_V7M_FPCCR_LSPAC=
T_MASK;
+            } else {
+                int i;
+                uint32_t fpscr;
+                bool cpacr_pass, nsacr_pass;
+
+                cpacr_pass =3D v7m_cpacr_pass(env, return_to_secure,
+                                            return_to_priv);
+                nsacr_pass =3D return_to_secure ||
+                    extract32(env->v7m.nsacr, 10, 1);
+
+                if (!cpacr_pass) {
+                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE=
,
+                                            return_to_secure);
+                    env->v7m.cfsr[return_to_secure] |=3D R_V7M_CFSR_NOCP=
_MASK;
+                    qemu_log_mask(CPU_LOG_INT,
+                                  "...taking UsageFault on existing "
+                                  "stackframe: CPACR.CP10 prevents unsta=
cking "
+                                  "FP regs\n");
+                    v7m_exception_taken(cpu, excret, true, false);
+                    return;
+                } else if (!nsacr_pass) {
+                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE=
, true);
+                    env->v7m.cfsr[M_REG_S] |=3D R_V7M_CFSR_INVPC_MASK;
+                    qemu_log_mask(CPU_LOG_INT,
+                                  "...taking Secure UsageFault on existi=
ng "
+                                  "stackframe: NSACR.CP10 prevents unsta=
cking "
+                                  "FP regs\n");
+                    v7m_exception_taken(cpu, excret, true, false);
+                    return;
+                }
+
+                for (i =3D 0; i < (restore_s16_s31 ? 32 : 16); i +=3D 2)=
 {
+                    uint32_t slo, shi;
+                    uint64_t dn;
+                    uint32_t faddr =3D frameptr + 0x20 + 4 * i;
+
+                    if (i >=3D 16) {
+                        faddr +=3D 8; /* Skip the slot for the FPSCR */
+                    }
+
+                    pop_ok =3D pop_ok &&
+                        v7m_stack_read(cpu, &slo, faddr, mmu_idx) &&
+                        v7m_stack_read(cpu, &shi, faddr + 4, mmu_idx);
+
+                    if (!pop_ok) {
+                        break;
+                    }
+
+                    dn =3D (uint64_t)shi << 32 | slo;
+                    *aa32_vfp_dreg(env, i / 2) =3D dn;
+                }
+                pop_ok =3D pop_ok &&
+                    v7m_stack_read(cpu, &fpscr, frameptr + 0x60, mmu_idx=
);
+                if (pop_ok) {
+                    vfp_set_fpscr(env, fpscr);
+                }
+                if (!pop_ok) {
+                    /*
+                     * These regs are 0 if security extension present;
+                     * otherwise merely UNKNOWN. We zero always.
+                     */
+                    for (i =3D 0; i < (restore_s16_s31 ? 32 : 16); i +=3D=
 2) {
+                        *aa32_vfp_dreg(env, i / 2) =3D 0;
+                    }
+                    vfp_set_fpscr(env, 0);
+                }
+            }
+        }
+        env->v7m.control[M_REG_S] =3D FIELD_DP32(env->v7m.control[M_REG_=
S],
+                                               V7M_CONTROL, FPCA, !ftype=
);
+
+        /* Commit to consuming the stack frame */
+        frameptr +=3D 0x20;
+        if (!ftype) {
+            frameptr +=3D 0x48;
+            if (restore_s16_s31) {
+                frameptr +=3D 0x40;
+            }
+        }
+        /*
+         * Undo stack alignment (the SPREALIGN bit indicates that the or=
iginal
+         * pre-exception SP was not 8-aligned and we added a padding wor=
d to
+         * align it, so we undo this by ORing in the bit that increases =
it
+         * from the current 8-aligned value to the 8-unaligned value. (A=
dding 4
+         * would work too but a logical OR is how the pseudocode specifi=
es it.)
+         */
+        if (xpsr & XPSR_SPREALIGN) {
+            frameptr |=3D 4;
+        }
+        *frame_sp_p =3D frameptr;
+    }
+
+    xpsr_mask =3D ~(XPSR_SPREALIGN | XPSR_SFPA);
+    if (!arm_feature(env, ARM_FEATURE_THUMB_DSP)) {
+        xpsr_mask &=3D ~XPSR_GE;
+    }
+    /* This xpsr_write() will invalidate frame_sp_p as it may switch sta=
ck */
+    xpsr_write(env, xpsr, xpsr_mask);
+
+    if (env->v7m.secure) {
+        bool sfpa =3D xpsr & XPSR_SFPA;
+
+        env->v7m.control[M_REG_S] =3D FIELD_DP32(env->v7m.control[M_REG_=
S],
+                                               V7M_CONTROL, SFPA, sfpa);
+    }
+
+    /*
+     * The restored xPSR exception field will be zero if we're
+     * resuming in Thread mode. If that doesn't match what the
+     * exception return excret specified then this is a UsageFault.
+     * v7M requires we make this check here; v8M did it earlier.
+     */
+    if (return_to_handler !=3D arm_v7m_is_handler_mode(env)) {
+        /*
+         * Take an INVPC UsageFault by pushing the stack again;
+         * we know we're v7M so this is never a Secure UsageFault.
+         */
+        bool ignore_stackfaults;
+
+        assert(!arm_feature(env, ARM_FEATURE_V8));
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, false);
+        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MASK;
+        ignore_stackfaults =3D v7m_push_stack(cpu);
+        qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackfra=
me: "
+                      "failed exception return integrity check\n");
+        v7m_exception_taken(cpu, excret, false, ignore_stackfaults);
+        return;
+    }
+
+    /* Otherwise, we have a successful exception exit. */
+    arm_clear_exclusive(env);
+    qemu_log_mask(CPU_LOG_INT, "...successful exception return\n");
+}
+
+static bool do_v7m_function_return(ARMCPU *cpu)
+{
+    /*
+     * v8M security extensions magic function return.
+     * We may either:
+     *  (1) throw an exception (longjump)
+     *  (2) return true if we successfully handled the function return
+     *  (3) return false if we failed a consistency check and have
+     *      pended a UsageFault that needs to be taken now
+     *
+     * At this point the magic return value is split between env->regs[1=
5]
+     * and env->thumb. We don't bother to reconstitute it because we don=
't
+     * need it (all values are handled the same way).
+     */
+    CPUARMState *env =3D &cpu->env;
+    uint32_t newpc, newpsr, newpsr_exc;
+
+    qemu_log_mask(CPU_LOG_INT, "...really v7M secure function return\n")=
;
+
+    {
+        bool threadmode, spsel;
+        TCGMemOpIdx oi;
+        ARMMMUIdx mmu_idx;
+        uint32_t *frame_sp_p;
+        uint32_t frameptr;
+
+        /* Pull the return address and IPSR from the Secure stack */
+        threadmode =3D !arm_v7m_is_handler_mode(env);
+        spsel =3D env->v7m.control[M_REG_S] & R_V7M_CONTROL_SPSEL_MASK;
+
+        frame_sp_p =3D get_v7m_sp_ptr(env, true, threadmode, spsel);
+        frameptr =3D *frame_sp_p;
+
+        /*
+         * These loads may throw an exception (for MPU faults). We want =
to
+         * do them as secure, so work out what MMU index that is.
+         */
+        mmu_idx =3D arm_v7m_mmu_idx_for_secstate(env, true);
+        oi =3D make_memop_idx(MO_LE, arm_to_core_mmu_idx(mmu_idx));
+        newpc =3D helper_le_ldul_mmu(env, frameptr, oi, 0);
+        newpsr =3D helper_le_ldul_mmu(env, frameptr + 4, oi, 0);
+
+        /* Consistency checks on new IPSR */
+        newpsr_exc =3D newpsr & XPSR_EXCP;
+        if (!((env->v7m.exception =3D=3D 0 && newpsr_exc =3D=3D 0) ||
+              (env->v7m.exception =3D=3D 1 && newpsr_exc !=3D 0))) {
+            /* Pend the fault and tell our caller to take it */
+            env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVPC_MASK;
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                    env->v7m.secure);
+            qemu_log_mask(CPU_LOG_INT,
+                          "...taking INVPC UsageFault: "
+                          "IPSR consistency check failed\n");
+            return false;
+        }
+
+        *frame_sp_p =3D frameptr + 8;
+    }
+
+    /* This invalidates frame_sp_p */
+    switch_v7m_security_state(env, true);
+    env->v7m.exception =3D newpsr_exc;
+    env->v7m.control[M_REG_S] &=3D ~R_V7M_CONTROL_SFPA_MASK;
+    if (newpsr & XPSR_SFPA) {
+        env->v7m.control[M_REG_S] |=3D R_V7M_CONTROL_SFPA_MASK;
+    }
+    xpsr_write(env, 0, XPSR_IT);
+    env->thumb =3D newpc & 1;
+    env->regs[15] =3D newpc & ~1;
+
+    qemu_log_mask(CPU_LOG_INT, "...function return successful\n");
+    return true;
+}
+
+static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
+                               uint32_t addr, uint16_t *insn)
+{
+    /*
+     * Load a 16-bit portion of a v7M instruction, returning true on suc=
cess,
+     * or false on failure (in which case we will have pended the approp=
riate
+     * exception).
+     * We need to do the instruction fetch's MPU and SAU checks
+     * like this because there is no MMU index that would allow
+     * doing the load with a single function call. Instead we must
+     * first check that the security attributes permit the load
+     * and that they don't mismatch on the two halves of the instruction=
,
+     * and then we do the load as a secure load (ie using the security
+     * attributes of the address, not the CPU, as architecturally requir=
ed).
+     */
+    CPUState *cs =3D CPU(cpu);
+    CPUARMState *env =3D &cpu->env;
+    V8M_SAttributes sattrs =3D {};
+    MemTxAttrs attrs =3D {};
+    ARMMMUFaultInfo fi =3D {};
+    MemTxResult txres;
+    target_ulong page_size;
+    hwaddr physaddr;
+    int prot;
+
+    v8m_security_lookup(env, addr, MMU_INST_FETCH, mmu_idx, &sattrs);
+    if (!sattrs.nsc || sattrs.ns) {
+        /*
+         * This must be the second half of the insn, and it straddles a
+         * region boundary with the second half not being S&NSC.
+         */
+        env->v7m.sfsr |=3D R_V7M_SFSR_INVEP_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+        qemu_log_mask(CPU_LOG_INT,
+                      "...really SecureFault with SFSR.INVEP\n");
+        return false;
+    }
+    if (get_phys_addr(env, addr, MMU_INST_FETCH, mmu_idx,
+                      &physaddr, &attrs, &prot, &page_size, &fi, NULL)) =
{
+        /* the MPU lookup failed */
+        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_IACCVIOL_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.sec=
ure);
+        qemu_log_mask(CPU_LOG_INT, "...really MemManage with CFSR.IACCVI=
OL\n");
+        return false;
+    }
+    *insn =3D address_space_lduw_le(arm_addressspace(cs, attrs), physadd=
r,
+                                 attrs, &txres);
+    if (txres !=3D MEMTX_OK) {
+        env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_IBUSERR_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
+        qemu_log_mask(CPU_LOG_INT, "...really BusFault with CFSR.IBUSERR=
\n");
+        return false;
+    }
+    return true;
+}
+
+static bool v7m_handle_execute_nsc(ARMCPU *cpu)
+{
+    /*
+     * Check whether this attempt to execute code in a Secure & NS-Calla=
ble
+     * memory region is for an SG instruction; if so, then emulate the
+     * effect of the SG instruction and return true. Otherwise pend
+     * the correct kind of exception and return false.
+     */
+    CPUARMState *env =3D &cpu->env;
+    ARMMMUIdx mmu_idx;
+    uint16_t insn;
+
+    /*
+     * We should never get here unless get_phys_addr_pmsav8() caused
+     * an exception for NS executing in S&NSC memory.
+     */
+    assert(!env->v7m.secure);
+    assert(arm_feature(env, ARM_FEATURE_M_SECURITY));
+
+    /* We want to do the MPU lookup as secure; work out what mmu_idx tha=
t is */
+    mmu_idx =3D arm_v7m_mmu_idx_for_secstate(env, true);
+
+    if (!v7m_read_half_insn(cpu, mmu_idx, env->regs[15], &insn)) {
+        return false;
+    }
+
+    if (!env->thumb) {
+        goto gen_invep;
+    }
+
+    if (insn !=3D 0xe97f) {
+        /*
+         * Not an SG instruction first half (we choose the IMPDEF
+         * early-SG-check option).
+         */
+        goto gen_invep;
+    }
+
+    if (!v7m_read_half_insn(cpu, mmu_idx, env->regs[15] + 2, &insn)) {
+        return false;
+    }
+
+    if (insn !=3D 0xe97f) {
+        /*
+         * Not an SG instruction second half (yes, both halves of the SG
+         * insn have the same hex value)
+         */
+        goto gen_invep;
+    }
+
+    /*
+     * OK, we have confirmed that we really have an SG instruction.
+     * We know we're NS in S memory so don't need to repeat those checks=
.
+     */
+    qemu_log_mask(CPU_LOG_INT, "...really an SG instruction at 0x%08" PR=
Ix32
+                  ", executing it\n", env->regs[15]);
+    env->regs[14] &=3D ~1;
+    env->v7m.control[M_REG_S] &=3D ~R_V7M_CONTROL_SFPA_MASK;
+    switch_v7m_security_state(env, true);
+    xpsr_write(env, 0, XPSR_IT);
+    env->regs[15] +=3D 4;
+    return true;
+
+gen_invep:
+    env->v7m.sfsr |=3D R_V7M_SFSR_INVEP_MASK;
+    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+    qemu_log_mask(CPU_LOG_INT,
+                  "...really SecureFault with SFSR.INVEP\n");
+    return false;
+}
+
+void arm_v7m_cpu_do_interrupt(CPUState *cs)
+{
+    ARMCPU *cpu =3D ARM_CPU(cs);
+    CPUARMState *env =3D &cpu->env;
+    uint32_t lr;
+    bool ignore_stackfaults;
+
+    arm_log_exception(cs->exception_index);
+
+    /*
+     * For exceptions we just mark as pending on the NVIC, and let that
+     * handle it.
+     */
+    switch (cs->exception_index) {
+    case EXCP_UDEF:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
+        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_UNDEFINSTR_MASK;
+        break;
+    case EXCP_NOCP:
+    {
+        /*
+         * NOCP might be directed to something other than the current
+         * security state if this fault is because of NSACR; we indicate
+         * the target security state using exception.target_el.
+         */
+        int target_secstate;
+
+        if (env->exception.target_el =3D=3D 3) {
+            target_secstate =3D M_REG_S;
+        } else {
+            target_secstate =3D env->v7m.secure;
+        }
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, target_sec=
state);
+        env->v7m.cfsr[target_secstate] |=3D R_V7M_CFSR_NOCP_MASK;
+        break;
+    }
+    case EXCP_INVSTATE:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
+        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_INVSTATE_MASK;
+        break;
+    case EXCP_STKOF:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
+        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_STKOF_MASK;
+        break;
+    case EXCP_LSERR:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+        env->v7m.sfsr |=3D R_V7M_SFSR_LSERR_MASK;
+        break;
+    case EXCP_UNALIGNED:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.s=
ecure);
+        env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_UNALIGNED_MASK;
+        break;
+    case EXCP_SWI:
+        /* The PC already points to the next instruction.  */
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC, env->v7m.sec=
ure);
+        break;
+    case EXCP_PREFETCH_ABORT:
+    case EXCP_DATA_ABORT:
+        /*
+         * Note that for M profile we don't have a guest facing FSR, but
+         * the env->exception.fsr will be populated by the code that
+         * raises the fault, in the A profile short-descriptor format.
+         */
+        switch (env->exception.fsr & 0xf) {
+        case M_FAKE_FSR_NSC_EXEC:
+            /*
+             * Exception generated when we try to execute code at an add=
ress
+             * which is marked as Secure & Non-Secure Callable and the C=
PU
+             * is in the Non-Secure state. The only instruction which ca=
n
+             * be executed like this is SG (and that only if both halves=
 of
+             * the SG instruction have the same security attributes.)
+             * Everything else must generate an INVEP SecureFault, so we
+             * emulate the SG instruction here.
+             */
+            if (v7m_handle_execute_nsc(cpu)) {
+                return;
+            }
+            break;
+        case M_FAKE_FSR_SFAULT:
+            /*
+             * Various flavours of SecureFault for attempts to execute o=
r
+             * access data in the wrong security state.
+             */
+            switch (cs->exception_index) {
+            case EXCP_PREFETCH_ABORT:
+                if (env->v7m.secure) {
+                    env->v7m.sfsr |=3D R_V7M_SFSR_INVTRAN_MASK;
+                    qemu_log_mask(CPU_LOG_INT,
+                                  "...really SecureFault with SFSR.INVTR=
AN\n");
+                } else {
+                    env->v7m.sfsr |=3D R_V7M_SFSR_INVEP_MASK;
+                    qemu_log_mask(CPU_LOG_INT,
+                                  "...really SecureFault with SFSR.INVEP=
\n");
+                }
+                break;
+            case EXCP_DATA_ABORT:
+                /* This must be an NS access to S memory */
+                env->v7m.sfsr |=3D R_V7M_SFSR_AUVIOL_MASK;
+                qemu_log_mask(CPU_LOG_INT,
+                              "...really SecureFault with SFSR.AUVIOL\n"=
);
+                break;
+            }
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false=
);
+            break;
+        case 0x8: /* External Abort */
+            switch (cs->exception_index) {
+            case EXCP_PREFETCH_ABORT:
+                env->v7m.cfsr[M_REG_NS] |=3D R_V7M_CFSR_IBUSERR_MASK;
+                qemu_log_mask(CPU_LOG_INT, "...with CFSR.IBUSERR\n");
+                break;
+            case EXCP_DATA_ABORT:
+                env->v7m.cfsr[M_REG_NS] |=3D
+                    (R_V7M_CFSR_PRECISERR_MASK | R_V7M_CFSR_BFARVALID_MA=
SK);
+                env->v7m.bfar =3D env->exception.vaddress;
+                qemu_log_mask(CPU_LOG_INT,
+                              "...with CFSR.PRECISERR and BFAR 0x%x\n",
+                              env->v7m.bfar);
+                break;
+            }
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
+            break;
+        default:
+            /*
+             * All other FSR values are either MPU faults or "can't happ=
en
+             * for M profile" cases.
+             */
+            switch (cs->exception_index) {
+            case EXCP_PREFETCH_ABORT:
+                env->v7m.cfsr[env->v7m.secure] |=3D R_V7M_CFSR_IACCVIOL_=
MASK;
+                qemu_log_mask(CPU_LOG_INT, "...with CFSR.IACCVIOL\n");
+                break;
+            case EXCP_DATA_ABORT:
+                env->v7m.cfsr[env->v7m.secure] |=3D
+                    (R_V7M_CFSR_DACCVIOL_MASK | R_V7M_CFSR_MMARVALID_MAS=
K);
+                env->v7m.mmfar[env->v7m.secure] =3D env->exception.vaddr=
ess;
+                qemu_log_mask(CPU_LOG_INT,
+                              "...with CFSR.DACCVIOL and MMFAR 0x%x\n",
+                              env->v7m.mmfar[env->v7m.secure]);
+                break;
+            }
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM,
+                                    env->v7m.secure);
+            break;
+        }
+        break;
+    case EXCP_BKPT:
+        if (semihosting_enabled()) {
+            int nr;
+            nr =3D arm_lduw_code(env, env->regs[15], arm_sctlr_b(env)) &=
 0xff;
+            if (nr =3D=3D 0xab) {
+                env->regs[15] +=3D 2;
+                qemu_log_mask(CPU_LOG_INT,
+                              "...handling as semihosting call 0x%x\n",
+                              env->regs[0]);
+                env->regs[0] =3D do_arm_semihosting(env);
+                return;
+            }
+        }
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG, false);
+        break;
+    case EXCP_IRQ:
+        break;
+    case EXCP_EXCEPTION_EXIT:
+        if (env->regs[15] < EXC_RETURN_MIN_MAGIC) {
+            /* Must be v8M security extension function return */
+            assert(env->regs[15] >=3D FNC_RETURN_MIN_MAGIC);
+            assert(arm_feature(env, ARM_FEATURE_M_SECURITY));
+            if (do_v7m_function_return(cpu)) {
+                return;
+            }
+        } else {
+            do_v7m_exception_exit(cpu);
+            return;
+        }
+        break;
+    case EXCP_LAZYFP:
+        /*
+         * We already pended the specific exception in the NVIC in the
+         * v7m_preserve_fp_state() helper function.
+         */
+        break;
+    default:
+        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index)=
;
+        return; /* Never happens.  Keep compiler happy.  */
+    }
+
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        lr =3D R_V7M_EXCRET_RES1_MASK |
+            R_V7M_EXCRET_DCRS_MASK;
+        /*
+         * The S bit indicates whether we should return to Secure
+         * or NonSecure (ie our current state).
+         * The ES bit indicates whether we're taking this exception
+         * to Secure or NonSecure (ie our target state). We set it
+         * later, in v7m_exception_taken().
+         * The SPSEL bit is also set in v7m_exception_taken() for v8M.
+         * This corresponds to the ARM ARM pseudocode for v8M setting
+         * some LR bits in PushStack() and some in ExceptionTaken();
+         * the distinction matters for the tailchain cases where we
+         * can take an exception without pushing the stack.
+         */
+        if (env->v7m.secure) {
+            lr |=3D R_V7M_EXCRET_S_MASK;
+        }
+        if (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK)) {
+            lr |=3D R_V7M_EXCRET_FTYPE_MASK;
+        }
+    } else {
+        lr =3D R_V7M_EXCRET_RES1_MASK |
+            R_V7M_EXCRET_S_MASK |
+            R_V7M_EXCRET_DCRS_MASK |
+            R_V7M_EXCRET_FTYPE_MASK |
+            R_V7M_EXCRET_ES_MASK;
+        if (env->v7m.control[M_REG_NS] & R_V7M_CONTROL_SPSEL_MASK) {
+            lr |=3D R_V7M_EXCRET_SPSEL_MASK;
+        }
+    }
+    if (!arm_v7m_is_handler_mode(env)) {
+        lr |=3D R_V7M_EXCRET_MODE_MASK;
+    }
+
+    ignore_stackfaults =3D v7m_push_stack(cpu);
+    v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
+}
+
 #endif /* CONFIG_USER_ONLY */
--=20
2.20.1


