Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C4698C42
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:45:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX3g-00006p-Mw; Thu, 16 Feb 2023 00:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSX3d-00006X-0O
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:43:49 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSX3Z-0000HJ-Ub
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:43:48 -0500
Received: by mail-ed1-x52b.google.com with SMTP id a10so1240473edu.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JmEt1vjQweqyC81ZbkcC9E7rFzBfezE8F3Yqwq/+JWE=;
 b=tI6aHsL9HbNoMPhqpEiG8JKjq14FbxUr2iL3m7dBCF9riup0tJnh80lGdCZDvYc+Y2
 0N012HoP/4gjQuAlHsdBsIPXXaQCernWYa71IYxQ21bIYCmIQHWGDLZ3TAbgeSogrcNA
 4oYRtsC/7rcSCMtWhYRBUtLsEy6KAMrL2smVsjkxWX4sAbn9qBhEcxHTAp1pcQZK7n9G
 FMc/Tq9SB5+yiICaLUr7ccE5VQBIPtjCIxaOpacz3ndi/dnXYe0H7xNPXhxXcAcACQNk
 Y1qmFDjiZ2W+8wvtkER5dfn/bV+XJvHh3AnsGFPsKuuPS9NtEW4LNoWxSTjV0zqFvhGh
 jRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JmEt1vjQweqyC81ZbkcC9E7rFzBfezE8F3Yqwq/+JWE=;
 b=oNYtYlDdfJpuDY1uNO2V1OZKtWUZYi3uN2a4k9rmoltnuVY2YgPb5sMLpzZ8vbmXey
 VWlLBkTW/WY0BaOylQjR+KNjCUYMdbmgA/8QgyEiwlp6YCU2QPbgJahbH1zZtGVIhyVF
 dcra6qJl4305rKORKve/AxrNhc/SFtRy9P2gPCoDy92m336/LsLvGphgZbhZz5vhZDFn
 zWdZsuNVXUli6YbthNbMryV1kj3uWlKIwP0i8kiuGJvinqzStZ7Qev7KXU8ywOJAkfN1
 a1gXsEB/NKryGiFlsDTSvJaLEQydMJJC9rMhDPMiNNfomHOMaKlODBMg9sPxfBgf6eZP
 56pg==
X-Gm-Message-State: AO0yUKXw6GvEMapRuLWEcI+h4PYYHu8TuTf48aXu8jHLfyAiIGyicqPR
 QM9BDB0k+MkRNdpujkpW1U3C5U3sA0OMEMW53a8YTA==
X-Google-Smtp-Source: AK7set/aEXsyBSeCtA818DHEC8TWGqgLl/a5JUDaHEKSvZM5edWAFTxeHcKPHNdKrMb8ahivE7vS99sOKzUNJB9JqMM=
X-Received: by 2002:a05:6402:1f12:b0:4ab:4bce:1a1f with SMTP id
 b18-20020a0564021f1200b004ab4bce1a1fmr738241edb.3.1676526223692; Wed, 15 Feb
 2023 21:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-7-debug@rivosinc.com>
 <172dbd60-55f4-6f2c-5d90-84d07851429d@linux.alibaba.com>
 <CAKC1njQ=P9XwyA5-jJ4__zKPrFtSREwkEGnoTMTeSMV2yF5s3w@mail.gmail.com>
 <82690597-beed-2302-755b-d468dd690f15@linux.alibaba.com>
In-Reply-To: <82690597-beed-2302-755b-d468dd690f15@linux.alibaba.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Feb 2023 21:43:20 -0800
Message-ID: <CAKC1njSnT5=Pi+Tfsksiw6cTi6hWnkPZXJqKxv1RSq6fh33YyA@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 6/9] target/riscv: MMU changes for back
 cfi's shadow stack
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, 
 Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=debug@rivosinc.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 15, 2023 at 6:36 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
