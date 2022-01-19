Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E0F493972
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 12:24:34 +0100 (CET)
Received: from localhost ([::1]:39822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA94r-0005m2-GD
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 06:24:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nA92J-0003gr-4a
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:21:55 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:36767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nA92D-0002ug-Pv
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 06:21:53 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.136])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2635321019;
 Wed, 19 Jan 2022 11:21:45 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 12:21:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004ee135d2e-cf1a-4778-9b1c-5057be79dce1,
 D7DF39B65A0956CFE557F682C3487E629228C0D9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d9800d4d-fcd4-e37c-1e35-ee9228a3b3ee@kaod.org>
Date: Wed, 19 Jan 2022 12:21:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 06/14] target/ppc: 405: Machine check exception cleanup
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Fabiano Rosas
 <farosas@linux.ibm.com>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-7-farosas@linux.ibm.com> <Yeeqb5EVo3Up0jeU@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <Yeeqb5EVo3Up0jeU@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fe946e32-b012-4d0a-bf3e-1ccba93b1ebf
X-Ovh-Tracer-Id: 17602600621916392230
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudehgddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuh
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 07:06, David Gibson wrote:
> On Tue, Jan 18, 2022 at 03:44:40PM -0300, Fabiano Rosas wrote:
>> powerpc_excp_40x applies only to the 405, so remove HV code and
>> references to BookE.
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>> ---
>>   target/ppc/excp_helper.c | 26 ++------------------------
>>   1 file changed, 2 insertions(+), 24 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index bddea702be..e98d783ecd 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -457,34 +457,12 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>>               cs->halted = 1;
>>               cpu_interrupt_exittb(cs);
>>           }
>> -        if (env->msr_mask & MSR_HVB) {
>> -            /*
>> -             * ISA specifies HV, but can be delivered to guest with HV
>> -             * clear (e.g., see FWNMI in PAPR).
>> -             */
>> -            new_msr |= (target_ulong)MSR_HVB;
>> -        }
>>   
>>           /* machine check exceptions don't have ME set */
>>           new_msr &= ~((target_ulong)1 << MSR_ME);
>>   
>> -        /* XXX: should also have something loaded in DAR / DSISR */
> 
> DAR and DSISR don't apply for 40x, but I wonder if we should be
> loading something into DEAR or ESR for machine checks.

the user manuals only refers to SRR2 and SRR3.

Thanks,

C.

> 
>> -        switch (excp_model) {
>> -        case POWERPC_EXCP_40x:
>> -            srr0 = SPR_40x_SRR2;
>> -            srr1 = SPR_40x_SRR3;
>> -            break;
>> -        case POWERPC_EXCP_BOOKE:
>> -            /* FIXME: choose one or the other based on CPU type */
>> -            srr0 = SPR_BOOKE_MCSRR0;
>> -            srr1 = SPR_BOOKE_MCSRR1;
>> -
>> -            env->spr[SPR_BOOKE_CSRR0] = env->nip;
>> -            env->spr[SPR_BOOKE_CSRR1] = msr;
>> -            break;
>> -        default:
>> -            break;
>> -        }
>> +        srr0 = SPR_40x_SRR2;
>> +        srr1 = SPR_40x_SRR3;
>>           break;
>>       case POWERPC_EXCP_DSI:       /* Data storage exception                   */
>>           trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
> 


