Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F252495726
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 01:02:10 +0100 (CET)
Received: from localhost ([::1]:60352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAhNY-0002VA-VU
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 19:02:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAfyq-0004jB-1N; Thu, 20 Jan 2022 17:32:32 -0500
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:60935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAfyk-0004iB-UQ; Thu, 20 Jan 2022 17:32:31 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07449116|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.306946-0.00157049-0.691484;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=12; RT=12; SR=0; TI=SMTPD_---.Mg64u26_1642717934; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mg64u26_1642717934)
 by smtp.aliyun-inc.com(10.147.42.135);
 Fri, 21 Jan 2022 06:32:15 +0800
Subject: Re: [PATCH v5 1/5] target/riscv: Ignore reserved bits in PTE for RV64
To: Guo Ren <guoren@kernel.org>, Alistair Francis <alistair23@gmail.com>,
 Anup Patel <anup@brainfault.org>
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-2-liweiwei@iscas.ac.cn>
 <CAAhSdy3zjeW-WkbiicTJfurQkhts4m9XwvmoS+Zr1XVMzhy+3w@mail.gmail.com>
 <CAKmqyKNajL8kJL4HExN8CDCYwrVcUx4dcnn77wY5zCZu9M6SGg@mail.gmail.com>
 <CAJF2gTRV55B+9AaFHDXW9R7cvEXO+R3dFs6RVRGnkKwZX5fCLg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <4f22be6c-98ae-34fa-f334-8778ef703964@c-sky.com>
Date: Fri, 21 Jan 2022 06:28:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJF2gTRV55B+9AaFHDXW9R7cvEXO+R3dFs6RVRGnkKwZX5fCLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.74; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-74.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Guo Ren <ren_guo@c-sky.com>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2022/1/20 下午9:47, Guo Ren wrote:
> Hi Alistair and Anup,
>
> On Tue, Jan 18, 2022 at 12:56 PM Alistair Francis <alistair23@gmail.com> wrote:
>> On Tue, Jan 18, 2022 at 1:31 PM Anup Patel <anup@brainfault.org> wrote:
>>> On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>> From: Guo Ren <ren_guo@c-sky.com>
>>>>
>>>> Highest bits of PTE has been used for svpbmt, ref: [1], [2], so we
>>>> need to ignore them. They cannot be a part of ppn.
>>>>
>>>> 1: The RISC-V Instruction Set Manual, Volume II: Privileged Architecture
>>>>     4.4 Sv39: Page-Based 39-bit Virtual-Memory System
>>>>     4.5 Sv48: Page-Based 48-bit Virtual-Memory System
>>>>
>>>> 2: https://github.com/riscv/virtual-memory/blob/main/specs/663-Svpbmt-diff.pdf
>>>>
>>>> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
>>>> Tested-by: Bin Meng <bmeng.cn@gmail.com>
>>>> Reviewed-by: Liu Zhiwei <zhiwei_liu@c-sky.com>
>>>> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>>>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>>>> ---
>>>>   target/riscv/cpu_bits.h   | 7 +++++++
>>>>   target/riscv/cpu_helper.c | 2 +-
>>>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
>>>> index 5a6d49aa64..282cd8eecd 100644
>>>> --- a/target/riscv/cpu_bits.h
>>>> +++ b/target/riscv/cpu_bits.h
>>>> @@ -490,6 +490,13 @@ typedef enum {
>>>>   /* Page table PPN shift amount */
>>>>   #define PTE_PPN_SHIFT       10
>>>>
>>>> +/* Page table PPN mask */
>>>> +#if defined(TARGET_RISCV32)
>>>> +#define PTE_PPN_MASK        0xffffffffUL
>>>> +#elif defined(TARGET_RISCV64)
>>>> +#define PTE_PPN_MASK        0x3fffffffffffffULL
>>>> +#endif
>>>> +
>>> Going forward we should avoid using target specific "#if"
>>> so that we can use the same qemu-system-riscv64 for both
>>> RV32 and RV64.
>>>
>>>>   /* Leaf page shift amount */
>>>>   #define PGSHIFT             12
>>>>
>>>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>>>> index 434a83e66a..26608ddf1c 100644
>>>> --- a/target/riscv/cpu_helper.c
>>>> +++ b/target/riscv/cpu_helper.c
>>>> @@ -619,7 +619,7 @@ restart:
>>>>               return TRANSLATE_FAIL;
>>>>           }
>>>>
>>>> -        hwaddr ppn = pte >> PTE_PPN_SHIFT;
>>>> +        hwaddr ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>>> Rather than using "#if", please use "xlen" comparison to extract
>>> PPN correctly from PTE.
>> This will need to be dynamic based on get_xl()
>>
>> It does look like we should check the existence of the extensions though:
>>
>> "Bit 63 is reserved for use by the Svnapot extension in Chapter 5. If
>> Svnapot is not implemented, bit 63 remains reserved and must be zeroed
>> by software for forward compatibility, or else a page-fault exception
>> is raised. Bits 62–61 are reserved for use by the Svpbmt extension in
>> Chapter 6. If Svpbmt is not implemented, bits 62–61 remain reserved
>> and must be zeroed by software for forward compatibility, or else a
>> page-fault exception is raised."
> How about:
>
> +       RISCVCPU *cpu = env_archcpu(env);
> +       hwaddr ppn;
> +
> +       if (get_field(env->mstatus, MSTATUS64_SXL) == MXL_RV32) {
Use riscv_cpu_mxl currently. Or define a new function riscv_cpu_sxl in cpu.h
> +               ppn = pte >> PTE_PPN_SHIFT;
> +       } else if (cpu->cfg.ext_svpbmt || cpu->cfg.ext_svnapot) {
> +               ppn = (pte & PTE_PPN_MASK) >> PTE_PPN_SHIFT;
> +       } else {
> +               ppn = pte >> PTE_PPN_SHIFT;
> +               if ((pte & ~PTE_PPN_MASK) >> PTE_PPN_SHIFT)
Just if (pte & ~PTE_PPN_MASK)
> +                       return TRANSLATE_FAIL;
> +       }

Otherwise looks good to me.

Thanks,
Zhiwei

>> Alistair
>>
>>> Regards,
>>> Anup
>>>
>>>>           if (!(pte & PTE_V)) {
>>>>               /* Invalid PTE */
>>>> --
>>>> 2.17.1
>>>>
>