>
> On 2023/2/16 7:57, Deepak Gupta wrote:
>
> `On Wed, Feb 15, 2023 at 12:43 AM LIU Zhiwei
> <zhiwei_liu@linux.alibaba.com> wrote:
>
> On 2023/2/9 14:24, Deepak Gupta wrote:
>
> zisslpcfi protects returns(back cfi) using shadow stack. If compiled with
> enabled compiler, function prologs will have `sspush ra` instruction to
> push return address on shadow stack and function epilogs will have
> `sspop t0; sschckra` instruction sequences. `sspop t0` will pop the
> value from top of the shadow stack in t0. `sschckra` will compare `t0`
> and `x1` and if they don't match then hart will raise an illegal
> instruction exception.
>
> Shadow stack is read-only memory except stores can be performed via
> `sspush` and `ssamoswap` instructions. This requires new PTE encoding for
> shadow stack. zisslpcfi uses R=0, W=1, X=0 (an existing reserved encoding
> ) to encode a shadow stack. If backward cfi is not enabled for current
> mode, shadow stack PTE encodings remain reserved. Regular stores to
> shadow stack raise AMO/store access fault. Shadow stack loads/stores on
> regular memory raise load access/store access fault.
>
> This patch creates a new MMU TLB index for shadow stack and flushes TLB
> for shadow stack on privileges changes. This patch doesn't implement
> `Smepmp` related enforcement on shadow stack pmp entry. Reason being qemu
> doesn't have `Smepmp` implementation yet.
>
> I don't know that the Smepmp means here. QEMU has supported the epmp.
>
> https://github.com/riscv/riscv-tee/blob/main/Smepmp/Smepmp.pdf
>
> This specification has been supported. You can enable this extension by -cpu rv64,x-epmp=on.
>
> I didn't see the special contents for shadow stack, neither on cfi specfication nor the epmp specification.
>
> You should make it clear that how the shadow stack influenced by the pmp rules.

Aah cool. I didn't notice that. I was looking for the string `smepmp`.

WIthout paging, shadow stack store/load simply honor pmpcfg read/write
permissions.
`sspush/ssamoswap` will succeed if the selected pmp entry's pmpcfg
allows a write. `sspop/ssamoswap` will
succeed if pmpcfg allows a read.

For M-mode shadow stack, there is a 6 bit field `sspmp` in mseccfg which selects
pmp entry for shadow stack accesses in M mode

M mode protection of shadow stack:
When mseccfg.MML=1, then
- sspush/sspop/ssamoswap must match PMP entry pointed to by `sspmp`
- stores other than `sspush` and `ssamoswap` that match pmp entry
`sspmp` must can access violation

I've to implement mseccfg.MML=1 rule for shadow stack in M mode.

Note: W=1,R=0,X=0 has already been claimed by Smepmp. So we can't use
that for the shadow stack in pmpcfg.

>
>   `Smepmp` enforcement should come
> whenever it is implemented.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Kip Walker  <kip@rivosinc.com>
> ---
>   target/riscv/cpu-param.h  |   1 +
>   target/riscv/cpu.c        |   2 +
>   target/riscv/cpu.h        |   3 ++
>   target/riscv/cpu_helper.c | 107 +++++++++++++++++++++++++++++++-------
>   4 files changed, 94 insertions(+), 19 deletions(-)
>
> diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
> index ebaf26d26d..a1e379beb7 100644
> --- a/target/riscv/cpu-param.h
> +++ b/target/riscv/cpu-param.h
> @@ -25,6 +25,7 @@
>    *  - M mode 0b011
>    *  - U mode HLV/HLVX/HSV 0b100
>    *  - S mode HLV/HLVX/HSV 0b101
> + *  - BCFI shadow stack   0b110
>    *  - M mode HLV/HLVX/HSV 0b111
>    */
>   #define NB_MMU_MODES 8
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b4e90eb91..14cfb93288 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -584,6 +584,8 @@ static void riscv_cpu_reset_hold(Object *obj)
>       }
>       /* mmte is supposed to have pm.current hardwired to 1 */
>       env->mmte |= (PM_EXT_INITIAL | MMTE_M_PM_CURRENT);
> +    /* Initialize ss_priv to current priv. */
> +    env->ss_priv = env->priv;
>   #endif
>       env->xl = riscv_cpu_mxl(env);
>       riscv_cpu_update_mask(env);
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d14ea4f91d..8803ea6426 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -379,6 +379,7 @@ struct CPUArchState {
>       uint64_t sstateen[SMSTATEEN_MAX_COUNT];
>       target_ulong senvcfg;
>       uint64_t henvcfg;
> +    target_ulong ss_priv;
>   #endif
>       target_ulong cur_pmmask;
>       target_ulong cur_pmbase;
> @@ -617,6 +618,8 @@ void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>   #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>   #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
>   #define TB_FLAGS_MSTATUS_VS MSTATUS_VS
> +/* TLB MMU index for shadow stack accesses */
> +#define MMU_IDX_SS_ACCESS    6
>
>   #include "exec/cpu-all.h"
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index fc188683c9..63377abc2f 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -657,7 +657,8 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>
>   bool riscv_cpu_two_stage_lookup(int mmu_idx)
>   {
> -    return mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK;
> +    return (mmu_idx & TB_FLAGS_PRIV_HYP_ACCESS_MASK) &&
> +           (mmu_idx != MMU_IDX_SS_ACCESS);
>   }
>
>   int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint64_t interrupts)
> @@ -745,6 +746,38 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>        * preemptive context switch. As a result, do both.
>        */
>       env->load_res = -1;
> +
> +    if (cpu_get_bcfien(env) && (env->priv != env->ss_priv)) {
> +        /*
> +         * If backward CFI is enabled in the new privilege state, the
> +         * shadow stack TLB needs to be flushed - unless the most recent
> +         * use of the SS TLB was for the same privilege mode.
> +         */
> +        tlb_flush_by_mmuidx(env_cpu(env), 1 << MMU_IDX_SS_ACCESS);
> +        /*
> +         * Ignoring env->virt here since currently every time it flips,
> +         * all TLBs are flushed anyway.
> +         */
> +        env->ss_priv = env->priv;
> +    }
> +}
> +
> +typedef enum {
> +    SSTACK_NO,          /* Access is not for a shadow stack instruction */
> +    SSTACK_YES,         /* Access is for a shadow stack instruction */
> +    SSTACK_DC           /* Don't care about SS attribute in PMP */
> +} SStackPmpMode;
> +
> +static bool legal_sstack_access(int access_type, bool sstack_inst,
> +                                bool sstack_attribute)
> +{
> +    /*
> +     * Read/write/execution permissions are checked as usual. Shadow
> +     * stack enforcement is just that (1) instruction type must match
> +     * the attribute unless (2) a non-SS load to an SS region.
> +     */
> +    return (sstack_inst == sstack_attribute) ||
> +        ((access_type == MMU_DATA_LOAD) && sstack_attribute);
>   }
>
>   /*
> @@ -764,7 +797,7 @@ void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>   static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>                                       target_ulong *tlb_size, hwaddr addr,
>                                       int size, MMUAccessType access_type,
> -                                    int mode)
> +                                    int mode, SStackPmpMode sstack)
>
> Why this parameter if you don't use it?
>
>   {
>       pmp_priv_t pmp_priv;
>       int pmp_index = -1;
> @@ -812,13 +845,16 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
>    *               Second stage is used for hypervisor guest translation
>    * @two_stage: Are we going to perform two stage translation
>    * @is_debug: Is this access from a debugger or the monitor?
> + * @sstack: Is this access for a shadow stack? Passed by reference so
> +            it can be forced to SSTACK_DC when the SS check is completed
> +            based on a PTE - so the PMP SS attribute will be ignored.
>    */
>   static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>                                   int *prot, target_ulong addr,
>                                   target_ulong *fault_pte_addr,
>                                   int access_type, int mmu_idx,
>                                   bool first_stage, bool two_stage,
> -                                bool is_debug)
> +                                bool is_debug, SStackPmpMode *sstack)
>   {
>       /* NOTE: the env->pc value visible here will not be
>        * correct, but the value visible to the exception handler
> @@ -830,6 +866,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>       hwaddr ppn;
>       RISCVCPU *cpu = env_archcpu(env);
>       int napot_bits = 0;
> +    bool is_sstack = (sstack != NULL) && (*sstack == SSTACK_YES);
>       target_ulong napot_mask;
>
>       /*
> @@ -851,6 +888,8 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
>           if (get_field(env->mstatus, MSTATUS_MPRV)) {
>               mode = get_field(env->mstatus, MSTATUS_MPP);
>           }
> +    } else if (mmu_idx == MMU_IDX_SS_ACCESS) {
> +        mode = env->priv;
>       }
>
>       if (first_stage == false) {
> @@ -966,7 +1005,7 @@ restart:
>               int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
>                                                    base, NULL, MMU_DATA_LOAD,
>                                                    mmu_idx, false, true,
> -                                                 is_debug);
> +                                                 is_debug, NULL);
>
>               if (vbase_ret != TRANSLATE_SUCCESS) {
>                   if (fault_pte_addr) {
> @@ -983,7 +1022,7 @@ restart:
>           int pmp_prot;
>           int pmp_ret = get_physical_address_pmp(env, &pmp_prot, NULL, pte_addr,
>                                                  sizeof(target_ulong),
> -                                               MMU_DATA_LOAD, PRV_S);
> +                                               MMU_DATA_LOAD, PRV_S, SSTACK_NO);
>           if (pmp_ret != TRANSLATE_SUCCESS) {
>               return TRANSLATE_PMP_FAIL;
>           }
> @@ -1010,6 +1049,18 @@ restart:
>               }
>           }
>
> +        /*
> +         * When backward CFI is enabled, the R=0, W=1, X=0 reserved encoding
> +         * is used to mark Shadow Stack (SS) pages. If back CFI enabled, allow
> +         * normal loads on SS pages, regular stores raise store access fault
> +         * and avoid hitting the reserved-encoding case. Only shadow stack
> +         * stores are allowed on SS pages. Shadow stack loads and stores on
> +         * regular memory (non-SS) raise load and store/AMO access fault.
> +         * Second stage translations don't participate in Shadow Stack.
> +         */
> +        bool sstack_page = (cpu_get_bcfien(env) && first_stage &&
> +                            ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W));
> +
>           if (!(pte & PTE_V)) {
>               /* Invalid PTE */
>               return TRANSLATE_FAIL;
> @@ -1021,7 +1072,7 @@ restart:
>                   return TRANSLATE_FAIL;
>               }
>               base = ppn << PGSHIFT;
> -        } else if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
> +        } else if (((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) && !sstack_page) {
>               /* Reserved leaf PTE flags: PTE_W */
>               return TRANSLATE_FAIL;
>           } else if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
> @@ -1038,16 +1089,21 @@ restart:
>           } else if (ppn & ((1ULL << ptshift) - 1)) {
>               /* Misaligned PPN */
>               return TRANSLATE_FAIL;
> -        } else if (access_type == MMU_DATA_LOAD && !((pte & PTE_R) ||
> -                   ((pte & PTE_X) && mxr))) {
> +        } else if (access_type == MMU_DATA_LOAD && !(((pte & PTE_R) ||
> +                   sstack_page) || ((pte & PTE_X) && mxr))) {
>               /* Read access check failed */
>               return TRANSLATE_FAIL;
> -        } else if (access_type == MMU_DATA_STORE && !(pte & PTE_W)) {
> +        } else if ((access_type == MMU_DATA_STORE && !is_sstack) &&
> +                   !(pte & PTE_W)) {
>
> Why limit to !is_sstack? Even is_sstack, we should make sure
>
> (access_type == MMU_DATA_STORE && !(pte & PTE_W)
>
> fails.
>
> As per spec if a shadow stack store happens to a memory which is not a
> shadow stack memory then cpu must raise
> access store fault. This failure here converts to a page fault.
> TRANSLATE_PMP_FAIL is the one which converts to
> access faults.  So this check here ensures that legacy behavior is
> maintained i.e.
>
> Fair enough.  I think we can just use the more redundant but clearer condition
>
> if ((access_type == MMU_DATA_STORE && !is_sstack && !sstack_page) && !(pte & PTE_W))
>
> Thus two new memory access types will be postpone to the legal_sstack_access.
> Or you can use  current code, and with a comment.
>
>
>
> Few lines down there is a call to `legal_sstack_access` which actually
> does the logic check of
> "If a regular store happened on shadow stack memory, returns false"
> "If a shadow stack access happened on regular memory, returns false"
> And this check returns PMP_TRANSLATE_FAIL which converts to access faults.
>
> On a very high level, shadow stack accesses (sspush/sspop/ssamoswap)
> to regular memory result in access faults.
> Regular store to shadow stack memory result in store/AMO access fault.
> Regular load to shadow stack memory is allowed.
>
> Let me know if this was clear.
>
>               /* Write access check failed */
>               return TRANSLATE_FAIL;
>           } else if (access_type == MMU_INST_FETCH && !(pte & PTE_X)) {
>               /* Fetch access check failed */
>               return TRANSLATE_FAIL;
> +        } else if (!legal_sstack_access(access_type, is_sstack,
> +                                        sstack_page)) {
> +            /* Illegal combo of instruction type and page attribute */
> +            return TRANSLATE_PMP_FAIL;
>
> Not sure about this. Does the cfi escape the pmp check?
>
>           } else {
>               /* if necessary, set accessed and dirty bits. */
>               target_ulong updated_pte = pte | PTE_A |
> @@ -1107,18 +1163,27 @@ restart:
>                            ) << PGSHIFT) | (addr & ~TARGET_PAGE_MASK);
>
>               /* set permissions on the TLB entry */
> -            if ((pte & PTE_R) || ((pte & PTE_X) && mxr)) {
> +            if ((pte & PTE_R) || ((pte & PTE_X) && mxr) || sstack_page) {
>
> I see that we should add the PAGE_READ for sstack_page, such as for a
> no-SS load.
>
> I didn't get this comment. Can you clarify a bit more?
>
> Just a guess why you add sstack_page here. Nothing too much. Ignore it.
>
> Zhiwei
>
> Zhiwei
>
>                   *prot |= PAGE_READ;
>               }
>               if ((pte & PTE_X)) {
>                   *prot |= PAGE_EXEC;
>               }
> -            /* add write permission on stores or if the page is already dirty,
> -               so that we TLB miss on later writes to update the dirty bit */
> +            /*
> +             * add write permission on stores or if the page is already dirty,
> +             * so that we TLB miss on later writes to update the dirty bit
> +             */
>               if ((pte & PTE_W) &&
>                       (access_type == MMU_DATA_STORE || (pte & PTE_D))) {
>                   *prot |= PAGE_WRITE;
>               }
> +            if (sstack) {
> +                /*
> +                 * Tell the caller to skip the SS bit in the PMP since we
> +                 * resolved the attributes via the page table.
> +                 */
> +                *sstack = SSTACK_DC;
> +            }
>               return TRANSLATE_SUCCESS;
>           }
>       }
> @@ -1190,13 +1255,13 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>       int mmu_idx = cpu_mmu_index(&cpu->env, false);
>
>       if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
> -                             true, riscv_cpu_virt_enabled(env), true)) {
> +                             true, riscv_cpu_virt_enabled(env), true, NULL)) {
>           return -1;
>       }
>
>       if (riscv_cpu_virt_enabled(env)) {
>           if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
> -                                 0, mmu_idx, false, true, true)) {
> +                                 0, mmu_idx, false, true, true, NULL)) {
>               return -1;
>           }
>       }
> @@ -1291,6 +1356,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       bool two_stage_indirect_error = false;
>       int ret = TRANSLATE_FAIL;
>       int mode = mmu_idx;
> +    bool sstack = (mmu_idx == MMU_IDX_SS_ACCESS);
> +    SStackPmpMode ssmode = sstack ? SSTACK_YES : SSTACK_NO;
>       /* default TLB page size */
>       target_ulong tlb_size = TARGET_PAGE_SIZE;
>
> @@ -1318,7 +1385,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>           /* Two stage lookup */
>           ret = get_physical_address(env, &pa, &prot, address,
>                                      &env->guest_phys_fault_addr, access_type,
> -                                   mmu_idx, true, true, false);
> +                                   mmu_idx, true, true, false, &ssmode);
>
>           /*
>            * A G-stage exception may be triggered during two state lookup.
> @@ -1342,7 +1409,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>
>               ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
>                                          access_type, mmu_idx, false, true,
> -                                       false);
> +                                       false, NULL);
>
>               qemu_log_mask(CPU_LOG_MMU,
>                       "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
> @@ -1353,7 +1420,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>
>               if (ret == TRANSLATE_SUCCESS) {
>                   ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> -                                               size, access_type, mode);
> +                                               size, access_type, mode,
> +                                               SSTACK_NO);
>
>                   qemu_log_mask(CPU_LOG_MMU,
>                                 "%s PMP address=" HWADDR_FMT_plx " ret %d prot"
> @@ -1377,7 +1445,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       } else {
>           /* Single stage lookup */
>           ret = get_physical_address(env, &pa, &prot, address, NULL,
> -                                   access_type, mmu_idx, true, false, false);
> +                                   access_type, mmu_idx, true, false,
> +                                   false, &ssmode);
>
>           qemu_log_mask(CPU_LOG_MMU,
>                         "%s address=%" VADDR_PRIx " ret %d physical "
> @@ -1386,7 +1455,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>
>           if (ret == TRANSLATE_SUCCESS) {
>               ret = get_physical_address_pmp(env, &prot_pmp, &tlb_size, pa,
> -                                           size, access_type, mode);
> +                                           size, access_type, mode, ssmode);
>
>               qemu_log_mask(CPU_LOG_MMU,
>                             "%s PMP address=" HWADDR_FMT_plx " ret %d prot"

