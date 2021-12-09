Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D05146EB00
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 16:20:44 +0100 (CET)
Received: from localhost ([::1]:52762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvLDu-0004I8-6d
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 10:20:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvLCR-0003OG-TO
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:19:11 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mvLCD-0005di-DK
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 10:19:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E5AEF220FF;
 Thu,  9 Dec 2021 15:18:53 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 9 Dec
 2021 16:18:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001e11786dd-3835-4634-938e-aac64744f158,
 CEC1E8B44BCED238FE59940CA9620AA9C7B98FBC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a2cca719-7d28-65a1-97c4-c91d9a469cbf@kaod.org>
Date: Thu, 9 Dec 2021 16:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: powerpc_excp: Guard ALIGNMENT interrupt with
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211208230650.2125095-1-farosas@linux.ibm.com>
 <c17bf4e0-2c5c-0748-0539-34b441c81644@kaod.org>
 <87o85p6cog.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87o85p6cog.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: eb379bea-e9ad-417e-b6bc-9e67bb976b04
X-Ovh-Tracer-Id: 2187904995269643046
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.803,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard,

On 12/9/21 16:05, Fabiano Rosas wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 12/9/21 00:06, Fabiano Rosas wrote:
>>> We cannot have TCG code in powerpc_excp because the function is called
>>> from kvm-only code via ppc_cpu_do_interrupt:
>>>
>>>    ../target/ppc/excp_helper.c:463:29: error: implicit declaration of
>>>    function ‘cpu_ldl_code’ [-Werror=implicit-function-declaration]
>>>
>>> Fortunately, the Alignment interrupt is not among the ones dispatched
>>> from kvm-only code, so we can keep it out of the disable-tcg build for
>>> now.
>>>
>>> Fixes: 336e91f853 ("target/ppc: Move SPR_DSISR setting to powerpc_excp")
>>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>>>
>>> ---
>>>
>>> Perhaps we could make powerpc_excp TCG only and have a separate
>>> function that only knows the two interrupts that we use with KVM
>>> (Program, Machine check). But for now this fix will do, I think.
>>> ---
>>>    target/ppc/excp_helper.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>>> index 17607adbe4..dcf22440cc 100644
>>> --- a/target/ppc/excp_helper.c
>>> +++ b/target/ppc/excp_helper.c
>>> @@ -453,6 +453,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>>            }
>>>            break;
>>>        }
>>> +#ifdef CONFIG_TCG
>>>        case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
>>>            /*
>>>             * Get rS/rD and rA from faulting opcode.
>>> @@ -464,6 +465,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
>>>                env->spr[SPR_DSISR] |= (insn & 0x03FF0000) >> 16;
>>>            }
>>>            break;
>>> +#endif
>>>        case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
>>>            switch (env->error_code & ~0xF) {
>>>            case POWERPC_EXCP_FP:
>>>
>>
>> Shouldn't we move that code under ppc_cpu_do_unaligned_access ?
> 
> Well, it came from there initially. We could revert 336e91f853 and that
> would fix the issue as well.

What would you prefer ?

Thanks,

C.




