Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8F86CA8BB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 17:15:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgoXo-0002A0-Mc; Mon, 27 Mar 2023 11:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgoXn-00029o-Bs
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:13:59 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pgoXl-0007KD-LL
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 11:13:59 -0400
Received: by mail-oi1-x22d.google.com with SMTP id f17so6578087oiw.10
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1679930036;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zv7HvMZLSBerHD/Kvw7azBLt4ZK4kS6YZHGzUFBziLI=;
 b=eR86iFVIuYhPJTSXed6Mk5bgsjXuqw0loiOnXKdQgg/TU1F61pYC9yvfWaunmfa64b
 ZlQQEgEaWXxY6rXWAZ4UolP4ktAykxRZ/FrPKsYjMTNdBVRWfMutai1seQs6673cKaVY
 DXnIpVVymfwYb05+Dcr7uwC/HE2/eywBggpeQUzfIv/GV4wOj+o962hbMBq4abo56b0S
 juh/IrLQiVfC7+ja0CE5+TwK0Oai+xJLq7IonyhOw3Q2dB5K2+6mbplxFQPvFykAjXl8
 XruqxH2F4nctENzoeaqh4tn75Pvvt4w8zGGiPGFNeqpiwifx5PgHDzzjEuz5knH2+Hm7
 3dFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679930036;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zv7HvMZLSBerHD/Kvw7azBLt4ZK4kS6YZHGzUFBziLI=;
 b=MMwY504cGXip3EPmg5ymP1Zm/FPrBMAfkMilazr+A0B3onhOd4cbRZElf8En1ZcZdz
 oFotStehaM593HEAl5fS9l5iRCL4WZjnWpVbevN4Tzs8J9nI7wpvBG6h/COA8regw2bA
 YvZw38/5e35wUr7Bxgw8VG3HcNZC0PF8BQgWTagowtwEOHKNLY+sCZaVtw0SBi7xxLkY
 S1lFCKxfaprWQzVYZlAG/cAOojTSuUh5UICHjYAXR+op8i2C9YuH9onGwxTqRV5hpY6m
 rXMsknaUB58z4YzBLPLI5CSw9PSSU0l92oXg626ctxHXfhxp+pw49Q04NCtoQ5zWKkqs
 uthw==
X-Gm-Message-State: AAQBX9f9sFdmglUgljmqqkhXBjTPnl1v1sMhVjJ7Rck9Uztj1CgOTjst
 GcfDJUCwlvApw5g+08Vpqqh/vw==
X-Google-Smtp-Source: AKy350YzXg9pUJBGNpvKegAcYpnx5G1DHB5X1XTpXaPdexmUsRJjWpKYptXiFwimTnxtEpvAZ6MnKw==
X-Received: by 2002:a05:6808:1d3:b0:389:2d2b:4b05 with SMTP id
 x19-20020a05680801d300b003892d2b4b05mr1730773oic.5.1679930034654; 
 Mon, 27 Mar 2023 08:13:54 -0700 (PDT)
