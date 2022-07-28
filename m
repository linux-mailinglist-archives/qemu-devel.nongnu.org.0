Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E635839C8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 09:47:06 +0200 (CEST)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGyEb-0006fJ-6w
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 03:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGy6V-00039F-Jz; Thu, 28 Jul 2022 03:38:43 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:34222 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oGy6S-0006Mu-0J; Thu, 28 Jul 2022 03:38:43 -0400
Received: from [192.168.3.6] (unknown [116.224.155.20])
 by APP-05 (Coremail) with SMTP id zQCowAA3WX7xPOJixsydEw--.58857S2;
 Thu, 28 Jul 2022 15:38:26 +0800 (CST)
Subject: Re: [PATCH v6 3/5] target/riscv: smstateen check for fcsr
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220721153136.377578-1-mchitale@ventanamicro.com>
 <20220721153136.377578-4-mchitale@ventanamicro.com>
 <e819eb9c-fdec-5138-5b94-f8ddd2331f7a@iscas.ac.cn>
 <fb88d0ccf7f6c4204b932d14fa88f952e314e922.camel@ventanamicro.com>
 <edef6a28-6378-59a6-5fa8-4f3b0be76b71@iscas.ac.cn>
 <62e5130693cbdbb32355001469f267f63d0311c0.camel@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <edf4e648-4eb8-2b7a-5b52-c820b0941823@iscas.ac.cn>
Date: Thu, 28 Jul 2022 15:38:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <62e5130693cbdbb32355001469f267f63d0311c0.camel@ventanamicro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAA3WX7xPOJixsydEw--.58857S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww43Ary7Ary8Jw45ur4DJwb_yoW3tryfpr
 18Ga13C3yDJry2yw1aqas8Jrnxtws7GrWkuwnrtw1ktayDtr43tF4ktry7ury8Ja4UXr13
 ZF4jyFZxCr4fAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
 0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JUeRRiUUUUU=
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


