Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 470234ADEEC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:08:32 +0100 (CET)
Received: from localhost ([::1]:49636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTyg-0007ai-Sh
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:08:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nHSqU-0003xz-3c; Tue, 08 Feb 2022 10:55:58 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:35691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nHSqM-0005aI-Pa; Tue, 08 Feb 2022 10:55:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.220])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CD4A5205DF;
 Tue,  8 Feb 2022 15:55:43 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Feb
 2022 16:55:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001e2b7f5e6-65aa-445c-bd47-a99714f0eb57,
 A9EFA83ADB8598AD7F1759910761E0E5CF6DF637) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.223.183
Message-ID: <d590f7e2-723e-b6a9-6125-5ab23e2efc8c@kaod.org>
Date: Tue, 8 Feb 2022 16:55:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] ppc: Add QOM interface for machine check injection
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>
References: <20211013214042.618918-1-clg@kaod.org>
 <20211013214042.618918-2-clg@kaod.org>
 <1634261821.ztn2f48uj7.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1634261821.ztn2f48uj7.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f19c8f2c-e8d8-4f7d-910c-019e1ed4abbf
X-Ovh-Tracer-Id: 10556156055701719913
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheejgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ Adding David who I think is the HMP maintainer and Fabiano who has
   been rewriting a lot of the PPC exception model ]

On 10/15/21 04:05, Nicholas Piggin wrote:
> Excerpts from Cédric Le Goater's message of October 14, 2021 7:40 am:
>> From: Nicholas Piggin <npiggin@gmail.com>
>>
>> This implements a machine check injection framework and defines a
>> 'mce' monitor command for ppc.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> [ clg: - moved definition under "hw/ppc/mce.h"
>>         - renamed to PPCMceInjection
>>         - simplified injection call in hmp_mce
>>         - QMP support ]
> 
> Nice, thanks for doing this.
>
>> Message-Id: <20200325144147.221875-4-npiggin@gmail.com>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   qapi/misc-target.json | 26 ++++++++++++++++++++
>>   include/hw/ppc/mce.h  | 31 ++++++++++++++++++++++++
>>   target/ppc/monitor.c  | 56 +++++++++++++++++++++++++++++++++++++++++++
>>   hmp-commands.hx       | 20 +++++++++++++++-
>>   4 files changed, 132 insertions(+), 1 deletion(-)
>>   create mode 100644 include/hw/ppc/mce.h
>>
>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>> index 594fbd1577fa..b1456901893c 100644
>> --- a/qapi/misc-target.json
>> +++ b/qapi/misc-target.json
>> @@ -394,3 +394,29 @@
>>   #
>>   ##
>>   { 'command': 'query-sgx-capabilities', 'returns': 'SGXInfo', 'if': 'TARGET_I386' }
>> +
>> +##
>> +# @mce:
>> +#
>> +# This command injects a machine check exception
>> +#
>> +# @cpu-index: CPU number on which to inject the machine check exception
>> +#
>> +# @srr1-mask : possible reasons for the exception
> 
> I would say this is implementation specific mask of bits that are
> inserted in the SRR1 register at interrupt-time (except RI - see
> @recovered) which indicate the cause of the exception.
> 
> These are not architected and may change from CPU to CPU. I.e., the
> mask itself may change, not just the reasons.
> 
>> +#
>> +# @dsisr : more reasons
> 
> This is value inserted into DSISR register, and is typically used
> to indicate the cause of a "d-side" MCE. If this is 0 then both
> DSISR and DAR registers are left unchanged.
> 
>> +#
>> +# @dar : effective address of next instruction
> 
> This is the value inserted into the DAR register (if @dsisr was
> non-zero). It is implementation specific but is typically used
> to indicate the effective address of the target address involved
> in the mce for d-side exceptions.
> 
> I wonder if we should put an @asdr parameter there too -- I'm not
> acutally sure if P10 implements that (getting clarification) but
> the architecture at least allows it.
> 
> What's the go for updating this API? Can we just break it, or do
> we need to version it or call a different name like mce2 etc if
> we want to change it?

I am not sure what the answer would be. May be David can tell ?

Thanks,

C.


