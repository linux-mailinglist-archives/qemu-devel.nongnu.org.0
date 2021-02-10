Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D9316A42
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:33:42 +0100 (CET)
Received: from localhost ([::1]:34286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rUr-0000PW-Ac
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQj-00045E-9z
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:54594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l9rQc-0008WP-Sf
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:29:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43C86B130;
 Wed, 10 Feb 2021 15:29:07 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC v17 11/14] i386: split misc helper into user and softmmu parts
Date: Wed, 10 Feb 2021 16:28:56 +0100
Message-Id: <20210210152859.25920-12-cfontana@suse.de>
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
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 target/i386/tcg/misc_helper.c                 | 460 ------------------
 target/i386/tcg/softmmu/misc_helper_softmmu.c | 439 +++++++++++++++++
 target/i386/tcg/user/misc_helper_user.c       |  77 +++
 target/i386/tcg/softmmu/meson.build           |   1 +
 target/i386/tcg/user/meson.build              |   1 +
 5 files changed, 518 insertions(+), 460 deletions(-)
 create mode 100644 target/i386/tcg/softmmu/misc_helper_softmmu.c
 create mode 100644 target/i386/tcg/user/misc_helper_user.c

diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index f02e4fd400..1cd1a9967c 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -39,69 +39,6 @@ void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask)
         (eflags & update_mask) | 0x2;
 }
 
-void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
-{
-#ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "outb: port=0x%04x, data=%02x\n", port, data);
-#else
-    address_space_stb(&address_space_io, port, data,
-                      cpu_get_mem_attrs(env), NULL);
-#endif
-}
-
-target_ulong helper_inb(CPUX86State *env, uint32_t port)
-{
-#ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "inb: port=0x%04x\n", port);
-    return 0;
-#else
-    return address_space_ldub(&address_space_io, port,
-                              cpu_get_mem_attrs(env), NULL);
-#endif
-}
-
-void helper_outw(CPUX86State *env, uint32_t port, uint32_t data)
-{
-#ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "outw: port=0x%04x, data=%04x\n", port, data);
-#else
-    address_space_stw(&address_space_io, port, data,
-                      cpu_get_mem_attrs(env), NULL);
-#endif
-}
-
-target_ulong helper_inw(CPUX86State *env, uint32_t port)
-{
-#ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "inw: port=0x%04x\n", port);
-    return 0;
-#else
-    return address_space_lduw(&address_space_io, port,
-                              cpu_get_mem_attrs(env), NULL);
-#endif
-}
-
-void helper_outl(CPUX86State *env, uint32_t port, uint32_t data)
-{
-#ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "outl: port=0x%04x, data=%08x\n", port, data);
-#else
-    address_space_stl(&address_space_io, port, data,
-                      cpu_get_mem_attrs(env), NULL);
-#endif
-}
-
-target_ulong helper_inl(CPUX86State *env, uint32_t port)
-{
-#ifdef CONFIG_USER_ONLY
-    fprintf(stderr, "inl: port=0x%04x\n", port);
-    return 0;
-#else
-    return address_space_ldl(&address_space_io, port,
-                             cpu_get_mem_attrs(env), NULL);
-#endif
-}
-
 void helper_into(CPUX86State *env, int next_eip_addend)
 {
     int eflags;
@@ -126,64 +63,6 @@ void helper_cpuid(CPUX86State *env)
     env->regs[R_EDX] = edx;
 }
 
