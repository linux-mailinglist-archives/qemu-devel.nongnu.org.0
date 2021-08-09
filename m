Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611933E4316
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:47:19 +0200 (CEST)
Received: from localhost ([::1]:45738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1sM-00010C-FQ
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mD1qd-0007OX-Es; Mon, 09 Aug 2021 05:45:31 -0400
Received: from out28-196.mail.aliyun.com ([115.124.28.196]:53040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mD1qa-000827-5G; Mon, 09 Aug 2021 05:45:31 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07772439|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_social|0.0588535-0.000201351-0.940945;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KxQqX5v_1628502320; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KxQqX5v_1628502320)
 by smtp.aliyun-inc.com(10.147.44.118);
 Mon, 09 Aug 2021 17:45:20 +0800
Subject: Re: [PATCH] target/riscv: Add User CSRs read-only check
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210809070727.9245-1-zhiwei_liu@c-sky.com>
 <CAEUhbmXNPE8cmor-V8Vpza79Vt=hgKsP1OE_zeJupAaaF0UdqA@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <9c3b4476-d640-0b7f-df48-c91ebde2dab6@c-sky.com>
Date: Mon, 9 Aug 2021 17:43:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXNPE8cmor-V8Vpza79Vt=hgKsP1OE_zeJupAaaF0UdqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.196; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-196.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/8/9 下午5:35, Bin Meng wrote:
> On Mon, Aug 9, 2021 at 3:09 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
> nits: please write something in the commit message
OK
>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/csr.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 9a4ed18ac5..ea62d9e653 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1422,11 +1422,11 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>>       RISCVException ret;
>>       target_ulong old_value;
>>       RISCVCPU *cpu = env_archcpu(env);
>> +    int read_only = get_field(csrno, 0xC00) == 3;
>>
>>       /* check privileges and return -1 if check fails */
>>   #if !defined(CONFIG_USER_ONLY)
>>       int effective_priv = env->priv;
>> -    int read_only = get_field(csrno, 0xC00) == 3;
>>
>>       if (riscv_has_ext(env, RVH) &&
>>           env->priv == PRV_S &&
>> @@ -1443,6 +1443,10 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>>           (!env->debugger && (effective_priv < get_field(csrno, 0x300)))) {
>>           return RISCV_EXCP_ILLEGAL_INST;
>>       }
>> +#else
>> +    if (write_mask && read_only) {
> This can be merged by the !CONFIG_USER_ONLY case.

Do you mean

#if !defined(CONFIG_USER_ONLY)
      if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
          return -RISCV_EXCP_ILLEGAL_INST;
}
#else
      if (write_mask && read_only) {
          return -RISCV_EXCP_ILLEGAL_INST;
}

#endif


Thanks,
Zhiwei

>
>> +        return -RISCV_EXCP_ILLEGAL_INST;
>> +    }
>>   #endif
>>
>>       /* ensure the CSR extension is enabled. */
> Regards,
> Bin

