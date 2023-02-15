Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E426975FE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 06:49:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSAe9-0001Vz-8k; Wed, 15 Feb 2023 00:48:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSAe4-0001VZ-Vj; Wed, 15 Feb 2023 00:47:57 -0500
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSAe1-000659-Ef; Wed, 15 Feb 2023 00:47:56 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R391e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vbin95E_1676440061; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vbin95E_1676440061) by smtp.aliyun-inc.com;
 Wed, 15 Feb 2023 13:47:42 +0800
Message-ID: <f68da758-a418-c528-6f7c-e6e0d0246255@linux.alibaba.com>
Date: Wed, 15 Feb 2023 13:47:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 RFC Zisslpcfi 3/9] target/riscv: implements CSRs and
 new bits in existing CSRs in zisslpcfi
Content-Language: en-US
To: Deepak Gupta <debug@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
Cc: Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-4-debug@rivosinc.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230209062404.3582018-4-debug@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.98;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-98.freemail.mail.aliyun.com
X-Spam_score_int: -101
X-Spam_score: -10.2
X-Spam_bar: ----------
X-Spam_report: (-10.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.35, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/2/9 14:23, Deepak Gupta wrote:
> CSR_SSP and CSR_LPLR are new CSR additions to cpu/hart. This patch allows
> access to these CSRs. A predicate routine handles access to these CSR as
> per specification.
>
> This patch also implments new bit definitions in menvcfg/henvcfg/mstatus/
> sstatus CSRs to master enabled cfi and enable forward cfi in S and M mode.
> mstatus CSR holds forward and backward cfi enabling for U mode.
>
> There is no enabling bit for backward cfi in S and M mode. It is always
> enabled if extension is implemented by CPU.
>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Kip Walker  <kip@rivosinc.com>
> ---
>   target/riscv/csr.c | 137 ++++++++++++++++++++++++++++++++++++++++++++-
>   target/riscv/pmp.c |   9 +++
>   2 files changed, 145 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0db2c233e5..24e208ebed 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -163,6 +163,50 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
>       return ctr(env, csrno);
>   }
>   
> +static RISCVException cfi(CPURISCVState *env, int csrno)
> +{
> +    /* no cfi extension */
> +    if (!env_archcpu(env)->cfg.ext_cfi) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +    /*
> +     * CONFIG_USER_MODE always allow access for now. Better for user mode only
> +     * functionality
> +     */
> +#if !defined(CONFIG_USER_ONLY)
> +    /* current priv not M */
> +    if (env->priv != PRV_M) {
> +        /* menvcfg says no CFI */
> +        if (!get_field(env->menvcfg, MENVCFG_CFI)) {
> +            return RISCV_EXCP_ILLEGAL_INST;
> +        }
> +
> +        /* V = 1 and henvcfg says no CFI. raise virtual instr fault */
> +        if (riscv_cpu_virt_enabled(env) &&
> +            !get_field(env->henvcfg, HENVCFG_CFI)) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +
> +        /*
> +         * LPLR and SSP are not accessible to U mode if disabled via status
> +         * CSR
> +         */
> +        if (env->priv == PRV_U) {
> +            if (csrno == CSR_LPLR &&
> +                !get_field(env->mstatus, MSTATUS_UFCFIEN)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +            if (csrno == CSR_SSP &&
> +                !get_field(env->mstatus, MSTATUS_UBCFIEN)) {
> +                return RISCV_EXCP_ILLEGAL_INST;
> +            }
> +        }
> +    }
> +#endif
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>   #if !defined(CONFIG_USER_ONLY)
>   static RISCVException mctr(CPURISCVState *env, int csrno)
>   {
> @@ -485,6 +529,32 @@ static RISCVException seed(CPURISCVState *env, int csrno)
>   #endif
>   }
>   
> +/* Zisslpcfi CSR_LPLR read/write */
> +static int read_lplr(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->lplr;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_lplr(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->lplr = val & (LPLR_UL | LPLR_ML | LPLR_LL);
> +    return RISCV_EXCP_NONE;
> +}
> +
> +/* Zisslpcfi CSR_SSP read/write */
> +static int read_ssp(CPURISCVState *env, int csrno, target_ulong *val)
> +{
> +    *val = env->ssp;
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static int write_ssp(CPURISCVState *env, int csrno, target_ulong val)
> +{
> +    env->ssp = val;
> +    return RISCV_EXCP_NONE;
> +}
> +
>   /* User Floating-Point CSRs */
>   static RISCVException read_fflags(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
> @@ -1227,7 +1297,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>   
>       /* flush tlb on mstatus fields that affect VM */
>       if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
> -            MSTATUS_MPRV | MSTATUS_SUM)) {
> +            MSTATUS_MPRV | MSTATUS_SUM | MSTATUS_UFCFIEN | MSTATUS_UBCFIEN)) {

These two fields should be guarded by the check of ext_cfi.

And MSTATUS_UBCFIEN field change don't need flush tlb.

I didn't get why we should flush tlb for forward cfi. For background, 
there are some enhancement for the PTE and PMP, we may need do some
memory adjustments. But forward cfi just adds some instructions. Why we 
should flush tlb? Does the tlb can't be used any more?

>           tlb_flush(env_cpu(env));
>       }
>       mask = MSTATUS_SIE | MSTATUS_SPIE | MSTATUS_MIE | MSTATUS_MPIE |
> @@ -1250,6 +1320,11 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>           }
>       }
>   
> +    /* If cfi extension is available, then apply cfi status mask */
> +    if (env_archcpu(env)->cfg.ext_cfi) {
> +        mask |= CFISTATUS_M_MASK;
> +    }
> +
>       mstatus = (mstatus & ~mask) | (val & mask);
>   
>       if (xl > MXL_RV32) {
> @@ -1880,9 +1955,17 @@ static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
>       uint64_t mask = MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENVCFG_CBZE;
> +    uint64_t cfi_mask = MENVCFG_CFI | MENVCFG_SFCFIEN;
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= MENVCFG_PBMTE | MENVCFG_STCE;
> +        if (env_archcpu(env)->cfg.ext_cfi) {
> +            mask |= cfi_mask;
> +            /* If any cfi enabling bit changes in menvcfg, flush tlb */
> +            if ((val ^ env->menvcfg) & cfi_mask) {
> +                tlb_flush(env_cpu(env));
Don't flush tlb for MENVCFG_SFCFIE field changes.
> +            }
> +        }
>       }
>       env->menvcfg = (env->menvcfg & ~mask) | (val & mask);
>   
> @@ -1900,8 +1983,17 @@ static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
>       uint64_t mask = MENVCFG_PBMTE | MENVCFG_STCE;
> +    uint64_t cfi_mask = MENVCFG_CFI | MENVCFG_SFCFIEN;
MENVCFG_SFCFIE
>       uint64_t valh = (uint64_t)val << 32;
>   
> +    if (env_archcpu(env)->cfg.ext_cfi) {
> +            mask |= cfi_mask;
> +            /* If any cfi enabling bit changes in menvcfg, flush tlb */
> +            if ((val ^ env->menvcfg) & cfi_mask) {
> +                tlb_flush(env_cpu(env));
> +            }
If SFCFIE field change, we should not flush the tlb.
> +    }
> +
>       env->menvcfg = (env->menvcfg & ~mask) | (valh & mask);
>   
>       return RISCV_EXCP_NONE;
> @@ -1954,6 +2046,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
>       uint64_t mask = HENVCFG_FIOM | HENVCFG_CBIE | HENVCFG_CBCFE | HENVCFG_CBZE;
> +    uint64_t cfi_mask = HENVCFG_CFI | HENVCFG_SFCFIEN;