-#if defined(CONFIG_USER_ONLY)
-target_ulong helper_read_crN(CPUX86State *env, int reg)
-{
-    return 0;
-}
-
-void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
-{
-}
-#else
-target_ulong helper_read_crN(CPUX86State *env, int reg)
-{
-    target_ulong val;
-
-    cpu_svm_check_intercept_param(env, SVM_EXIT_READ_CR0 + reg, 0, GETPC());
-    switch (reg) {
-    default:
-        val = env->cr[reg];
-        break;
-    case 8:
-        if (!(env->hflags2 & HF2_VINTR_MASK)) {
-            val = cpu_get_apic_tpr(env_archcpu(env)->apic_state);
-        } else {
-            val = env->v_tpr;
-        }
-        break;
-    }
-    return val;
-}
-
-void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
-{
-    cpu_svm_check_intercept_param(env, SVM_EXIT_WRITE_CR0 + reg, 0, GETPC());
-    switch (reg) {
-    case 0:
-        cpu_x86_update_cr0(env, t0);
-        break;
-    case 3:
-        cpu_x86_update_cr3(env, t0);
-        break;
-    case 4:
-        cpu_x86_update_cr4(env, t0);
-        break;
-    case 8:
-        if (!(env->hflags2 & HF2_VINTR_MASK)) {
-            qemu_mutex_lock_iothread();
-            cpu_set_apic_tpr(env_archcpu(env)->apic_state, t0);
-            qemu_mutex_unlock_iothread();
-        }
-        env->v_tpr = t0 & 0x0f;
-        break;
-    default:
-        env->cr[reg] = t0;
-        break;
-    }
-}
-#endif
-
 void helper_lmsw(CPUX86State *env, target_ulong t0)
 {
     /* only 4 lower bits of CR0 are modified. PE cannot be set to zero
@@ -232,345 +111,6 @@ void helper_rdpmc(CPUX86State *env)
     raise_exception_err(env, EXCP06_ILLOP, 0);
 }
 
-#if defined(CONFIG_USER_ONLY)
-void helper_wrmsr(CPUX86State *env)
-{
-}
-
-void helper_rdmsr(CPUX86State *env)
-{
-}
-#else
-void helper_wrmsr(CPUX86State *env)
-{
-    uint64_t val;
-    CPUState *cs = env_cpu(env);
-
-    cpu_svm_check_intercept_param(env, SVM_EXIT_MSR, 1, GETPC());
-
-    val = ((uint32_t)env->regs[R_EAX]) |
-        ((uint64_t)((uint32_t)env->regs[R_EDX]) << 32);
-
-    switch ((uint32_t)env->regs[R_ECX]) {
-    case MSR_IA32_SYSENTER_CS:
-        env->sysenter_cs = val & 0xffff;
-        break;
-    case MSR_IA32_SYSENTER_ESP:
-        env->sysenter_esp = val;
-        break;
-    case MSR_IA32_SYSENTER_EIP:
-        env->sysenter_eip = val;
-        break;
-    case MSR_IA32_APICBASE:
-        cpu_set_apic_base(env_archcpu(env)->apic_state, val);
-        break;
-    case MSR_EFER:
-        {
-            uint64_t update_mask;
-
-            update_mask = 0;
-            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_SYSCALL) {
-                update_mask |= MSR_EFER_SCE;
-            }
-            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
-                update_mask |= MSR_EFER_LME;
-            }
-            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_FFXSR) {
-                update_mask |= MSR_EFER_FFXSR;
-            }
-            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_NX) {
-                update_mask |= MSR_EFER_NXE;
-            }
-            if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
-                update_mask |= MSR_EFER_SVME;
-            }
-            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_FFXSR) {
-                update_mask |= MSR_EFER_FFXSR;
-            }
-            cpu_load_efer(env, (env->efer & ~update_mask) |
-                          (val & update_mask));
-        }
-        break;
-    case MSR_STAR:
-        env->star = val;
-        break;
-    case MSR_PAT:
-        env->pat = val;
-        break;
-    case MSR_IA32_PKRS:
-        if (val & 0xFFFFFFFF00000000ull) {
-            goto error;
-        }
-        env->pkrs = val;
-        tlb_flush(cs);
-        break;
-    case MSR_VM_HSAVE_PA:
-        env->vm_hsave = val;
-        break;
-#ifdef TARGET_X86_64
-    case MSR_LSTAR:
-        env->lstar = val;
-        break;
-    case MSR_CSTAR:
-        env->cstar = val;
-        break;
-    case MSR_FMASK:
-        env->fmask = val;
-        break;
-    case MSR_FSBASE:
-        env->segs[R_FS].base = val;
-        break;
-    case MSR_GSBASE:
-        env->segs[R_GS].base = val;
-        break;
-    case MSR_KERNELGSBASE:
-        env->kernelgsbase = val;
-        break;
-#endif
-    case MSR_MTRRphysBase(0):
-    case MSR_MTRRphysBase(1):
-    case MSR_MTRRphysBase(2):
-    case MSR_MTRRphysBase(3):
-    case MSR_MTRRphysBase(4):
-    case MSR_MTRRphysBase(5):
-    case MSR_MTRRphysBase(6):
-    case MSR_MTRRphysBase(7):
-        env->mtrr_var[((uint32_t)env->regs[R_ECX] -
-                       MSR_MTRRphysBase(0)) / 2].base = val;
-        break;
-    case MSR_MTRRphysMask(0):
-    case MSR_MTRRphysMask(1):
-    case MSR_MTRRphysMask(2):
-    case MSR_MTRRphysMask(3):
-    case MSR_MTRRphysMask(4):
-    case MSR_MTRRphysMask(5):
-    case MSR_MTRRphysMask(6):
-    case MSR_MTRRphysMask(7):
-        env->mtrr_var[((uint32_t)env->regs[R_ECX] -
-                       MSR_MTRRphysMask(0)) / 2].mask = val;
-        break;
-    case MSR_MTRRfix64K_00000:
-        env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
-                        MSR_MTRRfix64K_00000] = val;
-        break;
-    case MSR_MTRRfix16K_80000:
-    case MSR_MTRRfix16K_A0000:
-        env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
-                        MSR_MTRRfix16K_80000 + 1] = val;
-        break;
-    case MSR_MTRRfix4K_C0000:
-    case MSR_MTRRfix4K_C8000:
-    case MSR_MTRRfix4K_D0000:
-    case MSR_MTRRfix4K_D8000:
-    case MSR_MTRRfix4K_E0000:
-    case MSR_MTRRfix4K_E8000:
-    case MSR_MTRRfix4K_F0000:
-    case MSR_MTRRfix4K_F8000:
-        env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
-                        MSR_MTRRfix4K_C0000 + 3] = val;
-        break;
-    case MSR_MTRRdefType:
-        env->mtrr_deftype = val;
-        break;
-    case MSR_MCG_STATUS:
-        env->mcg_status = val;
-        break;
-    case MSR_MCG_CTL:
-        if ((env->mcg_cap & MCG_CTL_P)
-            && (val == 0 || val == ~(uint64_t)0)) {
-            env->mcg_ctl = val;
-        }
-        break;
-    case MSR_TSC_AUX:
-        env->tsc_aux = val;
-        break;
-    case MSR_IA32_MISC_ENABLE:
-        env->msr_ia32_misc_enable = val;
-        break;
-    case MSR_IA32_BNDCFGS:
-        /* FIXME: #GP if reserved bits are set.  */
-        /* FIXME: Extend highest implemented bit of linear address.  */
-        env->msr_bndcfgs = val;
-        cpu_sync_bndcs_hflags(env);
-        break;
-    default:
-        if ((uint32_t)env->regs[R_ECX] >= MSR_MC0_CTL
-            && (uint32_t)env->regs[R_ECX] < MSR_MC0_CTL +
-            (4 * env->mcg_cap & 0xff)) {
-            uint32_t offset = (uint32_t)env->regs[R_ECX] - MSR_MC0_CTL;
-            if ((offset & 0x3) != 0
-                || (val == 0 || val == ~(uint64_t)0)) {
-                env->mce_banks[offset] = val;
-            }
-            break;
-        }
-        /* XXX: exception? */
-        break;
-    }
-    return;
-error:
-    raise_exception_err_ra(env, EXCP0D_GPF, 0, GETPC());
-}
-
-void helper_rdmsr(CPUX86State *env)
-{
-    X86CPU *x86_cpu = env_archcpu(env);
-    uint64_t val;
-
-    cpu_svm_check_intercept_param(env, SVM_EXIT_MSR, 0, GETPC());
-
-    switch ((uint32_t)env->regs[R_ECX]) {
-    case MSR_IA32_SYSENTER_CS:
-        val = env->sysenter_cs;
-        break;
-    case MSR_IA32_SYSENTER_ESP:
-        val = env->sysenter_esp;
-        break;
-    case MSR_IA32_SYSENTER_EIP:
-        val = env->sysenter_eip;
-        break;
-    case MSR_IA32_APICBASE:
-        val = cpu_get_apic_base(env_archcpu(env)->apic_state);
-        break;
-    case MSR_EFER:
-        val = env->efer;
-        break;
-    case MSR_STAR:
-        val = env->star;
-        break;
-    case MSR_PAT:
-        val = env->pat;
-        break;
-    case MSR_IA32_PKRS:
-        val = env->pkrs;
-        break;
-    case MSR_VM_HSAVE_PA:
-        val = env->vm_hsave;
-        break;
-    case MSR_IA32_PERF_STATUS:
-        /* tsc_increment_by_tick */
-        val = 1000ULL;
-        /* CPU multiplier */
-        val |= (((uint64_t)4ULL) << 40);
-        break;
-#ifdef TARGET_X86_64
-    case MSR_LSTAR:
-        val = env->lstar;
-        break;
-    case MSR_CSTAR:
-        val = env->cstar;
-        break;
-    case MSR_FMASK:
-        val = env->fmask;
-        break;
-    case MSR_FSBASE:
-        val = env->segs[R_FS].base;
-        break;
-    case MSR_GSBASE:
-        val = env->segs[R_GS].base;
-        break;
-    case MSR_KERNELGSBASE:
-        val = env->kernelgsbase;
-        break;
-    case MSR_TSC_AUX:
-        val = env->tsc_aux;
-        break;
-#endif
-    case MSR_SMI_COUNT:
-        val = env->msr_smi_count;
-        break;
-    case MSR_MTRRphysBase(0):
-    case MSR_MTRRphysBase(1):
-    case MSR_MTRRphysBase(2):
-    case MSR_MTRRphysBase(3):
-    case MSR_MTRRphysBase(4):
-    case MSR_MTRRphysBase(5):
-    case MSR_MTRRphysBase(6):
-    case MSR_MTRRphysBase(7):
-        val = env->mtrr_var[((uint32_t)env->regs[R_ECX] -
-                             MSR_MTRRphysBase(0)) / 2].base;
-        break;
-    case MSR_MTRRphysMask(0):
-    case MSR_MTRRphysMask(1):
-    case MSR_MTRRphysMask(2):
-    case MSR_MTRRphysMask(3):
-    case MSR_MTRRphysMask(4):
-    case MSR_MTRRphysMask(5):
-    case MSR_MTRRphysMask(6):
-    case MSR_MTRRphysMask(7):
-        val = env->mtrr_var[((uint32_t)env->regs[R_ECX] -
-                             MSR_MTRRphysMask(0)) / 2].mask;
-        break;
-    case MSR_MTRRfix64K_00000:
-        val = env->mtrr_fixed[0];
-        break;
-    case MSR_MTRRfix16K_80000:
-    case MSR_MTRRfix16K_A0000:
-        val = env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
-                              MSR_MTRRfix16K_80000 + 1];
-        break;
-    case MSR_MTRRfix4K_C0000:
-    case MSR_MTRRfix4K_C8000:
-    case MSR_MTRRfix4K_D0000:
-    case MSR_MTRRfix4K_D8000:
-    case MSR_MTRRfix4K_E0000:
-    case MSR_MTRRfix4K_E8000:
-    case MSR_MTRRfix4K_F0000:
-    case MSR_MTRRfix4K_F8000:
-        val = env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
-                              MSR_MTRRfix4K_C0000 + 3];
-        break;
-    case MSR_MTRRdefType:
-        val = env->mtrr_deftype;
-        break;
-    case MSR_MTRRcap:
-        if (env->features[FEAT_1_EDX] & CPUID_MTRR) {
-            val = MSR_MTRRcap_VCNT | MSR_MTRRcap_FIXRANGE_SUPPORT |
-                MSR_MTRRcap_WC_SUPPORTED;
-        } else {
-            /* XXX: exception? */
-            val = 0;
-        }
-        break;
-    case MSR_MCG_CAP:
-        val = env->mcg_cap;
-        break;
-    case MSR_MCG_CTL:
-        if (env->mcg_cap & MCG_CTL_P) {
-            val = env->mcg_ctl;
-        } else {
-            val = 0;
-        }
-        break;
-    case MSR_MCG_STATUS:
-        val = env->mcg_status;
-        break;
-    case MSR_IA32_MISC_ENABLE:
-        val = env->msr_ia32_misc_enable;
-        break;
-    case MSR_IA32_BNDCFGS:
-        val = env->msr_bndcfgs;
-        break;
-     case MSR_IA32_UCODE_REV:
-        val = x86_cpu->ucode_rev;
-        break;
-    default:
-        if ((uint32_t)env->regs[R_ECX] >= MSR_MC0_CTL
-            && (uint32_t)env->regs[R_ECX] < MSR_MC0_CTL +
-            (4 * env->mcg_cap & 0xff)) {
-            uint32_t offset = (uint32_t)env->regs[R_ECX] - MSR_MC0_CTL;
-            val = env->mce_banks[offset];
-            break;
-        }
-        /* XXX: exception? */
-        val = 0;
-        break;
-    }
-    env->regs[R_EAX] = (uint32_t)(val);
-    env->regs[R_EDX] = (uint32_t)(val >> 32);
-}
-#endif
-
 static void do_pause(X86CPU *cpu)
 {
     CPUState *cs = CPU(cpu);
diff --git a/target/i386/tcg/softmmu/misc_helper_softmmu.c b/target/i386/tcg/softmmu/misc_helper_softmmu.c
new file mode 100644
index 0000000000..29349c3b30
--- /dev/null
+++ b/target/i386/tcg/softmmu/misc_helper_softmmu.c
@@ -0,0 +1,439 @@
+/*
+ *  x86 misc helpers - softmmu-only
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
+#include "qemu/main-loop.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/address-spaces.h"
+#include "tcg/helper-tcg.h"
+
+void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
+{
+    address_space_stb(&address_space_io, port, data,
+                      cpu_get_mem_attrs(env), NULL);
+}
+
+target_ulong helper_inb(CPUX86State *env, uint32_t port)
+{
+    return address_space_ldub(&address_space_io, port,
+                              cpu_get_mem_attrs(env), NULL);
+}
+
+void helper_outw(CPUX86State *env, uint32_t port, uint32_t data)
+{
+    address_space_stw(&address_space_io, port, data,
+                      cpu_get_mem_attrs(env), NULL);
+}
+
+target_ulong helper_inw(CPUX86State *env, uint32_t port)
+{
+    return address_space_lduw(&address_space_io, port,
+                              cpu_get_mem_attrs(env), NULL);
+}
+
+void helper_outl(CPUX86State *env, uint32_t port, uint32_t data)
+{
+    address_space_stl(&address_space_io, port, data,
+                      cpu_get_mem_attrs(env), NULL);
+}
+
+target_ulong helper_inl(CPUX86State *env, uint32_t port)
+{
+    return address_space_ldl(&address_space_io, port,
+                             cpu_get_mem_attrs(env), NULL);
+}
+
+target_ulong helper_read_crN(CPUX86State *env, int reg)
+{
+    target_ulong val;
+
+    cpu_svm_check_intercept_param(env, SVM_EXIT_READ_CR0 + reg, 0, GETPC());
+    switch (reg) {
+    default:
+        val = env->cr[reg];
+        break;
+    case 8:
+        if (!(env->hflags2 & HF2_VINTR_MASK)) {
+            val = cpu_get_apic_tpr(env_archcpu(env)->apic_state);
+        } else {
+            val = env->v_tpr;
+        }
+        break;
+    }
+    return val;
+}
+
+void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
+{
+    cpu_svm_check_intercept_param(env, SVM_EXIT_WRITE_CR0 + reg, 0, GETPC());
+    switch (reg) {
+    case 0:
+        cpu_x86_update_cr0(env, t0);
+        break;
+    case 3:
+        cpu_x86_update_cr3(env, t0);
+        break;
+    case 4:
+        cpu_x86_update_cr4(env, t0);
+        break;
+    case 8:
+        if (!(env->hflags2 & HF2_VINTR_MASK)) {
+            qemu_mutex_lock_iothread();
+            cpu_set_apic_tpr(env_archcpu(env)->apic_state, t0);
+            qemu_mutex_unlock_iothread();
+        }
+        env->v_tpr = t0 & 0x0f;
+        break;
+    default:
+        env->cr[reg] = t0;
+        break;
+    }
+}
+
+void helper_wrmsr(CPUX86State *env)
+{
+    uint64_t val;
+    CPUState *cs = env_cpu(env);
+
+    cpu_svm_check_intercept_param(env, SVM_EXIT_MSR, 1, GETPC());
+
+    val = ((uint32_t)env->regs[R_EAX]) |
+        ((uint64_t)((uint32_t)env->regs[R_EDX]) << 32);
+
+    switch ((uint32_t)env->regs[R_ECX]) {
+    case MSR_IA32_SYSENTER_CS:
+        env->sysenter_cs = val & 0xffff;
+        break;
+    case MSR_IA32_SYSENTER_ESP:
+        env->sysenter_esp = val;
+        break;
+    case MSR_IA32_SYSENTER_EIP:
+        env->sysenter_eip = val;
+        break;
+    case MSR_IA32_APICBASE:
+        cpu_set_apic_base(env_archcpu(env)->apic_state, val);
+        break;
+    case MSR_EFER:
+        {
+            uint64_t update_mask;
+
+            update_mask = 0;
+            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_SYSCALL) {
+                update_mask |= MSR_EFER_SCE;
+            }
+            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
+                update_mask |= MSR_EFER_LME;
+            }
+            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_FFXSR) {
+                update_mask |= MSR_EFER_FFXSR;
+            }
+            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_NX) {
+                update_mask |= MSR_EFER_NXE;
+            }
+            if (env->features[FEAT_8000_0001_ECX] & CPUID_EXT3_SVM) {
+                update_mask |= MSR_EFER_SVME;
+            }
+            if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_FFXSR) {
+                update_mask |= MSR_EFER_FFXSR;
+            }
+            cpu_load_efer(env, (env->efer & ~update_mask) |
+                          (val & update_mask));
+        }
+        break;
+    case MSR_STAR:
+        env->star = val;
+        break;
+    case MSR_PAT:
+        env->pat = val;
+        break;
+    case MSR_IA32_PKRS:
+        if (val & 0xFFFFFFFF00000000ull) {
+            goto error;
+        }
+        env->pkrs = val;
+        tlb_flush(cs);
+        break;
+    case MSR_VM_HSAVE_PA:
+        env->vm_hsave = val;
+        break;
+#ifdef TARGET_X86_64
+    case MSR_LSTAR:
+        env->lstar = val;
+        break;
+    case MSR_CSTAR:
+        env->cstar = val;
+        break;
+    case MSR_FMASK:
+        env->fmask = val;
+        break;
+    case MSR_FSBASE:
+        env->segs[R_FS].base = val;
+        break;
+    case MSR_GSBASE:
+        env->segs[R_GS].base = val;
+        break;
+    case MSR_KERNELGSBASE:
+        env->kernelgsbase = val;
+        break;
+#endif
+    case MSR_MTRRphysBase(0):
+    case MSR_MTRRphysBase(1):
+    case MSR_MTRRphysBase(2):
+    case MSR_MTRRphysBase(3):
+    case MSR_MTRRphysBase(4):
+    case MSR_MTRRphysBase(5):
+    case MSR_MTRRphysBase(6):
+    case MSR_MTRRphysBase(7):
+        env->mtrr_var[((uint32_t)env->regs[R_ECX] -
+                       MSR_MTRRphysBase(0)) / 2].base = val;
+        break;
+    case MSR_MTRRphysMask(0):
+    case MSR_MTRRphysMask(1):
+    case MSR_MTRRphysMask(2):
+    case MSR_MTRRphysMask(3):
+    case MSR_MTRRphysMask(4):
+    case MSR_MTRRphysMask(5):
+    case MSR_MTRRphysMask(6):
+    case MSR_MTRRphysMask(7):
+        env->mtrr_var[((uint32_t)env->regs[R_ECX] -
+                       MSR_MTRRphysMask(0)) / 2].mask = val;
+        break;
+    case MSR_MTRRfix64K_00000:
+        env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
+                        MSR_MTRRfix64K_00000] = val;
+        break;
+    case MSR_MTRRfix16K_80000:
+    case MSR_MTRRfix16K_A0000:
+        env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
+                        MSR_MTRRfix16K_80000 + 1] = val;
+        break;
+    case MSR_MTRRfix4K_C0000:
+    case MSR_MTRRfix4K_C8000:
+    case MSR_MTRRfix4K_D0000:
+    case MSR_MTRRfix4K_D8000:
+    case MSR_MTRRfix4K_E0000:
+    case MSR_MTRRfix4K_E8000:
+    case MSR_MTRRfix4K_F0000:
+    case MSR_MTRRfix4K_F8000:
+        env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
+                        MSR_MTRRfix4K_C0000 + 3] = val;
+        break;
+    case MSR_MTRRdefType:
+        env->mtrr_deftype = val;
+        break;
+    case MSR_MCG_STATUS:
+        env->mcg_status = val;
+        break;
+    case MSR_MCG_CTL:
+        if ((env->mcg_cap & MCG_CTL_P)
+            && (val == 0 || val == ~(uint64_t)0)) {
+            env->mcg_ctl = val;
+        }
+        break;
+    case MSR_TSC_AUX:
+        env->tsc_aux = val;
+        break;
+    case MSR_IA32_MISC_ENABLE:
+        env->msr_ia32_misc_enable = val;
+        break;
+    case MSR_IA32_BNDCFGS:
+        /* FIXME: #GP if reserved bits are set.  */
+        /* FIXME: Extend highest implemented bit of linear address.  */
+        env->msr_bndcfgs = val;
+        cpu_sync_bndcs_hflags(env);
+        break;
+    default:
+        if ((uint32_t)env->regs[R_ECX] >= MSR_MC0_CTL
+            && (uint32_t)env->regs[R_ECX] < MSR_MC0_CTL +
+            (4 * env->mcg_cap & 0xff)) {
+            uint32_t offset = (uint32_t)env->regs[R_ECX] - MSR_MC0_CTL;
+            if ((offset & 0x3) != 0
+                || (val == 0 || val == ~(uint64_t)0)) {
+                env->mce_banks[offset] = val;
+            }
+            break;
+        }
+        /* XXX: exception? */
+        break;
+    }
+    return;
+error:
+    raise_exception_err_ra(env, EXCP0D_GPF, 0, GETPC());
+}
+
+void helper_rdmsr(CPUX86State *env)
+{
+    X86CPU *x86_cpu = env_archcpu(env);
+    uint64_t val;
+
+    cpu_svm_check_intercept_param(env, SVM_EXIT_MSR, 0, GETPC());
+
+    switch ((uint32_t)env->regs[R_ECX]) {
+    case MSR_IA32_SYSENTER_CS:
+        val = env->sysenter_cs;
+        break;
+    case MSR_IA32_SYSENTER_ESP:
+        val = env->sysenter_esp;
+        break;
+    case MSR_IA32_SYSENTER_EIP:
+        val = env->sysenter_eip;
+        break;
+    case MSR_IA32_APICBASE:
+        val = cpu_get_apic_base(env_archcpu(env)->apic_state);
+        break;
+    case MSR_EFER:
+        val = env->efer;
+        break;
+    case MSR_STAR:
+        val = env->star;
+        break;
+    case MSR_PAT:
+        val = env->pat;
+        break;
+    case MSR_IA32_PKRS:
+        val = env->pkrs;
+        break;
+    case MSR_VM_HSAVE_PA:
+        val = env->vm_hsave;
+        break;
+    case MSR_IA32_PERF_STATUS:
+        /* tsc_increment_by_tick */
+        val = 1000ULL;
+        /* CPU multiplier */
+        val |= (((uint64_t)4ULL) << 40);
+        break;
+#ifdef TARGET_X86_64
+    case MSR_LSTAR:
+        val = env->lstar;
+        break;
+    case MSR_CSTAR:
+        val = env->cstar;
+        break;
+    case MSR_FMASK:
+        val = env->fmask;
+        break;
+    case MSR_FSBASE:
+        val = env->segs[R_FS].base;
+        break;
+    case MSR_GSBASE:
+        val = env->segs[R_GS].base;
+        break;
+    case MSR_KERNELGSBASE:
+        val = env->kernelgsbase;
+        break;
+    case MSR_TSC_AUX:
+        val = env->tsc_aux;
+        break;
+#endif
+    case MSR_SMI_COUNT:
+        val = env->msr_smi_count;
+        break;
+    case MSR_MTRRphysBase(0):
+    case MSR_MTRRphysBase(1):
+    case MSR_MTRRphysBase(2):
+    case MSR_MTRRphysBase(3):
+    case MSR_MTRRphysBase(4):
+    case MSR_MTRRphysBase(5):
+    case MSR_MTRRphysBase(6):
+    case MSR_MTRRphysBase(7):
+        val = env->mtrr_var[((uint32_t)env->regs[R_ECX] -
+                             MSR_MTRRphysBase(0)) / 2].base;
+        break;
+    case MSR_MTRRphysMask(0):
+    case MSR_MTRRphysMask(1):
+    case MSR_MTRRphysMask(2):
+    case MSR_MTRRphysMask(3):
+    case MSR_MTRRphysMask(4):
+    case MSR_MTRRphysMask(5):
+    case MSR_MTRRphysMask(6):
+    case MSR_MTRRphysMask(7):
+        val = env->mtrr_var[((uint32_t)env->regs[R_ECX] -
+                             MSR_MTRRphysMask(0)) / 2].mask;
+        break;
+    case MSR_MTRRfix64K_00000:
+        val = env->mtrr_fixed[0];
+        break;
+    case MSR_MTRRfix16K_80000:
+    case MSR_MTRRfix16K_A0000:
+        val = env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
+                              MSR_MTRRfix16K_80000 + 1];
+        break;
+    case MSR_MTRRfix4K_C0000:
+    case MSR_MTRRfix4K_C8000:
+    case MSR_MTRRfix4K_D0000:
+    case MSR_MTRRfix4K_D8000:
+    case MSR_MTRRfix4K_E0000:
+    case MSR_MTRRfix4K_E8000:
+    case MSR_MTRRfix4K_F0000:
+    case MSR_MTRRfix4K_F8000:
+        val = env->mtrr_fixed[(uint32_t)env->regs[R_ECX] -
+                              MSR_MTRRfix4K_C0000 + 3];
+        break;
+    case MSR_MTRRdefType:
+        val = env->mtrr_deftype;
+        break;
+    case MSR_MTRRcap:
+        if (env->features[FEAT_1_EDX] & CPUID_MTRR) {
+            val = MSR_MTRRcap_VCNT | MSR_MTRRcap_FIXRANGE_SUPPORT |
+                MSR_MTRRcap_WC_SUPPORTED;
+        } else {
+            /* XXX: exception? */
+            val = 0;
+        }
+        break;
+    case MSR_MCG_CAP:
+        val = env->mcg_cap;
+        break;
+    case MSR_MCG_CTL:
+        if (env->mcg_cap & MCG_CTL_P) {
+            val = env->mcg_ctl;
+        } else {
+            val = 0;
+        }
+        break;
+    case MSR_MCG_STATUS:
+        val = env->mcg_status;
+        break;
+    case MSR_IA32_MISC_ENABLE:
+        val = env->msr_ia32_misc_enable;
+        break;
+    case MSR_IA32_BNDCFGS:
+        val = env->msr_bndcfgs;
+        break;
+     case MSR_IA32_UCODE_REV:
+        val = x86_cpu->ucode_rev;
+        break;
+    default:
+        if ((uint32_t)env->regs[R_ECX] >= MSR_MC0_CTL
+            && (uint32_t)env->regs[R_ECX] < MSR_MC0_CTL +
+            (4 * env->mcg_cap & 0xff)) {
+            uint32_t offset = (uint32_t)env->regs[R_ECX] - MSR_MC0_CTL;
+            val = env->mce_banks[offset];
+            break;
+        }
+        /* XXX: exception? */
+        val = 0;
+        break;
+    }
+    env->regs[R_EAX] = (uint32_t)(val);
+    env->regs[R_EDX] = (uint32_t)(val >> 32);
+}
diff --git a/target/i386/tcg/user/misc_helper_user.c b/target/i386/tcg/user/misc_helper_user.c
new file mode 100644
index 0000000000..b1267b89b7
--- /dev/null
+++ b/target/i386/tcg/user/misc_helper_user.c
@@ -0,0 +1,77 @@
+/*
+ *  x86 misc helpers
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
+#include "qemu/main-loop.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/address-spaces.h"
+#include "tcg/helper-tcg.h"
+
+void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
+{
+    fprintf(stderr, "outb: port=0x%04x, data=%02x\n", port, data);
+}
+
+target_ulong helper_inb(CPUX86State *env, uint32_t port)
+{
+    fprintf(stderr, "inb: port=0x%04x\n", port);
+    return 0;
+}
+
+void helper_outw(CPUX86State *env, uint32_t port, uint32_t data)
+{
+    fprintf(stderr, "outw: port=0x%04x, data=%04x\n", port, data);
+}
+
+target_ulong helper_inw(CPUX86State *env, uint32_t port)
+{
+    fprintf(stderr, "inw: port=0x%04x\n", port);
+    return 0;
+}
+
+void helper_outl(CPUX86State *env, uint32_t port, uint32_t data)
+{
+    fprintf(stderr, "outl: port=0x%04x, data=%08x\n", port, data);
+}
+
+target_ulong helper_inl(CPUX86State *env, uint32_t port)
+{
+    fprintf(stderr, "inl: port=0x%04x\n", port);
+    return 0;
+}
+
+target_ulong helper_read_crN(CPUX86State *env, int reg)
+{
+    return 0;
+}
+
+void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
+{
+}
+
+void helper_wrmsr(CPUX86State *env)
+{
+}
+
+void helper_rdmsr(CPUX86State *env)
+{
+}
diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softmmu/meson.build
index d004ecea62..50b830419d 100644
--- a/target/i386/tcg/softmmu/meson.build
+++ b/target/i386/tcg/softmmu/meson.build
@@ -3,4 +3,5 @@ i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: files(
   'smm_helper.c',
   'excp_helper_softmmu.c',
   'bpt_helper_softmmu.c',
+  'misc_helper_softmmu.c',
 ))
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index 317f101b28..0fa9a48ee3 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -3,4 +3,5 @@ i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'smm_helper_user.c',
   'excp_helper_user.c',
   'bpt_helper_user.c',
+  'misc_helper_user.c',
 ))
-- 
2.26.2


