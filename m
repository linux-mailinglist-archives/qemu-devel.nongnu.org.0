Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E149AE44
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 09:44:46 +0100 (CET)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCHRV-0006CB-Q3
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 03:44:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCH2A-00044v-8M
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:18:37 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:53341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCH27-0001zi-01
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 03:18:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 563D821347;
 Tue, 25 Jan 2022 08:18:20 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 09:18:19 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00629115435-92b0-4363-abef-b0d9413ec246,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7e2e4d56-4cdf-4f9f-65e4-359453ba20fb@kaod.org>
Date: Tue, 25 Jan 2022 09:18:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 08/14] target/ppc: 405: System call exception cleanup
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, Fabiano Rosas
 <farosas@linux.ibm.com>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
 <20220118184448.852996-9-farosas@linux.ibm.com> <YeerEWyGu5j+Akeb@yekko>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YeerEWyGu5j+Akeb@yekko>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f4702093-773e-4e06-9498-c000d1049300
X-Ovh-Tracer-Id: 12847643840812452646
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdekgdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggrlhgrthhonhesvghikhdrsghmvgdrhhhu
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/22 07:09, David Gibson wrote:
> On Tue, Jan 18, 2022 at 03:44:42PM -0300, Fabiano Rosas wrote:
>> There's no sc 1.
> 
> No... but what exactly should and will happen if you attempt to
> execute an "sc 1" on 40x.  Will it be treated as an "sc 0", or will it
> cause a 0x700?  If it's a 0x700, better double check that that is
> generated at translation time, if you're removing the check on level
> here.

A Program Interrupt with the illegal instruction error code should be
generated at translation time but it is not the case today. It never
was correctly implemented AFAICT :

   /* Top bit of opc2 corresponds with low bit of LEV, so use two handlers */
   GEN_HANDLER(sc, 0x11, 0x11, 0xFF, 0x03FFF01D, PPC_FLOW),
   GEN_HANDLER(sc, 0x11, 0x01, 0xFF, 0x03FFF01D, PPC_FLOW),

We would need a simple 'sc' instruction for the PPC405 and other
processors. Let's add that to the TODO list.

Thanks,

C.


> 
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>   target/ppc/excp_helper.c | 21 ++-------------------
>>   1 file changed, 2 insertions(+), 19 deletions(-)
>>
>> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
>> index 8fae8aa0be..9a6f8365d6 100644
>> --- a/target/ppc/excp_helper.c
>> +++ b/target/ppc/excp_helper.c
>> @@ -398,7 +398,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>>       CPUPPCState *env = &cpu->env;
>>       int excp_model = env->excp_model;
>>       target_ulong msr, new_msr, vector;
>> -    int srr0, srr1, lev = -1;
>> +    int srr0, srr1;
>>   
>>       if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
>>           cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>> @@ -521,30 +521,13 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
>>           }
>>           break;
>>       case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
>> -        lev = env->error_code;
>> -
>> -        if ((lev == 1) && cpu->vhyp) {
>> -            dump_hcall(env);
>> -        } else {
>> -            dump_syscall(env);
>> -        }
>> +        dump_syscall(env);
>>   
>>           /*
>>            * We need to correct the NIP which in this case is supposed
>>            * to point to the next instruction
>>            */
>>           env->nip += 4;
>> -
>> -        /* "PAPR mode" built-in hypercall emulation */
>> -        if ((lev == 1) && cpu->vhyp) {
>> -            PPCVirtualHypervisorClass *vhc =
>> -                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
>> -            vhc->hypercall(cpu->vhyp, cpu);
>> -            return;
>> -        }
>> -        if (lev == 1) {
>> -            new_msr |= (target_ulong)MSR_HVB;
>> -        }
>>           break;
>>       case POWERPC_EXCP_FIT:       /* Fixed-interval timer interrupt           */
>>           trace_ppc_excp_print("FIT");
> 


