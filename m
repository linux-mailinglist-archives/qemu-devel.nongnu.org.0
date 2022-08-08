Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4942058C059
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 03:51:25 +0200 (CEST)
Received: from localhost ([::1]:33448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKrvP-0000qC-Sg
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 21:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oKrtp-0007Lv-Ef; Sun, 07 Aug 2022 21:49:45 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:57330 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oKrtl-0000N1-VR; Sun, 07 Aug 2022 21:49:45 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-05 (Coremail) with SMTP id zQCowABXUO6ka_BidZgeFw--.65402S2;
 Mon, 08 Aug 2022 09:49:26 +0800 (CST)
Subject: Re: [PATCH v8 3/3] target/riscv: Add vstimecmp support
To: Atish Patra <atishp@rivosinc.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
References: <20220804014240.2514957-1-atishp@rivosinc.com>
 <20220804014240.2514957-4-atishp@rivosinc.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c8406f96-4bf7-aee0-71f0-3758c6ed4c97@iscas.ac.cn>
Date: Mon, 8 Aug 2022 09:49:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220804014240.2514957-4-atishp@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowABXUO6ka_BidZgeFw--.65402S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr4DtrWrur1kGr4kZF47Arb_yoWDXr4fpF
 WkC39xKay5tFZrZwn3Jrn8GwnYyw4UKan8Wws7CFWrAF45GrW5GF1DKF1UZFs5WFWkWr4F
 vF1Fkr1Ykr40vFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWr
 Zr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
 BIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [116.224.155.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/8/4 上午9:42, Atish Patra 写道:
> vstimecmp CSR allows the guest OS or to program the next guest timer
> interrupt directly. Thus, hypervisor no longer need to inject the
> timer interrupt to the guest if vstimecmp is used. This was ratified
> as a part of the Sstc extension.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   target/riscv/cpu.h         |   4 ++
>   target/riscv/cpu_bits.h    |   4 ++
>   target/riscv/cpu_helper.c  |  11 ++--
>   target/riscv/csr.c         | 102 ++++++++++++++++++++++++++++++++++++-
>   target/riscv/machine.c     |   1 +
>   target/riscv/time_helper.c |  16 ++++++
>   6 files changed, 133 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4cda2905661e..1fd382b2717f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -312,6 +312,8 @@ struct CPUArchState {
>       /* Sstc CSRs */
>       uint64_t stimecmp;
>   
> +    uint64_t vstimecmp;
> +
>       /* physical memory protection */
>       pmp_table_t pmp_state;
>       target_ulong mseccfg;
> @@ -366,6 +368,8 @@ struct CPUArchState {
>   
>       /* Fields from here on are preserved across CPU reset. */
>       QEMUTimer *stimer; /* Internal timer for S-mode interrupt */
> +    QEMUTimer *vstimer; /* Internal timer for VS-mode interrupt */
> +    bool vstime_irq;
>   
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index ac17cf1515c0..095dab19f512 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -257,6 +257,10 @@
>   #define CSR_VSIP            0x244
>   #define CSR_VSATP           0x280
>   
> +/* Sstc virtual CSRs */
> +#define CSR_VSTIMECMP       0x24D
> +#define CSR_VSTIMECMPH      0x25D
> +
>   #define CSR_MTINST          0x34a
>   #define CSR_MTVAL2          0x34b
>   
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 650574accf0a..1e4faa84e839 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -345,8 +345,9 @@ uint64_t riscv_cpu_all_pending(CPURISCVState *env)
>   {
>       uint32_t gein = get_field(env->hstatus, HSTATUS_VGEIN);
>       uint64_t vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
> +    uint64_t vstip = (env->vstime_irq) ? MIP_VSTIP : 0;
>   
> -    return (env->mip | vsgein) & env->mie;
> +    return (env->mip | vsgein | vstip) & env->mie;
>   }
>   
>   int riscv_cpu_mirq_pending(CPURISCVState *env)
> @@ -605,7 +606,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>   {
>       CPURISCVState *env = &cpu->env;
>       CPUState *cs = CPU(cpu);
> -    uint64_t gein, vsgein = 0, old = env->mip;
> +    uint64_t gein, vsgein = 0, vstip = 0, old = env->mip;
>       bool locked = false;
>   
>       if (riscv_cpu_virt_enabled(env)) {
> @@ -613,6 +614,10 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>           vsgein = (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
>       }
>   
> +    /* No need to update mip for VSTIP */
> +    mask = ((mask == MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
> +    vstip = env->vstime_irq ? MIP_VSTIP : 0;
> +
>       if (!qemu_mutex_iothread_locked()) {
>           locked = true;
>           qemu_mutex_lock_iothread();
> @@ -620,7 +625,7 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t mask, uint64_t value)
>   
>       env->mip = (env->mip & ~mask) | (value & mask);
>   
> -    if (env->mip | vsgein) {
> +    if (env->mip | vsgein | vstip) {
>           cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>       } else {
>           cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e18b000700e4..9da4d6515e7b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -829,17 +829,100 @@ static RISCVException sstc(CPURISCVState *env, int csrno)
>       return smode(env, csrno);
>   }
>   
> +static RISCVException sstc_hmode(CPURISCVState *env, int csrno)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (env->priv == PRV_M) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(get_field(env->mcounteren, COUNTEREN_TM) &
> +          get_field(env->menvcfg, MENVCFG_STCE))) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    if (riscv_cpu_virt_enabled(env)) {
> +        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
> +              get_field(env->henvcfg, HENVCFG_STCE))) {
> +            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
> +        }
> +    }
> +

I think this check on hcounteren and henvcfg should be added to sstc 
predicate, not here.

Even though hcounteren and henvcfg finally controls the access of  
vstimecmp, however

it controls it via stimecmp.

> +    return hmode(env, csrno);
> +}
> +
> +static RISCVException read_vstimecmp(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->vstimecmp;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException read_vstimecmph(CPURISCVState *env, int csrno,
> +                                    target_ulong *val)
> +{
> +    *val = env->vstimecmp >> 32;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_vstimecmp(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
> +        env->vstimecmp = deposit64(env->vstimecmp, 0, 32, (uint64_t)val);
> +    } else {
> +        env->vstimecmp = val;
> +    }
> +
> +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +                              env->htimedelta, MIP_VSTIP);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_vstimecmph(CPURISCVState *env, int csrno,
> +                                    target_ulong val)
> +{
> +    RISCVCPU *cpu = env_archcpu(env);
> +
> +    env->vstimecmp = deposit64(env->vstimecmp, 32, 32, (uint64_t)val);
> +    riscv_timer_write_timecmp(cpu, env->vstimer, env->vstimecmp,
> +                              env->htimedelta, MIP_VSTIP);
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
>   static RISCVException read_stimecmp(CPURISCVState *env, int csrno,
>                                       target_ulong *val)
>   {
> -    *val = env->stimecmp;
> +    if (riscv_cpu_virt_enabled(env)) {
> +        *val = env->vstimecmp;
> +    } else {
> +        *val = env->stimecmp;
> +    }
> +
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException read_stimecmph(CPURISCVState *env, int csrno,
>                                       target_ulong *val)
>   {
> -    *val = env->stimecmp >> 32;
> +    if (riscv_cpu_virt_enabled(env)) {
> +        *val = env->vstimecmp >> 32;
> +    } else {
> +        *val = env->stimecmp >> 32;
> +    }
> +
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -848,6 +931,10 @@ static RISCVException write_stimecmp(CPURISCVState *env, int csrno,
>   {
>       RISCVCPU *cpu = env_archcpu(env);
>   
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return write_vstimecmp(env, csrno, val);
> +    }
> +
>       if (riscv_cpu_mxl(env) == MXL_RV32) {
>           env->stimecmp = deposit64(env->stimecmp, 0, 32, (uint64_t)val);
>       } else {
> @@ -864,6 +951,10 @@ static RISCVException write_stimecmph(CPURISCVState *env, int csrno,
>   {
>       RISCVCPU *cpu = env_archcpu(env);
>   
> +    if (riscv_cpu_virt_enabled(env)) {
> +        return write_vstimecmph(env, csrno, val);
> +    }
> +
>       env->stimecmp = deposit64(env->stimecmp, 32, 32, (uint64_t)val);
>       riscv_timer_write_timecmp(cpu, env->stimer, env->stimecmp, 0, MIP_STIP);
>   
> @@ -1801,6 +1892,7 @@ static RISCVException rmw_mip64(CPURISCVState *env, int csrno,
>       if (csrno != CSR_HVIP) {
>           gin = get_field(env->hstatus, HSTATUS_VGEIN);
>           old_mip |= (env->hgeip & ((target_ulong)1 << gin)) ? MIP_VSEIP : 0;
> +        old_mip |= env->vstime_irq ? MIP_VSTIP : 0;
>       }
>   
>       if (ret_val) {
> @@ -3661,6 +3753,12 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
>                                             .min_priv_ver = PRIV_VERSION_1_12_0 },
>       [CSR_STIMECMPH] = { "stimecmph", sstc, read_stimecmph, write_stimecmph,
>                                             .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTIMECMP] = { "vstimecmp", sstc_hmode, read_vstimecmp,
> +                                          write_vstimecmp,

Please align with last line. The same to other similar lines.

Regards,

Weiwei Li

> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
> +    [CSR_VSTIMECMPH] = { "vstimecmph", sstc_hmode, read_vstimecmph,
> +                                          write_vstimecmph,
> +                                          .min_priv_ver = PRIV_VERSION_1_12_0 },
>   
>       /* Supervisor Protection and Translation */
>       [CSR_SATP]     = { "satp",     smode, read_satp,     write_satp     },
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 622fface484e..4ba55705d147 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -92,6 +92,7 @@ static const VMStateDescription vmstate_hyper = {
>           VMSTATE_UINTTL(env.hgeie, RISCVCPU),
>           VMSTATE_UINTTL(env.hgeip, RISCVCPU),
>           VMSTATE_UINT64(env.htimedelta, RISCVCPU),
> +        VMSTATE_UINT64(env.vstimecmp, RISCVCPU),
>   
>           VMSTATE_UINTTL(env.hvictl, RISCVCPU),
>           VMSTATE_UINT8_ARRAY(env.hviprio, RISCVCPU, 64),
> diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
> index f3fb5eac7b7b..8cce667dfd47 100644
> --- a/target/riscv/time_helper.c
> +++ b/target/riscv/time_helper.c
> @@ -22,6 +22,14 @@
>   #include "time_helper.h"
>   #include "hw/intc/riscv_aclint.h"
>   
> +static void riscv_vstimer_cb(void *opaque)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +    env->vstime_irq = 1;
> +    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
> +}
> +
>   static void riscv_stimer_cb(void *opaque)
>   {
>       RISCVCPU *cpu = opaque;
> @@ -47,10 +55,16 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTimer *timer,
>            * If we're setting an stimecmp value in the "past",
>            * immediately raise the timer interrupt
>            */
> +        if (timer_irq == MIP_VSTIP) {
> +            env->vstime_irq = 1;
> +        }
>           riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
>           return;
>       }
>   
> +    if (timer_irq == MIP_VSTIP) {
> +        env->vstime_irq = 0;
> +    }
>       /* Clear the [V]STIP bit in mip */
>       riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
>   
> @@ -95,4 +109,6 @@ void riscv_timer_init(RISCVCPU *cpu)
>       env->stimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_stimer_cb, cpu);
>       env->stimecmp = 0;
>   
> +    env->vstimer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &riscv_vstimer_cb, cpu);
> +    env->vstimecmp = 0;
>   }