在 2022/7/28 下午2:15, Mayuresh Chitale 写道:
> On Mon, 2022-07-25 at 15:23 +0800, Weiwei Li wrote:
>> 在 2022/7/24 下午11:49, Mayuresh Chitale 写道:
>>> On Fri, 2022-07-22 at 09:42 +0800, Weiwei Li wrote:
>>>> 在 2022/7/21 下午11:31, Mayuresh Chitale 写道:
>>>>> If smstateen is implemented and sstateen0.fcsr is clear then
>>>>> the
>>>>> floating point operations must return illegal instruction
>>>>> exception.
>>>>>
>>>>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>>>> ---
>>>>>    target/riscv/csr.c                        | 23 ++++++++++++++
>>>>>    target/riscv/insn_trans/trans_rvf.c.inc   | 38
>>>>> +++++++++++++++++++++--
>>>>>    target/riscv/insn_trans/trans_rvzfh.c.inc |  4 +++
>>>>>    3 files changed, 63 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>>> index ab06b117f9..a597b6cbc7 100644
>>>>> --- a/target/riscv/csr.c
>>>>> +++ b/target/riscv/csr.c
>>>>> @@ -96,6 +96,10 @@ static RISCVException fs(CPURISCVState *env,
>>>>> int
>>>>> csrno)
>>>>>            !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
>>>>>            return RISCV_EXCP_ILLEGAL_INST;
>>>>>        }
>>>>> +
>>>>> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>>>>> +        return smstateen_acc_ok(env, 0, SMSTATEEN0_FCSR);
>>>>> +    }
>>>>>    #endif
>>>>>        return RISCV_EXCP_NONE;
>>>>>    }
>>>>> @@ -1876,6 +1880,9 @@ static RISCVException
>>>>> write_mstateen0(CPURISCVState *env, int csrno,
>>>>>                                          target_ulong new_val)
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>>    
>>>>>        return write_mstateen(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>> @@ -1924,6 +1931,10 @@ static RISCVException
>>>>> write_mstateen0h(CPURISCVState *env, int csrno,
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>>    
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>> +
>>>>>        return write_mstateenh(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>>    
>>>>> @@ -1973,6 +1984,10 @@ static RISCVException
>>>>> write_hstateen0(CPURISCVState *env, int csrno,
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>>    
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>> +
>>>>>        return write_hstateen(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>>    
>>>>> @@ -2024,6 +2039,10 @@ static RISCVException
>>>>> write_hstateen0h(CPURISCVState *env, int csrno,
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>>    
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>> +
>>>>>        return write_hstateenh(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>>    
>>>>> @@ -2083,6 +2102,10 @@ static RISCVException
>>>>> write_sstateen0(CPURISCVState *env, int csrno,
>>>>>    {
>>>>>        uint64_t wr_mask = SMSTATEEN_STATEN |
>>>>> SMSTATEEN0_HSENVCFG;
>>>>>    
>>>>> +    if (!riscv_has_ext(env, RVF)) {
>>>>> +        wr_mask |= SMSTATEEN0_FCSR;
>>>>> +    }
>>>>> +
>>>>>        return write_sstateen(env, csrno, wr_mask, new_val);
>>>>>    }
>>>>>    
>>>>> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc
>>>>> b/target/riscv/insn_trans/trans_rvf.c.inc
>>>>> index a1d3eb52ad..c43c48336b 100644
>>>>> --- a/target/riscv/insn_trans/trans_rvf.c.inc
>>>>> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
>>>>> @@ -24,9 +24,43 @@
>>>>>                return false; \
>>>>>    } while (0)
>>>>>    
>>>>> +#ifndef CONFIG_USER_ONLY
>>>>> +#define SMSTATEEN_CHECK(ctx) do {\
>>>>> +    CPUState *cpu = ctx->cs; \
>>>>> +    CPURISCVState *env = cpu->env_ptr; \
>>>>> +    if (ctx->cfg_ptr->ext_smstateen && \
>>>>> +        (env->priv < PRV_M)) { \
>>>>> +        uint64_t stateen = env->mstateen[0]; \
>>>>> +        uint64_t hstateen = env->hstateen[0]; \
>>>>> +        uint64_t sstateen = env->sstateen[0]; \
>>>>> +        if (!(stateen & SMSTATEEN_STATEN)) {\
>>>>> +            hstateen = 0; \
>>>>> +            sstateen = 0; \
>>>>> +        } \
>>>>> +        if (ctx->virt_enabled) { \
>>>>> +            stateen &= hstateen; \
>>>>> +            if (!(hstateen & SMSTATEEN_STATEN)) {\
>>>>> +                sstateen = 0; \
>>>>> +            } \
>>>>> +        } \
>>>>> +        if (env->priv == PRV_U && has_ext(ctx, RVS))
>>>>> {\eventually
>>>>> meaning
>>>>> +            stateen &= sstateen; \
>>>>> +        } \
>>>>> +        if (!(stateen & SMSTATEEN0_FCSR)) { \
>>>>> +            return false; \
>>>>> +        } \
>>>>> +    } \
>>>>> +} while (0)
>>>> It's better to add a space before '\'.
>>> ok. will modify in the next version.
>>>>> +#else
>>>>> +#define SMSTATEEN_CHECK(ctx)
>>>>> +#endif
>>>>> +
>>>>>    #define REQUIRE_ZFINX_OR_F(ctx) do {\
>>>>> -    if (!ctx->cfg_ptr->ext_zfinx) { \
>>>>> -        REQUIRE_EXT(ctx, RVF); \
>>>>> +    if (!has_ext(ctx, RVF)) { \
>>>>> +        SMSTATEEN_CHECK(ctx); \
>>>>> +        if (!ctx->cfg_ptr->ext_zfinx) { \
>>>>> +            return false; \
>>>>> +        } \
>>>>>        } \
>>>>>    } while (0)
>>>> SMSTATEEN_CHECK is for CSR. and REQUIRE_ZFINX_OR_F is for
>>>> Extension.
>>>> I think It's better to separate them. By the way, if we want the
>>>> smallest modification
>>>> for current code, adding it to REQUIRE_FPU seems better.
>>> Actually REQUIRE_FPU is checking for mstatus.fs but as per
>>> smstateen
>>> spec we need to check for misa.f which is done in
>>> REQUIRE_ZFINX_OR_F.
>> OK. It's acceptable to me  even though I prefer separating them.
>>
>> However, I find another question in SMSTATEEN_CHECK: when access is
>> disallowed by Xstateen.FCSR,
>>
>> it's always return false  which will trigger illegal instruction
>> exception finally.
>>
>> However, this exception is triggered by accessing fcsr CSR which may
>> trigger illegal instruction trap and virtual
>> instruction trap in different situation.
>>
>> "For convenience, when the stateen CSRs are implemented and misa.F =
>> 0, then if bit 1 of a
>> controlling stateen0 CSR is zero, all floating-point instructions
>> cause an illegal instruction trap (or virtual
>> instruction trap, if relevant), as though they all access fcsr,
>> regardless of whether they really do."
>>
>> And  stateen.fcsr is only work when zfinx is enabled, so  it's better
>> to SMSTATEEN_CHECK(ctx) after check for
>>
>> "!ctx->cfg_ptr->ext_zfinx"
> Actually the spec refers only to misa.F and not zfinx and regarding the
> fcsr its :
> "as though they all access fcsr, regardless of whether they really do"

Yeah, they are triggered by accessing fcsr. So they should take the same 
check as accessing fcsr here.

In above predicate fs for fcsr, if misa.F is zero and zfinx is not 
supported,illegal instruction fault is triggered.

Otherwise, stateen related check is done when misa.F is zero and may 
trigger illegal/virtual instruction fault.

both of this two cases are different in above check.

I also sent related questions in 
https://github.com/riscv/riscv-state-enable/issues/9.

Any comments are welcome.

Regards,

Weiwei Li

>
>> Regards,
>> Weiwei Li
>>>> Regards,
>>>> Weiwei Li
>>>>
>>>>>    
>>>>> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
>>>>> b/target/riscv/insn_trans/trans_rvzfh.c.inc
>>>>> index 5d07150cd0..b165ea9d58 100644
>>>>> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
>>>>> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
>>>>> @@ -17,24 +17,28 @@
>>>>>     */
>>>>>    
>>>>>    #define REQUIRE_ZFH(ctx) do { \
>>>>> +    SMSTATEEN_CHECK(ctx); \
>>>>>        if (!ctx->cfg_ptr->ext_zfh) {      \
>>>>>            return false;         \
>>>>>        }                         \
>>>>>    } while (0)
>>>>>    
>>>>>    #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
>>>>> +    SMSTATEEN_CHECK(ctx); \
>>>>>        if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) {
>>>>> \
>>>>>            return false;                  \
>>>>>        }                                  \
>>>>>    } while (0)
>>>>>    
>>>>>    #define REQUIRE_ZFH_OR_ZFHMIN(ctx) do {       \
>>>>> +    SMSTATEEN_CHECK(ctx); \
>>>>>        if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin))
>>>>> { \
>>>>>            return false;                         \
>>>>>        }                                         \
>>>>>    } while (0)
>>>>>    
>>>>>    #define REQUIRE_ZFH_OR_ZFHMIN_OR_ZHINX_OR_ZHINXMIN(ctx) do {
>>>>> \
>>>>> +    SMSTATEEN_CHECK(ctx); \
>>>>>        if (!(ctx->cfg_ptr->ext_zfh || ctx->cfg_ptr->ext_zfhmin
>>>>> ||          \
>>>>>              ctx->cfg_ptr->ext_zhinx || ctx->cfg_ptr-
>>>>>> ext_zhinxmin))
>>>>> {     \
>>>>>            return
>>>>> false;                                        \


