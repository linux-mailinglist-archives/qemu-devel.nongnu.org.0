Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273D650E3AD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:50:50 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj037-0002eo-8V
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nj00R-0000UX-UL
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:48:05 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nj00O-0007rf-N7
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:48:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 89814222D4;
 Mon, 25 Apr 2022 14:47:56 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 25 Apr
 2022 16:47:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0020cdbf3fe-1681-4987-9534-f21d4d513eba,
 D8C624B5647D334DB4E4AD5D528E7EDA600569EE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2b50a917-c3b3-5c35-8fdd-51eac21acc1c@kaod.org>
Date: Mon, 25 Apr 2022 16:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] target/ppc: Fix BookE debug interrupt generation
Content-Language: en-US
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>, Bin
 Meng <bmeng.cn@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220421011729.1148727-1-bmeng.cn@gmail.com>
 <4111fd84-5cb5-3837-7fee-243f5623ed7b@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4111fd84-5cb5-3837-7fee-243f5623ed7b@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5ebb9335-6d5d-4a13-ada7-be95ea8b38e6
X-Ovh-Tracer-Id: 13014277024431639343
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddugdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudfhveehgfevtddtfffftdeivefhjedufffgjefgffejieekteeuueehvdffjeejnecuffhomhgrihhnpehngihprdgtohhmpdhoiihlrggsshdrohhrghdpvghlughorhgrughordhorhhgrdgsrhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 16:16, Lucas Mateus Martins Araujo e Castro wrote:
> 
> On 20/04/2022 22:17, Bin Meng wrote:
>> From: Bin Meng<bin.meng@windriver.com>
>>
>> Per E500 core reference manual [1], chapter 8.4.4 "Branch Taken Debug
>> Event" and chapter 8.4.5 "Instruction Complete Debug Event":
>>
>>    "A branch taken debug event occurs if both MSR[DE] and DBCR0[BRT]
>>    are set ... Branch taken debug events are not recognized if MSR[DE]
>>    is cleared when the branch instruction executes."
>>
>>    "An instruction complete debug event occurs when any instruction
>>    completes execution so long as MSR[DE] and DBCR0[ICMP] are both
>>    set ... Instruction complete debug events are not recognized if
>>    MSR[DE] is cleared at the time of the instruction execution."
>>
>> Current codes do not check MSR.DE bit before setting HFLAGS_SE and
>> HFLAGS_BE flag, which would cause the immediate debug interrupt to
>> be generated, e.g.: when DBCR0.ICMP bit is set by guest software
>> and MSR.DE is not set.
>>
>> [1]https://www.nxp.com/docs/en/reference-manual/E500CORERM.pdf
>>
>> Signed-off-by: Bin Meng<bin.meng@windriver.com>
>> ---
>>
>> Changes in v2:
>> - update commit message to use E500CORERM instead of PowerISA 2.07
>>
>>   target/ppc/helper_regs.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
>> index 9a691d6833..77bc57415c 100644
>> --- a/target/ppc/helper_regs.c
>> +++ b/target/ppc/helper_regs.c
>> @@ -63,10 +63,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
>>
>>       if (ppc_flags & POWERPC_FLAG_DE) {
>>           target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
>> -        if (dbcr0 & DBCR0_ICMP) {
>> +        if ((dbcr0 & DBCR0_ICMP) && msr_de) {
> There was a discussion some time ago that was better to avoid hidden uses of *env, so it may be better to change msr_de to ((env->msr >> MSR_DE) & 1) or to (env->msr & BIT_ULL(MSR_DE))

I think the "target/ppc: Remove hidden usages of *env" patchset :

   https://patchwork.ozlabs.org/project/qemu-ppc/list/?series=296440

will take some time to merge and there will certainly be followups.

This patch can go first.

Thanks,

C.


>>               hflags |= 1 << HFLAGS_SE;
>>           }
>> -        if (dbcr0 & DBCR0_BRT) {
>> +        if ((dbcr0 & DBCR0_BRT) && msr_de) {
> Here as well
>>               hflags |= 1 << HFLAGS_BE;
>>           }
>>       } else {
>> --
>> 2.25.1
>>
>>
> Apart from that,
> Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
> -- 
> Lucas Mateus M. Araujo e Castro
> Instituto de Pesquisas ELDORADO <https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
> Departamento Computação Embarcada
> Analista de Software Trainee
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