Received: from [192.168.68.107] ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 p10-20020acad80a000000b0037d7c3cfac7sm2252712oig.15.2023.03.27.08.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 08:13:54 -0700 (PDT)
Message-ID: <269b74cf-2543-3899-9fad-4b0bf9c622e8@ventanamicro.com>
Date: Mon, 27 Mar 2023 12:13:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-6-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230327100027.61160-6-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 3/27/23 07:00, Weiwei Li wrote:
> Transform the fetch address before page walk when pointer mask is
> enabled for instruction fetch.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.h        |  1 +
>   target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++--
>   target/riscv/csr.c        |  2 --
>   3 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 638e47c75a..57bd9c3279 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -368,6 +368,7 @@ struct CPUArchState {
>   #endif
>       target_ulong cur_pmmask;
>       target_ulong cur_pmbase;
> +    bool cur_pminsn;
>   
>       /* Fields from here on are preserved across CPU reset. */
>       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..77132a3e0c 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -124,6 +124,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>   void riscv_cpu_update_mask(CPURISCVState *env)
>   {
>       target_ulong mask = -1, base = 0;
> +    bool insn = false;
>       /*
>        * TODO: Current RVJ spec does not specify
>        * how the extension interacts with XLEN.
> @@ -135,18 +136,21 @@ void riscv_cpu_update_mask(CPURISCVState *env)
>               if (env->mmte & M_PM_ENABLE) {
>                   mask = env->mpmmask;
>                   base = env->mpmbase;
> +                insn = env->mmte & MMTE_M_PM_INSN;
>               }
>               break;
>           case PRV_S:
>               if (env->mmte & S_PM_ENABLE) {
>                   mask = env->spmmask;
>                   base = env->spmbase;
> +                insn = env->mmte & MMTE_S_PM_INSN;
>               }
>               break;
>           case PRV_U:
>               if (env->mmte & U_PM_ENABLE) {
>                   mask = env->upmmask;
>                   base = env->upmbase;
> +                insn = env->mmte & MMTE_U_PM_INSN;
>               }
>               break;
>           default:
> @@ -161,6 +165,7 @@ void riscv_cpu_update_mask(CPURISCVState *env)
>           env->cur_pmmask = mask;
>           env->cur_pmbase = base;
>       }
> +    env->cur_pminsn = insn;
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -1225,6 +1230,17 @@ static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
>       riscv_pmu_incr_ctr(cpu, pmu_event_type);
>   }
>   
> +static target_ulong adjust_pc_address(CPURISCVState *env, target_ulong pc)
> +{
> +    target_ulong adjust_pc = pc;
> +
> +    if (env->cur_pminsn) {
> +        adjust_pc = (adjust_pc & ~env->cur_pmmask) | env->cur_pmbase;
> +    }
> +
> +    return adjust_pc;
> +}
> +
>   bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                           MMUAccessType access_type, int mmu_idx,
>                           bool probe, uintptr_t retaddr)
> @@ -1232,6 +1248,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       RISCVCPU *cpu = RISCV_CPU(cs);
>       CPURISCVState *env = &cpu->env;
>       vaddr im_address;
> +    vaddr orig_address = address;
>       hwaddr pa = 0;
>       int prot, prot2, prot_pmp;
>       bool pmp_violation = false;
> @@ -1248,6 +1265,10 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
>                     __func__, address, access_type, mmu_idx);
>   
> +    if (access_type == MMU_INST_FETCH) {
> +        address = adjust_pc_address(env, address);
> +    }
> +
>       /* MPRV does not affect the virtual-machine load/store
>          instructions, HLV, HLVX, and HSV. */
>       if (riscv_cpu_two_stage_lookup(mmu_idx)) {
> @@ -1351,13 +1372,13 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       }
>   
>       if (ret == TRANSLATE_SUCCESS) {
> -        tlb_set_page(cs, address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
> +        tlb_set_page(cs, orig_address & ~(tlb_size - 1), pa & ~(tlb_size - 1),
>                        prot, mmu_idx, tlb_size);
>           return true;
>       } else if (probe) {
>           return false;
>       } else {
> -        raise_mmu_exception(env, address, access_type, pmp_violation,
> +        raise_mmu_exception(env, orig_address, access_type, pmp_violation,
>                               first_stage_error,
>                               riscv_cpu_virt_enabled(env) ||
>                                   riscv_cpu_two_stage_lookup(mmu_idx),
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index d522efc0b6..4544c9d934 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3511,8 +3511,6 @@ static RISCVException write_mmte(CPURISCVState *env, int csrno,
>       /* for machine mode pm.current is hardwired to 1 */
>       wpri_val |= MMTE_M_PM_CURRENT;
>   
> -    /* hardwiring pm.instruction bit to 0, since it's not supported yet */
> -    wpri_val &= ~(MMTE_M_PM_INSN | MMTE_S_PM_INSN | MMTE_U_PM_INSN);
>       env->mmte = wpri_val | PM_EXT_DIRTY;
>       riscv_cpu_update_mask(env);
>   