HENVCFG_SFCFIE

>       RISCVException ret;
>   
>       ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> @@ -1963,6 +2056,18 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>   
>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>           mask |= HENVCFG_PBMTE | HENVCFG_STCE;
> +        /*
> +         * If cfi available and menvcfg.CFI = 1, then apply cfi mask for
> +         * henvcfg
> +         */
> +        if (env_archcpu(env)->cfg.ext_cfi &&
> +            get_field(env->menvcfg, MENVCFG_CFI)) {
> +            mask |= cfi_mask;
> +            /* If any cfi enabling bit changes in henvcfg, flush tlb */
> +            if ((val ^ env->henvcfg) & cfi_mask) {
> +                tlb_flush(env_cpu(env));
> +            }
If SFCFIE field change, we should not flush the tlb.
> +        }
>       }
>   
>       env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
> @@ -1988,9 +2093,19 @@ static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>                                     target_ulong val)
>   {
>       uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
> +    uint64_t cfi_mask = HENVCFG_CFI | HENVCFG_SFCFIEN;
>       uint64_t valh = (uint64_t)val << 32;
>       RISCVException ret;
>   
> +    if (env_archcpu(env)->cfg.ext_cfi &&
> +        get_field(env->menvcfg, MENVCFG_CFI)) {
> +        mask |= cfi_mask;
> +        /* If any cfi enabling bit changes in henvcfg, flush tlb */
> +        if ((val ^ env->henvcfg) & cfi_mask) {
> +            tlb_flush(env_cpu(env));
> +        }
> +    }
> +
>       ret = smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
>       if (ret != RISCV_EXCP_NONE) {
>           return ret;
> @@ -2270,6 +2385,11 @@ static RISCVException read_sstatus_i128(CPURISCVState *env, int csrno,
>           mask |= SSTATUS64_UXL;
>       }
>   
> +    if ((env_archcpu(env)->cfg.ext_cfi) &&
> +         get_field(env->menvcfg, MENVCFG_CFI)) {
> +        mask |= CFISTATUS_S_MASK;
> +    }
> +
>       *val = int128_make128(sstatus, add_status_sd(MXL_RV128, sstatus));
>       return RISCV_EXCP_NONE;
>   }
> @@ -2281,6 +2401,11 @@ static RISCVException read_sstatus(CPURISCVState *env, int csrno,
>       if (env->xl != MXL_RV32 || env->debugger) {
>           mask |= SSTATUS64_UXL;
>       }
> +
> +    if ((env_archcpu(env)->cfg.ext_cfi) &&
> +         get_field(env->menvcfg, MENVCFG_CFI)) {
> +        mask |= CFISTATUS_S_MASK;
> +    }
>       /* TODO: Use SXL not MXL. */
>       *val = add_status_sd(riscv_cpu_mxl(env), env->mstatus & mask);
>       return RISCV_EXCP_NONE;
> @@ -2296,6 +2421,12 @@ static RISCVException write_sstatus(CPURISCVState *env, int csrno,
>               mask |= SSTATUS64_UXL;
>           }
>       }
> +
> +    /* If cfi available and menvcfg.CFI = 1, apply CFI mask for sstatus */
> +    if ((env_archcpu(env)->cfg.ext_cfi) &&
> +         get_field(env->menvcfg, MENVCFG_CFI)) {
> +        mask |= CFISTATUS_S_MASK;
> +    }
>       target_ulong newval = (env->mstatus & ~mask) | (val & mask);
>       return write_mstatus(env, CSR_MSTATUS, newval);
>   }
> @@ -4001,6 +4132,10 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>       /* Crypto Extension */
>       [CSR_SEED] = { "seed", seed, NULL, NULL, rmw_seed },
>   
> +    /* User mode CFI CSR */
> +    [CSR_LPLR] = { "lplr", cfi, read_lplr, write_lplr },
> +    [CSR_SSP]  = { "ssp", cfi, read_ssp, write_ssp },
> +
>   #if !defined(CONFIG_USER_ONLY)
>       /* Machine Timers and Counters */
>       [CSR_MCYCLE]    = { "mcycle",    any,   read_hpmcounter,
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index d1126a6066..89745d46cd 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -579,6 +579,15 @@ void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
>       /* Sticky bits */
>       val |= (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
>   
> +    /* M-mode forward cfi to be enabled if cfi extension is implemented */
> +    if (env_archcpu(env)->cfg.ext_cfi) {
> +        val |= (val & MSECCFG_MFCFIEN);
This statement does nothing. Is it a typo?
> +        /* If forward cfi in mseccfg is being toggled, flush tlb */
> +        if ((env->mseccfg ^ val) & MSECCFG_MFCFIEN) {
> +                tlb_flush(env_cpu(env));
> +        }

No need flush tlb.

Zhiwei

> +    }
> +
>       env->mseccfg = val;
>   }
>   

