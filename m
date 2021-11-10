Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E711744C2C5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 15:10:22 +0100 (CET)
Received: from localhost ([::1]:50202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkoIv-0008EC-JF
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 09:10:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkoHI-0006pm-Qv; Wed, 10 Nov 2021 09:08:41 -0500
Received: from out28-171.mail.aliyun.com ([115.124.28.171]:59152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkoHF-0000na-1T; Wed, 10 Nov 2021 09:08:40 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07438903|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.026239-0.000512349-0.973249;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.Lqh7jqh_1636553308; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lqh7jqh_1636553308)
 by smtp.aliyun-inc.com(10.147.40.233);
 Wed, 10 Nov 2021 22:08:29 +0800
Subject: Re: [PATCH v2 10/14] target/riscv: Adjust vector address with mask
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-11-zhiwei_liu@c-sky.com>
 <30642177-1f52-08fb-c3ed-77492fdc7cc8@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <ffa9073a-92e7-657b-4b43-67a84bd20fb0@c-sky.com>
Date: Wed, 10 Nov 2021 22:08:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <30642177-1f52-08fb-c3ed-77492fdc7cc8@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.171; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-171.mail.aliyun.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/11/10 下午7:11, Richard Henderson wrote:
> On 11/10/21 8:04 AM, LIU Zhiwei wrote:
>> The mask comes from the pointer masking extension, or the max value
>> corresponding to XLEN bits.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu.c           |  1 +
>>   target/riscv/cpu.h           |  4 ++++
>>   target/riscv/cpu_helper.c    | 40 ++++++++++++++++++++++++++++++++++++
>>   target/riscv/csr.c           | 19 +++++++++++++++++
>>   target/riscv/machine.c       | 10 +++++++++
>>   target/riscv/vector_helper.c | 23 +++++++++++++--------
>>   6 files changed, 88 insertions(+), 9 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 0d2d175fa2..886388f066 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -378,6 +378,7 @@ static void riscv_cpu_reset(DeviceState *dev)
>>   #ifndef CONFIG_USER_ONLY
>>       env->misa_mxl = env->misa_mxl_max;
>>       env->priv = PRV_M;
>> +    riscv_cpu_update_mask(env);
>>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
>>       if (env->misa_mxl > MXL_RV32) {
>>           /*
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 11590a510e..73d7aa9ad7 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -252,6 +252,8 @@ struct CPURISCVState {
>>       target_ulong upmmask;
>>       target_ulong upmbase;
>>   #endif
>> +    target_ulong mask;
>> +    target_ulong base;
>
> I think the name here isn't great.  Without the context of the 
> preceeding elements, the question becomes: mask of what?
>
> Better might be cur_pmmask, cur_pmbase.
>
> Broader than that, you're doing too many things in this patch. The 
> subject is "adjust vector address with mask", but you're also creating 
> new fields and updating them at priv changes, etc.  Too much.
>
>> +void riscv_cpu_update_mask(CPURISCVState *env)
>
> ... update_pmmask?
>
>> +}
>> +
>> +
>> +
>
> Watch the extra spaces.
>
>> @@ -1571,6 +1572,9 @@ static RISCVException 
>> write_mpmmask(CPURISCVState *env, int csrno,
>>       uint64_t mstatus;
>>         env->mpmmask = val;
>> +    if ((env->priv == PRV_M) && (env->mmte & M_PM_ENABLE)) {
>> +        env->mask = val;
>> +    }
>
> This needs to use the function; there are pieces missing here, notably 
> the zero-extend for RV32.

Zero-extend has been done automatically here, as these operations are in 
csr instruction.

In my opinion, it is enough here to check env->priv and pm_enable.

>
> I don't see any updates to the exception entry and exception return 
> paths.

Oops. I forgot this.  We should update at these places. Exception entry 
and exception return will call one same function
to change privilege,  we can update it there.

>
> You'll want to update the translator to use these new fields instead 
> of using the [msu]pmmask / [msu]pmbase fields directly. (Which means 
> that we will have fewer tcg variables, and need not copy the "current" 
> into DisasContext.)
>
Do you mean we can remove the global TCG variables pm_mask[] and pc_base[]?
If then how to transport env->cur_pmmask and env->cur_pmbase to 
DisasContext?

Thanks,
Zhiwei

>
>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>> index 60006b1b1b..0b297f6bc8 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -123,6 +123,11 @@ static inline uint32_t vext_maxsz(uint32_t desc)
>>       return simd_maxsz(desc) << vext_lmul(desc);
>>   }
>>   +static inline target_ulong adjust_addr(CPURISCVState *env, 
>> target_ulong addr)
>> +{
>> +    return (addr & env->mask) | env->base;
>> +}
>
> The code here in vector_helper.c looks fine as a patch by itself, 
> under the subject that you have given.
>
>
> r~

