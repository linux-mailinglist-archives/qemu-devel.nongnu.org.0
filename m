Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29C433B5F7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:58:04 +0100 (CET)
Received: from localhost ([::1]:40648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnjP-00074i-Ta
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lLngy-0004S5-S3
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:55:32 -0400
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:52956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lLngw-0003up-El
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:55:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.235])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 79D6D27203E;
 Mon, 15 Mar 2021 14:55:24 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 15 Mar
 2021 14:55:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005eaeb4383-662e-4e58-afde-820309e440f4,
 6ECECE93D947A1E75FB970C6684F7B2999F5CB5C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 14/16] hw/ppc: Use hreg_store_msr for msr updates
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20210314175906.1733746-1-richard.henderson@linaro.org>
 <20210314175906.1733746-15-richard.henderson@linaro.org>
 <ea6b23c2-21db-a512-87b5-be5351ff0a74@kaod.org>
 <f963e548-d2c0-d0a3-d8ed-bccc3c1d30e7@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <36cd9b32-4946-bd51-ffc0-d97c81e20257@kaod.org>
Date: Mon, 15 Mar 2021 14:55:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f963e548-d2c0-d0a3-d8ed-bccc3c1d30e7@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bd411f54-9368-42d8-a081-55272554fe1d
X-Ovh-Tracer-Id: 7443324288057969446
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ivan@vmfacility.fr, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 2:47 PM, Richard Henderson wrote:
> On 3/15/21 4:23 AM, Cédric Le Goater wrote:
>> On 3/14/21 6:59 PM, Richard Henderson wrote:
>>> Only one of the three places in hw/ppc that modify msr updated
>>> hflags.  Even in that case, use the official interface instead
>>> of a direct call to hreg_compute_hflags.
>>
>> ppc_store_msr() is the interface to use.
>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>> Cc: Cédric Le Goater <clg@kaod.org>
>>> Cc: Greg Kurz <groug@kaod.org>
>>> ---
>>>   hw/ppc/pnv_core.c    | 3 ++-
>>>   hw/ppc/spapr_hcall.c | 3 +--
>>>   hw/ppc/spapr_rtas.c  | 3 ++-
>>>   3 files changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/ppc/pnv_core.c b/hw/ppc/pnv_core.c
>>> index bd2bf2e044..31f041b9c7 100644
>>> --- a/hw/ppc/pnv_core.c
>>> +++ b/hw/ppc/pnv_core.c
>>> @@ -29,6 +29,7 @@
>>>   #include "hw/ppc/pnv_xscom.h"
>>>   #include "hw/ppc/xics.h"
>>>   #include "hw/qdev-properties.h"
>>> +#include "helper_regs.h"
>>>     static const char *pnv_core_cpu_typename(PnvCore *pc)
>>>   {
>>> @@ -54,7 +55,7 @@ static void pnv_core_cpu_reset(PnvCore *pc, PowerPCCPU *cpu)
>>>        */
>>>       env->gpr[3] = PNV_FDT_ADDR;
>>>       env->nip = 0x10;
>>> -    env->msr |= MSR_HVB; /* Hypervisor mode */
>>> +    hreg_store_msr(env, env->msr | MSR_HVB, true); /* Hypervisor mode */
>>
>>
>> This is going to have the opposite effect of not setting the HV bit in the
>> PowerNV machine. See the comment in powerpc_set_excp_state().
>>
>> May be commit 1c953ba57ada ("ppc: Fix hreg_store_msr() so that non-HV
>> mode cannot alter MSR:HV") needs a fix first.
> 
> Hmm.  I mis-read the code and assumed "allow_hv" allowed hv to be changed. 
> There must be some kind of quirkyness here that I don't understand.
This part was added ~14 years ago by commit a4f30719a8cd ("PowerPC hypervisor 
mode is not fundamentally available only for PowerPC 64. Remove TARGET_PPC64 
dependency and add code provision to be able   to define a fake 32 bits CPU 
with hypervisor feature support.")

I am afraid we kept adding stuff on top of it.

> I'll just have these reset functions use hreg_recompute_hflags directly.

Yes. That should be ok.

Thanks,

C. 

